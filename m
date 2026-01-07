Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9DCCFD658
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVt95oRL/KXDNdcI2dZusgPIXzVemppS5pbly2uJxJk=; b=vf6pFz37RmXKXNvK10UloSrTa8
	07SuAk/3UXoAdKNtzIEKWUnen6jwm8Xu9pfDb0l8qtMQblxk7e5B+BhFCCiJ66V4ShJeHZgBjye1e
	wO+4xYp8J14ZkHI+KsbCxoeW8yjIL5vnzpFKHzLS2sQlxLLXRgGBRmC+OWmj3zH5BqMRcxVFGFJCf
	hMar2yVcjfXIgOvRd6kx/MiAIJOSBespwGj35lYpAH7NDcwcwTR+roDhuERQ0Yqhw/V4mgD4360Ja
	neeR39IokuMEtFdJ8tpm3x1KF/eC/bHY2ye53IvhgYueg+aq88Z0eeTTiQzRDCWb0FxOUdpyoA4bw
	xc0YI8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW8a-0000000FEos-2Xxl;
	Wed, 07 Jan 2026 16:11:56 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW8X-0000000FElo-0bbH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:11:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RVt95oRL/KXDNdcI2dZusgPIXzVemppS5pbly2uJxJk=;
	b=IP1gbG4hSTj5/TzwaMlFRmEdxgdGiSknNJlNRL9Ja8zq8sGcwkkVseHCh8exT4TIKCYc5S+3r
	1sFL/+Ord8DzS7YNiuLawd4I9oqm0YjOF1XtPQsduiAcV9eSH8NeDFytbRSz/sRX/moPc5W2d/M
	TKX25nqHbOv84kdVtGA0onk=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dmXz94T0vz1P7H7;
	Thu,  8 Jan 2026 00:09:09 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmY1p2KWpzHnGdq;
	Thu,  8 Jan 2026 00:11:26 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id BAE7C40565;
	Thu,  8 Jan 2026 00:11:32 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 16:11:31 +0000
Date: Wed, 7 Jan 2026 16:11:30 +0000
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
Subject: Re: [PATCH v2 27/36] KVM: arm64: gic-v5: Mandate architected PPI
 for PMU emulation on GICv5
Message-ID: <20260107161130.00006440@huawei.com>
In-Reply-To: <20251219155222.1383109-28-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-28-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_081153_756227_3E5F6F5C 
X-CRM114-Status: GOOD (  17.56  )
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

On Fri, 19 Dec 2025 15:52:45 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Make it mandatory to use the architected PPI when running a GICv5
> guest. Attempts to set anything other than the architected PPI (23)
> are rejected.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/pmu-emul.c | 14 ++++++++++++--
>  include/kvm/arm_pmu.h     |  5 ++++-
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index afc838ea2503e..2d3b50dec6c5d 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -962,8 +962,13 @@ static int kvm_arm_pmu_v3_init(struct kvm_vcpu *vcpu)
>  		if (!vgic_initialized(vcpu->kvm))
>  			return -ENODEV;
>  
> -		if (!kvm_arm_pmu_irq_initialized(vcpu))
> -			return -ENXIO;
> +		if (!kvm_arm_pmu_irq_initialized(vcpu)) {
> +			/* Use the architected irq number for GICv5. */
> +			if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V5)
> +				vcpu->arch.pmu.irq_num = KVM_ARMV8_PMU_GICV5_IRQ;
> +			else
> +				return -ENXIO;
Might as well flip logic and exit quickly on error.

			if (vcpu->kvm->arch.vgic.vgic_model != KVM_DEV_TYPE_ARM_VGIC_V5)
As before it might be nice to make the helper for this visible.

				return -ENXIO;

			vcpu->arch.pmu.irq_num = KVM_ARMV8_PMU_GICV5_IRQl;
		}
> +		}


