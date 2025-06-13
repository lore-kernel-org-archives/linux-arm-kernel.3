Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D92C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzdHY1vQgMHaaCamZNWsXnmpBZai5c2D3LaiDPl2grk=; b=Dts76IHAOWUek/JEwmwhFAUK1t
	43rNAowVOrcKpU3Wx61H28kRqOpmUa1r6L3tvcMzBGT7ieEFo8RjSy6uPO1dCpYhO24VGeJa0aFXA
	u6pPsZxk4PYpj8nAPcvZP1B6XeaztmGOPQvY9bOMdREeYCqdznGv1J8FiftYFLQcv1J9GR2V8CJQT
	cqQurz/bBmtsqkabk670RcKWthJ44Pyz5ftKxTDEp1XcPdAgCrV23Rcvj7nKxjjX8JJQpjovTzEaK
	KDCNbYLz+ArJxrqWrUv6PdOgsyVSe13kDfGLdPYNOpvml+Fq/rkrZ2PQIWgdKMjVWQI/8L84MipoU
	wBvWe//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6gg-0000000GxVL-3KOI;
	Fri, 13 Jun 2025 15:51:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5h2-0000000GkwJ-2Zxh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 14:47:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 819DF14BF;
	Fri, 13 Jun 2025 07:47:18 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 930B43F59E;
	Fri, 13 Jun 2025 07:47:37 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:47:31 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>,
	Catalin marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: Unconditionally select CONFIG_JUMP_LABEL
Message-ID: <aEw6A5-xvWSGPnOF@J2N7QTR9R3>
References: <20250613141936.2219895-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613141936.2219895-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_074744_741777_7EF92093 
X-CRM114-Status: GOOD (  21.39  )
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

On Fri, Jun 13, 2025 at 03:19:36PM +0100, Marc Zyngier wrote:
> Aneesh reports that his kernel fails to boot in nVHE mode with
> KVM's protected mode enabled. Further investigation by Mostafa
> reveals that this fails because CONFIG_JUMP_LABEL=n and that
> we have static keys shared between EL1 and EL2.
> 
> While this can be worked around, it is obvious that we have long
> relied on having CONFIG_JUMP_LABEL enabled at all times, as all
> supported compilers now have 'asm goto' (which is the basic block
> for jump labels).
> 
> Let's simplify our lives once and for all by mandating jump labels.
> It's not like anyone else is testing anything without them, and
> we already rely on them for other things (kfence, xfs, preempt).
> 
> Link: https://lore.kernel.org/r/yq5ah60pkq03.fsf@kernel.org
> Reported-by: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Reported-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

It might be worth noting that even with this, we still need to take care
to not use arbitrary static keys in hyp code (since we don't to consume
anything that can legitimately be flipped after hyp initialization), but
that aspect should be dealt with by reviewing additions to image-vars.h.

Mark.

> ---
>  arch/arm64/Kconfig         | 1 +
>  arch/arm64/kernel/Makefile | 3 +--
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 55fc331af3371..393d71124f5d2 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -256,6 +256,7 @@ config ARM64
>  	select HOTPLUG_SMT if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
> +	select JUMP_LABEL
>  	select KASAN_VMALLOC if KASAN
>  	select LOCK_MM_AND_FIND_VMA
>  	select MODULES_USE_ELF_RELA
> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> index 2920b0a514037..a2faf0049dab1 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -34,7 +34,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
>  			   cpufeature.o alternative.o cacheinfo.o		\
>  			   smp.o smp_spin_table.o topology.o smccc-call.o	\
>  			   syscall.o proton-pack.o idle.o patching.o pi/	\
> -			   rsi.o
> +			   rsi.o jump_label.o
>  
>  obj-$(CONFIG_COMPAT)			+= sys32.o signal32.o			\
>  					   sys_compat.o
> @@ -47,7 +47,6 @@ obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o perf_callchain.o
>  obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF)	+= watchdog_hld.o
>  obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
>  obj-$(CONFIG_CPU_PM)			+= sleep.o suspend.o
> -obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
>  obj-$(CONFIG_KGDB)			+= kgdb.o
>  obj-$(CONFIG_EFI)			+= efi.o efi-rt-wrapper.o
>  obj-$(CONFIG_PCI)			+= pci.o
> -- 
> 2.39.2
> 

