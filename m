Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133BAE77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 23:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztOcehz6Olfxdj/aRUhqditFpjqr/mmr8uYjqiWjVd4=; b=i5J+516L1L2rnVoYg6qmlZm3WM
	fBHPlCmZ2lSZg4WO5MKQ9VLWFwYcOwGjBZZsoPfPqznujVuKuj3auj6+lsFY82rIVWkhbTwffKk3b
	w0vpqMljyj+hG/Vz/rTfJqXlmue3zv56cysT/u7gYX/SvCQtllRLYuR7jKb9ECYaF5+oW/kFG7iYS
	YVlBXL6NlKtipyxqNaqq2/Qt+tfr52lJBNCGoEQW0oYMIwoe+9WzoT+iofN5AWDTd35z4ZDHtOibS
	hfOv3jOfP9Ba4ikwHX5ZzpraBL7oWMR730hn3MvJyAE/joYTZEUOwjwBfHfLYqcJA/n5e1Q4OQhTr
	O5Zvohgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNKkz-0000000BgFd-0eg3;
	Mon, 16 Dec 2024 23:44:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNKjs-0000000Bg5j-1CWe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 23:43:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A59D5A419DD;
	Mon, 16 Dec 2024 23:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DA8C4CED3;
	Mon, 16 Dec 2024 23:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734392579;
	bh=l9/IM5DK3ADr42QtgwUNbWJj+tcvKoSHuW74nZOhIOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TeAKWYMtgpjXG7dc85ISU9j6nRO40mbDGB1um+uayjQaSRprGvfN/g87iXczdu+Xy
	 79rS7XMZWnhry/ibvEwXJpTb0i52jo3YXnv5JUCuDV4hAH98advS6apIGDzsVBekqG
	 8GexjslubEflXux3UFQmuEPBOr0Y5fOx4KbQXGUIbj+vl8c7mM5we3Rh3l1bzdqdde
	 a0ICMdEVut4JWUJyGQnIssv2NRb5et9DCzSIr9UPgzJc2v2NjsyA/CiutR1kGeG3bq
	 UyaWBRJhqNTw/+IYcsN0jvuoIOa8dZG0wTb3CfKqyPC/2zt1NKDiYbNg0rVGsO5sIg
	 T4oH8JltltR8Q==
Date: Mon, 16 Dec 2024 17:42:51 -0600
From: Rob Herring <robh@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH V3 6/7] arm64/boot: Enable EL2 requirements for
 FEAT_Debugv8p9
Message-ID: <20241216234251.GA629562-robh@kernel.org>
References: <20241216040831.2448257-1-anshuman.khandual@arm.com>
 <20241216040831.2448257-7-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216040831.2448257-7-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_154300_469465_A990D2F0 
X-CRM114-Status: GOOD (  27.64  )
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

On Mon, Dec 16, 2024 at 09:38:30AM +0530, Anshuman Khandual wrote:
> Fine grained trap control for MDSELR_EL1 register needs to be configured in
> HDFGRTR2_EL2, and HDFGWTR2_EL2 registers when kernel enters at EL1, but EL2
> is also present.

Shouldn't this be "when kernel enters at EL2, and EL3 is also present"? 
Though it is really "If EL3 set FGTEn2 and the kernel is entered in 
EL2, then FGT2 must be initialized for MDSELR_EL1."

If it was me, I'd just plagarize what was written for prior FGT 
commits for this code. :)

> This adds a new helper __init_el2_fgt2() initializing this
> new FEAT_FGT2 based fine grained registers.

"This adds" is the same as saying "This patch/commit adds" which is well 
documented to avoid. Use imperative "Add a new helper...". Though it is 
clear from the diff that is what you are doing...


