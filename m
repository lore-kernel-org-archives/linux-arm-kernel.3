Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68526C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHHOsjczkVFUY6E2hS+Jh4/Pa4zvDuuQuUVaZE+j9m0=; b=Ut8kBYj9MsFXL9oDEBs5R3c6ca
	y95qpzNZjDMZ8B1S0Om9p31XP7RI+BDfd7uZycvc2a/9Uh3DrtPLj24RmUW8mndUQNdTJox0IwVGC
	wxtm5b9NZho3xItaspsud7y7qGj14X+M1d4uJ35o/9PLbYVhX/t88br9BL11rmWdlfYsFxh1WjFXB
	Os2EZuaOfUU/gNsVw3vkglfpf9pxkyabSSeQrv844LswgKCUiBjBEOOJdeU57vMsDeKO0pk6cjG1q
	9bCnanQqgwsxYCkKmKKNjPh6cZlmNHdrAxfM44o8TH3/9G8E8FCostptrYqeytGG4g93Ev0mwNgmR
	53S2aHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ49f-000000021Kw-3oLC;
	Sat, 18 Jan 2025 08:26:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ48P-000000021CL-0CRT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 08:24:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E3A4A414A1;
	Sat, 18 Jan 2025 08:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D798C4CEE1;
	Sat, 18 Jan 2025 08:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737188687;
	bh=oT6x1/UPbJU0IyP7WL9HBzTJXPcBfOdY3PxFK3Y7jGo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tJYPEAJd0AGZe8PocR92lVmtXO3/z5Iez6qnLEopHkNaG9mysET1wN6YK64J2A54L
	 hXezxApN+kM5tULa7KBXq85CYpGNAHOQ3ee5mth3wu+rprISgVfYd6tmachMo1zN9Q
	 qoPtrFiM8xG5fB1BpYtZEsgcPGImq7imDTXiIxkgJ8aS8lco4NplDhNkk8iG5nZ+sE
	 tkP6I1FZayrPVW/VdYAn7IoYj5hiBiCjkrP1KAui2St1/erl1EW/MbJPQebFQgEOuU
	 T9gq+nQPuyOkqLEF+fV8x2xi0dXscw8YbIiDUY6ehlyebRH32ZwjRuEo/TszKbef9V
	 k3JDJBx2tLuGQ==
Message-ID: <907dade8-0e11-4d99-acb5-2d35ba729932@kernel.org>
Date: Sat, 18 Jan 2025 09:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
To: Kevin Chen <kevin_chen@aspeedtech.com>, joel@jms.id.au,
 andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 elbadrym@google.com
References: <20250117095217.661070-1-kevin_chen@aspeedtech.com>
 <20250117095217.661070-4-kevin_chen@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250117095217.661070-4-kevin_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_002449_224181_4855B990 
X-CRM114-Status: GOOD (  22.68  )
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

On 17/01/2025 10:52, Kevin Chen wrote:
> Add LPC PCC controller driver to support POST code capture.
> 
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
> ---


This patch was never tested with your DTS and bindings. Please do not
send untested code.

