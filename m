Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002C8CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xtJLMfFE0UEqJ7Wmjx1QUTy4olzjIaKVy5B7F/r2gI=; b=l1OB8AkGrsdyexWWK7BBxcp8C9
	T6Tx1k17qIZqUJEkf4jL4wpFEHpLFsvwekfPvAymeB6wNbgqZ3zVg7km0dAnuMKiaWjdesyqeNFP+
	j5hj+jdNA6ScEEfzQwDsUYka1VpYmUnI4sS8iIPGZ6383iYpTnB+01jGJn+2Y3dNIH9z5G4oC9py3
	JYj/8dv+7F6GbAlrIpu1xZ70grZnm53mLJEAeRXxJh6prav7gKTBbenkbXcNxJc0REgCQcAPdcrEI
	dmLoMt/xoE2CdXlAcPhaxJbsPrDT+TOVb650N2CPUnWdF8BuPvlkCPta31uPqh3Dk1TPXQEZXvNjk
	TYCMznmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZFJ-00000002TtG-08cK;
	Fri, 19 Jun 2026 13:26:57 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZFG-00000002Tsv-2iBa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:26:55 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c074142cf6dso322265566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 06:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781875613; x=1782480413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/xtJLMfFE0UEqJ7Wmjx1QUTy4olzjIaKVy5B7F/r2gI=;
        b=szqMkJNmBoqjquR7SdCR+GVHGQ/BC0lD281441EUzp8KsPWoWy0XOLr0qCAspNVK0j
         Cr+DIwELqDPBgD8svoxD8vXbrNqcOOrhZZ/xyrMllnWBRM4SKL84eVEsZDr3qJKP4lQN
         kijnywGwRuA0c6sc8GK7BtU3qvmGnk74t3lKg82xajNmuDiWBQ4jfpwd8AYVykvA56Hn
         c+FsFo/ArJU+9h5VRYftqCar6P8r1XPw31Ivi/ZOTvMfLHiD9cGmN4rDqBmfKPnPiMnG
         z0/fnqDwb9xPspYnbFQvc0OzDO0Q34/X6EWsEzAUEv9TBKkeIBscZmWt2AoTFSQSi0XX
         QAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781875613; x=1782480413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xtJLMfFE0UEqJ7Wmjx1QUTy4olzjIaKVy5B7F/r2gI=;
        b=kBIoGJe9MIcYLntL/U5VUbxOwhtIM9HhCrxSAJOoTuKIXmpmKPlC9TtuJaaW2WWq+S
         QME3iEeCE/r1TBTBTA5J4t8KH/1HoImxRZLSdbLYvdIjrZlRfjdg2PT8Vw8vu/Jmg2et
         CYYQ++TyAqmC+EZsueTkKAhnNqpKu/6HCHjqetQic/PZxHlDW+LCCltVymafP72Xu3m/
         h3w7jwBYuLSOaBlUSid2fitGovdCdAxLzcfE3KNUsRb9nYisLM1IneC+KikWxwHSNlsD
         c2uQyJTZfWB3Xo/WXFpKYA7hmozm3JHBfKtb0300wFFeLATeIh4zAj8loDoQiRnNlmwU
         FFig==
X-Forwarded-Encrypted: i=1; AFNElJ86xAwlWOjP6h7LK7S02jgaOvMwgRiUtzhpOuJW5YJoDMUSmVD2M+twjadD+aOtbjMhgspnHpbIfGIskwYzpZ3w@lists.infradead.org
X-Gm-Message-State: AOJu0YwLUam4lzzZn7JmEzAUlXiFCkue9a+2KzHLofqBrSM0YU4JwzYu
	V85llfNPVYouf4shpJNy02v+fvbtou2tlTymbh/fUhe82t9cexzou8ZCJNxgTTfjObITaKWOxxX
	OF05KRA==
X-Gm-Gg: AfdE7cmm+1Z/5znkwwe84cTiguZmLrgcUMdLHNwRUWIJduh09tqI57D8nIL9WurlYEB
	2KRgaqlLYVDhnVw+ulkWY1EcjcI04FWTai6XZtmhn/oci8AnunaMRR99w590NZXO1yrjDZPfVvC
	xqV+HUqdEjU4fbYH6wygIbB0AZilp1I4SKImyYI1resqOHkRJ+vbzQ7kcvZYtQJIHKt3/ej6TsV
	U0Bw8x+SbHVA6EkKgOyqwnlERY2HHnFZcX7vkxe4rK4H9QCE+DMsuzC19IFoF/3Upc+UNkgsmRs
	Yu1+7WyScae5/hN1I48VR6AJzwJhoNTTFsC1865+tAykCRbI2Y+W4y5Thor41ytWAg877xbcnr/
	JeYX/+1UvnfpuiUEXQMCHsZaBYn7wODoc1RBxIfJOYmmqPZJpw4a3pzN+qIRNUVjmJjP6lTRz7I
	l4dhWAuzP/lMzk1RWjDOjaI2u3hoEQzIavzYDKKLM87rcVfjt0txIiCq2/
X-Received: by 2002:a05:600c:3f18:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-49240a34529mr47337995e9.11.1781875601104;
        Fri, 19 Jun 2026 06:26:41 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240f054e3sm57555245e9.2.2026.06.19.06.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:26:38 -0700 (PDT)
