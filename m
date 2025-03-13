Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7F4C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBGWyI2KhlGLTlExLjTIG8zzVp+t1U4InfDr+/tp5Go=; b=AeDhkNI0gJqDCPt5IKAJmT9gpR
	iaevX5OLKklH8JD6td5K7+cSSCaLPCwDhel6k4b9x+pcAWIHsefszpoVJy8cLy9cDRzcH77IvTODH
	DYm25RYP5KK7ckn9x1qt3g73cHrwywEreOYQnzF3MssOQHcozt0sDRm3qrwhH4nfxkdvW4P7zgJmR
	thSdpI1OjY39rNzDFchpnQovCkVBv2zKlohnA+xayOj0CgDMN9Cn11n8Bzt+vAb2AIub5B0UEKDQX
	xQ7MtCB1Y+gBqyH6s1CVc8ozIjH7tOwTXGYpTS9MHBwyg8cqt1CM6W0FtksDDLWx3fjS6phrWkIDn
	ovX7828Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdAm-0000000APDH-1Yox;
	Thu, 13 Mar 2025 07:40:08 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tscpn-0000000AKs5-1zjH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 07:18:28 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54996d30bfbso526141e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 00:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741850306; x=1742455106; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBGWyI2KhlGLTlExLjTIG8zzVp+t1U4InfDr+/tp5Go=;
        b=US5OI/d++9sQNXgsNHE+ONQWc+eldqoQPOhu/R2h6moweiphkwg3sWrz7sb+xPJlkk
         euqaw7zoEtd5vK6+f1Kwz7iqchfGUboBxfeMpzLV4GVzyAG3BTF9LSxzYQnGwHs9G7Ns
         km6HhUHuv5eCWQYISZF3rNiG6pk2AjOP0ke2iTKD29PFStS25LYpcpDdFfAzzwv2DO4W
         LFGBXNwGR8885BELf0qPa12wFVquXfmmk/6s9sOpMPimy1/z6RO6x+/l7VVHn1cIg+bj
         DA6BHADmY/M59y7v+5gfGxxVuNtnymB6VBELFs2H1DHOdxHDqCpTy1jDAaZkKxMpJAl7
         /QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741850306; x=1742455106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBGWyI2KhlGLTlExLjTIG8zzVp+t1U4InfDr+/tp5Go=;
        b=CHPzGBifk4n/GskpNV9XiplUETdEC7fgLiBf1PntfpG5p/qmKhrrnPYT7jI7IExLRC
         dveOM09hZoOw9Ujgcwiwb8fwP3mJAHHLbEFgYuDgmPFiy8JOkngFaItqrVawUosZjAZz
         PzHycHwKpJIxPFi7e/dSkzuVfWnueVRpUQuLaxdZSXBv3AoP0xWJ7Rq22DQnjRfshMGy
         Ru42BMcY/jlmEGW14/tl8Ibc3XVp7qDXmPTmUKSq1RssgWjkEJ1XOoESu9qKbvPgE+xz
         lR9B7TaRuD1wL6yFdfywcMnikoXIV0rpvFljS2B1s9EFYDyOcpurxz7p9An+liZXGkZ9
         Auww==
X-Forwarded-Encrypted: i=1; AJvYcCUMESkmSpKZOyFxPyc8dCP51VuCgQHtn+26/Mkfle6/60u0bPs0rFrrv08NYBSswu0PBxNoS8u9nF46MLj+k+kg@lists.infradead.org
X-Gm-Message-State: AOJu0YzCAoyF8kJG0nHk/Fom/gkBXApjpe1QMeaIAmUlr00AMKf7ZIdK
	KBr7HoiR6WEaPJO/Pp2PWtZTLS6OEqRKvrUnpT62w0qycV7r0QEy
X-Gm-Gg: ASbGncvD5X6PrO9ljYqA8+FGQzrnTz896AIShlTWYdkximMUxGwRcqlXM8GpFM2ADXC
	xi7xL/qKptW2Cc0ZHBuZS9iPLJFukW907A1j1bccCCUcAjvVyv88rOO+gMkQfteTvzE2Qin+IdC
	w6ua478VRkrKZRpqLoGkK+6NNUMqWbcfyS9Cw0Yt41Le5jcespSMz8D59yMy2IK7GlPZdIc/SCY
	lKFf/Lb0GH8v1eJHIdrioZ5zjIhXmrWIRUNQRbWm1nhc1BlA8lVTL1nIXzX1XBXvKtSY5nk9k0c
	mZabCroln7REZdZ+zozeREVlRsJdQmij3iFdyoD6muFJE+dQZ9Q=
