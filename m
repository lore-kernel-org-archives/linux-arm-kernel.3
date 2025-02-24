Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414B8C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGcm2bkFDPXzL23Cd0xQolPfqoEIsDRM3DUNg3w1Cy8=; b=gKJvukSQSzZLu8L+i8QA04eKLz
	FzcgGcSrK05tVzbxH2TkpKX1mPz4kJiebW4fwWsJpR2hdaS+0t6q1+SnYDGDcZ3DVEz8h1qGFg4o4
	SlteFpqS25Cp7i8kE5MiYN+6if+cE9/FZXxig883RZSJrX6GaXCvKxV8UbLwLqfuMry1KU9wy7bFf
	WjReYdXpqtfy9WcgaMddvs5ZUBqM9fpuMAxqN1j5+Qpf9rb9o8a9g7XUlM/kM6Q1pcs6RLVJ6x3j0
	K/JQDvVLYci6IfgPmnzevezCxhH9+3kIJV+7Zlup7ZuCIO+o6dCO6VgTybP0FvqEXUGh2w+X+mfcL
	NaQrmpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdVq-0000000EsQF-1tYV;
	Mon, 24 Feb 2025 18:49:06 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdHc-0000000EpiR-2FKI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:34:25 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30a303a656aso49552941fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740422062; x=1741026862; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGcm2bkFDPXzL23Cd0xQolPfqoEIsDRM3DUNg3w1Cy8=;
        b=HqwVw6dI6jJHicaHkAKfQ3+LAtv02XD89q9PJJutUZcfXrn1mUfj7TD1V5s0qlSuSq
         2v97OVplxOVA0I0YLWchMLr3zHuD6shGC9+r97uY6euP6veWAeLn++wtBJrcfMMEeeFs
         GhVd2SipUnvSxaPb3uPnsPzZftT1tsKlUlB+gUFOxN/heYvzmh/qNZs9CgIJMNkEErFY
         rBHZqWvT/jNDvrwAYYObkgLFjeyQCd+u2mK+j14QqtJYMDCYxrxv5iLUFNLBfUoTUbxW
         tJsGGSwrU20IyQxeaucMgKxSsdiwV+aEoem/+EpfAExyFvb2k0PVk+/9kWLCwjF5+qsB
         nRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422062; x=1741026862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGcm2bkFDPXzL23Cd0xQolPfqoEIsDRM3DUNg3w1Cy8=;
        b=O/19/luEVg/91t+p+7CuLmv3cf73XOSsG+jZ5HlNCPemmXRWik+J5kgCkEw4hT/m77
         ljQW3Lk8tCuDr1mN7biS/luOI4i+9rqC4LWybqX0xcvWn6XWCY2KW7STwmo5tFGxzh2Q
         xY/HHRYIHKxtk1aECtfDfAq7BUFDspHPXiClACnJnblKCYaBlv9EMMdL2ZnUxR7xmHhM
         NuHDNUu/f8FidMJhfb8QemBA1IbgpswW7q124welzI567dZxGTeTIEzhcxGi/uvbkHSZ
         gwkwYdDr1Da4XabDMYqWl2Jndu9e+Zqx/dNvRA99NksRXyZGlvIq+Rh0jaUM2jESMgr1
         0fig==
X-Forwarded-Encrypted: i=1; AJvYcCVYPEVZ6D+3pdka1aOY3ccKVamckJmh8yQx4RjMS2hhv570yCRwXZdWMVNohRMebvIqjorfwhyCyGLvX25J2y5O@lists.infradead.org
X-Gm-Message-State: AOJu0YwA07CGn/4nljsuCGK9LN2/wgPa4s2wscNXJADKhfH19R6urbEj
	AToTeXhdMzu/vphKqyDkDjtg1QgdW9hevKvpkwOqyCd5d3lrprDb
X-Gm-Gg: ASbGncu6hKWg0o2tV/hAOcEHspsJlmGdlmE4l7s0uV4HMMfCKBeYY1nWiHRo1BBJ1ih
	nRJSuFCmzARZkOLQcZ/9PpIVB8pDVmH0vUkTQrz2DoEsVtLfIrbA4iqp8tmRvi0etB4CoVnCSqK
	gJQD8vF9OxfsFh4b1iOzhYeESJ4MHHC+2iLsQX30nY1XHMwLTCgBHpfBN/bijFpDuZIJ7a+gMeC
	jxk3apgXuaQHuyoF19hO6nisoQpdWIG2XqexA6EFcV1002NaduslAN5BFlwFE5/niXdH6SzvUPF
	qckHSk8+8+U2J1aiTsopTiX109zWZj5L
