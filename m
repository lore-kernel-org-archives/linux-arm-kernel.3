Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF85C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmlXeyOWfKWSje0Td8DQAPRRqN2xhLGJ9irnz2oty0I=; b=f8oWglh/9ZFyzWdRAaVr4BwVUm
	s3BRgWUNibME2/2KyjcfI799lDzb0wgJO994Ik5ZHssTahqupVPRwAiL9kyQYypy7dpZwRimvon9T
	e8JhaYZQNzk7eV8BqQGJgVuBLjwfBMRwHp/0YqMmtNaz9cN/yVD/qPTvo07T0R2vYzJ8VKttr51Fx
	6Tv8UsVxlp8d/4r14Nb1hJUhBz8O4nN6XfoVyaKtOrYrtR7+J0QyeYW6r0JRkJCkkCChRSXoLxnDr
	k05UaZDfaenQFt7Xc0ouXYz4eowV7yxtCaJDcMvY+Die4SJ1E9FgxSKayHDRRXG9fkrWBhxFpz0WR
	EroL3cLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSS2-00000007nR5-3QYu;
	Mon, 11 Aug 2025 13:20:34 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSH2-00000007lgU-38Yr;
	Mon, 11 Aug 2025 13:09:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2794F43A15;
	Mon, 11 Aug 2025 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754917748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YmlXeyOWfKWSje0Td8DQAPRRqN2xhLGJ9irnz2oty0I=;
	b=ha0LJNSfZWuWdNA1z8Nq7Dwl77fZGwmujhb/DcMHJwWCo3WCIJaGWAxDRqO5yx1aLxoil9
	1cuXIqiQoX1OyrfXP6qoEZGBUJD+AbHGw4InLLM1xBhXR7vHmsp52RAlQ/rXZXuR1tJAs7
	o1HpE/yrhIilPMyWiZspJdXNLBSNmgCIUlPmhUUxcRvf/dWIHUiBj0R9RiuNdGB5Di0F4f
	pTa6F9GO9EyjF21LkSW9M1D240Bc17zC04BCgkOpOInAyex7XG+vz1vr97UHEguyPsyniE
	inU3b1EsUc1zTTWao0P6slM1nVa+TyfE0vmJpPT9fc7v2SZUcJcx/u32neKPWw==
Date: Mon, 11 Aug 2025 15:09:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ot_shunxi.zhang@mediatek.com
Cc: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, sirius.wang@mediatek.com,
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v1 2/2] rtc: mt6397: Add BBPU alarm status reset and
 shutdown handling
Message-ID: <2025081113090716407d59@mail.local>
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
 <20250811081543.4377-3-ot_shunxi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811081543.4377-3-ot_shunxi.zhang@mediatek.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufedvheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepohhtpghshhhunhigihdriihhrghnghesmhgvughirghtvghkrdgtohhmpdhrtghpthhtohepvgguughivgdrhhhurghnghesmhgvughirghtvghkrdgtohhmpdhrtghpt
 hhtohepshgvrghnrdifrghnghesmhgvughirghtvghkrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_060913_429146_4AD12C75 
X-CRM114-Status: GOOD (  27.85  )
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

On 11/08/2025 16:15:34+0800, ot_shunxi.zhang@mediatek.com wrote:
> From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> 
> This patch introduces a new function, mtk_rtc_reset_bbpu_alarm_status,
> to reset the BBPU alarm status in the MT6397 RTC driver. This function
> writes the necessary bits to the RTC_BBPU register to clear the alarm
> status and ensure proper operation.
> 
> Additionally, the mtk_rtc_shutdown function is added to handle RTC
> shutdown events. It resets the BBPU alarm status and updates the
> RTC_IRQ_EN register to disable the one-shot alarm interrupt,
> ensuring a clean shutdown process.
> 
> Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 692c00ff544b..063bd399de8c 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -37,6 +37,21 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
>  	return ret;
>  }
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
>  static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
>  {
>  	struct mt6397_rtc *rtc = data;
> @@ -51,6 +66,8 @@ static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
>  		if (regmap_write(rtc->regmap, rtc->addr_base + RTC_IRQ_EN,
>  				 irqen) == 0)
>  			mtk_rtc_write_trigger(rtc);
> +
> +		mtk_rtc_reset_bbpu_alarm_status(rtc);
>  		mutex_unlock(&rtc->lock);
>  
>  		return IRQ_HANDLED;
> @@ -297,6 +314,22 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  	return devm_rtc_register_device(rtc->rtc_dev);
>  }
>  
> +static void mtk_rtc_shutdown(struct platform_device *pdev)
> +{
> +	struct mt6397_rtc *rtc = platform_get_drvdata(pdev);
> +	int ret = 0;
> +
> +	mtk_rtc_reset_bbpu_alarm_status(rtc);
> +
> +	ret = regmap_update_bits(rtc->regmap,
> +				 rtc->addr_base + RTC_IRQ_EN,
> +				 RTC_IRQ_EN_ONESHOT_AL, 0);
> +	if (ret < 0)
> +		return;
> +
> +	mtk_rtc_write_trigger(rtc);

The whole goal of the RTC is to wakeup the system, why would you disable
the alarm on shutdown?

> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static int mt6397_rtc_suspend(struct device *dev)
>  {
> @@ -345,7 +378,8 @@ static struct platform_driver mtk_rtc_driver = {
>  		.of_match_table = mt6397_rtc_of_match,
>  		.pm = &mt6397_pm_ops,
>  	},
> -	.probe	= mtk_rtc_probe,
> +	.probe = mtk_rtc_probe,
> +	.shutdown = mtk_rtc_shutdown,
>  };
>  
>  module_platform_driver(mtk_rtc_driver);
> -- 
> 2.46.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

