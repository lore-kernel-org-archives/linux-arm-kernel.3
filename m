Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC23FD2D8C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQl13lrqMl69+IiDkd49hEB1+YJN3AQemzDhQg61l5k=; b=uGmPQME+b7ih8/
	PAtIyUouprSS2qcLw3Tj3JTMAR+1QYCjYysCkn6Qblt7spNVJbVjf2etfM0fFbtre5h5lNvl0+MkI
	FYjh76VYcpGCc0QUbmgTBz45Dvj0bFSNB3Pnwpc6VCsUjQ0tp7QGoa8/Hn87u0H8zlZ1J0qQ8c0It
	kEykY7X/o48xkZE6pVdaXqMdfqopmFTi/VpqMYUJ52PYDZdXQpc4Hz4kWngCH9eZNPijPvmFbPo2g
	ul+j3+IMwBC+LjagPMDXhaVWE2CdJDjyMFlT6WdjLopwK9jAM8hYb41tOKaUsSqAE5B/+1oy3hzst
	YHmcaX3/oDQJ+cmWWThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfc2-0000000DyrE-38hr;
	Tue, 27 Jan 2026 09:43:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfbv-0000000Dyp6-2cq5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:43:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B770C339;
	Tue, 27 Jan 2026 01:43:38 -0800 (PST)
Received: from [10.57.54.43] (unknown [10.57.54.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDCF03F632;
	Tue, 27 Jan 2026 01:43:38 -0800 (PST)
Message-ID: <532b42e2-3417-4e0f-af59-8c79521c34a3@arm.com>
Date: Tue, 27 Jan 2026 10:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/16] arm64/ptrace: Refactor
 syscall_trace_enter/exit()
To: Jinjie Ruan <ruanjinjie@huawei.com>, Will Deacon <will@kernel.org>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-5-ruanjinjie@huawei.com>
 <aXeZdh3CtznU8u6L@willie-the-truck>
 <4f07254d-b158-a1ce-69a7-4fa4b0f339c1@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <4f07254d-b158-a1ce-69a7-4fa4b0f339c1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_014347_705183_9E9B5CE3 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, tglx@linutronix.de, richard.weiyang@gmail.com, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, linux-kernel@vger.kernel.org, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 27/01/2026 04:01, Jinjie Ruan wrote:
>> I understand that you're gradually making the arch code more similar to
>> the core code so that we can switch over to it, but I'm struggling to
>> understand why syscall_trace_enter() takes the 'syscall' argument.
>>
>> Even the core code just seems to use it as a local variable, which it
>> overrides before it ever uses it. What am I missing?
> Hi,
>
> You're absolutely right. The 'syscall' parameter is indeed treated as a
> local variable and gets overridden before any real use. Should we
> refactor to remove the parameter entirely in generic entry?

I noticed this as well, removing it from the generic function would make
sense. AFAICT that removal could be propagated quite far in fact:
syscall_enter_from_user_mode_work(), syscall_enter_from_user_mode(),
even arch implementation (do_syscall_64() on x86).

- Kevin

