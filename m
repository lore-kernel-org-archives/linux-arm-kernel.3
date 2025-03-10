Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152CEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcfEYtrJz5zWQt9AvTA5zPr+o4Ysr+2unMZ2MALKhvA=; b=Yuvhovj5kaN/WzdSr4KUeDXjwK
	9n1ddz55Pwha4kSzEAHJgCZDZdNvZbvvmiEv5yzYeWG6yaj+SN4XYkVnF7nnly1ZfVnbQKCfG9zw2
	jQqW+Zu8i1TfRW4xgnLZrbq8nSCuvR0ZONPGBvNx+ezOyuMDrX0T9zhsCPlwf6+CLB8ne3904RQ8i
	Mco7/+VNy21Wlkv4f8Ku67tsktZZRPGYyc4VMLOu7rK7VkRGQXzh0Tw2x+Jg964a92e54BS6csZwp
	Ytv4ZOhKVBSvHkZnX3tv9awB2/UhipUSAnNwa4qgukj+8m7MRT+2GHgyryGDvMVfmRgNvLaVfKtPl
	n7RZra4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trddA-00000002rYr-1lrS;
	Mon, 10 Mar 2025 13:57:20 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcgU-00000002hgx-1y4g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:56:43 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-549967c72bcso2693459e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 05:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611401; x=1742216201; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PcfEYtrJz5zWQt9AvTA5zPr+o4Ysr+2unMZ2MALKhvA=;
        b=i/10oulkdZUjw5Q05B9nPfE2+7WzmZIT7/vuAzDibHnuadjCGbRH7ZsTOee91JcTHD
         9R4YuzgC2wuvvMY1fOA47Sw6Mokiwv9WUZRLBQUHERcpuePZroUjSLoVv75lk5Nz9lFv
         82bQj4vMtdkFMclEOPhL4kri4VBSS02yVyor7MwOQIhqXzitvidg6U2luBpeCSCuZnFt
         lMo0hRD7M/g8dKlLDYvKgQ5+giD/Ap4jRUfYc0u4oNYF1yUXkZgdXTYpCzRqEpEF4niy
         bQ0e+Si+pdK4C8P9Z2M/H9l3tTL0jfDOTGuIR7yuEbrX15LckQq4oPhUWC7xGbsiXh62
         WXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611401; x=1742216201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcfEYtrJz5zWQt9AvTA5zPr+o4Ysr+2unMZ2MALKhvA=;
        b=dktsC7FDdEj0RnWHipjytpZNGLWbr185qoUJSo7kU0xtU/R2oaGXPKWWI/NxurqpEp
         HZlRSB6mXjWhO89X9CHfpBdLEqFxplb/g3rfOkoKrn5cjhaDwapWPT8uBUTVGIjTnXLx
         d2k0RDYkms+elFSIv6NDh34ix+rqrKW7nc7NikMwD6u96IEHgMEOCaMBWNN/7V4xkxjH
         URscphcfC5zz3ZUS/1fyYA+s2hL5F+gbf1ti/DR1GNqWTndMtGrLFADQfanpMMTC1Kup
         LsLHJtfP+fpkEpQfkNOLnrl6pMtfWwqaPm97AFoo1zbO32nupu/2eL7zmYWe4VXekbvV
         UZFw==
X-Forwarded-Encrypted: i=1; AJvYcCXdJLoHzuPeceWQcu1BHOz61sCPBnLEwPLlzXD8f5ZBAFlwvw/9mh/re7qSxmzWnP1/VCuGF5gYtkxBs9l6pxhd@lists.infradead.org
X-Gm-Message-State: AOJu0YwOuQENKu9NSCtfGiTUkJIIySYwi2TUdltsHHwLCpZHR3TVJhbZ
	wDfutRlnM9j66qxAiTgccKqnskVN7VyrB/f7aIqFeTyUWG6ZZyr3
