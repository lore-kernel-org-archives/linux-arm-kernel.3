Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63291E9B340
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wX0OGsPu0Cxlv0PiFeBEE73XuyzU5Okzie1/FOEP9ag=; b=kJa70iveAOf2dJM25WGhWMztoy
	wPXXrLOlFnuLpx1YauiV1riMdk4pnjhsX+5uboNTpoOeYWJ6Rd5YGfYvweX2n5ecTMm8LMSbzHn4r
	WqaJlKFlQBFBLgIzsEM6reSG3wVm/c3EvQFEQqUWYepBmr7oiu4gfaYdCfQeDnNecLMrH9OCNtiE9
	n7c2t2/q8oaCwjDhDMqjjNc/xFoAQQVEdKbMvg+l9OiBPXk+O2DWNzwrOH31FZuIUlPSodiEGmklN
	CPwfxhOt4I6I5qTn0FdeLwf77BTs/4gRT87iABU4yJOIaUH4eMxKMlsAlnl2ux42M5zdF+5SZsWWd
	AaxmJJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzkx-0000000CbYj-1eLC;
	Mon, 02 Mar 2026 09:40:03 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzkt-0000000CbY5-1jWU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 09:40:02 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ae43042ea7so15901395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 01:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772444398; x=1773049198; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wX0OGsPu0Cxlv0PiFeBEE73XuyzU5Okzie1/FOEP9ag=;
        b=JkaHBWab+hjbdp+B08whj7arzrgqXvo0ljBGjoOZunaP1StQgS2MC80H9pexGZAfiO
         ld0LDhrveglHX542O3M5kwLAv5KueYxZJDn4eLFg0NraG8AN37TTJSiU+5+1U5tQwWR6
         i7f4x4A9AZeJ5vVNAtiVhuJVSpZWNYtE0Q+znDgx4HITEgxGOStxvTKeRkGNJ3Qz0c5K
         EbIYsHSZX8+RGWFfta4X0XShmc6Ynew+giEQf7hjpYuoaOUry6NJrRIFxspApCl7pkWo
         co7Cl8GZI3SLiHXYXRbQ/9gM1ICK/2GMs0ELukup13uP+zG9vb6mFGTVP+gXMX+PBrPn
         0Xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444398; x=1773049198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wX0OGsPu0Cxlv0PiFeBEE73XuyzU5Okzie1/FOEP9ag=;
        b=vU5nE8YtOKLygegPijdqOFuDWeN0yToyYTJWlKJhhLBvWJdGJ2qKEjpLarZP/TnHkx
         kVho2sGPuGp73NCxuGuotbvJe0rpIc5HeLd8C/eRqkOz3pnLi0aZVNo/IvOeDipp2PKp
         TCzLlPbO4JVb6beHt+YBmxDQ8uxo1f2HfjwFVu1loxwZNUb6iOfOgvbRLyZXRmOmbP76
         iwjc6VgBXwo5gbOz/Og0mZG7JptbJ7MAyJzFIntx1yEs5d/ikcIi0MMhzOwh4jxCaCOy
         3z0SxaShHmZMlFazpLYcbK9e2ihgJDJff9DGs1kXL1O1XK2UuDGTbInwfLt33zj6su0z
         rO7Q==
X-Forwarded-Encrypted: i=1; AJvYcCULcWdMlqVrr74STZRESZqQnGQ4f73sGIG5jFjX4inG0WSsp5mIarH8/zEwBzOBuLkPJl75ciPiOXLWbdHN3d/5@lists.infradead.org
X-Gm-Message-State: AOJu0YyWxTbR7wGFZJrdc8B/yn/yd1b+woGamuYjKjPrkh03boD8eL3k
	NqzfNLqx0YS9gg+F2tDnocNppNTnmtq9ww8BAHP62i2YkegnaMfDCjTB
X-Gm-Gg: ATEYQzxG4xpKQd04zzaiQvYeZHiuujAHqW0GFc90vI/6P9TxnmLyZ/9mmaVmjre641p
	jrVgv9w3ZSBb1OTN68zRcr7YT4LPaBsD16Lu8qCv5BuwBvS0PpSeJmNB9aUtYYdpG/n5/+No0lT
	TkBEk07LiBINbU03XHzw5MTqGdaYpGvwg6M6uVBrtrfrZYX0hXkluZFgu8UPEbTLFvuLTc6PrWg
	XoLYKjnDYb1E2ZP4Ksyc3WghP/XRA4sJ6WkJ3lBa+3Euyz42gT31nnWmXZ4j7Wp6KWyEOsHjWrN
	+O8Mwbox3+nRzqUQYg8T7uwbvF0vM6bdWb8ABr1YjD8ZUkQJalfMdJZYpEgUb7UPn9NjjHlZqze
	ryYsT/XAcJkvBd5bKpiqvcvrt7krbiMAFV+IBcXn1Ba9n7qD2IZj99X6RMuZLuqR9gF1W24zS9V
	WBCBn4V9p3zTnshjwaWKJ2d5yoFrvQ9eh55PLF8WC6XOBLjfko639W31JAfxSZNl/cXSjMgGg=
