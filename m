Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A35C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zgk872CgQmAHV14Qfyxg/FEnkqmHGMnxfF1BBY1yrA=; b=h11AZOqXBl02tuM+kqXzhwGDlP
	mBKrxGgmZyAAIStF6GEidmb2nS/VslgiwoBxpbx2q7zM1UZ4nZHlUeAyzC0oDv2yqaJHeTj8pRRb2
	o1VrG7mB16KrdCcOfMN/OKLc+RA1xEvtTtc3jyoR4kvn9/3qUz22GrOZFp49OLDmSSchiZ5vSOVjU
	+sKVP9PO+nDYehAB71U17L+5geteYR+/OkW7WQycvHHw+rznnCiqL05A55WPrRntxv5yZIR7ejlwd
	CLsLfe5I1QtdWPeVn9BseKRPJ1gBKcjfyB4zniecBA66QYs+oh0DIbHizKp/vUI5BvfRf/AsCeorE
	rjQ0Sr6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Y9Q-00000001ANq-2xJ9;
	Mon, 21 Sep 2026 07:09:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Y9P-00000001ANi-0tkl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:09:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2BCB41FC1;
	Mon, 21 Sep 2026 07:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDF11F000FF;
	Mon, 21 Sep 2026 07:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789974558;
	bh=7zgk872CgQmAHV14Qfyxg/FEnkqmHGMnxfF1BBY1yrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ifECKoSlHbavrN+0+bCRxvFwjygcAWnLw2r6GesTzN6CMULnk1vSJX+4nqfVCL4RB
	 zLPinjhdhuz85QTjxp47XNBB6Nd5e3dDVvKIQ65AvYi4GTWXQ5XL8sMm881IVpW2hj
	 s5VqgOyodRr+tYDDYo+hcXJmvQVrgXmRQ7sX//CzMjnDIB17DppiJnz+GANEFLwz2C
	 feTy7h5vyRQZLjGPOXyzPC5+3SB4Ps/DsbY05LAmdA0C5uC2Vp4het7qNxj9bS6IdV
	 AqGSvpfZbLfXEejSDqN1cxPGv8LBT826V5eONP8BbYI6u5Ryg+KD+FtfJfd/LHJT0V
	 TZHHQpt+rx0FQ==
Date: Mon, 21 Sep 2026 00:09:17 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Jack Thomson <jackabt@amazon.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2] KVM: arm64: Restore the VM's feature bitmap when
 kvm_setup_vcpu() fails
Message-ID: <arDYHSlFHm_XzGvN@kernel.org>
References: <20260921063718.1604533-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921063718.1604533-1-fuad.tabba@linux.dev>
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

Hi Fuad,

On Mon, Sep 21, 2026 at 07:37:18AM +0100, Fuad Tabba wrote:
> __kvm_vcpu_set_target() copies the requested features into the VM-wide
> bitmap before kvm_setup_vcpu() runs and doesn't undo it when setup
> fails, so a rejected KVM_ARM_VCPU_INIT leaves the VM recording features
> that were never set up. With HAS_EL2 | HAS_EL2_E2H0 on a host without
> FEAT_NV1, kvm_vcpu_init_nested() returns -EINVAL before it allocates any
> nested stage-2 MMU, and vcpu_has_nv() is then true with
> nested_mmus_size == 0; its -ENOMEM paths do the same on a VM's first
> INIT.
> 
> Nothing in the tree loads a vCPU whose init failed, so this is latent.
> The upcoming series that enables KVM_PRE_FAULT_MEMORY for arm64 exposes
> it: the generic kvm_vcpu_pre_fault_memory() calls vcpu_load() whether
> or not the vCPU has been initialised.

That's a bug, not a feature. We should require an initialized vcpu for
the ioctl.

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index eaf583b771931..b25725f91c925 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1685,6 +1685,7 @@ static int kvm_setup_vcpu(struct kvm_vcpu *vcpu)
>  static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>  				 const struct kvm_vcpu_init *init)
>  {
> +	DECLARE_BITMAP(old_features, KVM_VCPU_MAX_FEATURES);
>  	unsigned long features = init->features[0];
>  	struct kvm *kvm = vcpu->kvm;
>  	int ret = -EINVAL;
> @@ -1695,11 +1696,15 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>  	    kvm_vcpu_init_changed(vcpu, init))
>  		goto out_unlock;
>  
> +	/* Setup reads the VM-wide bitmap, so undo the copy if setup fails. */
> +	bitmap_copy(old_features, kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
>  	bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
>  
>  	ret = kvm_setup_vcpu(vcpu);
> -	if (ret)
> +	if (ret) {
> +		bitmap_copy(kvm->arch.vcpu_features, old_features, KVM_VCPU_MAX_FEATURES);
>  		goto out_unlock;
> +	}

The bitmap copy is a bit confusing because there's only two possible
situations:

 - KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED is unset and the bitmap was
   previously zero

 - KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED is set and @init->features is
   identical to vcpu_features (see kvm_vcpu_init_changed())

While there's nothing wrong with your diff, I'd prefer if the above
detail was represented directly.

	ret = kvm_setup_vcpu(vcpu);
	if (ret) {
		/*
		 * Clear the bitmap if setup fails on the first vCPU to be
		 * initialized.
		 */
		if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))
			bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);

		goto out_unlock;
	}

Thanks,
Oliver

