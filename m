Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C19C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgBh8AQcVi7AFRtRmzFb3WZybV4Wj3hRk4V1MujGIEE=; b=VrqTCFPR5/SywxIL9m8q2cvReA
	DoSvyMx1/vaanQJS3Oh+3Fgdx6zO3J51bV/4IrMw1LkS0akDgnrZAsTcup1MhoRgx25Wl5yAcNpQc
	HT1epSnCzBWXJ539zzH31Tuuku+tvlneiEslhcp1IaVgLc1Y9F/1PDbwKaU6taUYirhJ1euKgyE+e
	RZe3xZmw1pvkpw4PUMCFRIqFMbtZG4VyNLdlVqp/PUYTe7Y4511fB39MGbpevdkhYMbuqLb9AJc53
	lUEh/mQMYx1b9XFBsXtl7GYxnucLmF9Am7Pb4DB5biMJQphwKLnVjvqDOCSXh9/u17XB/LsofqpwY
	pGE62v8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlyN-0000000340Y-0ESg;
	Tue, 11 Feb 2025 08:50:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlvU-000000033Cu-2Ckj;
	Tue, 11 Feb 2025 08:47:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38B48A40123;
	Tue, 11 Feb 2025 08:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A91C4CEE4;
	Tue, 11 Feb 2025 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739263647;
	bh=k21+EIxAbZ2RNWIs6sTtq5HkT0oP1NdfuQqJ3Cg0Xns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxbS8OPr0wU/c6E85F335oSSbrLRCaeujvXRA/pMYWGZJfoXEbIJdZBcnJWK0L3Uj
	 9g1oOOPo3F/iK9m+/pCESvVcC2ygY+Z+4K+6vWgREaNUoPOox7gvJvLCyR4lH7pzBs
	 kDZlUtdKVIa1h7cXUo0xolCxaGzYoSq53xtDrybMSGYzKC1i3TIHOX3SeJdqMCIKBK
	 D/Lv3AS6he/Q363o079npAvyOhBtCXTg4A/fZZp3RxXaHPLPFg0SU24Pb111btNqrY
	 HtgBzYCsg1HQIUcvilN8c9+Dzhc4efaErZsasZj4LHMV9Z8fz1qokGa5BJZHIyeH7o
	 hWsPzX+uPwscQ==
Date: Tue, 11 Feb 2025 09:47:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH net-next v3 13/16] net: airoha: Introduce PPE
 initialization via NPU
Message-ID: <20250211-fanatic-smoky-wren-f0dcc9@krzk-bin>
References: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
 <20250209-airoha-en7581-flowtable-offload-v3-13-dba60e755563@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250209-airoha-en7581-flowtable-offload-v3-13-dba60e755563@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_004728_747230_2F6CBEE5 
X-CRM114-Status: GOOD (  20.74  )
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

