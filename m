Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E15DC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgmO3spMSV3ya0XSwKi8qyhViZcHQWh3KY5h+If7iMY=; b=NSzRqoZbWKpwjRdrqsGrAvmD/J
	pUHN4v2dFSvEF/NMA7WtE+vkJIT+w7TUqE0uFe/S/6kQs7FvJnu5h34ea+7UxoqDS/buoBf2fS4eU
	Dn36PFkwqy3rdUV6MGvKW7Yka4fnVyAzO000YHQu/M5JGwYJZX71BZxU4fY0Xgs6Pg70hZdSV5NvC
	ywaB6gUkuui/F6nw5A1w1f886fHwCPutR/ZbUnR1KIOZKW//fyOm3uLJCvfkjafbKPAJ/Znnnvi0p
	TqqLPTRdYw0lKM5qNvNV2ip6+6KjGlbo7Ocl9JxOl+KdooVmPB3jWcJr7h/14RQz27Wv+GZzruA26
	LbMFUA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcDH-00000002RpO-1uQd;
	Mon, 24 Mar 2025 07:27:11 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twc09-00000002Q3V-2eDQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:13:38 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so34121511fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742800416; x=1743405216; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HgmO3spMSV3ya0XSwKi8qyhViZcHQWh3KY5h+If7iMY=;
        b=clY9g5PzwZRZ2BIQYM8Nv/MCx3f/u+p2ey5aPvsAqpJDVZTW2l5pGOfb1HGFKapFkn
         djO4Xc472XxYHrA6g+iN6EjlnUfIJJ4K7sVhW33R9skD/kX8WcT7tEm/rEA479igN4bi
         ZSXwMGEI0/uHVuFPgQ4DM3x4nAEsXuMBHKVMAk0E4RnxNZUQd1FJkMyF0h58xNT3Pzeh
         xf2cIVErrGXLnPG0Pf9qM6L1czSrdBU7Dl/6ZcgK323iOKVYCIhZTjbi9yHV+NxRo8P4
         Ejv+KnvGBYJaXXfb+HpoKrhbLkYmiYE/+zo7UI5BD/RcjOODEXMnjxFzRVbpuZYvU0zA
         Qi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800416; x=1743405216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgmO3spMSV3ya0XSwKi8qyhViZcHQWh3KY5h+If7iMY=;
        b=tOFX0bXUYq0AvICseKeFujYIqd5UF92KuMYrMj2To3PJoEHozVuWXN6XvX/XsR5NiU
         ewEJ6Wtxb4FhPXeD01N5Rm87vlYkn0XdTYtgiqjCX6VS7jB/WnHSbfwpzc5DkoLKudf1
         7w/dcPDRlRpiI/7xW7mAK+TJ7MsIFB36MtNJWNF29eSf7uhMDphBgOmkEBISzE6fxPc7
         MlI2tNklANhnqPAaOD/Y6Yt0XYIRnqv0myiMOnIcL0KuQsvFmnb15m8k0xBObHom4lbc
         hE/R4RwmZXBWvaoBl3LvIM0Bop7ac5wsL3DYzsxz4VSK1gcIU+USEP34tDdlyoYHoUU4
         k39Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMzCzqK0VubWN+ecCF0sMOpE0NzRyHSWv2SXyr2XxM2YUkDGjUWS3AHB6X1h4wf0JxCk2GriQopQtgDgIrNbsa@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ4/rNBD4cfOwaUsgnt5jusx/DafWMviPkKwl7RqPJwQW7j5or
	ClTRf7j/fIiodHwmQn8mKjefqI+dZm9q0P7bO/ehtYK3ArCv510i
X-Gm-Gg: ASbGncsA6d7yFRqEPh3dF54l5Tb8EyHyFWcaoGYRvBfcDBaFz2fMGpTlat3DVmF3Nbc
	ipsTSYw35qG1XE9Neq/thZeM1zE42elJr9GcGTmAIacK5EKzsGIzCBIizH8nf683XBvyayP6yni
	3u9NzjN330p47EQS5LssgdqrtCA1xKySO3BiBqa3pQulPUSjIXegGmP81Ft+zwJSicv4ChgwWcB
	2GAKdgTyrhlausemU9kc+zQLpt3+ewZOacyofStU8cLw5kxeQrpMe3ykg32lMg8oCn+3FuvpcXv
	0LIlfh87U2fZmcKu02tHdZB79VNrZarH2478Om8NeG81NmNe+Fc=
X-Google-Smtp-Source: AGHT+IHvmMZhQ7UINc12GkdV/NNFv5twVruKqPihFFYmoT9ixDrjCc0MP+dwSTZVKrnR+Hoq28l74Q==
X-Received: by 2002:a2e:bc1d:0:b0:30c:2ff9:913f with SMTP id 38308e7fff4ca-30d7e202fcemr42821831fa.2.1742800415667;
        Mon, 24 Mar 2025 00:13:35 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d913196sm12558171fa.109.2025.03.24.00.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:13:33 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:13:28 +0200
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
Subject: [PATCH v10 5/8] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <e367a803c0d625e60c9fca16c55a25eee06b5a89.1742560649.git.mazziesaccount@gmail.com>
References: <cover.1742560649.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sLfxLgpI+RSOHiBu"
Content-Disposition: inline
In-Reply-To: <cover.1742560649.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_001337_671083_06DD2835 
X-CRM114-Status: GOOD (  24.52  )
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


--sLfxLgpI+RSOHiBu
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
2.49.0


--sLfxLgpI+RSOHiBu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfhBhgACgkQeFA3/03a
ocWpAQgAtegzSV9b1MqKbin6TsL4sVZQhZBySnTY3uMGX61W160CWt2mo5soZW3q
gIRhD6/UED57xk8uEGDMZBfhh82692r/hNo8n7xviFaLGyNsjUHwrfTUU3P4piiz
oiUFe1ouZy6Wr0HDDLiH3UVA4d7nVInoRRQwjS+JHEYAgAW9uSZdEPFO8Rttu8Zz
SEJlDv0S/7tNWcOd/se0xY9q/wWNVscGP5HKoTnLyuhM9o2FGMyj3v7pE726ZTf3
18s85OQuuADurNKaLCC27j7SngXG09vpxygdfYde4/kBUluLoywjGtnCmYWU2ROh
m+SKv/ht5dpPDhR2XQbpUEu/wT3hTQ==
=/T4m
-----END PGP SIGNATURE-----

--sLfxLgpI+RSOHiBu--

