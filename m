Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AB7C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 10:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gVQ+7a7XoXwRH6MM7f1vg+0megNV6dh5vus2qsaVus=; b=e6/t6OhkG89h/r2AKWT9/9Jd8A
	lo1hhC/Wen2lSobEsEMdWOdMiybPm9O1GW9JVTRTaYctD6hQtRVQH7xgDz+Lo/K/tvpgQEXQ8DzKB
	3Iw+9GsOFT4ZqSJQlITApuLAPRCd6lem++l0JR2j0dhsJp3u6TfvlWBcHw5gccCpGX8+bpC95ZKfw
	KRZ7L/U2NN6ArGJ61dIPc6A8tJLlmZ8yfooWMqwwLTNefj0AyNDzR/Y+dpgYLK0ht8bCvY5RYQdeB
	eWmho2WT3gmDrqCuILM+NLDL2pVgHiny8F/6AkdpoyCOckxz44OQ1vCqDzkB4Fko2payA45sERFdA
	Z3zORDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAR3D-0000000FBVr-2ycO;
	Thu, 01 May 2025 10:21:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQz2-0000000FBAc-0Ode
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 10:17:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E96E71063;
	Thu,  1 May 2025 03:17:27 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FB663F673;
	Thu,  1 May 2025 03:17:33 -0700 (PDT)
Date: Thu, 1 May 2025 11:17:30 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 13/42] arm64: Add syndrome information for trapped
 LD64B/ST64B{,V,V0}
Message-ID: <20250501101730.GF1859293@e124191.cambridge.arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-14-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426122836.3341523-14-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_031736_177077_BBD3F64E 
X-CRM114-Status: GOOD (  14.65  )
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

On Sat, Apr 26, 2025 at 01:28:07PM +0100, Marc Zyngier wrote:
> Provide the architected EC and ISS values for all the FEAT_LS64*
> instructions.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/esr.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
> index e4f77757937e6..a0ae66dd65da9 100644
> --- a/arch/arm64/include/asm/esr.h
> +++ b/arch/arm64/include/asm/esr.h
> @@ -20,7 +20,8 @@
>  #define ESR_ELx_EC_FP_ASIMD	UL(0x07)
>  #define ESR_ELx_EC_CP10_ID	UL(0x08)	/* EL2 only */
>  #define ESR_ELx_EC_PAC		UL(0x09)	/* EL2 and above */
> -/* Unallocated EC: 0x0A - 0x0B */
> +#define ESR_ELx_EC_OTHER	UL(0x0A)
> +/* Unallocated EC: 0x0B */
>  #define ESR_ELx_EC_CP14_64	UL(0x0C)
>  #define ESR_ELx_EC_BTI		UL(0x0D)
>  #define ESR_ELx_EC_ILL		UL(0x0E)
> @@ -181,6 +182,11 @@
>  #define ESR_ELx_WFx_ISS_WFE	(UL(1) << 0)
>  #define ESR_ELx_xVC_IMM_MASK	((UL(1) << 16) - 1)
>  
> +/* ISS definitions for LD64B/ST64B instructions */
> +#define ESR_ELx_ISS_OTHER_ST64BV	(0)
> +#define ESR_ELx_ISS_OTHER_ST64BV0	(1)
> +#define ESR_ELx_ISS_OTHER_LDST64B	(2)
> +
>  #define DISR_EL1_IDS		(UL(1) << 24)
>  /*
>   * DISR_EL1 and ESR_ELx share the bottom 13 bits, but the RES0 bits may mean

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

