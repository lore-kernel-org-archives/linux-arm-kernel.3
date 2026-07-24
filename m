Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48773C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CRYtKAwXeZGM1gR9Z/9+X7fpSzKSvyzYdMLl3XlVdM=; b=tUOpdBatjAtxJVUww4gsLqmbtF
	qMjfgrfRz0xDMU1TQXM+7oVxy1JRPtkVb6rNBP1/hHSNYMG5NgeZVLw0C4Qa12558CSEr4bJrSQp2
	U7Q6fKeKjvm7uAyfThuKn8f5Y6V4xYY88WVFMzJbT9m13n30xsSJ15Rjf3FFx2KDPTyUV5xhP00IY
	V0XeHTrvjtoz9nml8jfRIHmrNt/a5K+BRc1uSAWudmLD9XoP6CEf7f6m4JgB0y22Ms7wsCDv7PK1m
	yoKVTFGKliFrcUaXK5MfxryYFCINO8Ya7n2131Q4kOlaWMF0yQS05HqJZuj1mDK/HbqSQlGCgG5Xp
	efoNZwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9Ac-0000000FZIC-09Qt;
	Fri, 24 Jul 2026 06:14:06 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9AZ-0000000FZGo-32sW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784873641; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=1CRYtKAwXeZGM1gR9Z/9+X7fpSzKSvyzYdMLl3XlVdM=;
	b=bTE4HN5PI30xJQC4R3FXWPpai/pxnKhv9Mq68EfBsgwKIxV5/WD8qWRlrjwvVik6iLqITVYmCtvUSPMPL7bjo8mGmGlCEyWFfvGvVYvJscxZqT4r/t0HoH8vMTvbFGdB9S9K0fhQP+0bvpc5RAHh8ZrkpOLoDquWAbbEvTJ1N3A=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7iDRbk_1784873640;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7iDRbk_1784873640 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 14:14:00 +0800
Date: Fri, 24 Jul 2026 14:13:59 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 18/28] KVM: arm64: Add kvm_has_nv{2,3}() predicates
Message-ID: <43cyajmghg4zw63hul4jx2clhtejlwmdi6srvqzgjajaopkwwi@ewdvwgvbitao>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-19-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-19-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_231403_916297_6DFD0FFD 
X-CRM114-Status: GOOD (  14.26  )
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

On Wed, Jul 22, 2026 at 08:42:24AM +0800, Marc Zyngier wrote:
> Add a new set of predicates indicating whether VM is capable of
> NV2, NV3, and is in a nested NV3 context.
>
> This is going to become useful as we start dealing with a mix of
> behaviours (NV2, NV3, NV2 on NV3...).
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_emulate.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 9831166695186..c562d8171d5e1 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -266,6 +266,26 @@ static inline bool vserror_state_is_nested(struct kvm_vcpu *vcpu)
>  	       (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TMEA);
>  }
>
> +static inline bool kvm_has_nv2(struct kvm *kvm)
> +{
> +	return (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT) &&
> +		kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY));
> +}
> +
> +static inline bool kvm_has_nv3(struct kvm *kvm)
> +{
> +	return (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT) &&
> +		cpus_have_final_cap(ARM64_HAS_NV3) &&

Minor: only check cpus_have_final_cap(ARM64_HAS_NV3) is enough ?

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

> +		kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV3));
> +}
> +
> +static inline bool is_nested_nv3_ctxt(struct kvm_vcpu *vcpu)
> +{
> +	return (has_vhe() && kvm_has_nv3(vcpu->kvm) && is_nested_ctxt(vcpu) &&
> +		(__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_EL2_NV) &&
> +		(__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_NVTGE));
> +}
> +
>  /*
>   * The layout of SPSR for an AArch32 state is different when observed from an
>   * AArch64 SPSR_ELx or an AArch32 SPSR_*. This function generates the AArch32
> --
> 2.47.3

