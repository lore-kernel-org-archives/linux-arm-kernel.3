Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D43ECA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UecwsZ20I3O30f5XLk1sV/Ve+pnFPjnLqcHVoMGHPzM=; b=4rP/85pEDRRxvMwDUT4uzL/2W7
	5lDfENBuJtrITAylfMuRjYtQ3dXx7E66zkEjKtMtche7nTudYhtto+PmzGMRCVN+PdJf2wkWbbQs1
	XZ4nFx8dYcXRptf4q6STrgtrcLgnb1t9fu0mq/R/pvmfhW/v49gCfL7muf1DxxL/Irrb5jf5L450x
	tleKsoLvZX2SnYZizAP4goNDs6a2eWNkb9Jg9JDpvfgNKotvdED6TF5BruNfJL4TEe08uASrLxiFG
	wQBTr7C9M8r+noqb1EjMVVZKIG2XLQ6VxVWBxJf5mQHglAo7D46NbhemSNYikeLbH0b5SXGFz8+qT
	gbYQYnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpKi-00000005NlH-0eUX;
	Wed, 30 Sep 2026 08:06:32 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpKf-00000005Nj9-1kI4;
	Wed, 30 Sep 2026 08:06:30 +0000
Date: Wed, 30 Sep 2026 10:06:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790755570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UecwsZ20I3O30f5XLk1sV/Ve+pnFPjnLqcHVoMGHPzM=;
	b=FptX7Lt5BoYgw7PcLLJRCSzi7pBxC6jN8Nayud/BufCUUTkLz2M76fZ438lyT1nytPzwpS
	AuiHJIUaNUjQKExIOzEFm7aSZgoEezLNXFxWqXeWB07semdmRR/nJS1LbYkOiCVdUiXgLE
	pGuBE+3MeuUz92lFnjLeHIn9ebJYGKGahdBN64jwUeg2No2JFCPt7b5uBigjWR0YAjpEZI
	N0QQav/JkfJjMMYyGtIc5t8Gqu/Ny5dSoWoK0SJHrJRpBE4JCi2pJmWWJfk59DsBlUWglD
	n7s5DCDmK0HG8ca8eCM2cxHIHZu99oleofBuexW2tGrrQZb3RxVKEIJ3TaZz9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790755570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UecwsZ20I3O30f5XLk1sV/Ve+pnFPjnLqcHVoMGHPzM=;
	b=rFq1cy6yhPf0MDw2t1d8vHFY61wCZ5eoTKiQI8olkMeNbi+aZUIWaZmw5xd9kbjlcC3YyG
	54LSeD9rQxa4BYDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ryan Brue <ryanbrue.dev@gmail.com>, Mark Brown <broonie@kernel.org>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Hongzhou Yang <hongzhou.yang@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev, mfd@lists.linux.dev
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
Message-ID: <20260930080609.dnK1-Uta@linutronix.de>
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_010629_619953_ABFA4394 
X-CRM114-Status: GOOD (  34.22  )
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

On 2026-09-29 12:57:51 [-0500], Ryan Brue wrote:
> The EINT irq_chip emulates both-edge interrupts by reading the pin's
> level through mtk_gpio_get() and the pinctrl regmap. It does so from its
> unmask and set_type callbacks, under the raw irq_desc lock, and from the
> chained handler, in hard interrupt context. The regmap comes from syscon
> and locks with a spinlock_t, which may sleep on PREEMPT_RT. With
> CONFIG_PROVE_LOCKING, the first request of a both-edge EINT prints
> "[ BUG: Invalid wait context ]" and turns lockdep off for the rest of
> the boot.

This duplicates syscon node and creates a new one with the
.use_raw_spinlock=true attribute. Now, syscon is always low-level access
with MMIO access, right?

I've been wondering if we could make drivers/mfd/syscon.c use the
raw_spintlock_t instead making this sort of change for every driver that
has this "requirement".

If this is all MMIO reads/ writes then it should work. I'm not sure why
we have the lock to begin with. Probably due to the cache/ async writes.
Cache wise just the flat-cache works since the other (like rbtree)
allocates memory on write under the lock. So this does not work.
What I am bit worried about are the bulk_write and multi_reg_write where
multiple writes happen under the lock.

