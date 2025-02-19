Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0732FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWwxIm6ZCjF1USQojkSFaiOLUy9epdYG89n1EjgogqY=; b=AB8kG209jMXJzO+5viG397wijX
	I5mhKZllD9Sj1nAgZEIOOTJEnSC2MGJEH92tfhY3ar0ph+q48x6nEHrIva0AgEYU61kaGZbmPhn+6
	FeAhAe8rILtYjjf9YNAlgxxdcGt0rwdeliWJlK3XJvuWg8OljOB6+LVOTEYu9yBv/fN0qlRsP750e
	Hxbnx6Q3CeHKczNXy4tt97zlzSuTwIcTED+TLRFuiE8U+ImpR3YowfXbakuqV4MOHYTbshVAVCoA/
	kXIKW+JUBiVJgZnieOBz1HljTU3RFMj7FHmQaY4ZbSezvNS7oo+v+5I/n6RUofp8hjXXAtYpU5Mqz
	/sAINAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjNY-0000000Ciqd-0ZFF;
	Wed, 19 Feb 2025 12:40:40 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjEu-0000000CgA1-2ajr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:31:45 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54527a7270eso5222440e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968303; x=1740573103; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWwxIm6ZCjF1USQojkSFaiOLUy9epdYG89n1EjgogqY=;
        b=XzTtZDrOmCBO19O+THvu0ShUjFCc0AErtxRQDdfeOpdKlrcq9OKSrVEDOjvc9t9FTC
         MVGDjAgYoOnylltoKd0S3lHM+AGLvkfCUwgWtBr70gkViT2HPF7Jgn29MJjuhrWIRtvK
         GqN7a4qga/DrwwgR/hLliHs7p4plcFHObN/+j/XV1xaYhG6TiWChjmfes2P6ASxDQISF
         UGta4iD8EPe2DBt3DS2nmEvpFdQPp+eVtOVubaHBfk0P6FDR1t4mZBD5qWNQvC5qnzLP
         syqf/5edK4pNexQiQz3/M/WBx+fPN5FVmDnkAf8KlqHFWS7Z4sWCbzXEU7o3BysEHDZ8
         oICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968303; x=1740573103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWwxIm6ZCjF1USQojkSFaiOLUy9epdYG89n1EjgogqY=;
        b=obTAnYcKJUsxTTZNIPjEd4+TwLlgpcP45UMGbcZsyY0BeFFVtoLgjsEU7maSDpRARL
         WFBb1Lks745/dM+MyBIeW1qH/BWVanNZeXL2/v37+a3ms+NPjjzrTQtPH1Gh7yujjbGH
         rbFMoPmnDbDEtlLyuDOntOEP66BpZoYiIBFF+aM4hq69Wu6/roJdPMTrhyceBHpJLKh4
         pTS2d76SPg403aE3qKQ9N89YX+AaQ4U3nDMc7La6JlUSN/HBG9yD0aOMRX0fXpLlZg8q
         CPaX1+3uAJD8XXsE+CNsDdkMg9vng48zqTk3hxMbwEPXuZFQOPsqzlH5X7KdpdxrcGtM
         a3vg==
X-Forwarded-Encrypted: i=1; AJvYcCVHIK8kWAW/Vvb09cxQa9GQ+xLkj47HQNr+fEUw/gk0fRMmMb8cD4ECmDsYwy5EOHtm5fjuTLNjr6djdFAoJHrO@lists.infradead.org
X-Gm-Message-State: AOJu0Yylx5t2wAbXo1F1ZOlLGTiBJajBzgrvLscVIGaEBsqGrncPrl4b
	MsOs7QfGy7xrIGzJhNR8gGYmrtAHYRXlelLFAVW5yCGTXfse/AN/
X-Gm-Gg: ASbGncu7uckI+2ykliRvMXtQbRs3/y4Me2vVUOEdCRiKqQDnOgDWP4LE8ckBr5vx+8P
	7frEhP6lErV/zqdOUo+3jqYvi1Vowl/epbbk0clFIfSviZLCjCNc8FlQDPX7pfCUjH/OMFkf1Pp
	G2t/pm+xAWpWtxAtOdihJgXa+jdDf28r9TLP0nW+77JbvYRCj7tWv7lNUl6pztBg0DoPF9oH+80
	axuQsnzbECUF5JWd0O6+2dUHVd4etKAYupQ8VR+uPNRnfcgM1V1uMJnFkCWeG40OR3Eu9MhH7pD
	kI0/TCl2scJ1bb/Zh+JmjQ==
X-Google-Smtp-Source: AGHT+IG3W//1SoXeekfyezOA2c+1vtKbVddXk84fyMfPvHE7Xk/Tk638LkqZRnBlykN65C1+4lMkfQ==
X-Received: by 2002:a19:2d11:0:b0:546:27f0:21a7 with SMTP id 2adb3069b0e04-54627f02773mr3187290e87.49.1739968302667;
        Wed, 19 Feb 2025 04:31:42 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5453961f67fsm1390216e87.23.2025.02.19.04.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:31:41 -0800 (PST)
