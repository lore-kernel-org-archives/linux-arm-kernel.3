Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183C0C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggM22qaVGaHjihmi1lkkmx3+x10+vUrFkk5gh3pgiME=; b=t8DkcZb1iGLkj4LBu8fIvdbFim
	ElTc4HkLCAed5eHxqRmqREKJL/m69gH6N8B6wAU6e/wrip5JT4TmT5H3Q3SKoSd12geo9iiBzAjyM
	S1IGEqN634GuxyUCY3bcI6qTrtO/kOQpr3SHWtlbXSgnGfqqnX1j0BaPZ3ONB+sQVSjSCdphmXzMB
	gyy1XMUSZwjkQm3CwzZLbAleYnKHU8fdG5vPE2BJ0HmL9SWxyyjvuWmdi6aVMjGhmE73gMX/Tpzh3
	AcnmAkVuSL19DW0J/pCol1t0j8ziw6j+DSRdF8xHFtfc5pDluLZ228huM/YSBc3ThKOJPgcBtZDe/
	BI3tbZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRTZ-00000002VS2-1jW8;
	Tue, 29 Sep 2026 06:38:05 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRTW-00000002VOw-0cF4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:38:03 +0000
Received: by mail-pz2-x0c.google.com with SMTP id d2e1a72fcca58-880483985aeso1615040b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790663881; x=1791268681; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggM22qaVGaHjihmi1lkkmx3+x10+vUrFkk5gh3pgiME=;
        b=oFHuKRXa9d6DNqheuQJTfH9bNZEQqRO8MA0D15IgtJJ92H2y85UAOZfjzSSI7rVvcQ
         8OJpbYLufauuO7s/+pQMzPMrfTrQ+tjJXYd58zp2sAybc0NZhh2VAPm9NKdPpy1Dv7j1
         tdBpzgMtT4+OaOg9uXOcehJ8cw5hfYzUu1guE9jAk0Yffv054pI80mJs4YHzreLfx2us
         Z6c+2NBd7Q87x89q2IeGAu/hCMXMcJRUJadDNyjOI1vuTmNSEHM6QJuyy2QCao6MpP6x
         vmgb2TG7uY9zrRQfbrx9mFkaBjkZnw9r2M5ymHZPXGDIHSU6w4O/pbh18MI3+9MuLrYI
         G0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663881; x=1791268681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggM22qaVGaHjihmi1lkkmx3+x10+vUrFkk5gh3pgiME=;
        b=2csdG4kdCRTAyNIzFKqsyIeOQ6PW/IWE5T3VLWuf//Ux8UMUshUidD6eltga6rdXpb
         b5GPlt5e2Xoals4GoRjvr9LHHF4iULddcFJCYcaojlj8nytwMs/cdGPi6kQ/GVlo85Ua
         //nZJ9L0lyczuSHjpBAo9EFwysQZMS9iqRsnPdPh/YlgaP689QrZQKQRM8A1g74OlpZm
         ILy/2GvEy38bTfiq19dWMO5Eu4KCln8/eC1pVivtwM2eTpIBG9r+VkapGF18TMTgXRf0
         MkTtIe6slRj3v9kBQKqYund/CTSN5BEevOk21hr4jDjOjOR6AXL/VEcHj3dRjueXy0hG
         0bTg==
X-Forwarded-Encrypted: i=1; AKwUvBw6rjmNGUUy1tgno6I7Lq8TV6QfIsPv9XilX7jip8EyKuvIucpdnKsFy6bC1SU06frYicDGI1Fl3UtgipFiE4BV@lists.infradead.org
X-Gm-Message-State: AFuF++nzDQJ91A3cLGpoMuyvvO/98HtOgC5MnfmLT/NbR0vpfVWQIMHq
	Jp5miEZFtQaU1YvDwRFZNehzsPWXw16MT16NjMV+3FqR36+zzXkdB8ovOjxfvQ==
