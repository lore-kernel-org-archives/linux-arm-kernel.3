Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63246C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvmELVktiZKJg/UoPQ57gHdkE8Q9E4BMByjOTbq2OBE=; b=U/Y/yusdHly85L4g5fdWUG6nGu
	uOvesJJhUUgwScIUOuc3KKE1GbZqQNcwaHIP2Otb4ZebXL/kBQSCqdft5GqUILclIdsdAyDXG5ky8
	HeE/HEZI2AjYxAw6caJM5vufbHoI5PMkxooF2WZFqDrb1X1xF4ghN84NFaMbqMdcIITIq5/Gt/mEI
	KsHf1/qqm1R9ihMDJRG47Du0D0sXI8P9RixQvkumCqWkOiY7kL7bfnI0YpLfdyXxjpXTuJCmKV6uN
	l9uGGgySwSTFkMkFyUJvbiomXMMj5M8h1m1QwDwm2b5S41tbpieLFm6QlEh+XXZ4MZX/DbqbNr8Il
	OtJzxujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkLQ-0000000F6ff-1pOv;
	Fri, 04 Jul 2025 17:37:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkGu-0000000F63s-2yLr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E39A5A53453;
	Fri,  4 Jul 2025 17:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB29C4CEE3;
	Fri,  4 Jul 2025 17:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650343;
	bh=1FgyJasJiyLfKwV7l0vJE+kfU93zGpsHg5tbHPITJ70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QUamiKbEGVjUlqWhAB4Z0hKHhbO4jM0YuHAGpmuGHpNxjp/SI4dPOR+kl4u4b+rqb
	 TRFwGQYUsXpOKzuD3Y0WiN/qpjjo/Uo1GAVSMpbjm8eGNyAZWBWtWRsV7FdTWSBYe+
	 kdSwCqUc0XPEXqRF2azW9K8xB9fbZuBBtFzCncmEkQLTjeeWRZOWPg9hDKx0ocwUoD
	 zuCTOrul+ONEFjbR25KrnCXRz0gUvtZMYt+0X9mmQq+Dj5vTfndfGBKOhfM+r5qqaO
	 814QZ9jK9osijrgivorAoHiBVMLytebaYpBKm097BRkrtrEnAefI7qjjE6r073rozf
	 WCEQ3IcueKRqQ==
Date: Fri, 4 Jul 2025 18:32:19 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v5 10/13] arm64: debug: split hardware watchpoint
 exception entry
Message-ID: <aGgQI4c7MFmQ48tI@willie-the-truck>
References: <20250627172038.633423-1-ada.coupriediaz@arm.com>
 <20250627172038.633423-11-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627172038.633423-11-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_103224_888128_F3B601C9 
X-CRM114-Status: GOOD (  24.69  )
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

On Fri, Jun 27, 2025 at 06:20:35PM +0100, Ada Couprie Diaz wrote:
> Currently all debug exceptions share common entry code and are routed
> to `do_debug_exception()`, which calls dynamically-registered
> handlers for each specific debug exception. This is unfortunate as
> different debug exceptions have different entry handling requirements,
> and it would be better to handle these distinct requirements earlier.
> 
> Hardware watchpoints are the only debug exceptions that will write
> FAR_EL1, so we need to preserve it and pass it down.
> However, they cannot be used to maliciously train branch predictors, so
> we can omit calling `arm64_bp_hardening()`, nor do they need to handle
> the Cortex-A76 erratum #1463225, as it only applies to single stepping
> exceptions.
> 
> As the hardware watchpoint handler only returns 0 and never triggers
> the call to `arm64_notify_die()`, we can call it directly from
> `entry-common.c`.
> Split the hardware watchpoint exception entry and adjust the behaviour
> to match the lack of needed mitigations.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> Reviewed-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/exception.h |  4 ++++
>  arch/arm64/kernel/entry-common.c   | 31 +++++++++++++++++++++++++++++-
>  arch/arm64/kernel/hw_breakpoint.c  | 17 +++++-----------
>  3 files changed, 39 insertions(+), 13 deletions(-)

Not a huge deal, but I just noticed that this patch doesn't build on its
own and so this series isn't bisectable.

> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 7265bef96672..c2ea1653dbb8 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -553,10 +553,20 @@ static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
>  	arm64_exit_el1_dbg(regs);
>  }
>  
> -static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
> +static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
>  {
> +	/* Watchpoints are the only debug exception to write FAR_EL1 */
>  	unsigned long far = read_sysreg(far_el1);
>  
> +	arm64_enter_el1_dbg(regs);
> +	debug_exception_enter(regs);
> +	do_watchpoint(far, esr, regs);
> +	debug_exception_exit(regs);
> +	arm64_exit_el1_dbg(regs);
> +}
> +
> +static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
> +{
>  	arm64_enter_el1_dbg(regs);
>  	if (!cortex_a76_erratum_1463225_debug_handler(regs))
>  		do_debug_exception(far, esr, regs);

This leads to:

Failed to build patch #10: 0d0a8f024a19 arm64: debug: split hardware watchpoint exception entry
arch/arm64/kernel/entry-common.c: In function ‘el1_dbg’:
arch/arm64/kernel/entry-common.c:572:36: error: ‘far’ undeclared (first use in this function)
  572 |                 do_debug_exception(far, esr, regs);
      |                                    ^~~


Catalin -- do you reckon we should fix this? It's only this series
sitting on for-next/debug-entry, nobody has pulled it afaik and we still
have plenty of time before the merge window so a rebase probably won't
hurt anybody.

Will