> MDCR_EL2.EBWE needs to be enabled for additional (beyond 16) breakpoint and
> watchpoint exceptions when kernel enters at EL1, but EL2 is also present.
> This updates __init_el2_debug() as required for FEAT_Debugv8p9.
> 
> While here, also update booting.rst with MDCR_EL3 and SCR_EL3 requirements.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kvmarm@lists.linux.dev
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in V3:
> 
> - Dropped MDCR_EL3.TDA boot requirement from documentation (separate series)
> - Dropped MDCR_EL2_EBWE definition as MDCR_EL2 is now defined in tools sysreg
> 
> https://lore.kernel.org/all/20241211065425.1106683-1-anshuman.khandual@arm.com/
> 
>  Documentation/arch/arm64/booting.rst | 18 ++++++++++++++++++
>  arch/arm64/include/asm/el2_setup.h   | 26 ++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index 3278fb4bf219..054cfe1cad18 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -288,6 +288,12 @@ Before jumping into the kernel, the following conditions must be met:
>  
>      - SCR_EL3.FGTEn (bit 27) must be initialised to 0b1.
>  
> +  For CPUs with the Fine Grained Traps (FEAT_FGT2) extension present:
> +
> +  - If EL3 is present and the kernel is entered at EL2:
> +
> +    - SCR_EL3.FGTEn2 (bit 59) must be initialised to 0b1.
> +
>    For CPUs with support for HCRX_EL2 (FEAT_HCX) present:
>  
>    - If EL3 is present and the kernel is entered at EL2:
> @@ -322,6 +328,18 @@ Before jumping into the kernel, the following conditions must be met:
>      - ZCR_EL2.LEN must be initialised to the same value for all CPUs the
>        kernel will execute on.
>  
> +  For CPUs with FEAT_Debugv8p9 extension present:
> +
> +  - If the kernel is entered at EL1 and EL2 is present:
> +
> +    - HDFGRTR2_EL2.nMDSELR_EL1 (bit 5) must be initialized to 0b1
> +    - HDFGWTR2_EL2.nMDSELR_EL1 (bit 5) must be initialized to 0b1
> +    - MDCR_EL2.EBWE (bit 43) must be initialized to 0b1
> +
> +  - If EL3 is present:
> +
> +    - MDCR_EL3.EBWE (bit 43) must be initialized to 0b1
> +
>    For CPUs with the Scalable Matrix Extension (FEAT_SME):
>  
>    - If EL3 is present:
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 4ef52d7245bb..2fbfe27d38b5 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -105,6 +105,13 @@
>  						// to own it.
>  
>  .Lskip_trace_\@:
> +	mrs	x1, id_aa64dfr0_el1
> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_DebugVer_SHIFT, #4
> +	cmp	x1, #ID_AA64DFR0_EL1_DebugVer_V8P9
> +	b.lt	.Lskip_dbg_v8p9_\@
> +
> +	orr	x2, x2, #MDCR_EL2_EBWE
> +.Lskip_dbg_v8p9_\@:
>  	msr	mdcr_el2, x2			// Configure debug traps
>  .endm
>  
> @@ -244,6 +251,24 @@
>  .Lskip_gcs_\@:
>  .endm
>  
> +.macro __init_el2_fgt2
> +	mrs	x1, id_aa64mmfr0_el1
> +	ubfx	x1, x1, #ID_AA64MMFR0_EL1_FGT_SHIFT, #4
> +	cmp	x1, #ID_AA64MMFR0_EL1_FGT_FGT2

We already read this field in __init_el2_fgt, shouldn't we leverage that 
and move all this there rather than read the feature reg twice.

> +	b.lt	.Lskip_fgt2_\@
> +
> +	mrs	x1, id_aa64dfr0_el1
> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_DebugVer_SHIFT, #4
> +	cmp	x1, #ID_AA64DFR0_EL1_DebugVer_V8P9
> +	b.lt	.Lskip_dbg_v8p9_\@
> +
> +	mov_q   x0, HDFGWTR2_EL2_nMDSELR_EL1
> +	msr_s	SYS_HDFGWTR2_EL2, x0
> +	msr_s	SYS_HDFGRTR2_EL2, x0

If Debug v8.9 is not present, but FGT2 is, shouldn't we write 0 to these 
registers? That is what we do for FGT.


I just realized I forgot to add FGT2 setup for the PMUv3.9 features I 
already added in 6.12 and 6.13. So this really needs to land sooner 
rather than later to add that. 

Rob