Date: Wed, 19 Feb 2025 14:31:38 +0200
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
Subject: [PATCH v3 6/9] iio: adc: rzg2l_adc: Use adc-helpers
Message-ID: <25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5nSFiMwsXV6h6VCl"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_043144_666077_013BAD57 
X-CRM114-Status: GOOD (  22.88  )
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


--5nSFiMwsXV6h6VCl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
drivers avoid open-coding the for_each_node -loop for getting the
channel IDs. The helper provides standard way to detect the ADC channel
nodes (by the node name), and a standard way to convert the "reg",
"diff-channels", "single-channel" and the "common-mode-channel" to
channel identification numbers used in the struct iio_chan_spec.
Furthermore, the helper checks the ID is in range of 0 ... num-channels.

The original driver treated all found child nodes as channel nodes. The
new helper requires channel nodes to be named channel[@N]. This should
help avoid problems with devices which may contain also other but ADC
child nodes. Quick grep from arch/* with the rzg2l_adc's compatible
string didn't reveal any in-tree .dts with channel nodes named
othervice. Also, same grep shows all the .dts seem to have channel IDs
between 0..num of channels.

Use the new helper.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v2 =3D> v3:
 - New patch

I picked the rzg2l_adc in this series because it has a straightforward
approach for populating the struct iio_chan_spec. Only other member
in the stuct besides the .channel, which can't use a 'template' -data,
is the .datasheet_name. This makes the rzg2l_adc well suited for example
user of this new helper. I hope this patch helps to evaluate whether these
helpers are worth the hassle.

The change is compile tested only!! Testing before applying is highly
appreciated (as always!).
---
 drivers/iio/adc/rzg2l_adc.c | 41 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index cd3a7e46ea53..3e1c74019785 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/iio/adc-helpers.h>
 #include <linux/iio/iio.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -299,20 +300,34 @@ static irqreturn_t rzg2l_adc_isr(int irq, void *dev_i=
d)
 	return IRQ_HANDLED;
 }
=20
+static const struct iio_chan_spec rzg2l_adc_chan_template =3D {
+	.type =3D IIO_VOLTAGE,
+	.indexed =3D 1,
+	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
+};
+
+static const struct iio_adc_props rzg2l_adc_chan_props =3D {
+	.required =3D IIO_ADC_CHAN_PROP_TYPE_REG,
+};
+
 static int rzg2l_adc_parse_properties(struct platform_device *pdev, struct=
 rzg2l_adc *adc)
 {
 	struct iio_chan_spec *chan_array;
 	struct rzg2l_adc_data *data;
-	unsigned int channel;
 	int num_channels;
-	int ret;
 	u8 i;
=20
 	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
=20
-	num_channels =3D device_get_child_node_count(&pdev->dev);
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo(&pdev->dev,
+					&rzg2l_adc_chan_template, &chan_array,
+					&rzg2l_adc_chan_props);
+
+	if (num_channels < 0)
+		return num_channels;
+
 	if (!num_channels) {
 		dev_err(&pdev->dev, "no channel children\n");
 		return -ENODEV;
@@ -323,26 +338,10 @@ static int rzg2l_adc_parse_properties(struct platform=
_device *pdev, struct rzg2l
 		return -EINVAL;
 	}
=20
-	chan_array =3D devm_kcalloc(&pdev->dev, num_channels, sizeof(*chan_array),
-				  GFP_KERNEL);
-	if (!chan_array)
-		return -ENOMEM;
-
-	i =3D 0;
-	device_for_each_child_node_scoped(&pdev->dev, fwnode) {
-		ret =3D fwnode_property_read_u32(fwnode, "reg", &channel);
-		if (ret)
-			return ret;
-
-		if (channel >=3D RZG2L_ADC_MAX_CHANNELS)
-			return -EINVAL;
+	for (i =3D 0; i < num_channels; i++) {
+		int channel =3D chan_array[i].channel;
=20
-		chan_array[i].type =3D IIO_VOLTAGE;
-		chan_array[i].indexed =3D 1;
-		chan_array[i].channel =3D channel;
-		chan_array[i].info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW);
 		chan_array[i].datasheet_name =3D rzg2l_adc_channel_name[channel];
-		i++;
 	}
=20
 	data->num_channels =3D num_channels;
--=20
2.48.1


--5nSFiMwsXV6h6VCl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1zyoACgkQeFA3/03a
ocWHCAf/YmLAVSPgwswmrRWqz/6pjhuv610FR5ij5LBJpCnqYRyZLarfrvl9wcqv
TTCcYhjdCPhVOu80WT2YqFubquPgz8f4oduQ1juw0tGKZfO7LZzCI2TXimej97mF
lmEtgVU4ld3GPb2IXHXd18ywltxMLYPZoLBohejO33QpC2hBnWmVDJL/Fg8qqHZx
5BnbVgaXBeoOoi2VC0qcwDn83R8v/3zayOOCdHOb/6af+qCZmPsiCquF7UrYzarK
MWIM3P+ia0B+pFsb4DqDSuMyizM2Atff65RtQAw5WMkEqjIqeMKGcnAkFb4FBjGJ
G7kQtilO1w5CkblgWsYKAGUBxfFw+w==
=VttU
-----END PGP SIGNATURE-----

--5nSFiMwsXV6h6VCl--

