Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB35C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoxQrE9BQllINJgA23hOAwgoifAhEszw6BlmYIQoAW8=; b=C20mRZRQfBV0HxyrAw0KWkfCKU
	mrDvLIrbvwAuSnlU63pEJN9cSGLHCEzfLFQece+qWWDSXWetQMli+aBhq5oV+d0PufEZAUFTo7poW
	QQnqkgp5BjpAVqHWeRpyFGs4LIMCJmHnNqYQp52Wozh3UmjwLYYa1NShao8dMYEeIM0KnMbf16uxg
	QJcZdp5uCKHAyQJSa/ojn8YGEw/dqXHH7ejv7NNXkjStDry0A/Wo46QfuC7IkEDGB/mMbe2ChBdOz
	8FnFGAKrxVntyqWt86UxI4i//HWls1gRlHH0KScX835JUoQ71gC+rt+X75PiWFAwIROLr1CzwJdF/
	lApCpP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewN0-00000007Yzg-3Lsf;
	Thu, 24 Jul 2025 13:52:26 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesy0-00000007BAv-1Hv5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:14:25 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso2960105ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 03:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753352063; x=1753956863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoxQrE9BQllINJgA23hOAwgoifAhEszw6BlmYIQoAW8=;
        b=UrljdRXDVXusdJCt3AWq/0SG/w9ALgjAt4L9JYLHjBIZczfYlkoyIeAvELM0V5TJr8
         16jZT4NdOOE1K/q8ybS2MAvg07ROq/NkZEjVHI6jPjL3VAUr9b8pwCJpw3liZcOa1f3q
         sj5hpuZmQnidbvtZ7vwKyk85iqGiuqXiWMG2RZCruz5a6KqXvHkL0xGWijIGi7CLYc4d
         YjZnJjIw8QNiUwqP5A9NLHw4Nj1UsdNqo80G25CKmoImptoI5e+qDkQA1RMi3IUyzqNo
         XumcIRK4G+90KfVNFfdMJNSFjG9V2sGXxDeUtKIoNKbzB4OMdeYoxi4iBnFOpHtvg6so
         femw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753352063; x=1753956863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoxQrE9BQllINJgA23hOAwgoifAhEszw6BlmYIQoAW8=;
        b=XsiZ6CwDDPnomWpTWTCgdX0UK1soIcssDQVHwiK9mOlqTGNZ4eiNJ0v9kHOmpLmBze
         9kRHezW1D4w6zPoRI3apwnxKRQDBvAl26sBVHD4DpSaivqGPrIm9tAZcBe8FIoXTKGv9
         0HqSGnTt5hdSmB3tE8m9AjcRKDRVk4+tDLTlf/8edVCp+IJEu2rZkifmrUs4WzBVp1oG
         MN68Kk/8AWmVcGYYiHYmY2mC2NmsQuiSczbMQQu8U1J0xFjBRRMlcueKpw5qHmNHiCdG
         HL2RPr7VhmXKI6l/TILTGMvgkE5QtqfESP0nXH8HD2scU39A88/RCtIg18ZKUbWXweos
         Pn3g==
X-Forwarded-Encrypted: i=1; AJvYcCWNM4tVl5W/FrfxPFdePyzbTBShzSQJjn+Flj14ymQMrJAL6fzlIKPeApvUlTdGOpS6TTJyvHSZu+8KI1VALN86@lists.infradead.org
X-Gm-Message-State: AOJu0YyxXveJukJcsXZXyVuQ4vAdcCskCcCJ9BDV5a33O0djx5YQWyn4
	R3oKeY0lCzBOW8/W7uR5Osm1Rta08BaUh4c6p2KV9N62aKOl2eixYjhuunrSh8fmucTv+F2f3f8
	IkntBdY7JlQjYL/ZaA+91UoC2WCtSn/8=
X-Gm-Gg: ASbGncuGhNq2s1n0MxR4jd+HtAb5u7C6HKFRQ/y4a5T3VJtVg9cM+DaFky0Y0UHl81f
	wj6R2SMQMXBYIp9hNjw0XDrNAynBGyWgUJ5mHgUeBcjC9X3V4HBaTqfmodfBkRxu2xKLb36TC7y
	KyXP02JhZFPre3Sbal29LSabmqvI8ZHyrA9w+5lT5VI0/9CBzFaCqoBYj4xI47q4RUV41qjwFjw
	QW6euM=
