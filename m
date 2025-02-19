Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28C2C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DYvjW5f0VauVHlYQoEoi+1LNEnpUSDiH5KvYpk6CeA=; b=s+/qOknFCUkwb9FoXj/yAAg3rg
	toRiHoVZQjXxdbS+Sf/aRPzCp6dA+ZN0j8a8vCm2QHt5cUOcI5twxwmB9mA6iJ05UkegnZ9LNBDvX
	NFt8MlyUKo8QKPptF8RdGKyfRWTV24MZux6vOnd5SoCVeXj0a9gTPyn+Kw11mCrt6Llfr7MeanW07
	fuN2qZBaVebE5VS6noR4tnVMcLCLXBZSpzIL6d6m0aeoxdZWkhpyoicgjuoBZTQMWcIkbYj2CRu7P
	o0CF5pQOldUooOc4ldJTocReUWzW6043r0PfqEZVoink2AtO3ey0hIg+86c+Mc+azeh842bKk2oBX
	J669hbLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjTM-0000000CkOr-0epc;
	Wed, 19 Feb 2025 12:46:40 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjFe-0000000CgYK-1FXx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:32:31 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30227c56b11so71230941fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968348; x=1740573148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0DYvjW5f0VauVHlYQoEoi+1LNEnpUSDiH5KvYpk6CeA=;
        b=Bx98tzod09Yf19YdrYd0I+oTP9x3YhEYef3ikWgYQrn2+sSQQlBCbpq62jgdyCVZws
         whKYLHY2BvltmvrBQN6Hwi+gOpBBUMau1xBRUi83wqRS/msRkx75GWCbMDg+pMtlT1N/
         Am3PXogoN+TZ6Ok+F8LDCIDe9w45gYejDRvH6eKuwGncCz5CXJ0FWbREJ0fro6hDPViW
         KgYpnPXLA96fVizOeaJHOZ1qdWvllGPrrXn8GzLysHv3Q9AiXdR+0gtrgQSnNfTiy6Wq
         ZTceH0//gZijxoYo5T+a+Z56H4wvpl8uzt+GVg6Xxru4ohW+mBTc1cEbH2Rb/WTlVEta
         p2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968348; x=1740573148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DYvjW5f0VauVHlYQoEoi+1LNEnpUSDiH5KvYpk6CeA=;
        b=ND7RnZ0EOdIMmvHQl7/AYxhyan05mCz8uR2CdszhWhqVcwiQuxWit6FOwJxePc8BCz
         pU1rphPo+bPx/lqPgIvBTvDOUCKoHExfxEIXD/Z2J1j9iOMP5Y5MPxzvo8l3F+Qe/Z0O
         KrKLFoAl5/LyH0ItUiSFijxOlkmzGtIuOniKyK7ekRKVCvclZm+u2WZw4R+lbmOQ+Ljx
         fuMMSndKNnNctfuibP828ACqZMJVYGVdBr29XePcrj/MAMpv/01HfDM1vI6RXdfKP6GD
         JzkrRdckjSUCxtzILbPfNI+pxZQS2GldqZz+MoSBb5e8rWVBC8ZuDR72mVzrkpIKshK5
         rPlw==
X-Forwarded-Encrypted: i=1; AJvYcCX6UgZ8x7wqJ4hDdt4BiRCyTxhofsMe925OHZtlL00JQ0s/UkDOf45DqsQ/PZjFcGYDLXLikIwmJHJgqzkOx3Qd@lists.infradead.org
X-Gm-Message-State: AOJu0YyN1jUjAodjLn4FV8yKanLNcHvF1ZujQ8Gxjk5HNKf9kn2cOCEh
	960AgXlSSJCWFtmNbykKCW/UkmmNK7umFudp53S8cqbjUwbM/k+Q
X-Gm-Gg: ASbGncsJrd2PjS9yZFwU8X+YYIJV7f/OWQqHAnf53pcMlXYWnP/M6r5zQZ4CkyrE0Gi
	k7YNT6Bp5uqB8OwlDrQ7tvK9esq1E/i21FdP9xYl8/TQ0SkOSMOH7fT6/IMp0H6c7NDoNSOVyp8
	FUmncQOR/OBK7MJGEMaRA5dPm1ZhI9CnM+MHoahWOgBv0rH3gJnfkqXugoVAgPk+6ckdVa58Q3v
	yaQnJb88P7cx8jeBvd8zddfQC1E0IZGUbT2Hx308M9NdAUHxaNuMAU0oRDZFQrxhLHpR0ZM6uel
	I5zIZLSaoFm4GJpnnLRLWQ==
