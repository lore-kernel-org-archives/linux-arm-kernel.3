Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C24DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlCe3G3gNpw+dy14NvvU3l9a5Cgq9Bj8hdz/dmjm3X8=; b=uxNzpujFlbUfjGfgRUTAvdbXd3
	c3PyAvqfZQkJZXDZ0WWp63Vnf9oDgNpnwoaJE0zUZEAwj/YvUyaM6Sb50JWPZzvLrRZofjY56tAAZ
	qa1Vj1nSjkVpezx5Ej2fjosLVfuf+JYnn1mcXMp60Eu1UF/CLycwSo4/+bBQk46cMcJh7eFkdwux1
	9mCSXuYMQE47XD/pWKJZYVgi2eiq58PEYHtQEbiXVsVrVXpIMkJ/RwzgiG7m2ZF6Hj9oIcjNjgETQ
	EeDdhCFNvjcWl6ak8HFB4+hzZyw6d3EVg5+45AQG4UdmujfVzSOq2x/m+ZSQhkVHgaZws2wIvwgo7
	oJ/Pd4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzLQ-00000008mah-3weH;
	Wed, 02 Jul 2025 15:25:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyRk-00000008d4v-2Wsr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:28:26 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXMfy4N74z6M4tS;
	Wed,  2 Jul 2025 22:27:22 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 53C1F1402EA;
	Wed,  2 Jul 2025 22:28:18 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 2 Jul
 2025 16:28:17 +0200
Date: Wed, 2 Jul 2025 15:28:16 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH v2 1/5] irqchip/gic-v5: Skip deactivate for forwarded
 PPI interrupts
Message-ID: <20250702152816.000010da@huawei.com>
In-Reply-To: <20250627100847.1022515-2-sascha.bischoff@arm.com>
References: <20250627100847.1022515-1-sascha.bischoff@arm.com>
	<20250627100847.1022515-2-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_072824_931176_2C4765AF 
X-CRM114-Status: GOOD (  21.22  )
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

On Fri, 27 Jun 2025 10:09:01 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> If a PPI interrupt is forwarded to a guest, skip the deactivate and
> only EOI. Rely on the guest deactivating both the virtual and physical
> interrupts (due to ICH_LRx_EL2.HW being set) later on as part of
> handling the injected interrupt. This mimics the behaviour seen on
> native GICv3.
> 
> This is part of adding support for the GICv3 compatibility mode on a
> GICv5 host.
> 
> Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 

Trivial but no gaps in tag blocks.  So no blank line here.
Some scripting will moan about this and I think that will hit you if
this goes into linux next.

> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index 7a11521eeeca..6b42c4af5c79 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -213,6 +213,12 @@ static void gicv5_hwirq_eoi(u32 hwirq_id, u8 hwirq_type)
>  
>  static void gicv5_ppi_irq_eoi(struct irq_data *d)
>  {
> +	/* Skip deactivate for forwarded PPI interrupts */
> +	if (irqd_is_forwarded_to_vcpu(d)) {
> +		gic_insn(0, CDEOI);
> +		return;
> +	}
> +
>  	gicv5_hwirq_eoi(d->hwirq, GICV5_HWIRQ_TYPE_PPI);
>  }
>  
> @@ -494,6 +500,16 @@ static bool gicv5_ppi_irq_is_level(irq_hw_number_t hwirq)
>  	return !!(read_ppi_sysreg_s(hwirq, PPI_HM) & bit);
>  }
>  
> +static int gicv5_ppi_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu)
> +{
> +	if (vcpu)
> +		irqd_set_forwarded_to_vcpu(d);
> +	else
> +		irqd_clr_forwarded_to_vcpu(d);
> +
> +	return 0;
> +}
> +
>  static const struct irq_chip gicv5_ppi_irq_chip = {
>  	.name			= "GICv5-PPI",
>  	.irq_mask		= gicv5_ppi_irq_mask,
> @@ -501,6 +517,7 @@ static const struct irq_chip gicv5_ppi_irq_chip = {
>  	.irq_eoi		= gicv5_ppi_irq_eoi,
>  	.irq_get_irqchip_state	= gicv5_ppi_irq_get_irqchip_state,
>  	.irq_set_irqchip_state	= gicv5_ppi_irq_set_irqchip_state,
> +	.irq_set_vcpu_affinity	= gicv5_ppi_irq_set_vcpu_affinity,
>  	.flags			= IRQCHIP_SKIP_SET_WAKE	  |
>  				  IRQCHIP_MASK_ON_SUSPEND,
>  };