Date: Fri, 19 Jun 2026 14:26:34 +0100
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
Subject: Re: [PATCH v2 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
Message-ID: <ajVDijsleEVAV-ss@google.com>
References: <20260619070719.812227-1-tabba@google.com>
 <20260619070719.812227-3-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619070719.812227-3-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_062654_709573_B84DC0F7 
X-CRM114-Status: GOOD (  23.18  )
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

On Fri, Jun 19, 2026 at 08:07:13AM +0100, Fuad Tabba wrote:
> The vcpu_{read,write}_sys_reg() accessors are host-only, so helpers
> built on them such as kvm_vcpu_set_be()/kvm_vcpu_is_be() cannot be
> shared with hyp code. exception.c already wraps them in
> __vcpu_{read,write}_sys_reg(), which pick the host- or hyp-side accessor
> via has_vhe() and so are valid in any context.
> 
> Move those wrappers to kvm_emulate.h as kvm_vcpu_{read,write}_sys_reg()
> and switch the callers over, so a follow-up series can share that
> emulation code at EL2.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/include/asm/kvm_emulate.h | 22 +++++++++++++++---
>  arch/arm64/kvm/hyp/exception.c       | 34 ++++++++--------------------
>  2 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 5bf3d7e1d92c..80b30fead3d1 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -506,6 +506,22 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
>  	return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
>  }
>  
> +static inline u64 kvm_vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
> +{
> +	if (has_vhe())
> +		return vcpu_read_sys_reg(vcpu, reg);
> +
> +	return __vcpu_sys_reg(vcpu, reg);
> +}
> +
> +static inline void kvm_vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
> +{
> +	if (has_vhe())
> +		vcpu_write_sys_reg(vcpu, val, reg);
> +	else
> +		__vcpu_assign_sys_reg(vcpu, reg, val);
> +}
> +
>  static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu_mode_is_32bit(vcpu)) {
> @@ -516,9 +532,9 @@ static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
>  
>  		r = vcpu_has_nv(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
>  
> -		sctlr = vcpu_read_sys_reg(vcpu, r);
> +		sctlr = kvm_vcpu_read_sys_reg(vcpu, r);
>  		sctlr |= SCTLR_ELx_EE;
> -		vcpu_write_sys_reg(vcpu, sctlr, r);
> +		kvm_vcpu_write_sys_reg(vcpu, sctlr, r);
>  	}
>  }
>  
> @@ -533,7 +549,7 @@ static inline bool kvm_vcpu_is_be(struct kvm_vcpu *vcpu)
>  	r = is_hyp_ctxt(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
>  	bit = vcpu_mode_priv(vcpu) ? SCTLR_ELx_EE : SCTLR_EL1_E0E;
>  
> -	return vcpu_read_sys_reg(vcpu, r) & bit;
> +	return kvm_vcpu_read_sys_reg(vcpu, r) & bit;
>  }
>  
>  static inline unsigned long vcpu_data_guest_to_host(struct kvm_vcpu *vcpu,
> diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
> index bef40ddb16db..2cb68dc7d441 100644
> --- a/arch/arm64/kvm/hyp/exception.c
> +++ b/arch/arm64/kvm/hyp/exception.c
> @@ -20,22 +20,6 @@
>  #error Hypervisor code only!
>  #endif
>  
> -static inline u64 __vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
> -{
> -	if (has_vhe())
> -		return vcpu_read_sys_reg(vcpu, reg);
> -
> -	return __vcpu_sys_reg(vcpu, reg);
> -}
> -
> -static inline void __vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
> -{
> -	if (has_vhe())
> -		vcpu_write_sys_reg(vcpu, val, reg);
> -	else
> -		__vcpu_assign_sys_reg(vcpu, reg, val);
> -}
> -
>  static void __vcpu_write_spsr(struct kvm_vcpu *vcpu, unsigned long target_mode,
>  			      u64 val)
>  {
> @@ -101,14 +85,14 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>  
>  	switch (target_mode) {
>  	case PSR_MODE_EL1h:
> -		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL1);
> -		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> -		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
> +		vbar = kvm_vcpu_read_sys_reg(vcpu, VBAR_EL1);
> +		sctlr = kvm_vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +		kvm_vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
>  		break;
>  	case PSR_MODE_EL2h:
> -		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL2);
> -		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL2);
> -		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
> +		vbar = kvm_vcpu_read_sys_reg(vcpu, VBAR_EL2);
> +		sctlr = kvm_vcpu_read_sys_reg(vcpu, SCTLR_EL2);
> +		kvm_vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
>  		break;
>  	default:
>  		/* Don't do that */
> @@ -185,7 +169,7 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>   */
>  static unsigned long get_except32_cpsr(struct kvm_vcpu *vcpu, u32 mode)
>  {
> -	u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +	u32 sctlr = kvm_vcpu_read_sys_reg(vcpu, SCTLR_EL1);
>  	unsigned long old, new;
>  
>  	old = *vcpu_cpsr(vcpu);
> @@ -281,7 +265,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
>  {
>  	unsigned long spsr = *vcpu_cpsr(vcpu);
>  	bool is_thumb = (spsr & PSR_AA32_T_BIT);
> -	u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +	u32 sctlr = kvm_vcpu_read_sys_reg(vcpu, SCTLR_EL1);
>  	u32 return_address;
>  
>  	*vcpu_cpsr(vcpu) = get_except32_cpsr(vcpu, mode);
> @@ -305,7 +289,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
>  	if (sctlr & (1 << 13))
>  		vect_offset += 0xffff0000;
>  	else /* always have security exceptions */
> -		vect_offset += __vcpu_read_sys_reg(vcpu, VBAR_EL1);
> +		vect_offset += kvm_vcpu_read_sys_reg(vcpu, VBAR_EL1);
>  
>  	*vcpu_pc(vcpu) = vect_offset;
>  }
> -- 
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
> 

