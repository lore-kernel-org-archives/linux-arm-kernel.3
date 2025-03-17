Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C49DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ii7b0KSEIGWdGVz920b6yiZTvzIrS7hqW2hr3ua9Jtc=; b=I0XwyV12qOdWY4Rd57guSe4wYq
	pnX4yfx3aI8L2n+IsxddYh69NlhfhWZIqdjLszdpzfJHu8AGNviWyT4VNwsJH22snl5j647a+wJ7b
	0Lv9hBMiQr63p2OXDVFKGLGWxpTNhKcwJybkdB/aDhCZnO6Npu44p4wZFhJb2FM5qgvl7m08GdPe7
	3LanzsGFnuHO/kd5Ts8pdbxpCWBXvZHCMRt4fPI5DB2l7I5pvH+fSzNL6uIWFcYJjJvyTx/Is254v
	2GKaEYtqaRfkmR6BQrfImVrMRQ5nAcyWeUq6LhLfWLZuaL9VYeY15oJoG+rSq4VOcM/2blyvyT16G
	9xNNx9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCqp-00000003EPi-3R7G;
	Mon, 17 Mar 2025 15:58:03 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCjx-00000003DIM-22Rq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 15:50:59 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so5372990e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 08:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742226656; x=1742831456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ii7b0KSEIGWdGVz920b6yiZTvzIrS7hqW2hr3ua9Jtc=;
        b=lC4mC6Hf09YU5NAABRqpSmKKfCpBl6wQqFxNMtiI6huxuqAmvTAI50XqLwGNiDRrME
         fdcI22tfEe9d8lKT8jR+kK8BjAdMI/1vYQ3hqQVKCnQu5gxiLzXbh+qkdRi49qWF/VvL
         4jJV4shwQChcwD/+W2aXv2mLsVBozgT/YNVjRhyvKFkjh3SGQKcbteX/qvav7iJrjOfa
         k6L+XgI6wt5J/3oiLryUFpBum5Gd2rjc8pE2dgLZO1rsci4PK6VcT5g8Q1qHvW87sQM+
         r8H8y+R3yysw1Q1ntdwaAaFPCryBAbdq36rXflXF+rUYdHwX0Msr5OxWy4TZwd+2VDF/
         PruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226656; x=1742831456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ii7b0KSEIGWdGVz920b6yiZTvzIrS7hqW2hr3ua9Jtc=;
        b=R54lIVULmNDBo8v2+FiJf6bpJiunE89tA8MKuVCB/1ooGMMO3UdIrU/ARai3bWh9Bx
         Tesr4Dh000Evuzi/y2cPCv7DdkHffreV8n7Qax0vk0tGaqkszCXalGkwDf17awY3u3Y3
         SmQaPUL/Ok93fi5g6HMq113cPIqQN7iAEFwXOc1IICQtNZFE0NZik1fgrBdur1lCu5B+
         kHO3tnk3hHXUAkt2zm/06QzST6bTB4eqf24gbZQcNuXlGixs5yB23JIaqKnoAwwMB4ht
         7KwnNzL6V55jFWwLtdQB3L574TfeCwCTnm1XFsddkVjw8Pg/UWZmLJS+dyAdw8xMiYwx
         HtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI4+xzhgXoAEztJZFcEI1tM0XLXfLC7YJQyhhwNWgXNJaNH+c1FRoCqKbKIAAz5mHQMIRpE3Qu+9cSZA62PhUE@lists.infradead.org
X-Gm-Message-State: AOJu0Yygq8K5Y9S3rou5GWDR/4PqTvapUeAk+aem1WUqfY2s4OTuoYuB
	F1I+yK0tTIxrAwFlzsiL1+Xe7zIKgm/QXnIHfow4h6p1PTL4sQUIOtPcEA==
X-Gm-Gg: ASbGnctMNz8QvztNQNM4kN3kNM8EdnLYuOHVqJC0QliKxdjaPu47sMJy5N5yco+44WZ
	jBwpMJCPqHcfJMG5H5Ie98+cYkGhkweTuMjU2ZRL4hkwzCIJeByAZir04t30YkcZfkfwjUpQNUP
	dVMche6zyFMOJLaljnaZolBBOLRFMWogh4Svtzk0qJXvHp2ob8f+Ob2Qr8uXqg0gebJASJrYe+a
	51jmpacvaXnVJWwVKWPBtk8JYkl9qaKmeahZQHY37o0FeYK5z0qcd9xk1XNjgn+CNdzbQDI6JAZ
	UaF55KJt77rGPW78swyPmveQ8NY1gfn7U77a0s6pSVXoRLrgjb2miebVfePNXQ==
X-Google-Smtp-Source: AGHT+IEEGvh3xBWemsVzH4wBXP8yRpV5NjdfvJKnT0Q5uYgr5FPXWVoYQ+4hCSjx/lxflCVclNNDFg==
X-Received: by 2002:a05:6512:2823:b0:549:8e5d:a84c with SMTP id 2adb3069b0e04-54a03b78224mr236127e87.2.1742226655332;
        Mon, 17 Mar 2025 08:50:55 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864ed4sm1385343e87.128.2025.03.17.08.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:50:53 -0700 (PDT)
Date: Mon, 17 Mar 2025 17:50:49 +0200
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
Subject: [PATCH v8 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <e556f152a9cff2ff61e7b7a4b42feffb400cb1f9.1742225817.git.mazziesaccount@gmail.com>
References: <cover.1742225817.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VenAnZ5yOArFOc9Y"
Content-Disposition: inline
In-Reply-To: <cover.1742225817.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_085057_527392_98255889 
X-CRM114-Status: GOOD (  28.48  )
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


--VenAnZ5yOArFOc9Y
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
2.48.1


--VenAnZ5yOArFOc9Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfYRNkACgkQeFA3/03a
ocW65gf5AbvmNtrufWqElUg7CZxI84RdeX/glpqc2aCI9PJQne+eoyxWfh++mFM4
xNKQwxwyZ1w2Ot92onGIm9UK6h0V5qWHCNm9hQPIoQkcS10FfN9Gg/nQ0lsLchqI
5mlBpkqBW5IDmqiOh9jOsDKoIbsqBvhEBtmM8spqYJhJi+DE5bzuNN1TMSw6OPbt
Ry+TZuyfY0sW4KVXhNwhukLYeopM9kRj+YsaUIVJD4LJA8vMfGFamUk0QEKq6/qD
ztSJugAbEaIyA9U6cLdTS6Wc3VffunzYkfykryaBnIw5JsQDY4asstkML0kkzU1U
6K585gt1EmU0daBBQg+2GR2qnqBvfg==
=v3IW
-----END PGP SIGNATURE-----

--VenAnZ5yOArFOc9Y--

