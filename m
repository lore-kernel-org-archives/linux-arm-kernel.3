Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C33AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDprwvx784Xc9BQVIPmW148jZZm4pST3tRcwvdQJB8o=; b=yTsKdPZPYVgCjNbf3d45jHYoLc
	WeouzWajhJCm/hPoYOr/sJvuLYcga0kUTTx4fCEXmR0OH8M7CthH9YGqAhDpvByY+qSwaYXjeTNx4
	CFtr3kOdppdklrfIWXhg0T1zG1YLzBDRR/0ZVh/LbB2VIMiGX79PfuUgemDQSxMUn93bUIxPRD1Ni
	IdEmPvp3SIDwIrYyjaNeNpOO7O6up3CFHYmgSVrASzsGdNzaBC4uqcju9EBUnSNUAZ1CAUhsBLgbO
	icFC7rFdwp4DunkhXc38oRvH/bjo3cOyOG8xMwqwM7eGgmDrjsQjp3DGEGN8WZS7i33G5nl4iFStk
	q9udJvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjakg-0000000BcKE-2dMm;
	Tue, 14 Jul 2026 10:52:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjake-0000000BcIy-1AiP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:52:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-475417f010dso1925948f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 03:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784026354; x=1784631154; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xDprwvx784Xc9BQVIPmW148jZZm4pST3tRcwvdQJB8o=;
        b=ipltmYAcBx/aZmieHLnB1OkGPz+Zjd2cVVF5PVpgKgFEjN6thujjBKXKYv+df04mUG
         dK4zx/qnU3/eYd9A/63oz7sgqx/zKJ9ue/aJ2mm4wIAXln+nscjJRfmyzP5/eWXr8/Ql
         BklNd0IJPyNVKUTW1yZIS/nKZUabje858eyAsxpY0rnvezpcaYhEx+BUWtxazjTSiYGB
         sLgSKT8dR0Ny7ixkyrlq+03+cuNLt92ySDVpVbEgiq3yAO/43L+/3U8C9W5iWT/dDpt1
         WovC6T/p5gmgNk8UOz7zJlvk9rTw+gn0cPCSmzoM6/85q+ADERaKMGY44BFQlY/jXetN
         6p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784026354; x=1784631154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDprwvx784Xc9BQVIPmW148jZZm4pST3tRcwvdQJB8o=;
        b=ls3v/P0r3D3GmTFXkW4E8H5uIAXLN6nnQzGQ05oJaJWvkHtni1tGtaS08uKv72Rhg0
         4nHypMtEB2E4C0MSJ2Eb6+gT/TDvbhJAOXT6eSzl1kLFpcIoXPoqHr+zL5CskVvvoweA
         rsz4pgvnC+UBbEkeUWmOaPOk6SJInwUInU00KPoe7i8sjfSlSKcjm/Eu9p6RnSfvsIHx
         xWcXsEmX6nUw4BAS9kNAhJLaVgcUBMiG3ngPD2vAfUZv/FUKT7ziJM8WPt2S+UoWM1gp
         ETAFvEDMYChvxplH6Qx16PHlF+dUuXBVP0wq8ZIV4CvDzt6UzGdqzEzWwMWrtfW1s5fm
         uCqw==
X-Forwarded-Encrypted: i=1; AHgh+Rrqb/m6CBOs/n4aoGhVRYS0F6tabgKcSYhsTuJmZvZ7NrfFnwxqUAIVqoJo1ZbZoIeBlvJc2sPUF5wjvTtKbH7O@lists.infradead.org
X-Gm-Message-State: AOJu0Yzic4f5H2cUHroIBz/nuO6ixFmtsJCZTq635+T8FT8Miada2Iir
	pBP6S21EgrfcFSEt/7A2IhRpKZZmwKM+L5brb8l14DwM/lIp6pzYCAR1TTy1yW6VLxFJtynoG8j
	hlI6zSw==
X-Gm-Gg: AfdE7cmyqDVtbeNgxk3IRsrOrLlAXiVqFrWKlOgNtrk3W78wiqD2xFPOQWQ56QHhGka
	XT0dH1A8MsLlSAfElrZCIosB0TKBy0bA84LrvY/F8Vnh5Irho2kDt9xaXeQFSgd+U2/c0W5ZSqU
	X4SIqeDcwp1be8phIOSeMh2ykMXoYKtENxIh8OmQ3r81iUDdsyOPfUki49Q2OKUJUL8esi4TITW
	NHq+SBYiZ4LeJFULVrp9MB0UluCCwSbHebR1ayEuJC+fbw89jNQWc5SfWHJ+KYMRQiAj5e0vvkY
	MQjHEMT0PZ/nmR3i1/T4elpQiAj0paYYrmYQtlqObhY3uYIRtM0+q+PGWgmrbQFuZrnKPE+Vx7b
	n14WIlXrEiz2ZVaOX4ypXR12TzBhyFHiYh4HxjCKxGt6TyckZHp1RCK+acAoA9v9AE/qx+qg00H
	NU/T9SmqM0yE1g2MyQNeC7qbZDpcbHDKTYVY+lJkubyP9LfHHGlnzKJHBXWbkzmg==
X-Received: by 2002:a05:6000:2388:b0:47d:ec60:657e with SMTP id ffacd0b85a97d-47f2dcecd20mr15005977f8f.39.1784026353902;
        Tue, 14 Jul 2026 03:52:33 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7e22sm7262049f8f.25.2026.07.14.03.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:52:33 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:52:29 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
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
	Hyunwoo Kim <imv4bel@gmail.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v5 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
