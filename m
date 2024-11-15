Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E745D6DDEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6S2nGodUHkF7oQtN5BOS0le7eARr47Goh8++DpENQG0=; b=o3iIRfzfNZ16XUMuhmn9bA6Qgm
	a0zGEiQ0086eGLqdpUlwoti2SXs7cfUQ0qfo0wmoA2UQ+U4BWwS33GkuKfgmiNwwItEAz4OOQFMe5
	b+Q4lPu3MR0OrEeqJJ4oGjwxefWQhZU4Y1aHToIxuj6dAJ2QqkXLdcNRNzx/RVoCCGpBZc5Nb74RL
	AyrYr9OSXZxHVGNQ4XiXP3fao9lUKiNNoLCFSbt4S/J0x4363ehagdaGKvr35OUU0ByFWONQ2RMxn
	Fn2IAKFsaOKE87f1czzEw6+QG88a4rN4Kh5Tj9E/Y2tqsPvuNOPWSt7c4YklVz8Xva6MzETN3ixNp
	oAtN5cGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBs4l-000000026DJ-0Hnk;
	Fri, 15 Nov 2024 08:53:11 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBs3p-0000000262q-2KsQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 08:52:14 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e380fe87b09so1515454276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 00:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1731660732; x=1732265532; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6S2nGodUHkF7oQtN5BOS0le7eARr47Goh8++DpENQG0=;
        b=IO+uK4dhprDzlrWpcXHn5C4zwlM0gjCSBrcpG4NcsxH+B6g71oEAuUHmACdpHA8qrz
         X3rVNWcEsSc8A7vbiZCMVVhRDq1RZdiTRnRZnB2zEvNkWW3nqGOv7fOFXKsEY4M3Ib0B
         BU53RGe+76X63xCkAz4J5vzxFX2BMPf1VpgdEWfetHwvIAkiS2N6IvjVpdziCczSY35W
         fRB1rqb4WaUK/zFcaE+GyGggiDEyZU5ZZH9Rfw5hV/CUkt9HcNqpDjaZkobNMnmT35L/
         o+Yov/+jkSjVkZGMBxpIXy6xBKSBXYOM7WbVbC2QQFOaP47vL8UB/waCYdlYfogkf26B
         w9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731660732; x=1732265532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6S2nGodUHkF7oQtN5BOS0le7eARr47Goh8++DpENQG0=;
        b=RwI0ykhbTPSFmgp86Twb0ZodQV+Pudp0T+OSVT+q2mNCEWS/xZNV6ZbwSCORQT3JjV
         imjkFYwag6HigecofvyOH9vJ9uaMrxMRlTjZtysDm6Bk6dnY/cbENnX+br6fUQ1SK+Vv
         UPmlkFRgjw+CwC79szQM8zpLV4fuB4sUnTPoESJcX1wrN8MeW1o0ThC/VOyg91xWHspF
         vzpaqx1nuZwrS3TwQ1a9L3w2BlOvWkZtxwmJm3cZ7KtL34/MhRzBeAaWpoekRlvB2nVy
         KX+mXUhjripuubS+1L6fR3MoBpgkRi7iREFMPy4nquLIW2RBQNUF82Z1JnVwf8pddPCz
         OG0A==
X-Forwarded-Encrypted: i=1; AJvYcCXOzNWd73lEXArnA0HrD0Mp62mkljozTYCnj9m6vdReXx/aKi4IkkQt5f3hnSdVjZVUrQTOAugV6uSnbS4y+TY3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx0kt3uscBmuPhsdmaXXP29Qr5uiCF6u+OxqtUjuQi3gbwC5Tp
	rAv4MLOdZya6pDdBsYQkTZBfdVTYSFl8W3yxdlWCur0yrQA1oCEnPvcCQlx54T2zrFkB/rXtD5k
	OyoUBeVzXIlNiV1FK1JBoZIGz+hnp5Jfg6uCdSA==
X-Google-Smtp-Source: AGHT+IHV94ciQ8ydggMMk7IA4ri1B28vEf2MSAaktiuDxaGnxBdFoxYrqrbgaH4WT2Q9fn8dihjYsjg1qMjvep1DlaY=
X-Received: by 2002:a05:6902:b09:b0:e30:cea9:ba28 with SMTP id
 3f1490d57ef6-e3826165b1bmr1162795276.30.1731660732215; Fri, 15 Nov 2024
 00:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-3-c538a2e24786@raspberrypi.com> <20241115000637.GK26171@pendragon.ideasonboard.com>
In-Reply-To: <20241115000637.GK26171@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 15 Nov 2024 08:51:55 +0000
Message-ID: <CAPY8ntBJu+mA3BcYkkVpr1L0jf2hp6e3kbpyGkB7mwbiDQDGzQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: imx290: Add configuration for IMX462
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_005213_682550_FC112ABA 
X-CRM114-Status: GOOD (  29.09  )
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

Hi Laurent

