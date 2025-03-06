Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4578DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdBXQyyutw1s7G52118ZdyCMkF3qYh73k0uq6nYhoUc=; b=4dnyLrSTetE/POe4VZ5pXMdKKE
	568qKSoDbIpIcVFYTpfYjSNElKG1IiF25HdNs2dRmBKphhNeQtFW0DrzaPFfKcOAf4n6b2BBsL8dR
	2lniKJoLu7f43joITEsqOW+DntVMuUjtA+8gYwWAxUu2fAY44YOfejgAGU0MB7ThWm20JnfeGL8WI
	hfbBndb5alI1NL5dFhYHuNfnGIbtuWQ+0V1u7ub6vfdHFHlFgmXV8w8ElZ7R4HwBHFNhgGnH72b8e
	nVGc3rJWJOFnMrS9zGjE0lc2yRd4JVPIDiEr8HnuvpzlbqoRk+XPh+0HF6dzQ5WB8Jl6BHewp32A3
	SccI8rww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBKx-0000000B47g-1LRH;
	Thu, 06 Mar 2025 13:32:31 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBCw-0000000B36X-1BDI;
	Thu, 06 Mar 2025 13:24:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741267434; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QgL47SSHJ9vtvNGtw/7IJWea7s1tN3xEFI/mVIMXA069nGFhQxVEXxDnoarzp2usOk02fZxYfrRtDzPw546IrAHT4uvxVlvLBHo/iqqH8GJaINM9kO0WzwHWp8Ij7HTKG+feYQiR3kWxvS6u8y3pKB1gqq4yeQ2szhfKpbJiaKw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741267434; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QdBXQyyutw1s7G52118ZdyCMkF3qYh73k0uq6nYhoUc=; 
	b=HYOiZuRcvyOrJgtQxDu44OGJsC1eftkgEEesU241RychKAaKTVOm9h1dVIei9NofONG7wjG7IX5WUwsqgey/w/dKWtH0n9dPQuUGXwk7nUYLwcm1Vyqlv7kI2bQGqmXnxjUxgHDUtMfKo+8k7R9i6C1OGh8wVJhBELTtEd85GLU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741267434;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=QdBXQyyutw1s7G52118ZdyCMkF3qYh73k0uq6nYhoUc=;
	b=DNrs1jIcXm+8kHxUy741Rr7Z/ADIv2zMKuTfWVFeSGwvoAe2fb0zlj8Vi2Sq1pGu
	nKE5xklWMlmOJKwaZSDerOc7nwgBaXLW8tiTqlWnDQN7Q7hoLZvSc1E19imJitcLy4E
	TDCKhxQDByTnF5HOPAPuklHy32ycqL7+V+gw6qBw=
Received: by mx.zohomail.com with SMTPS id 1741267433815519.1263942154526;
	Thu, 6 Mar 2025 05:23:53 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 4/7] ASoC: rockchip: add Serial Audio Interface (SAI) driver
Date: Thu, 06 Mar 2025 14:23:46 +0100
Message-ID: <13731095.uLZWGnKmhe@workhorse>
In-Reply-To: <20e4754b-ea9a-404d-b529-ec44a7263cbf@kernel.org>
References: <20250305-rk3576-sai-v1-0-64e6cf863e9a@collabora.com>
 <20250305-rk3576-sai-v1-4-64e6cf863e9a@collabora.com>
 <20e4754b-ea9a-404d-b529-ec44a7263cbf@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_052414_413324_CB78878F 
X-CRM114-Status: GOOD (  28.65  )
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

