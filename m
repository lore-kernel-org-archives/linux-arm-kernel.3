Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7514606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gfFvQjFi;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZunZtklc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mlOAXyYl+wCSwFjSwdls3ikPBggXP2y2YoHiwugo+x4=; b=gfFvQjFiRWY6IjiElsPWMomdG+
	cffBqCHHdRhmsT7Qz1OrXr/5Mk+OxmWJw9AwZfXM0hrXi/uGL2jNMWO9ddh1TZE+cPv7avC4ix9RO
	zGrj1xNQMrHVjOXkNA9uio+96gyTvFfYEGx/IYyRosnSeqVTe9Op4iPsT4Q6N2efk6sg67FVnL6OI
	xLtwAUDmLGkY5QDMBS5jXgSDtv+1jpwCQpQNMWtSwP1j4h1Q5b3WagATHyDfZgOr7d1jOCiAnG4/F
	FxQUlBkO3/GA7YTiyQiEGiFQLe6biPFSpHzwqA9vWbLbWCQMxpwFWj8cLoP8MQmLHcRD/mASxHQ7K
	VrlBf5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKbG-00000003a8K-1MVp;
	Tue, 03 Nov 2026 19:55:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKbE-00000003a80-2Nun
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:55:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C62CD6022B;
	Tue,  3 Nov 2026 19:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08A61F000C1;
	Tue,  3 Nov 2026 19:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793735715;
	bh=mlOAXyYl+wCSwFjSwdls3ikPBggXP2y2YoHiwugo+x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZunZtklcP1hVQzPVLipG0Y7T3/UJdVI8F/SvGV67LRCyPsFbC49HyxLuVnndyOAOg
	 uJ4PC1R5b5DFWLCHYxD1g2F0khbMotPl6dM8Hozm1+do/oH1u69dN4c6C7mvWT/UGj
	 IA9FPLuq+mjX0DdCSwrwYmpZje8FjnaW0hMT+khw15HFRUdL5Vavz/M9TLV+ycLVHZ
	 hr8KhxufobrBTG68Jjz/7wFgk6AhuZ6Vjuwp0ya1bherhRHN48M+LYir7Th9z1zRsw
	 D91lrtOsmcPu2QTfkIdP8ZyyjTLwa4l0Iqqb5mnuZ/tCGDMUL1c4xRBetGHI5Y0A+W
	 w1/3w02AtoUOw==
Date: Tue, 3 Nov 2026 19:55:09 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org, James Morse <james.morse@arm.com>
Subject: Re: [RFC PATCH v7 25/28] KVM: arm64: at: Use callback for reading
 descriptor
Message-ID: <auo60KJX9O3o7mJT@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-26-alexandru.elisei@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-26-alexandru.elisei@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 03, 2026 at 05:06:20PM +0100, Alexandru Elisei wrote:
> Allow callers of __kvm_translate_va() to use a custom function for reading
> the translation table descriptor from guest memory. This will be useful for
> handling stage 2 faults reported by SPE, to map the stage 1 translation
> tables at stage 2.
>
> Suggested-by: James Morse <james.morse@arm.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

This is nice, only some nits here really. So, with those addressed, LGTM and:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/arm64/include/asm/kvm_nested.h |  7 +++++++
>  arch/arm64/kvm/at.c                 | 22 ++++++++++++++--------
>  arch/arm64/kvm/nested.c             |  7 ++++---
>  3 files changed, 25 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
> index 1ed708335809..d812137dcd9e 100644
> --- a/arch/arm64/include/asm/kvm_nested.h
> +++ b/arch/arm64/include/asm/kvm_nested.h
> @@ -350,8 +350,15 @@ struct s1_walk_filter {
>  	void	*priv;
>  };
>
> +typedef int (*read_desc_fn)(struct kvm_vcpu *, u64, u64 *,
> +			    struct s1_walk_info *);

NIT: This seems a little too generic I think.

Other function pointer types in asm/kvm_*.h are kvm_pgtable_*_t, so perhaps
something like kvm_s1_read_desc_fn_t?