Message-ID: <alYU7ScC3AI1_bi7@google.com>
References: <20260714101601.4142645-1-fuad.tabba@linux.dev>
 <20260714101601.4142645-3-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714101601.4142645-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_035236_392057_6E6A9A76 
X-CRM114-Status: GOOD (  27.93  )
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

On Tue, Jul 14, 2026 at 11:15:55AM +0100, Fuad Tabba wrote:
> The vcpu_{read,write}_sys_reg() accessors are only valid on a VHE host,
> so helpers built on them such as kvm_vcpu_set_be()/kvm_vcpu_is_be()
> cannot be shared with hyp code. exception.c already wraps them in local
> helpers that pick the host- or hyp-side accessor via has_vhe().
> 
> Rename the host-only implementations to __vcpu_{read,write}_sysreg_vhe()
> and turn vcpu_{read,write}_sys_reg() into the context-dispatching
> wrappers, so every caller gets the version valid in any context and a
> follow-up series can share that emulation code at EL2.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
> v5:
>   - Named the wrappers vcpu_{read,write}_sys_reg() and renamed the
>     host-only implementations to __vcpu_{read,write}_sysreg_vhe(), rather
>     than introducing a kvm_vcpu_ prefix. (Oliver)
>   - Dropped Vincent's Reviewed-by since the patch changed materially.
> 
>  arch/arm64/include/asm/kvm_emulate.h | 20 ++++++++++++++++
>  arch/arm64/include/asm/kvm_host.h    |  4 ++--
>  arch/arm64/kvm/hyp/exception.c       | 34 ++++++++--------------------
>  arch/arm64/kvm/sys_regs.c            |  4 ++--
>  4 files changed, 33 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 5bf3d7e1d92c7..429bda6f48d94 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -506,6 +506,26 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
>  	return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
>  }
>  
> +/*
> + * __vcpu_*_sysreg_vhe() are only valid on a VHE host; wrap them so the same
> + * call site also works at EL2 under nVHE.
> + */
> +static inline u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
> +{
> +	if (has_vhe())
> +		return __vcpu_read_sysreg_vhe(vcpu, reg);
> +
> +	return __vcpu_sys_reg(vcpu, reg);
> +}
> +
> +static inline void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
> +{
> +	if (has_vhe())
> +		__vcpu_write_sysreg_vhe(vcpu, val, reg);
> +	else
> +		__vcpu_assign_sys_reg(vcpu, reg, val);
> +}
> +
>  static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu_mode_is_32bit(vcpu)) {
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index bae2c4f92ef5c..f3c3c86b3d7fb 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1215,8 +1215,8 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
>  		__v;							\
>  	})
>  
> -u64 vcpu_read_sys_reg(const struct kvm_vcpu *, enum vcpu_sysreg);
> -void vcpu_write_sys_reg(struct kvm_vcpu *, u64, enum vcpu_sysreg);
> +u64 __vcpu_read_sysreg_vhe(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg);
> +void __vcpu_write_sysreg_vhe(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg);
>  
>  struct kvm_vm_stat {
>  	struct kvm_vm_stat_generic generic;
> diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
> index bef40ddb16dbc..754e2dc1df54a 100644
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
> +		vbar = vcpu_read_sys_reg(vcpu, VBAR_EL1);
> +		sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +		vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
>  		break;
>  	case PSR_MODE_EL2h:
> -		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL2);
> -		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL2);
> -		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
> +		vbar = vcpu_read_sys_reg(vcpu, VBAR_EL2);
> +		sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL2);
> +		vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
>  		break;
>  	default:
>  		/* Don't do that */
> @@ -185,7 +169,7 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>   */
>  static unsigned long get_except32_cpsr(struct kvm_vcpu *vcpu, u32 mode)
>  {
> -	u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +	u32 sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
>  	unsigned long old, new;
>  
>  	old = *vcpu_cpsr(vcpu);
> @@ -281,7 +265,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
>  {
>  	unsigned long spsr = *vcpu_cpsr(vcpu);
>  	bool is_thumb = (spsr & PSR_AA32_T_BIT);
> -	u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +	u32 sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
>  	u32 return_address;
>  
>  	*vcpu_cpsr(vcpu) = get_except32_cpsr(vcpu, mode);
> @@ -305,7 +289,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
>  	if (sctlr & (1 << 13))
>  		vect_offset += 0xffff0000;
>  	else /* always have security exceptions */
> -		vect_offset += __vcpu_read_sys_reg(vcpu, VBAR_EL1);
> +		vect_offset += vcpu_read_sys_reg(vcpu, VBAR_EL1);
>  
>  	*vcpu_pc(vcpu) = vect_offset;
>  }
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 08ba882799d48..c6a416974a61f 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -291,7 +291,7 @@ static void write_sr_to_cpu(enum vcpu_sysreg reg, u64 val)
>  	}
>  }
>  
> -u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
> +u64 __vcpu_read_sysreg_vhe(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
>  {
>  	struct sr_loc loc = {};
>  
> @@ -338,7 +338,7 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
>  	return __vcpu_sys_reg(vcpu, reg);
>  }
>  
> -void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
> +void __vcpu_write_sysreg_vhe(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
>  {
>  	struct sr_loc loc = {};
>  
> -- 
> 2.39.5
> 

