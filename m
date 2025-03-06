Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78038C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGiwgfzxuI2MXclU4qbyscvLNhLlFkn83tAyg3rs0P4=; b=GOqvEe2M0fkDGJoC3g1XeKTVf+
	fNAZyIl3YylWwrs9ThlT26xYaLBfTO0EEgScdDg/9scVN1Ev/mf5QHZ1GI0NETgWNr8wufhL16Opl
	IUfuR3FMCBh8TWGdOmoL16LBQP8YW2MfFZaUTesPQGE/RPT0+pPQDPZrz+sFUqPM+LukQM2OZj4JD
	iNQ0ShglTQe0DXPbZ90A9r6htCMweo5ltTQ60GOCmIX9zKGwnO7qNAtuZ+hd9p2s75uJyaaLhCD88
	uQkh2Rx4/RO1OM1b5oLKZm81e7NT6NzhoiKeB9MI80Z6POpkVUBkXThkTdnwg6ajU/y0QaKf3VXmB
	jb8HdkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5pd-0000000AENi-2IXK;
	Thu, 06 Mar 2025 07:39:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5o2-0000000AEEL-1qtT;
	Thu, 06 Mar 2025 07:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qGiwgfzxuI2MXclU4qbyscvLNhLlFkn83tAyg3rs0P4=; b=njpNRtrhpZP4ZzHiIw/7ShvmPw
	dynIWO6vl8XyBPgpCGGaKILR5sCpg+HoctcNVsFzx6BQpVXQOmgQN9iFHBxxx8VBD1O/o0aIuyTBF
	j1tDln1VTc7kXw3CKKUSa92dkeeJSru5WKEUuWYrsxQPejvRzhpPKZCpJpiSpCMu3F24Gl91AOcsU
	HfmYO8MefvKNxAwe9t9NjKXNP58v7iKiAFyckte2qmIRxTu5RWMHemL4LFxRBJ5lsRsEzfAwhnS5z
	EBOhog48OU2b0cm2dp2UPcpJhjgBr+I2h+X6ViUl4co3nQR9XIK9tDc3f4jfK5bVhp2sMYhMTfbPK
	zKdlDpag==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5nz-00000000wzi-1UmE;
	Thu, 06 Mar 2025 07:38:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6EDD0A4056F;
	Thu,  6 Mar 2025 07:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC65CC4CEE0;
	Thu,  6 Mar 2025 07:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741246685;
	bh=rFPZE20n9wv4t8EMIVt3RGa0RZ2Yy2nLVqSAsVGRS+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I/6gab8a+V9MXEtW7WeV9EZmRpdko3E+eujj5dgQCdAyNbG1pUMCDD6/f3761D1ze
	 isNClkFhOGFJMpaY5F+EH1vkmjF73NO7CQvEYYS42sETIrmfFyrXzCt4hx+88AQGGn
	 l+yHl6jZXh/WpwT6C7mE4xMhyM/3HFzJfGuANjzGaHYY7dbPOsIq4/CCD8A1cAwJs3
	 RKL1QFKIuH/AnumyiMcEev5XJegIEw1f+91v+yyh4tUIVRJiJubEANYUINzDaAGcNE
	 gulwjBxT6pz4t30fYqWW1ByRHs0cX1ieI6jBK8iVHslif1yZvbsqGScL7KMHsc1Zcf
	 PHwxtBg5ag8Tg==
Message-ID: <20e4754b-ea9a-404d-b529-ec44a7263cbf@kernel.org>
Date: Thu, 6 Mar 2025 08:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] ASoC: rockchip: add Serial Audio Interface (SAI)
 driver
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250305-rk3576-sai-v1-0-64e6cf863e9a@collabora.com>
 <20250305-rk3576-sai-v1-4-64e6cf863e9a@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250305-rk3576-sai-v1-4-64e6cf863e9a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_073807_732246_8BFA8A68 
X-CRM114-Status: GOOD (  20.73  )
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

