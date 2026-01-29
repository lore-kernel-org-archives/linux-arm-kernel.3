Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C30D6B082
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iewnu104/07mAmDAewQ1rz/4TXmCH+TDXHEFldwNh/I=; b=Y3ckdVGyCZoLrIdLUzNrtaruYe
	HwKe+QL6NK8kpxJ6rUiBgljHYRvjgy8GOZfvFGa54OJ0qSQJKf8gm66NI7WZnSMKg4DP5EWjp/InC
	jsXD6Z4Si5WujpAVYRuH/cz8vDqZfMdYb/SWem82/mvcHlALfYLLkLNu+4gfxVvwIqwuVU2Oyas+o
	S0azkWmeZKYYfHsgQ08oizgpbbi4LTJnqHj0TvpbXZTdRAx40GvmEkFOr8iO+3Wtl2qBYOmoJxRQ8
	9D0RKh4oGlVFKQkmYvPXWNRHmWQMktGlCu3GNUacJC7xqCx3aHykA9pBxbqoD6ruWW9iAA6GHZ4Vp
	ToA0OBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlURd-00000000JHd-01Qz;
	Thu, 29 Jan 2026 16:00:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlURU-00000000JCy-2i0d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:00:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B63F8153B;
	Thu, 29 Jan 2026 08:00:16 -0800 (PST)
Received: from [10.57.53.17] (unknown [10.57.53.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A38413F632;
	Thu, 29 Jan 2026 08:00:17 -0800 (PST)
Message-ID: <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com>
Date: Thu, 29 Jan 2026 17:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/14] entry: Rework syscall_exit_to_user_mode_work()
 for arch reuse
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, akpm@linux-foundation.org, charlie@rivosinc.com,
 mark.rutland@arm.com, anshuman.khandual@arm.com, song@kernel.org,
 ryan.roberts@arm.com, thuth@redhat.com, ada.coupriediaz@arm.com,
 broonie@kernel.org, pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
 <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_080026_740586_2CF69C2B 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

On 29/01/2026 14:11, Jinjie Ruan wrote:
>>> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
>>> index e4a8287af822..c4fea642d931 100644
>>> --- a/include/linux/entry-common.h
>>> +++ b/include/linux/entry-common.h
>>> @@ -125,14 +125,14 @@ void syscall_exit_work(struct pt_regs *regs, unsigned long work);
>>>   * syscall_exit_to_user_mode_work - Handle work before returning to user mode
>>>   * @regs:	Pointer to currents pt_regs
>>>   *
>>> - * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
>>> + * Same as step 1 of syscall_exit_to_user_mode() but without calling
>>> + * local_irq_disable(), syscall_exit_to_user_mode_prepare() and
>>>   * exit_to_user_mode() to perform the final transition to user mode.
>>>   *
>>> - * Calling convention is the same as for syscall_exit_to_user_mode() and it
>>> - * returns with all work handled and interrupts disabled. The caller must
>>> - * invoke exit_to_user_mode() before actually switching to user mode to
>>> - * make the final state transitions. Interrupts must stay disabled between
>>> - * return from this function and the invocation of exit_to_user_mode().
>>> + * Calling convention is the same as for syscall_exit_to_user_mode(). The
>>> + * caller must invoke local_irq_disable(), __exit_to_user_mode_prepare() and
>> Shouldn't it be syscall_exit_to_user_mode_prepare() rather than
>> __exit_to_user_mode_prepare()? The former has extra calls (e.g. rseq).
> Perhaps we can just delete these comments — at present only generic
> entry and arm64 use it, and nowhere else needs it; after the refactoring
> the comments now seem rather unclear.

Agreed, the comments are essentially describing what each function
calls; considering how short they are, directly reading the code is
probably easier.

- Kevin

