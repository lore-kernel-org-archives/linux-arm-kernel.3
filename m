Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E25CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 17:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJQtz8A/+7qRiC5zFJQOdwJCNZuASZgKYF8VCygcGsU=; b=E6/bGRIfmeFYK2LKndY4qylwGG
	hs13EThLiKot0fvSsgudg8PqoTvrnCtnQeReb81Q+1evOviFnJupO7+WT4eASevz3Rn4GRJpmRh1h
	o6BXA6tEqtfrgjBqbmPa7zsxUaw1veryxJjhb/qOORuVcYiTmpX2Eq2gzIdQYQeQa0uTI8icv7Qu9
	ftmdXlykZIM6jTE2Eg0IDcUtfrtpXOBuZ1+FkO+mxFS3eGoow9jOHZExMZ6uPf03dX3PVacrmnDlM
	WnXtU8NizrylxqP/1+LDY4Ju3BwkKkGoiHbkGuOUqwRn3qsEajQqiJyMEOedUAloOtP3gw6dUQWPu
	ZCDSB++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWQe-00000004XN6-2nJv;
	Thu, 30 Oct 2025 17:27:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWQY-00000004XMK-376M;
	Thu, 30 Oct 2025 17:27:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 95F671A1782;
	Thu, 30 Oct 2025 17:27:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A2CB60331;
	Thu, 30 Oct 2025 17:27:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35BCC11808D0E;
	Thu, 30 Oct 2025 18:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761845226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=TJQtz8A/+7qRiC5zFJQOdwJCNZuASZgKYF8VCygcGsU=;
	b=QNDPuvDEq7WAJGugy+YfOwFyP0FpUgBwHznjkuQN+JLPE8rG+Fojb4KS5+83Ia4N6nP6a1
	re9cjQk0+yaRNofUvIlgCI3Mb0t4REaZfNFDtUcVRXhZWD4Zbh8ZZabkBbffqM32q8kGNA
	DiS+J4lmn5Jd9haTAYvJUHLzekv+u1DVZXe+s8FTWE86C5C45Sc/TKpOhvzgTN8/2Ikojl
	iAF/lM5qcngDriivuvIM1HbFfYShqRl8UYwLmWJSqAHFUxDtPmkgLWYxfvXLeTQNoMRku8
	aGgvupigCs7WM6JVxrTslRbSHcSfGO2A1KkopZ/zwUG+aGCMRQRW0jXj7hv8fA==
Date: Thu, 30 Oct 2025 18:27:03 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 2/2] rtc: Add support for MT6685 Clock IC's RTC over
 SPMI
Message-ID: <20251030172703a51e304e@mail.local>
References: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
 <20251024083318.25890-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024083318.25890-3-angelogioacchino.delregno@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_102710_920276_EBB04E3B 
X-CRM114-Status: GOOD (  18.09  )
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

On 24/10/2025 10:33:18+0200, AngeloGioacchino Del Regno wrote:
> +static irqreturn_t rtc_mt6685_irq_handler_thread(int irq, void *data)
> +{
> +	u16 irqsta, irqen = 0, bbpu = RTC_BBPU_WR_UNLOCK_KEY | RTC_BBPU_PWREN;
> +	struct mt6685_rtc *rtc = data;
> +	struct device *dev = &rtc->rdev->dev;
> +	int ret;
> +
> +	ret = clk_prepare_enable(rtc->mclk);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	ret = regmap_bulk_read(rtc->regmap, RTC_REG_IRQ_STA, &irqsta, sizeof(irqsta));
> +	if (ret)
> +		goto end;
> +
> +	/* Only alarm interrupts are supported for now */
> +	if (!(irqsta & RTC_IRQ_AL)) {
> +		ret = -EINVAL;
> +		goto end;
> +	}
> +
> +	rtc_lock(rtc->rdev);
> +
> +	/* Enable BBPU power and clear the interrupt */
> +	ret = regmap_bulk_write(rtc->regmap, RTC_REG_BBPU, &bbpu, sizeof(bbpu));
> +	if (ret)
> +		goto end;
> +
> +	ret = regmap_bulk_write(rtc->regmap, RTC_REG_IRQ_EN, &irqen, sizeof(irqen));
> +	if (ret)
> +		goto end;
> +
> +	/* Trigger reset of the RTC BBPU Alarm */
> +	bbpu |= RTC_BBPU_RESET_AL;
> +	ret = regmap_bulk_write(rtc->regmap, RTC_REG_BBPU, &bbpu, sizeof(bbpu));
> +	if (ret) {
> +		dev_err(dev, "Cannot reset alarm: %d\n", ret);
> +		goto end;
> +	}
> +
> +	/* Trigger write synchronization */
> +	ret = rtc_mt6685_write_trigger(rtc);
> +	if (ret) {
> +		dev_err(dev, "Cannot synchronize write to RTC: %d\n", ret);

I'm not sure those two dev_err are necessary.

> +		goto end;
> +	}
> +	rtc_update_irq(rtc->rdev, 1, RTC_IRQF | RTC_AF);
> +end:
> +	rtc_unlock(rtc->rdev);
> +	clk_disable_unprepare(rtc->mclk);
> +	return ret ? IRQ_NONE : IRQ_HANDLED;
> +}
> +


