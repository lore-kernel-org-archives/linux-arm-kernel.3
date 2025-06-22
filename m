Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A29C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bm69vQQYMGAsC6CQotbCgpq2n6vTrtAkzVloqlGnBZs=; b=GbCT6ZtbpeZPVO/qXR3KQZJAFW
	AKxa/d22FQSODgg+CLwotfdiX4IVbbrFphAzlwY+KelrAzN5N7f/rfCTRnZH9FFtqUwBxP+yYSX6N
	mwLCVnxO7I7OkS6XR77jxdpuxXloDTFM14QR86D2l+wx2fra4lIQ9fvrnC7IbCc4HMtrGGmrnWiLV
	xLSb6wog0kwDXoXMQxvsd5LHw85b4l5AJI+h+FB4uWv4tWkgGgfFzBHQdCyehF8Hq/3n/JMaOadIK
	G7ttc8RBMrF/9dBv8HmIRlc+s+ivhUOYbwJ5iFvjAfiCLW0hPRWyOF0COkJXGJu7OxzE/N7OUar71
	+yQV7H6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTMlA-00000000y8f-2VuY;
	Sun, 22 Jun 2025 15:37:32 +0000
Received: from www637.your-server.de ([168.119.26.117])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTMis-00000000y2R-2PmK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 15:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bm69vQQYMGAsC6CQotbCgpq2n6vTrtAkzVloqlGnBZs=; b=ht5BuAWC19vvtWnN6JlAl2Z4PQ
	Ws2G3b8/mLYeTjwIW5h/9EWv/aKiwP9Jh11F19Gulqon8mxai+LPwn7Yqg5MLJ2QImeaw8ZYuD+Mh
	cfbMk+BSNqygDeBkAwTDRnTnS3ra/p0mRJOyd+jz0SokL6Btl+ViP0qVXvLQ85sTYd32gCNtqxZAr
	9ts4BtRsP13xSIKeAKr2MNkpeSRRZNem4kHenslnl7pON86tcs9INZV1nCNU/p2g+mnSLJqWPxCzm
	8DVa/gw3kfz58NNhkG/fdxH9eJNQ9v/YvWrf6PnitoGkHqkIJXqB9ymRDZA0mchIwfjX70KZUj5ey
	oLjiPBtw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uTMig-000B26-0u;
	Sun, 22 Jun 2025 17:34:58 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uTMif-0008mM-1p;
	Sun, 22 Jun 2025 17:34:57 +0200
Message-ID: <ed0b8fe3a20111477cafb1de7b399afb99caaa0c.camel@apitzsch.eu>
Subject: Re: [PATCH RESEND v4 3/5] media: i2c: imx214: Make use of CCS PLL
 calculator
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 22 Jun 2025 17:34:56 +0200
In-Reply-To: <20250621181751.GA9125@pendragon.ideasonboard.com>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
		 <20250621-imx214_ccs_pll-v4-3-12178e5eb989@apitzsch.eu>
		 <20250621181751.GA9125@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.7/27677/Sun Jun 22 10:32:59 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_083511_071945_137B3613 
X-CRM114-Status: GOOD (  32.83  )
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

Hi Laurent,

thanks for the review. Some comments below.