X-Gm-Gg: ASbGncsuo7a1k/IiWD5ZjiZiZo/a6D16iMpiSJtPIcfSCmEgBbV2c0dEcZkfxz3wsxu
	XtjVd6NSBLXThoSDgzsXzsMN0ecE5T7mqEHUlXWj8WidOp/aqx/xnlO1EK8Le7bKiDsLyVqbcN8
	AfvUNH8rO04lsD8rW3nc8iabyahNpXwDI/PBm+ewpWp52VAUMLgJ1mwmVgmB1R0ax5bWTWSOtum
	cxlulRf3Wb0qF5l/2mCAV4flQsho14VL/kd+547dE1Az0mN3VCiq3EMql0aZK9PIy06H1QnTK19
	OwILRcNTugbFzeNwucA+gcEV5QGF7ve4cSdwaI+3NUJvKrWP7Tc=
X-Google-Smtp-Source: AGHT+IFRmSf5GiiM8bfzTIfNKKyhDwDuNOYO808weMLsGD1nweR4GVyow1Hcgy16MeoRt06G5yQKvA==
X-Received: by 2002:a05:6512:3993:b0:549:792a:a382 with SMTP id 2adb3069b0e04-549910b59bdmr4168207e87.32.1741611400636;
        Mon, 10 Mar 2025 05:56:40 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae58e22sm1449802e87.86.2025.03.10.05.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:56:39 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:56:35 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v6 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <06e8f4f84731df9fc5d6f324e74fbd1bf83a81d5.1741610847.git.mazziesaccount@gmail.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JowyB6chBVFkTBVR"
Content-Disposition: inline
In-Reply-To: <cover.1741610847.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_055642_512226_503853D0 
X-CRM114-Status: GOOD (  23.04  )
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


--JowyB6chBVFkTBVR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
drivers avoid open-coding the for_each_node -loop for getting the
channel IDs. The helper provides standard way to detect the ADC channel
nodes (by the node name), and a standard way to convert the "reg"
-properties to channel identification numbers, used in the struct
iio_chan_spec. Furthermore, the helper can optionally check the found
channel IDs are smaller than given maximum. This is useful for callers
which later use the IDs for example for indexing a channel data array.

