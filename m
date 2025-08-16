Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A044CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 19:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhNfRQTJCTHs8wZzyX52sBmas0EwpebMHyW2WLiU29g=; b=gmfU8RxGnmDj7n9UTjyp24sOPj
	3K/gbn6/BtKxu+am15WIc8ekEMQsV9dFGqPDBDHALfHPdl2QfNlTFpUhhk65lrWBUVKl5nINMzd2N
	Cy60TCRKhTXeVmbU7RzOm/KnrcXWAFz3RbiiT5Yu7qxZDPraO9Pmlx8bN6jcScoW7340onoSwx8rx
	0mO2nLbAnBRBOXUs7HESnqrhlKvP9s4r97oY5IpYZTk0LWLdAliMjyIp96JB7We02Gbp1NizhAzD6
	kbsqTRre+A/aBX5RL3TTO04MB6vmtxH9xj5kGAtpQFsrvAFGaaD5oHUbKvln4uLht61MhhEcNt+QS
	tqmIQquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unMrn-0000000570P-3hRX;
	Sat, 16 Aug 2025 19:47:03 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unMpC-000000056uS-2SrZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 19:44:23 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7ae31caso520642666b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 12:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755373459; x=1755978259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhNfRQTJCTHs8wZzyX52sBmas0EwpebMHyW2WLiU29g=;
        b=gJbC1Xd4vu/XOTMUcxEfjRNCNk/DepX21tQPWfsVGyq24JPF226aaQ/m4ZBs3r/PKQ
         JlWZ8bIXIkUzPdJIRaA5oNvG3Xjjg8a3BwgeduOsqedN4r3kSJRQl0XUHnhqdUdqnD3q
         dfHPXk3npt3UEWrVS5kHiwF5k9FAcz9nL+xfI7JyGUsDR5xOaRItddrRX06ophb3aFi6
         JRBtU5cEvYtqrZ8/LDC/oSECB4rIQUUPwWIGzQotsL+S4Ba4/bxxL+sowknpKwqvmbD7
         Otrwz0j3Q8XIAOw0/FI9il4RmTZYt/dTMokRqIK0qXUU9dLuMYC2gs9Ssq6ykVdFnewr
         0q7A==
X-Forwarded-Encrypted: i=1; AJvYcCW8U8y2uEpZknGG9WeV/I9H+UK3OtzvTwZ/7RK49nvX8tRs60TaOw2ZSHOsiNecYb+b7R5+Xzytt+TtlCAW68u6@lists.infradead.org
X-Gm-Message-State: AOJu0YymvHJU562N76ZLSwiiqFT3ZzqdHp/IYpYzAL8AwX5rj+OoZqFh
	NxQ7/eii+lLwvlAE8SBlRg+cyWqCpfwDSclcIXQk9JRxYyVxjJFI3e9X29ysfq752/g=
X-Gm-Gg: ASbGncsxjiYpG74eWxULphJh3knUPOdNoqDA8AQPa3oTUJzO2bjuGUdc+ybjO31O47G
	ThXipFT9X0a9EimCh8tv5o7QqyY0x/ERMa0+mQ+azTVwqgRghAgt8qp1fG8QUMD2Xh8ErvB/ogL
	b40zKwzKcAqEP/lligOFP3iIeWo+tK4+Azj+zRI/xntdnQa7slOeK9rxHS/MBxSUe3tt0kljGYP
	JLlZrXYbEuSLSau0dQqETEKncUEvCPsRIBs70DnuCcXOL3qemJS+urUpvIUkKPEN2Nc05WTCUkN
	B9F5o+C3pSJa+Z+xbqv3E2uTAXwraSeImnXqEH3jd7Mj/Bz3sFKq+MZR92gHxObbrDj4R74GQAZ
	XAEfm1q73GpXnaqGRqfOHo7Fxcqyb3g2J5WnaRGEfont20LSq5i6r3ckwoCLplcROKkpj
X-Google-Smtp-Source: AGHT+IGU6I/0pMOvLH3GSLLnrGg5yGvcXo8gqWfexydB3JsR7uYoJ0PU+MmBvCFz7yKllnuVieAuIw==
X-Received: by 2002:a17:907:7f8d:b0:ae0:68a8:bd6a with SMTP id a640c23a62f3a-afceacd0863mr323322166b.15.1755373458739;
        Sat, 16 Aug 2025 12:44:18 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce73e2esm457292966b.39.2025.08.16.12.44.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 12:44:18 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad681so4108526a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 12:44:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZ1OKpDGwMoYMqO5PRHo9WcIBJ0c97J88aeVUS+AbqW7CuAjQnOiiDv2LZvW9LV6o2t9HYMrjes53LBDG7k2B4@lists.infradead.org
