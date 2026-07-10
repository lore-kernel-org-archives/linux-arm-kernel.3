Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66822C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yK28gu3AFiRhLVFOdqi/EUTcCyQ/eopZxugBlNan7XM=; b=26nZXYBJD1od3to6cNWxTGAGWl
	uXuRfOmgzIbiNH0q4L/K7bHwNTo4rd8Cr5fJweZfMNuUAe0MRBC+qG98wAoj/5m4U5xJA13KFYMLw
	bClf0Tp5uKjvLor/qC1BGjfMFBhjBsVQiPsb+anwNv0+35Em146wG4pMMyZOo0vFLX9VcgDp5hUeF
	NiXtnmPgBRXKPoztwVG6iSAoieEdi1mGv/8Qa6LL/nzmtmRhOdrupoEIjrdcsPeFBcLCrzduj6/JU
	El4sjmUTeIS12ca3M8tvwgE41hTHXA49OWdt4WYYErwGBd7WRk3rGNTYbXa3N8eispUZAtjcOfj4T
	iy8zvISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCyt-00000005Anz-2mb4;
	Fri, 10 Jul 2026 15:17:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCyr-00000005AnX-441F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 15:17:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E98251E7D;
	Fri, 10 Jul 2026 08:17:27 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.2.213.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01FC23F85F;
	Fri, 10 Jul 2026 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783696652; bh=x2bMRixpySIA8bXaE0N2byG8u/ToD1VsGMdDAYwuZa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9b+/YZDvSisRbgsHzuwT4U7jkim3TbDKLh0zyHOnwvS2D8jKQiLnRIe5dgOqx1zz
	 Mc53vLRTR3612TOmuSlWaUzbKuXxZePiIpXJPkl7mYebYGkRJX3H6rXuBbF9ZYy/xT
	 Pgfqt41E1ODrU+WkVIwYUFiSyE/C30UVbHkkO5Vk=
Date: Fri, 10 Jul 2026 16:17:28 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 17/28] KVM: arm64: Add NV3 control bits to HCRX_EL2
 sanitisation
Message-ID: <20260710151728.GE12293@e124191.cambridge.arm.com>
References: <20260702160248.1377250-1-maz@kernel.org>
 <20260702160248.1377250-18-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702160248.1377250-18-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_081734_046905_F3E4F603 
X-CRM114-Status: GOOD (  15.14  )
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

On Thu, Jul 02, 2026 at 05:02:37PM +0100, Marc Zyngier wrote:
> Expose the FEAT_NV3 control bits to the sanitisation code so that
> KVM stops moaning about the unattributed bits.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/config.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 8d5e4aacf49c4..b9a9d65b973e6 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -225,6 +225,7 @@ struct reg_feat_map_desc {
>  #define FEAT_HCX		ID_AA64MMFR1_EL1, HCX, IMP
>  #define FEAT_S2PIE		ID_AA64MMFR3_EL1, S2PIE, IMP
>  #define FEAT_GCIE		ID_AA64PFR2_EL1, GCIE, IMP
> +#define FEAT_NV3		ID_AA64MMFR4_EL1, NV_frac, NV3
>  
>  static bool not_feat_aa64el3(struct kvm *kvm)
>  {
> @@ -904,6 +905,11 @@ static const DECLARE_FEAT_MAP_FGT(hdfgwtr2_desc, hdfgwtr2_masks,
>  
>  
>  static const struct reg_bits_to_feat_map hcrx_feat_map[] = {
> +	NEEDS_FEAT(HCRX_EL2_NVTGE		|
> +		   HCRX_EL2_NVnTTLB		|
> +		   HCRX_EL2_NVnTTLBIS		|
> +		   HCRX_EL2_NVnTTLBOS,
> +		   FEAT_NV3),
>  	NEEDS_FEAT(HCRX_EL2_SRMASKEn, FEAT_SRMASK),
>  	NEEDS_FEAT(HCRX_EL2_PACMEn, feat_pauth_lr),
>  	NEEDS_FEAT(HCRX_EL2_EnFPM, FEAT_FPMR),
> -- 
> 2.47.3
> 

