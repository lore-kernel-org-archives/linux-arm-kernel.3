Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D640FC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zU3hKPINr7QjLa/9u8VCMKZheNEA+eJosA8qF1wcCvk=; b=JsoNy3Kdlt787cwXNFr7w08ja+
	A3SxG6EwOJALlypCQXuynerItr6t2aCNSh4UIDAMiymcjvxgrrjZaAxaC+qpCW3pRHYjyNqJO5NjE
	SoQ8Ijq1UvNNnZozFPp4eJ+bziq1juG51hRd5BTtCu9x7tF50BsY35+3kQSUst4ykk3TsyKcw3qAt
	AdHKd0JFo+mzbz9QcT9NdgoAh47+6wZ0ziLg6GR5f9p+Fl+XDFR5/5cnRFyE8SoSpQqkS5mitmGLx
	qqtzIaaGps9C4I54b5zq5sK0yXKz5jgvvb9gJ38JdBYJupCbGkdLMB5vGywWOffhU9syd7VXsr3BE
	P4PaiHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCqq-00000003EQE-1Sp4;
	Mon, 17 Mar 2025 15:58:04 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCkL-00000003DMl-1NrH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 15:51:22 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5499c8fa0f3so4779481e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 08:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742226679; x=1742831479; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zU3hKPINr7QjLa/9u8VCMKZheNEA+eJosA8qF1wcCvk=;
        b=PYFDc26G0dUqO9HcBM14LnQkDAB09xrEo9ZTNVEuUyYlBzlsjj7wQ/0PB/9u0ZALX7
         PbfeT+i6rzcBLYRuCJjxNh5wrD9eWpAVvwthpERrWDtttrxFma/PC5Qt23ugw/8DDeCz
         7k5lHk7yBJU3Y9hSpHcrVLbp8zEBaVynZYIFhZerYK0ykpUgsckdM1hMEXZJiR2IeeC5
         tcCSzekZHZk0mqwopayfiQ39gvzdyFunPBvLYpIG7DCtd1FsYPgdjJvxC2xKoMa7yJlS
         hZUE/hRpQeJqxCXnZY4bHch2s8VRjYhvyA/vw7ZyKen//0ZcNb3eZX4NJacmVGj2suvL
         aXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226679; x=1742831479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zU3hKPINr7QjLa/9u8VCMKZheNEA+eJosA8qF1wcCvk=;
        b=HyptpIfppy4ZhmwLOa7fHOWkiPBzKodrPmsEwd917JbTJnYEc6mz+SmDeQT40c+AAC
         tOKoAFe2IrfDWlTn8oCOZ/Uyqt+zR/GL716BiS5fZ1wVXPpkOAkGkdy/eq3pDBXTIfiu
         9U9pq1MYfHVX47gJlQDnuwmLdwxIDFveXIuGFvUQx1Htfcyg0rfoqWo3Z1xukxR/9542
         nvzOGUqbjb90vTcHA1spl3AwDTjRIxQg+9kEYAk3z9kRZgD75g9TQ9HntHuFf9acpAcI
         UFxt6Spbmzz/y8VuV3tebb0S+l6ESSeeCGXm4v47+YaqMDUnqt+xLJSEmFhTfPpytczP
         B3bw==
X-Forwarded-Encrypted: i=1; AJvYcCVo79RVs8IchcQmi35LQYgKB7ZUFUjV3USLKBI/EafR7CWLQ33SvQL30qrG7btn1TzFWMkAPtKyvSWUmerXMU/S@lists.infradead.org
X-Gm-Message-State: AOJu0YyWTyYvjKEHKnXsXP1HbQDkKDUFTrPMgr2l7XJC9AU3OMwGmh78
	NibASy+wQri/lqs6Py5HJpLVMKVBrmbbu8q4vXzmze7XRjCq/+EF