> +
> +int kvm_vcpu_read_s1_desc(struct kvm_vcpu *vcpu, u64 pa, u64 *desc,
> +			  struct s1_walk_info *wi);
> +
>  struct s1_walk_info {
>  	struct s1_walk_filter	*filter;
> +	read_desc_fn		read_s1_desc;
>  	u64	     		baddr;
>  	enum trans_regime	regime;
>  	unsigned int		max_oa_bits;
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index 0926426b8798..6e77beced96c 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -224,6 +224,9 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  	unsigned int stride, x;
>  	bool va55, tbi, lva, upper_range;
>
> +	if (!wi->read_s1_desc)
> +		return -EINVAL;
> +

This might be a little too cautious, all the callers are in arch/arm64/kvm so
maybe fine to assume the right thing is done?

If not then this should probably be a WARN_ON_ONCE() or something, as it would
be a bug in the kernel code.

>  	va55 = va & BIT(55);
>  	upper_range = va55 && wi->regime != TR_EL2;
>
> @@ -427,8 +430,8 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  	return -EFAULT;
>  }
>
> -static int kvm_read_s1_desc(struct kvm_vcpu *vcpu, u64 pa, u64 *desc,
> -			    struct s1_walk_info *wi)
> +int kvm_vcpu_read_s1_desc(struct kvm_vcpu *vcpu, u64 pa, u64 *desc,

Hmm, why rename it? Seems a bit out of place.

> +			  struct s1_walk_info *wi)
>  {
>  	u64 val;
>  	int r;
> @@ -513,7 +516,7 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  				return ret;
>  		}
>
> -		ret = kvm_read_s1_desc(vcpu, ipa, &desc, wi);
> +		ret = wi->read_s1_desc(vcpu, ipa, &desc, wi);
>  		if (ret) {
>  			fail_s1_walk(wr, ESR_ELx_FSC_SEA_TTW(level), false);
>  			return ret;
> @@ -1324,6 +1327,7 @@ static int handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr, u64 *par)
>  	bool perm_fail = false;
>  	int ret, idx;
>
> +	wi.read_s1_desc = kvm_vcpu_read_s1_desc;
>  	wi.regime = compute_translation_regime(vcpu, op);
>  	wi.as_el0 = (op == OP_AT_S1E0R || op == OP_AT_S1E0W);
>  	wi.pan = (op == OP_AT_S1E1RP || op == OP_AT_S1E1WP) &&
> @@ -1657,9 +1661,10 @@ int __kvm_at_s12(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
>  }
>
>  /*
> - * Translate a VA for a given EL in a given translation regime, with
> - * or without PAN. This requires wi->{regime, as_el0, pan} to be
> - * set. The rest of the wi and wr should be 0-initialised.
> + * Translate a VA for a given EL in a given translation regime, with or without
> + * PAN. This requires wi->{regime, as_el0, pan, read_s1_desc} to be set.
> + * Setting wi->filter is optional. The rest of the wi and wr should be
> + * 0-initialised.
>   */
>  int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  		       struct s1_walk_result *wr, u64 va)
> @@ -1716,8 +1721,9 @@ int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
>  			.fn	= match_s1_desc,
>  			.priv	= &dm,
>  		},
> -		.as_el0	= false,
> -		.pan	= false,
> +		.read_s1_desc	= kvm_vcpu_read_s1_desc,
> +		.as_el0		= false,
> +		.pan		= false,
>  	};
>  	struct s1_walk_result wr = {};
>  	int ret;
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 17123f0b6dab..e3e71628f8c5 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1435,9 +1435,10 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
>  			invalidate_vncr(vcpu->kvm, vt);
>
>  		vt->wi = (struct s1_walk_info) {
> -			.regime	= TR_EL20,
> -			.as_el0	= false,
> -			.pan	= false,
> +			.read_s1_desc	= kvm_vcpu_read_s1_desc,
> +			.regime		= TR_EL20,
> +			.as_el0		= false,
> +			.pan		= false,
>  		};
>  		vt->wr = (struct s1_walk_result){};
>  	}
> --
> 2.43.0
>
>

--
Cheers, Lorenzo

