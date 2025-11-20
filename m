Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4206DCF8863
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvJBJ6Y+90NY1Lh2xnaN6wiWc+SpW09OQaZ6FEjdf1Q=; b=HKbwn7Z4D9RqF9LyIWs87HGsJh
	oCNBdGB7T/egXbq54bkEFn6aIEUHck+c4WtEFxo08m7vjC4wezfMFPU+nIvyGj7oypqYgSI48PqPe
	mzQugw0kX/FhGP4b7FIDA0yD6X3qO0cRBjv08SEph2O4nhl4W2TpD04tP9Ah8c169MAZW4UIofiGn
	dw2xS9oMfYrwmX+fTTQbgn6cvhd4saGgCBFIOJc0EXX8oxUPMC7/D187SPaSMOxCR7J6+fsKf/JwR
	srkF1tyT5s0lWibxnRzliSmnofPgWEjDhyqxLFSwgoWw+9MfjQBHfnBIJqa2KAAo9R5CciQN+s1Z4
	X/U1yRrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5rV-00000006rSt-417N;
	Thu, 20 Nov 2025 14:42:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5rT-00000006rSU-25k9;
	Thu, 20 Nov 2025 14:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763649732;
	bh=fa7WHscB8vi69zuem9la5vhtfXoFdBzZsUj1liyFTbs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b1Jz+sDyFG1Bc+y7xNUGvb3jxkNem6/6tHWUmd+QeVRcRrUk9PcqW+JN10bFfVTee
	 4kDTP5bMM+aQtsZjtfMK4zD/QJyxCKt5BbG/ZD2XvkExm4iGJleAD+fmAHLSEzyvTA
	 OtlJmZ23Uwad1oQzjOMlakYZRN+Xn15Wyr6HGYRUwryE0XC0ZFqGc7ofOAmzvQryzO
	 PyQb+vr8ARXowbxEu56nkL/yP0iisrd277b6qJQISBI8DaEgi2vOi8qQz2NQSILNyJ
	 5qROPbTFSz0bSf1MHek738fzhR3WMr7EvuXpYb+Rgbx9sLrPGZVyyDyDUzc+Fuf6a2
	 kQ7zbYqrGPrrA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8082417E00B0;
	Thu, 20 Nov 2025 15:42:11 +0100 (CET)
Message-ID: <76325c39-ea88-48fe-b32d-00c1e0d31024@collabora.com>
Date: Thu, 20 Nov 2025 15:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] rtc: mt6397: Add BBPU alarm status reset and
 shutdown handling
To: ot_shunxi.zhang@mediatek.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones
 <lee@kernel.org>, Vince-WL.Liu@mediatek.com, sirius.wang@mediatek.com,
 Jh.Hsu@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
 <20251120121805.6775-5-ot_shunxi.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251120121805.6775-5-ot_shunxi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_064215_728292_98C18F23 
X-CRM114-Status: GOOD (  24.15  )
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

Il 20/11/25 13:18, ot_shunxi.zhang@mediatek.com ha scritto:
> From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> 
> Function "mtk_rtc_reset_bbpu_alarm_status" is added to address the
> issue that the RTC BBPU alarm state remains after the RTC alarm
> has occurred.
> 
> Additionally, function "mtk_rtc_shutdown" is added to address the
> issue of the platform being powered on again after shutdown because
> the RTC_BBPU alarm state was not cleared.
> 
> Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> ---
>   drivers/rtc/rtc-mt6397.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index b8f44a00de5d..8bf7e0822ef0 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -37,6 +37,21 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
>   	return ret;
>   }
>   
> +static void mtk_rtc_reset_bbpu_alarm_status(struct mt6397_rtc *rtc)
> +{
> +	u32 bbpu = RTC_BBPU_KEY | RTC_BBPU_PWREN | RTC_BBPU_RESET_AL;
> +	int ret;
> +
> +	ret = regmap_write(rtc->regmap, rtc->addr_base + RTC_BBPU, bbpu);
> +	if (ret < 0) {
> +		dev_err(rtc->rtc_dev->dev.parent, "%s: write rtc bbpu error\n",
> +			__func__);
> +		return;
> +	}
> +
> +	mtk_rtc_write_trigger(rtc);
> +}
> +
>   static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
>   {
>   	struct mt6397_rtc *rtc = data;
> @@ -51,6 +66,9 @@ static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
>   		if (regmap_write(rtc->regmap, rtc->addr_base + RTC_IRQ_EN,
>   				 irqen) == 0)
>   			mtk_rtc_write_trigger(rtc);
> +
> +		if (rtc->alarm_sta_supported)
> +			mtk_rtc_reset_bbpu_alarm_status(rtc);
>   		mutex_unlock(&rtc->lock);
>   
>   		return IRQ_HANDLED;
> @@ -249,6 +267,7 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>   	struct resource *res;
>   	struct mt6397_chip *mt6397_chip = dev_get_drvdata(pdev->dev.parent);
>   	struct mt6397_rtc *rtc;
> +	struct device_node *np = pdev->dev.of_node;
>   	int ret;
>   
>   	rtc = devm_kzalloc(&pdev->dev, sizeof(struct mt6397_rtc), GFP_KERNEL);
> @@ -275,6 +294,8 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>   	if (IS_ERR(rtc->rtc_dev))
>   		return PTR_ERR(rtc->rtc_dev);
>   
> +	rtc->alarm_sta_supported = of_property_read_bool(np, "mediatek,alarm-sta-supported");

You don't need a DT property - the PMIC dictates support for that, not the board.

This means that you also don't need the alarm_sta_supported variable, and you
don't need to check for it.

Just execute the mtk_rtc_reset_bbpu_alarm_status() function when you have to,
without any check.

Cheers,
Angelo

> +
>   	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
>   					mtk_rtc_irq_handler_thread,
>   					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> @@ -297,6 +318,14 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>   	return devm_rtc_register_device(rtc->rtc_dev);
>   }
>   
> +static void mtk_rtc_shutdown(struct platform_device *pdev)
> +{
> +	struct mt6397_rtc *rtc = platform_get_drvdata(pdev);
> +
> +	if (rtc->alarm_sta_supported)
> +		mtk_rtc_reset_bbpu_alarm_status(rtc);
> +}
> +
>   #ifdef CONFIG_PM_SLEEP
>   static int mt6397_rtc_suspend(struct device *dev)
>   {
> @@ -346,6 +375,7 @@ static struct platform_driver mtk_rtc_driver = {
>   		.pm = &mt6397_pm_ops,
>   	},
>   	.probe = mtk_rtc_probe,
> +	.shutdown = mtk_rtc_shutdown,
>   };
>   
>   module_platform_driver(mtk_rtc_driver);



