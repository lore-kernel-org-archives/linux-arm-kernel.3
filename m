Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29406CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CWSteu4ueuV0aIApfiAJbNQgjn5Egg3v9K0wNLPvCE=; b=Y1eNR9MWYCzOgoHrH6pKtCa1ZG
	pCyjyrWJu5WguDNO5raqzftPS8hm+l0Fx8lN43VgCRpyak42E3/HynXTMDg9T6Ym33tbHSPiO9SmC
	EX2xHJFyDDAO+z5aRV4yFuZxalNDcKgzKDajSbpJ+Ic5A4kKGv4AVMhH6zLTy/JbB9COkTy/j7Kfe
	BtTgLA8RAmR0YVOIPwsEUAZbgNwWamh49PgPl44HHurZp4I3O59PC+nkUyde85D3qBnaONCLhugZ2
	+g9lLGG5THzhgsNKvANQ9mGsSNr+MGe5Il4MAO9jHbO9vT6k8sUqHJ84yL6nfP1o0sht5G4meLf6Q
	4hRY4ppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJdT-0000000GGDP-09zC;
	Wed, 27 Aug 2025 17:08:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGfz-0000000Ff9p-0DFY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 13:59:00 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-61c1a0cd60aso7518226a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756303137; x=1756907937; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9CWSteu4ueuV0aIApfiAJbNQgjn5Egg3v9K0wNLPvCE=;
        b=XW7OjuPPrSwXvelobTHbMlD/39ie985FbngMajqZx1CFmoJ99UmjELwO2OJiAnXkyU
         ZiHKhxL1+ngkr1pK5yTFuQpgECjbzaQvHFDQsSz6vg9N3pgnJfjt/PuASI65mFDNHwaC
         ajESJZJJfnheQWFwUnk33H4XYehLkV3sW5LBTq3dBxGCi93iTtLvJT/nFkIdGgax253K
         ZKxXQMyx5i+SiEZWMsyCR0gLZbFaMoA9zct/FMUT+BI4oi9IiKTzTQ3qsPKaXXxYpYly
         KOGF+ej4haTqHIwUxykQPKQtEWpODpUGcjkCEgSted6A4OEgOHvS0EfNd80nziDutsNT
         Njlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303137; x=1756907937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CWSteu4ueuV0aIApfiAJbNQgjn5Egg3v9K0wNLPvCE=;
        b=Z7+Jh7l8MTCYCAXpcEn2DsOvNpsitmiQtx/oWXkG1gzgh5mqKzVPXgTGecm+TJrh1g
         8A+BZOqZ3hw8piOfe91/M4y4YNHgYNWBYnsMCiBPnZPrfn+/iP4DshvASsDMJdjOTznr
         /RrX11CI6BwQUKclCJMyMgaCBXv6qT1kfzlXrr9ieNQDMW3MmuFAzqq866diTzx1pYvu
         J4ioek/e9FD5mIZw6hIrDgNlEpmAjJz9T/OhXWcS9e+gfIbymFy/ZtBAOumclYcZUnU7
         pV+F0eVr5PuGdHsIOkUfr5pB74MTp6MMC1m10A4LaajeJhsKOeqexxZ9C3gU+S6bnack
         S9wA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ4Vq//2jjnbc1YIsucybb6SGwJY5h4FaHiKbjzeArU2VAa99a8K356EpHeuE8kHhG71i00cFNCTVeoLvBBEPV@lists.infradead.org
X-Gm-Message-State: AOJu0YyD49fvmUPxtc3venSsK+5Aqxk5M445IbMlCABmGWurrCEOVLRh
	XFjnDPfHPmJFFCyN8YzFEbK0Ab+eKiLPaeILDCGYHeqd54dhjzbKAnoI+MzKmnG17Mg=
X-Gm-Gg: ASbGncvtZrQj5vPSTwsuWFwciBC45lHO8dzR+5RcxJaywWPic6vMxK/8wfLU9OUK7sU
	BvErZPEPMKT/kq+vchJO0CehzTO/wyQMZFEV8V/nr604LjvJMcFjXo+AqWvmz4r1UtBbUJHcSgF
	78Wst3J4Lrg8ar5UaUcWJMrHsFcf8nQ/Bc2V8xvLcjWg22ud/Gz8uRtEABkzw6ktLrm5HrB9+gF
	4E1zWos7ujoqf6LLTngJpbPqF08A+l26gNkbEh1fFw5mo06aIMEkgKrtbjocfAJpwE0HN9IxCL7
	OJ/+B67G8VDWfUotDTfszL4IwgGQ0b/0xIUBbvO/evUza8ECGjMUr+0ufDG77fh5xE9E8NXPw9g
	aHs5hst9xQhaYRdmKYumhIS/+I+9+c0DY+jOvRuNvB0HFlEbeNXDDsWXGoh8KTAqvsF3aRxFqd6
	Zt8j0XkZg6AB3BprzY