X-Google-Smtp-Source: AGHT+IFEpds9WAAPmdXGIB+EMRIMZX8JJNMGJEFMaa6SvRSCJp+geS/XDIi8N88vVzGAieZpjJvTTw==
X-Received: by 2002:a2e:8017:0:b0:300:4107:6294 with SMTP id 38308e7fff4ca-30a5b216a46mr47097571fa.35.1740422062295;
        Mon, 24 Feb 2025 10:34:22 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819e0a4fsm58811fa.2.2025.02.24.10.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:34:20 -0800 (PST)
Date: Mon, 24 Feb 2025 20:34:16 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v4 07/10] iio: adc: ti-ads7924: Respect device tree config
Message-ID: <20dd0e4ea72fe39b90b611f9c08dbd4bc1d5217f.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IkbFafee0o6MuMJf"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_103424_583980_A72B085A 
X-CRM114-Status: GOOD (  25.73  )
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


--IkbFafee0o6MuMJf
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
v3 =3D> v4:
 - Adapt to 'drop diff-channel support' changes to ADC-helpers
 - select ADC helpers in the Kconfig
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
 drivers/iio/adc/Kconfig      |  1 +
 drivers/iio/adc/ti-ads7924.c | 78 ++++++++++++++++--------------------
 2 files changed, 36 insertions(+), 43 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 0993008a1586..d16082ac2e1f 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1476,6 +1476,7 @@ config TI_ADS7924
 	tristate "Texas Instruments ADS7924 ADC"
 	depends on I2C
 	select REGMAP_I2C
+	select IIO_ADC_HELPER
 	help
 	  If you say yes here you get support for Texas Instruments ADS7924
 	  4 channels, 12-bit I2C ADC chip.
diff --git a/drivers/iio/adc/ti-ads7924.c b/drivers/iio/adc/ti-ads7924.c
index b1f745f75dbe..e3ac170c73f4 100644
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
@@ -251,32 +242,35 @@ static const struct iio_info ads7924_info =3D {
 	.read_raw =3D ads7924_read_raw,
 };
=20
-static int ads7924_get_channels_config(struct device *dev)
+static int ads7924_get_channels_config(struct iio_dev *indio_dev,
+				       struct device *dev)
 {
-	struct fwnode_handle *node;
-	int num_channels =3D 0;
+	struct iio_chan_spec *chan_array;
+	int num_channels =3D 0, i;
+	static const char * const datasheet_names[] =3D {
+		"AIN0", "AIN1", "AIN2", "AIN3"
+	};
=20
-	device_for_each_child_node(dev, node) {
-		u32 pval;
-		unsigned int channel;
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo_se(dev,
+						&ads7924_chan_template,
+						ARRAY_SIZE(datasheet_names) - 1,
+						&chan_array);
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
=20
-		num_channels++;
+	for (i =3D 0; i < num_channels; i++) {
+		int ch_id =3D chan_array[i].channel;
+
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
@@ -370,18 +364,15 @@ static int ads7924_probe(struct i2c_client *client)
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
@@ -469,3 +460,4 @@ module_i2c_driver(ads7924_driver);
 MODULE_AUTHOR("Hugo Villeneuve <hvilleneuve@dimonoff.com>");
 MODULE_DESCRIPTION("Texas Instruments ADS7924 ADC I2C driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("IIO_DRIVER");
--=20
2.48.1


--IkbFafee0o6MuMJf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u6gACgkQeFA3/03a
ocUe1wf+MJKOql30Dh2UEfmAD+modSznTYRRI0q8qUSlSJUWjF3sOGOhT3n5uB08
68lAVMOvkhelWF/nvHuLJQLbpNATe3sVzQZ53X5Ont2jrgPBg4monQOxnqlIy1OD
siu4L1/uobQ4pFHHd1Sb+uQHg9RoSf0u7G/LeAxUK1qQOnyrJ8B4QDS9IbcsJbos
WKrdaBEUXUp8vb7RykmVe43qUiyUEdGKUZczoyAqG3+QD2hkJ73U+yF4QerQE4+M
LGfFIFlaf5U3RWJga1or1/1FDytmwQCyNZyDl4hVTjis+s46inK1tsH/zwpVueNn
nqoScEr26AP8Y01PhKWQ/zP5cIc7kQ==
=WNVg
-----END PGP SIGNATURE-----

--IkbFafee0o6MuMJf--

