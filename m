Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA92C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhBQ57A5xoXfeaWz33y9au9tlaBWCTNZj6XSUsaCdRk=; b=2j9yz3yqtMCfEbw8mnYQv1vJtZ
	bIFtUOGvACsRib9td06KrpXeLNSxNdiblSQ1NmTTlXodu9ofz5I7POElaNOXhTx/uslAgp5Wwb8xV
	TKBYIW7lFCLtUVFzIdpt6fyRZmyGrHRxJdLKS2UfuvDj9jEnfrTctaMtnigtuhgb7LWp0yaatc1pv
	glxQZpSl5WC0Gk+kDH5PhD+DxNwGRcbS22OarAUlbsBGEA6dBYvaJrK1bWcxVdmRVCnVsrH4hIC9B
	tc9z4SKEG3v5FbqLMUuPl2XuXGOqnp+H4GjU+i/HX72mzVCE3wkoFGjQ41E6GXmIcFTp3vbFQBZIj
	rAugNP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cge-0000000EAqP-2yOD;
	Thu, 10 Sep 2026 11:11:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cgd-0000000EApp-3sDK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 11:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dhBQ57A5xoXfeaWz33y9au9tlaBWCTNZj6XSUsaCdRk=; b=AGVOsntcVCCSegQdIPYMsghyyi
	7j/xpQ6HVOlUK20mDj6vYM3Lffuy1tiS8Gn5A0/YMqrhom38/JuKvaunEh67IZKKX31NE04wu3J2B
	ao7eOr8MX3oMfH5nKh3usF2CZEHMYllcHL90qehHsHdg9V2xk4V1NMfu7mLDcpar5AaaxNPOSkiJJ
	hJ4dhy0G6/y4mUqcDpiHkfBN9sqxDn6bCTyqL0219J7BAU9KSNByZ3G9TskM7nG+52sSz+IruTqB0
	Q7geNgYz51Xt7KSXkguW3eATCp4J4LB5EUc0RJZqY5VBWBXWkHBuNRVZet5UNTP1E8MZqPfDjjPhW
	Lc8f0lNg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4cga-00000002NZW-0r83
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:11:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 285AB153B;
	Thu, 10 Sep 2026 04:11:14 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E943A3F528;
	Thu, 10 Sep 2026 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789038677; bh=hZvDUgTtll3NGhQAGAmYrBFjuHQT35dtitiVt/ESS04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=svDmKsu7f7je4pU3Rt+WIgJmQ7bx9kQqXZOiX3UxMMnEhE/2eNc/qzjaATmFd43f4
	 Eg8EcAMpkHahhga3dxePfGH/Y5nbJjNhM2ApdmhGvqHdnskcXRPOWALWU0J4b6IJWg
	 gAvVwMZblJcmHiMddwT4zkuse/2FFCz2MFNRp7FU=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 13/14] tools: Synchronise the kernel esr.h
Date: Thu, 10 Sep 2026 12:10:59 +0100
Message-ID: <aqKQQ_9uhkzXGmAH@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-arm64-gcs-v20-13-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-13-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_121120_546917_7C85D3F3 
X-CRM114-Status: GOOD (  20.45  )
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

