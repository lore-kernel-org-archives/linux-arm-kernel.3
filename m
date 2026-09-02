Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D170C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AfNAVBz0XtGYE2d+HbSOZwCHDoc1V70sAc8HmdvpJ0=; b=b0kJ5HpkcX/QqvJhmaI3hdyr79
	uRQpLMeDqeQXUhdrirg2NhqDlksrqUX+f2+NNJDQ1SMnmc9MeYkISkSiNEyI1Vuq0CYu+8w1guYpd
	rq72rSfVxzdcmWQPAp5uVr+nmgNIpW8YjHd7WR/y82I5MrujMDPvkke4D4KsEugz7OeQ25EE9IIMl
	CfHR/7vqPyByUfbRYrRYzT/Ny6Ig3Zqy6WGP85jIJ1nifgssJhJAdXQn/gCPoDgZU1GW/rVNA5CwI
	IqNAi5/e2Hx4k1XUWrrCqSUtv5h0ZwlA5fDON4uV25uIWEZqLpgBh1PYwxY5cKuifhGiBYqwWf8ML
	T+0SyDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ip5-0000000ESL8-4Apg;
	Wed, 02 Sep 2026 11:08:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ip3-0000000ESKj-0hN8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:08:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so10098815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788347283; x=1788952083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AfNAVBz0XtGYE2d+HbSOZwCHDoc1V70sAc8HmdvpJ0=;
        b=MSPeex5ZM6sq+Hh2P3khqfpJ2kEbxJq12gi0KJPcD9AvtENCDvQ0rXrdj1LWepaMqV
         mGmrBJ63MVWLoSfWGszpD4Sj770BQ0M1UORVT6rtR0aWCPxPltEtBjsd5yR425sYZCgj
         /4Gbh9kDXMPTpVx7F62WMD9G4+Ap+L7nK5WHDGLUPpSTY6278v0OIYGy9guJemfdLYV/
         8oJG9q5AVw1uInqdw9lbJPtDy780tCHLr5MOIqgzyjq/p3xhRh5EhYwNeUny1x8ivkzE
         uSbzB0r+N6DyATCL/Zl4W9EKCWu0TJ0GBMTFwz8b0+vjTgWwWCNB0QVsWqlCxxbSse6p
         AV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788347283; x=1788952083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AfNAVBz0XtGYE2d+HbSOZwCHDoc1V70sAc8HmdvpJ0=;
        b=UoCfcMIG7rgMltBCLWVlWK9rbpGkMfySdvJKYHYbTZVSiWMV3lacs9Wq0uguRs+vdq
         OXZcDNinmq20M4AHme0MTcoeRhWVYaMFZk6hc08bstBqgKU/yPkgsiV0V8tyJGU/P4ZS
         qOssAwsjrgtwvca2X4iG6xAXP9JoWNZsRw5m5+/YYH05SqDjHt0BYp1BnlOReAJvvE7g
         VREZceJrTwLr9nyxZWyn0zMdBOYO/Kiikz64J1AMyubzbPptBF7mSAwA04aE/YqWncGm
         dGuQEp3VUDOs0SnA412LZqGKrvQ59Z9fL1b/OS6vhxX8wENJl8H/YAJXoqpBHVKMzUUu
         ZB4A==
X-Forwarded-Encrypted: i=1; AHgh+RrcOvnMlC3P+XMY9jv1qocwfmfZ0rdWj3/TVt+PI3xWq0zQvudG1m34gyThUVaYsF9kAeyu0n753OJynS5CQPFu@lists.infradead.org
X-Gm-Message-State: AFuF++l+53Aie2lYDZcxRzzNz8DEQiIe+rbY0byOPqpVHFWlAWvDm9CW
	FtnX3H1oTR1z69LFLsZ6R64brnhtHwqVOec0TjlpQv1oMhTal38OTR7W
