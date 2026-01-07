Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064BFCFD647
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVBgNpVLtCmWFVMgzmmCZBw+Qm+BhTFnL/XjmyuzdCQ=; b=wJoJyC/CA2QRk28+vnPKJh63dc
	Xbg6/Rhn0LpLMNDSVtTvsF+8K1HHSh3Z/+uyPGp7A1cHWevET+UH7nNkLW4O81LDmKm8DhxyxrvwE
	CNNfDJ5DlK3QOeWnQ5QBUVcKiUaE5CJ3adZ9YLuu2V/If09rS7A6Hlge5b2680/9G2MHGOfhd28Oh
	oGuxCZPkW62wj+QWMKjoJX4620nZXFSFMGjo1FAqZfuJHzdzfrmlg9swiSlQ0Ee+BSemzgU+2AhUC
	JH/DHMmZbM5gVSmqFvQOo/Vcu4e5+ylpqy/y085UHfY0C5NI+kboSXdLqbtt4vr8pAz5sUYufy4d8
	mB/VRYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVn0-0000000FC8p-4BFZ;
	Wed, 07 Jan 2026 15:49:39 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVmw-0000000FC8N-2pGT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 15:49:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uVBgNpVLtCmWFVMgzmmCZBw+Qm+BhTFnL/XjmyuzdCQ=;
	b=OH2ZZn+Ryu6QHhOwXn9byvA2m5lhzFW/ObX9HqrP6vZnIoyxCeWYo+Bw/tqlAkI3ukK26iJPU
	tuI8mpQWva20GSEyMg1morLq0uD0HOsJ00d8Xt2nWsOtfjKJUcZ6B1/eUjoASFjmoHFQ/vi5WlN
	Rf0Q/P94EyPUqYeZxfMj0AY=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dmXTn46FQz1vnMb;
	Wed,  7 Jan 2026 23:47:09 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmXX625m1zHnGgq;
	Wed,  7 Jan 2026 23:49:10 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id ACE4540570;
	Wed,  7 Jan 2026 23:49:16 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 15:49:15 +0000
Date: Wed, 7 Jan 2026 15:49:13 +0000
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
Subject: Re: [PATCH v2 24/36] KVM: arm64: gic-v5: Create, init vgic_v5
Message-ID: <20260107154913.00005193@huawei.com>
In-Reply-To: <20251219155222.1383109-25-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-25-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_074935_592640_AA33D4F9 
X-CRM114-Status: GOOD (  27.31  )
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

On Fri, 19 Dec 2025 15:52:44 +0000
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
> The current vgic_v5 support doesn't extend to nested

Odd early wrapping of message.

> guests. Therefore, the init of vgic_v5 for a nested guest is failed in
> vgic_v5_init.
> 
> As the current vgic_v5 doesn't require any resources to be mapped,
> vgic_v5_map_resources is simply used to check that the vgic has indeed
> been initialised. Again, this will change as more GICv5 support is
> merged in.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Comments mostly on existing code, so
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  arch/arm64/kvm/vgic/vgic-init.c | 51 ++++++++++++++++++++++-----------
>  arch/arm64/kvm/vgic/vgic-v5.c   | 26 +++++++++++++++++
>  arch/arm64/kvm/vgic/vgic.h      |  2 ++
>  include/kvm/arm_vgic.h          |  1 +
>  4 files changed, 63 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 03f45816464b0..afb5888cd8219 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c

>  	if (type == KVM_DEV_TYPE_ARM_VGIC_V3)
> @@ -420,20 +427,26 @@ int vgic_init(struct kvm *kvm)
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
> +			goto out;

Not really related to this patch, but I have no idea why this function
doesn't just do early returns on error in all paths (rather than just some of them).
It might be worth changing that to improve readability.


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
> +				goto out;
> +		}
> +	} else {
> +		ret = vgic_v5_init(kvm);
>  		if (ret)
>  			goto out;
>  	}
> @@ -610,9 +623,13 @@ int kvm_vgic_map_resources(struct kvm *kvm)
>  	if (dist->vgic_model == KVM_DEV_TYPE_ARM_VGIC_V2) {
>  		ret = vgic_v2_map_resources(kvm);
>  		type = VGIC_V2;
> -	} else {
> +	} else if (dist->vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
>  		ret = vgic_v3_map_resources(kvm);
>  		type = VGIC_V3;
> +	} else {
> +		ret = vgic_v5_map_resources(kvm);
> +		type = VGIC_V5;
> +		goto out;
This skips over the checking of ret which is fine (given it's just goto out)
but I'd add a comment to say why the next bit is skipped or a more complex
flow (maybe a flag to say dist is relevant that gates the next bit.

>  	}
>  
>  	if (ret)



