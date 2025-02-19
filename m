Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D2FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/8lsdpKrVRGvDk8bdsIYhaiCtFIej4Yk5OWrIJakDc=; b=epA4cL8NBFi3Vx18uhAkNV9ULS
	Gw6MxmFoXwRLkv+UJRAQ7haiY6FxCxoRze34fzHY/vOFTyHMHlAtnV1JYpaWjVh+CQFHEhDM9MOWR
	4wb0eDo/cfys1kHopkRq1OpnJfEyHfOBxSSj38I4AyNDpGYvXNscYGtVcF3C4EM07tctNZXbC2Llx
	nVVo3kvjS6zCI6zLnUXUtwrKC1e3fjR1NSoCYmJzf35yK4Q19VvEFFyoNXLkbeHLh/UW2NzH2szmO
	keumK12Zs8pQ36ZEBFIYdgCSN25PeqF7LyXujdrDQNr4N0ZBjZHA5MDvZHn8JHPS4PfLn2wFDXYJI
	DNnPVInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjQR-0000000Cja8-3ItM;
	Wed, 19 Feb 2025 12:43:39 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjF8-0000000CgId-3moR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:32:00 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5452c2805bcso5435414e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968317; x=1740573117; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/8lsdpKrVRGvDk8bdsIYhaiCtFIej4Yk5OWrIJakDc=;
        b=gGl7nLsKuTvqIxstN2IJ4B55fYbisl4Q8udPCwveW/9GykHHwOumMzzp6Rekfo+E3s
         Y4A6+rAiGHkbWfNN1lN1MPM6tAiqFZ3MV8fEZ4HLQK2kwqp1U8ceeE2dx0ifRbtws2ck
         P5zRePpFZBM2Lka01icf0U13XTgFfyunTtdH3P98KEKY3egEkBGxKYKy00R3j4/MxZMj
         5ZoSeflzDccF2o2Z+3hV1smj05x0BgXAwXL+4rBaOdId/3tESd92r5+WIl17BE1GQmHm
         4IBHvzbB2VPqcq/g6u2VfxAT8wN4XZAaSFXRwppB1HnoSvcbGT6v6+4SEzkTuP8V8c28
         o31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968317; x=1740573117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/8lsdpKrVRGvDk8bdsIYhaiCtFIej4Yk5OWrIJakDc=;
        b=A97gzTREk3dFTYT87YYkvScb6gvwFO9nrvPa0dXcPCwOXKqIoad74YW7U0y0vpbXtB
         sRNeac7QmL79ngGGzE5idjrWdVvkAMj517w6DHZjowT5gf5fdTIOTtMImboqYTiNaBLT
         1obCBhEFSRQ/CD0Qr21Dixz/y5jSP4Cqr5ZdY9npq/ssjeWaNYo+62cBIqcddU1HzfQG
         r/L4kFHfD7j0B/EDrXDxg08IjhIO9RA7uC+TNxmXhudGTfRfEbkhcWKjEyg96z136lw5
         eNz4iZwrtIo0DZOOqmlf5vQKn99O7grs1bmkrq7NNJI5h/ByCTHFGvU1vh8wkl7yXoE4
         QlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0iFZ5sXc3GlUt8PREI9Iq9BqR2cT9pzY5m3uQ9sibtYRJNjoOaGHtrzIK5CfyDtUKb4EibzX94VrINYQ3t+yj@lists.infradead.org
X-Gm-Message-State: AOJu0YznB8FGNpJ7r5iFs7fLT3GdZkQDl/VX48Wg8IkczWFgvHkmVvwH
	PGxj0xMdpFlk+vxPhKjwUJTf3RLS9NK8VC3pZaHHh0VavuN9yNXa
X-Gm-Gg: ASbGncuBkHxICtqallJXxh4Imf9+dAUtODTs1ZoTYLL3rNVIRnJ6cWY0gGnqd1OKiGG
	C4MHR2107BAWtn7BK1GsKOmWZha4CrcMCNGE9rSXxJv3IcPC4eoSX8gy049pPhGsUw6KyfXdqBA
	6mrPRdOI1IpFCGuV0iKzkEkqgsLQriIgm5XifhgPxkGEgu6zOMwDnzOcopRqx8B6/75giCbank4
	LKivET2GEWVRifDUmsVPyuJ3DMH5mcGqbgnoB4BhrXCmI9wVpq90oEg5fGkNTZsv/s7RfklFMVP
	5dv2PbTId/KLBmlbKqKtJg==
X-Google-Smtp-Source: AGHT+IHxBzOtMjJ6R20Hyns4SI3S/h1XqzVvWjCS9fdPX3gfnk60+xs7fGA4Wr7UNOkuWHPHq9EJQw==
X-Received: by 2002:a05:6512:1286:b0:545:2950:5360 with SMTP id 2adb3069b0e04-5452fe570a5mr6750403e87.22.1739968316988;
        Wed, 19 Feb 2025 04:31:56 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461db6474bsm1137730e87.58.2025.02.19.04.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:31:56 -0800 (PST)
Date: Wed, 19 Feb 2025 14:31:51 +0200
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
Subject: [PATCH v3 7/9] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <21b9af362b64a1d9c2a13cc46242dd6955996c46.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s1x8TMYhsB4jne8Z"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_043158_942818_DF01CCF5 
X-CRM114-Status: GOOD (  20.85  )
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


--s1x8TMYhsB4jne8Z
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
child nodes. Quick grep from arch/* with the sun20i-gpadc's compatible
string didn't reveal any in-tree .dts with channel nodes named
othervice. Also, same grep shows all the in-tree .dts seem to have
channel IDs between 0..num of channels.

Use the new helper.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
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
 drivers/iio/adc/sun20i-gpadc-iio.c | 42 ++++++++++++++----------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gp=
adc-iio.c
index 136b8d9c294f..36d48d95f029 100644
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
@@ -149,37 +150,32 @@ static void sun20i_gpadc_reset_assert(void *data)
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
+static const struct iio_adc_props sun20i_gpadc_chan_props =3D {
+	.required =3D IIO_ADC_CHAN_PROP_TYPE_REG,
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
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo(dev,
+					&sun20i_gpadc_chan_template, &channels,
+					&sun20i_gpadc_chan_props);
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
--=20
2.48.1


--s1x8TMYhsB4jne8Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1zzcACgkQeFA3/03a
ocVCEQf/apaKkLHlAvNzeV+JKHo6yZDGv6rn7zx2MXDtaPiound3ykKHcgPY498P
38ikuU9ndRbuvC8VnJgdM3Zl1/A2LwH4Oucpkf8YfLiOg0lhowQdvdENcvbDGGX2
55HgTmhlDc/ZalxeQw+BskM+IMTdXdc038K9MiwtpghKgqRCpSc42+qlLlf+PKOV
OmHPs56Ieg7eljc1b/BtnXQLsoEIV9c4G4TmD0RZ2HweNAcoIKgJDGgfj9HsISUf
0A0Py6UOsR5makm7tLhBfAzDd+qhixmrtt2tZZYSIF7h9mnMd7S4+CtJMWdAj4fG
PQSvCuR17XsboEperUGS7DRuGu4tuA==
=t+wj
-----END PGP SIGNATURE-----

--s1x8TMYhsB4jne8Z--

