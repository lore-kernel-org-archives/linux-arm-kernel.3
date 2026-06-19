Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5392CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TpHNc6do1SKJbtgxSVn8RTCsd27hNGE1sd8vLk5+cE=; b=FZAKrsA+8Sc2CjyXqLjuCx/tP5
	a7Oy0/7R1q/WUwFRQ9p4Qpcg8mLr0hRQqrMjo8zlWH6RdJq7IlArtYhm3vAvB395ZMCsrVCSJxcKm
	5yV9Ut/NMi6lRoKMdheYoDsr1boXdDcsPPJKVOHIIajzGZB7bE8kwxEfjcnxWMDGNNkzDsz0Q5yvs
	/+fFgHNc5GSgOG+LZ3iKh66t6lsAnMJ++xnHs+tD71votcCUPLEK3L/EaEfJcES9PFHlU8RDdw1YV
	+cYrIrwci51Fsm0bSKQLlvFABOIGdmURvnDyWlCYpxuDzlUhLPvS7pWjgP1iyfjra+FYEhqUUz006
	jak4fg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZJD-00000002UGG-0SxJ;
	Fri, 19 Jun 2026 13:30:59 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZJA-00000002UFp-1UNc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:30:57 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c07fd4dc2c8so200490366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781875854; x=1782480654; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3TpHNc6do1SKJbtgxSVn8RTCsd27hNGE1sd8vLk5+cE=;
        b=j/9+DUQ/tf/5FCrx0LorkpXOF1qbMDsRYXwisaRriAypKQfF9z2d6VRdvFSa2/3Lfi
         vN3ONvQ4pw/cQmTAQo84hgWdehGRhZQ50ci9kmNYqIvRC7vyzlgjAvceMriQvoKh68nI
         D4W4G2Ky3kaVAJ5+cw2qAtHtpPxvCFVLXsWF8gcEAG3/4TC4H+YCeDyfYjzEoqBGl9uu
         QNiWqVlUHNVfVeASOCU7jFaMoy5Ehj0s4Ox7mny3HtWlXOcLHZ0yxhqGkgWGd0Rxnz+1
         0LBGwd3pNaoZmYLn8YrSM7v9umFNJEUm7lyZm8ZKiUnE3ybl3POatsg3huNXmxj2f8qt
         sDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781875854; x=1782480654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TpHNc6do1SKJbtgxSVn8RTCsd27hNGE1sd8vLk5+cE=;
        b=qc2L0US3/vLsk0Vvt4LX7LO2s4r8hoR6gZO2ow48n9rRnMLYLBB67E6GiZp7Ka1DaQ
         SHC7zxLDtaMHUpRDLGuE218SmggYPH1MJRIaFwxecZjaTpthBXa1QLn/ZrtHlwnPcCQe
         RuYIk0sI9/kj94bdSMMVSNhdKxTH+avl1cnvkbt1trF/slRhLEu60HcMnwHmNm/dJdmO
         Pr3GFXHsNt7x0T+z54n0Dacqv97+QPBbqw662Rl6UOPoGNaqKGstKZMknfQcJRlgsndO
         jhEBcMy/C5D1TqT+OAvMc8ZsCXm2GzA4tergsYFep63Ij8ubKIplMP2YVG3U3Bf5D4xL
         mnBA==
X-Forwarded-Encrypted: i=1; AFNElJ/q1kmNUZq9hCUfPsrByevULpVtIqb3T8oMQIozTa2cSmJEMAvKpLCXKcWAZt8/XxoClyOBNzuZGGTh6eNpl16H@lists.infradead.org
X-Gm-Message-State: AOJu0YyZDZu7iTT7Vx8yioAZFQpEiowZRxRcVxkaUntBaDOgI2jRMQ3f
	3DnpQwJNQu4e5YC1H9lglzWK2DwfVlKhKukUBiPHzG4N6YgZ9YnkF7eo2HRr3BPAgg==
X-Gm-Gg: AfdE7cnrcfrNzOIInaJe4i24xiiFajneCqraYFutLklAyBjtxRYV9vRUvGUro7p3BO4
	Qk3iiZKz7jxfthTjlnvojPLiT6K/7vDtKbW+hyIMaFsB7OcrbY13XIi4MbE36bFypdwsJtWciY+
	NAImPbio5HOvg4JF+XPw2DbG8F3YU7G2bU10LZs0p3gv25GISn85YzHFX83ysvNX6JLe2FErVym
	rhQV+y458dTwEskRGh1ezHI7qLnaAdSlNvfpY7guaudhVONJHrKJDD2h3fJqa37cxvd1HPwehlc
	pM+CMKgynNI1ttWqfNE1V4k4YTGMRrb5+F1beYHCdskX9uN+Abc9c3HiF85lsRJtP1mZ+TFgNgB
	gJX+GNfNn0btIh2vyEkaXu3UuWq9URR3HIuLjqd4XKwcq0zfXM5/apy++t1nzAZXDLXN9ed72OV
	v2hla0h8zMplrVsi71rrH8AaDfoVPzkxebhLHv2Hvl4E1GixB9HJ9Aix1C
X-Received: by 2002:a17:907:c1b:b0:bab:e742:aba with SMTP id a640c23a62f3a-c097ccbfcaamr195069766b.42.1781875853661;
        Fri, 19 Jun 2026 06:30:53 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650c115fd8sm8260734f8f.35.2026.06.19.06.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:30:52 -0700 (PDT)
