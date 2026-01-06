Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD03FCEFCEC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPZANbv0STzLtH3a80Pr5HXtHvD2VOOOrggZl0/fcv8=; b=l9KpcUJ4KeMRao1V2T1Mbs8eYq
	FTTJfgjeg9jCRcrODJaRq7SXF+qCbFjTx+QUdkzMgrpXfFsjxoryAZu7G92QzwUZ6sEW0E8MK8v41
	nRPysbFtXJrNiMUpUs9RRGH5pwMIiSVg/jHgZ/mgoWXtQsgAUNtPajGIO8IFp4S1reKIzn7Sj0lGC
	ehWcJVN/CyRz9XzN7ZC1W47q++/gBoWozRg2PsVqv9MncvtcB6e8TuvUo2+8if2/+8R5/dagzWTGC
	JmhFPr9Q/VvWPHrZdqarjiEf3O3bPGSxhb21rr0ywsaZEM/PZCqRkgqO5VzE+WLSwtyOPm07Rdr07
	jkRaO5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC1t-0000000DiEF-2zcg;
	Tue, 06 Jan 2026 18:43:41 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC1o-0000000DiCG-23zn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:43:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CPZANbv0STzLtH3a80Pr5HXtHvD2VOOOrggZl0/fcv8=;
	b=Ti/Cnbq3Wap4TdpoBsmDo7OUQ/W8DNZ1jPFaI8gBzFKMtHOud505NkRbTi0R0KmxwnFyDO1hI
	gcupkrbCdKSxjaM0xu278dJRfXk8wikYzs2p6Mgx8LTNmtx9qhJPS0QHAd6PyFECgAz4hVmlJZh
	1a9hvWXIT4m36vmfhBzN0kw=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dm0P45zMsz1vnvh;
	Wed,  7 Jan 2026 02:41:12 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dm0RS4LKXzJ4680;
	Wed,  7 Jan 2026 02:43:16 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 90B1C40565;
	Wed,  7 Jan 2026 02:43:18 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 18:43:17 +0000
Date: Tue, 6 Jan 2026 18:43:13 +0000
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
Subject: Re: [PATCH v2 07/36] KVM: arm64: gic: Introduce interrupt type
 helpers
Message-ID: <20260106184313.00002a8c@huawei.com>
In-Reply-To: <20251219155222.1383109-8-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-8-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_104338_981865_161049D2 
X-CRM114-Status: GOOD (  17.54  )
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

On Fri, 19 Dec 2025 15:52:38 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> GICv5 has moved from using interrupt ranges for different interrupt
> types to using some of the upper bits of the interrupt ID to denote
> the interrupt type. This is not compatible with older GICs (which rely
> on ranges of interrupts to determine the type), and hence a set of
> helpers is introduced. These helpers take a struct kvm*, and use the
> vgic model to determine how to interpret the interrupt ID.
> 
> Helpers are introduced for PPIs, SPIs, and LPIs. Additionally, a
> helper is introduced to determine if an interrupt is private - SGIs
> and PPIs for older GICs, and PPIs only for GICv5.
> 
> The helpers are plumbed into the core vgic code, as well as the Arch
> Timer and PMU code.
> 
> There should be no functional changes as part of this change.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Hi Sascha,

A bit of bikeshedding / 'valuable' naming feedback to end the day.
Otherwise LGTM.

> diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
> index b261fb3968d03..6778f676eaf08 100644
> --- a/include/kvm/arm_vgic.h
> +++ b/include/kvm/arm_vgic.h
...

>  enum vgic_type {
>  	VGIC_V2,		/* Good ol' GICv2 */
> @@ -418,8 +488,12 @@ u64 vgic_v3_get_misr(struct kvm_vcpu *vcpu);
>  
>  #define irqchip_in_kernel(k)	(!!((k)->arch.vgic.in_kernel))
>  #define vgic_initialized(k)	((k)->arch.vgic.initialized)
> -#define vgic_valid_spi(k, i)	(((i) >= VGIC_NR_PRIVATE_IRQS) && \
> +#define vgic_valid_nv5_spi(k, i)	(((i) >= VGIC_NR_PRIVATE_IRQS) && \
>  			((i) < (k)->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS))
> +#define vgic_valid_v5_spi(k, i)	(irq_is_spi(k, i) && \
> +				 (FIELD_GET(GICV5_HWIRQ_ID, i) < (k)->arch.vgic.nr_spis))
> +#define vgic_valid_spi(k, i) (vgic_is_v5(k) ?				\
> +			      vgic_valid_v5_spi(k, i) : vgic_valid_nv5_spi(k, i))

nv is a little awkward as a name as immediately makes me thinking
nested virtualization instead of not v5 (which I guess is the thinking behind that?)

Probably just me and naming it v23 will break if we get to GIC version 23 :)
nv5 breaks when we get GICv6 ;)


>  
>  bool kvm_vcpu_has_pending_irqs(struct kvm_vcpu *vcpu);
>  void kvm_vgic_sync_hwstate(struct kvm_vcpu *vcpu);


