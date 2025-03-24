Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D985C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ozanmv/QqYBgGPCgM2crebgxBT9NUAtaVOJ4kP5Qos=; b=4A6bl05iTdwsmnumcnSVL8Gd7F
	P9bVVsWxnpXeCRhhWfzZf7tG9N3D3S65T6IwvD7/alauovXoMvoMHPeimmxQ5yAsqhxTyjPB+BdQK
	yK4MJ5OM2A043PZsXt1wO4uHH/da6yzm7K6oDwG/7i0WhOQ67WKOPMAp3zEzzaauB/06MnlmRZ6M9
	lmD1fcUOtyYvQS0or5d2pqY7Y92Tj08SG7SIo6b8W1iQDPdXqUV8urcS0mPHfXTsFd9zqpV1trC+e
	5mi/K5JDs0a99oibMxQaXkavV/vX9sIgqx66FYutlX+CzGPL+VzNCGJZyrfM0ldGXt/75zmw405Iy
	oyCeOq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcBZ-00000002Rdc-3672;
	Mon, 24 Mar 2025 07:25:25 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbzj-00000002Pw1-3ETJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:13:12 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5499d2134e8so4935959e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742800390; x=1743405190; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ozanmv/QqYBgGPCgM2crebgxBT9NUAtaVOJ4kP5Qos=;
        b=BVo0lIGWlRty2HnFOI2hH5oqokTw/jHXnfA8YuHhQfE0xTQcGCe5fIL5xF/rZd+n95
         JMwPB01LEoVCNTbIehNFowEB5EnmxAXICuewfhGZiL/PGdkyMzDjMKxc7xzlNhVVWote
         0ZVAmXHN2NYqukiW71kKOWCP/CrEShuXBSGTmP3Rtom7ICa0w3CQbV+9/gHnK2iR13LX
         b/r5j41Ameoeb8n+PW7QpgymAL1caMwfynvqy4ykhaFFv/Zl0bDevLdFqI7viNB9TkVU
         8zGFZ2aPTkyidHPXCDT7npZdjsLArqMwR1FcX+Ykrqnu53pLnhZ9GQTHE71RBhcmBQti
         wgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800390; x=1743405190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ozanmv/QqYBgGPCgM2crebgxBT9NUAtaVOJ4kP5Qos=;
        b=vip7qB+kmcPxzhP+rpJMbaxYs3lz/TkF6TlEpWc5T9shfIDjuak2PNAJUm8ObptJaY
         c8qeaK4/cBTbNnbI2xt0kqJuSoeajv6W7DhEg7jO4g6Un25eDL9Ru6GfWfVHEsQTHRCg
         o/Awdno+ZvibgI9r+waabuZB0yGfjN47cq7J5C7CYr4TBbhi3ODKFxbmlVDi/rZG32z3
         RmonmUKrH9AbZ6D6OJMzBEFEw6+pqWa1KrO8syrvbqdZIFzbRtoAixBpKvdjY911qiOZ
         Pp4XPb49rg+ZbPnZxZZ9BgxtPu1lGQchjjOU0RI7cbhS3nnz78iBngsehzN0DqK3gJiN
         eGhg==
X-Forwarded-Encrypted: i=1; AJvYcCX128IFKd/ztMg+1ro5oyZklzXhRXaVsglEKyFLWgGXRTj9kiPkhDK72bdCcuXejgc5GJceCWAPbfhho+L312tE@lists.infradead.org
X-Gm-Message-State: AOJu0YxVmHG652UV8QGp1QW6C5ANSm90/hDA9abGrzGttjs+v8idg+Cu
	gkloQkEZA9aWgWzJAhUcZValP5vS34P5j4JJo5hhWTfOb05qpiH6