> +static int rtc_mt6685_read_time_regs(struct mt6685_rtc *rtc, struct rtc_time *tm, u16 reg)
> +{
> +	u16 data[RTC_AL_TC_REGIDX_MAX];
> +	int ret;
> +
> +	ret = regmap_bulk_read(rtc->regmap, reg, &data,
> +			       RTC_AL_TC_REGIDX_MAX * sizeof(data[0]));
> +	if (ret) {
> +		dev_err(&rtc->rdev->dev, "Cannot read time regs\n");

Same here, there is not much the user can do and your are already
returning an error.

> +		return ret;
> +	}
> +
> +	tm->tm_sec  = FIELD_GET(RTC_AL_TC_SEC_MIN, data[RTC_AL_TC_REGIDX_SEC]);
> +	tm->tm_min  = FIELD_GET(RTC_AL_TC_SEC_MIN, data[RTC_AL_TC_REGIDX_MIN]);
> +	tm->tm_hour = FIELD_GET(RTC_AL_TC_HOUR_DOM, data[RTC_AL_TC_REGIDX_HOUR]);
> +	tm->tm_mday = FIELD_GET(RTC_AL_TC_HOUR_DOM, data[RTC_AL_TC_REGIDX_DOM]);
> +	tm->tm_wday = FIELD_GET(RTC_AL_TC_DOW, data[RTC_AL_TC_REGIDX_DOW]);
> +	tm->tm_mon  = FIELD_GET(RTC_AL_TC_MON, data[RTC_AL_TC_REGIDX_MON]);
> +	tm->tm_year = FIELD_GET(RTC_AL_TC_YEAR, data[RTC_AL_TC_REGIDX_YEAR]);
> +
> +	/* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
> +	tm->tm_mon--;
> +	tm->tm_wday--;
> +
> +	return 0;
> +}
> +

> +static int rtc_mt6685_probe(struct platform_device *pdev)
> +{
> +	struct regmap_config mt6685_rtc_regmap_config = {
> +		.reg_bits = 16,
> +		.val_bits = 8,
> +		.max_register = 0x60,
> +		.fast_io = true,
> +		.use_single_read = true,
> +		.use_single_write = true,
> +	};
> +	struct device *dev = &pdev->dev;
> +	struct spmi_subdevice *sub_sdev;
> +	struct spmi_device *sparent;
> +	struct mt6685_rtc *rtc;
> +	int ret;
> +
> +	rtc = devm_kzalloc(dev, sizeof(struct mt6685_rtc), GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	sparent = to_spmi_device(dev->parent);
> +	sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
> +	if (IS_ERR(sub_sdev))
> +		return PTR_ERR(sub_sdev);
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "reg",
> +				   &mt6685_rtc_regmap_config.reg_base);
> +	if (ret)
> +		return ret;
> +
> +	rtc->irq = platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0)
> +		return rtc->irq;
> +
> +	rtc->mclk = devm_clk_get(dev, 0);
> +	if (IS_ERR(rtc->mclk))
> +		return PTR_ERR(rtc->mclk);
> +
> +	rtc->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mt6685_rtc_regmap_config);
> +	if (IS_ERR(rtc->regmap))
> +		return PTR_ERR(rtc->regmap);
> +
> +	rtc->rdev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(rtc->rdev))
> +		return PTR_ERR(rtc->rdev);
> +
> +	platform_set_drvdata(pdev, rtc);
> +
> +	/* Clock is required to auto-synchronize IRQ enable to RTC */
> +	ret = clk_prepare_enable(rtc->mclk);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
> +					rtc_mt6685_irq_handler_thread,
> +					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> +					"mt6685-rtc", rtc);
> +	clk_disable_unprepare(rtc->mclk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Cannot request alarm IRQ");
> +
> +	device_init_wakeup(&pdev->dev, true);

devm_device_init_wakeup ?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