> +
> +/*
> + * A2600-15 AP note
> + *
> + * SW workaround to prevent generating Non-Fatal-Error (NFE)
> + * eSPI response when PCC is used for port I/O byte snooping
> + * over eSPI.
> + */
> +static int aspeed_a2600_15(struct aspeed_pcc *pcc, struct device *dev)
> +{
> +	struct device_node *np;
> +	u32 hicrb_en;
> +
> +	/* abort if snoop is enabled */
> +	np = of_find_compatible_node(dev->parent->of_node, NULL, "aspeed,ast2600-lpc-snoop");

No, don't sprinkle compatible to epxress relationship. Use proper
phandles or parent-child relationship.

> +	if (np) {
> +		if (of_device_is_available(np)) {
> +			dev_err(dev, "A2600-15 should be applied with snoop disabled\n");
> +			return -EPERM;
> +		}
> +	}
> +
> +	/* abort if port is not 4-bytes continuous range */
> +	if (pcc->port_xbits != 0x3) {
> +		dev_err(dev, "A2600-15 should be applied on 4-bytes continuous I/O address range\n");
> +		return -EINVAL;
> +	}
> +
> +	/* set SNPWADR of snoop device */
> +	regmap_write(pcc->regmap, SNPWADR, pcc->port | ((pcc->port + 2) << 16));
> +
> +	/* set HICRB[15:14]=11b to enable ACCEPT response for SNPWADR */
> +	hicrb_en = HICRB_ENSNP0D | HICRB_ENSNP1D;
> +	regmap_update_bits(pcc->regmap, HICRB, hicrb_en, hicrb_en);
> +
> +	/* set HICR6[19] to extend SNPWADR to 2x range */
> +	regmap_update_bits(pcc->regmap, HICR6, HICR6_EN2BMODE, HICR6_EN2BMODE);
> +
> +	return 0;
> +}
> +
> +static int aspeed_pcc_enable(struct aspeed_pcc *pcc, struct device *dev)
> +{
> +	int rc;
> +
> +	if (pcc->a2600_15) {
> +		rc = aspeed_a2600_15(pcc, dev);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	/* record mode */
> +	regmap_update_bits(pcc->regmap, PCCR0,
> +			   PCCR0_MODE_SEL_MASK,
> +			   pcc->rec_mode << PCCR0_MODE_SEL_SHIFT);
> +
> +	/* port address */
> +	regmap_update_bits(pcc->regmap, PCCR1,
> +			   PCCR1_BASE_ADDR_MASK,
> +			   pcc->port << PCCR1_BASE_ADDR_SHIFT);
> +
> +	/* port address high bits selection or parser control */
> +	regmap_update_bits(pcc->regmap, PCCR0,
> +			   PCCR0_ADDR_SEL_MASK,
> +			   pcc->port_hbits_select << PCCR0_ADDR_SEL_SHIFT);
> +
> +	/* port address dont care bits */
> +	regmap_update_bits(pcc->regmap, PCCR1,
> +			   PCCR1_DONT_CARE_BITS_MASK,
> +			   pcc->port_xbits << PCCR1_DONT_CARE_BITS_SHIFT);
> +
> +	/* set DMA ring buffer size and enable interrupts */
> +	if (pcc->dma_mode) {
> +		regmap_write(pcc->regmap, PCCR4, pcc->dma.addr & 0xffffffff);
> +		regmap_update_bits(pcc->regmap, PCCR5, PCCR5_DMA_ADDRH_MASK,
> +				   (pcc->dma.addr >> 32) << PCCR5_DMA_ADDRH_SHIFT);
> +		regmap_update_bits(pcc->regmap, PCCR5, PCCR5_DMA_LEN_MASK,
> +				   (pcc->dma.size / 4) << PCCR5_DMA_LEN_SHIFT);
> +		regmap_update_bits(pcc->regmap, PCCR0,
> +				   PCCR0_EN_DMA_INT | PCCR0_EN_DMA_MODE,
> +				   PCCR0_EN_DMA_INT | PCCR0_EN_DMA_MODE);
> +	} else {
> +		regmap_update_bits(pcc->regmap, PCCR0, PCCR0_RX_TRIG_LVL_MASK,
> +				   PCC_FIFO_THR_4_EIGHTH << PCCR0_RX_TRIG_LVL_SHIFT);
> +		regmap_update_bits(pcc->regmap, PCCR0,
> +				   PCCR0_EN_RX_TMOUT_INT | PCCR0_EN_RX_AVAIL_INT,
> +				   PCCR0_EN_RX_TMOUT_INT | PCCR0_EN_RX_AVAIL_INT);
> +	}
> +
> +	regmap_update_bits(pcc->regmap, PCCR0, PCCR0_EN, PCCR0_EN);
> +
> +	return 0;
> +}
> +
> +static int aspeed_pcc_probe(struct platform_device *pdev)
> +{
> +	int rc;
> +	struct aspeed_pcc *pcc;
> +	struct device *dev = &pdev->dev;
> +	uint32_t fifo_size = PAGE_SIZE;
> +
> +	pcc = devm_kzalloc(&pdev->dev, sizeof(*pcc), GFP_KERNEL);

Why not dev?

> +	if (!pcc)
> +		return -ENOMEM;
> +
> +	pcc->dev = dev;
> +	rc = of_property_read_u32(dev->of_node, "port-addr", &pcc->port);

Nope

> +	if (rc) {
> +		dev_err(dev, "cannot get port address\n");
> +		return -ENODEV;
> +	}
> +
> +	/* optional, by default: 0 -> 1-Byte mode */
> +	of_property_read_u32(dev->of_node, "rec-mode", &pcc->rec_mode);

Nope

> +	if (!is_valid_rec_mode(pcc->rec_mode)) {
> +		dev_err(dev, "invalid record mode: %u\n",
> +			pcc->rec_mode);
> +		return -EINVAL;
> +	}
> +
> +	/* optional, by default: 0 -> no don't care bits */
> +	of_property_read_u32(dev->of_node, "port-addr-xbits", &pcc->port_xbits);

Nope

> +
> +	/*
> +	 * optional, by default: 0 -> no high address bits
> +	 *
> +	 * Note that when record mode is set to 1-Byte, this
> +	 * property is ignored and the corresponding HW bits
> +	 * behave as read/write cycle parser control with the
> +	 * value set to 0b11
> +	 */
> +	if (pcc->rec_mode) {
> +		of_property_read_u32(dev->of_node, "port-addr-hbits-select",

Nope, none of these properties exist.

> +				     &pcc->port_hbits_select);
> +		if (!is_valid_high_bits_select(pcc->port_hbits_select)) {
> +			dev_err(dev, "invalid high address bits selection: %u\n",
> +				pcc->port_hbits_select);
> +			return -EINVAL;
> +		}
> +	} else {
> +		pcc->port_hbits_select = 0x3;
> +	}
> +
> +	/* AP note A2600-15 */
> +	pcc->a2600_15 = of_property_read_bool(dev->of_node, "A2600-15");

NAK even more.

> +	if (pcc->a2600_15)
> +		dev_info(dev, "A2600-15 AP note patch is selected\n");
> +> +	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +	if (rc) {
> +		dev_err(dev, "cannot set 64-bits DMA mask\n");
> +		return rc;
> +	}
> +
> +	pcc->dma_mode = of_property_read_bool(dev->of_node, "dma-mode");

NAK, drop

> +	if (pcc->dma_mode) {
> +		pcc->dma.size = PCC_DMA_BUFSZ;
> +		pcc->dma.virt = dmam_alloc_coherent(dev,
> +						    pcc->dma.size,
> +						    &pcc->dma.addr,
> +						    GFP_KERNEL);
> +		if (!pcc->dma.virt) {
> +			dev_err(dev, "cannot allocate DMA buffer\n");
> +			return -ENOMEM;
> +		}
> +
> +		fifo_size = roundup(pcc->dma.size, PAGE_SIZE);
> +	}
> +
> +	rc = kfifo_alloc(&pcc->fifo, fifo_size, GFP_KERNEL);
> +	if (rc) {
> +		dev_err(dev, "cannot allocate kFIFO\n");

Run coccinelle on your code first.

> +		return -ENOMEM;
> +	}
> +
> +	pcc->regmap = syscon_node_to_regmap(pdev->dev.parent->of_node);
> +	if (IS_ERR(pcc->regmap)) {
> +		dev_err(dev, "cannot map register\n");
> +		return -ENODEV;
> +	}
> +
> +	/* Disable PCC and DMA Mode for safety */
> +	regmap_update_bits(pcc->regmap, PCCR0, PCCR0_EN |  PCCR0_EN_DMA_MODE, 0);
> +
> +	/* Clear Rx FIFO. */
> +	regmap_update_bits(pcc->regmap, PCCR0, PCCR0_CLR_RX_FIFO, 1);
> +
> +	/* Clear All interrupts status. */
> +	regmap_write(pcc->regmap, PCCR2,
> +		     PCCR2_INT_STATUS_RX_OVER | PCCR2_INT_STATUS_DMA_DONE |
> +		     PCCR2_INT_STATUS_PATTERN_A | PCCR2_INT_STATUS_PATTERN_B);
> +
> +	pcc->irq = platform_get_irq(pdev, 0);
> +	if (pcc->irq < 0) {
> +		dev_err(dev, "cannot get IRQ\n");
> +		rc = -ENODEV;
> +		goto err_free_kfifo;
> +	}
> +
> +	rc = devm_request_irq(dev, pcc->irq, aspeed_pcc_isr, 0, DEVICE_NAME, pcc);
> +	if (rc < 0) {
> +		dev_err(dev, "cannot request IRQ handler\n");
> +		goto err_free_kfifo;
> +	}
> +
> +	init_waitqueue_head(&pcc->wq);
> +
> +	pcc->mdev_id = ida_alloc(&aspeed_pcc_ida, GFP_KERNEL);
> +	if (pcc->mdev_id < 0) {
> +		dev_err(dev, "cannot allocate ID\n");
> +		return pcc->mdev_id;
> +	}
> +
> +	pcc->mdev.parent = dev;
> +	pcc->mdev.minor = MISC_DYNAMIC_MINOR;
> +	pcc->mdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME,
> +					pcc->mdev_id);
> +	pcc->mdev.fops = &pcc_fops;
> +	rc = misc_register(&pcc->mdev);
> +	if (rc) {
> +		dev_err(dev, "cannot register misc device\n");
> +		goto err_free_kfifo;
> +	}
> +
> +	rc = aspeed_pcc_enable(pcc, dev);
> +	if (rc) {
> +		dev_err(dev, "cannot enable PCC\n");
> +		goto err_dereg_mdev;
> +	}
> +
> +	dev_set_drvdata(&pdev->dev, pcc);
> +
> +	dev_info(dev, "module loaded\n");

Drop such function success messages, everywhere.

Best regards,
Krzysztof

