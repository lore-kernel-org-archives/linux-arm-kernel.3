Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A396ED3E787
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pEMRGidtdwO6FvYtRBzMsrDmpDGnl3AsUrIEMjv+yo=; b=wALueRxD2OhislA5wv+tCy1QON
	MdPAbkFtVB2gftqNfdiaHK4nViLhZadiW+nnQgbWdWioiPAhSDuW/f7IT8HE9Yd1SABkX9aMO9YjO
	WgVcAAosSd1xYiCWIr4CuHEuIoW/mo88XVxaYTf1EZVZHrIb3VxwqoswvcEl/H7PaPXh0b0CrZg+O
	2hqDfSixdniTq4i/gVRA8iDeiu70ph5FCPxM5m+vLOJOh3A3XyV2WzZChWT/XefiUSqBUYoQAE/US
	+YHDb/I1JXCnYKaVyfWaIGsqT6jrvEBHkkMGV/iXbNFiv3WR4o3LHV/BYk6D9b/ROvAiHtPH/Wobb
	5LLjxA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zdY-00000006Rmg-1eEh;
	Thu, 07 Nov 2024 10:21:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zWS-00000006QW9-3lzv;
	Thu, 07 Nov 2024 10:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730974430;
	bh=qGL+owtZbc1lnLogLE8XlKsc16UpGYGBcPFpDTZdqk8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PMIS4rejvUGx/AV6FPb0rxG6CIyLbGVPSXwSi7+sIZiYQHrjVICYMJVtJXOtTPAdH
	 6u8ODv5ojFaKj2YGjTQM2PyZqe2HxzMi6lv6BHSjkPAGGkqZwWXlpmUq6/T18/6l7u
	 UwcaaBQmEoDd6HDAYJgG2L0teyNoKRleZe44H2lfPHEDqOxAL5Wi7L7QLGYin/Ty9p
	 ueGV0nEaVFr2TKjIHKGo6dEfbqfTNa+iG7Rj9YyTwYNfaQHJeYdFde4zdIOXnWG0lM
	 Gj3286ptUSdpdcucpF/tFxLhAodvljsUWC0U8/ASc8ypnlF3tukG1lTBnT+UR+ZhGR
	 8xB1kl4GiTHAg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF58717E14FB;
	Thu,  7 Nov 2024 11:13:49 +0100 (CET)
Message-ID: <c7c5e802-3df8-4218-865f-81a207c517cd@collabora.com>
Date: Thu, 7 Nov 2024 11:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
To: Zoie Lin <zoie.lin@mediatek.com>, Qii Wang <qii.wang@mediatek.com>,
 Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, teddy.chen@mediatek.com
References: <20241106125212.27362-1-zoie.lin@mediatek.com>
 <20241106125212.27362-2-zoie.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106125212.27362-2-zoie.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_021353_162594_580B9F47 
X-CRM114-Status: GOOD (  22.82  )
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

Il 06/11/24 13:52, Zoie Lin ha scritto:
> This commit introduces support for runtime PM operations in
> the I2C driver, enabling runtime suspend and resume functionality.
> 
> Although in the most platforms, the bus power of i2c are always
> on, some platforms disable the i2c bus power in order to meet
> low power request.
> 
> This implementation includes bus regulator control to facilitate
> proper handling of the bus power based on platform requirements.
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 77 ++++++++++++++++++++++++++++-----
>   1 file changed, 65 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 5bd342047d59..4209daec1efa 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c

..snip..

> @@ -1370,6 +1373,40 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
>   	return 0;
>   }
>   
> +static int mtk_i2c_runtime_suspend(struct device *dev)
> +{
> +	struct mtk_i2c *i2c = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (i2c->adap.bus_regulator)
> +		regulator_disable(i2c->adap.bus_regulator);
> +
> +	return 0;
> +}
> +
> +static int mtk_i2c_runtime_resume(struct device *dev)
> +{
> +	int ret = 0;
> +	struct mtk_i2c *i2c = dev_get_drvdata(dev);

	struct mtk_i2c *i2c = dev_get_drvdata(dev);
	int ret;

> +
> +	if (i2c->adap.bus_regulator) {
> +		ret = regulator_enable(i2c->adap.bus_regulator);
> +		if (ret) {
> +			dev_err(dev, "enable regulator failed!\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (ret) {
> +		if (i2c->adap.bus_regulator)
> +			regulator_disable(i2c->adap.bus_regulator);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int mtk_i2c_probe(struct platform_device *pdev)
>   {
>   	int ret = 0;
> @@ -1472,13 +1509,18 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	ret = clk_bulk_prepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   	if (ret) {
> -		dev_err(&pdev->dev, "clock enable failed!\n");
>   		return ret;
>   	}
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	ret = mtk_i2c_runtime_resume(i2c->dev);
> +	if (ret < 0)
> +		goto err_clk_bulk_unprepare;
>   	mtk_i2c_init_hw(i2c);
> -	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	mtk_i2c_runtime_suspend(i2c->dev);
>   
>   	ret = devm_request_irq(&pdev->dev, irq, mtk_i2c_irq,
>   			       IRQF_NO_SUSPEND | IRQF_TRIGGER_NONE,
> @@ -1486,19 +1528,22 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	if (ret < 0) {
>   		dev_err(&pdev->dev,
>   			"Request I2C IRQ %d fail\n", irq);
> -		goto err_bulk_unprepare;
> +		goto err_clk_bulk_unprepare;
>   	}
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);

You had comments from me and from Andi on this delay, and you completely ignored
both of us.

We're still waiting for an answer to our question.


> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);

devm_pm_runtime_enable() please.

>   
>   	i2c_set_adapdata(&i2c->adap, i2c);
>   	ret = i2c_add_adapter(&i2c->adap);
>   	if (ret)
> -		goto err_bulk_unprepare;
> -
> -	platform_set_drvdata(pdev, i2c);
> +		goto err_pm_runtime_disable;
>   
>   	return 0;
>   
> -err_bulk_unprepare:
> +err_pm_runtime_disable:
> +	pm_runtime_disable(&pdev->dev);
> +err_clk_bulk_unprepare:
>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   
>   	return ret;
> @@ -1510,6 +1555,7 @@ static void mtk_i2c_remove(struct platform_device *pdev)
>   
>   	i2c_del_adapter(&i2c->adap);
>   
> +	pm_runtime_disable(&pdev->dev);
>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   }
>   
> @@ -1518,6 +1564,10 @@ static int mtk_i2c_suspend_noirq(struct device *dev)
>   	struct mtk_i2c *i2c = dev_get_drvdata(dev);
>   
>   	i2c_mark_adapter_suspended(&i2c->adap);
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		mtk_i2c_runtime_suspend(dev);
> +
>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   
>   	return 0;
> @@ -1536,7 +1586,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
>   
>   	mtk_i2c_init_hw(i2c);
>   
> -	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (pm_runtime_status_suspended(dev))
> +		mtk_i2c_runtime_suspend(dev);

You want to resume, not to suspend, in a resume handler.

>   
>   	i2c_mark_adapter_resumed(&i2c->adap);
>   
> @@ -1546,6 +1597,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
>   static const struct dev_pm_ops mtk_i2c_pm = {
>   	NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
>   				  mtk_i2c_resume_noirq)
> +	SET_RUNTIME_PM_OPS(mtk_i2c_runtime_suspend, mtk_i2c_runtime_resume,
> +			   NULL)
>   };
>   
>   static struct platform_driver mtk_i2c_driver = {