On Sun, Feb 09, 2025 at 01:09:06PM +0100, Lorenzo Bianconi wrote:
> +static irqreturn_t airoha_npu_wdt_handler(int irq, void *core_instance)
> +{
> +	struct airoha_npu_core *core = core_instance;
> +	struct airoha_npu *npu = core->npu;
> +	int c = core - &npu->cores[0];
> +	u32 val;
> +
> +	airoha_npu_rmw(npu, REG_WDT_TIMER_CTRL(c), 0, WDT_INTR_MASK);
> +	val = airoha_npu_rr(npu, REG_WDT_TIMER_CTRL(c));
> +	if (FIELD_GET(WDT_EN_MASK, val))
> +		schedule_work(&core->wdt_work);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +struct airoha_npu *airoha_npu_init(struct airoha_eth *eth)
> +{
> +	struct reserved_mem *rmem;
> +	int i, irq, err = -ENODEV;
> +	struct airoha_npu *npu;
> +	struct device_node *np;
> +
> +	npu = devm_kzalloc(eth->dev, sizeof(*npu), GFP_KERNEL);
> +	if (!npu)
> +		return ERR_PTR(-ENOMEM);
> +
> +	npu->np = of_parse_phandle(eth->dev->of_node, "airoha,npu", 0);
> +	if (!npu->np)
> +		return ERR_PTR(-ENODEV);

Why? The property is not required, so how can missing property fail the
probe?

This is also still unnecessary ABI break without explanation/reasoning.

> +
> +	npu->pdev = of_find_device_by_node(npu->np);
> +	if (!npu->pdev)
> +		goto error_of_node_put;

You should also add device link and probably try_module_get. See
qcom,ice (patch for missing try_module_get is on the lists).

> +
> +	get_device(&npu->pdev->dev);

Why? of_find_device_by_node() does it.

> +
> +	npu->base = devm_platform_ioremap_resource(npu->pdev, 0);
> +	if (IS_ERR(npu->base))
> +		goto error_put_dev;
> +
> +	np = of_parse_phandle(npu->np, "memory-region", 0);
> +	if (!np)
> +		goto error_put_dev;
> +
> +	rmem = of_reserved_mem_lookup(np);
> +	of_node_put(np);
> +
> +	if (!rmem)
> +		goto error_put_dev;
> +
> +	irq = platform_get_irq(npu->pdev, 0);
> +	if (irq < 0) {
> +		err = irq;
> +		goto error_put_dev;
> +	}
> +
> +	err = devm_request_irq(&npu->pdev->dev, irq, airoha_npu_mbox_handler,
> +			       IRQF_SHARED, "airoha-npu-mbox", npu);
> +	if (err)
> +		goto error_put_dev;
> +
> +	for (i = 0; i < ARRAY_SIZE(npu->cores); i++) {
> +		struct airoha_npu_core *core = &npu->cores[i];
> +
> +		spin_lock_init(&core->lock);
> +		core->npu = npu;
> +
> +		irq = platform_get_irq(npu->pdev, i + 1);
> +		if (irq < 0) {
> +			err = irq;
> +			goto error_put_dev;
> +		}

This is all confusing. Why are you requesting IRQs for other - the npu -
device? That device driver is responsible for its interrupts, not you
here. This breaks encapsulation. And what do you do if the other device
starts handling interrupts on its own? This is really unexpected to see
here.

> +
> +		err = devm_request_irq(&npu->pdev->dev, irq,
> +				       airoha_npu_wdt_handler, IRQF_SHARED,
> +				       "airoha-npu-wdt", core);
> +		if (err)
> +			goto error_put_dev;
> +
> +		INIT_WORK(&core->wdt_work, airoha_npu_wdt_work);
> +	}
> +
> +	if (dma_set_coherent_mask(&npu->pdev->dev, 0xbfffffff))
> +		dev_err(&npu->pdev->dev,
> +			"failed coherent DMA configuration\n");
> +
> +	err = airoha_npu_run_firmware(npu, rmem);
> +	if (err)
> +		goto error_put_dev;
> +
> +	airoha_npu_wr(npu, REG_CR_NPU_MIB(10),
> +		      rmem->base + NPU_EN7581_FIRMWARE_RV32_MAX_SIZE);
> +	airoha_npu_wr(npu, REG_CR_NPU_MIB(11), 0x40000); /* SRAM 256K */
> +	airoha_npu_wr(npu, REG_CR_NPU_MIB(12), 0);
> +	airoha_npu_wr(npu, REG_CR_NPU_MIB(21), 1);
> +	msleep(100);
> +
> +	/* setting booting address */
> +	for (i = 0; i < AIROHA_NPU_NUM_CORES; i++)
> +		airoha_npu_wr(npu, REG_CR_BOOT_BASE(i), rmem->base);
> +	usleep_range(1000, 2000);
> +
> +	/* enable NPU cores */
> +	/* do not start core3 since it is used for WiFi offloading */
> +	airoha_npu_wr(npu, REG_CR_BOOT_CONFIG, 0xf7);
> +	airoha_npu_wr(npu, REG_CR_BOOT_TRIGGER, 0x1);
> +	msleep(100);
> +
> +	return npu;
> +
> +error_put_dev:
> +	put_device(&npu->pdev->dev);

Missing platform_device_put()

> +error_of_node_put:
> +	of_node_put(npu->np);
> +
> +	return ERR_PTR(err);
> +}
> +
> +void airoha_npu_deinit(struct airoha_npu *npu)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(npu->cores); i++)
> +		cancel_work_sync(&npu->cores[i].wdt_work);
> +

Leaking device put.

> +	put_device(&npu->pdev->dev);
> +	of_node_put(npu->np);

Best regards,
Krzysztof


