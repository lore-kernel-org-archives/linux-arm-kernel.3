Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94209CF6BEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qyYX76QlWUIX26TwaxqltqE5qHT9hotMM6BfsYSweg=; b=bP2GUTCAROTC7iwf9526PI0u+S
	topVSbZHlDgHXukDffefy8zdwB+Zj3rCW28FkgQRYsRapfWbz/bT2fh7p2mSseVoK6U3Is/2TCDOv
	nqFbyG7BIKdU73YaWMOi5aKBuhugl3wDaCKB3CI9hVDQGeVSpvQpjji9b/i8KXns919aYyLU2PA00
	+z+ETR0n9O8JLm6Ka1wRGKZDayJgALKn1PnJ3Md68KRyeys70ow2k6EnTq4EEX+UO3Uw2qs6Z2PUX
	yUnEAYWY0eF/v5XIZvlVQMoLXacAyywtwUuVgJzs3299IXaCk/nW0qmYA1GWu21V0894dEqrx4HjF
	ns1fbqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSYK-0000000Etad-3jfi;
	Wed, 07 Jan 2026 12:22:16 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSYH-0000000EtZo-2Nwx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:22:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3qyYX76QlWUIX26TwaxqltqE5qHT9hotMM6BfsYSweg=;
	b=1VRyJ+0B4zb5a96x3vwFxKCbJI3YjjVOn3TaHvt4BuD6wdqmEzpeFGcGWQj1f/eNak6eTFwG/
	mM2uVMv2ZcL/TkAS1Fx479HMdy7LHOgv702e6IKcg7OLwdmLE+15WFd0BY/uJZl1UxvKmzJXMPm
	vZ60TdQ5GD/L8a2aZWgMzWY=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dmRtN1S47z1P7PT;
	Wed,  7 Jan 2026 20:19:40 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmRx11LFYzHnH4x;
	Wed,  7 Jan 2026 20:21:57 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 4BBD240086;
	Wed,  7 Jan 2026 20:22:03 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 12:22:02 +0000
Date: Wed, 7 Jan 2026 12:22:00 +0000
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
Subject: Re: [PATCH v2 17/36] KVM: arm64: gic: Introduce irq_queue and
 set_pending_state to irq_ops
Message-ID: <20260107122200.00004455@huawei.com>
In-Reply-To: <20251219155222.1383109-18-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-18-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_042214_674706_4F4ED33C 
X-CRM114-Status: GOOD (  27.35  )
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

On Fri, 19 Dec 2025 15:52:41 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> There are times when the default behaviour of vgic_queue_irq_unlock is

Nice to make function names explicit in a patch description by using
vgic_queue_irq_unlock() style. Some subsystems insist we do that in commit
descriptions. No idea if kvm does though.

> undesirable. This is because some GICs, such a GICv5 which is the main
> driver for this change, handle the majority of the interrupt lifecycle
> in hardware. In this case, there is no need for a per-VCPU AP list as
> the interrupt can be made pending directly. This is done either via
> the ICH_PPI_x_EL2 registers for PPIs, or with the VDPEND system
> instruction for SPIs and LPIs.
> 
> The queue_irq_unlock function is made overridable using a new function
> pointer in struct irq_ops. In kvm_vgic_inject_irq,
> vgic_queue_irq_unlock is overridden if the function pointer is
> non-null.
> 
> Additionally, a new function is added via a function pointer -
> set_pending_state. The intent is for this to be used to directly set
> the pending state in hardware.
> 
> Both of these new irq_ops are unused in this change - it is purely
> providing the infrastructure itself. The subsequent PPI injection
> changes provide a demonstration of their usage.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Trivial stuff only.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  arch/arm64/kvm/vgic/vgic.c | 11 +++++++++++
>  include/kvm/arm_vgic.h     | 15 +++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index d88570bb2f9f0..ac8cb0270e1e4 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -404,6 +404,13 @@ bool vgic_queue_irq_unlock(struct kvm *kvm, struct vgic_irq *irq,
>  
>  	lockdep_assert_held(&irq->irq_lock);
>  
> +	/*
> +	 * If we have the queue_irq_unlock irq_op, we want to override
> +	 * the default behaviour. Call that, and return early.

I'd say this comment is really just saying what the code clearly does
so provides not benefit. So drop it.

> +	 */
> +	if (irq->ops && irq->ops->queue_irq_unlock)
> +		return irq->ops->queue_irq_unlock(kvm, irq, flags);
> +
>  retry:
>  	vcpu = vgic_target_oracle(irq);
>  	if (irq->vcpu || !vcpu) {
> @@ -547,7 +554,11 @@ int kvm_vgic_inject_irq(struct kvm *kvm, struct kvm_vcpu *vcpu,
>  	else
>  		irq->pending_latch = true;
>  
> +	if (irq->ops && irq->ops->set_pending_state)
> +		WARN_ON_ONCE(!irq->ops->set_pending_state(vcpu, irq));
> +
>  	vgic_queue_irq_unlock(kvm, irq, flags);
> +
Reasonable change, for readability but not relevant to this patch, so don't
do it here.

>  	vgic_put_irq(kvm, irq);
>  
>  	return 0;
> diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h