The original driver treated all found child nodes as channel nodes. The
new helper requires channel nodes to be named channel[@N]. This should
help avoid problems with devices which may contain also other but ADC
child nodes. Quick grep from arch/* with the sun20i-gpadc's compatible
string didn't reveal any in-tree .dts with channel nodes named
otherwise. Also, same grep shows all the in-tree .dts seem to have
channel IDs between 0..num of channels.

Use the new helper.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v5 =3D> v6:
 - Commit message typofix
v4 =3D> v5:
 - Drop the diff-channel stuff from the commit message
v3 =3D> v4:
 - Adapt to 'drop diff-channel support' changes to ADC-helpers
 - select ADC helpers in the Kconfig
v2 =3D> v3:
 - New patch

I picked the sun20i-gpadc in this series because it has a straightforward
approach for populating the struct iio_chan_spec. Everything else except
the .channel can use 'template'-data.

This makes the sun20i-gpadc well suited to be an example user of this new
helper. I hope this patch helps to evaluate whether these helpers are worth
the hassle.

The change is compile tested only!! Testing before applying is highly
appreciated (as always!). Also, even though I tried to audit the dts
files for the reg-properties in the channel nodes, use of references
didn't make it easy. I can't guarantee I didn't miss anything.
---
 drivers/iio/adc/Kconfig            |  1 +
 drivers/iio/adc/sun20i-gpadc-iio.c | 38 ++++++++++++------------------
 2 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index e4933de0c366..0993008a1586 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1357,6 +1357,7 @@ config SUN4I_GPADC
 config SUN20I_GPADC
 	tristate "Allwinner D1/T113s/T507/R329 and similar GPADCs driver"
 	depends on ARCH_SUNXI || COMPILE_TEST
+	select IIO_ADC_HELPER
 	help
 	  Say yes here to build support for Allwinner (D1, T113, T507 and R329)
 	  SoCs GPADC. This ADC provides up to 16 channels.
diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gp=
adc-iio.c
index 136b8d9c294f..bf1db2a3de9b 100644
--- a/drivers/iio/adc/sun20i-gpadc-iio.c
+++ b/drivers/iio/adc/sun20i-gpadc-iio.c
@@ -15,6 +15,7 @@
 #include <linux/property.h>
 #include <linux/reset.h>
=20
+#include <linux/iio/adc-helpers.h>
 #include <linux/iio/iio.h>
=20
 #define SUN20I_GPADC_DRIVER_NAME	"sun20i-gpadc"
@@ -149,37 +150,27 @@ static void sun20i_gpadc_reset_assert(void *data)
 	reset_control_assert(rst);
 }
=20
+static const struct iio_chan_spec sun20i_gpadc_chan_template =3D {
+	.type =3D IIO_VOLTAGE,
+	.indexed =3D 1,
+	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),
+};
+
 static int sun20i_gpadc_alloc_channels(struct iio_dev *indio_dev,
 				       struct device *dev)
 {
-	unsigned int channel;
-	int num_channels, i, ret;
+	int num_channels;
 	struct iio_chan_spec *channels;
=20
-	num_channels =3D device_get_child_node_count(dev);
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo_se(dev,
+				&sun20i_gpadc_chan_template, -1, &channels);
+	if (num_channels < 0)
+		return num_channels;
+
 	if (num_channels =3D=3D 0)
 		return dev_err_probe(dev, -ENODEV, "no channel children\n");
=20
-	channels =3D devm_kcalloc(dev, num_channels, sizeof(*channels),
-				GFP_KERNEL);
-	if (!channels)
-		return -ENOMEM;
-
-	i =3D 0;
-	device_for_each_child_node_scoped(dev, node) {
-		ret =3D fwnode_property_read_u32(node, "reg", &channel);
-		if (ret)
-			return dev_err_probe(dev, ret, "invalid channel number\n");
-
-		channels[i].type =3D IIO_VOLTAGE;
-		channels[i].indexed =3D 1;
-		channels[i].channel =3D channel;
-		channels[i].info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW);
-		channels[i].info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE);
-
-		i++;
-	}
-
 	indio_dev->channels =3D channels;
 	indio_dev->num_channels =3D num_channels;
=20
@@ -271,3 +262,4 @@ module_platform_driver(sun20i_gpadc_driver);
 MODULE_DESCRIPTION("ADC driver for sunxi platforms");
 MODULE_AUTHOR("Maksim Kiselev <bigunclemax@gmail.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("IIO_DRIVER");
--=20
2.48.1


--JowyB6chBVFkTBVR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfO4YMACgkQeFA3/03a
ocXu2Af/T06ImH4ZvUrc2LEWGPWz5jQ32YPvoizwaT8sxZSy0oMBQhUDltshWQbl
CoMzoDJ/zWVNxpzjAU+SrP2mOtUdPlLzUCGLSqryEKoj3eNXHBfBGDdhHXOKl65p
mYldt4ydWOcrGDUUypWWG3QLyCDj6w0D6vtMbNzvW+Ue0cUk0+QxZT8iDMRFEAi5
+sJQp7TNbaTGFd0kjvr0o/FV5PPjW8kRWaG9cZJ8f09xgjMAdGIgcLfogw+RrTme
vv1G1ighu6XHhJDdpHJ/OufusDu46tWJBa4HwCXc7osBfXiGuvAW0YjrZiOOg5Bs
b/8opt91KLvW/AZ7SvVmj4p+2A8aug==
=oACh
-----END PGP SIGNATURE-----

--JowyB6chBVFkTBVR--

