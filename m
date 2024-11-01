Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D64E6B278
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ou58hKRtbuCdZ6nv3zgkZh8JqnndITWAtzdUhM0Jops=; b=hUXUOeUsUEsbdcXB4Y4VpNEoB9
	vwIkbJZ2+aZQhpOatFWLU9S7MIdNpUj/SyO7Who6FprGzxmg3eYafeyPQcgJl6i/1gVmcPBOQxY1i
	BuRU6pIZWkLQz/k1BF0gKJDrJqte3f9U65P2z9bu4pyEtIiM/d4xLMaLJOJLiybDlfpobWNW0c/ah
	6t/7yGE3l2OoSEofiVygzCggZCJdhY1WhGL8C6TaMBaNGnPnW3DZE/FWx6MXEQBzkzu1+5MDhO2bR
	EESU+jyDBIOo71PNldBudg3wm95C3kU5hUYaofiWxwuInRzf6/fQHRL9SdDjLLmYu20sxxOdhq/VV
	191/o3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rcg-00000007ANd-1rTT;
	Fri, 01 Nov 2024 13:23:30 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rVc-000000078rh-3w5Y;
	Fri, 01 Nov 2024 13:16:17 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1F8C421904;
	Fri,  1 Nov 2024 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730466969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ou58hKRtbuCdZ6nv3zgkZh8JqnndITWAtzdUhM0Jops=;
	b=N5qU9HlnxQww7f/jFVhb+TreokcR5nYGBPs56+9P4aTQDjN+8Bj7WlCeMeK1hQt7Idgdjy
	dGMzu8UM+a7MikJs1jZJWMCT2tamwRgPRLL0qkdCR/Krc+Ai2oh/oZRn7OO4xwEjg+QLRZ
	tqAkKPYlM66v7AFnS+d/0LJ+lR+zDmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730466969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ou58hKRtbuCdZ6nv3zgkZh8JqnndITWAtzdUhM0Jops=;
	b=3XSEdShcJqvIG1sQ/dEevVFXPGHhuff85A8UEmmR1TQeJjZI/GUAsBTTtjI5fgmxUwn/0X
	d9WCrmRKk8Cdt6DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eVGoFl8R;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/xubP/1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730466968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ou58hKRtbuCdZ6nv3zgkZh8JqnndITWAtzdUhM0Jops=;
	b=eVGoFl8REMHsjsVk8icKiA/GmNPwD0v3UZANVctU47p9tPOCUId5poNMhy9vxBv8yGegeG
	BQBWDD6tdPjXsnRgkh0TLLgiSV9cRlBMxd3dR9ncVHDGYXJ9ikUk/JSZKE647MYeVXamQd
	hGEX3q1YX642dGiQuo1b8J6pGCyfr54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730466968;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ou58hKRtbuCdZ6nv3zgkZh8JqnndITWAtzdUhM0Jops=;
	b=/xubP/1VDB2gEXirWE3+4FHqqexw0vOe8LOC3xbu+FMXVca9L5Gs/BoXFF9desmaE8Zi3R
	8WEXrDfeG83eEoDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D370136D9;
	Fri,  1 Nov 2024 13:16:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F5hlAJfUJGdgdQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 01 Nov 2024 13:16:07 +0000
Message-ID: <421d7d37-f368-4eb3-9135-2d547cf590e6@suse.de>
Date: Fri, 1 Nov 2024 15:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] irqchip: Add Broadcom bcm2712 MSI-X interrupt
 controller
To: Thomas Gleixner <tglx@linutronix.de>,
 Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>
References: <20241025124515.14066-1-svarbanov@suse.de>
 <20241025124515.14066-4-svarbanov@suse.de> <87ttcw0z6y.ffs@tglx>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <87ttcw0z6y.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1F8C421904
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmail.com,google.com,linux.com,pengutronix.de,suse.com,raspberrypi.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_061613_171962_19287ED0 
X-CRM114-Status: GOOD (  28.71  )
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

Hi Thomas,

Thank you for the review!