X-Received: by 2002:a17:902:e852:b0:2ad:ad0f:bbd2 with SMTP id d9443c01a7336-2ae2e4b54d3mr114451445ad.39.1772444398205;
        Mon, 02 Mar 2026 01:39:58 -0800 (PST)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae399acba4sm70151475ad.67.2026.03.02.01.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:39:57 -0800 (PST)
Message-ID: <eb013eda-7e3c-492a-9d69-915f1564f522@gmail.com>
Date: Mon, 2 Mar 2026 17:39:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andi.shyti@kernel.org, ychuang3@nuvoton.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260302020822.13936-1-zychennvt@gmail.com>
 <20260302020822.13936-3-zychennvt@gmail.com>
 <20260302-spiffy-capuchin-of-completion-e8c5b2@quoll>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260302-spiffy-capuchin-of-completion-e8c5b2@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_014000_718344_9158DB78 
X-CRM114-Status: GOOD (  30.36  )
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

Hi Krzysztof,
	Thank you for the review.

Krzysztof Kozlowski 於 2026/3/2 下午 03:24 寫道:
> On Mon, Mar 02, 2026 at 02:08:21AM +0000, Zi-Yu Chen wrote:
>> Add I2C support for Nuvoton MA35D1 SoC.
>> The controller supports standard, fast and fast-plus modes,
>> and provides master/slave functionality.
>>
>> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
>> ---
>>  drivers/i2c/busses/Kconfig      |  13 +
>>  drivers/i2c/busses/Makefile     |   1 +
>>  drivers/i2c/busses/i2c-ma35d1.c | 819 ++++++++++++++++++++++++++++++++
>>  3 files changed, 833 insertions(+)
>>  create mode 100644 drivers/i2c/busses/i2c-ma35d1.c
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index e11d50750e63..6bf8be1d2575 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -1589,4 +1589,17 @@ config I2C_VIRTIO
>>            This driver can also be built as a module. If so, the module
>>            will be called i2c-virtio.
>>  
>> +config I2C_MA35D1
>> +	tristate "Nuvoton MA35D1 I2C driver"
>> +	depends on ARCH_MA35
> 
> 
> Missing COMPILE_TEST
Will add || COMPILE_TEST to the dependency in v2.
> 
> ...
> 
>> +	/* Setup info block for the I2C core */
>> +	strscpy(i2c->adap.name, "ma35d1-i2c", sizeof(i2c->adap.name));
>> +	i2c->adap.owner = THIS_MODULE;
>> +	i2c->adap.algo = &ma35d1_i2c_algorithm;
>> +	i2c->adap.retries = 2;
>> +	i2c->adap.algo_data = i2c;
>> +	i2c->adap.dev.parent = &pdev->dev;
>> +	i2c->adap.dev.of_node = pdev->dev.of_node;
>> +	i2c_set_adapdata(&i2c->adap, i2c);
>> +
>> +	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>> +				   &busfreq);
>> +	if (ret) {
>> +		dev_err(i2c->dev, "clock-frequency not specified in DT\n");
>> +		return ret;
>> +	}
>> +
>> +	/* Calculate divider based on the current peripheral clock rate */
>> +	clkdiv = DIV_ROUND_CLOSEST(clk_get_rate(i2c->clk), busfreq * 4) - 1;
>> +	if (clkdiv < 0 || clkdiv > 0xffff) {
>> +		dev_err(dev, "invalid clkdiv value: %d\n", clkdiv);
>> +		return -EINVAL;
>> +	}
>> +
>> +	i2c->irq = platform_get_irq(pdev, 0);
>> +	if (i2c->irq < 0)
>> +		return i2c->irq;
>> +
>> +	platform_set_drvdata(pdev, i2c);
>> +
>> +	pm_runtime_set_autosuspend_delay(dev, I2C_PM_TIMEOUT);
>> +	pm_runtime_use_autosuspend(dev);
>> +	pm_runtime_set_active(dev);
>> +	pm_runtime_enable(dev);
>> +
>> +	ret = pm_runtime_get_sync(dev);
>> +	if (ret < 0)
>> +		goto rpm_disable;
>> +
>> +	writel(clkdiv & 0xffff, i2c->regs + MA35_CLKDIV);
>> +
>> +	ret = devm_request_irq(dev, i2c->irq, ma35d1_i2c_irq, IRQF_SHARED,
>> +			       dev_name(dev), i2c);
>> +
> 
> No blank line ever between call and if()
Acknowledged. Will fix in v2.
> 
>> +	if (ret != 0) {
> 
> Write simple and obvious code.
> 
> if (ret)
> 
Acknowledged. I will simplify the error check to if (ret) in v2.
>> +		dev_err(dev, "cannot claim IRQ %d\n", i2c->irq);
>> +		goto rpm_disable;
>> +	}
>> +
>> +	/* Give it another chance if pinctrl used is not ready yet */
>> +	if (ret == -EPROBE_DEFER)
> 
> Pointless and dead code.
Acknowledged. I will remove the redundant -EPROBE_DEFER check and its associated comment in v2
> 
>> +		goto rpm_disable;
>> +
>> +	ret = i2c_add_adapter(&i2c->adap);
>> +	if (ret) {
>> +		dev_err(dev, "failed to add bus to i2c core: %d\n", ret);
>> +		goto rpm_disable;
>> +	}
>> +
>> +	pm_runtime_put_autosuspend(dev);
>> +
>> +	return 0;
>> +
>> +rpm_disable:
>> +	pm_runtime_put_noidle(dev);
>> +	pm_runtime_disable(dev);
>> +	pm_runtime_set_suspended(dev);
>> +	pm_runtime_dont_use_autosuspend(dev);
>> +	return ret;
>> +}
>> +
>> +static void ma35d1_i2c_remove(struct platform_device *pdev)
>> +{
>> +	struct ma35d1_i2c *i2c = platform_get_drvdata(pdev);
>> +
>> +	i2c_del_adapter(&i2c->adap);
>> +	pm_runtime_disable(&pdev->dev);
>> +}
>> +
>> +static int ma35d1_i2c_suspend(struct device *dev)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
>> +	unsigned int val;
>> +
>> +	spin_lock_irq(&i2c->lock);
>> +
>> +	/* Prepare for wake-up from I2C events if slave mode is active */
>> +	if (i2c->slave) {
>> +		val = readl(i2c->regs + MA35_CTL0);
>> +		val |= (MA35_CTL_SI | MA35_CTL_AA);
>> +		writel(val, i2c->regs + MA35_CTL0);
>> +		ma35d1_i2c_enable_irq(i2c);
>> +	}
>> +
>> +	spin_unlock_irq(&i2c->lock);
>> +
>> +	/* Setup wake-up control */
>> +	writel(0x1, i2c->regs + MA35_WKCTL);
>> +
>> +	/* Clear pending wake-up flags */
>> +	val = readl(i2c->regs + MA35_WKSTS);
>> +	writel(val, i2c->regs + MA35_WKSTS);
>> +
>> +	enable_irq_wake(i2c->irq);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35d1_i2c_resume(struct device *dev)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
>> +	unsigned int val;
>> +
>> +	/* Disable wake-up */
>> +	writel(0x0, i2c->regs + MA35_WKCTL);
>> +
>> +	/* Clear pending wake-up flags */
>> +	val = readl(i2c->regs + MA35_WKSTS);
>> +	writel(val, i2c->regs + MA35_WKSTS);
>> +
>> +	disable_irq_wake(i2c->irq);
>> +	return 0;
>> +}
>> +
>> +static int ma35d1_i2c_runtime_suspend(struct device *dev)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
>> +	unsigned int val;
>> +
>> +	/* Disable I2C controller */
>> +	val = readl(i2c->regs + MA35_CTL0);
>> +	val &= ~MA35_CTL_I2CEN;
>> +	writel(val, i2c->regs + MA35_CTL0);
>> +
>> +	clk_disable_unprepare(i2c->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35d1_i2c_runtime_resume(struct device *dev)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(i2c->clk);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable clock in resume\n");
>> +		return ret;
>> +	}
>> +
>> +	/* Enable I2C controller */
>> +	val = readl(i2c->regs + MA35_CTL0);
>> +	val |= MA35_CTL_I2CEN;
>> +	writel(val, i2c->regs + MA35_CTL0);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops ma35d1_i2c_pmops = {
>> +	SYSTEM_SLEEP_PM_OPS(ma35d1_i2c_suspend, ma35d1_i2c_resume)
>> +		RUNTIME_PM_OPS(ma35d1_i2c_runtime_suspend,
>> +			       ma35d1_i2c_runtime_resume, NULL)
>> +};
>> +
>> +static const struct of_device_id ma35d1_i2c_of_match[] = {
>> +	{ .compatible = "nuvoton,ma35d1-i2c" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, ma35d1_i2c_of_match);
>> +
>> +static struct platform_driver ma35d1_i2c_driver = {
>> +	.probe      = ma35d1_i2c_probe,
>> +	.remove     = ma35d1_i2c_remove,
>> +	.driver     = {
>> +		.name   = "ma35d1-i2c",
>> +		.owner  = THIS_MODULE,
> 
> Do not upstream 12-year-old code. We fixed all these issues long time.
> Please write your driver from scratch, so you will not
> repeat/reintroduce all the issues which we already fixed.
> 
I will address these issues in V2 by:

Removing the redundant .owner = THIS_MODULE.

Reviewing the entire driver to ensure all APIs and patterns align with current upstream standards.

I am performing a "from-scratch" review to eliminate legacy patterns.
>> +		.of_match_table = ma35d1_i2c_of_match,
>> +		.pm = pm_ptr(&ma35d1_i2c_pmops),
>> +	},
> 
> Best regards,
> Krzysztof
> 


