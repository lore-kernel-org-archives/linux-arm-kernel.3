Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A68DD711D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 17:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0F3J5tg+AZotRnRXcznOlKsQVCYryEIHrUkJAiTc9k8=; b=rDlwCwy3N8/8JCnkHW17hYQeWl
	+BRVjDmg64u+PCHXtXHk7FGtDU54gywwfsBCg4xWRnyubTzc0kqIsBUjuDxYOiA/eJRoFQDZXgnSF
	UrAaeVEZSAPZ6MK2PCIjbDKNymaNBayX/vW2dzqbAlucFgdim6kii2KnYXRm5FcpEkMGnODVosnsh
	Pa+fiOmyOiTdilrpD6BhNvoJ1xaUzvVbzsY15bX0xIzZZrbhNfewORWj9pyM9mkY7xWuHmSVQJj+F
	yda3MdhIWUTbC+06PwaaJyaPTXeSLtep7Vfx1BxnHCDTUm1/9eTwzSqQ7FJgg0eUNtOYZchAqQAEy
	u1tvKe3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDor0-0000000Fxrf-2DD4;
	Wed, 20 Nov 2024 17:51:02 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoq4-0000000Fxmt-0oB7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 17:50:05 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e383bbcef9dso2380519276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 09:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732125002; x=1732729802; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0F3J5tg+AZotRnRXcznOlKsQVCYryEIHrUkJAiTc9k8=;
        b=S9tFGKXK4jh+PGUr1nu4DClnnqNqmnJiLB60gwGpVf/kYOQk1eHN48OETvh9rkn+aB
         PcPKGC4q5RcXlL7BQCMN3RwFBBaDan7mXm8biF4pE+W4419g4Dm6Lc4nL2AmuLF0G13c
         Qs8FO551Si+6QZI/yBMZaiFYLVifM2WSJ+yr+ZgLrHoIComLx+5r5anPiBOL6b520f0T
         dz3qzuyTeAgOInnOAEHs2FKS1S0OwChV8+cCB9WaHkPMO5YP5PCniPD3/ig/pX5SQ/y1
         PseD0zwefMHhHZLYEd9UBOjbhjz0MKGyosUojuiKJuxk9/7WSmF2dzfHcNeycL+m3xFO
         xonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732125002; x=1732729802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0F3J5tg+AZotRnRXcznOlKsQVCYryEIHrUkJAiTc9k8=;
        b=vpdPKrnmMMZ5SbryjxwDF2GMJNx40mxUuCcrL0VLIY5GWjkU45MLncDx637cT8RxK/
         WBjub+lX6ZSaWloO4V9ySw3bnfsHHysHi8HIe78r4bRKPLgGTNXR4mBvZEuo6Hh31qBC
         pVbeZuylZB0ewDimNWVBvvumqNeixWDDcxiE0UvfWMXcouFymtOGY2t6tYPYSfB670sU
         3mETNg6E7ohShkHdqOz0vL5SO3kW+QzP7dyoCBGLg7qyg13AGILSpdkhJrdz1RhuctJH
         GrUZhu+5AsxC2ULO57PXcRGg3H/mM9xsNrevuXhgYrRKO2qyXmZiZYhzzCCTt+U+k/Q8
         E/lg==
X-Forwarded-Encrypted: i=1; AJvYcCVcOn9D5PIeQfI6VtNrR6CWiBSrigWIiMygDNxyQvP8MOFmtr3OKzrUJ2F0ewzyByNTxklPN9xwTRriOrCW6FVv@lists.infradead.org
X-Gm-Message-State: AOJu0YyfduTb1plc6Rh/DxIGyBupRuBY8w1PqNCxSgr1UcHK+J85eR9i
	vvcWn+C2971WkK3OhCU2cDwYf4KHHbHEJwoOLm1ukwRDgkvW1VZpf/qA2T83EeJ9oCJ+QCkwvky
	Au5UDSLVJZ7Kkv0ci8pAYeVq1Nf2i7emgbkmtWQ==
X-Gm-Gg: ASbGncv1E2K+WZXvJ8DlAAMcVIrnhfI6LL2+W0ppq6Q0DvdsLesENYaPc2L/gW6OoEo
	TVDejDE7OlXhakXjmnzBHB8vdg+zjtzg=
