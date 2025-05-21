Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDD8C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUPXTB3jQfPkcSi86cfGLcwV6bZDNNtoneYcw42xcK4=; b=oJRG7cO5rJzK2eUnRKQhMHrTxo
	zLOkkZozN71Vm4RSp8S38eoJb4zYaa2zhhRXeL62iveQtH2oo2XfW2fT5lTYE4zB22N+gRu8juYJP
	ZoNiNPi5+2bGJGQOth9rdG3NLATEUte5WXcwtFtTe8QDtgchErI+XidyCmmQLFQF3o5P0AJN3hNvN
	f55iV5xSPBQIXIDMp1uT/IjkbodT1GlBYiNkqZuwjD6HpDBDwH8ICwfRA6ckWOv5r8HiI5doMuuC0
	D+i/A1XsshIN54HS9kQfAjQ55vOGkDJTvrK6o5D16JyaKMikojIlC7TFBxCIkZ1oYc96RgQshnIV4
	SqDhLH3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfWC-0000000FGv5-2mZ0;
	Wed, 21 May 2025 09:13:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfQ6-0000000FFuA-0SJJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:07:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58F5FA4E7BA;
	Wed, 21 May 2025 09:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4451C4CEEA;
	Wed, 21 May 2025 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818445;
	bh=cdGDzSRhheR6vweEvUZtTgGqZ10caNifpW3n88SkxIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bfKXopnjeeXY4DuIQ40vQlDaiZFrmlSDzSd1fVbWEJEk0Jow9lRocHbxVCKMrg+0E
	 i+BCmGQvh3LbDcd9WVamyoDQLWv1eRmmoV1MxxcvBhZ+cSwlnKKqZTG+u8oNpSg9DX
	 J1UV4qIJTBhbMiLPFw/rqwTEjIUzXt/YYf6idLDk4+TPHv8XZZs/OxpK3iU94HwmQS
	 YQABYbqS3dzaBv7HLKm5WlmLl8nsrxo7wvl1QNp9sXPbXcOR9sYBKHe+qPwJr8ZAbs
	 k1qkanf0qRf9yqnXtWWoGYvBTw/QNB+O0dtP7P5Ey0f8gC9yG9xx/B4Y2gowcLoZRA
	 0EoYsvEJO+xjA==
Date: Wed, 21 May 2025 10:07:20 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 10/11] arm64: debug: split bkpt32 exception entry
Message-ID: <20250521090719.GA20168@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-11-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512174326.133905-11-ada.coupriediaz@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_020726_272963_7B1CBA3B 
X-CRM114-Status: GOOD (  22.55  )
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

On Mon, May 12, 2025 at 06:43:25PM +0100, Ada Couprie Diaz wrote:
> Currently all debug exceptions share common entry code and are routed
> to `do_debug_exception()`, which calls dynamically-registered
> handlers for each specific debug exception. This is unfortunate as
> different debug exceptions have different entry handling requirements,
> and it would be better to handle these distinct requirements earlier.
> 
> The BKPT32 exception can only be triggered by a BKPT instruction. Thus,
> we know that the PC is a legitimate address and isn't being used to train
> a branch predictor with a bogus address : we don't need to call
> `arm64_apply_bp_hardening()`.
> 
> The handler for this exception only pends a signal and doesn't depend
> on any per-CPU state : we don't need to inhibit preemption, nor do we
> need to keep the DAIF exceptions masked, so we can unmask them earlier.
> 
> Split the BKPT32 exception entry and adjust function signatures and its
> behaviour to match its relaxed constraints compared to other
> debug exceptions.
> 
> This replaces the last usage of `el0_dbg()`, so remove it.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/exception.h |  1 +
>  arch/arm64/kernel/debug-monitors.c |  9 +++++++++
>  arch/arm64/kernel/entry-common.c   | 21 +++++++++------------
>  3 files changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
> index af9b521e35f9..4ca43d4eaf98 100644
> --- a/arch/arm64/include/asm/exception.h
> +++ b/arch/arm64/include/asm/exception.h
> @@ -66,6 +66,7 @@ void do_softstep(unsigned long esr, struct pt_regs *regs);
>  void do_watchpoint(unsigned long addr, unsigned long esr,
>  			struct pt_regs *regs);
>  void do_brk64(unsigned long esr, struct pt_regs *regs);
> +void do_bkpt32(unsigned long esr, struct pt_regs *regs);
>  void do_fpsimd_acc(unsigned long esr, struct pt_regs *regs);
>  void do_sve_acc(unsigned long esr, struct pt_regs *regs);
>  void do_sme_acc(unsigned long esr, struct pt_regs *regs);
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 94779c957b70..53f0b2281f14 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -298,6 +298,15 @@ void do_brk64(unsigned long esr, struct pt_regs *regs)
>  }
>  NOKPROBE_SYMBOL(do_brk64);
>  
> +#ifdef CONFIG_COMPAT
> +/* BRKPT exception always traps to be handled. */

nit: I don't understand this comment

Will

