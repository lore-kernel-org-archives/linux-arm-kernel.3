Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABBCF8FA8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Z5VlUbXxHfOI0RrYkBS+ONywW+ZbZs3sJr4MjNkKSc=; b=BlwFctgYn4nEa4cy2y6HWE+hTm
	GwpUtoEL3JcNNLqdmBj7eoI2gUbjrXGLpLyusnEXwkjHOLbJxjXUL+EyGm3AIHpcM/ZDGZJcRbfj0
	vMmhAJErGysIkLFSY8UvKN0teNRA3ielXO+LCT4vncTpIXdMEAG8l4Blt9kK0FuTwE6TjkROvYSHX
	E+5Z2OdtwDmKjqKkM4e/RKhHglwvcgxweI6L4yxX1yTdCf2Wosnr/HZaJu7FYweaB1T6tqFzdV8fm
	iMsGpUugG+LMUc90ajgTi49hOA7uM+vXcEvz4RBtvW4uQbaWSvFuszRsFlmex7x0EQSOcOb7cyGAo
	x0XBM65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCvd-00000008pJT-3IoB;
	Tue, 21 Apr 2026 15:22:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCvb-00000008pJ3-2QUl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:22:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA8F0263D;
	Tue, 21 Apr 2026 08:22:11 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32E993FAF5;
	Tue, 21 Apr 2026 08:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776784937; bh=nPGT3rI946WNKlLJ1/PxwpN8nrpXwwpVI88NPQnP758=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9PFCBQnzXXsifSDLMAJDiYgp/ELv3jWXYhoqj5rn8bn/hb3D3HYIUyx4NqQyyZ0a
	 rNS+8kH96rVZkFUf74Io2v/WdtsEZrta7ThX8yANEkYr7LEVMax/GpQvMxUEClkftr
	 ABCEOi0eqWF/cHzZ/MzJMQG9psrwFFopJUkcsVjs=
Date: Tue, 21 Apr 2026 16:22:07 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: Re: [PATCH 06/18] KVM: arm64: vgic: Consolidate
 vgic_allocate_private_irqs_locked()
Message-ID: <20260421152207.GA3862683@e124191.cambridge.arm.com>
References: <20260415115559.2227718-1-maz@kernel.org>
 <20260415115559.2227718-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415115559.2227718-7-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_082219_834682_28F112D9 
X-CRM114-Status: GOOD (  23.88  )
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

On Wed, Apr 15, 2026 at 12:55:47PM +0100, Marc Zyngier wrote:
> vgic_allocate_private_irqs_locked() calls two helpers, oddly named
> vgic_{,v5_}allocate_private_irq().
> 
> Not only these helpers don't allocate anything, but they also
> contain duplicate init code that would be better placed in the
> caller.
> 
> Consolidate the common init code in the caller, rename the helpers
> to vgic_{,v5_}setup_private_irq(), and pass the irq pointer around
> instead of the index of the interrupt.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/vgic/vgic-init.c | 45 +++++++++++++--------------------
>  1 file changed, 18 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 933983bb20052..907057881b26a 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -271,18 +271,12 @@ int kvm_vgic_vcpu_nv_init(struct kvm_vcpu *vcpu)
>  	return ret;
>  }
>  
> -static void vgic_allocate_private_irq(struct kvm_vcpu *vcpu, int i, u32 type)
> +static void vgic_setup_private_irq(struct kvm_vcpu *vcpu, struct vgic_irq *irq,
> +				   u32 type)
>  {
> -	struct vgic_irq *irq = &vcpu->arch.vgic_cpu.private_irqs[i];
> +	irq->intid = irq - &vcpu->arch.vgic_cpu.private_irqs[0];

These are allocated in one block with kzalloc_objs(), so this pointer offsetting is fine!

>  
> -	INIT_LIST_HEAD(&irq->ap_list);
> -	raw_spin_lock_init(&irq->irq_lock);
> -	irq->vcpu = NULL;
> -	irq->target_vcpu = vcpu;
> -	refcount_set(&irq->refcount, 0);
> -
> -	irq->intid = i;
> -	if (vgic_irq_is_sgi(i)) {
> +	if (vgic_irq_is_sgi(irq->intid)) {
>  		/* SGIs */
>  		irq->enabled = 1;
>  		irq->config = VGIC_CONFIG_EDGE;
> @@ -303,18 +297,11 @@ static void vgic_allocate_private_irq(struct kvm_vcpu *vcpu, int i, u32 type)
>  	}
>  }
>  
> -static void vgic_v5_allocate_private_irq(struct kvm_vcpu *vcpu, int i, u32 type)
> +static void vgic_v5_setup_private_irq(struct kvm_vcpu *vcpu, struct vgic_irq *irq)
>  {
> -	struct vgic_irq *irq = &vcpu->arch.vgic_cpu.private_irqs[i];
> -	u32 intid = vgic_v5_make_ppi(i);
> -
> -	INIT_LIST_HEAD(&irq->ap_list);
> -	raw_spin_lock_init(&irq->irq_lock);
> -	irq->vcpu = NULL;
> -	irq->target_vcpu = vcpu;
> -	refcount_set(&irq->refcount, 0);
> +	int i = irq - &vcpu->arch.vgic_cpu.private_irqs[0];
>  
> -	irq->intid = intid;
> +	irq->intid = vgic_v5_make_ppi(i);
>  
>  	/* The only Edge architected PPI is the SW_PPI */
>  	if (i == GICV5_ARCH_PPI_SW_PPI)
> @@ -323,7 +310,7 @@ static void vgic_v5_allocate_private_irq(struct kvm_vcpu *vcpu, int i, u32 type)
>  		irq->config = VGIC_CONFIG_LEVEL;
>  
>  	/* Register the GICv5-specific PPI ops */
> -	vgic_v5_set_ppi_ops(vcpu, intid);
> +	vgic_v5_set_ppi_ops(vcpu, irq->intid);
>  }
>  
>  static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu, u32 type)
> @@ -349,15 +336,19 @@ static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu, u32 type)
>  	if (!vgic_cpu->private_irqs)
>  		return -ENOMEM;
>  
> -	/*
> -	 * Enable and configure all SGIs to be edge-triggered and
> -	 * configure all PPIs as level-triggered.
> -	 */
>  	for (i = 0; i < num_private_irqs; i++) {
> +		struct vgic_irq *irq = &vcpu->arch.vgic_cpu.private_irqs[i];
> +
> +		INIT_LIST_HEAD(&irq->ap_list);
> +		raw_spin_lock_init(&irq->irq_lock);
> +		irq->vcpu = NULL;
> +		irq->target_vcpu = vcpu;
> +		refcount_set(&irq->refcount, 0);
> +
>  		if (vgic_is_v5(vcpu->kvm))
> -			vgic_v5_allocate_private_irq(vcpu, i, type);
> +			vgic_v5_setup_private_irq(vcpu, irq);
>  		else
> -			vgic_allocate_private_irq(vcpu, i, type);
> +			vgic_setup_private_irq(vcpu, irq, type);
>  	}
>  
>  	return 0;

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

