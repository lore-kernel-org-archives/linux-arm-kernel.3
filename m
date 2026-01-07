Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA46ECFD64E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2x/3meMA0G6VDYoHbJ4AHA6vDOYL4w15qQ/fKhtmMm4=; b=yxcVsA1ZLPNYBXs5j5Erla+AOK
	NIorTKG8SJcVP0wYVD2o6XVn5KCgXsiwonU8K944MP+RaQTWFtoNOXWEtiCrVWpvEYX0qY+UC4xeL
	Ic1VpqrLhuQqCnPLBUgqdfgH3WTkWxRgzCIbUl98zFj5Mmfl3RLF8L0C1oojIL0SS/f2K6DXYEUh6
	S0IS4vpFuwdtjv/42U061U21Lz+hR1BPPFhKyv0tS7VTtlCElkvocH6qjk8AyIxKt/hOdNCadGROR
	wwbT8xXDvl6bwoooMSz5DnOODJ5EmNaew5VBg1kmQIGPIR/UOZOuN3f5rDzFqWGT/rtJN0IXiPNsF
	xFKKRMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdV9d-0000000F9EN-1Kda;
	Wed, 07 Jan 2026 15:08:57 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdV9b-0000000F9Dk-00KX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 15:08:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2x/3meMA0G6VDYoHbJ4AHA6vDOYL4w15qQ/fKhtmMm4=;
	b=ITmUrG3aql95a+0mkqRCs4CkZs3jBo7KClazcloMblBygqzUg7YtcxiBH74AyvDsXD0trZ634
	LF228aRXerWBfkVnah2wGUfBd62jcd9epzFNMe3tihiQUsEjcJRZzzKYc5cttUJreN8tNXMdeX8
	7vjGmWX9qRilDkCfHfIwvj0=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dmWZf0nrKz1P7MM;
	Wed,  7 Jan 2026 23:06:17 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmWdK6J81zJ469G;
	Wed,  7 Jan 2026 23:08:37 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 3EAF740539;
	Wed,  7 Jan 2026 23:08:41 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 15:08:40 +0000
Date: Wed, 7 Jan 2026 15:08:38 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v2 21/36] KVM: arm64: gic-v5: Finalize GICv5 PPIs and
 generate mask
Message-ID: <20260107150838.00004e00@huawei.com>
In-Reply-To: <20251219155222.1383109-22-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-22-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_070855_572243_FDD77AE8 
X-CRM114-Status: GOOD (  22.21  )
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

On Fri, 19 Dec 2025 15:52:43 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> We only want to expose a subset of the PPIs to a guest. If a PPI does
> not have an owner, it is not being actively driven by a device. The
> SW_PPI is a special case, as it is likely for userspace to wish to
> inject that.
> 
> Therefore, just prior to running the guest for the first time, we need
> to finalize the PPIs. A mask is generated which, when combined with
> trapping a guest's PPI accesses, allows for the guest's view of the
> PPI to be filtered.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Minor suggestion inline. Either way

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
> index c7ecc4f40b1e5..f1fa63e67c1f6 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5.c
> @@ -81,6 +81,66 @@ static u32 vgic_v5_get_effective_priority_mask(struct kvm_vcpu *vcpu)
>  	return priority_mask;
>  }
>  
> +static int vgic_v5_finalize_state(struct kvm_vcpu *vcpu)
> +{
> +	if (!ppi_caps)
> +		return -ENXIO;
> +
> +	vcpu->arch.vgic_cpu.vgic_v5.vgic_ppi_mask[0] = 0;
> +	vcpu->arch.vgic_cpu.vgic_v5.vgic_ppi_mask[1] = 0;
> +	vcpu->arch.vgic_cpu.vgic_v5.vgic_ppi_hmr[0] = 0;
> +	vcpu->arch.vgic_cpu.vgic_v5.vgic_ppi_hmr[1] = 0;
> +	for (int i = 0; i < VGIC_V5_NR_PRIVATE_IRQS; ++i) {
> +		int reg = i / 64;
> +		u64 bit = BIT_ULL(i % 64);
> +		struct vgic_irq *irq = &vcpu->arch.vgic_cpu.private_irqs[i];
> +
> +		raw_spin_lock(&irq->irq_lock);
> +
A little nicer perhaps with:
		guard(raw_spin_lock(&irq->irq_lock);
> +		/*
> +		 * We only expose PPIs with an owner or thw SW_PPI to
> +		 * the guest.
> +		 */
> +		if (!irq->owner && irq->intid == GICV5_SW_PPI)
> +			goto unlock;
and
			continue;
> +
> +		/*
> +		 * If the PPI isn't implemented, we can't pass it
> +		 * through to a guest anyhow.
> +		 */
> +		if (!(ppi_caps->impl_ppi_mask[reg] & bit))
> +			goto unlock;
and
			continue;
> +
> +		vcpu->arch.vgic_cpu.vgic_v5.vgic_ppi_mask[reg] |= bit;
> +
> +		if (irq->config == VGIC_CONFIG_LEVEL)
> +			vcpu->arch.vgic_cpu.vgic_v5.vgic_ppi_hmr[reg] |= bit;
> +
> +unlock:
> +		raw_spin_unlock(&irq->irq_lock);
Then the label and unlock can go away.

> +	}
> +
> +	return 0;
> +}


