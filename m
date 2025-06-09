Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB11C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3S6tykhJyeHrVCKOWYuqZeKelps8OTrdrnXKVB8u84=; b=4uzBgYz980rQxZEG9lJFxLVMJd
	suOX04E0dFJXJdGxQSwDuTrPgOrOLxG15sY12Qz/mYLHQ2xJl2uykMV3/PGqKEF0XjUI+aAWgSCbt
	PoNusbL0XB+J11B3LXRo2Z1asdc08+S3SBpI8hT5/X+uTW+vSioqdvFi3vQaFzOK7NgIFLTBs6sVU
	2wDuGyDNPk324th73XxYLgQb54/I6M7DfaaPGtr+KB5X/WQgrBKXLRqFgkb1ludGPK4r0mQ5Cu23a
	9op6NnLQTdgJJy1AyhjJAsgGfHl0CVcKQJ9nUGLUKtgMGteYtqssWH+ii14ZtTU4yN57vBnpw3ujD
	fcn16dGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgjf-00000004r6Z-1LGK;
	Mon, 09 Jun 2025 17:56:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfcw-00000004ikd-1zRO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:45:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E317A5058F;
	Mon,  9 Jun 2025 16:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB90C4CEEB;
	Mon,  9 Jun 2025 16:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749487537;
	bh=0eaL9ONmCVr7aENDg+RaTv+vj7YllmZgM3G3K0SPFtc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LUXbva0+67K2GIjlvotTv5vG3G8D+Vqz+7eskKDfz/JX99HGagjruchtSmUjFS5MV
	 ijnLN785lYuQzkOkUFzCJtrkLf92atwxleRr0AkyBJ2C8bbNr9kVuCKW/yHa4dE45t
	 0/HSGI/69HwgGwY+BqZwaOYG96kcYGFfjKN7UtUaJSAykR2XL1UKScTIAonJFM8Pm3
	 GgU9uylyFwCzB27piOUDWTlgWfgfhXtW/W6JwK7I1hyd21UmiymmbGfFMtnkFREf/f
	 hr/g/wzVugpby5R90uvEXKVhKKu1f6j6liPMnzYmihBea1waJPnFAgxuPTZzkzLza4
	 PgpYNALJgms2A==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uOfcs-005Fqa-PD;
	Mon, 09 Jun 2025 17:45:34 +0100
MIME-Version: 1.0
Date: Mon, 09 Jun 2025 17:45:34 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel
 <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 1/2] arm64: Remove .inst workarounds after binutils bump
In-Reply-To: <20250607104041.1406771-2-maz@kernel.org>
References: <20250607104041.1406771-1-maz@kernel.org>
 <20250607104041.1406771-2-maz@kernel.org>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <77c93d194f0296c6def3c05249fc5462@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, ardb@kernel.org, arnd@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_094538_643582_A51234D3 
X-CRM114-Status: GOOD (  22.77  )
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

On 2025-06-07 11:40, Marc Zyngier wrote:
> Binutils version up to (and including) 2.25 have a pathological
> behaviour when it comes to mixing .inst directive and arithmetic
> involving labels. The assembler complains about non-constant
> expressions and compilation stops pretty quickly.
> 
> Now that our base binutils version is 2.30, we can drop the hackish
> workarounds we had in both the alternative and sysreg code.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/Kconfig                          |  3 ---
>  arch/arm64/Makefile                         |  4 ---
>  arch/arm64/include/asm/alternative-macros.h | 28 ++++++++-------------
>  arch/arm64/include/asm/sysreg.h             | 21 ----------------
>  tools/arch/arm64/include/asm/sysreg.h       | 21 ----------------
>  5 files changed, 11 insertions(+), 66 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 55fc331af3371..95697700f1992 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -404,9 +404,6 @@ config ARCH_SUPPORTS_UPROBES
>  config ARCH_PROC_KCORE_TEXT
>  	def_bool y
> 
> -config BROKEN_GAS_INST
> -	def_bool !$(as-instr,1:\n.inst 0\n.rept . - 1b\n\nnop\n.endr\n)
> -
>  config BUILTIN_RETURN_ADDRESS_STRIPS_PAC
>  	bool
>  	# Clang's __builtin_return_address() strips the PAC since 12.0.0
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 73a10f65ce8bc..212bf394ea43f 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -29,10 +29,6 @@ cc_has_k_constraint := $(call try-run,echo				\
>  		return 0;						\
>  	}' | $(CC) -S -x c -o "$$TMP" -,,-DCONFIG_CC_HAS_K_CONSTRAINT=1)
> 
> -ifeq ($(CONFIG_BROKEN_GAS_INST),y)
> -$(warning Detected assembler with broken .inst; disassembly will be 
> unreliable)
> -endif
> -
>  # The GCC option -ffreestanding is required in order to compile code 
> containing
>  # ARM/NEON intrinsics in a non C99-compliant environment (such as the 
> kernel)
>  CC_FLAGS_FPU	:= -ffreestanding
> diff --git a/arch/arm64/include/asm/alternative-macros.h
> b/arch/arm64/include/asm/alternative-macros.h
> index c8c77f9e36d60..61c2cbe618b9f 100644
> --- a/arch/arm64/include/asm/alternative-macros.h
> +++ b/arch/arm64/include/asm/alternative-macros.h
> @@ -40,17 +40,6 @@
>  /*
>   * alternative assembly primitive:
>   *
> - * If any of these .org directive fail, it means that insn1 and insn2
> - * don't have the same length. This used to be written as
> - *
> - * .if ((664b-663b) != (662b-661b))
> - * 	.error "Alternatives instruction length mismatch"
> - * .endif
> - *
> - * but most assemblers die if insn1 or insn2 have a .inst. This should
> - * be fixed in a binutils release posterior to 2.25.51.0.2 (anything
> - * containing commit 4e4d08cf7399b606 or c1baaddf8861).
> - *
>   * Alternatives with callbacks do not generate replacement 
> instructions.
>   */
>  #define __ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, cfg_enabled)	\
> @@ -65,8 +54,9 @@
>  	"663:\n\t"							\
>  	newinstr "\n"							\
>  	"664:\n\t"							\
> -	".org	. - (664b-663b) + (662b-661b)\n\t"			\
> -	".org	. - (662b-661b) + (664b-663b)\n\t"			\
> +	".if ((664b-663b) != (662b-661b))\n"				\
> +	".error \"Alternatives instruction length mismatch\"\n"		\
> +	".endif\n"							\
>  	".previous\n"							\

It appears[1] that clang decided to somehow mimic the broken GAS
behaviour with its integrated assembler, and is unable to assemble
the above until some version of clang 19 (both clang 17 and 18, as
available in Debian trixie, appear to be broken).

Passing "CLANG_FLAGS=-no-integrated-as" obviously works, but that's
not exactly desirable.

On the plus side, the test that drives BROKEN_GAS_INST doesn't fire
on any of the clang versions, so we can still drop that.

I'll repost an updated version towards the end of the week.

          M.

[1] https://lore.kernel.org/all/202506091850.ZQDMasOg-lkp@intel.com/
-- 
Jazz is not dead. It just smells funny...

