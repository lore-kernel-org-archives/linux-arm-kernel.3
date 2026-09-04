Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563DEC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Pi3sqyteuE0/QZwa01E3S2F0kiuXgMtxWMFjBjLXuI=; b=jWPbeNwIB1Y7igtEZE3Vzc/wMw
	guc2RsLLsjfBJ2v8ThSlO4gK4+v/bXZ/SDeVOINWVVmIvCZx5sJcIrlKXXF1loDkCsoAnR5TeGFHA
	q46NGD/zIXQCUCfsvK/hJtKm25/r1WGLp76Pv8g9gkXp1gaWNOnFRHPwkTnN5u2gibDqWtnXer/me
	gDF9/NR1Ep5xU9RO1YIcTMF8CU2btpViPqKBEu3UBOFy2MRL9l+i/zHDup7mN0cdAOtq1Q6ogpsUe
	3sh6lkTURG01p/Ajg6HHph/MgOP5XxrpQlG4v67+P61aYtewlWYENrE6bScirH003COW025dLfcft
	d6yITxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wm8-00000002jM4-2c6n;
	Fri, 04 Sep 2026 16:28:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wm5-00000002jKt-1Ob4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:28:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso793299f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 09:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788539299; x=1789144099; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Pi3sqyteuE0/QZwa01E3S2F0kiuXgMtxWMFjBjLXuI=;
        b=eMOgtFL22ysql+apXweOrO+jl49AHcCk/ApbsxJWHEGoAEWmOribx9bo72fXGvNcfv
         ht1N92ZwSGWwQ7GSrZrWusjJ7yFIjGq5GTh8W/4UnxiZtZHRg3UglovJGpJMYknWPhvs
         FnQxkSCkVZscrxDkb66D4/8nltlehQwJw3ebDm+ret91Y1hdWf88P0W2KTzmIRFRQ/4d
         5pu0OaPHtSVz8VtbuxpK6HOk279Z7fGb3bME1fnd2lFmvEFdKcSYoX/9JWvN21+3ZhMK
         2JJaHb7D2wRj0MqU8jU+Vp3JOc+OvfXsVC9aDydByTPhtgbV2/MezV/EyBOorC3g6Gik
         Q1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539299; x=1789144099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Pi3sqyteuE0/QZwa01E3S2F0kiuXgMtxWMFjBjLXuI=;
        b=ZmEhj4BeWtJ7PmxdWboaOjycs4/w0GhTMrISEn6UFAHGeCqBVWh6Po3M48RdluAu+8
         2O3zIOKowJapbl8jKMyZxB6Hp9zfGZUcuruFHAsZ3XbY1oVl7g3goEY5mYJvku7Z/oXZ
         8xRy4hXeMDx/h9JW9kEmDRZwzuas5S+fAFd2EeWrsMIctjwknCFGBWmtFr0uGKTEkbRD
         FE6b7+kqSEcKGAakcXdax10mCJQ3NtfdkgpfYzAA7Wy/ZPQWUS35OD4E970Pt0NNAiL7
         sqCnBULLCVASPGj7+jIFDgxSGHxcsz5YnNAQjEG/sFmC7RqLak37QEUg/bBO/ipSbwuJ
         hHaA==
X-Forwarded-Encrypted: i=1; AKwUvBxj3Iv3osn49LRg45nlqYbnLiEmRg2PcaysW76d0ZTYlXoDkhE75jsV+0RGxyulSa3sWUQLjSCetvoTjOZXNUWa@lists.infradead.org
X-Gm-Message-State: AFuF++k3doV06xGMSehVMsL1y9LINW4RWyjtugVfEMYcmj42UC1M7B9L
	tmGnKKzel01pQZDLokzNhs7fRvEE0Kge8tjF4QwYTDinBW9lemyX/N7QH7LdUUN/PJw=
X-Gm-Gg: AYBFou16AQCiWeHKd0FuD+PDFl03JR4iMq7UDLW4a3miJ+w6Y1HXdSwjvO0E/3wsxnd
	Ao0hjlg/E62CdTJMKO5WAAc/SsLE4vg4c21NnZ585J7v8FNwBD3xNGtpjIMGLagxYImVCWhRAt4
	FXRMidhdctCjoh7yotmATtOChH2oiNkvONUtYpWo94D3XkTdnBAgWUdxYe2soX2OL3+sDgQ/eXH
	L1EUphX3caTF4MBqmhhz2uU2zhGjQHNsieRDZIYJ1Kk7Xpb1ucki7lXl5iZtEhT8b/gtxzpXkL7
	JDDgMXAfIrG4uGF91P9wm9Q5v8rDPf2f+zG3Mf/c1OYqPTolfHAddN++gTRgeYr6n6retDdYQ8W
	GW/dxQUSDHbU9miP/19nFs+nYvhldNnOMK3cKBwjC2zaqaVPFillZjAguuOO07pNMkhMzZyuoVI
	lblbSG9F+RlzlkQB4mXcW4lDxVBMGpxKPOPUsOgV6poastp8M9jx/RNxWguw==