On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Thank you for the patch.
>
> On Thu, Nov 14, 2024 at 04:01:15PM +0000, Dave Stevenson wrote:
> > IMX462 is the successor to IMX290, and wants very minor
> > changes to the register setup.
> >
> > Add the relevant configuration to support it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx290.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index da654deb444a..f1780cc5d7cc 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -170,6 +170,8 @@ enum imx290_model {
> >       IMX290_MODEL_IMX290LQR,
> >       IMX290_MODEL_IMX290LLR,
> >       IMX290_MODEL_IMX327LQR,
> > +     IMX290_MODEL_IMX462LQR,
> > +     IMX290_MODEL_IMX462LLR,
> >  };
> >
> >  struct imx290_model_info {
> > @@ -316,6 +318,50 @@ static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
> >       { CCI_REG8(0x33b3), 0x04 },
> >  };
> >
> > +static const struct cci_reg_sequence imx290_global_init_settings_462[] = {
> > +     { CCI_REG8(0x300f), 0x00 },
> > +     { CCI_REG8(0x3010), 0x21 },
> > +     { CCI_REG8(0x3011), 0x02 },
>
> As far as I can tell, the only difference in the init sequence between
> imx290_global_init_settings_290 and imx290_global_init_settings_462 is
> 0x3011 register which is not present in imx290_global_init_settings_290.
> It is however included in imx290_global_init_settings, and set to 0x02.
> Could we therefore use imx290_global_init_settings_290 for the imx462 ?

I'd done a comparison of the datasheets, and register 0x3011 was the
only one that changed. I'd missed that it was in
imx290_global_init_settings.

My datasheets:
IMX327LQR-C rev E17Z06B93 2019/03/25. 3011h "Set to 02h" (value
changed in doc rev 0.3 from 0Ah)
IMX290LQR-C rev E15510G82 2018/02/09. 3011h "Fixed to 00h" (always
been that value).
IMX462LQR-C rev E19Y13C13 2021/03/19. 3011h "Set to 02h" (value
changed in doc rev 0.2 from 00h)
The default value stated in all of them is 00h. In true Sony fashion,
there's no description for that register functionality.

So actually it looks like it was the addition of IMX327 in [1] should
have changed that setting, unless someone else has a more recent
datasheet for IMX290 that updates that.
cc Alexander as the author of that patch. I'll find any discussion on it later.

  Dave

[1] https://github.com/torvalds/linux/commit/2d41947ec2c0140c65783982692c2e3d89853c47

> > +     { CCI_REG8(0x3016), 0x09 },
> > +     { CCI_REG8(0x3070), 0x02 },
> > +     { CCI_REG8(0x3071), 0x11 },
> > +     { CCI_REG8(0x309b), 0x10 },
> > +     { CCI_REG8(0x309c), 0x22 },
> > +     { CCI_REG8(0x30a2), 0x02 },
> > +     { CCI_REG8(0x30a6), 0x20 },
> > +     { CCI_REG8(0x30a8), 0x20 },
> > +     { CCI_REG8(0x30aa), 0x20 },
> > +     { CCI_REG8(0x30ac), 0x20 },
> > +     { CCI_REG8(0x30b0), 0x43 },
> > +     { CCI_REG8(0x3119), 0x9e },
> > +     { CCI_REG8(0x311c), 0x1e },
> > +     { CCI_REG8(0x311e), 0x08 },
> > +     { CCI_REG8(0x3128), 0x05 },
> > +     { CCI_REG8(0x313d), 0x83 },
> > +     { CCI_REG8(0x3150), 0x03 },
> > +     { CCI_REG8(0x317e), 0x00 },
> > +     { CCI_REG8(0x32b8), 0x50 },
> > +     { CCI_REG8(0x32b9), 0x10 },
> > +     { CCI_REG8(0x32ba), 0x00 },
> > +     { CCI_REG8(0x32bb), 0x04 },
> > +     { CCI_REG8(0x32c8), 0x50 },
> > +     { CCI_REG8(0x32c9), 0x10 },
> > +     { CCI_REG8(0x32ca), 0x00 },
> > +     { CCI_REG8(0x32cb), 0x04 },
> > +     { CCI_REG8(0x332c), 0xd3 },
> > +     { CCI_REG8(0x332d), 0x10 },
> > +     { CCI_REG8(0x332e), 0x0d },
> > +     { CCI_REG8(0x3358), 0x06 },
> > +     { CCI_REG8(0x3359), 0xe1 },
> > +     { CCI_REG8(0x335a), 0x11 },
> > +     { CCI_REG8(0x3360), 0x1e },
> > +     { CCI_REG8(0x3361), 0x61 },
> > +     { CCI_REG8(0x3362), 0x10 },
> > +     { CCI_REG8(0x33b0), 0x50 },
> > +     { CCI_REG8(0x33b2), 0x1a },
> > +     { CCI_REG8(0x33b3), 0x04 },
> > +};
> > +
> >  #define IMX290_NUM_CLK_REGS  2
> >  static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
> >       [IMX290_CLK_37_125] = {
> > @@ -1455,6 +1501,20 @@ static const struct imx290_model_info imx290_models[] = {
> >               .max_analog_gain = 98,
> >               .name = "imx327",
> >       },
> > +     [IMX290_MODEL_IMX462LQR] = {
> > +             .colour_variant = IMX290_VARIANT_COLOUR,
> > +             .init_regs = imx290_global_init_settings_462,
> > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > +             .max_analog_gain = 98,
> > +             .name = "imx462",
> > +     },
> > +     [IMX290_MODEL_IMX462LLR] = {
> > +             .colour_variant = IMX290_VARIANT_MONO,
> > +             .init_regs = imx290_global_init_settings_462,
> > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > +             .max_analog_gain = 98,
> > +             .name = "imx462",
> > +     },
> >  };
> >
> >  static int imx290_parse_dt(struct imx290 *imx290)
> > @@ -1653,6 +1713,12 @@ static const struct of_device_id imx290_of_match[] = {
> >       }, {
> >               .compatible = "sony,imx327lqr",
> >               .data = &imx290_models[IMX290_MODEL_IMX327LQR],
> > +     }, {
> > +             .compatible = "sony,imx462lqr",
> > +             .data = &imx290_models[IMX290_MODEL_IMX462LQR],
> > +     }, {
> > +             .compatible = "sony,imx462llr",
> > +             .data = &imx290_models[IMX290_MODEL_IMX462LLR],
> >       },
> >       { /* sentinel */ },
> >  };
>
> --
> Regards,
>
> Laurent Pinchart