X-Gm-Gg: AYBFou238gDu62KmxYxBHspbQOqQ8tmKswpTht4DdmHKAu8N5VPtujnVgnqDBm4IxaB
	z++NzRe9uwnMtOJ2a1N5XSZXf21olAFuq+7K4HNCjZGiNr4NRmdUYpxcoYBsGr+YfOD7jgRtaiO
	g/GqEGxqAOub2Te1NByRvLNX90rRLeY6NW/WWKHRSkeuhYHUFNq6u44ofWNAwvMDgFPwCUkxrIN
	BfT6kTBCoiBWZshiCwC5zHYYNPjVhJXnNmbLgn9ndxoNJ0sji54+YKwO+IZ4ck6vKRdwQ0jyvut
	t4k9c0AeySjrlJukKXn+rxVL3L/4mLE6LVtlsJwpVlvivOcZB/WlCsk5+KufA6Ms3WGyCtrVjbb
	xzqqiau2xRdTnpuTWWQsNXIBfFg7v4CM3MaeA9LaeIcIyOpI6UDIymdAR4mKFUrYg1HLxxG+bIe
	sBZIvufXZL6q44ueUyLGO7STcqpKHmhO9V5XiKFjPcQcL0km3tltlRIyuQZb0xILM7LUtwT0Tog
	cYZZ4lxFhnN5qXrLC3F1EdgcoAltF4vhc/wLmvADvhFtug=
X-Received: by 2002:a05:6a20:2450:b0:3d3:ad3c:49a9 with SMTP id adf61e73a8af0-3de0e744e71mr14694613637.23.1790663880945;
        Mon, 28 Sep 2026 23:38:00 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e20f2068sm246849b3a.42.2026.09.28.23.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:38:00 -0700 (PDT)
Message-ID: <c382ec53-dae0-45eb-86ca-de04f5b42360@gmail.com>
Date: Tue, 29 Sep 2026 14:37:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20260921083753.1109826-1-zychennvt@gmail.com>
 <20260921083753.1109826-3-zychennvt@gmail.com>
 <aro-QitaRwK87gdO@zenone.zhora.eu>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <aro-QitaRwK87gdO@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_233802_735771_AA3F656D 
X-CRM114-Status: GOOD (  25.86  )
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

Hi Andi,
Thanks for your review. 

Andi Shyti 於 2026/9/28 下午 08:24 寫道:
> Hi Zi-Yu,
> 
> ...
> 
>> +/* Constants */
>> +#define MA35_CLKDIV_MSK		GENMASK(9, 0)
>> +#define I2C_PM_TIMEOUT_MS	5000
>> +#define STOP_TIMEOUT_MS		50
> 
> these two defines are the only ones without the MA35 prefix.

Will add the MA35 prefix to these two definitions.
> 
> ...
> 
>> +static irqreturn_t ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
>> +					     unsigned long i2c_status)
>> +{
>> +	unsigned char byte = 0;
>> +
>> +	switch (i2c_status) {
>> +	case MA35_S_RECE_ARB_LOST:
>> +		/*
>> +		 * Arbitration lost during address transmission phase.
>> +		 * The hardware switches to Target Transmitter mode when
>> +		 * our own SLA+W is detected on the bus.
>> +		 */
>> +		i2c->err = -EAGAIN;
>> +		ma35d1_i2c_controller_complete(i2c);
>> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);
> 
> All the return values of these i2c_slave_event()'s are ignored.
> 
>> +		break;
>> +
>> +	case MA35_S_RECE_ADDR_ACK:
>> +		/* Own SLA+W has been receive; ACK has been return */
>> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);
>> +		break;
>> +
>> +	case MA35_S_TRAN_DATA_NACK:
>> +	case MA35_S_RECE_DATA_NACK:
>> +		/*
>> +		 * Data byte or last data in I2CDAT has been transmitted and NACK received,
>> +		 * or previously addressed with own SLA address and NACK returned.
>> +		 */
>> +		break;
>> +
> 
> ...
> 
>> +	default:
>> +		dev_err(i2c->dev, "Status 0x%02lx is NOT processed\n",
>> +			i2c_status);
>> +		ma35d1_i2c_restore_idle(i2c);
>> +		return IRQ_NONE;
>> +	}
>> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI_AA);
> 
> As far as I understood, this this is an unconditional ACK enabled
> for the next bytes received, right? In that case are we ignoring
> failed communications as above where we are supposed to send
> NACKs?
> 
Regarding the two comments above:
I will add handling for the return value of `I2C_SLAVE_WRITE_REQUESTED`. When it returns an error, subsequent bytes will be NACKed until the transfer ends.

