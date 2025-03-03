Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D94FC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jr7uWyzHUY99eCAGXzsJFETrGHISY9L/T3cghzdv3dw=; b=X4wD5EQKv9h4aJOalWxppcWd9Y
	WdjwnKOptzptJ5ciicjhhMInjmMGI83Ci0Ww0b3D1rvcWob1E9M3mmj/ioSQ+ZEX9/iWgvwciBPEH
	x+GwmZF0ey64K6pEoI2tValPISA4vvm6jrBOw3pvd6srVvQ6FwWMwD4RoEI2TbsCwkLf/UuCnDMQE
	ubEjgMzhtxl0sN85ggRDsNqnbt+AeZNGFci8esBIOlCpGg8f/gHB0VnD3QdUJsHkwR55F0W/VaklT
	G+xnLaayDotgDxorh1nlJ/S9cUnJh931zLOYTaiPgMKQuwPzBt86n80EIeHPfexvj50qlsDai7uvU
	Q/wzTuXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4mW-00000000iwx-2jNY;
	Mon, 03 Mar 2025 12:20:24 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp42p-00000000a0m-0Z33
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:33:12 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3072f8dc069so47325841fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 03:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741001589; x=1741606389; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jr7uWyzHUY99eCAGXzsJFETrGHISY9L/T3cghzdv3dw=;
        b=NFUcSKQFupoEkVzZetO1vg1yL57PKxVOldel+6csI494xkxtYL8+L21Jja2dSoArg0
         xghDKJjW1ZSAWyDq62hpO9DCPdwNUGpCYT83qRlMkB+GDfrqof1eqP+6ewjuXeXv2ZRf
         Q9gUgiXuY38uJnHMo61ex8Mla6s2ukSmRnX91bU/H/amu/cmRCSAo4ozPq8ge+IaJgtj
         Z1RAxsySuNQoIjYxkhP5ICLf1RVKKjQf8BPQIYBhZBW0tr+2zN6bgX97sqXDQ4sx/Z/E
         rnuciTAoCGjCfC7fdDZfcdmQEtPEj0LwpkPJcVoSeChZgfXBNq1Gb+3+rWmOwATmhe03
         i5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741001589; x=1741606389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jr7uWyzHUY99eCAGXzsJFETrGHISY9L/T3cghzdv3dw=;
        b=peAxfR9PzXTb9dMW3hnnfLBxcugSMbsdBUTxO8DcIY+jtzYcKoM/NR1PspU8Yf6GF3
         tuj8yqJtKdGgAGKkdMslrUg07YSRif3dEpjIitCNEi0EGV2uczznU2H0CU1QqkEFDX9a
         vOuol1TlPQWAJn+pq4S8d4UNkJWYAA/Ub/YDTsPC5vaoMWbTiDgfnY0SCcKeYk58Suq+
         9BPUYzSRPY39cvp3q5QEYeNHjpfHtdUfx2EQsT4iYvmZL0q6Q9FA6s262n/9SRdATNjg
         ZsLjoet+ndEaty7zuFSV0Q6/QH+ilGz3XHvBO5ck+06rB1jPbu0lkxo/mcJJZ3wMM4xe
         /Ggg==
X-Forwarded-Encrypted: i=1; AJvYcCV0tplCORKVA8qf8AFDEOR6GUy/1QXqGjsTyJpOkPM1dLHuyXnZJiQLw7eD8iP58FJSmAsYCOEPR1K3HtqBVQa2@lists.infradead.org
X-Gm-Message-State: AOJu0YyxGMrOMYSiJHn06912jz12ctxJC6AOiJgOEix0vb8z2zKd8OkO
	FqttZYL2rk4u8/dRzTg9oQYPfwdO7FhECdak6kdHPiyvlUWUTa8g
X-Gm-Gg: ASbGncur+bE/kaOBlgV9p2cfw0T0ox5fOeFLUoh5sjDO6IeVJd1I8/3v2/FjOKiffcV
	WkJ3sM6hX39jn3kXQh63bG4fqfhVjc/K1XafldP37wml5e2uRxBdDyrYKXPL15n8wrMxNtiJfAi
	MHCGQh57A7E/3+HDRuWfmrjm5MOhFnoHJFrm8yL04+cuQvs1sIWku23Gk0rpvDNRFYqui2VlwJp
	NqE+XCsY3TNQRZOQWJ4Y0ogDQf/rAvl+RY8kCVE49n0Ydc8/CslgdM79Ns7AGuUlbbMrp/ctyCx
	eRX3uefydN9VZZJvjg64ADXKjoe0L6l2Amvfmo5v7DXrKjBJN4h3DnjC4DAsFoMs2868MdKDzBQ
	Dr4yMRdaUvd8=
X-Google-Smtp-Source: AGHT+IGzOR5aUmDt+a/MXoTy+5OLlJ65L1UVO+lQK86VsDtTaAuu0JJFF79k+4B/QbjhjBDZ83bKrA==
X-Received: by 2002:a05:6512:398e:b0:545:3031:40aa with SMTP id 2adb3069b0e04-5494c129d52mr4959258e87.9.1741001588885;
        Mon, 03 Mar 2025 03:33:08 -0800 (PST)
Received: from mva-rohm (mobile-access-2e8451-125.dhcp.inet.fi. [46.132.81.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494ab017d0sm1112555e87.84.2025.03.03.03.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:33:07 -0800 (PST)
Date: Mon, 3 Mar 2025 13:33:02 +0200
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
Subject: [PATCH v5 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <aabd8836dbe54ef54730d1cd112edb52a57cd353.1740993491.git.mazziesaccount@gmail.com>
References: <cover.1740993491.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H68W2IZGPpj37wy+"
Content-Disposition: inline
In-Reply-To: <cover.1740993491.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_033311_173742_FAA02318 
X-CRM114-Status: GOOD (  22.54  )
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


--H68W2IZGPpj37wy+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
drivers avoid open-coding the for_each_node -loop for getting the
channel IDs. The helper provides standard way to detect the ADC channel
nodes (by the node name), and a standard way to convert the "reg"
-propereties to channel identification numbers, used in the struct
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


--H68W2IZGPpj37wy+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfFk24ACgkQeFA3/03a
ocW3swgAxdspJKGNebP1wZLtgdUEjveykgvwtguklkaV129G98UZsW3m94ma/8m8
qTIwg6fC53R3rsy0PgoGQA0rzgCLxLs5SyU7dJ9VBP0rtd/W1QuLjlB2lSWWQ0VZ
iHEMHTpXN0UECsPhnjdx2AkIV9OhXogF1lUE5SPWmFBwNMqTMN9kuyNmlN3oyi22
TE/xmHUroVD1hbsnX5LaMIWNC52jrANcg2/fxs6gnXbHvRnlAjxU/07S1p2YEhaF
NB0fjePrXCd1vcb7wlozyiQxfZzRqH+qtkExmCstmeb+TgLHTokJUZu0JlUmSt91
L0Chh63By3LN3Z0zGlOnGIyhf5FcwA==
=Wlf0
-----END PGP SIGNATURE-----

--H68W2IZGPpj37wy+--