X-Received: by 2002:a5d:5225:0:b0:485:8435:5a3a with SMTP id ffacd0b85a97d-485872ea457mr9219109f8f.25.1788539298646;
        Fri, 04 Sep 2026 09:28:18 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm8164784f8f.25.2026.09.04.09.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:28:18 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 4 Sep 2026 18:31:57 +0200
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
	Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <apryfdwBCHaGJobA@apocalypse>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
 <46772551-207f-4795-89d5-6c02a0b85410@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46772551-207f-4795-89d5-6c02a0b85410@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_092821_399248_E97B8897 
X-CRM114-Status: GOOD (  26.73  )
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

Hi Christophe,

On 22:36 Thu 03 Sep     , Christophe JAILLET wrote:
> Le 20/07/2026 à 11:44, Andrea della Porta a écrit :
> > From: Naushir Patuck <naush@raspberrypi.com>
> > 
> > The Raspberry Pi RP1 southbridge features an embedded PWM
> > controller with 4 output channels, alongside an RPM interface
> > to read the fan speed on the Raspberry Pi 5.
> > 
> > Add the supporting driver.
> > 
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> Hi,
> 
> ...
> 
> > +static int rp1_pwm_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev->of_node;
> > +	unsigned long clk_rate;
> > +	struct pwm_chip *chip;
> > +	void __iomem	*base;
> > +	struct rp1_pwm *rp1;
> > +	int ret;
> > +
> > +	chip = devm_pwmchip_alloc(dev, RP1_PWM_NUM_PWMS, sizeof(*rp1));
> > +	if (IS_ERR(chip))
> > +		return PTR_ERR(chip);
> > +
> > +	rp1 = pwmchip_get_drvdata(chip);
> > +
> > +	base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	rp1->regmap = devm_regmap_init_mmio(dev, base, &rp1_pwm_regmap_config);
> > +	if (IS_ERR(rp1->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(rp1->regmap), "Cannot initialize regmap\n");
> > +
> > +	rp1->clk = devm_clk_get(dev, NULL);
> 
> Could it be devm_clk_get_enabled() to simplify the error handling path as
> done above with other devm function?

The very first version of this patches had devres everywhere, but Uwe has correctly
spotted that this could lead to clock ops imbalance, please see:
https://lore.kernel.org/all/adLTwOTbkJ0VQXy6@monoceros/
As a result, I turned devm_clk_get_enabled() into the corresponding non devres/single
component functions since now disengaging the clock depends on a conditional.
Of course this does not make much sense in case we don't need a .remove callback,
but it seems that I can reintroduce it again if we agree to use EXPORT_SYMBOL_NS.

> ...
> 
> > +	if (IS_ERR(rp1->clk))
> > +		return dev_err_probe(dev, PTR_ERR(rp1->clk), "Clock not found\n");
> > +
> > +	ret = clk_prepare_enable(rp1->clk);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to enable clock\n");
> 
> ... this also saves these 3 lines.

See above.

> 
> > +	rp1->clk_enabled = true;
> > +
> > +	ret = devm_clk_rate_exclusive_get(dev, rp1->clk);
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "Failed to get exclusive rate\n");
> > +		goto err_disable_clk;
> > +	}
> > +
> > +	clk_rate = clk_get_rate(rp1->clk);
> > +	if (!clk_rate) {
> > +		ret = dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
> > +		goto err_disable_clk;
> > +	}
> > +	/*
> > +	 * To prevent u64 overflow in period calculations:
> > +	 * mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC)
> > +	 * If clk_rate > 1 GHz, the result can overflow.
> > +	 */
> > +	if (clk_rate > HZ_PER_GHZ) {
> > +		ret = dev_err_probe(dev, -EINVAL, "Clock rate > 1 GHz is not supported\n");
> > +		goto err_disable_clk;
> > +	}
> > +	rp1->clk_rate = clk_rate;
> > +
> > +	chip->ops = &rp1_pwm_ops;
> > +	chip->atomic = true;
> > +
> > +	platform_set_drvdata(pdev, chip);
> > +
> > +	ret = pwmchip_add(chip);
> 
> Could it be devm_pwmchip_add() to simplify the error handling path as done
> above with other devm function?

Due to the above-mentioned scenario and since .remove is called before devres release
funtions, that would make the clock to be released before the pwm chip, causing
inconsistencies if the pwm is used in the meanwhile. 

Many thanks,
Andrea.

> 
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
> > +		goto err_disable_clk;
> > +	}
> > +
> > +	ret = of_syscon_register_regmap(np, rp1->regmap);
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "Failed to register syscon\n");
> > +		goto err_remove_chip;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_remove_chip:
> > +	pwmchip_remove(chip);
> > +err_disable_clk:
> > +	clk_disable_unprepare(rp1->clk);
> > +
> > +	return ret;
> > +}
> ...
> 
> CJ

