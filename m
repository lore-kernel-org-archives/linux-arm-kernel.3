Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20C6CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSJLssmZdEOX/zGucC3pwqt9Dq/W1NDmqgn/3V659l0=; b=rbV27u18B0T/XFYJRPO7woZ4t0
	W0tozYF0cRyA/B/anQ2e9fIbteEuz6cRx8eARi8rTDmK/Kbkr/AV2dJbLuBTGyYQEw6Qu3Xqm6FW0
	T5acTYua3r09W25fVcWSsveKKDkJVKG/elU4rALKvbvjnaXfp+3KjqRl/72bZ0tPwcMTrVvEcF4Ow
	LT/2KijtOEnX9PzHAVIPGx28Y78u+URKqgpV+QWOts4h0sGVx0NfjDV1M17NJKwL9nljAEEYiIxNT
	lgaLVUxKW78AYh1B18xz/DOftvbQQdliXYxNvLPJyZUuDhHonYI73NC2TM629MJHhZ0rDjWHWTfII
	CN80aGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbab6-00000004ie5-3zSb;
	Mon, 22 Jun 2026 09:05:40 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbab4-00000004idO-06wS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 09:05:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 64BAA200669;
	Mon, 22 Jun 2026 11:05:34 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wbab0-0043kt-13;
	Mon, 22 Jun 2026 11:05:34 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wbab0-000000008iF-0wHT;
	Mon, 22 Jun 2026 11:05:34 +0200
Message-ID: <7ee62b699c5cabb00cd7706ea42573da81c5bc84.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/2] media: i2c: ov5640: Add reset controller support
 with GPIO fallback
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.li@oss.nxp.com>, robby.cai@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Frank.Li@nxp.com, 	s.hauer@pengutronix.de, festevam@gmail.com,
 sebastian.krzyszkowiak@puri.sm, 	slongerbeam@gmail.com,
 sakari.ailus@linux.intel.com, mchehab@kernel.org, 
	kieran.bingham@ideasonboard.com, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Jun 2026 11:05:34 +0200
In-Reply-To: <ajVPzoWVBi1vsqRQ@SMW015318>
References: <20260619100532.3779934-1-robby.cai@oss.nxp.com>
	 <20260619100532.3779934-3-robby.cai@oss.nxp.com>
	 <ajVPzoWVBi1vsqRQ@SMW015318>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_020538_216330_289AF4CB 
X-CRM114-Status: GOOD (  27.72  )
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

On Fr, 2026-06-19 at 09:18 -0500, Frank Li wrote:
> On Fri, Jun 19, 2026 at 06:05:32PM +0800, robby.cai@oss.nxp.com wrote:
> > [You don't often get email from robby.cai@oss.nxp.com. Learn why this i=
s important at https://aka.ms/LearnAboutSenderIdentification ]
> >=20
> > From: Robby Cai <robby.cai@nxp.com>
> >=20
> > Add support for the reset controller framework by acquiring the reset
> > line using devm_reset_control_get_optional_shared_deasserted(). This
> > allows the driver to handle reset lines provided by a reset controller,
> > including shared ones, while avoiding unbalanced deassert counts.
> >=20
> > Retain support for legacy reset-gpios as a fallback when no reset
> > controller is defined. In that case, request the GPIO and keep it in th=
e
> > deasserted state as the initial configuration.
> >=20
> > This enables the driver to support both reset-controller-backed reset
> > lines and older GPIO-based descriptions while preserving the existing
> > power-up sequencing behavior.
> >=20
> > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 80 +++++++++++++++++++++++++++++++++-----
> >  1 file changed, 70 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 85ecc23b3587..5e6db8aacb11 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/reset.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> >  #include <media/v4l2-async.h>
> > @@ -442,6 +443,7 @@ struct ov5640_dev {
> >         u32 xclk_freq;
> >=20
> >         struct regulator_bulk_data supplies[OV5640_NUM_SUPPLIES];
> > +       struct reset_control *reset;
> >         struct gpio_desc *reset_gpio;
> >         struct gpio_desc *pwdn_gpio;
> >         bool   upside_down;
> > @@ -2431,6 +2433,48 @@ static int ov5640_restore_mode(struct ov5640_dev=
 *sensor)
> >         return ov5640_set_framefmt(sensor, &sensor->fmt);
> >  }
> >=20
> > +static int ov5640_get_reset(struct device *dev, struct ov5640_dev *sen=
sor)
> > +{
> > +       /* use deasserted version to avoid unbalanced deassert counts *=
/
> > +       sensor->reset =3D
> > +           devm_reset_control_get_optional_shared_deasserted(dev, NULL=
);
> > +       if (IS_ERR(sensor->reset))
> > +               return dev_err_probe(dev, PTR_ERR(sensor->reset),
> > +                                    "Failed to get reset\n");
> > +       else if (sensor->reset)
> > +               return 0;
> > +
> > +       /*
> > +        * fallback to legacy reset-gpios
> > +        * GPIOD_OUT_HIGH ensures deasserted state for ACTIVE_LOW reset
> > +        */
> > +       sensor->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> > +                                                    GPIOD_OUT_HIGH);
> > +       if (IS_ERR(sensor->reset_gpio))
> > +               return dev_err_probe(dev, PTR_ERR(sensor->reset_gpio),
> > +                                    "Failed to get reset gpio");
>=20
> I think needn't fallback here, NO ABI change, just change to use reset-gp=
io
> driver.

Please keep the gpiod fallback, the reset-gpio driver may not be
available on all platforms using ov5640.

> > +
> > +       return 0;
> > +}
> > +
> > +static int ov5640_reset_assert(struct ov5640_dev *sensor)
> > +{
> > +       if (sensor->reset)
> > +               return reset_control_assert(sensor->reset);
>=20
> needn't check sensor->reset, reset_control_assert() is no ops if NULL.
>=20
> > +
> > +       gpiod_set_value_cansleep(sensor->reset_gpio, 1);
>=20
> Needn't fallback, directly replace.

See above.


regards
Philipp

