Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2F5C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwaKpZhY+U1YQ2Z3sLZB+CgUEjk+uqaSTrCtONQLkzo=; b=gCLidLXJejr6JJCLJjZVTNT9GQ
	nGLrAMe63FnyH7Rl7mZ8gGlE3gl357l9tc14qrdKNNIXFUenkjm+WHFynl4OfMoC/HYO06akG8F65
	lz4UW1lDyyrQp8kQsJjQHzCnqcdbDeFzXhqQfPhHS/St7IOwOXPZi0li0VD11xFfDwlWN94v97AUp
	tZKH4SjBlZqb0V9J+N6H+gZgiu+Qt8PFabBspNlYDFZOMot/eFZlp5FcCoONbfxDqXQDv3s+AHJc+
	2U0591N5v/oYh2M+VCQDGlouH5S2p/ck4rjl0fRj/MyIC7n2bEM+FD6D5x4ML6XGnetqLaxdzl/7z
	eU8tZWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EJq-00000000a0h-43ct;
	Thu, 03 Sep 2026 20:45:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EJp-00000000a0Y-2Oa5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 20:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=CwaKpZhY+U1YQ2Z3sLZB+CgUEjk+uqaSTrCtONQLkzo=; b=O0gr2o2+imiogTWuhBohgX8cxg
	wsNEZpbe34lMMpx8VrDP4tgXLSyfdCvrTYEsWH0KYI9Pf3NsfgW3gIQVOEhLwc+YiYSmHYDOl0/N0
	zCzqR50R17mZh5+DJZRqGDXz+PedPASypee0Enm98TaBQpim9WjqLVWAlKprrC6rD2wV994CbAhfF
	HlmvZEGNd+mfkm+os0Syjzh9B9nP/2RPVs7GhLUoH6WW2v7Tlcp5TgnUzMG6WNd8YY4J3uN6wie8I
	ppJ2/uWBkPjs6KRWAhfHN8gwjSZwxfFu1nmp0ORGDxQwXyqY+RX1rNLzc9ko90j0oSZk3hvkfiUDv
	P2Gceh7A==;
Received: from smtp-73.smtpout.orange.fr ([80.12.242.73] helo=smtp.smtpout.orange.fr)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EJn-0000000AwIf-09P9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 20:45:56 +0000
Received: from [IPV6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e] ([10.65.86.62])
	by smtp.orange.fr with ESMTP
	id 2EBCx0f4jFRaz2EBCxA3CX; Thu, 03 Sep 2026 22:37:02 +0200
Received: from [IPV6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e]
 ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id 2EB8xKXgh2arj2EB8xJSGR; Thu, 03 Sep 2026 22:37:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1788467822;
	bh=CwaKpZhY+U1YQ2Z3sLZB+CgUEjk+uqaSTrCtONQLkzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=TJDYEztgMBZr5D+XpbvrUmYthbWh3TsgoaTswh87ZevYrHpSZk7puA/GvTLiGfzRp
	 WLPJJ158Kq2q9AgfFG3m1CXjpTdi5kHg/M1zk7I1Ja6j6QfOGMet5wwl1YzvQbNSq3
	 p7/uQLH1BAgihqSP+0g0KRN/JxTTOZu4S5YfAj0dMuXa576wIR9ILVg4oE3LhjkZhB
	 xwiqdZYgRcgGG4RTDdT4buFeCs18f1OI7xtvU3pRFBWtiefvmIkzlWkeSvE2KXO3qR
	 HTO/cKEio50iZEA7RgC4r87APvZHUW32JC+MCMQmVAcQh4xawDKumgLdL4XBks9EIA
	 aMVAcnfgAZ9Tw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 03 Sep 2026 22:37:02 +0200
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
Message-ID: <46772551-207f-4795-89d5-6c02a0b85410@wanadoo.fr>
Date: Thu, 3 Sep 2026 22:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
 Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_214555_131680_92E86D06 
X-CRM114-Status: GOOD (  17.25  )
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

Le 20/07/2026 à 11:44, Andrea della Porta a écrit :
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> The Raspberry Pi RP1 southbridge features an embedded PWM
> controller with 4 output channels, alongside an RPM interface
> to read the fan speed on the Raspberry Pi 5.
> 
> Add the supporting driver.
> 
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Hi,

...

> +static int rp1_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	unsigned long clk_rate;
> +	struct pwm_chip *chip;
> +	void __iomem	*base;
> +	struct rp1_pwm *rp1;
> +	int ret;
> +
> +	chip = devm_pwmchip_alloc(dev, RP1_PWM_NUM_PWMS, sizeof(*rp1));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +
> +	rp1 = pwmchip_get_drvdata(chip);
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	rp1->regmap = devm_regmap_init_mmio(dev, base, &rp1_pwm_regmap_config);
> +	if (IS_ERR(rp1->regmap))
> +		return dev_err_probe(dev, PTR_ERR(rp1->regmap), "Cannot initialize regmap\n");
> +
> +	rp1->clk = devm_clk_get(dev, NULL);

Could it be devm_clk_get_enabled() to simplify the error handling path 
as done above with other devm function?
...

> +	if (IS_ERR(rp1->clk))
> +		return dev_err_probe(dev, PTR_ERR(rp1->clk), "Clock not found\n");
> +
> +	ret = clk_prepare_enable(rp1->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable clock\n");

... this also saves these 3 lines.

> +	rp1->clk_enabled = true;
> +
> +	ret = devm_clk_rate_exclusive_get(dev, rp1->clk);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to get exclusive rate\n");
> +		goto err_disable_clk;
> +	}
> +
> +	clk_rate = clk_get_rate(rp1->clk);
> +	if (!clk_rate) {
> +		ret = dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
> +		goto err_disable_clk;
> +	}
> +	/*
> +	 * To prevent u64 overflow in period calculations:
> +	 * mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC)
> +	 * If clk_rate > 1 GHz, the result can overflow.
> +	 */
> +	if (clk_rate > HZ_PER_GHZ) {
> +		ret = dev_err_probe(dev, -EINVAL, "Clock rate > 1 GHz is not supported\n");
> +		goto err_disable_clk;
> +	}
> +	rp1->clk_rate = clk_rate;
> +
> +	chip->ops = &rp1_pwm_ops;
> +	chip->atomic = true;
> +
> +	platform_set_drvdata(pdev, chip);
> +
> +	ret = pwmchip_add(chip);

Could it be devm_pwmchip_add() to simplify the error handling path as 
done above with other devm function?

> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
> +		goto err_disable_clk;
> +	}
> +
> +	ret = of_syscon_register_regmap(np, rp1->regmap);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register syscon\n");
> +		goto err_remove_chip;
> +	}
> +
> +	return 0;
> +
> +err_remove_chip:
> +	pwmchip_remove(chip);
> +err_disable_clk:
> +	clk_disable_unprepare(rp1->clk);
> +
> +	return ret;
> +}
...

CJ

