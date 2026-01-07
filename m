Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6CBCFD64B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORgRBCEvHqF3ASwTkSpJbEavEYI/IdEmj28e0XJZgk0=; b=W823A3FraxnS8H5Hee/XzwQdhS
	r0iE0CHPyUcVPZobtYTgpVWt+qfmUiIfnJFdQPkMw8dIPBletUfMsJ1vJyxvxp80/aljj27hklIXD
	pI2FzTp87D4IuZmq+dLlvgegB7+xc3sL4n4YawtA/0WNYJW78clhrnoKy3aje6jyd0YmVJeNIrqrx
	wWLYAx9wPzWhDTljFhNxIACxq4o2esm22a5mlUm6QtUDSU1lifIgU0tzOuQUL7QNk++yrIfQ9yABf
	qVwQngukvCDisgh8ztN0ooFjJYJ9kZe79Lv+MIT/jHzgta0bV4SzGVx7JM8GpgWpgNhIAeC9ycwjl
	IxCHJy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdV5s-0000000F92J-2swP;
	Wed, 07 Jan 2026 15:05:04 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdV5p-0000000F91X-2NdJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 15:05:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ORgRBCEvHqF3ASwTkSpJbEavEYI/IdEmj28e0XJZgk0=;
	b=ylo8m+NR4VGDUUtfFrV00L9BCU/BsyRDLU+PD/LlKgOIAoCoGPwulnxrlY7QIJBwlwr6Z1kva
	5/TNF3rVuCJVnrIOLbIVHVLxVp/5Hs98GcBIX1BQ3bH/cWl85z5FK0kXV7z9TvMt82jRPtbBVFp
	g1x+0lAX7JWkZ1908ZyaNWA=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dmWVQ6PNzz1vnMS;
	Wed,  7 Jan 2026 23:02:38 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmWXp4qKRzJ46D6;
	Wed,  7 Jan 2026 23:04:42 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 09E1B4056F;
	Wed,  7 Jan 2026 23:04:46 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 15:04:44 +0000
Date: Wed, 7 Jan 2026 15:04:42 +0000
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
Subject: Re: [PATCH v2 20/36] KVM: arm64: gic-v5: Init Private IRQs (PPIs)
 for GICv5
Message-ID: <20260107150442.00004110@huawei.com>
In-Reply-To: <20251219155222.1383109-21-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-21-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_070502_032512_08647D09 
X-CRM114-Status: GOOD (  21.00  )
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

On Fri, 19 Dec 2025 15:52:42 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Initialise the private interrupts (PPIs, only) for GICv5. This means
> that a GICv5-style intid is generated (which encodes the PPI type in
> the top bits) instead of the 0-based index that is used for older
> GICs.
> 
> Additionally, set all of the GICv5 PPIs to use Level for the handling
> mode, with the exception of the SW_PPI which uses Edge. This matches
> the architecturally-defined set in the GICv5 specification (the CTIIRQ
> handling mode is IMPDEF, so pick Level has been picked for that).

so Level has been

> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Trivial comment inline, which you can feel free to ignore if you like

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  arch/arm64/kvm/vgic/vgic-init.c    | 41 +++++++++++++++++++++++-------
>  include/linux/irqchip/arm-gic-v5.h |  2 ++
>  2 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index bcc2c79f7833c..03f45816464b0 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c

> @@ -280,22 +286,39 @@ static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu, u32 type)
>  	 * Enable and configure all SGIs to be edge-triggered and
>  	 * configure all PPIs as level-triggered.
>  	 */
> -	for (i = 0; i < VGIC_NR_PRIVATE_IRQS; i++) {
> +	for (i = 0; i < num_private_irqs; i++) {
>  		struct vgic_irq *irq = &vgic_cpu->private_irqs[i];
>  
>  		INIT_LIST_HEAD(&irq->ap_list);
>  		raw_spin_lock_init(&irq->irq_lock);
> -		irq->intid = i;
>  		irq->vcpu = NULL;
>  		irq->target_vcpu = vcpu;
>  		refcount_set(&irq->refcount, 0);
> -		if (vgic_irq_is_sgi(i)) {
> -			/* SGIs */
> -			irq->enabled = 1;
> -			irq->config = VGIC_CONFIG_EDGE;
> +		if (!vgic_is_v5(vcpu->kvm)) {
> +			irq->intid = i;
> +			if (vgic_irq_is_sgi(i)) {
> +				/* SGIs */
> +				irq->enabled = 1;
> +				irq->config = VGIC_CONFIG_EDGE;
> +			} else {
> +				/* PPIs */
> +				irq->config = VGIC_CONFIG_LEVEL;
> +			}
>  		} else {
> -			/* PPIs */
> -			irq->config = VGIC_CONFIG_LEVEL;
> +			irq->intid = i | FIELD_PREP(GICV5_HWIRQ_TYPE,
> +						    GICV5_HWIRQ_TYPE_PPI);
Trivial:
I'd use FIELD_PREP() even for the ID part.  Makes no difference other than
making it explicit that it's a field that doesn't overlap with the type
one.


