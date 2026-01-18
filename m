Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AD2C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPNhvj9eSn2TIVzzd0vGV/U5x/JgJw5DbqJs3kh0IPY=; b=O/Nw/cXDzoGDBHvPox3m42TorS
	VGNPWrUZ+xscYDXq4aGG1Jv+NpXIJ5PORKqg0tfKg38U0xsOx0JsZLfjkXOkOIBPSFrVqf+1l/5Le
	cQrPqjs728BdO3C2r4mBrMBsSerCNMbM+WeeiyMWTXVd7m2lLvuiO49o9H7WGaSF/Ci6w4o1e+50W
	lgv7LWbyDzm4f35+yYUG2wTyUC6zt7ba3Ck4UYWfxLjIBxSKdKbEpVgky2z9rae8Q93ijCePaZLe7
	uCAy9jgIMVhgOJ5KdtpMONYDMDXnI7wTd2F6P8s7Bs+OoeE4nokJEIEW29vwU07rFOVmpowMTsGz9
	vuZ8xomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPP8-0000000HFb1-3Ytz;
	Sun, 18 Jan 2026 09:49:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPP7-0000000HFai-48on
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 09:49:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C32D96011E;
	Sun, 18 Jan 2026 09:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94120C116D0;
	Sun, 18 Jan 2026 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768729744;
	bh=o6onDjxx6rTGf8Z/6sCDmtq0AOwSAosZSx2+SVktQHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YAm2tfEngsbjOlbRimfTOnszwn9EkE4lgIbAK6ybbKj50IpbuRMg95TntujYv3m94
	 +jB33w/yV9Buq9jbQtc5wz9csGDPzO1A3TOR6phdz0nYCc4i8N/FvcvspZIeSwZJF2
	 lRS733FBaOvu5/QQAGsw832XFL2w8VZleLaX9KKjxqRcflfNrgG5eWDNjhGELC7XQT
	 ha/Miql2c7WSgclFv9mFWQLkeG7J0t5PkiN7KEurBgBjIzNLFuCuO/UArkkKdLZDgA
	 yIik38DHa886nzab1zpbui/ZONgR+k8vjYmqtMWNfNYlsG0gxTQEz3WGUTV6CUczGd
	 6HRXuy/yJ/ptw==
From: Thomas Gleixner <tglx@kernel.org>
To: Aniket Limaye <a-limaye@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 u-kumar1@ti.com, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>
Cc: j-mcarthur@ti.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Aniket Limaye
 <a-limaye@ti.com>
Subject: Re: [PATCH 2/2] drivers: irqchip: irq-ti-sci-intr: Allow parsing
 interrupt-types per-line
In-Reply-To: <20260116-ul-driver-i2c-j722s-v1-2-c28e8ba38a9e@ti.com>
References: <20260116-ul-driver-i2c-j722s-v1-0-c28e8ba38a9e@ti.com>
 <20260116-ul-driver-i2c-j722s-v1-2-c28e8ba38a9e@ti.com>
Date: Sun, 18 Jan 2026 10:49:00 +0100
Message-ID: <8734432qur.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Jan 16 2026 at 18:38, Aniket Limaye wrote:

The subject line prefix is made up. Please follow the documented
conventions:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes

> Some INTR router instances act as simple passthroughs that preserve the
> source interrupt type unchanged at the output line, rather than converting
> all interrupts to a fixed type.
>
> When interrupt sources are not homogeneous with respect to trigger type,
> the driver needs to read each source's interrupt type from DT and pass it
> unchanged to its interrupt parent
>
> Previously, the interrupt type for all output lines was set globally using
> the "ti,intr-trigger-type" property (values 1 or 4).

What means 'previously'?

You want to describe the current state and not something which might be
in the past after applying the change.

> Add support for "ti,intr-trigger-type" = 15 (IRQ_TYPE_DEFAULT) to indicate
> passthrough mode:
> - When set to 15: Parse interrupt type per-line from DT
> - When set to 1 or 4: Use global setting (maintains backward compatibility)

> @@ -156,11 +168,27 @@ static int ti_sci_intr_alloc_parent_irq(struct irq_domain *domain,
>  		fwspec.param_count = 3;
>  		fwspec.param[0] = 0;	/* SPI */
>  		fwspec.param[1] = p_hwirq - 32; /* SPI offset */
> -		fwspec.param[2] = intr->type;
> +		fwspec.param[2] = hwirq_type;
>  	} else {
>  		/* Parent is Interrupt Router */
> -		fwspec.param_count = 1;
> -		fwspec.param[0] = p_hwirq;
> +		u32 parent_trigger_type;
> +
> +		err = of_property_read_u32(parent_node,
> +					  "ti,intr-trigger-type",
> +					  &parent_trigger_type);

You have 100 characters and if you need a line break align the second
line argument with the first line argument and not with the bracket.
See documentation.

> +		if (err)
> +			goto err_irqs;
> +
> +		if (parent_trigger_type != IRQ_TYPE_DEFAULT) {
> +			/* Parent has global trigger type */
> +			fwspec.param_count = 1;
> +			fwspec.param[0] = p_hwirq;
> +		} else {
> +			/* Parent supports per-line trigger types */
> +			fwspec.param_count = 2;
> +			fwspec.param[0] = p_hwirq;
> +			fwspec.param[1] = hwirq_type;
> +		}
>  	}
>  
>  	err = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
> @@ -197,14 +225,14 @@ static int ti_sci_intr_irq_domain_alloc(struct irq_domain *domain,
>  {
>  	struct irq_fwspec *fwspec = data;
>  	unsigned long hwirq;
> -	unsigned int flags;
> +	unsigned int hwirq_type;

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

>  	int err, out_irq;
>  
> -	err = ti_sci_intr_irq_domain_translate(domain, fwspec, &hwirq, &flags);
> +	err = ti_sci_intr_irq_domain_translate(domain, fwspec, &hwirq, &hwirq_type);
>  	if (err)
>  		return err;
>  
> -	out_irq = ti_sci_intr_alloc_parent_irq(domain, virq, hwirq);
> +	out_irq = ti_sci_intr_alloc_parent_irq(domain, virq, hwirq, hwirq_type);
>  	if (out_irq < 0)
>  		return out_irq;

Thanks,

        tglx

