Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E3EC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 08:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inP+EHbG3HFu17JrpCxUEkiI+iH0naKDQSPrV/Ou9sg=; b=TTHXsuJZ7Aa/ZlFcfa1LR++xob
	whe97h6klQ3AvSFmOSszZgaPp8qLnZUQnCLDlhT5+dhyyT8I65hA9L3BzTXyEaggUsto57EQzH+xn
	VQJ/rTLcBvtMEmyuNWyTott1rQcra+/eMcCo2i2NMW8VCjmjdqm3KkaGCgwUbnTFd+KXFyQ8fDm1B
	9vNXlBO53x9rb4YS3gD7tP6L9aARSI7Qtf644dAD6NYFBOWUzKagN+yN3700CXXQlxWcSL37iMMjp
	DIY0OaBNziOZXN2EoL+0F5fyN7V9Xj6DYx4ee2alTnj3qkfgn+4W0It4dpNwoiXX5/yLkSxtRHjD2
	bh6j4QeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBFd-0000000BWoH-1AJO;
	Thu, 20 Mar 2025 08:27:41 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBA2-0000000BVlt-2Rnj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 08:21:55 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so5557821fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 01:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742458913; x=1743063713; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=inP+EHbG3HFu17JrpCxUEkiI+iH0naKDQSPrV/Ou9sg=;
        b=RDzDFW3rle7jKWEdKkAWAsgXMD8HJSNXNKvNNtdB1fzVJrQQhGIir6O4jHEzzXJSX+
         YSKayT3qe+/zy3IhJLGzCi+QMDdwZXF0cl2U1IBScO26adnGZRXbrw+h1i9n2JwUxa9Y
         F0c8oEr2/MRNsnYVVXeGJ0l54iXA/e/aMtsS/90pFk0xS6qzHnjrUfd1khlnujaWIpQk
         Daqw1pRt1p8tNlC2/J1LRkoNfH108t9Ha2Mi1F1wZ0yI1/RtGDjWinm17CjQeWdm7G/Q
         f/bker5OOplnij/DOkD6+FFGt7CyV2/C2y3EuRIP/JyLnz3DtjsDIf35mTKujRNLAz+h
         XgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458913; x=1743063713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inP+EHbG3HFu17JrpCxUEkiI+iH0naKDQSPrV/Ou9sg=;
        b=Qb9dmkFBpynMqn2BWLJHo9UhhdEcfTKNF3G+lMbdA6mIjLx52qamNUxFwDqimj9t8f
         UWItFxGBPZlg2AGBFCiK22gZBQv7zRLcnoOd0OGgkmMKlJleMjVkgawv/L80u6qpYU3v
         T9piclBfk/EKiaVFGuTHVO6G8qc0oIlyN8fqen73fky1cwIdPTlTo+uBl2SDU+y3BgwK
         uDCapdQGPGS8LCzkVPzc8umttbf+CFFEV+LIfyhIrTyMqX3VHbYy/Ay7KjMfhy9xiel1
         hEQbucN/GKU1EAV0rC3GficgGJpH+c9xWjyLJ1MuRqYbCwqfHGS2/bp4z0/8289VlUSN
         KixA==
X-Forwarded-Encrypted: i=1; AJvYcCVCvOgnmkYhE+sUha97IPltaPvj+5K47Cu/2uPc1KgobdfywD/14QTGA6fz/4qs6hIDUjlTn9+QxEXh4iqqc7lj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo4xD2oq0PM0vHKPrBktleFatf28Zj3nzI3GUwtY1kh9we4ALs
	jfNcLekXk1PhXFT9a2/EpuM3RgvSVi8ESMRBEMpCX/SRpPr9teks
X-Gm-Gg: ASbGncs9cp2Wkv2CrvGNo8B0stkI5vNxfJklJgsnfRlEkFcB1yffjdXzhekOk+ixu68
	GJWF9ijidfdlsxesKEjhuYk/tLZ6sQC3TEZ/BHr+wZXO8eQ6Qsjwp8VjrhwuJ249SUCjh40ic3y
	/v2Khg3MOI3zlpvKBhUezIy6RYGDnsxBrbO5JXUwJ3dYJTYM6DaZzILZytmof9PfPRQSjLTOkZI
	UTiQapo7ZOGwZs2B5lkOnC3LChOhk+CB+hqt4emGkK3nEPLunG99M2vBA+6HH07bkl+OuOAVJdJ
	0LZKc46kWjVHeLblfmUnTZdt107RY2t2dzfH3L2AVANEWQyqelk=
X-Google-Smtp-Source: AGHT+IEhufbW2LJTHSlZk9mpioInmJst32vWXWedYxnZIFXDsg6/QWM8o+AA1E/Gzb00RvRPWNGd7g==
X-Received: by 2002:a05:651c:546:b0:30b:b9e4:13b0 with SMTP id 38308e7fff4ca-30d6a3db84emr26007541fa.12.1742458912404;
        Thu, 20 Mar 2025 01:21:52 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0fff95sm25420711fa.47.2025.03.20.01.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:21:50 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:21:45 +0200
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
Subject: [PATCH v9 5/8] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <bd0a5b7cb9b98319941ea246953866c61fba6540.1742457420.git.mazziesaccount@gmail.com>
References: <cover.1742457420.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BbT3xLiwPWOuLU+N"
Content-Disposition: inline
In-Reply-To: <cover.1742457420.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_012154_624580_812D07F9 
X-CRM114-Status: GOOD (  24.80  )
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


--BbT3xLiwPWOuLU+N
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
NOTE: This change now drops a print "no channel children" which used to
be printed if no channel nodes were found. It also changes the return
value from -ENODEV to -ENOENT.

Revision history:
v8 =3D>
 - No changes
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


--BbT3xLiwPWOuLU+N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfb0BkACgkQeFA3/03a
ocVctgf/bBBEeJw/sSHAk6ry0GVLRQoRYDRuSwV02Qrw1Hkui7QSbGLhlnOGGA5X
UsbfZitGbL1x1b14QvMwl3JiYosiHCQOWSph1O19piML/pRVjy7ou98lu+O+oHbt
6Q+PWMNGhfMD15DPy10pmeO40WCnXhqHYDWCRFnav6k01//ugzG+C/Tas0kvR4JZ
5H30kUZQTpz42DXUmk9l2WpvU18Y5w7TMpD5rMy0ThY7P0mygc3ztK1R6TggKS1i
SgnZcATsrUozQlf6XwuqlYTlhmT5Ef5WmvnoMmsb6cNPzzMJSKcne59CYxt7u6op
dgldsND/s60Avrsv/hLScyxlRG/kLw==
=r70i
-----END PGP SIGNATURE-----

--BbT3xLiwPWOuLU+N--