X-Received: by 2002:a05:6402:3495:b0:615:5bec:1df with SMTP id
 4fb4d7f45d1cf-619bf1f7206mr3258270a12.25.1755373458280; Sat, 16 Aug 2025
 12:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-4-will@willwhang.com>
 <20250811-cinnamon-tapir-of-music-0bda96@kuoka>
In-Reply-To: <20250811-cinnamon-tapir-of-music-0bda96@kuoka>
From: Will Whang <will@willwhang.com>
Date: Sat, 16 Aug 2025 12:44:05 -0700
X-Gmail-Original-Message-ID: <CAFoNnryfrJvoEHNgQDpSZBbGiGjPr-bwnhhg4cgpNK_hW=0EbQ@mail.gmail.com>
X-Gm-Features: Ac12FXy-vY_C5easw1Tym_fd5E3dOtxKIqhJ9wZAZ5bar5LAous57hWKnWEIrdU
Message-ID: <CAFoNnryfrJvoEHNgQDpSZBbGiGjPr-bwnhhg4cgpNK_hW=0EbQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: i2c: imx585: Add Sony IMX585 image-sensor driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_124422_629668_0D90761A 
X-CRM114-Status: GOOD (  18.64  )
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

On Mon, Aug 11, 2025 at 1:06=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Aug 10, 2025 at 11:09:20PM +0100, Will Whang wrote:
> > +
> > +/* -------------------------------------------------------------------=
-------
> > + * Power / runtime PM
> > + * -------------------------------------------------------------------=
-------
> > + */
> > +
> > +static int imx585_power_on(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +     int ret;
> > +
> > +     dev_dbg(imx585->clientdev, "power_on\n");
> > +
> > +     ret =3D regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->suppli=
es);
> > +     if (ret) {
> > +             dev_err(imx585->clientdev, "Failed to enable regulators\n=
");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D clk_prepare_enable(imx585->xclk);
> > +     if (ret) {
> > +             dev_err(imx585->clientdev, "Failed to enable clock\n");
> > +             goto reg_off;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(imx585->reset_gpio, 1);
>
> You asserted reset gpio causing it to enter reset and you call this
> "power on"?
>
> > +     usleep_range(IMX585_XCLR_MIN_DELAY_US,
> > +                  IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_RANGE_U=
S);
> > +     return 0;
> > +
> > +reg_off:
> > +     regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplies);
> > +     return ret;
> > +}
> > +
> > +static int imx585_power_off(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +
> > +     dev_dbg(imx585->clientdev, "power_off\n");
> > +
> > +     gpiod_set_value_cansleep(imx585->reset_gpio, 0);
>
> And here device comes up, but you call it power off? Your functions or
> reset gpio code are completely reversed/wrong.

Reset pin High -> Run normally
Reset pin Low -> Reset state

See drivers/media/i2c/imx219.c with the same logic:

static int imx219_power_on(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx219 *imx219 =3D to_imx219(sd);
int ret;

ret =3D regulator_bulk_enable(IMX219_NUM_SUPPLIES,
   imx219->supplies);
if (ret) {
dev_err(dev, "%s: failed to enable regulators\n",
__func__);
return ret;
}

ret =3D clk_prepare_enable(imx219->xclk);
if (ret) {
dev_err(dev, "%s: failed to enable clock\n",
__func__);
goto reg_off;
}

gpiod_set_value_cansleep(imx219->reset_gpio, 1);
usleep_range(IMX219_XCLR_MIN_DELAY_US,
    IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);

return 0;

reg_off:
regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);

return ret;
}

static int imx219_power_off(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx219 *imx219 =3D to_imx219(sd);

gpiod_set_value_cansleep(imx219->reset_gpio, 0);
regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
clk_disable_unprepare(imx219->xclk);

return 0;
}

I really don't understand why this is a problem, it is up to the chip
designer to decide
what to do with reset behavior and not the reviewers.

I'm simply writing the code following the datasheets here.


> Best regards,
> Krzysztof
>

