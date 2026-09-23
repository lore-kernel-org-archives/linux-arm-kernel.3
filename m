Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05BBC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oVka1MTkYLJyYEXxEVGc8usytEu4OISAfUOoUqqfxE=; b=hqQyBOKYL8npMrzq8zfkg/lX8Q
	4gxONcdgEgWSLXAG7aS6gztEtBvy4pWPSiiSi5WADw2WROpvA+fsrBTGvE6OdRdSAsG4nxA84P6vz
	uo44T+mEHRoUZUOynTIAuQfW3cR2DKLz13PXqvwCg99zwjYCLb2FSnzGi2xYovZZ6sAfxIYnPmFiF
	W1YZ/uTyXDUoAzZa11Wa4vRk2IAYafOzuGajZOJ+awqXKbsvdbkpR3zpDhaexPMPGQKlXiv+wr+FH
	ACogXxn/2aqh6hx5ApR5hVqFPxHiQWWnmbKAdlIVu/aTZDT/kvW7jbGkwrP1XqhssPOcX9rhfKlBc
	kwyaccBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ILP-00000007WaF-0b7S;
	Wed, 23 Sep 2026 08:28:47 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ILK-00000007WYs-2MVw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:28:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9oVka1MTkYLJyYEXxEVGc8usytEu4OISAfUOoUqqfxE=;
	b=bZte0lkp3UMXEL24UQm0EdyQHRIFnrEo7BU8EDhLthwSY2Zwgew3HwIqZSfZQDTG+143l4ypW
	tAzcGu1hqwVJc+yh7PHipuiJ+cGPObrwvDaQmzJZO1PRMWl6Lw1XvhNmTbolpAfErEMS2n9N93b
	pFCyMEdNm6KGcM4/sOTY1LY=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hqVD75nCXzLlTm;
	Wed, 23 Sep 2026 16:16:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2FC4C40561;
	Wed, 23 Sep 2026 16:28:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 23 Sep 2026 16:28:28 +0800
Message-ID: <40c729ba-8df0-4ec4-9987-e4096106e968@huawei.com>
Date: Wed, 23 Sep 2026 16:28:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 01/14] arm64: ptrace: Fix redundant syscall exit stop
 for PTRACE_SYSEMU_SINGLESTEP
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <peterz@infradead.org>, <ada.coupriediaz@arm.com>,
	<linusw@kernel.org>, <yeoreum.yun@arm.com>, <kevin.brodsky@arm.com>,
	<anshuman.khandual@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<vladimir.murzin@arm.com>, <tglx@kernel.org>, <broonie@kernel.org>,
	<liqiang01@kylinos.cn>, <ryan.roberts@arm.com>, <pengcan@kylinos.cn>,
	<kmehltretter@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
 <20260922035510.1090299-2-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260922035510.1090299-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_012843_226585_5635318F 
X-CRM114-Status: GOOD (  19.87  )
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

Will fix the pseudo-singlestep problem as sashiko pointed as below.

https://sashiko.dev/#/patchset/20260922035510.1090299-1-ruanjinjie%40huawei.com

在 2026/9/22 11:54, Jinjie Ruan 写道:
> PTRACE_SYSEMU_SINGLESTEP sets both _TIF_SYSCALL_EMU and _TIF_SINGLESTEP.
> arm64 currently reports a syscall exit stop whenever _TIF_SINGLESTEP is
> set, regardless of emulation state.
> 
> This violates the ptrace man page (Syscall-stops section):
> 
> 	"If the tracee was restarted by PTRACE_SYSCALL or PTRACE_SYSEMU,
> 	the tracee enters syscall-enter-stop just prior to entering any
> 	system call (which will not be executed if the restart was using
> 	PTRACE_SYSEMU, regardless of any change made to registers at this
> 	point or how the tracee is restarted after this stop). ...
> 	If the tracee is continued using any other method (including
> 	PTRACE_SYSEMU), no syscall-exit-stop occurs. Note that all mentions
> 	PTRACE_SYSEMU apply equally to PTRACE_SYSEMU_SINGLESTEP."
> 
> Fix by introducing report_single_step(), which returns false when
> _TIF_SYSCALL_EMU is set, skipping the redundant exit stop.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Oleg Nesterov <oleg@redhat.com>
> Fixes: ac2081cdc4d9 ("arm64: ptrace: Consistently use pseudo-singlestep exceptions")
> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/ptrace.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index f743cbec1c3a..96462de75d4b 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2482,16 +2482,26 @@ int syscall_trace_enter(struct pt_regs *regs)
>  	return regs->syscallno;
>  }
>  
> +static inline bool report_single_step(unsigned long flags)
> +{
> +	if (flags & _TIF_SYSCALL_EMU)
> +		return false;
> +
> +	return flags & _TIF_SINGLESTEP;
> +}
> +
>  void syscall_trace_exit(struct pt_regs *regs)
>  {
>  	unsigned long flags = read_thread_flags();
> +	bool step;
>  
>  	audit_syscall_exit(regs);
>  
>  	if (flags & _TIF_SYSCALL_TRACEPOINT)
>  		trace_sys_exit(regs, syscall_get_return_value(current, regs));
>  
> -	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
> +	step = report_single_step(flags);
> +	if (step || flags & _TIF_SYSCALL_TRACE)
>  		report_syscall_exit(regs);
>  
>  	rseq_syscall(regs);

-- 
Best regards,
Jinjie