X-Google-Smtp-Source: AGHT+IGpj+sXTk9ydInkrFSzD/8u3Ea569jfA3qPAyfTIDaLYJDMfGIteoPF8DQijF1k+5z6DuXOPg==
X-Received: by 2002:a2e:9905:0:b0:308:f01f:181f with SMTP id 38308e7fff4ca-30927aff022mr48385981fa.31.1739968348109;
        Wed, 19 Feb 2025 04:32:28 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a344c8900sm9350131fa.22.2025.02.19.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:32:27 -0800 (PST)
Date: Wed, 19 Feb 2025 14:32:23 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v3 9/9] iio: adc: ti-ads7924: Respect device tree config
Message-ID: <3279aa9348e7149bfbd433daaa201f2eb5873e1f.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vg9phHNLX0RbBtPD"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_043230_342590_17965E01 
X-CRM114-Status: GOOD (  25.06  )
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


--vg9phHNLX0RbBtPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ti-ads7924 driver ignores the device-tree ADC channel specification
and always exposes all 4 channels to users whether they are present in
the device-tree or not. Additionally, the "reg" values in the channel
nodes are ignored, although an error is printed if they are out of range.

Register only the channels described in the device-tree, and use the reg
property as a channel ID.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v2 =3D> v3: New patch

Please note that this is potentially breaking existing users if they
have wrong values in the device-tree. I believe the device-tree should
ideally be respected, and if it says device X has only one channel, then
we should believe it and not register 4. Well, we don't live in the
ideal world, so even though I believe this is TheRightThingToDo - it may
cause havoc because correct device-tree has not been required from the
day 1. So, please review and test and apply at your own risk :)

As a side note, this might warrant a fixes tag but the adc-helper -stuff
is hardly worth to be backported... (And I've already exceeded my time
budget with this series - hence I'll leave crafting backportable fix to
TI people ;) )

This has only been compile tested! All testing is highly appreciated.
---
 drivers/iio/adc/ti-ads7924.c | 80 +++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 43 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7924.c b/drivers/iio/adc/ti-ads7924.c
index b1f745f75dbe..a5b8f7c81b8a 100644
--- a/drivers/iio/adc/ti-ads7924.c
+++ b/drivers/iio/adc/ti-ads7924.c
@@ -22,6 +22,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
=20
+#include <linux/iio/adc-helpers.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/types.h>
=20
@@ -119,15 +120,12 @@
 #define ADS7924_TOTAL_CONVTIME_US (ADS7924_PWRUPTIME_US + ADS7924_ACQTIME_=
US + \
 				   ADS7924_CONVTIME_US)