X-Google-Smtp-Source: AGHT+IGP8h2FL/lCirDVHljxL5OfQTimB9tsLIQ+xH91borETZK6KwSphvw7DjFZLuCzX4cD5bzVZg==
X-Received: by 2002:ac2:4c46:0:b0:543:baa3:87ab with SMTP id 2adb3069b0e04-549910b7f23mr8760741e87.47.1741850305346;
        Thu, 13 Mar 2025 00:18:25 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c2677sm117486e87.95.2025.03.13.00.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 00:18:24 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:18:18 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
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
Subject: [PATCH v7 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <c8899e8c535a1d93cd7588b7c160eb0fae5d26d2.1741849323.git.mazziesaccount@gmail.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Map6KVD9/XFFO+4M"
Content-Disposition: inline
In-Reply-To: <cover.1741849323.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_001827_527535_733746CC 
X-CRM114-Status: GOOD (  29.04  )
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


--Map6KVD9/XFFO+4M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There are ADC ICs which may have some of the AIN pins usable for other
functions. These ICs may have some of the AIN pins wired so that they
should not be used for ADC.

(Preferred?) way for marking pins which can be used as ADC inputs is to
add corresponding channels@N nodes in the device tree as described in
the ADC binding yaml.

Add couple of helper functions which can be used to retrieve the channel
information from the device node.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v6 =3D>
 - No changes
v5 =3D> v6:
 - Adapt to changed fwnode helper names
 - Fix spelling
v4 =3D> v5:
 - Inline iio_adc_device_num_channels()
 - Fix Indenting function parameters
 - Combine the max channel ID checks.
v3 =3D> v4:
 - Drop diff-channel support
 - Drop iio_adc_device_channels_by_property()
 - Add IIO_DEVICE namespace
 - Move industrialio-adc.o to top of the Makefile
 - Some styling as suggested by Andy
 - Re-consider included headers
v2 =3D> v3: Mostly based on review comments by Jonathan
 - Support differential and single-ended channels
 - Rename iio_adc_device_get_channels() as
   iio_adc_device_channels_by_property()
 - Improve spelling
 - Drop support for cases where DT comes from parent device's node
 - Decrease loop indent by reverting node name check conditions
 - Don't set 'chan->indexed' by number of channels to keep the
   interface consistent no matter how many channels are connected.
 - Fix ID range check and related comment
RFC v1 =3D> v2:
 - New patch
---
 drivers/iio/adc/Kconfig            |  3 ++
 drivers/iio/adc/Makefile           |  2 +
 drivers/iio/adc/industrialio-adc.c | 79 ++++++++++++++++++++++++++++++
 include/linux/iio/adc-helpers.h    | 27 ++++++++++
 4 files changed, 111 insertions(+)
 create mode 100644 drivers/iio/adc/industrialio-adc.c
 create mode 100644 include/linux/iio/adc-helpers.h

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 849c90203071..37b70a65da6f 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -6,6 +6,9 @@
=20
 menu "Analog to digital converters"
=20
+config IIO_ADC_HELPER
+	tristate
+
 config AB8500_GPADC
 	bool "ST-Ericsson AB8500 GPADC driver"
 	depends on AB8500_CORE && REGULATOR_AB8500
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index ee19afba62b7..1c410f483029 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -3,6 +3,8 @@
 # Makefile for IIO ADC drivers
 #
=20
+obj-$(CONFIG_IIO_ADC_HELPER) +=3D industrialio-adc.o
+
 # When adding new entries keep the list in alphabetical order
 obj-$(CONFIG_AB8500_GPADC) +=3D ab8500-gpadc.o
 obj-$(CONFIG_AD_SIGMA_DELTA) +=3D ad_sigma_delta.o
diff --git a/drivers/iio/adc/industrialio-adc.c b/drivers/iio/adc/industria=
lio-adc.c
new file mode 100644
index 000000000000..6cfb001c74b9
--- /dev/null
+++ b/drivers/iio/adc/industrialio-adc.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Helpers for parsing common ADC information from a firmware node.
+ *
+ * Copyright (c) 2025 Matti Vaittinen <mazziesaccount@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/types.h>
+
+#include <linux/iio/adc-helpers.h>
+#include <linux/iio/iio.h>
+
+/**
+ * devm_iio_adc_device_alloc_chaninfo_se - allocate and fill iio_chan_spec=
 for ADC
+ *
+ * Scan the device node for single-ended ADC channel information. Channel =
ID is
+ * expected to be found from the "reg" property. Allocate and populate the
+ * iio_chan_spec structure corresponding to channels that are found. The m=
emory
+ * for iio_chan_spec structure will be freed upon device detach.
+ *
+ * @dev:		Pointer to the ADC device.
+ * @template:		Template iio_chan_spec from which the fields of all
+ *			found and allocated channels are initialized.
+ * @max_chan_id:	Maximum value of a channel ID. Use -1 if no checking
+ *			is required.
+ * @cs:			Location where pointer to allocated iio_chan_spec
+ *			should be stored.
+ *
+ * Return:	Number of found channels on success. Negative value to indicate
+ *		failure.
+ */
+int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
+					  const struct iio_chan_spec *template,
+					  int max_chan_id,
+					  struct iio_chan_spec **cs)
+{
+	struct iio_chan_spec *chan_array, *chan;
+	int num_chan =3D 0, ret;
+
+	num_chan =3D iio_adc_device_num_channels(dev);
+	if (num_chan < 1)
+		return num_chan;
+
+	chan_array =3D devm_kcalloc(dev, num_chan, sizeof(*chan_array),
+				  GFP_KERNEL);
+	if (!chan_array)
+		return -ENOMEM;
+
+	chan =3D &chan_array[0];
+
+	device_for_each_named_child_node_scoped(dev, child, "channel") {
+		u32 ch;
+
+		ret =3D fwnode_property_read_u32(child, "reg", &ch);
+		if (ret)
+			return ret;
+
+		if (max_chan_id !=3D -1 && ch > max_chan_id)
+			return -ERANGE;
+
+		*chan =3D *template;
+		chan->channel =3D ch;
+		chan++;
+	}
+
+	*cs =3D chan_array;
+
+	return num_chan;
+}
+EXPORT_SYMBOL_NS_GPL(devm_iio_adc_device_alloc_chaninfo_se, "IIO_DRIVER");
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Matti Vaittinen <mazziesaccount@gmail.com>");
+MODULE_DESCRIPTION("IIO ADC fwnode parsing helpers");
diff --git a/include/linux/iio/adc-helpers.h b/include/linux/iio/adc-helper=
s.h
new file mode 100644
index 000000000000..56b092a2a4c4
--- /dev/null
+++ b/include/linux/iio/adc-helpers.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * The industrial I/O ADC firmware property parsing helpers
+ *
+ * Copyright (c) 2025 Matti Vaittinen <mazziesaccount@gmail.com>
+ */
+
+#ifndef _INDUSTRIAL_IO_ADC_HELPERS_H_
+#define _INDUSTRIAL_IO_ADC_HELPERS_H_
+
+#include <linux/property.h>
+
+struct device;
+struct iio_chan_spec;
+
+static inline int iio_adc_device_num_channels(struct device *dev)
+{
+	return device_get_named_child_node_count(dev, "channel");
+}
+
+int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
+					  const struct iio_chan_spec *template,
+					  int max_chan_id,
+					  struct iio_chan_spec **cs);
+
+#endif /* _INDUSTRIAL_IO_ADC_HELPERS_H_ */
--=20
2.48.1


--Map6KVD9/XFFO+4M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfShroACgkQeFA3/03a
ocXYzgf5AbYotx5dtqF9n2zXC4MOYVTwMuhhofkA8MBZgqF5L8mJgFQ6MmmxxQC3
zfOXxIhNGaW6aVj2FwTJOcG0/+5bRtunmE6ZvNxvFcE9KEtWGR7bt2qSvwuS1GJB
ZpIZauIUQzmHWt+09SxE++PV35pOGVvcdqFx/hqUURkSUSxl3R62GfdP7mVFJuRr
Bejq2uNVVr9uBpmEexUcDceDVC0PRbQyBL27ZTXl7RwiU2TSSLNWMkvhA9/0vzKP
ErMXITzLcLXToJtXw42YhDViJGJ4JTNC5jmIFSANMlKwlUcraxOzjkuEemCwPZ0b
PShKC3WCJ+Vw9h0iOVbRKHwzdNO+rw==
=naSV
-----END PGP SIGNATURE-----

--Map6KVD9/XFFO+4M--