X-Gm-Gg: ASbGnctBMFiQErMsL53SJwUlJB4osgfINr/9jPW4xkc4Bj0V2XbhXjyfHwBrMsgx1ZA
	O1ccG0u/Ij+Xu/Q1HlyXIjBkCGpxr1uPy6exGqGqylQOyIK/wYyBn8oYMyjHjz6VUHan5zXbmmp
	OSZZI368jBZ7S/1bnpEzOm2UYoIZABK+T2T5rrobwThnMQ5icNW7OgVAex7d32PzXw+KfsKiPVR
	8oM4fLxGuyBXLMvypxxCdGody3+3/RE/7LD77+ERaInEurw16juouY77GIlcS7ZyfViJUHOjCQp
	4Laqk4jLi8dAdi9WQr2Qwcpfxgf27ANrQ/Voao8Jdrg2ev1zxTs=
X-Google-Smtp-Source: AGHT+IFO6FurpLKdrrzNJjWZBW6Q6qLTQzj/6D7yUMiIDBFfxDiNKsnCqwySTDoIxxnnxKjOsr4OWQ==
X-Received: by 2002:a05:6512:130c:b0:545:c7d:1790 with SMTP id 2adb3069b0e04-549c3900894mr6947244e87.22.1742226679087;
        Mon, 17 Mar 2025 08:51:19 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864ed4sm1385479e87.128.2025.03.17.08.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:51:18 -0700 (PDT)
Date: Mon, 17 Mar 2025 17:51:14 +0200
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
Subject: [PATCH v8 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <78d33ea9a795abdb2c5a4c606d48593e827ca59e.1742225817.git.mazziesaccount@gmail.com>
References: <cover.1742225817.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KMNdhR1bTFQS085O"
Content-Disposition: inline
In-Reply-To: <cover.1742225817.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_085121_370410_8900BCEC 
X-CRM114-Status: GOOD (  24.14  )
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


--KMNdhR1bTFQS085O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The new devm_iio_adc_device_alloc_chaninfo_se() -helper is intended to
help drivers avoid open-coding the for_each_node -loop for getting the
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
NOTE: This change now drops a print "no channel children" which used to
be printed if no channel nodes were found. It also changes the return
value from -ENODEV to -ENOENT.

Revision history:
v7 =3D> v8:
 - drop explicit "no channels check". It is now done inside the
   devm_iio_adc_device_alloc_chaninfo_se().
v6 =3D> v7:
 - Fix function name in the commit message
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
 drivers/iio/adc/sun20i-gpadc-iio.c | 39 +++++++++++-------------------
 2 files changed, 15 insertions(+), 25 deletions(-)

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
index 136b8d9c294f..2428ea69d676 100644
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
@@ -149,36 +150,23 @@ static void sun20i_gpadc_reset_assert(void *data)
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
-	if (num_channels =3D=3D 0)
-		return dev_err_probe(dev, -ENODEV, "no channel children\n");
-
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
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo_se(dev,
+				&sun20i_gpadc_chan_template, -1, &channels);
+	if (num_channels < 0)
+		return num_channels;
=20
 	indio_dev->channels =3D channels;
 	indio_dev->num_channels =3D num_channels;
@@ -271,3 +259,4 @@ module_platform_driver(sun20i_gpadc_driver);
 MODULE_DESCRIPTION("ADC driver for sunxi platforms");
 MODULE_AUTHOR("Maksim Kiselev <bigunclemax@gmail.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("IIO_DRIVER");
--=20
2.48.1


--KMNdhR1bTFQS085O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfYRPIACgkQeFA3/03a
ocXzMQgAk9GKibU0YJ5K0EXd9JTmbwFlG/TohUel6DTYOTzSxaUzIcMAHgIsZqbm
ETPxR/mDiYEyLKOD9O6F+Tod6Kgpdol+YKzLEzx+LZPlmvvDzOixjsUdGT+BYLvZ
pEnQiLHbcF+6SatCJ/vCEyM/dJ99ztt8hRw/m1KxpUTLuCxBGpVBT1ouq7x4vDj+
XRNKcyZj9Y3lcTFf9W8TVuRZs9kh9Eb1rURFq7bbEqCYuuvdcmL0WMS5ne9GUVxT
QbuWpDKOd4pNQD9q6HyRtFySY4a+3Vbsd3lkeGEifKw+ESZgpytny4RhxX9dllnh
LT34DSm7XQXUzPtbuDBAP0jcirqfrg==
=2vYw
-----END PGP SIGNATURE-----

--KMNdhR1bTFQS085O--

