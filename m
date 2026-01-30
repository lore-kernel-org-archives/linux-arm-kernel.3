Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF80E6BF0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpHEzX5oSY4/kv7rFwjFdQL4xQBp0DQ4cWf5uXb62A4=; b=mR+aXBdp3qu/lKgmtIbNRPM0lY
	a3UPpmmmDkUqVVW0RvvmHBv9YZfCSHa3uFB1255sCZCkGqpQlgxldVMEyKKnUJeo6eDy6shP8pnsN
	DDAOFDUzD9/aSVoCl/zHeEHHIktZ9xG3pxhPVv/rHvySwBEsaTSBaSZ9Q0RAixtD3j0nMAfH0dJWU
	UYgKyGhs9qUF/xlD9BPCWaY1ugSEWDPyQ6lSWXbHmfCgywBFfG9dFc09S+lOI0Jh0pr/XykOJDQzP
	RwmE6rRUVzAPDQtWVqshE0isD1+5Kiu2vNxB1YNJaXhwnR/nLDMA9bzF7p7YA4x5sGQ706APhpBgJ
	7wbQgTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloWy-00000001Wuy-167j;
	Fri, 30 Jan 2026 13:27:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloWv-00000001Wu4-0NeK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 13:27:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A0B4153B;
	Fri, 30 Jan 2026 05:27:10 -0800 (PST)
Received: from [10.57.51.191] (unknown [10.57.51.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6335F3F73F;
	Fri, 30 Jan 2026 05:27:10 -0800 (PST)
Message-ID: <13d22231-d84a-4993-9a69-e3922e45b500@arm.com>
Date: Fri, 30 Jan 2026 14:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/14] entry: Rework syscall_exit_to_user_mode_work()
 for arch reuse
To: Thomas Gleixner <tglx@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
 catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
 peterz@infradead.org, luto@kernel.org, shuah@kernel.org, kees@kernel.org,
 wad@chromium.org, deller@gmx.de, akpm@linux-foundation.org,
 charlie@rivosinc.com, mark.rutland@arm.com, anshuman.khandual@arm.com,
 song@kernel.org, ryan.roberts@arm.com, thuth@redhat.com,
 ada.coupriediaz@arm.com, broonie@kernel.org, pengcan@kylinos.cn,
 liqiang01@kylinos.cn, kmal@cock.li, dvyukov@google.com,
 reddybalavignesh9979@gmail.com, richard.weiyang@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
 <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
 <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com> <87o6mbl82j.ffs@tglx>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <87o6mbl82j.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_052721_163913_70F37759 
X-CRM114-Status: GOOD (  12.03  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 30/01/2026 11:16, Thomas Gleixner wrote:
> On Thu, Jan 29 2026 at 17:00, Kevin Brodsky wrote:
>> On 29/01/2026 14:11, Jinjie Ruan wrote:
>>>>> - * Calling convention is the same as for syscall_exit_to_user_mode() and it
>>>>> - * returns with all work handled and interrupts disabled. The caller must
>>>>> - * invoke exit_to_user_mode() before actually switching to user mode to
>>>>> - * make the final state transitions. Interrupts must stay disabled between
>>>>> - * return from this function and the invocation of exit_to_user_mode().
>>>>> + * Calling convention is the same as for syscall_exit_to_user_mode(). The
>>>>> + * caller must invoke local_irq_disable(), __exit_to_user_mode_prepare() and
>>>> Shouldn't it be syscall_exit_to_user_mode_prepare() rather than
>>>> __exit_to_user_mode_prepare()? The former has extra calls (e.g. rseq).
>>> Perhaps we can just delete these comments — at present only generic
>>> entry and arm64 use it, and nowhere else needs it; after the refactoring
>>> the comments now seem rather unclear.
>> Agreed, the comments are essentially describing what each function
>> calls; considering how short they are, directly reading the code is
>> probably easier.
> No. Please keep them. There is more information in them than just the
> pure 'what's' called.

That is true before this patch, where it made sense to highlight that
exit_to_user_mode() must still be called after this function (without
re-enabling interrupts). With this patch there is however much more that
this function is lacking, and it feels very likely that comments will go
out of sync with exactly what syscall_exit_to_user_mode() calls.

I suppose we could simply point the reader to
syscall_exit_to_user_mode() to find out what else is needed, and keep
the comment about the calling convention being the same.

- Kevin