For `I2C_SLAVE_WRITE_RECEIVED`, the MA35D1 hardware has already generated the ACK when this event is reported, so it is not possible to NACK the received byte at this point. Therefore, its return value can only be temporarily ignored.

>> +	return IRQ_HANDLED;
>> +}
> 
> ...
> 
>> +	i2c->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +	if (IS_ERR(i2c->regs))
>> +		return PTR_ERR(i2c->regs);
>> +
>> +	i2c->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>> +	if (IS_ERR(i2c->rst))
>> +		return dev_err_probe(dev, PTR_ERR(i2c->rst),
>> +				     "failed to get reset control\n");
>> +
>> +	ret = reset_control_deassert(i2c->rst);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to deassert reset line\n");
>> +
>> +	/* Setup info block for the I2C core */
>> +	strscpy(i2c->adap.name, "ma35d1-i2c", sizeof(i2c->adap.name));
>> +	i2c->adap.owner = THIS_MODULE;
>> +	i2c->adap.algo = &ma35d1_i2c_algorithm;
>> +	i2c->adap.quirks = &ma35d1_i2c_quirks;
>> +	i2c->adap.retries = 2;
>> +	i2c->adap.algo_data = i2c;
>> +	i2c->adap.dev.parent = &pdev->dev;
>> +	i2c->adap.dev.of_node = pdev->dev.of_node;
>> +	i2c_set_adapdata(&i2c->adap, i2c);
>> +
>> +	if (!device_property_read_u32(dev, "clock-frequency", &val)) {
>> +		if (val != 0 && val <= MEGA)
>> +			busfreq = val;
>> +	}
>> +	/* Calculate divider based on the current peripheral clock rate */
>> +	clkdiv = DIV_ROUND_CLOSEST(clk_get_rate(i2c->clk), busfreq * 4) - 1;
>> +	if (clkdiv < 0 || clkdiv > 0x3ff)
>> +		return dev_err_probe(dev, -EINVAL, "invalid clkdiv value: %d\n",
>> +				     clkdiv);
>> +
>> +	i2c->irq = platform_get_irq(pdev, 0);
>> +	if (i2c->irq < 0)
>> +		return dev_err_probe(dev, i2c->irq, "failed to get irq\n");
>> +
>> +	platform_set_drvdata(pdev, i2c);
>> +
>> +	pm_runtime_set_autosuspend_delay(dev, I2C_PM_TIMEOUT_MS);
>> +	pm_runtime_use_autosuspend(dev);
>> +	pm_runtime_set_active(dev);
>> +	pm_runtime_enable(dev);
>> +
>> +	ret = devm_add_action_or_reset(dev, ma35d1_i2c_pm_cleanup, dev);
>> +	if (ret)
>> +		return ret;
> 
> you are printing an error message everywhere, except of here.

Right. I’ll add an error message here as well.

> 
>> +
>> +	writel(MA35_CTL_I2CEN | MA35_CTL_INTEN, i2c->regs + MA35_CTL0);
>> +	writel(FIELD_PREP(MA35_CLKDIV_MSK, clkdiv), i2c->regs + MA35_CLKDIV);
>> +
>> +	ret = devm_request_irq(dev, i2c->irq, ma35d1_i2c_irq, 0, dev_name(dev),
>> +			       i2c);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "cannot claim IRQ %d\n", i2c->irq);
>> +		return ret;
>> +	}
>> +
>> +	ret = devm_i2c_add_adapter(dev, &i2c->adap);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "failed to add bus to i2c core\n");
>> +		return ret;
> 
> return dev_err_probe(...)
will do.

> 
> Thanks,
> Andi
> 
>> +	}
>> +
>> +	dev_info(&i2c->adap.dev, "%pa MA35D1 I2C adapter registered\n",
>> +		 &res->start);
>> +	return 0;
>> +}


