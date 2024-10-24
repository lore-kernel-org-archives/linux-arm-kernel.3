Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0622CE8E8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30dcT+yI5gG5QxTYhCRMGegTI/a7MT7CFahzpnwmkmE=; b=nnQ+WJDTCcr9bvnfx9jTu0Wdnv
	NoUXX8tROHwSowLmNOPBRz66F9rXHrqXPICuayeszKwobLArhAnYeraqA+77FlQf+N0D9JV/9jRe8
	2QnQIXdxghFb71mYD/Gl7jMqANXQeA4mYeLrFno9lNDK1uRGD6fQUNK7xE71IznJT1fLCtZ60rZ+s
	U/AUINZUe2et0GvdQsuBjRDlLRBtI481wtzOYjvcvOenPDJFvW4zLl0kHzgwGO/1SWq5KBgK/PwTD
	NiLVjFfkOn34qAe1oXBh3slOrJ1nmq/VmAKykCD7WCjWANO9QvbaQTJDoIigEgyMex+IeMAmyuR1T
	rkbjQ0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40Ab-00000000zx0-0mVV;
	Thu, 24 Oct 2024 15:54:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zsx-00000000w5q-3XW6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:36:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1A2E339;
	Thu, 24 Oct 2024 08:36:56 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D73ED3F528;
	Thu, 24 Oct 2024 08:36:25 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:36:23 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 34/37] KVM: arm64: Disable hierarchical permissions
 when POE is enabled
Message-ID: <20241024153623.GF1403933@e124191.cambridge.arm.com>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-35-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023145345.1613824-35-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_083627_953249_AAEBEBAC 
X-CRM114-Status: GOOD (  21.64  )
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

On Wed, Oct 23, 2024 at 03:53:42PM +0100, Marc Zyngier wrote:
> The hierarchical permissions must be disabled when POE is enabled
> in the translation regime used for a given table walk.
> 
> We store the two enable bits in the s1_walk_info structure so that
> they can be retrieved down the line, as they will be useful.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/at.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index ef1643faedeb4..8d1dc6327ec5b 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -24,6 +24,8 @@ struct s1_walk_info {
>  	unsigned int		txsz;
>  	int 	     		sl;
>  	bool	     		hpd;
> +	bool			e0poe;
> +	bool			poe;
>  	bool	     		be;
>  	bool	     		s2;
>  };
> @@ -110,6 +112,34 @@ static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
>  	}
>  }
>  
> +static void compute_s1poe(struct kvm_vcpu *vcpu, struct s1_walk_info *wi)
> +{
> +	u64 val;
> +
> +	if (!kvm_has_s1poe(vcpu->kvm)) {
> +		wi->poe = wi->e0poe = false;
> +		return;
> +	}
> +
> +	switch (wi->regime) {
> +	case TR_EL2:
> +	case TR_EL20:
> +		val = vcpu_read_sys_reg(vcpu, TCR2_EL2);
> +		wi->poe = val & TCR2_EL2_POE;
> +		wi->e0poe = (wi->regime == TR_EL20) && (val & TCR2_EL2_E0POE);
> +		break;
> +	case TR_EL10:
> +		if (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En) {
> +			wi->poe = wi->e0poe = false;
> +			return;
> +		}
> +
> +		val = __vcpu_sys_reg(vcpu, TCR2_EL1);
> +		wi->poe = val & TCR2_EL1x_POE;
> +		wi->e0poe = val & TCR2_EL1x_E0POE;
> +	}
> +}
> +
>  static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
>  			 struct s1_walk_result *wr, u64 va)
>  {
> @@ -206,6 +236,12 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
>  	/* R_JHSVW */
>  	wi->hpd |= s1pie_enabled(vcpu, wi->regime);
>  
> +	/* Do we have POE? */
> +	compute_s1poe(vcpu, wi);
> +
> +	/* R_BVXDG */
> +	wi->hpd |= (wi->poe || wi->e0poe);
> +
>  	/* Someone was silly enough to encode TG0/TG1 differently */
>  	if (va55) {
>  		wi->txsz = FIELD_GET(TCR_T1SZ_MASK, tcr);
> -- 
> 2.39.2
> 