X-Google-Smtp-Source: AGHT+IGTsPe7+ZryXlme3kuG7tpC8pknkVkEwCPoK1Yb6RQtlnPSwnr6+Yz56M5D78wh2ynwe4hLWUH1/SKXZjgFBYw=
X-Received: by 2002:a05:6902:2806:b0:e30:c944:eb11 with SMTP id
 3f1490d57ef6-e38cb566994mr3277486276.14.1732125002629; Wed, 20 Nov 2024
 09:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-3-c538a2e24786@raspberrypi.com>
 <20241115000637.GK26171@pendragon.ideasonboard.com> <CAPY8ntBJu+mA3BcYkkVpr1L0jf2hp6e3kbpyGkB7mwbiDQDGzQ@mail.gmail.com>
 <20241118020745.GI31681@pendragon.ideasonboard.com>
In-Reply-To: <20241118020745.GI31681@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 20 Nov 2024 17:49:42 +0000
Message-ID: <CAPY8ntCcwv=jvi4gHJqH=rWRy4uAHfCiq0zsPM5C53B4VPvWjg@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: imx290: Add configuration for IMX462
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_095004_405012_2DAED737 
X-CRM114-Status: GOOD (  40.35  )
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

On Mon, 18 Nov 2024 at 02:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Fri, Nov 15, 2024 at 08:51:55AM +0000, Dave Stevenson wrote:
> > On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart wrote:
> > > On Thu, Nov 14, 2024 at 04:01:15PM +0000, Dave Stevenson wrote:
> > > > IMX462 is the successor to IMX290, and wants very minor
> > > > changes to the register setup.
> > > >
> > > > Add the relevant configuration to support it.
> > > >
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > ---
> > > >  drivers/media/i2c/imx290.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 66 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index da654deb444a..f1780cc5d7cc 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -170,6 +170,8 @@ enum imx290_model {
> > > >       IMX290_MODEL_IMX290LQR,
> > > >       IMX290_MODEL_IMX290LLR,
> > > >       IMX290_MODEL_IMX327LQR,
> > > > +     IMX290_MODEL_IMX462LQR,
> > > > +     IMX290_MODEL_IMX462LLR,
> > > >  };
> > > >
> > > >  struct imx290_model_info {
> > > > @@ -316,6 +318,50 @@ static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
> > > >       { CCI_REG8(0x33b3), 0x04 },
> > > >  };
> > > >
> > > > +static const struct cci_reg_sequence imx290_global_init_settings_462[] = {
> > > > +     { CCI_REG8(0x300f), 0x00 },
> > > > +     { CCI_REG8(0x3010), 0x21 },
> > > > +     { CCI_REG8(0x3011), 0x02 },
> > >
> > > As far as I can tell, the only difference in the init sequence between
> > > imx290_global_init_settings_290 and imx290_global_init_settings_462 is
> > > 0x3011 register which is not present in imx290_global_init_settings_290.
> > > It is however included in imx290_global_init_settings, and set to 0x02.
> > > Could we therefore use imx290_global_init_settings_290 for the imx462 ?
> >
> > I'd done a comparison of the datasheets, and register 0x3011 was the
> > only one that changed. I'd missed that it was in
> > imx290_global_init_settings.
> >
> > My datasheets:
> > IMX327LQR-C rev E17Z06B93 2019/03/25. 3011h "Set to 02h" (value
> > changed in doc rev 0.3 from 0Ah)
> > IMX290LQR-C rev E15510G82 2018/02/09. 3011h "Fixed to 00h" (always
> > been that value).
> > IMX462LQR-C rev E19Y13C13 2021/03/19. 3011h "Set to 02h" (value
> > changed in doc rev 0.2 from 00h)
> > The default value stated in all of them is 00h. In true Sony fashion,
> > there's no description for that register functionality.
> >
> > So actually it looks like it was the addition of IMX327 in [1] should
> > have changed that setting, unless someone else has a more recent
> > datasheet for IMX290 that updates that.
>
> I agree with this analysis. It may be that setting the register to 0x02
> would be fine, but it's hard to tell. Maybe it could be worth asking
> Sony ?
>
> > cc Alexander as the author of that patch. I'll find any discussion on it later.

I've looked back to find the earlier discussion.

v3 at [1] was the version that was merged. This added register 0x3011
when previously it hadn't been set.

I had picked up at v2[2] that register 0x3011 should have been in
imx290_global_init_settings_327 rather than
imx290_global_init_settings, but that appeared not to have happened.

In my book that makes it a regression for imx290 due to that patch,
and we should correct it back to 0x00.
I could check with Sony over that, but it seems overkill seeing as we
have deviated from the originally submitted driver in a way that
contradicts the datasheet.

I'll send a v2 patchset on that basis.

  Dave

[1] https://lore.kernel.org/linux-media/20230217095221.499463-3-alexander.stein@ew.tq-group.com/
[2] https://lore.kernel.org/linux-media/CAPY8ntB_25yge6MB87N642-bMG-hd9qCVkom4A-c-pBzk3a4mQ@mail.gmail.com/

> >   Dave
> >
> > [1] https://github.com/torvalds/linux/commit/2d41947ec2c0140c65783982692c2e3d89853c47
> >
> > > > +     { CCI_REG8(0x3016), 0x09 },
> > > > +     { CCI_REG8(0x3070), 0x02 },
> > > > +     { CCI_REG8(0x3071), 0x11 },
> > > > +     { CCI_REG8(0x309b), 0x10 },
> > > > +     { CCI_REG8(0x309c), 0x22 },
> > > > +     { CCI_REG8(0x30a2), 0x02 },
> > > > +     { CCI_REG8(0x30a6), 0x20 },
> > > > +     { CCI_REG8(0x30a8), 0x20 },
> > > > +     { CCI_REG8(0x30aa), 0x20 },
> > > > +     { CCI_REG8(0x30ac), 0x20 },
> > > > +     { CCI_REG8(0x30b0), 0x43 },
> > > > +     { CCI_REG8(0x3119), 0x9e },
> > > > +     { CCI_REG8(0x311c), 0x1e },
> > > > +     { CCI_REG8(0x311e), 0x08 },
> > > > +     { CCI_REG8(0x3128), 0x05 },
> > > > +     { CCI_REG8(0x313d), 0x83 },
> > > > +     { CCI_REG8(0x3150), 0x03 },
> > > > +     { CCI_REG8(0x317e), 0x00 },
> > > > +     { CCI_REG8(0x32b8), 0x50 },
> > > > +     { CCI_REG8(0x32b9), 0x10 },
> > > > +     { CCI_REG8(0x32ba), 0x00 },
> > > > +     { CCI_REG8(0x32bb), 0x04 },
> > > > +     { CCI_REG8(0x32c8), 0x50 },
> > > > +     { CCI_REG8(0x32c9), 0x10 },
> > > > +     { CCI_REG8(0x32ca), 0x00 },
> > > > +     { CCI_REG8(0x32cb), 0x04 },
> > > > +     { CCI_REG8(0x332c), 0xd3 },
> > > > +     { CCI_REG8(0x332d), 0x10 },
> > > > +     { CCI_REG8(0x332e), 0x0d },
> > > > +     { CCI_REG8(0x3358), 0x06 },
> > > > +     { CCI_REG8(0x3359), 0xe1 },
> > > > +     { CCI_REG8(0x335a), 0x11 },
> > > > +     { CCI_REG8(0x3360), 0x1e },
> > > > +     { CCI_REG8(0x3361), 0x61 },
> > > > +     { CCI_REG8(0x3362), 0x10 },
> > > > +     { CCI_REG8(0x33b0), 0x50 },
> > > > +     { CCI_REG8(0x33b2), 0x1a },
> > > > +     { CCI_REG8(0x33b3), 0x04 },
> > > > +};
> > > > +
> > > >  #define IMX290_NUM_CLK_REGS  2
> > > >  static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
> > > >       [IMX290_CLK_37_125] = {
> > > > @@ -1455,6 +1501,20 @@ static const struct imx290_model_info imx290_models[] = {
> > > >               .max_analog_gain = 98,
> > > >               .name = "imx327",
> > > >       },
> > > > +     [IMX290_MODEL_IMX462LQR] = {
> > > > +             .colour_variant = IMX290_VARIANT_COLOUR,
> > > > +             .init_regs = imx290_global_init_settings_462,
> > > > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > > > +             .max_analog_gain = 98,
> > > > +             .name = "imx462",
> > > > +     },
> > > > +     [IMX290_MODEL_IMX462LLR] = {
> > > > +             .colour_variant = IMX290_VARIANT_MONO,
> > > > +             .init_regs = imx290_global_init_settings_462,
> > > > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > > > +             .max_analog_gain = 98,
> > > > +             .name = "imx462",
> > > > +     },
> > > >  };
> > > >
> > > >  static int imx290_parse_dt(struct imx290 *imx290)
> > > > @@ -1653,6 +1713,12 @@ static const struct of_device_id imx290_of_match[] = {
> > > >       }, {
> > > >               .compatible = "sony,imx327lqr",
> > > >               .data = &imx290_models[IMX290_MODEL_IMX327LQR],
> > > > +     }, {
> > > > +             .compatible = "sony,imx462lqr",
> > > > +             .data = &imx290_models[IMX290_MODEL_IMX462LQR],
> > > > +     }, {
> > > > +             .compatible = "sony,imx462llr",
> > > > +             .data = &imx290_models[IMX290_MODEL_IMX462LLR],
> > > >       },
> > > >       { /* sentinel */ },
> > > >  };
>
> --
> Regards,
>
> Laurent Pinchart

