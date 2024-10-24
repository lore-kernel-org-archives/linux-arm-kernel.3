Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B516CE8E7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8GD6ArgHKHB/v7z+Trawz446A+D6VwVin7rzFTGT6s=; b=kEKNj4EtCZY8egnTT4x3inPWXf
	nq8K+FXKcJlAyczNmiiicHaLDGsydZbz5A2WUtjgL6w+cdfttoP/xcATZPajHIW7V+DlGaSyoVHzT
	2N2jxYHVwH00xqTIjpRNUSLR5cRcBoYykZELljb39npin9Ig+Uo72XcbmPQ6BFVWCeHn7p8VUj99n
	IStMSc1FgTPW5B8N/6RpQkc6yASbzskx0pvenEWrHXNWaV19782513HTMvyIe7Ys3ytECDok3Ryn/
	4tNNXiZ8PxneG10ztodAX5I9idO/JCtpiCZWtdUlYoKGu9GDxuP8nsta6K3wb1xO1N4RisIrVkp/i
	RLc1JRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yRv-00000000c05-3d5j;
	Thu, 24 Oct 2024 14:04:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yQN-00000000bq8-2YcF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:02:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB013339;
	Thu, 24 Oct 2024 07:03:20 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF1CC3F528;
	Thu, 24 Oct 2024 07:02:49 -0700 (PDT)
Date: Thu, 24 Oct 2024 15:02:47 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 20/37] KVM: arm64: Disable hierarchical permissions
 when S1PIE is enabled
Message-ID: <20241024140247.GC1403933@e124191.cambridge.arm.com>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-21-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023145345.1613824-21-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_070251_742567_503C9250 
X-CRM114-Status: GOOD (  18.42  )
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

On Wed, Oct 23, 2024 at 03:53:28PM +0100, Marc Zyngier wrote:
> S1PIE implicitly disables hierarchical permissions, as specified in
> R_JHSVW, by making TCR_ELx.HPDn RES1.
> 
> Add a predicate for S1PIE being enabled for a given translation regime,
> and emulate this behaviour by forcing the hpd field to true if S1PIE
> is enabled for that translation regime.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/at.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index adcfce3f67f03..f5bd750288ff5 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -93,6 +93,23 @@ static enum trans_regime compute_translation_regime(struct kvm_vcpu *vcpu, u32 o
>  	}
>  }
>  
> +static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
> +{
> +	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1PIE, IMP))
> +		return false;
> +
> +	switch (regime) {
> +	case TR_EL2:
> +	case TR_EL20:
> +		return vcpu_read_sys_reg(vcpu, TCR2_EL2) & TCR2_EL2_PIE;
> +	case TR_EL10:
> +		return  (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En) &&
> +			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1x_PIE);
> +	default:
> +		BUG();
> +	}
> +}
> +
>  static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
>  			 struct s1_walk_result *wr, u64 va)
>  {
> @@ -186,6 +203,8 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
>  		    (va55 ?
>  		     FIELD_GET(TCR_HPD1, tcr) :
>  		     FIELD_GET(TCR_HPD0, tcr)));
> +	/* R_JHSVW */
> +	wi->hpd |= s1pie_enabled(vcpu, wi->regime);
>  
>  	/* Someone was silly enough to encode TG0/TG1 differently */
>  	if (va55) {
> -- 
> 2.39.2
> 

