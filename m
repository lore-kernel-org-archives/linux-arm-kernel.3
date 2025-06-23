Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFC5C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YENhMs4/6mnixeMLP66geyPQgG06rHwcdJ2WanceGTQ=; b=qacnYDRFnLwEy+EZBNeDalwpGJ
	iDibvx5pa2/fcmebkgrz1qdyZJHxp3ksqLioxvr/2WJ6sJYkQy1/XpocQ98dS73Uo2ABdoyozg2Qw
	sgWYNC2hBW6kE/EXeRUa+7DnaD2ZCWvs6lK6Hz7SxxkYWOTU/uDAU/RBBzxXTuhKEYyElQPsBztxf
	jIUwkjjjW1oFQZJu9sohi6a6NaH5FH4UQCS8xKZQJE7ReJ8vnGqJDCMQzNvGcbr/MyQkDr/IEUDcl
	hfpmi0ZQi7rrYRnIPk5KS4EeLK0L+KVX68MxKwg9M04CJtJ/hGkQj4rdXfK5k3T80u4LvFw32If/n
	X75Z3h+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTmOK-00000003lT7-2HHN;
	Mon, 23 Jun 2025 18:59:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiyv-00000003Czk-48Eq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:21:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA65B5C5A76;
	Mon, 23 Jun 2025 15:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A034C4CEEA;
	Mon, 23 Jun 2025 15:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750692073;
	bh=AO8oR9iVOI3X3E2H+YguT8JIoUYuH/+e9B86cY82fto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sa+E3D8P4hEplewoicY3Mvfbf4eR2Yo3VUfGk+HHCP5ZBEVNk5ilpjQhWbrsTiCdC
	 j+CngHKTkWWRmYVxRaRrX1dqJlq8EeMIknsiE6xq5D9SzAYt4IIP4Z8HUbgKTbs4FN
	 qVOM08civmJRGvOsffFXSJgKDJXDyBmWxsuDHhgkFPG5qTLQjZPM9K9dQV2S+XBBo2
	 vQrWZASrHOvgjJvjtHT+QNTIxyK+F8tW9SRonKLYT+KfivTmEPxjX3B1kx+Fe7yId5
	 30TZvOO+kK50QC7CP3ShJLMiph/awnZRvDul3fzpWj6qrsdVKn3aMSkQDbS8yQKRkk
	 P0xUF1/W8G/oQ==
Date: Mon, 23 Jun 2025 17:21:06 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH 1/5] irqchip/gic-v5: Skip deactivate for forwarded PPI
 interrupts
Message-ID: <aFlw4lOj8tUGrSTb@lpieralisi>
References: <20250620160741.3513940-1-sascha.bischoff@arm.com>
 <20250620160741.3513940-2-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620160741.3513940-2-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_082114_107761_3CB4C49B 
X-CRM114-Status: GOOD (  21.34  )
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

On Fri, Jun 20, 2025 at 04:07:50PM +0000, Sascha Bischoff wrote:
> If a PPI interrupt is forwarded to a guest, skip the deactivate and
> only EOI. Rely on the guest deactivating the both the virtual and

"deactivating both"

> physical interrupts (due to ICH_LRx_EL2.HW being set) later on as part
> of handling the injected interrupt. This mimics the behaviour seen on
> native GICv3.
> 
> This is part of adding support for the GICv3 compatibility mode on a
> GICv5 host.
> 
> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index 4a0990f46358..28853d51a2ea 100644
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
> -- 
> 2.34.1