On Thursday, 6 March 2025 08:37:54 Central European Standard Time Krzysztof 
Kozlowski wrote:
> On 05/03/2025 22:24, Nicolas Frattaroli wrote:
> ...
> 
> > +
> > +static int rockchip_sai_runtime_resume(struct device *dev)
> > +{
> > +	struct rk_sai_dev *sai = dev_get_drvdata(dev);
> > +	unsigned long flags;
> > +	int ret;
> > +
> > +	dev_dbg(dev, "Runtime resuming device!\n");
> 
> Drop probe entry/exit messages. Core already gives you tracing for this.

Will do.

> 
> > +
> > +	ret = clk_prepare_enable(sai->hclk);
> > +	if (ret)
> > +		goto err_hclk;
> > +
> > +	ret = clk_prepare_enable(sai->mclk);
> > +	if (ret)
> > +		goto err_mclk;
> > +
> > +	regcache_cache_only(sai->regmap, false);
> > +	regcache_mark_dirty(sai->regmap);
> > +	ret = regcache_sync(sai->regmap);
> > +	if (ret)
> > +		goto err_regmap;
> > +
> > +	if (sai->quirks & QUIRK_ALWAYS_ON && sai->is_master_mode) {
> > +		spin_lock_irqsave(&sai->xfer_lock, flags);
> > +		regmap_update_bits(sai->regmap, SAI_XFER,
> > +				   SAI_XFER_CLK_MASK |
> > +				   SAI_XFER_FSS_MASK,
> > +				   SAI_XFER_CLK_EN |
> > +				   SAI_XFER_FSS_EN);
> > +		spin_unlock_irqrestore(&sai->xfer_lock, flags);
> > +	}
> > +
> 
> ...
> 
> > +
> > +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to register PCM: %d\n", ret);
> > +		goto err_runtime_suspend;
> > +	}
> > +
> > +	ret = devm_snd_soc_register_component(&pdev->dev,
> > +					      
&rockchip_sai_component,
> > +					      dai, 1);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to register component: %d\n", 
ret);
> > +		goto err_runtime_suspend;
> > +	}
> > +
> > +	pm_runtime_use_autosuspend(&pdev->dev);
> > +	pm_runtime_put(&pdev->dev);
> > +
> > +	/*
> > +	 * runtime_resume already enabled our hclk again, so we need to also
> > +	 * get rid of the manual enable we did earlier to balance the 
counts.
> > +	 */
> 
> Your way of handling this is extra confusing. You rely on some other
> methods to poke the enable/disable count. It is rather expected that
> each function handles this fully, so it disables what it have enabled.
> You must not rely on PM runtime to do something with clocks which you
> now unwind.

I believe you misunderstand. I'm not unwinding what PM is doing. I'm unwinding 
the hclk enable the probe function does earlier on. I will make the comment 
more clear in V2 (or rather, remove it entirely since it creates more 
confusion than it clears up). It's unnecessary to talk about PM runtime also 
enabling hclk; the disable is for our function's enable.

> 
> > +	clk_disable_unprepare(sai->hclk);
> > +
> > +	return 0;
> > +
> > +err_runtime_suspend:
> > +	/* If we're !CONFIG_PM, we get -ENOSYS and disable manually */
> > +	if (pm_runtime_put(&pdev->dev))
> > +		rockchip_sai_runtime_suspend(&pdev->dev);
> > +err_disable_hclk:
> > +	clk_disable_unprepare(sai->hclk);
> > +
> > +	return ret;
> > +}
> > +
> 
> _device_id tables are supposed to be around probe, not beginning of the
> file.

Will do.

> 
> > +static void rockchip_sai_remove(struct platform_device *pdev)
> > +{
> > +#ifndef CONFIG_PM
> > +	rockchip_sai_runtime_suspend(&pdev->dev);> +#endif
> > +}
> > +
> > +static const struct dev_pm_ops rockchip_sai_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(rockchip_sai_runtime_suspend,
> > rockchip_sai_runtime_resume, NULL)
> > +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > pm_runtime_force_resume) +};
> > +
> > +static struct platform_driver rockchip_sai_driver = {
> > +	.probe = rockchip_sai_probe,
> > +	.remove = rockchip_sai_remove,
> > +	.driver = {
> > +		.name = DRV_NAME,
> > +		.of_match_table = of_match_ptr(rockchip_sai_match),
> 
> Drop of_match_ptr, you have warning here.

Will do.

> 
> > +		.pm = &rockchip_sai_pm_ops,
> > +	},
> > +};
> > +module_platform_driver(rockchip_sai_driver);
> > +
> > +MODULE_DESCRIPTION("Rockchip SAI ASoC Interface");
> > +MODULE_AUTHOR("Sugar Zhang <sugar.zhang@rock-chips.com>");
> > +MODULE_AUTHOR("Nicolas Frattaroli <nicolas.frattaroli@collabora.com>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:" DRV_NAME);
> 
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong (e.g. misses either
> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
> for incomplete ID table.

Will do.

> 
> > +MODULE_DEVICE_TABLE(of, rockchip_sai_match);
> 
> Best regards,
> Krzysztof

Regards,
Nicolas Frattaroli