X-Gm-Gg: AR+sD13rlhKTWw3+2o6dsAuM/lGwPEtr3n6/FSLjcYePZENkb0EOnfAaoRxk0arOU1g
	kqBOa1FEVl4RkIHl0uLbKa0uJmRPwG4F86ICC0A7CyE2SJKSq20wFNuk3bkOZgMPO6JOIktjQ0U
	QMk9qnUF8XEIy+hGDJbB6vbF99eicjEmc8djFPAtiiOwDXIvIY/56xQsRviLNpMgEZpgw33hGdA
	Ewa3SrwgIbm2fO89r+W50Vu/BQ/3K37b2m69tZFIUEUC01iAI2rqeiFI2rD9tG608jVC8uuYHC8
	sMCRXVzhVXgWYJptS52CQxuccv09BUcaLoo1me+/19/1V3oMjGityM1xyw+otue1JuoZjkFpJgz
	FxTXDA0FxSSjA6xeeqNqwYvPl/bQ/jJyYydr9URakxT9Y6YY9RBJRF4SAdHPRLjsdtjI/otUlOx
	L+Y1ZWhGWFCTQRYUhWW7cAk6pZYSJfCj2b583cm/fSPMQnEcJkRHs+zrnCpNxIXxG19YhGPT99/
	DhS
X-Received: by 2002:a05:600c:4f42:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49ce558e89amr70479425e9.0.1788347283266;
        Wed, 02 Sep 2026 04:08:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm96387015e9.0.2026.09.02.04.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:08:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 13:08:01 +0200
Message-ID: <20260902110801.3893392-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902075629.D0B1C1F000E9@smtp.kernel.org>
References: <20260902073946.3709080-2-mehmet.fide@gmail.com> <20260902075629.D0B1C1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_040805_258173_581EBB11 
X-CRM114-Status: GOOD (  21.95  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> New issues:
> - [High] Dangerous asymmetry between `pin_config_get` (generic) and `pin_config_set` (raw) causes hardware register corruption.
> - [Medium] Incomplete transition to generic pinconf API breaks SCU-based platforms.
>
> Pre-existing issues:
> - [Critical] Out-of-bounds write during Device Tree parsing in imx_pinctrl_parse_pin_mmio

[...]
> [Severity: Medium]
> Does this bypass the generic decoding logic for SCU platforms?
>
> If a generic caller like pinctrl_gpio_get_config() queries an SCU-based
> platform, it appears the SCU path (info->imx_pinconf_get) will overwrite
> the generic parameter in *config with a raw hardware register value instead
> of unpacking it.

Yes, that slipped through: the SCU callback returns the raw pad value
like the mmio one did. v3 makes imx_pinconf_get() return -ENOTSUPP for
IMX_USE_SCU SoCs, so a generic query gets "not supported" there instead
of register bits; the debugfs dump keeps reading the raw value through
the SCU path as before.

[...]
> [Severity: High]
> Does this introduce an asymmetry between the get and set callbacks causing
> hardware corruption?
>
> While the get callback now unpacks generic parameters, imx_pinconf_set_mmio()
> remains completely raw. If a generic caller like pinctrl_gpio_set_config()
> passes a packed config (e.g., PIN_CONFIG_LEVEL), will it be blindly written
> into the hardware pad configuration register here?

It would, and it would have before this patch too; the set side is not
changed here. The fsl,pins binding hands pin_config_set the raw pad
register value and that is the only thing it accepts. The one in-tree
route for a packed config into it is gpiochip_generic_config(), and the
GPIO drivers on these pin controllers do not install it as set_config
(gpio-mmio, gpio-vf610, gpio-mxc); gpio-mxc calls it directly only on
the SCU based SoCs, with the SCU wakeup code the SCU set callback
expects, not a generic parameter. Without a set_config the gpiolib bias
and persist helpers stop at -ENOTSUPP before reaching pinctrl. A raw
value and a packed one cannot be told apart in the callback either, so
decoding on the set side means a real conversion of the driver, not a
fix that belongs in this series. v3 states that boundary in the commit
message.

[...]
> [Severity: Critical]
> This is a pre-existing issue, but can the Device Tree parsing cause an
> out-of-bounds write here?
>
> Looking at imx_pinctrl_parse_pin_mmio() in drivers/pinctrl/freescale/pinctrl-imx.c:
>
>     *pin_id = (mux_reg != -1) ? mux_reg / 4 : conf_reg / 4;
>     pin_reg = &ipctl->pin_regs[*pin_id];
>     pin->pin = *pin_id;
>     pin_reg->mux_reg = mux_reg;
>     pin_reg->conf_reg = conf_reg;
>
> If a maliciously crafted Device Tree overlay provides an excessively large
> mux_reg or conf_reg value, the unvalidated pin_id is used to index into
> ipctl->pin_regs, potentially overwriting arbitrary memory.

Agreed that the index is not checked against info->npins; it has been
like that since the parser was written and this patch does not touch it.
A bounds check with -EINVAL is a one-liner, I will send it as a separate
patch after this series.

Mehmet