> Create the regmap for the "mediatek,pctl-regmap" nodes here instead,
> with use_raw_spinlock set, and register it with syscon so that other
> users of a node, such as the ethernet on MT2701 and MT7623, share its
> lock. If the node already has a syscon regmap, keep using it. Select
> REGMAP_MMIO, which the driver now uses directly.
> 
> Fixes: 3221f40b7631 ("pinctrl: mediatek: emulate GPIO interrupt on both-edges")
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> Found on the Amazon Fire HD 10 (2017), an MT8173 tablet that is not
> upstream yet, where usb_extcon_probe() requests the USB ID pin's
> both-edge EINT. With this patch lockdep stays on through boot, CPU
> hotplug, suspend to RAM, and lid open/close edges on the hall sensor's
> both-edge EINT. Only MT8173 was tested. Nothing else uses the node
> there, so the -EEXIST fallback was not exercised.
> 
> checkpatch warns that the regmap_config should be const. It is copied
> per node to set name and max_register, as syscon does.
> ---
>  drivers/pinctrl/mediatek/Kconfig              |  1 +
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 59 ++++++++++++++++++++++++++-
>  2 files changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 30ef3dc5dfb1..764256901d6a 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -17,6 +17,7 @@ config PINCTRL_MTK
>  	select GENERIC_PINCONF
>  	select GPIOLIB
>  	select EINT_MTK
> +	select REGMAP_MMIO
>  
>  config PINCTRL_MTK_V2
>  	tristate
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 1a977acd6883..65b1e3096183 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -9,6 +9,7 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pinctrl/machine.h>
> @@ -1057,6 +1058,60 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
>  	return mtk_eint_do_init(pctl->eint, NULL);
>  }
>  
> +static const struct regmap_config mtk_pctrl_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.use_raw_spinlock = true,
> +};
> +
> +/*
> + * The EINT irq_chip reads a pin's level through this regmap from callbacks
> + * that run under the raw irq_desc lock, so the regmap has to use a raw
> + * spinlock too, which syscon's own does not. Register one with syscon for the
> + * node instead, so that any other user of the node shares its lock.
> + */
> +static struct regmap *mtk_pctrl_syscon_regmap(struct device_node *np)
> +{
> +	struct regmap_config config = mtk_pctrl_regmap_config;
> +	struct regmap *regmap;
> +	struct resource res;
> +	void __iomem *base;
> +	int ret;
> +
> +	ret = of_address_to_resource(np, 0, &res);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	base = ioremap(res.start, resource_size(&res));
> +	if (!base)
> +		return ERR_PTR(-ENOMEM);
> +
> +	config.name = kasprintf(GFP_KERNEL, "%pOFn@%pa", np, &res.start);
> +	if (!config.name) {
> +		iounmap(base);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	config.max_register = resource_size(&res) - config.reg_stride;
> +	regmap = regmap_init_mmio(NULL, base, &config);
> +	kfree(config.name);
> +	if (IS_ERR(regmap)) {
> +		iounmap(base);
> +		return regmap;
> +	}
> +
> +	ret = of_syscon_register_regmap(np, regmap);
> +	if (ret) {
> +		regmap_exit(regmap);
> +		iounmap(base);
> +		/* An earlier probe, or another user of the node, got there first. */
> +		return ret == -EEXIST ? syscon_node_to_regmap(np) : ERR_PTR(ret);
> +	}
> +
> +	return regmap;
> +}
> +
>  /* This is used as a common probe function */
>  int mtk_pctrl_init(struct platform_device *pdev,
>  		const struct mtk_pinctrl_devdata *data,
> @@ -1076,7 +1131,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
>  
>  	node = of_parse_phandle(np, "mediatek,pctl-regmap", 0);
>  	if (node) {
> -		pctl->regmap1 = syscon_node_to_regmap(node);
> +		pctl->regmap1 = mtk_pctrl_syscon_regmap(node);
>  		of_node_put(node);
>  		if (IS_ERR(pctl->regmap1))
>  			return PTR_ERR(pctl->regmap1);
> @@ -1089,7 +1144,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
>  	/* Only 8135 has two base addr, other SoCs have only one. */
>  	node = of_parse_phandle(np, "mediatek,pctl-regmap", 1);
>  	if (node) {
> -		pctl->regmap2 = syscon_node_to_regmap(node);
> +		pctl->regmap2 = mtk_pctrl_syscon_regmap(node);
>  		of_node_put(node);
>  		if (IS_ERR(pctl->regmap2))
>  			return PTR_ERR(pctl->regmap2);
> 
> ---
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> change-id: 20260925-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-154d6225b977
> 
> Best regards,

Sebastian

