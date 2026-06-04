Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37909CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 10:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+8mBUnMzt1aCG6YTuFkpy/XYyLmPtxmKnBtZhmaXZs=; b=MCXXtr2W9CYT4ygWVeADpITfTc
	FmdJD3V3E92vcGDaEurcmEz/io+ap4fss3lh3thLfJv0S4wAWGdhhoNk+qzwUXoO78DfsUkRye9+g
	R3HrREyZkvwbkzfG2nc+yu6DIMiBv0Q+Pa6F0Qoztt5ozKzgW1irl019jMzA8NvjUFAKs948+Wbq2
	eeQpNkBb966ftTsWyvA6bD8BeUI27isyhVUKYP9bIartWR5OzvtyJHySt6quVzKiYi/Koq7sWatJG
	RdNz18ubKZnwTzoD16QspUZRYnXUMlw+gkhAJBdMUhvg6TgM7tsCN7SCWi2MfSD/eRDqzTZQ++5WQ
	qd8Q74Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5g5-0000000Gb3A-1Fiy;
	Thu, 04 Jun 2026 10:51:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5g1-0000000Gb2h-2UuJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 10:51:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC52C3297;
	Thu,  4 Jun 2026 03:51:44 -0700 (PDT)
Received: from [10.1.37.187] (e121487-lin.cambridge.arm.com [10.1.37.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEC2F3F7D8;
	Thu,  4 Jun 2026 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780570309; bh=hcVpIVW2Max3vDfb3aur+qELfZStk7+THs3lUeeL6IM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nkx7kCmjhcaN00bGaHo8yX2ffHRscQe01ROlNwUF8LTgbRImBhSKXZcwwso7wDaE+
	 M1rsqr/NjfzqEjspYRjXiUZ13A/KS0vhXEkuw6p2rex577T8pfDMvbKQn8F1SEGyat
	 ziXbxQlqnsR5o+tgsNyd206nEYbv9TWQ2xCkDK74=
Message-ID: <5f3a1f7c-f2f5-489a-a6ce-2e30f41cd422@arm.com>
Date: Thu, 4 Jun 2026 11:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/39] KVM: arm64: gic-v5: Add GICv5 SPI injection to
 irqfd
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Cc: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 Timothy Hayes <Timothy.Hayes@arm.com>
References: <20260521144846.1899475-1-sascha.bischoff@arm.com>
 <20260521144846.1899475-32-sascha.bischoff@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260521144846.1899475-32-sascha.bischoff@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_035154_101373_9676684E 
X-CRM114-Status: GOOD (  23.16  )
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

Hi Sascha,

On 5/21/26 15:59, Sascha Bischoff wrote:
> Now that there is support for GICv5 SPIs in KVM, update
> vgic_irqfd_set_irq() to translate irqchip pins into GICv5 SPI IntIDs
> before injecting them.
> 
> Also adjust IRQCHIP route validation for GICv5: use the configured SPI
> count, fall back to the default SPI count before VGIC init, and cap
> the accepted pin range to the generic irq routing table size.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/vgic/vgic-irqfd.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
> index b9b86e3a6c862..3644516811214 100644
> --- a/arch/arm64/kvm/vgic/vgic-irqfd.c
> +++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
> @@ -19,7 +19,12 @@ static int vgic_irqfd_set_irq(struct kvm_kernel_irq_routing_entry *e,
>  			struct kvm *kvm, int irq_source_id,
>  			int level, bool line_status)
>  {
> -	unsigned int spi_id = e->irqchip.pin + VGIC_NR_PRIVATE_IRQS;
> +	unsigned int spi_id;
> +
> +	if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V5)
> +		spi_id = vgic_v5_make_spi(e->irqchip.pin);
> +	else
> +		spi_id = e->irqchip.pin + VGIC_NR_PRIVATE_IRQS;
>  
>  	if (!vgic_valid_spi(kvm, spi_id))
>  		return -EINVAL;
> @@ -39,15 +44,24 @@ int kvm_set_routing_entry(struct kvm *kvm,
>  			  struct kvm_kernel_irq_routing_entry *e,
>  			  const struct kvm_irq_routing_entry *ue)
>  {
> +	unsigned int nr_pins = KVM_IRQCHIP_NUM_PINS;
>  	int r = -EINVAL;
>  
> +	if (vgic_is_v5(kvm)) {
> +		nr_pins = kvm->arch.vgic.nr_spis;
> +		if (!nr_pins)
> +			nr_pins = VGIC_V5_DEFAULT_NR_SPIS;
> +
> +		nr_pins = min(nr_pins, KVM_IRQCHIP_NUM_PINS);
> +	}
> +

I have a few questions about these checks.

IIUC, there are two paths that can lead us here:

vgic_init()
  -> kvm_vgic_setup_default_irq_routing()
       -> kvm_set_irq_routing()
            -> setup_routing_entry()
                 -> kvm_set_routing_entry()

where vgic_init() sets nr_spis to the default value if it has not
been configured already.

And:

kvm_vm_ioctl(KVM_SET_GSI_ROUTING)
  -> kvm_set_irq_routing()
       -> setup_routing_entry()
            -> kvm_set_routing_entry()

where nr_spis would still be 0 if KVM_SET_GSI_ROUTING is used
before the vGIC is initialized. In that case, how much harm
processing with nr_spis set to 0? Wouldn't the routing be
overwritten once the vGIC is initialized anyway?

Also, IIUC, this is not specific to vGICv5 and appears to be
equally applicable to vGICv2/v3. If so, shouldn't we apply the
same validation logic to the non-vGICv5 cases as well?

Finally, it seems the core already enforces KVM_MAX_IRQ_ROUTES,
and we lower that limit to KVM_IRQCHIP_NUM_PINS. IIUC, nr_spis
limit for vGICv5 is FIELD_MAX(GICV5_IRS_IDR5_SPI_RANGE) which
exceeds both core and our private limit.

Would it be simpler/cleaner to reject nr_spis values provided
through KVM_DEV_ARM_VGIC_GRP_NR_IRQS rather than allowing them
and later capping the accepted pin range?

Thanks
Vladimir

>  	switch (ue->type) {
>  	case KVM_IRQ_ROUTING_IRQCHIP:
>  		e->set = vgic_irqfd_set_irq;
>  		e->irqchip.irqchip = ue->u.irqchip.irqchip;
>  		e->irqchip.pin = ue->u.irqchip.pin;
> -		if ((e->irqchip.pin >= KVM_IRQCHIP_NUM_PINS) ||
> -		    (e->irqchip.irqchip >= KVM_NR_IRQCHIPS))
> +		if (e->irqchip.pin >= nr_pins ||
> +		    e->irqchip.irqchip >= KVM_NR_IRQCHIPS)
>  			goto out;
>  		break;
>  	case KVM_IRQ_ROUTING_MSI:
> -- 2.34.1
> 


