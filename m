Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4382C9EC9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1d5Rc0+Kuv9IDFedTg1SjWNsjMqHZeOuT+hIBU9nhHY=; b=HHriG9XlGZ2twYj0J6zCF2RUTd
	b8v3goNz0d6lRBtQx24TfOhifaGMe5bZbrNhm7687PNVuKkOzsYT9uvudKUPv1buz3Bi+I1WDxCUT
	XeDPJEAdIA9XFSu215gktyAMIC6s7Jy0KXj1MKiQLSwpKRMpVytSph4/1vT/VSMWig7VSimCTaTDg
	MrbYs5RbK9sQea0FFHFgQypnIWvknskC/Wvt/zY0vFmGZGQxG4nWDK+OvMNSu8p+8nJo0yzRnzFFe
	oQbK61ZbLZHfxlSPoBDSd9gwJZ3hdf4Wrcw9SJTeb2c04+XhGgcD44Vi0CQ/xSz+3uvj3ObkCssvD
	/9IK9wbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKez-00000005iUX-0W1l;
	Mon, 12 Jan 2026 16:20:53 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKev-00000005iTg-48ro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 16:20:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1d5Rc0+Kuv9IDFedTg1SjWNsjMqHZeOuT+hIBU9nhHY=;
	b=sldR3HrTIWAGi+oNR19/urwfy1QBClv9QNRlcVbqP29cpaiswwSW9ZC4CXihPgaFMeUhwCxc3
	jyIn6pnlee+VPYjZrB8HW3dTXRHDv3K5NCBUu7XOPHnPcGosi9HzIEKgI/ZFjUwLMlwjzcqKSh6
	b4vPozeIy6sr2mLMDUGLwNk=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dqcxW1FyGzMqh8;
	Tue, 13 Jan 2026 00:18:23 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqczl217mzHnGhV;
	Tue, 13 Jan 2026 00:20:19 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C42C40569;
	Tue, 13 Jan 2026 00:20:35 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 16:20:34 +0000
Date: Mon, 12 Jan 2026 16:20:33 +0000
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
Subject: Re: [PATCH v3 24/36] KVM: arm64: gic-v5: Create, init vgic_v5
Message-ID: <20260112162033.000078d5@huawei.com>
In-Reply-To: <20260109170400.1585048-25-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-25-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_082050_446247_02697F5C 
X-CRM114-Status: GOOD (  26.65  )
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

On Fri, 9 Jan 2026 17:04:47 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Update kvm_vgic_create to create a vgic_v5 device. When creating a
> vgic, FEAT_GCIE in the ID_AA64PFR2 is only exposed to vgic_v5-based
> guests, and is hidden otherwise. GIC in ~ID_AA64PFR0_EL1 is never
> exposed for a vgic_v5 guest.
> 
> When initialising a vgic_v5, skip kvm_vgic_dist_init as GICv5 doesn't
> support one. The current vgic_v5 implementation only supports PPIs, so
> no SPIs are initialised either.
> 
> The current vgic_v5 support doesn't extend to nested guests. Therefore,
> the init of vgic_v5 for a nested guest is failed in vgic_v5_init.
> 
> As the current vgic_v5 doesn't require any resources to be mapped,
> vgic_v5_map_resources is simply used to check that the vgic has indeed
> been initialised. Again, this will change as more GICv5 support is
> merged in.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Minor patch break up comment below. No need to change unless
maintainers ask for it I think.

Jonathan


> ---
>  arch/arm64/kvm/vgic/vgic-init.c | 60 +++++++++++++++++++++------------
>  arch/arm64/kvm/vgic/vgic-v5.c   | 26 ++++++++++++++
>  arch/arm64/kvm/vgic/vgic.h      |  2 ++
>  include/kvm/arm_vgic.h          |  1 +
>  4 files changed, 68 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 973bbbe56062c..bde5544b58b09 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c

> @@ -418,22 +425,28 @@ int vgic_init(struct kvm *kvm)
>  	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus))
>  		return -EBUSY;
>  
> -	/* freeze the number of spis */
> -	if (!dist->nr_spis)
> -		dist->nr_spis = VGIC_NR_IRQS_LEGACY - VGIC_NR_PRIVATE_IRQS;
> +	if (!vgic_is_v5(kvm)) {
> +		/* freeze the number of spis */
> +		if (!dist->nr_spis)
> +			dist->nr_spis = VGIC_NR_IRQS_LEGACY - VGIC_NR_PRIVATE_IRQS;
>  
> -	ret = kvm_vgic_dist_init(kvm, dist->nr_spis);
> -	if (ret)
> -		goto out;
> +		ret = kvm_vgic_dist_init(kvm, dist->nr_spis);
> +		if (ret)
> +			return ret;
>  
> -	/*
> -	 * Ensure vPEs are allocated if direct IRQ injection (e.g. vSGIs,
> -	 * vLPIs) is supported.
> -	 */
> -	if (vgic_supports_direct_irqs(kvm)) {
> -		ret = vgic_v4_init(kvm);
> +		/*
> +		 * Ensure vPEs are allocated if direct IRQ injection (e.g. vSGIs,
> +		 * vLPIs) is supported.
> +		 */
> +		if (vgic_supports_direct_irqs(kvm)) {
> +			ret = vgic_v4_init(kvm);
> +			if (ret)
> +				return ret;
> +		}
> +	} else {
> +		ret = vgic_v5_init(kvm);
>  		if (ret)
> -			goto out;
> +			return ret;
>  	}
>  
>  	kvm_for_each_vcpu(idx, vcpu, kvm)
> @@ -441,11 +454,11 @@ int vgic_init(struct kvm *kvm)
>  
>  	ret = kvm_vgic_setup_default_irq_routing(kvm);
>  	if (ret)
> -		goto out;
> +		return ret;
>  
>  	vgic_debug_init(kvm);
>  	dist->initialized = true;
> -out:

It is a bit marginal on whether it is worth the effort but I think
this would been slightly clearer if a precursor patch had dealt with the
early returns.

> +
>  	return ret;

return 0;

Always nice to be explicit when it is a good exit path.

>  }
>  



