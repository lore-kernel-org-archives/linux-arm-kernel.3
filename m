Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82A0C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvlmIYXxPFwsgRKDsD0xfbB0Kf2m77owf2uPI4W2MCQ=; b=QPrUXeflsHtE+jbokn6h7o1E32
	s9WFVwzAbbPal2/2/slitcwQsJ2JS2G8uqWki4dFU7n2Wwjoml2x9wOhFc6ybM8hoHNQE0CCCfcBw
	0jVTZ78wNY/sFbIUTA81adge0CBoNS2ZgiVuBP7zvzNmT4fZeSVVr5YbSXk68Lu1LwOx4Y+/mjyLK
	QTU0P4oLtaT2YmwBlD3Fi+INevBepDBhGuYQSb7ciSLVYiZDrhXNSPNXYAB0hpFIfNGhWuyJN3iv7
	IwNlblz2xPdhQWlCJFmfAxXrXgf0NJ1NBb2+7gR/fM8tqKXWdms4oPgSXjkFMdBzImWWI14r9BPHg
	/cI7nMNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdbZ-00000002rOx-2AIO;
	Mon, 10 Mar 2025 13:55:41 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcg7-00000002hap-0dMh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:56:20 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54943bb8006so4697532e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 05:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611377; x=1742216177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pvlmIYXxPFwsgRKDsD0xfbB0Kf2m77owf2uPI4W2MCQ=;
        b=jXn84ykBSJGgO1qDGDfZMS6J40l3Fy+TSEKYcTvdi6U/GepNDReugaeBNSxwxTCchZ
         kU2LEvhIPydTeZKFOZ+Vf+ME14i8gIjgRKF90OAs3QLFxRUK17874fDnUy5fTNlRMPXn
         30ouxfmUNWi9Wl0GWstxvOB0NLQA7aQFrzey4PoaZFknQsqIh5B0hmP4zIP3DAXd2Mr9
         IjlPCUyq4z879ixyuOHUvYdRr7U16icf/qmRIZqMxFhr0wm+jViiEF3B70p5zLP6wsWR
         oY7ZuWwAcwLE5H8IS1TWiXvNOZOgTLm/6mcMyv7gzcjAF4oWMXzrQz2jQxn7C5sLq1rT
         RicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611377; x=1742216177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvlmIYXxPFwsgRKDsD0xfbB0Kf2m77owf2uPI4W2MCQ=;
        b=vVJbOrm2KxEB1Vqd6o5TgXdnYsOwwdjumdx68IC+1+lXlP2SnHe0bx5NhMZuUx5ayM
         rZh5e1DuEGlujZfSTl70DrOPm5Xi7Txdt1illJUjN8Q4UZFqn0JKi05hd8WFi5YA8468
         ejAie4/UIEbrZySx2vfqbeii4AoLqYrXzMFoiO8vv+cUg6/p/lCjE6pVV4yOqrieTWmq
         kz2dmYvwPG1YiNVbGhJ6vUdL4q2Q228vjvdbnHM4JQJNgXwizVMjfVm/dFxZseOvyECr
         fkrLr5lDmG71yBOoB0ssswvIvq1PUxgOSv8sCZkpXiw1w2HDYf3t42RC4Vq5+1XyGLiM
         /5Sg==
X-Forwarded-Encrypted: i=1; AJvYcCX78jT+KMARZ9dlSzr+Sk+jmsO2Kyz0o89Qf9uJ8gMh8VWrUG34h5NT5BHsfOzruhTmJp0Aye8CgwwkH+KyAYLR@lists.infradead.org
X-Gm-Message-State: AOJu0YyMhfxXTDPFXKC8Tl08P3TeUq4/UKuTPLCrNv9ZgzrU1JVkzPqI
	sylrKtvXOz/IfJjG5gMl6OuirN5GgbcFUsIgbYzfs8WSX8B8d1cF
X-Gm-Gg: ASbGncuPfjFmWhCk8L60RUMsgS2tXHFuPTkkamo4F8nTYA/S62GTWjly7l/XCDueg/q
	La49zIL22n7jrN74ur775PcLuueH7kLtaJib5KEMSrn5+ertOOYazEpzH0mvkM8WbTgRVs2nCPr
	dDWLtoPOSVfKa4KVTjFfXLTpiuQTk79t9tdXpUy3WC9cJ22kEYJwwbdZS/SUWN71PddMHL1hlta
	mhsSuTKW3s5FjBKQOm+OiAF12Va0EpVe8mMMfNaCRXOly5+Ct34/LwlYqrfSOlY/wbduCAjoELc
	ZvcFTXzL3tjjQhCIMr/Y+5zdGi/gPCwLIil0wIcKvos5K7N2y7M=
X-Google-Smtp-Source: AGHT+IGu/NN+//EpU7CYFukNrNlPLiWHT6UQmiVwqBJ4NNs9fZZiJnlH6BOdww1vKwf1TPdeJLv8dQ==
X-Received: by 2002:a05:6512:2342:b0:549:4de9:22df with SMTP id 2adb3069b0e04-54990da2057mr4566087e87.0.1741611376948;
        Mon, 10 Mar 2025 05:56:16 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd0a0sm1446345e87.156.2025.03.10.05.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:56:15 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:56:11 +0200
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
Subject: [PATCH v6 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <c9654fcda1c5c8ac98f99ec8e3babdc41cbcb67b.1741610847.git.mazziesaccount@gmail.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yVy/56adD+Q+P3oK"
Content-Disposition: inline
In-Reply-To: <cover.1741610847.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_055619_204985_CFB0D5F1 
X-CRM114-Status: GOOD (  29.16  )
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


--yVy/56adD+Q+P3oK
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


--yVy/56adD+Q+P3oK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfO4WsACgkQeFA3/03a
ocWgMAf/Z7NNUkKEm27TxKxy95umeEJ8mGVEzQvcolALVtVjQGUQhbAquYTy8CMT
5iCmkYMhuQXmyT0mgTchgVnBNYp2VTVk1TG1wmHGJK8RpUE58dPUABJ0JaCE214O
dQGwY0ZsqzDDZ4c2R0PWK8xkyADVmJ38wNgXq5RpMfbIySJxrFTQ8htVtsUhE53D
j48glktNZO/q+arIJpBPdJD2GT3zwnEIH4klKmslDalfc+ZS6sjCOcDUVMLSUoG7
CNWWthtxWCW1AN4kPzbBeS2Iqj4gySStD0k5cpb03axvwYEsyx/gCY6r3TyCP+fe
DVllR9bFrZ3T2mdjcHCP4Idz2i3buw==
=YVij
-----END PGP SIGNATURE-----

--yVy/56adD+Q+P3oK--