Am Samstag, dem 21.06.2025 um 21:17 +0300 schrieb Laurent Pinchart:
> Hi Andr=C3=A9,
>=20
> Thank you for the patch.
>=20
> On Sat, Jun 21, 2025 at 11:37:27AM +0200, Andr=C3=A9 Apitzsch via B4 Rela=
y
> wrote:
> > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> >=20
> > Calculate PLL parameters based on clock frequency and link
> > frequency.
> >=20
> > Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > ---
> > =C2=A0drivers/media/i2c/Kconfig=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/media/i2c/imx214.c | 213
> > ++++++++++++++++++++++++++++++++++++---------
> > =C2=A02 files changed, 175 insertions(+), 39 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index
> > e68202954a8fd4711d108cf295d5771246fbc406..08db8abeea218080b0bf5bfe6
> > cf82f1c0b100c4a 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > [..]
> > @@ -1224,42 +1336,52 @@ static int imx214_parse_fwnode(struct
> > device *dev)
> > =C2=A0 if (!endpoint)
> > =C2=A0 return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
> > =C2=A0
> > - ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > + bus_cfg->bus_type =3D V4L2_MBUS_CSI2_DPHY;
> > + ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
> > + fwnode_handle_put(endpoint);
>=20
> ... drop this. Up to you.
>=20
> > =C2=A0 if (ret) {
> > =C2=A0 dev_err_probe(dev, ret, "parsing endpoint node failed\n");
> > - goto done;
> > + goto error;
>=20
> You can return ret here.
>=20
> > =C2=A0 }
> > =C2=A0
> > =C2=A0 /* Check the number of MIPI CSI2 data lanes */
> > - if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D 4) {
> > + if (bus_cfg->bus.mipi_csi2.num_data_lanes !=3D 4) {
> > =C2=A0 ret =3D dev_err_probe(dev, -EINVAL,
> > =C2=A0 =C2=A0=C2=A0=C2=A0 "only 4 data lanes are currently supported\n"=
);
> > - goto done;
> > + goto error;
> > =C2=A0 }
> > =C2=A0
> > - if (bus_cfg.nr_of_link_frequencies !=3D 1)
> > + if (bus_cfg->nr_of_link_frequencies !=3D 1)
> > =C2=A0 dev_warn(dev, "Only one link-frequency supported, please review
> > your DT. Continuing anyway\n");
>=20
> Now that the driver can calculate PLL parameters dynamically, it
> would be nice to lift this restriction and make the link frequency
> control writable, in a separate patch on top of this series.
>=20
Maybe this could be postponed, as I don't have any use for it at the
moment and I don't want to further delay this series.

> > =C2=A0
> > - for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> > - if (bus_cfg.link_frequencies[i] =3D=3D IMX214_DEFAULT_LINK_FREQ)
> > + for (i =3D 0; i < bus_cfg->nr_of_link_frequencies; i++) {
> > + u64 freq =3D bus_cfg->link_frequencies[i];
> > + struct ccs_pll pll;
> > +
> > + if (!imx214_pll_calculate(imx214, &pll, freq))
> > =C2=A0 break;
> > - if (bus_cfg.link_frequencies[i] =3D=3D
> > - =C2=A0=C2=A0=C2=A0 IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > + if (freq =3D=3D IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > =C2=A0 dev_warn(dev,
> > =C2=A0 "link-frequencies %d not supported, please review your DT.
> > Continuing anyway\n",
> > =C2=A0 IMX214_DEFAULT_LINK_FREQ);
> > + freq =3D IMX214_DEFAULT_LINK_FREQ;
> > + if (imx214_pll_calculate(imx214, &pll, freq))
> > + continue;
> > + bus_cfg->link_frequencies[i] =3D freq;
> > =C2=A0 break;
> > =C2=A0 }
>=20
> How about separating the IMX214_DEFAULT_LINK_FREQ_LEGACY check from
> the PLL calculation ? Something like
>=20
>  u64 freq =3D bus_cfg->link_frequencies[i];
>  struct ccs_pll pll;
>=20
>  if (freq =3D=3D IMX214_DEFAULT_LINK_FREQ_LEGACY) {
>  dev_warn(dev,
>  "link-frequencies %d not supported, please review your DT.
> Continuing anyway\n",
>  IMX214_DEFAULT_LINK_FREQ);
>  freq =3D IMX214_DEFAULT_LINK_FREQ;
>  bus_cfg->link_frequencies[i] =3D freq;
>  }

With PLL calculation, 480000000 (=3DIMX214_DEFAULT_LINK_FREQ_LEGACY)
might be a valid link frequency explicitly set by the user. I'm not
sure whether it is a good idea to overwrite the link frequency, before
trying the PLL calculation. That's why I would keep the code the way it
is.

>=20
>  if (!imx214_pll_calculate(imx214, &pll, freq))
>  break;
>=20
> It will then become easier to drop this legacy support from the
> driver. What platform(s) are know to specify an incorrect link
> frequency ?

I don't know.

Best regards,
Andr=C3=A9

>=20
> > =C2=A0 }
> > =C2=A0
> > - if (i =3D=3D bus_cfg.nr_of_link_frequencies)
> > + if (i =3D=3D bus_cfg->nr_of_link_frequencies)
> > =C2=A0 ret =3D dev_err_probe(dev, -EINVAL,
> > - =C2=A0=C2=A0=C2=A0 "link-frequencies %d not supported, please review =
your DT\n",
> > - =C2=A0=C2=A0=C2=A0 IMX214_DEFAULT_LINK_FREQ);
> > + =C2=A0=C2=A0=C2=A0 "link-frequencies %lld not supported, please revie=
w your
> > DT\n",
> > + =C2=A0=C2=A0=C2=A0 bus_cfg->nr_of_link_frequencies ?
> > + =C2=A0=C2=A0=C2=A0 bus_cfg->link_frequencies[0] : 0);
> > =C2=A0
> > -done:
> > - v4l2_fwnode_endpoint_free(&bus_cfg);
> > - fwnode_handle_put(endpoint);
> > + return 0;
> > +
> > +error:
> > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > =C2=A0 return ret;
> > =C2=A0}
> > =C2=A0
> > @@ -1299,7 +1421,7 @@ static int imx214_probe(struct i2c_client
> > *client)
> > =C2=A0 return dev_err_probe(dev, PTR_ERR(imx214->regmap),
> > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 "failed to initialize CCI\n");
> > =C2=A0
> > - ret =3D imx214_parse_fwnode(dev);
> > + ret =3D imx214_parse_fwnode(dev, imx214);
> > =C2=A0 if (ret)
> > =C2=A0 return ret;
> > =C2=A0
> > @@ -1310,7 +1432,9 @@ static int imx214_probe(struct i2c_client
> > *client)
> > =C2=A0 * Enable power initially, to avoid warnings
> > =C2=A0 * from clk_disable on power_off
> > =C2=A0 */
> > - imx214_power_on(imx214->dev);
> > + ret =3D imx214_power_on(imx214->dev);
> > + if (ret < 0)
> > + goto error_fwnode;
>=20
> This change seems to belong to a separate patch.
>=20
> > =C2=A0
> > =C2=A0 ret =3D imx214_identify_module(imx214);
> > =C2=A0 if (ret)
> > @@ -1341,6 +1465,12 @@ static int imx214_probe(struct i2c_client
> > *client)
> > =C2=A0 pm_runtime_set_active(imx214->dev);
> > =C2=A0 pm_runtime_enable(imx214->dev);
> > =C2=A0
> > + ret =3D imx214_pll_update(imx214);
> > + if (ret < 0) {
> > + dev_err_probe(dev, ret, "failed to update PLL\n");
> > + goto error_subdev_cleanup;
> > + }
>=20
> I would move this to imx214_ctrls_init().
>=20
> > +
> > =C2=A0 ret =3D v4l2_async_register_subdev_sensor(&imx214->sd);
> > =C2=A0 if (ret < 0) {
> > =C2=A0 dev_err_probe(dev, ret,
> > @@ -1366,6 +1496,9 @@ static int imx214_probe(struct i2c_client
> > *client)
> > =C2=A0error_power_off:
> > =C2=A0 imx214_power_off(imx214->dev);
> > =C2=A0
> > +error_fwnode:
> > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > +
> > =C2=A0 return ret;
> > =C2=A0}
> > =C2=A0
> > @@ -1378,6 +1511,8 @@ static void imx214_remove(struct i2c_client
> > *client)
> > =C2=A0 v4l2_subdev_cleanup(sd);
> > =C2=A0 media_entity_cleanup(&imx214->sd.entity);
> > =C2=A0 v4l2_ctrl_handler_free(&imx214->ctrls);
> > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > +
> > =C2=A0 pm_runtime_disable(&client->dev);
> > =C2=A0 if (!pm_runtime_status_suspended(&client->dev)) {
> > =C2=A0 imx214_power_off(imx214->dev);