X-Google-Smtp-Source: AGHT+IFuX+HkjjMmIqfOcPi1Vf9XVVv1BJDb7TK2k3LjKb0AvDjYDmsh1XyejNfF4igxDfky969ahsCQGQoG5Rin4/s=
X-Received: by 2002:a05:6e02:1945:b0:3e2:a40e:d29f with SMTP id
 e9e14a558f8ab-3e3418d71c5mr88504975ab.9.1753352063278; Thu, 24 Jul 2025
 03:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-3-shengjiu.wang@nxp.com> <87jz3ykpju.wl-tiwai@suse.de>
 <20250724-fair-sheep-of-success-e02586-mkl@pengutronix.de>
In-Reply-To: <20250724-fair-sheep-of-success-e02586-mkl@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 24 Jul 2025 18:14:10 +0800
X-Gm-Features: Ac12FXy8l34qKKJsPON1hex-xaVDf1J211wM6fAeHOddOjpvI8f17HQ8iYSYGc8
Message-ID: <CAA+D8AN2B_RZ9iZ3qE5zMBfs7BMAkruSRQupoXyrsr7Tt+Gfkg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958 subframe
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Takashi Iwai <tiwai@suse.de>, Shengjiu Wang <shengjiu.wang@nxp.com>, imx@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, 
	festevam@gmail.com, simona@ffwll.ch, robh@kernel.org, rfoss@kernel.org, 
	airlied@gmail.com, tiwai@suse.com, jernej.skrabec@gmail.com, 
	p.zabel@pengutronix.de, luca.ceresoli@bootlin.com, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se, victor.liu@nxp.com, 
	s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	linux-sound@vger.kernel.org, perex@perex.cz, 
	linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org, 
	lumag@kernel.org, dianders@chromium.org, kernel@pengutronix.de, 
	cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, shawnguo@kernel.org, 
	l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_031424_350183_0612B69D 
X-CRM114-Status: GOOD (  23.79  )
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

On Thu, Jul 24, 2025 at 3:40=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 24.07.2025 09:37:09, Takashi Iwai wrote:
> > On Thu, 24 Jul 2025 09:22:44 +0200,
> > Shengjiu Wang wrote:
> > >
> > > The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are us=
ed
> > > in HDMI and DisplayPort to describe the audio stream, but hardware de=
vice
> > > may need to reorder the IEC958 bits for internal transmission, so nee=
d
> > > these standard bits definitions for IEC958 subframe format.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  include/sound/asoundef.h | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> > > index 09b2c3dffb30..7efd61568636 100644
> > > --- a/include/sound/asoundef.h
> > > +++ b/include/sound/asoundef.h
> > > @@ -12,6 +12,15 @@
> > >   *        Digital audio interface                                   =
   *
> > >   *                                                                  =
        *
> > >   *******************************************************************=
*********/
> > > +/* IEC958 subframe format */
> > > +#define IEC958_SUBFRAME_PREAMBLE_MASK      (0xf)
> > > +#define IEC958_SUBFRAME_AUXILIARY_MASK     (0xf<<4)
> > > +#define IEC958_SUBFRAME_SAMPLE_24_MASK     (0xffffff<<4)
> > > +#define IEC958_SUBFRAME_SAMPLE_20_MASK     (0xfffff<<8)
> > > +#define IEC958_SUBFRAME_VALIDITY   (0x1<<28)
> > > +#define IEC958_SUBFRAME_USER_DATA  (0x1<<29)
> > > +#define IEC958_SUBFRAME_CHANNEL_STATUS     (0x1<<30)
> > > +#define IEC958_SUBFRAME_PARITY             (0x1<<31)
> >
> > I'd use "U" suffix as it can reach to the MSB.
> > Also, you can put spaces around the operators to align with the
> > standard format, too.  I guess you followed to the other code there,
> > but following to the standard coding style would be better.
> >
> > With those addressed, feel free to take my ack for this patch:
>
> Or make use of the BIT() and GEN_MASK() helpers.

Is it acceptable to include the headers in this file?

Best regards
Shengjiu Wang


>
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

