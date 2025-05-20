Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B7CC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIUvLK1S42QgYg+SAg3Tn3A6SIynEt7/M9md1vrgLgQ=; b=p+N8tv8suB7sf0UM+hh36mm+7N
	VJMfKYYSW5nRtnYxqjeiKdD3UKsUuLMzDfqu472kQg5UZ5tG+zQR8xbr5E/WVgRz9UND2jSXEPntH
	wZeQYmtk1BRAS1+0VYishfifLMRq29EsRKpQm1BCP0nuKjRluLOPi6pBHtwgIJbzKFcDAFqn0mnLW
	q0090TfzVxTEpnvS5n7Ev3jaMDBgCs1FXG08WxMR8hiuigYNEjz63J2YunSoNrTuWhEe/WH/TBHgq
	ABE0/rFL+uAnTGCy/G7XcaCJM1Xw1Go/FLhmu0xKRkFxGRpDZiem56ymrPfWXRBXmiU5pBE3uMMnR
	yZ9Ym+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQNu-0000000DdQZ-1oQW;
	Tue, 20 May 2025 17:04:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQJc-0000000DcrD-3t14
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 16:59:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A9CFA4ED25;
	Tue, 20 May 2025 16:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7817C4CEE9;
	Tue, 20 May 2025 16:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747760383;
	bh=rvb+JvLP9AqVMlLPcfXOshYXZFt9qnylINp/JhwpzUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pRRw5ClbR5L9sOA88r+gzytWoyyLI1bluB62y9vvaC6fXNKI+eopauA5dzSOidLIa
	 KJv3fAuoZbYfnsocZ3N/jtv7obEADwEhczh67OVwquHwCuc5SlUYZx1558N0NaulqV
	 bILU4u76Bl918mbwshLr6BAFa/eIUOB9nuO6ZxqoieNu18rhqyiMnWX8KbtLaHP4Vn
	 H9i+fJfDJS/p8d7fF/HcjuR8Z8FNHq4LyMGheU4Krczw6iyIhfdweIPVzb1D9Ua2Aa
	 FltXZJh8GnbZs8ssz8I0vhoLcBaB0FVgPoG0kRQyXXsuqrrfad2IlXYpfhnkipMlke
	 B054ROGB1Ip1A==
Date: Tue, 20 May 2025 17:59:39 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 08/11] arm64: debug: split hardware watchpoint
 exception entry
Message-ID: <20250520165938.GA19257@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-9-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512174326.133905-9-ada.coupriediaz@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095945_097319_793D82D4 
X-CRM114-Status: GOOD (  20.09  )
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

On Mon, May 12, 2025 at 06:43:23PM +0100, Ada Couprie Diaz wrote:
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
> Split the hardware watchpoint exception entry and adjust the behaviour
> to match the lack of needed mitigations.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/exception.h |  2 ++
>  arch/arm64/kernel/entry-common.c   | 31 +++++++++++++++++++++++++++++-
>  arch/arm64/kernel/hw_breakpoint.c  | 14 ++++++++++----
>  3 files changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
> index cbcd832bf58e..eb465c375d34 100644
> --- a/arch/arm64/include/asm/exception.h
> +++ b/arch/arm64/include/asm/exception.h
> @@ -63,6 +63,8 @@ void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
>  			struct pt_regs *regs);
>  void do_breakpoint(unsigned long esr, struct pt_regs *regs);
>  void do_softstep(unsigned long esr, struct pt_regs *regs);
> +void do_watchpoint(unsigned long addr, unsigned long esr,
> +			struct pt_regs *regs);
>  void do_fpsimd_acc(unsigned long esr, struct pt_regs *regs);
>  void do_sve_acc(unsigned long esr, struct pt_regs *regs);
>  void do_sme_acc(unsigned long esr, struct pt_regs *regs);
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 8814ad24e707..6e70130d2741 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -530,10 +530,20 @@ static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
>  	arm64_exit_el1_dbg(regs);
>  }
>  
> -static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
> +static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
>  {
> +	/* Only watchpoints write FAR_EL1 */

nit: But maybe scope the comment (here and in the el0 handler) for debug
exceptions?
e.g.

	/* Watchpoints are the only debug exception to write FAR_EL1 */

?

Will