X-Google-Smtp-Source: AGHT+IGGtd6YYOMCijKCql/Dy2HeWOPmF4F9YoTLQ2VQc4J0uyvBHN+XraLb2sKAIVxVgCjlHyK+TQ==
X-Received: by 2002:a05:6402:4312:b0:61c:7a9b:21d4 with SMTP id 4fb4d7f45d1cf-61c7aaa67e8mr6702103a12.18.1756303137280;
        Wed, 27 Aug 2025 06:58:57 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61caae5fc3fsm2016468a12.51.2025.08.27.06.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 06:58:56 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 27 Aug 2025 16:00:50 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aK8PkgiU0yRO-c6f@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <83d0f449-be3a-44ca-9722-d747969d96c9@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83d0f449-be3a-44ca-9722-d747969d96c9@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_065859_091857_5B1FE0B0 
X-CRM114-Status: GOOD (  25.48  )
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

Hi Stefan,

On 11:57 Sun 24 Aug     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 11.08.25 um 16:46 schrieb Andrea della Porta:
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> > 
> > This driver provide pin muxing and configuration functionality
> > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > instance of the one used in Broadcom STB  product line.

[...]

> > +#define AGPIO_PIN(n)		PINCTRL_PIN(n, "aon_gpio" #n)
> > +#define SGPIO_PIN(n)		PINCTRL_PIN((n) + 32, "aon_sgpio" #n)
> It would be great, if there is comment explaining the difference between a
> AGPIO_PIN and a SGPIO_PIN?
> 
> In case AGPIO_PIN stands for AON_GPIO_PIN, i would prefer the latter.

I need to dig more on the SGPIO type, more on that as soon as I'll
find some more details. No problem in using more explanatory label,
of_course.

> > +
> > +struct pin_regs {
> > +	u16 mux_bit;
> > +	u16 pad_bit;
> > +};
> > +

[...]

> > +enum brcmstb_funcs {
> > +	func_gpio,
> > +	func_alt1,
> > +	func_alt2,
> > +	func_alt3,
> > +	func_alt4,
> > +	func_alt5,
> > +	func_alt6,
> > +	func_alt7,
> > +	func_alt8,
> > +	func_aon_cpu_standbyb,
> > +	func_aon_fp_4sec_resetb,
> > +	func_aon_gpclk,
> > +	func_aon_pwm,
> > +	func_arm_jtag,
> > +	func_aud_fs_clk0,
> > +	func_avs_pmu_bsc,
> > +	func_bsc_m0,
> > +	func_bsc_m1,
> > +	func_bsc_m2,
> > +	func_bsc_m3,
> > +	func_clk_observe,
> > +	func_ctl_hdmi_5v,
> > +	func_enet0,
> > +	func_enet0_mii,
> > +	func_enet0_rgmii,
> > +	func_ext_sc_clk,
> > +	func_fl0,
> > +	func_fl1,
> > +	func_gpclk0,
> > +	func_gpclk1,
> > +	func_gpclk2,
> > +	func_hdmi_tx0_auto_i2c,
> > +	func_hdmi_tx0_bsc,
> > +	func_hdmi_tx1_auto_i2c,
> > +	func_hdmi_tx1_bsc,
> > +	func_i2s_in,
> > +	func_i2s_out,
> > +	func_ir_in,
> > +	func_mtsif,
> > +	func_mtsif_alt,
> > +	func_mtsif_alt1,
> > +	func_pdm,
> > +	func_pkt,
> > +	func_pm_led_out,
> > +	func_sc0,
> > +	func_sd0,
> > +	func_sd2,
> > +	func_sd_card_a,
> > +	func_sd_card_b,
> > +	func_sd_card_c,
> > +	func_sd_card_d,
> > +	func_sd_card_e,
> > +	func_sd_card_f,
> > +	func_sd_card_g,
> > +	func_spdif_out,
> > +	func_spi_m,
> > +	func_spi_s,
> > +	func_sr_edm_sense,
> > +	func_te0,
> > +	func_te1,
> > +	func_tsio,
> > +	func_uart0,
> > +	func_uart1,
> > +	func_uart2,
> > +	func_usb_pwr,
> > +	func_usb_vbus,
> > +	func_uui,
> > +	func_vc_i2c0,
> > +	func_vc_i2c3,
> > +	func_vc_i2c4,
> > +	func_vc_i2c5,
> > +	func_vc_i2csl,
> > +	func_vc_pcm,
> > +	func_vc_pwm0,
> > +	func_vc_pwm1,
> > +	func_vc_spi0,
> > +	func_vc_spi3,
> > +	func_vc_spi4,
> > +	func_vc_spi5,
> > +	func_vc_uart0,
> > +	func_vc_uart2,
> > +	func_vc_uart3,
> > +	func_vc_uart4,
> > +	func__,
> > +	func_count = func__
> > +};
> I'm very sceptical that this enum is generic. I would tend use to
> bcm2712_funcs here.

