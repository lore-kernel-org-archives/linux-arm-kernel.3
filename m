Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722C4CF45A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZmC8E9x0lsORQcKBHO7BPce7Bp4VCsTTDrVTj1p9/k=; b=yDPozf6AmiWm1uA6venMkgTD2m
	JWTkT4J9yigcSNDRjZ9kr0esYxPYhrfocID6YVbXaOTHyJZYHjyRjXctyarhRAxxE3nlEPZjEi5r9
	BhvKvna30yOU480VIaFldkn5EvasTTUlR/+pwzFjr4cXuryDxHwemBLVmP8m/oV4RnbJJ+lcuM90x
	ICbTMK/XEV7EKDlRjXb0UIfIUq+txuIQP4qGvJXfG/gU31ebVqmgtTxYARc7cFzJuP3axOkRbKl53
	XeSJAJYXR8SXO1SluhpYaaDhGPr1nm5827c6T6a1samwk2aQmW6vZLCTzop5d5eui5JQdKY4NoDmj
	/GkJfDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKzy-00000005k8T-0SvB;
	Mon, 12 Jan 2026 16:42:34 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKzv-00000005k7u-32tR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 16:42:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eZmC8E9x0lsORQcKBHO7BPce7Bp4VCsTTDrVTj1p9/k=;
	b=BbiUjK5UomxqSiXsKG9eFzkpXanoKP+1SBcbtDaePrflU8sK/g28VzaBCBsf8TdrXeuVEpFVt
	bXLPjve1C4smFydsDNsbelt8NqQaGS/jbc3M5UeJV2867Fny+cCBph7iHOgWfPERst3eyCOdvJX
	Ro/y+PTtKpmuNgmNFB/6bKw=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dqdQc4Bw1zMksc;
	Tue, 13 Jan 2026 00:40:08 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqdSx2mVMzJ46F7;
	Tue, 13 Jan 2026 00:42:09 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 050C340086;
	Tue, 13 Jan 2026 00:42:21 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 16:42:20 +0000
Date: Mon, 12 Jan 2026 16:42:19 +0000
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
Subject: Re: [PATCH v3 36/36] KVM: arm64: gic-v5: Communicate
 userspace-driveable PPIs via a UAPI
Message-ID: <20260112164219.00001d70@huawei.com>
In-Reply-To: <20260109170400.1585048-37-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-37-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_084232_201928_1B7D1F53 
X-CRM114-Status: GOOD (  17.70  )
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

On Fri, 9 Jan 2026 17:04:50 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> GICv5 systems will likely not support the full set of PPIs. The
> presence of any virtual PPI is tied to the presence of the physical
> PPI. Therefore, the available PPIs will be limited by the physical
> host. Userspace cannot drive any PPIs that are not implemented.
> 
> Moreover, it is not desirable to expose all PPIs to the guest in the
> first place, even if they are supported in hardware. Some devices,
> such as the arch timer, are implemented in KVM, and hence those PPIs
> shouldn't be driven by userspace, either.
> 
> Provided a new UAPI:
>   KVM_DEV_ARM_VGIC_GRP_CTRL => KVM_DEV_ARM_VGIC_USERPSPACE_PPIs
> 
> This allows userspace to query which PPIs it is able to drive via
> KVM_IRQ_LINE.
> 
> Additionally, introduce a check in kvm_vm_ioctl_irq_line() to reject
> any PPIs not in the userspace mask.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> 
> FOLD: Limit KVM_IRQ_LINE PPIs

Looks like you did a squash rather than a fixup merge and failed to drop this.

Otherwise, just one trivial thing below.

Thanks,

Jonathan

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 1cfd1e53b060e..e15c97395f50f 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1437,6 +1437,14 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
>  			if (irq_num >= VGIC_V5_NR_PRIVATE_IRQS)
>  				return -EINVAL;
>  
> +			/*
> +			 * Only allow PPIs that are explicitly exposed to
> +			 * usespace to be driven via KVM_IRQ_LINE
> +			 */
> +			u64 mask = kvm->arch.vgic.gicv5_vm.userspace_ppis[irq_num / 64];

Inline declarations are still normally limited to when we need to have
them, e.g for cleanup.h stuff.  So declare mask at top of appropriate
scope.

> +			if (!(mask & BIT_ULL(irq_num % 64)))
> +				return -EINVAL;
> +
>  			/* Build a GICv5-style IntID here */
>  			irq_num |= FIELD_PREP(GICV5_HWIRQ_TYPE, GICV5_HWIRQ_TYPE_PPI);
>  		} else if (irq_num < VGIC_NR_SGIS ||



