Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C5EC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rusHL1CZcMgYIv2ZpzpzB9UvbxsIM33dgpD0xpcMlbc=; b=nt+gZH0kAPIfScyrjzZWZO383D
	3Pj47UP6CgO165NyxLgBOlsnk5M8VgqJHXaB+xAqYM/fYnAh1/SIiXNG8mIMC0nglUon0uoqTpoXU
	mzaDPxBGF96MManLaN5QTgx0tEaphUyJsxjIxQkLneI5rC9t5qC+f8Akw80SrAyYE4L4WS4aUdGyX
	NSygWnwx4tBn++TOLF1BRrMVWaLlajl5CGFFqGCX4Cd87nQ0dW2RObzWBuxWXBKlnMZDQbcMxCcMg
	5FvBLvmDU3xWuYs3a4ybQdHYGj+I3CHSyUAfl/AvLm9HtCF8hTbU8H6a+4ZZU+XoWJ8D7omW59xRv
	0esYwRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZbZ-0000000E820-1fsB;
	Mon, 24 Feb 2025 14:38:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZBK-0000000E2Rx-18YM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:11:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E2DF1516;
	Mon, 24 Feb 2025 06:11:54 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B19513F5A1;
	Mon, 24 Feb 2025 06:11:35 -0800 (PST)
Date: Mon, 24 Feb 2025 14:11:28 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, Mark Brown <robh@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 7/7] arm64/boot: Enable EL2 requirements for
 FEAT_PMUv3p9
Message-ID: <Z7x-EDH9QP7g4lC6@J2N7QTR9R3.cambridge.arm.com>
References: <20250203050828.1049370-1-anshuman.khandual@arm.com>
 <20250203050828.1049370-8-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203050828.1049370-8-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_061138_396828_C2AF9B9E 
X-CRM114-Status: GOOD (  26.51  )
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

On Mon, Feb 03, 2025 at 10:38:28AM +0530, Anshuman Khandual wrote:
> FEAT_PMUv3p9 registers such as PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1
> access from EL1 requires appropriate EL2 fine grained trap configuration
> via FEAT_FGT2 based trap control registers HDFGRTR2_EL2 and HDFGWTR2_EL2.
> Otherwise such register accesses will result in traps into EL2.
> 
> Add a new helper __init_el2_fgt2() which initializes FEAT_FGT2 based fine
> grained trap control registers HDFGRTR2_EL2 and HDFGWTR2_EL2 (setting the
> bits nPMICNTR_EL0, nPMICFILTR_EL0 and nPMUACR_EL1) to enable access into
> PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 registers.
> 
> Also update booting.rst with SCR_EL3.FGTEn2 requirement for all FEAT_FGT2
> based registers to be accessible in EL2.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kvmarm@lists.linux.dev
> Tested-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  Documentation/arch/arm64/booting.rst | 18 ++++++++++++++++++
>  arch/arm64/include/asm/el2_setup.h   | 25 +++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)

Three things to note here:

(1) I think this is missing some other necessary register configuration.

    From a quick scan, we also require MDCR_EL3.EnPM2 (bit [7]) to be
    configured, which is not described in mainline nor here. If that
    resets to 0, then EL{2,1,0} accesses to a number of registers such
    as PMUACR_EL1 may trap to EL3.

    AFAICT the boot-wrapper resets that bit to 0, so have we actually
    tested all of this with the boot-wrapper? Does TF-A set this bit?

    Are we sure we've cpatured *all* requirements for FEAT_PMUv3p9? i.e.
    is there anything else that we've missed?

(2) This is a fix for !VHE support for PMUACR and ICNTR, where the host
    may run at EL1 and consequently will be affected by fine grained
    traps.

    So this probably needs a CC stable and/or fixes tag, and backport.

(3) As there's no KVM changes, this is only safe provided that the
    registers affected by these fine grained traps are already
    unconditionally trapped by other traps when running a vCPU.

    It looks like PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 are all
    trapped by MDCR_EL2.TPM, so that should work as long as we emulate
    the PMU. For direct access, FGT2 support will be a prerequisite.

Ideally, we'd have added support for FGT2 before the PMU functionality
that implicitly depends upon it. We should pay more attention to trap
controls in future.

Given (1) and (2) I think someone needs to look into this a bit more and
figure out if this needs a fixup or a respin.

Mark.

> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index cad6fdc96b98..04d97a1d5ffa 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -288,6 +288,12 @@ Before jumping into the kernel, the following conditions must be met:
>  
>      - SCR_EL3.FGTEn (bit 27) must be initialised to 0b1.
>  
> +  For CPUs with the Fine Grained Traps 2 (FEAT_FGT2) extension present:
> +
> +  - If EL3 is present and the kernel is entered at EL2:
> +
> +    - SCR_EL3.FGTEn2 (bit 59) must be initialised to 0b1.
> +
>    For CPUs with support for HCRX_EL2 (FEAT_HCX) present:
>  
>    - If EL3 is present and the kernel is entered at EL2:
> @@ -382,6 +388,18 @@ Before jumping into the kernel, the following conditions must be met:
>  
>      - SMCR_EL2.EZT0 (bit 30) must be initialised to 0b1.
>  
> +  For CPUs with the Performance Monitors Extension (FEAT_PMUv3p9):
> +
> + - If the kernel is entered at EL1 and EL2 is present:
> +
> +    - HDFGRTR2_EL2.nPMICNTR_EL0 (bit 2) must be initialised to 0b1.
> +    - HDFGRTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
> +    - HDFGRTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
> +
> +    - HDFGWTR2_EL2.nPMICNTR_EL0 (bit 2) must be initialised to 0b1.
> +    - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
> +    - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
> +
>    For CPUs with Memory Copy and Memory Set instructions (FEAT_MOPS):
>  
>    - If the kernel is entered at EL1 and EL2 is present:
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 25e162651750..1a0071faf57e 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -233,6 +233,30 @@
>  .Lskip_fgt_\@:
>  .endm
>  
> +.macro __init_el2_fgt2
> +	mrs	x1, id_aa64mmfr0_el1
> +	ubfx	x1, x1, #ID_AA64MMFR0_EL1_FGT_SHIFT, #4
> +	cmp	x1, #ID_AA64MMFR0_EL1_FGT_FGT2
> +	b.lt	.Lskip_fgt2_\@
> +
> +	mov	x0, xzr
> +	mrs	x1, id_aa64dfr0_el1
> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
> +	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
> +	b.lt	.Lskip_pmuv3p9_\@
> +
> +	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
> +	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
> +	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
> +.Lskip_pmuv3p9_\@:
> +	msr_s   SYS_HDFGRTR2_EL2, x0
> +	msr_s   SYS_HDFGWTR2_EL2, x0
> +	msr_s   SYS_HFGRTR2_EL2, xzr
> +	msr_s   SYS_HFGWTR2_EL2, xzr
> +	msr_s   SYS_HFGITR2_EL2, xzr
> +.Lskip_fgt2_\@:
> +.endm
> +
>  .macro __init_el2_gcs
>  	mrs_s	x1, SYS_ID_AA64PFR1_EL1
>  	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
> @@ -283,6 +307,7 @@
>  	__init_el2_nvhe_idregs
>  	__init_el2_cptr
>  	__init_el2_fgt
> +	__init_el2_fgt2
>          __init_el2_gcs
>  .endm
>  
> -- 
> 2.25.1
> 

