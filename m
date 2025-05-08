Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B2DC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQvMNdGghRdhkwCN/d8x54O0AAqTlClpAvSzYAbL8MQ=; b=Mn4UahTkvJ/AHEY/1PN9Uuculs
	KA3rc6qyy8uq2dsT8dLfMrOGy77k8snc/5HgkyHFjEhXSTVS6hEk9J2AwAo8Wh7TokYT/ieFsUI32
	w6gvoQj9efz7lte4AhfwCp22UyIOH8HG106Mdr72hYA190U13G4lunaOWBLRNI4vkF7MsZzZSUQXd
	E40HuQg00gBb7MbqR0Q/P7HB4GZO4lIgSgssLghYjWlnkzt1f4o05El5QLbxvEorYCJH1fLtHKJ0K
	/ZI7vWa/GA/D2OQ83fkqSpwofZHHNymLhViVo0Otjlyn/1cQ4u16V95pjALpPlmv6ybBYRj+gFC4S
	UMT8Gdlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2LE-00000000wqL-35t1;
	Thu, 08 May 2025 14:35:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1dO-00000000omk-3iXH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:50:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC540106F;
	Thu,  8 May 2025 06:49:45 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4038E3F58B;
	Thu,  8 May 2025 06:49:54 -0700 (PDT)
Date: Thu, 8 May 2025 14:49:48 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v4 27/43] KVM: arm64: Use computed FGT masks to setup FGT
 registers
Message-ID: <20250508134948.GA3256485@e124191.cambridge.arm.com>
References: <20250506164348.346001-1-maz@kernel.org>
 <20250506164348.346001-28-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506164348.346001-28-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_064959_010163_0C4D108A 
X-CRM114-Status: GOOD (  15.15  )
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

On Tue, May 06, 2025 at 05:43:32PM +0100, Marc Zyngier wrote:
> Flip the hyervisor FGT configuration over to the computed FGT
> masks.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 45 +++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 925a3288bd5be..e8645375499df 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -65,12 +65,41 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
>  	}
>  }
>  
> +#define reg_to_fgt_masks(reg)						\
> +	({								\
> +		struct fgt_masks *m;					\
> +		switch(reg) {						\
> +		case HFGRTR_EL2:					\
> +			m = &hfgrtr_masks;				\
> +			break;						\
> +		case HFGWTR_EL2:					\
> +			m = &hfgwtr_masks;				\
> +			break;						\
> +		case HFGITR_EL2:					\
> +			m = &hfgitr_masks;				\
> +			break;						\
> +		case HDFGRTR_EL2:					\
> +			m = &hdfgrtr_masks;				\
> +			break;						\
> +		case HDFGWTR_EL2:					\
> +			m = &hdfgwtr_masks;				\
> +			break;						\
> +		case HAFGRTR_EL2:					\
> +			m = &hafgrtr_masks;				\
> +			break;						\
> +		default:						\
> +			BUILD_BUG_ON(1);				\
> +		}							\
> +									\
> +		m;							\
> +	})
> +
>  #define compute_clr_set(vcpu, reg, clr, set)				\
>  	do {								\
> -		u64 hfg;						\
> -		hfg = __vcpu_sys_reg(vcpu, reg) & ~__ ## reg ## _RES0;	\

__vcpu_sys_reg() has done the ~RES0 part since 888f0880702 ("KVM: arm64: nv: Add sanitising to VNCR-backed sysregs"),
in case anyone else wondered where that part went!

> -		set |= hfg & __ ## reg ## _MASK; 			\
> -		clr |= ~hfg & __ ## reg ## _nMASK; 			\
> +		u64 hfg = __vcpu_sys_reg(vcpu, reg);			\
> +		struct fgt_masks *m = reg_to_fgt_masks(reg);		\
> +		set |= hfg & m->mask;					\
> +		clr |= ~hfg & m->nmask;					\
>  	} while(0)
>  
>  #define reg_to_fgt_group_id(reg)					\
> @@ -101,12 +130,14 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
>  #define compute_undef_clr_set(vcpu, kvm, reg, clr, set)			\
>  	do {								\
>  		u64 hfg = kvm->arch.fgu[reg_to_fgt_group_id(reg)];	\
> -		set |= hfg & __ ## reg ## _MASK;			\
> -		clr |= hfg & __ ## reg ## _nMASK; 			\
> +		struct fgt_masks *m = reg_to_fgt_masks(reg);		\
> +		set |= hfg & m->mask;					\
> +		clr |= hfg & m->nmask;					\
>  	} while(0)
>  
>  #define update_fgt_traps_cs(hctxt, vcpu, kvm, reg, clr, set)		\
>  	do {								\
> +		struct fgt_masks *m = reg_to_fgt_masks(reg);		\
>  		u64 c = clr, s = set;					\
>  		u64 val;						\
>  									\
> @@ -116,7 +147,7 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
>  									\
>  		compute_undef_clr_set(vcpu, kvm, reg, c, s);		\
>  									\
> -		val = __ ## reg ## _nMASK;				\
> +		val = m->nmask;						\
>  		val |= s;						\
>  		val &= ~c;						\
>  		write_sysreg_s(val, SYS_ ## reg);			\