On 10/28/24 22:06, Thomas Gleixner wrote:
> On Fri, Oct 25 2024 at 15:45, Stanimir Varbanov wrote:
> 
>> Add an interrupt controller driver for MSI-X Interrupt Peripheral (MIP)
>> hardware block found in bcm2712. The interrupt controller is used to
>> handle MSI-X interrupts from peripherials behind PCIe endpoints like
>> RP1 south bridge found in RPi5.
>>
>> There are two MIPs on bcm2712, the first has 64 consecutive SPIs
>> assigned to 64 output vectors, and the second has 17 SPIs, but only
>> 8 of them are consecutive starting at the 8th output vector.
> 
> This starts to converge nicely. Just a few remaining nitpicks.
> 
>> +static int mip_alloc_hwirq(struct mip_priv *mip, unsigned int nr_irqs,
>> +			   unsigned int *hwirq)
>> +{
>> +	int bit;
>> +
>> +	spin_lock(&mip->lock);
>> +	bit = bitmap_find_free_region(mip->bitmap, mip->num_msis,
>> +				      ilog2(nr_irqs));
>> +	spin_unlock(&mip->lock);
> 
> This should be
> 
>         scoped_guard(spinlock, &mip->lock)
> 		bit = bitmap_find_free_region(mip->bitmap, mip->num_msis, ilog2(nr_irqs));
> 
>> +	if (bit < 0)
>> +		return bit;
>> +
>> +	if (hwirq)
>> +		*hwirq = bit;
> 
> But what's the point of this conditional? The only call site hands in a
> valid pointer, no?
> 
>> +	return 0;
> 
> And therefore the whole thing can be simplified to:
> 
> static int mip_alloc_hwirq(struct mip_priv *mip, unsigned int nr_irqs)
> {
>         guard(spinlock)(&mip_lock);
>         return bitmap_find_free_region(mip->bitmap, mip->num_msis, ilog2(nr_irqs));
> }
> 
> and the callsite becomes:
> 
>         irq = mip_alloc_hwirq(mip, nr_irqs);
>         if (irq < 0)
>         	return irq;
> Hmm?
> 
>> +}
>> +
>> +static void mip_free_hwirq(struct mip_priv *mip, unsigned int hwirq,
>> +			   unsigned int nr_irqs)
>> +{
>> +	spin_lock(&mip->lock);
> 
> 	guard(spinlock)(&mip->lock);

Will address the above comments in next version.

> 
>> +	bitmap_release_region(mip->bitmap, hwirq, ilog2(nr_irqs));
>> +	spin_unlock(&mip->lock);
>> +}
> 
>> +	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &fwspec);
>> +	if (ret) {
>> +		mip_free_hwirq(mip, irq, nr_irqs);
>> +		return ret;
> 
>                 goto err_free_hwirq; ?
> 
>> +	}
>> +
>> +	for (i = 0; i < nr_irqs; i++) {
>> +		irqd = irq_domain_get_irq_data(domain->parent, virq + i);
>> +		irqd->chip->irq_set_type(irqd, IRQ_TYPE_EDGE_RISING);
>> +
>> +		ret = irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
>> +						    &mip_middle_irq_chip, mip);
>> +		if (ret)
>> +			goto err_free;
>> +
>> +		irqd = irq_get_irq_data(virq + i);
>> +		irqd_set_single_target(irqd);
>> +		irqd_set_affinity_on_activate(irqd);
>> +	}
>> +
>> +	return 0;
>> +
>> +err_free:
>> +	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
>> +	mip_free_hwirq(mip, irq, nr_irqs);
>> +	return ret;
>> +}
>> +
>> +static int __init mip_of_msi_init(struct device_node *node,
>> +				  struct device_node *parent)
> 
> No line break required here.

OK.

> 
>> +{
>> +	struct platform_device *pdev;
>> +	struct mip_priv *mip;
>> +	int ret;
>> +
>> +	pdev = of_find_device_by_node(node);
>> +	of_node_put(node);
>> +	if (!pdev)
>> +		return -EPROBE_DEFER;
>> +
>> +	mip = kzalloc(sizeof(*mip), GFP_KERNEL);
>> +	if (!mip)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_init(&mip->lock);
>> +	mip->dev = &pdev->dev;
>> +
>> +	ret = mip_parse_dt(mip, node);
>> +	if (ret)
>> +		goto err_priv;
>> +
>> +	mip->base = of_iomap(node, 0);
>> +	if (!mip->base) {
>> +		ret = -ENXIO;
>> +		goto err_priv;
>> +	}
>> +
>> +	mip->bitmap = bitmap_zalloc(mip->num_msis, GFP_KERNEL);
>> +	if (!mip->bitmap) {
>> +		ret = -ENOMEM;
>> +		goto err_base;
>> +	}
>> +
>> +	/*
>> +	 * All MSI-X masked in for the host, masked out for the
>> +	 * VPU, and edge-triggered.
>> +	 */
>> +	writel(0, mip->base + MIP_INT_MASKL_HOST);
>> +	writel(0, mip->base + MIP_INT_MASKH_HOST);
>> +	writel(~0, mip->base + MIP_INT_MASKL_VPU);
>> +	writel(~0, mip->base + MIP_INT_MASKH_VPU);
>> +	writel(~0, mip->base + MIP_INT_CFGL_HOST);
>> +	writel(~0, mip->base + MIP_INT_CFGH_HOST);
> 
> What undoes that in case mpi_init_domains() fails? Or is it harmless? I
> really have no idea what masked in and masked out means here.

It should be harmless, but I could move registers initialization in
mip_init_domains() and fix the comments.

> 
>> +	dev_dbg(&pdev->dev,
>> +		"MIP: MSI-X count: %u, base: %u, offset: %u, msg_addr: %llx\n",
> 
> Please move the string up. You have 100 characters width available.

OK.

> 
>> +		mip->num_msis, mip->msi_base, mip->msi_offset, mip->msg_addr);
> 
> Thanks,
> 
>         tglx

regards,
~Stan

