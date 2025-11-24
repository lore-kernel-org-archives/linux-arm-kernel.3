Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EE3CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNH/S57FQxOebr8RKctZnxvthh0Wbt2ic9yErCeoPGM=; b=rP+J2+xdQR+XpTNg20a6KCXVUZ
	5S5y9mgE5VXGxI+FtaRTFlcWynBWMGkaGOiZQV/CWUWXp/93orZxph/Zlneq8UbFmmG9815WqcNDN
	j4v6xvdtQUPTz+N/dAt5viXFT6iN8+bSSQKfxBmZGAwuhBPBt99WKWLyIQHZl4hYsXBixJNOZhv63
	GNBp4RDs1lxxYTRaNeQ/uhQOTx9d7HRuMwF8hgk6T4gt4sLCZZbewEgmziAQAgcKeAX2qsZCdpwqR
	aAoS3Blrii61R6KsTLU7xIPFKZmzPitpoaICHr6VgZc4gUh7jJiCtjvsjCXmPBU7/1UOI1132tTrx
	yuPoTJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSyL-0000000BMMn-1O1s;
	Mon, 24 Nov 2025 09:35:01 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSyH-0000000BMLh-3kbI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:34:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mNH/S57FQxOebr8RKctZnxvthh0Wbt2ic9yErCeoPGM=;
	b=dvYlQKJJLcvfTFqHE+TzBjWifSnMUGF2oYD8wgA/F8ThuSMR/RYA9+7PWjGVBv7roEkRY5n9L
	FtAHGsZQ9HPyZL4vgpKsaMp/NySCFJHkIy+p1ipDellD2qE4Lda2SiTOL6H6NUwd9ZNAn8Xq/Fe
	+1/OLKuGiwtXXFRVmiffpzg=
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4dFLGQ5xTfz1cyqQ;
	Mon, 24 Nov 2025 17:33:02 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id E885B140155;
	Mon, 24 Nov 2025 17:34:49 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 24 Nov 2025 17:34:48 +0800
Message-ID: <8489ee0d-8b9c-080a-04a0-b299549e86cf@huawei.com>
Date: Mon, 24 Nov 2025 17:34:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7 08/11] entry: Add
 arch_ptrace_report_syscall_entry/exit()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <akpm@linux-foundation.org>,
	<ldv@strace.io>, <macro@orcam.me.uk>, <deller@gmx.de>,
	<mark.rutland@arm.com>, <song@kernel.org>, <mbenes@suse.cz>,
	<ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<dvyukov@google.com>, <kmal@cock.li>, <lihongbo22@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
 <20251117133048.53182-9-ruanjinjie@huawei.com>
 <55e1345f-94d7-41a9-8f0a-694fd56f63ed@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <55e1345f-94d7-41a9-8f0a-694fd56f63ed@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_013458_581492_04D2E039 
X-CRM114-Status: GOOD (  23.79  )
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



On 2025/11/19 1:13, Kevin Brodsky wrote:
> On 17/11/2025 14:30, Jinjie Ruan wrote:
>> Differ from generic entry, due to historical reasons, ARM64 need to
>> save/restore during syscall entry/exit because ARM64 use a scratch
>> register (ip(r12) on AArch32, x7 on AArch64) to denote syscall entry/exit.
>>
>> In preparation for moving arm64 over to the generic entry code,
>> add arch_ptrace_report_syscall_entry/exit() as the default
>> ptrace_report_syscall_entry/exit() implementation. This allows
>> arm64 to implement the architecture specific version.
>>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> 
> I don't think I suggested this patch. I see that I suggested renaming
> some functions on v3, but I don't think that justifies a Suggested-by tag.
> 
>> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  kernel/entry/syscall-common.c | 43 +++++++++++++++++++++++++++++++++--
>>  1 file changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
>> index 66e6ba7fa80c..27310e611567 100644
>> --- a/kernel/entry/syscall-common.c
>> +++ b/kernel/entry/syscall-common.c
>> @@ -17,6 +17,25 @@ static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
>>  	}
>>  }
>>  
>> +/**
>> + * arch_ptrace_report_syscall_entry - Architecture specific
>> + *				      ptrace_report_syscall_entry().
>> + *
>> + * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_entry().
>> + * Defaults to ptrace_report_syscall_entry.
>> + *
>> + * The main purpose is to support arch-specific ptrace_report_syscall_entry()
>> + * implementation.
>> + */
>> +static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs);
>> +
>> +#ifndef arch_ptrace_report_syscall_entry
>> +static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs)
>> +{
>> +	return ptrace_report_syscall_entry(regs);
> 
> I saw that Thomas suggested this approach on v4, and it makes sense to
> me, but I find the naming surprising. If an architecture does need extra
> handling, then the generic function should never be called from generic
> code. So it seems to me that the more logical change would be:
> 
> * Rename: ptrace_report_syscall_entry -> __ptrace_report_syscall_entry
> * Introduce ptrace_report_syscall_entry(), defaults to
> __ptrace_report_syscall_entry()

If ptrace_report_syscall_entry() is defined in linux/ptrace.h, and an
architecture also needs to redefine this function, but the
architecture's own <asm/entry-common.h> must include <linux/ptrace.h>,
the function will end up being defined twice and cause a "duplicate
definition" compile error.

> 
> All this would be done in <linux/ptrace.h>, where it clearly belongs.
> The __ prefix makes it clear that the generic function is not the main
> interface. Even better, no need to change any caller with that approach.
> 
> - Kevin
> 
>> +}
>> +#endif
>> +
>>  long syscall_trace_enter(struct pt_regs *regs, long syscall,
>>  				unsigned long work)
>>  {
>> @@ -34,7 +53,7 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
>>  
>>  	/* Handle ptrace */
>>  	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
>> -		ret = ptrace_report_syscall_entry(regs);
>> +		ret = arch_ptrace_report_syscall_entry(regs);
>>  		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
>>  			return -1L;
>>  	}
>> @@ -84,6 +103,26 @@ static inline bool report_single_step(unsigned long work)
>>  	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
>>  }
>>  
>> +/**
>> + * arch_ptrace_report_syscall_exit - Architecture specific
>> + *				     ptrace_report_syscall_exit.
>> + *
>> + * Invoked from syscall_exit_work() to wrap ptrace_report_syscall_exit().
>> + *
>> + * The main purpose is to support arch-specific ptrace_report_syscall_exit
>> + * implementation.
>> + */
>> +static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
>> +							    int step);
>> +
>> +#ifndef arch_ptrace_report_syscall_exit
>> +static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
>> +							    int step)
>> +{
>> +	ptrace_report_syscall_exit(regs, step);
>> +}
>> +#endif
>> +
>>  void syscall_exit_work(struct pt_regs *regs, unsigned long work)
>>  {
>>  	bool step;
>> @@ -108,5 +147,5 @@ void syscall_exit_work(struct pt_regs *regs, unsigned long work)
>>  
>>  	step = report_single_step(work);
>>  	if (step || work & SYSCALL_WORK_SYSCALL_TRACE)
>> -		ptrace_report_syscall_exit(regs, step);
>> +		arch_ptrace_report_syscall_exit(regs, step);
>>  }
> 

