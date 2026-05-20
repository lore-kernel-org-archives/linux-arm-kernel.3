Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4834CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSjAss03++08qraGtkU0rqYxnubZJfgIei34ab6b240=; b=wY9GmIZhD6X51Ru6MviLwnufgz
	1trp9Ja7Rah6yp9sdQ+4dm/evw/V8BwKcLcsG3HQVOPTmG8FBAWaVF2YdIiixzDlXEp8RCntJMAYM
	SyWBEhbXqyoUH5J2WIMJbM0V6hxI/F/1w3SB7mmQpOCGoS1ER4j70ncCWSTuog9+C/icfpCW6f0mY
	zSbd+3Jyq1/FiQ6o44sH52/jQDfVvhOJ14v0CN4FturSuUnIHW15fKg4nOlMsc5zLk8bSmBSXE6cm
	+ft0LaPyRhPSYe2+6CKqMFE1xiIJMDvlPFlrLVvEzmf+VfZ2GVI+2YlxkiMFO1FEhLHiXKLEJ6g6M
	ZxbAtudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgwj-00000004fc1-0uzI;
	Wed, 20 May 2026 13:26:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgwf-00000004fbB-2EBK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:26:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A440B1595;
	Wed, 20 May 2026 06:26:36 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C6523F632;
	Wed, 20 May 2026 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779283601; bh=V2hyoriKu3cBV4ukvXs163SoPkzDnGlLhKwzJje/42I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqPSUanRr6VyJj7ojnzUcP8QP4AOTE3fTe0RQx7Kr8oitWAut7qL+qIXwvb3jGkCB
	 20IotPVaee7MMJtL9MaSUB3GD8QcRAbcMoKNj9twqqmv7hwwnCRgBCTNX7p3YaY1Ld
	 sQzZje2HuMn3aqGq4sR6l0NtMxlWzcftCE6YmpoA=
Date: Wed, 20 May 2026 14:26:35 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: Re: [PATCH v2 03/18] KVM: arm64: vgic-v5: Remove use of
 __assign_bit() with a constant
Message-ID: <20260520132635.GA4027812@e124191.cambridge.arm.com>
References: <20260520091949.542365-1-maz@kernel.org>
 <20260520091949.542365-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520091949.542365-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_062645_808939_EEEFCC06 
X-CRM114-Status: GOOD (  23.45  )
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

On Wed, May 20, 2026 at 10:19:34AM +0100, Marc Zyngier wrote:
> Using __assign_bit() is very useful when the value of the bit is
> not known at compile time. In all other cases, __set_bit() and
> __clear_bit() are the correct tool for the job.
> 
> This also fixes an odd case of using VGIC_V5_NR_PRIVATE_IRQS as
> the bit value...
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/vgic/vgic-v5.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
> index 7c146fccc9689..4d62b1c31fe8b 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5.c
> @@ -25,13 +25,13 @@ static void vgic_v5_get_implemented_ppis(void)
>  	 * If we have KVM, we have EL2, which means that we have support for the
>  	 * EL1 and EL2 Physical & Virtual timers.
>  	 */
> -	__assign_bit(GICV5_ARCH_PPI_CNTHP, ppi_caps.impl_ppi_mask, 1);
> -	__assign_bit(GICV5_ARCH_PPI_CNTV, ppi_caps.impl_ppi_mask, 1);
> -	__assign_bit(GICV5_ARCH_PPI_CNTHV, ppi_caps.impl_ppi_mask, 1);
> -	__assign_bit(GICV5_ARCH_PPI_CNTP, ppi_caps.impl_ppi_mask, 1);
> +	__set_bit(GICV5_ARCH_PPI_CNTHP, ppi_caps.impl_ppi_mask);
> +	__set_bit(GICV5_ARCH_PPI_CNTV, ppi_caps.impl_ppi_mask);
> +	__set_bit(GICV5_ARCH_PPI_CNTHV, ppi_caps.impl_ppi_mask);
> +	__set_bit(GICV5_ARCH_PPI_CNTP, ppi_caps.impl_ppi_mask);
>  
>  	/* The SW_PPI should be available */
> -	__assign_bit(GICV5_ARCH_PPI_SW_PPI, ppi_caps.impl_ppi_mask, 1);
> +	__set_bit(GICV5_ARCH_PPI_SW_PPI, ppi_caps.impl_ppi_mask);
>  
>  	/* The PMUIRQ is available if we have the PMU */
>  	__assign_bit(GICV5_ARCH_PPI_PMUIRQ, ppi_caps.impl_ppi_mask, system_supports_pmuv3());
> @@ -146,9 +146,7 @@ int vgic_v5_init(struct kvm *kvm)
>  	/* We only allow userspace to drive the SW_PPI, if it is implemented. */
>  	bitmap_zero(kvm->arch.vgic.gicv5_vm.userspace_ppis,
>  		    VGIC_V5_NR_PRIVATE_IRQS);
> -	__assign_bit(GICV5_ARCH_PPI_SW_PPI,
> -		     kvm->arch.vgic.gicv5_vm.userspace_ppis,
> -		     VGIC_V5_NR_PRIVATE_IRQS);
> +	__set_bit(GICV5_ARCH_PPI_SW_PPI, kvm->arch.vgic.gicv5_vm.userspace_ppis);
>  	bitmap_and(kvm->arch.vgic.gicv5_vm.userspace_ppis,
>  		   kvm->arch.vgic.gicv5_vm.userspace_ppis,
>  		   ppi_caps.impl_ppi_mask, VGIC_V5_NR_PRIVATE_IRQS);
> @@ -197,7 +195,7 @@ int vgic_v5_finalize_ppi_state(struct kvm *kvm)
>  		/* Expose PPIs with an owner or the SW_PPI, only */
>  		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock) {
>  			if (irq->owner || i == GICV5_ARCH_PPI_SW_PPI) {
> -				__assign_bit(i, kvm->arch.vgic.gicv5_vm.vgic_ppi_mask, 1);
> +				__set_bit(i, kvm->arch.vgic.gicv5_vm.vgic_ppi_mask);
>  				__assign_bit(i, kvm->arch.vgic.gicv5_vm.vgic_ppi_hmr,
>  					     irq->config == VGIC_CONFIG_LEVEL);
>  			}
> -- 
> 2.47.3
> 