Ack.

> > +
> > +static const struct pin_regs bcm2712_c0_gpio_pin_regs[] = {
> > +	GPIO_REGS(0, 0, 0, 7, 7),
> > +	GPIO_REGS(1, 0, 1, 7, 8),
> > +	GPIO_REGS(2, 0, 2, 7, 9),

[...]

> > +static const struct brcmstb_pin_funcs bcm2712_c0_aon_gpio_pin_funcs[] = {
> > +	PIN(0, ir_in, vc_spi0, vc_uart3, vc_i2c3, te0, vc_i2c0, _, _),
> > +	PIN(1, vc_pwm0, vc_spi0, vc_uart3, vc_i2c3, te1, aon_pwm, vc_i2c0, vc_pwm1),
> > +	PIN(2, vc_pwm0, vc_spi0, vc_uart3, ctl_hdmi_5v, fl0, aon_pwm, ir_in, vc_pwm1),
> > +	PIN(3, ir_in, vc_spi0, vc_uart3, aon_fp_4sec_resetb, fl1, sd_card_g, aon_gpclk, _),
> > +	PIN(4, gpclk0, vc_spi0, vc_i2csl, aon_gpclk, pm_led_out, aon_pwm, sd_card_g, vc_pwm0),
> > +	PIN(5, gpclk1, ir_in, vc_i2csl, clk_observe, aon_pwm, sd_card_g, vc_pwm0, _),
> > +	PIN(6, uart1, vc_uart4, gpclk2, ctl_hdmi_5v, vc_uart0, vc_spi3, _, _),
> > +	PIN(7, uart1, vc_uart4, gpclk0, aon_pwm, vc_uart0, vc_spi3, _, _),
> > +	PIN(8, uart1, vc_uart4, vc_i2csl, ctl_hdmi_5v, vc_uart0, vc_spi3, _, _),
> > +	PIN(9, uart1, vc_uart4, vc_i2csl, aon_pwm, vc_uart0, vc_spi3, _, _),
> > +	PIN(10, tsio, ctl_hdmi_5v, sc0, spdif_out, vc_spi5, usb_pwr, aon_gpclk, sd_card_f),
> > +	PIN(11, tsio, uart0, sc0, aud_fs_clk0, vc_spi5, usb_vbus, vc_uart2, sd_card_f),
> > +	PIN(12, tsio, uart0, vc_uart0, tsio, vc_spi5, usb_pwr, vc_uart2, sd_card_f),
> > +	PIN(13, bsc_m1, uart0, vc_uart0, uui, vc_spi5, arm_jtag, vc_uart2, vc_i2c3),
> > +	PIN(14, bsc_m1, uart0, vc_uart0, uui, vc_spi5, arm_jtag, vc_uart2, vc_i2c3),
> > +	PIN(15, ir_in, aon_fp_4sec_resetb, vc_uart0, pm_led_out, ctl_hdmi_5v, aon_pwm, aon_gpclk,
> > +	    _),
> > +	PIN(16, aon_cpu_standbyb, gpclk0, pm_led_out, ctl_hdmi_5v, vc_pwm0, usb_pwr, aud_fs_clk0,
> > +	    _),
> I think it's okay to violate the 80 char limit in these both cases to
> improve readability.

Ack.

> > +};
> > +
> ...
> > +
> > +static int brcmstb_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
> > +			       unsigned long *config)
> > +{
> > +	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
> > +	enum pin_config_param param = pinconf_to_config_param(*config);
> > +	u32 arg;
> > +
> > +	switch (param) {
> > +	case PIN_CONFIG_BIAS_DISABLE:
> > +		arg = (brcmstb_pull_config_get(pc, pin) == BRCMSTB_PULL_NONE);
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		arg = (brcmstb_pull_config_get(pc, pin) == BRCMSTB_PULL_DOWN);
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		arg = (brcmstb_pull_config_get(pc, pin) == BRCMSTB_PULL_UP);
> I'm not sure this is correct. I would expect that "arg" contains the
> resistance in Ohm for PULL_DOWN & PULL_UP.

In this case I don't have insight about the current impedance value. Since
this is easily something that changes between different implementations, I
would leave it as it is as it's more general, i.e. 0 for disabled and 1 for
pull up/down enabled (which seems to be the most common behaviour for pinconf
drivers anyway).

Once we know more details about the Ohm values or a new STB implementation
arises, we can quickly add the relevant data in the specific driver code.

Many thanks,
Andrea

> 
> Best regards