X-Gm-Gg: ASbGncthhzakitc32x1TS3iXb2EraeZJFcgDsMdx8ApCAvuI34Hz6HknJZgi0ykBMBj
	aHDHOGLT4dOh8PUJJdd7TtdrYsdG5I9x7jRqCSIP1S5h2cKzaLzXCcx3VvHMPDawomQk5wir3SD
	gmVcnz4kM6Wi8fsiE8JZc/AijvjEp2Rsb96c9vGQiu+hsyxMOKLGtt0bu5J9h/pJg+krHGRJnyg
	fSYoXhDSPQxh3d9YHE8tPqT+9hElxHAyBtXt/DwhHGea9BqsRqoASdKPm5OKLvPRAX6xY2zuML6
	x3iVwpD+fwD62nBXdOLOcIE6xIfuChjazagBxf+ohcFT6He4qXo=
X-Google-Smtp-Source: AGHT+IEyGZx7uvcqc+LiYB4BDlalqv4N/7ztabAEMx6CrAGNkPjAjUIgTEKN8x5EkF3GXgji3nzWBA==
X-Received: by 2002:a05:6512:6c4:b0:549:8e5e:9d8e with SMTP id 2adb3069b0e04-54ad63fc0e6mr4283316e87.0.1742800389666;
        Mon, 24 Mar 2025 00:13:09 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6508252sm1046478e87.179.2025.03.24.00.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:13:08 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:13:03 +0200
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
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
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
Subject: [PATCH v10 3/8] iio: adc: add helpers for parsing ADC nodes
Message-ID: <f1d8b3e15237947738912c0d297b3e1e21d8b03e.1742560649.git.mazziesaccount@gmail.com>
References: <cover.1742560649.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZzLqSZ9m2D84frF1"
Content-Disposition: inline
In-Reply-To: <cover.1742560649.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_001311_818550_8A25B4C6 
X-CRM114-Status: GOOD (  28.56  )
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


--ZzLqSZ9m2D84frF1
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
Revision history:
v8 =3D>
 - No changes
v7 =3D> v8:
 devm_iio_adc_device_alloc_chaninfo_se():
 - Treat all negative values for the max ID as 'don't care'
 - Return -ENOENT instead of '0' if no channels were found.
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
 drivers/iio/adc/industrialio-adc.c | 82 ++++++++++++++++++++++++++++++
 include/linux/iio/adc-helpers.h    | 27 ++++++++++
 4 files changed, 114 insertions(+)
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
index 000000000000..b4057230e749
--- /dev/null
+++ b/drivers/iio/adc/industrialio-adc.c
@@ -0,0 +1,82 @@
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
+ * @max_chan_id:	Maximum value of a channel ID. Use negative value if no
+ *			checking is required.
+ * @cs:			Location where pointer to allocated iio_chan_spec
+ *			should be stored.
+ *
+ * Return:	Number of found channels on success. Negative value to indicate
+ *		failure. Specifically, -ENOENT if no channel nodes were found.
+ */
+int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
+					  const struct iio_chan_spec *template,
+					  int max_chan_id,
+					  struct iio_chan_spec **cs)
+{
+	struct iio_chan_spec *chan_array, *chan;
+	int num_chan, ret;
+
+	num_chan =3D iio_adc_device_num_channels(dev);
+	if (num_chan < 0)
+		return num_chan;
+
+	if (!num_chan)
+		return -ENOENT;
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
+		if (max_chan_id >=3D 0 && ch > max_chan_id)
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
2.49.0


--ZzLqSZ9m2D84frF1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfhBf8ACgkQeFA3/03a
ocXEwgf/bsT8bKSc/pwyGC9GpiLlvmQmUVX8mzc1mk7tJIla/vsy4BDTVjm8/GtI
xB/hFbDrgMh81rZjyICAxVYGoBzZqzhIkKlU+SwR25l5rIDowdyMQB8XIgxhCpWy
39dAXT+LKZkFeNxoyQi+llFfgw3VGeA4mhKCoaVJM774tRWju8jC3P7ByjCufezN
Ji3iURItZ6MTpPvTVr4i3qVvDKJqiPN1Xhh0PHh5OMUM6vlsidD6mQOQ372IeJaW
ySDvx97BRge270gLioAak7/5QeWH4/KOOkVmi9B8WqOgZ75g5SdMt8/EMlnBjLWf
ASGYIOLD2bJDk9SKCEEBU8pqBj58sg==
=WsME
-----END PGP SIGNATURE-----

--ZzLqSZ9m2D84frF1--