On 05/03/2025 22:24, Nicolas Frattaroli wrote:
...

> +
> +static int rockchip_sai_runtime_resume(struct device *dev)
> +{
> +	struct rk_sai_dev *sai = dev_get_drvdata(dev);
> +	unsigned long flags;
> +	int ret;
> +
> +	dev_dbg(dev, "Runtime resuming device!\n");

Drop probe entry/exit messages. Core already gives you tracing for this.

> +
> +	ret = clk_prepare_enable(sai->hclk);
> +	if (ret)
> +		goto err_hclk;
> +
> +	ret = clk_prepare_enable(sai->mclk);
> +	if (ret)
> +		goto err_mclk;
> +
> +	regcache_cache_only(sai->regmap, false);
> +	regcache_mark_dirty(sai->regmap);
> +	ret = regcache_sync(sai->regmap);
> +	if (ret)
> +		goto err_regmap;
> +
> +	if (sai->quirks & QUIRK_ALWAYS_ON && sai->is_master_mode) {
> +		spin_lock_irqsave(&sai->xfer_lock, flags);
> +		regmap_update_bits(sai->regmap, SAI_XFER,
> +				   SAI_XFER_CLK_MASK |
> +				   SAI_XFER_FSS_MASK,
> +				   SAI_XFER_CLK_EN |
> +				   SAI_XFER_FSS_EN);
> +		spin_unlock_irqrestore(&sai->xfer_lock, flags);
> +	}
> +

...

> +
> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register PCM: %d\n", ret);
> +		goto err_runtime_suspend;
> +	}
> +
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &rockchip_sai_component,
> +					      dai, 1);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register component: %d\n", ret);
> +		goto err_runtime_suspend;
> +	}
> +
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_put(&pdev->dev);
> +
> +	/*
> +	 * runtime_resume already enabled our hclk again, so we need to also
> +	 * get rid of the manual enable we did earlier to balance the counts.
> +	 */

Your way of handling this is extra confusing. You rely on some other
methods to poke the enable/disable count. It is rather expected that
each function handles this fully, so it disables what it have enabled.
You must not rely on PM runtime to do something with clocks which you
now unwind.

> +	clk_disable_unprepare(sai->hclk);
> +
> +	return 0;
> +
> +err_runtime_suspend:
> +	/* If we're !CONFIG_PM, we get -ENOSYS and disable manually */
> +	if (pm_runtime_put(&pdev->dev))
> +		rockchip_sai_runtime_suspend(&pdev->dev);
> +err_disable_hclk:
> +	clk_disable_unprepare(sai->hclk);
> +
> +	return ret;
> +}
> +

_device_id tables are supposed to be around probe, not beginning of the
file.

> +static void rockchip_sai_remove(struct platform_device *pdev)
> +{
> +#ifndef CONFIG_PM
> +	rockchip_sai_runtime_suspend(&pdev->dev);> +#endif
> +}
> +
> +static const struct dev_pm_ops rockchip_sai_pm_ops = {
> +	SET_RUNTIME_PM_OPS(rockchip_sai_runtime_suspend, rockchip_sai_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +static struct platform_driver rockchip_sai_driver = {
> +	.probe = rockchip_sai_probe,
> +	.remove = rockchip_sai_remove,
> +	.driver = {
> +		.name = DRV_NAME,
> +		.of_match_table = of_match_ptr(rockchip_sai_match),

Drop of_match_ptr, you have warning here.

> +		.pm = &rockchip_sai_pm_ops,
> +	},
> +};
> +module_platform_driver(rockchip_sai_driver);
> +
> +MODULE_DESCRIPTION("Rockchip SAI ASoC Interface");
> +MODULE_AUTHOR("Sugar Zhang <sugar.zhang@rock-chips.com>");
> +MODULE_AUTHOR("Nicolas Frattaroli <nicolas.frattaroli@collabora.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRV_NAME);

You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.


> +MODULE_DEVICE_TABLE(of, rockchip_sai_match);


Best regards,
Krzysztof

