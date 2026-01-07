Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C056CD5854
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mx4HxkvxS5+KY/vZ//YKmAqZ2BvXN0nyzwAdGObB9i0=; b=wTQiZK/UTQ8Xcfdfx64qqBbRoP
	4hFiIbVK8tC8Nu4+w8dITOPLp3eUgarx2nueA80xJNrll2FLqtpgItl9awQtpipkxgnApwliWbO8e
	Ix7hkyN4E8mClkKTn0XR6WZO6c72PyanWVnskO9yq4qvf8692XgwnlmN3tssfa+mWEAJdavxGTRc2
	3yn0TIYsktdkmGDNAGcj88BELYkQ4zvRWSB+Zv6WQ++PIcvF6q233EsQLrLlTxNF4DTfoVe8KoDZV
	kw077y6njLlQCC6rQmVwv3VMEiEOTYJr++43wpglRlfB48bPASGauSq5qbqgk/jq6+SMyjLESfyP4
	Vjs20l6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRf7-0000000EpJg-1790;
	Wed, 07 Jan 2026 11:25:15 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRf3-0000000EpJ9-1dw4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 11:25:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Mx4HxkvxS5+KY/vZ//YKmAqZ2BvXN0nyzwAdGObB9i0=;
	b=U0iqRGZl6n9h324NEVa8ZWn78Bdn60SKfDDxTUQ0R656dKatCNfUfi9kjB4S2w58iSU6/KGZe
	xK2hvfybERfeBxcFPBUEQ4d+i7VkdF8r/dbF6WDgB3GowSEpPmw06LttPFNEgv5ceAQFouC1jU/
	U3kb+jVKp05F+2cXl3Qh3wQ=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dmQcn24vXz1vpDm;
	Wed,  7 Jan 2026 19:22:49 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmQg8449hzJ468L;
	Wed,  7 Jan 2026 19:24:52 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id A9FED40539;
	Wed,  7 Jan 2026 19:24:55 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 11:24:54 +0000
Date: Wed, 7 Jan 2026 11:24:53 +0000
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
Subject: Re: [PATCH v2 13/36] KVM: arm64: gic: Set vgic_model before initing
 private IRQs
Message-ID: <20260107112453.00004fb9@huawei.com>
In-Reply-To: <20251219155222.1383109-14-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-14-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_032510_154633_544B482B 
X-CRM114-Status: GOOD (  16.92  )
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

On Fri, 19 Dec 2025 15:52:40 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Different GIC types require the private IRQs to be initialised
> differently. GICv5 is the culprit as it supports both a different
> number of private IRQs, and all of these are PPIs (there are no
> SGIs). Moreover, as GICv5 uses the top bits of the interrupt ID to
> encode the type, the intid also needs to computed differently.
> 
> Up until now, the GIC model has been set after initialising the
> private IRQs for a VCPU. Move this earlier to ensure that the GIC
> model is available when configuring the private IRQs.
Hi Sascha,

Good to mention you are moving a bit more than just the type
initialization. One question on whether it makes sense to move
vgic_dist_base inline.

> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/vgic/vgic-init.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index c602f24bab1bb..bcc2c79f7833c 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -140,6 +140,12 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>  		goto out_unlock;
>  	}
>  
> +	kvm->arch.vgic.in_kernel = true;
> +	kvm->arch.vgic.vgic_model = type;
> +	kvm->arch.vgic.implementation_rev = KVM_VGIC_IMP_REV_LATEST;

Moving these looks fine.

> +
> +	kvm->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;

Does this need to move?  The rest of the *base =
stuff is still where this code originally came from.
Might well be necessary but I'd expect a little in the patch description on why.

> +
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		ret = vgic_allocate_private_irqs_locked(vcpu, type);
>  		if (ret)
> @@ -156,12 +162,6 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>  		goto out_unlock;
>  	}
>  
> -	kvm->arch.vgic.in_kernel = true;
> -	kvm->arch.vgic.vgic_model = type;
> -	kvm->arch.vgic.implementation_rev = KVM_VGIC_IMP_REV_LATEST;
> -
> -	kvm->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;
> -
>  	aa64pfr0 = kvm_read_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1) & ~ID_AA64PFR0_EL1_GIC;
>  	pfr1 = kvm_read_vm_id_reg(kvm, SYS_ID_PFR1_EL1) & ~ID_PFR1_EL1_GIC;
>  