=20
-#define ADS7924_V_CHAN(_chan, _addr) {				\
-	.type =3D IIO_VOLTAGE,					\
-	.indexed =3D 1,						\
-	.channel =3D _chan,					\
-	.address =3D _addr,					\
-	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW), 		\
-	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),	\
-	.datasheet_name =3D "AIN"#_chan,				\
-}
+static const struct iio_chan_spec ads7924_chan_template =3D {
+	.type =3D IIO_VOLTAGE,
+	.indexed =3D 1,
+	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),
+};
=20
 struct ads7924_data {
 	struct device *dev;
@@ -182,13 +180,6 @@ static const struct regmap_config ads7924_regmap_confi=
g =3D {
 	.writeable_reg =3D ads7924_is_writeable_reg,
 };
=20
-static const struct iio_chan_spec ads7924_channels[] =3D {
-	ADS7924_V_CHAN(0, ADS7924_DATA0_U_REG),
-	ADS7924_V_CHAN(1, ADS7924_DATA1_U_REG),
-	ADS7924_V_CHAN(2, ADS7924_DATA2_U_REG),
-	ADS7924_V_CHAN(3, ADS7924_DATA3_U_REG),
-};
-
 static int ads7924_get_adc_result(struct ads7924_data *data,
 				  struct iio_chan_spec const *chan, int *val)
 {
@@ -251,32 +242,38 @@ static const struct iio_info ads7924_info =3D {
 	.read_raw =3D ads7924_read_raw,
 };
=20
-static int ads7924_get_channels_config(struct device *dev)
+static const struct iio_adc_props ads7924_chan_props =3D {
+	.required =3D IIO_ADC_CHAN_PROP_TYPE_REG,
+};
+
+static int ads7924_get_channels_config(struct iio_dev *indio_dev,
+				       struct device *dev)
 {
-	struct fwnode_handle *node;
-	int num_channels =3D 0;
+	struct iio_chan_spec *chan_array;
+	int num_channels =3D 0, i;
=20
-	device_for_each_child_node(dev, node) {
-		u32 pval;
-		unsigned int channel;
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo(dev,
+					&ads7924_chan_template, &chan_array,
+					&ads7924_chan_props);
=20
-		if (fwnode_property_read_u32(node, "reg", &pval)) {
-			dev_err(dev, "invalid reg on %pfw\n", node);
-			continue;
-		}
+	if (num_channels < 0)
+		return num_channels;
=20
-		channel =3D pval;
-		if (channel >=3D ADS7924_CHANNELS) {
-			dev_err(dev, "invalid channel index %d on %pfw\n",
-				channel, node);
-			continue;
-		}
+	if (!num_channels)
+		return -EINVAL;
+
+	for (i =3D 0; i < num_channels; i++) {
+		static const char * const datasheet_names[] =3D {
+			"AIN0", "AIN1", "AIN2", "AIN3"
+		};
+		int ch_id =3D chan_array[i].channel;
=20
-		num_channels++;
+		chan_array[i].address =3D ADS7924_DATA0_U_REG + ch_id;
+		chan_array[i].datasheet_name =3D datasheet_names[ch_id];
 	}
=20
-	if (!num_channels)
-		return -EINVAL;
+	indio_dev->channels =3D chan_array;
+	indio_dev->num_channels =3D num_channels;
=20
 	return 0;
 }
@@ -370,18 +367,15 @@ static int ads7924_probe(struct i2c_client *client)
=20
 	mutex_init(&data->lock);
=20
-	indio_dev->name =3D "ads7924";
-	indio_dev->modes =3D INDIO_DIRECT_MODE;
-
-	indio_dev->channels =3D ads7924_channels;
-	indio_dev->num_channels =3D ARRAY_SIZE(ads7924_channels);
-	indio_dev->info =3D &ads7924_info;
-
-	ret =3D ads7924_get_channels_config(dev);
+	ret =3D ads7924_get_channels_config(indio_dev, dev);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
 				     "failed to get channels configuration\n");
=20
+	indio_dev->name =3D "ads7924";
+	indio_dev->modes =3D INDIO_DIRECT_MODE;
+	indio_dev->info =3D &ads7924_info;
+
 	data->regmap =3D devm_regmap_init_i2c(client, &ads7924_regmap_config);
 	if (IS_ERR(data->regmap))
 		return dev_err_probe(dev, PTR_ERR(data->regmap),
--=20
2.48.1


--vg9phHNLX0RbBtPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1z1cACgkQeFA3/03a
ocVfdAf/dJeRANmjD6kr3+nUZ8APPdoSBvKQHSWTTYvnKXYCZEJYrZk9e+UN3UAo
82YkKYpUqhArK45Dzjx9OS42+5NLtA2ejvZnApSvg6Zl6Qzth/UNCa0EKgJwLS5F
E1XAjDOuGlow3lkWtpGalu54LEEKLUMwlq0I18J/MKhrZAlp3yF63+GC5Bt0AwpE
9wUmQ1L13Hb/zSD+ub50UVmcPDAG3QCPzF5XFqCIJZX4UzDX7m0hh+cMYICn/92q
fb/f5L9zxO72WukfiX49W81NQ9bfBmyJyYTE3nnoPr2fvMxtq8PAQPqvklzBkF+9
ZzSYdwAyy4wq0CNST3K+ZG81JWsZoQ==
=/Rhj
-----END PGP SIGNATURE-----

--vg9phHNLX0RbBtPD--