On Tue, Sep 01, 2026 at 10:47:11PM +0100, Mark Brown wrote:
> To pick up definitions for GCS.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/arch/arm64/include/asm/esr.h | 113 +++++++++++++++++++++++++++++++++----
>  1 file changed, 102 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/arch/arm64/include/asm/esr.h b/tools/arch/arm64/include/asm/esr.h
> index f3c6403e5ef2..24c6ebe3fd41 100644
> --- a/tools/arch/arm64/include/asm/esr.h
> +++ b/tools/arch/arm64/include/asm/esr.h
> @@ -19,7 +19,8 @@
>  #define ESR_ELx_EC_FP_ASIMD	UL(0x07)
>  #define ESR_ELx_EC_CP10_ID	UL(0x08)	/* EL2 only */
>  #define ESR_ELx_EC_PAC		UL(0x09)	/* EL2 and above */
> -/* Unallocated EC: 0x0A - 0x0B */
> +#define ESR_ELx_EC_OTHER	UL(0x0A)
> +/* Unallocated EC: 0x0B */
>  #define ESR_ELx_EC_CP14_64	UL(0x0C)
>  #define ESR_ELx_EC_BTI		UL(0x0D)
>  #define ESR_ELx_EC_ILL		UL(0x0E)
> @@ -50,7 +51,8 @@
>  #define ESR_ELx_EC_FP_EXC32	UL(0x28)
>  /* Unallocated EC: 0x29 - 0x2B */
>  #define ESR_ELx_EC_FP_EXC64	UL(0x2C)
> -/* Unallocated EC: 0x2D - 0x2E */
> +#define ESR_ELx_EC_GCS		UL(0x2D)
> +/* Unallocated EC:  0x2E */
>  #define ESR_ELx_EC_SERROR	UL(0x2F)
>  #define ESR_ELx_EC_BREAKPT_LOW	UL(0x30)
>  #define ESR_ELx_EC_BREAKPT_CUR	UL(0x31)
> @@ -97,6 +99,8 @@
>  #define ESR_ELx_AET_CE		(UL(6) << ESR_ELx_AET_SHIFT)
>  
>  /* Shared ISS field definitions for Data/Instruction aborts */
> +#define ESR_ELx_VNCR_SHIFT	(13)
> +#define ESR_ELx_VNCR		(UL(1) << ESR_ELx_VNCR_SHIFT)
>  #define ESR_ELx_SET_SHIFT	(11)
>  #define ESR_ELx_SET_MASK	(UL(3) << ESR_ELx_SET_SHIFT)
>  #define ESR_ELx_FnV_SHIFT	(10)
> @@ -119,6 +123,16 @@
>  #define ESR_ELx_FSC_SEA_TTW(n)	(0x14 + (n))
>  #define ESR_ELx_FSC_SECC	(0x18)
>  #define ESR_ELx_FSC_SECC_TTW(n)	(0x1c + (n))
> +#define ESR_ELx_FSC_EXCL_ATOMIC	(0x35)
> +#define ESR_ELx_FSC_ADDRSZ	(0x00)
> +
> +/*
> + * Annoyingly, the negative levels for Address size faults aren't laid out
> + * contiguously (or in the desired order)
> + */
> +#define ESR_ELx_FSC_ADDRSZ_nL(n)	((n) == -1 ? 0x25 : 0x2C)
> +#define ESR_ELx_FSC_ADDRSZ_L(n)		((n) < 0 ? ESR_ELx_FSC_ADDRSZ_nL(n) : \
> +						   (ESR_ELx_FSC_ADDRSZ + (n)))
>  
>  /* Status codes for individual page table levels */
>  #define ESR_ELx_FSC_ACCESS_L(n)	(ESR_ELx_FSC_ACCESS + (n))
> @@ -141,12 +155,12 @@
>  #define ESR_ELx_SF 		(UL(1) << ESR_ELx_SF_SHIFT)
>  #define ESR_ELx_AR_SHIFT	(14)
>  #define ESR_ELx_AR 		(UL(1) << ESR_ELx_AR_SHIFT)
> -#define ESR_ELx_VNCR_SHIFT	(13)
> -#define ESR_ELx_VNCR		(UL(1) << ESR_ELx_VNCR_SHIFT)
>  #define ESR_ELx_CM_SHIFT	(8)
>  #define ESR_ELx_CM 		(UL(1) << ESR_ELx_CM_SHIFT)
>  
>  /* ISS2 field definitions for Data Aborts */
> +#define ESR_ELx_HDBSSF_SHIFT	(11)
> +#define ESR_ELx_HDBSSF		(UL(1) << ESR_ELx_HDBSSF_SHIFT)
>  #define ESR_ELx_TnD_SHIFT	(10)
>  #define ESR_ELx_TnD 		(UL(1) << ESR_ELx_TnD_SHIFT)
>  #define ESR_ELx_TagAccess_SHIFT	(9)
> @@ -161,8 +175,6 @@
>  #define ESR_ELx_Xs_MASK		(GENMASK_ULL(4, 0))
>  
>  /* ISS field definitions for exceptions taken in to Hyp */
> -#define ESR_ELx_FSC_ADDRSZ	(0x00)
> -#define ESR_ELx_FSC_ADDRSZ_L(n)	(ESR_ELx_FSC_ADDRSZ + (n))
>  #define ESR_ELx_CV		(UL(1) << 24)
>  #define ESR_ELx_COND_SHIFT	(20)
>  #define ESR_ELx_COND_MASK	(UL(0xF) << ESR_ELx_COND_SHIFT)
> @@ -174,6 +186,13 @@
>  #define ESR_ELx_WFx_ISS_WFE	(UL(1) << 0)
>  #define ESR_ELx_xVC_IMM_MASK	((UL(1) << 16) - 1)
>  
> +/* ISS definitions for LD64B/ST64B/{T,P}SBCSYNC instructions */
> +#define ESR_ELx_ISS_OTHER_ST64BV	(0)
> +#define ESR_ELx_ISS_OTHER_ST64BV0	(1)
> +#define ESR_ELx_ISS_OTHER_LDST64B	(2)
> +#define ESR_ELx_ISS_OTHER_TSBCSYNC	(3)
> +#define ESR_ELx_ISS_OTHER_PSBCSYNC	(4)
> +
>  #define DISR_EL1_IDS		(UL(1) << 24)
>  /*
>   * DISR_EL1 and ESR_ELx share the bottom 13 bits, but the RES0 bits may mean
> @@ -371,12 +390,14 @@
>  /*
>   * ISS values for SME traps
>   */
> +#define ESR_ELx_SME_ISS_SMTC_MASK		GENMASK(2, 0)
> +#define ESR_ELx_SME_ISS_SMTC(esr)		((esr) & ESR_ELx_SME_ISS_SMTC_MASK)
>  
> -#define ESR_ELx_SME_ISS_SME_DISABLED	0
> -#define ESR_ELx_SME_ISS_ILL		1
> -#define ESR_ELx_SME_ISS_SM_DISABLED	2
> -#define ESR_ELx_SME_ISS_ZA_DISABLED	3
> -#define ESR_ELx_SME_ISS_ZT_DISABLED	4
> +#define ESR_ELx_SME_ISS_SMTC_SME_DISABLED	0
> +#define ESR_ELx_SME_ISS_SMTC_ILL		1
> +#define ESR_ELx_SME_ISS_SMTC_SM_DISABLED	2
> +#define ESR_ELx_SME_ISS_SMTC_ZA_DISABLED	3
> +#define ESR_ELx_SME_ISS_SMTC_ZT_DISABLED	4
>  
>  /* ISS field definitions for MOPS exceptions */
>  #define ESR_ELx_MOPS_ISS_MEM_INST	(UL(1) << 24)
> @@ -387,6 +408,31 @@
>  #define ESR_ELx_MOPS_ISS_SRCREG(esr)	(((esr) & (UL(0x1f) << 5)) >> 5)
>  #define ESR_ELx_MOPS_ISS_SIZEREG(esr)	(((esr) & (UL(0x1f) << 0)) >> 0)
>  
> +/* ISS field definitions for GCS */
> +#define ESR_ELx_ExType_SHIFT	(20)
> +#define ESR_ELx_ExType_MASK		GENMASK(23, 20)
> +#define ESR_ELx_Raddr_SHIFT		(10)
> +#define ESR_ELx_Raddr_MASK		GENMASK(14, 10)
> +#define ESR_ELx_Rn_SHIFT		(5)
> +#define ESR_ELx_Rn_MASK			GENMASK(9, 5)
> +#define ESR_ELx_Rvalue_SHIFT		5
> +#define ESR_ELx_Rvalue_MASK		GENMASK(9, 5)
> +#define ESR_ELx_IT_SHIFT		(0)
> +#define ESR_ELx_IT_MASK			GENMASK(4, 0)
> +
> +#define ESR_ELx_ExType_DATA_CHECK	0
> +#define ESR_ELx_ExType_EXLOCK		1
> +#define ESR_ELx_ExType_STR		2
> +
> +#define ESR_ELx_IT_RET			0
> +#define ESR_ELx_IT_GCSPOPM		1
> +#define ESR_ELx_IT_RET_KEYA		2
> +#define ESR_ELx_IT_RET_KEYB		3
> +#define ESR_ELx_IT_GCSSS1		4
> +#define ESR_ELx_IT_GCSSS2		5
> +#define ESR_ELx_IT_GCSPOPCX		6
> +#define ESR_ELx_IT_GCSPOPX		7
> +
>  #ifndef __ASSEMBLER__
>  #include <asm/types.h>
>  
> @@ -408,6 +454,11 @@ static inline bool esr_is_cfi_brk(unsigned long esr)
>  	       (esr_brk_comment(esr) & ~CFI_BRK_IMM_MASK) == CFI_BRK_IMM_BASE;
>  }
>  
> +static inline bool esr_is_ubsan_brk(unsigned long esr)
> +{
> +	return (esr_brk_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM;
> +}
> +
>  static inline bool esr_fsc_is_translation_fault(unsigned long esr)
>  {
>  	esr = esr & ESR_ELx_FSC;
> @@ -439,6 +490,46 @@ static inline bool esr_fsc_is_access_flag_fault(unsigned long esr)
>  	       (esr == ESR_ELx_FSC_ACCESS_L(0));
>  }
>  
> +static inline bool esr_fsc_is_excl_atomic_fault(unsigned long esr)
> +{
> +	esr = esr & ESR_ELx_FSC;
> +
> +	return esr == ESR_ELx_FSC_EXCL_ATOMIC;
> +}
> +
> +static inline bool esr_fsc_is_addr_sz_fault(unsigned long esr)
> +{
> +	esr &= ESR_ELx_FSC;
> +
> +	return (esr == ESR_ELx_FSC_ADDRSZ_L(3))	||
> +	       (esr == ESR_ELx_FSC_ADDRSZ_L(2))	||
> +	       (esr == ESR_ELx_FSC_ADDRSZ_L(1)) ||
> +	       (esr == ESR_ELx_FSC_ADDRSZ_L(0))	||
> +	       (esr == ESR_ELx_FSC_ADDRSZ_L(-1));
> +}
> +
> +static inline bool esr_fsc_is_sea_ttw(unsigned long esr)
> +{
> +	esr = esr & ESR_ELx_FSC;
> +
> +	return (esr == ESR_ELx_FSC_SEA_TTW(3)) ||
> +	       (esr == ESR_ELx_FSC_SEA_TTW(2)) ||
> +	       (esr == ESR_ELx_FSC_SEA_TTW(1)) ||
> +	       (esr == ESR_ELx_FSC_SEA_TTW(0)) ||
> +	       (esr == ESR_ELx_FSC_SEA_TTW(-1));
> +}
> +
> +static inline bool esr_fsc_is_secc_ttw(unsigned long esr)
> +{
> +	esr = esr & ESR_ELx_FSC;
> +
> +	return (esr == ESR_ELx_FSC_SECC_TTW(3)) ||
> +	       (esr == ESR_ELx_FSC_SECC_TTW(2)) ||
> +	       (esr == ESR_ELx_FSC_SECC_TTW(1)) ||
> +	       (esr == ESR_ELx_FSC_SECC_TTW(0)) ||
> +	       (esr == ESR_ELx_FSC_SECC_TTW(-1));
> +}
> +
>  /* Indicate whether ESR.EC==0x1A is for an ERETAx instruction */
>  static inline bool esr_iss_is_eretax(unsigned long esr)
>  {
> 
> -- 
> 2.47.3
> 

Checked agains the Arm ARM.
FWIW:

Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Thanks!
Leo

