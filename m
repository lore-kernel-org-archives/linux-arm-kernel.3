Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE66CE8E78
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lW/PpQWciz9P/07CFd1G1m93O3sZPBZshWn+upuy42U=; b=0uH67awbFH79o6WdIgBqFwRJyY
	5RnNDlUC9bg5vMT5EFkxNbxXCWNxzKEjBKVO/TpY/LTlLwekNOK1E/ouFbq0Crl0YoVv/2IjD0KeU
	GFDBsXdkV8xrVjobyHKY/EF9NTWfj++JCFpwOGrwMKOiPD3eyf3/O+Wz2/NVAkyYdHRZzUMG34Hn3
	2Pt0yaKGa6XbqkzBEM5YcbH+ho5/80gCQ2+iPy05SBZ8dfOO/OpWBgv9g66OYAasNzebR4vf+lqER
	FPp0lG1/+nwdp9/GTJOGlldSLA+ic2mUufv3TqRullbrNCukKiESGQ4ti5yZ/6MJ7mKVz2+CN91T2
	0yqAGIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yOg-00000000bOr-1xM2;
	Thu, 24 Oct 2024 14:01:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yN7-00000000bGC-2SE6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 13:59:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EBA2339;
	Thu, 24 Oct 2024 06:59:58 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72FAB3F528;
	Thu, 24 Oct 2024 06:59:27 -0700 (PDT)
Date: Thu, 24 Oct 2024 14:59:25 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 21/37] KVM: arm64: Implement AT S1PIE support
Message-ID: <20241024135925.GB1403933@e124191.cambridge.arm.com>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-22-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023145345.1613824-22-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_065929_815641_D0624D66 
X-CRM114-Status: GOOD (  24.63  )
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

On Wed, Oct 23, 2024 at 03:53:29PM +0100, Marc Zyngier wrote:
> It doesn't take much effort to implement S1PIE support in AT.
> 
> It is only a matter of using the AArch64.S1IndirectBasePermissions()
> encodings for the permission, ignoring GCS which has no impact on AT,
> and enforce FEAT_PAN3 being enabled as this is a requirement of
> FEAT_S1PIE.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/at.c | 117 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index f5bd750288ff5..3d93ed1795603 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -781,6 +781,9 @@ static bool pan3_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
>  	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR1_EL1, PAN, PAN3))
>  		return false;
>  
> +	if (s1pie_enabled(vcpu, regime))
> +		return true;
> +
>  	if (regime == TR_EL10)
>  		sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
>  	else
> @@ -862,11 +865,123 @@ static void compute_s1_hierarchical_permissions(struct kvm_vcpu *vcpu,
>  	}
>  }
>  
> +#define perm_idx(v, r, i)	((vcpu_read_sys_reg((v), (r)) >> ((i) * 4)) & 0xf)
> +
> +#define set_priv_perms(wr, r, w, x)	\
> +	do {				\
> +		(wr)->pr = (r);		\
> +		(wr)->pw = (w);		\
> +		(wr)->px = (x);		\
> +	} while (0)
> +
> +#define set_unpriv_perms(wr, r, w, x)	\
> +	do {				\
> +		(wr)->ur = (r);		\
> +		(wr)->uw = (w);		\
> +		(wr)->ux = (x);		\
> +	} while (0)
> +
> +/* Similar to AArch64.S1IndirectBasePermissions(), without GCS  */
> +#define set_perms(w, wr, ip)						\
> +	do {								\
> +		/* R_LLZDZ */						\
> +		switch ((ip)) {						\
> +		case 0b0000:						\
> +			set_ ## w ## _perms((wr), false, false, false);	\
> +			break;						\
> +		case 0b0001:						\
> +			set_ ## w ## _perms((wr), true , false, false);	\
> +			break;						\
> +		case 0b0010:						\
> +			set_ ## w ## _perms((wr), false, false, true );	\
> +			break;						\
> +		case 0b0011:						\
> +			set_ ## w ## _perms((wr), true , false, true );	\
> +			break;						\
> +		case 0b0100:						\
> +			set_ ## w ## _perms((wr), false, false, false);	\
> +			break;						\
> +		case 0b0101:						\
> +			set_ ## w ## _perms((wr), true , true , false);	\
> +			break;						\
> +		case 0b0110:						\
> +			set_ ## w ## _perms((wr), true , true , true );	\
> +			break;						\
> +		case 0b0111:						\
> +			set_ ## w ## _perms((wr), true , true , true );	\
> +			break;						\
> +		case 0b1000:						\
> +			set_ ## w ## _perms((wr), true , false, false);	\
> +			break;						\
> +		case 0b1001:						\
> +			set_ ## w ## _perms((wr), true , false, false);	\
> +			break;						\
> +		case 0b1010:						\
> +			set_ ## w ## _perms((wr), true , false, true );	\
> +			break;						\
> +		case 0b1011:						\
> +			set_ ## w ## _perms((wr), false, false, false);	\
> +			break;						\
> +		case 0b1100:						\
> +			set_ ## w ## _perms((wr), true , true , false);	\
> +			break;						\
> +		case 0b1101:						\
> +			set_ ## w ## _perms((wr), false, false, false);	\
> +			break;						\
> +		case 0b1110:						\
> +			set_ ## w ## _perms((wr), true , true , true );	\
> +			break;						\
> +		case 0b1111:						\
> +			set_ ## w ## _perms((wr), false, false, false);	\
> +			break;						\
> +		}							\
> +	} while (0)
> +
> +static void compute_s1_indirect_permissions(struct kvm_vcpu *vcpu,
> +					    struct s1_walk_info *wi,
> +					    struct s1_walk_result *wr)
> +{
> +	u8 up, pp, idx;
> +
> +	idx = pte_pi_index(wr->desc);
> +
> +	switch (wi->regime) {
> +	case TR_EL10:
> +		pp = perm_idx(vcpu, PIR_EL1, idx);
> +		up = perm_idx(vcpu, PIRE0_EL1, idx);
> +		break;
> +	case TR_EL20:
> +		pp = perm_idx(vcpu, PIR_EL2, idx);
> +		up = perm_idx(vcpu, PIRE0_EL2, idx);
> +		break;
> +	case TR_EL2:
> +		pp = perm_idx(vcpu, PIR_EL2, idx);
> +		up = 0;
> +		break;
> +	}

There seems to be inconsistent use of

default:
	BUG();

when switching on wi->regime.

> +
> +	set_perms(priv, wr, pp);
> +
> +	if (wi->regime != TR_EL2)
> +		set_perms(unpriv, wr, up);
> +	else
> +		set_unpriv_perms(wr, false, false, false);

When regime == TR_EL2, up == 0, so the if/else should do the same thing? Maybe
you've done that intentionally to be more explicit.

Either way:

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> +
> +	/* R_VFPJF */
> +	if (wr->px && wr->uw) {
> +		set_priv_perms(wr, false, false, false);
> +		set_unpriv_perms(wr, false, false, false);
> +	}
> +}
> +
>  static void compute_s1_permissions(struct kvm_vcpu *vcpu, u32 op,
>  				   struct s1_walk_info *wi,
>  				   struct s1_walk_result *wr)
>  {
> -	compute_s1_direct_permissions(vcpu, wi, wr);
> +	if (!s1pie_enabled(vcpu, wi->regime))
> +		compute_s1_direct_permissions(vcpu, wi, wr);
> +	else
> +		compute_s1_indirect_permissions(vcpu, wi, wr);
>  
>  	if (!wi->hpd)
>  		compute_s1_hierarchical_permissions(vcpu, wi, wr);

Thanks,
Joey