Date: Fri, 19 Jun 2026 14:30:48 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: Re: [PATCH v2 4/8] KVM: arm64: Move PSCI helper functions to a
 shared header
Message-ID: <ajVEiM3QJfcEabbt@google.com>
References: <20260619070719.812227-1-tabba@google.com>
 <20260619070719.812227-5-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619070719.812227-5-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_063056_418524_CD22882C 
X-CRM114-Status: GOOD (  25.23  )
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

On Fri, Jun 19, 2026 at 08:07:15AM +0100, Fuad Tabba wrote:
> Move kvm_psci_valid_affinity() and kvm_psci_narrow_to_32bit() from
> psci.c to include/kvm/arm_psci.h, and move psci_affinity_mask() there
> too, renaming it kvm_psci_affinity_mask() now that it is no longer
> file-local. A follow-up series handles some protected-guest PSCI calls
> at EL2 using these helpers.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/psci.c  | 30 +-----------------------------
>  include/kvm/arm_psci.h | 27 +++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> index 3b5dbe9a0a0e..e3db84400d1f 100644
> --- a/arch/arm64/kvm/psci.c
> +++ b/arch/arm64/kvm/psci.c
> @@ -21,16 +21,6 @@
>   * as described in ARM document number ARM DEN 0022A.
>   */
>  
> -#define AFFINITY_MASK(level)	~((0x1UL << ((level) * MPIDR_LEVEL_BITS)) - 1)
> -
> -static unsigned long psci_affinity_mask(unsigned long affinity_level)
> -{
> -	if (affinity_level <= 3)
> -		return MPIDR_HWID_BITMASK & AFFINITY_MASK(affinity_level);
> -
> -	return 0;
> -}
> -
>  static unsigned long kvm_psci_vcpu_suspend(struct kvm_vcpu *vcpu)
>  {
>  	/*
> @@ -51,12 +41,6 @@ static unsigned long kvm_psci_vcpu_suspend(struct kvm_vcpu *vcpu)
>  	return PSCI_RET_SUCCESS;
>  }
>  
> -static inline bool kvm_psci_valid_affinity(struct kvm_vcpu *vcpu,
> -					   unsigned long affinity)
> -{
> -	return !(affinity & ~MPIDR_HWID_BITMASK);
> -}
> -
>  static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
>  {
>  	struct vcpu_reset_state *reset_state;
> @@ -135,7 +119,7 @@ static unsigned long kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
>  		return PSCI_RET_INVALID_PARAMS;
>  
>  	/* Determine target affinity mask */
> -	target_affinity_mask = psci_affinity_mask(lowest_affinity_level);
> +	target_affinity_mask = kvm_psci_affinity_mask(lowest_affinity_level);
>  	if (!target_affinity_mask)
>  		return PSCI_RET_INVALID_PARAMS;
>  
> @@ -220,18 +204,6 @@ static void kvm_psci_system_suspend(struct kvm_vcpu *vcpu)
>  	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
>  }
>  
> -static void kvm_psci_narrow_to_32bit(struct kvm_vcpu *vcpu)
> -{
> -	int i;
> -
> -	/*
> -	 * Zero the input registers' upper 32 bits. They will be fully
> -	 * zeroed on exit, so we're fine changing them in place.
> -	 */
> -	for (i = 1; i < 4; i++)
> -		vcpu_set_reg(vcpu, i, lower_32_bits(vcpu_get_reg(vcpu, i)));
> -}
> -
>  static unsigned long kvm_psci_check_allowed_function(struct kvm_vcpu *vcpu, u32 fn)
>  {
>  	/*
> diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
> index cbaec804eb83..f86a006d6713 100644
> --- a/include/kvm/arm_psci.h
> +++ b/include/kvm/arm_psci.h
> @@ -38,6 +38,33 @@ static inline int kvm_psci_version(struct kvm_vcpu *vcpu)
>  	return KVM_ARM_PSCI_0_1;
>  }
>  
> +/* Narrow the PSCI register arguments (r1 to r3) to 32 bits. */
> +static inline void kvm_psci_narrow_to_32bit(struct kvm_vcpu *vcpu)
> +{
> +	int i;
> +
> +	/*
> +	 * Zero the input registers' upper 32 bits. They will be fully
> +	 * zeroed on exit, so we're fine changing them in place.
> +	 */
> +	for (i = 1; i < 4; i++)
> +		vcpu_set_reg(vcpu, i, lower_32_bits(vcpu_get_reg(vcpu, i)));
> +}
> +
> +static inline bool kvm_psci_valid_affinity(struct kvm_vcpu *vcpu,
> +					   unsigned long affinity)
> +{
> +	return !(affinity & ~MPIDR_HWID_BITMASK);
> +}
> +
> +static inline unsigned long kvm_psci_affinity_mask(unsigned long affinity_level)
> +{
> +	if (affinity_level <= 3)
> +		return MPIDR_HWID_BITMASK &
> +			~((0x1UL << (affinity_level * MPIDR_LEVEL_BITS)) - 1);
> +
> +	return 0;
> +}
>  
>  int kvm_psci_call(struct kvm_vcpu *vcpu);
>  
> -- 
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
> 

