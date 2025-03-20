Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A377DC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 08:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yh/aY3YPLr128eeDB6TiMpExF6OYM+MKvRvuZdF7Mjc=; b=v6cyJMyw1sxaaxWRbnUpvwdpJG
	xOrcfWZi3dUX78IKezMNfR5mZ3GQiHy0rMyQMgM0TXBL3f+qQCVPLKNRCeeQPg+Q6zhh/P0Ejmsnf
	bG0KxWefoZpgbndNO2qT/+XIRyo4aU4V7N6daSYHfMLNcFWweddsD7vDacZLWoLM92SA7eCiGV6fF
	iowIDQuwkFJSrmZhlxTACtzlLFaDoMcmeDIRgv4VqJ9Qi6Zh3NJrWICFW4ANUSxvSrdbFHxGaCaoA
	eqsfgbN5mjxBTVUHH5S3TtBAGA9vCF4yOc9/DSFx8tE7uEpSiil5verjvgv/FoBHSm0P2HIKJts9b
	BnYP3FBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBDx-0000000BWVf-2FSN;
	Thu, 20 Mar 2025 08:25:57 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvB9X-0000000BVep-2okW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 08:21:24 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54954fa61c9so719378e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742458882; x=1743063682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yh/aY3YPLr128eeDB6TiMpExF6OYM+MKvRvuZdF7Mjc=;
        b=chdBJ6SHw5HGzY+yBHn6OOZfy6Zfhip5FnFOSmqF3BWqedsh4VFoxpYoR0nfqBxZQw
         wkeU5cZG8JP+E4dR83rIt9xFJdmh3XR5j4FsOCNUzmCBhB1awnZhu1lJDXxyNgHhOQGV
         2f2JoUxn2PM39Fa6vtYGjUpJcBGaNAQdFDR0321Dy8k7LR/eDPgUzR6JEdK+K1rFP3V1
         rVs+GiFEenjnFbp9FFSM+1dv0nbgP2lR/5vtKtXIlt8Zb2dwYYBeS4bRmDmCETP8IcL+
         Fp78tY+Y+zfbUw+HqsUTDCB2yKuAfmimlnbgPnCx3JL3t1DZyQ4H1ZvgkiVHOJy5vHLl
         xbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458882; x=1743063682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yh/aY3YPLr128eeDB6TiMpExF6OYM+MKvRvuZdF7Mjc=;
        b=SMyrOvxye5UVUwPKULw/MqLHjcbol03UodeVNqWZQDw0zEu0YAdu/EIsH4fVN+mxsi
         LPD/0+onjWAFfpkF0ALPtX6v47Xuu7rrJATxjDdswubbyeHOo7SbxdhHkUVrRoEkqLGw
         pme2CU2jFW4sNdNC07JyFHuaXKD0pUc+yTM6W1ke49k83/+XsZAVnjA8fFLb7292pYim
         2sdVdUoQckL/dFPI+vD3cU8jzsBb1qMe/z06vnvDcMSvHPQD6/kyUs9IXvxbV6/XURzd
         xSVunqwbrW3iL4cC7SVV4SULoQMvvCyD/9ZxPMStHziIFSHlGVmZtXiJLxZ/Yq5aes7A
         O9Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUstgub4W48xS3BlD+fpfh/khe08XILz+9iZnOWscRlFmJ8LxxCNTsp13NhfFSPjqfb0A13Lc5re9EKZATM2SX3@lists.infradead.org
X-Gm-Message-State: AOJu0YwcO4mdgfHUPD1hhM4jq1KWGyMkzvpqUgXh+9wIgleytsrqpjgg
	YwJUpS6F09NccOHYW5hJrbMqhkJBIpPqlme+SExomX2WMPvCt22e
X-Gm-Gg: ASbGncsD1+jwZKAKzV+Qz08+LaQ3fWcQGMK7+kiYbsH9Hl7fOb9WwcSZV//n1871IZA
	5PUM1nz9ttQwvCingpDBTmc05qlU80e9egSYMg1gqrvVEE1rozGKyTJlEdWWp+Q2HGLjTqh71xF
	v8PxkGd9Y6lAhdQFwkYveoYV069DO609njbb9ggZ0LjzpxOlEBRcJmNoGo/mwaO3y9qXJRw2sWQ
	08ftzljS4fESIkX+M35WILb2d0tzT1ujg2mm6eIpUJ3Unytf23JXaXMqFWPUuSXjSmOQw379Gjj
	i9lDOHQTzaf6bV03IkSuP2dbCJjQ5G6RyHGFjbk6ld4fI9qVAkY=
X-Google-Smtp-Source: AGHT+IHeGKxlOEHY1CvTb3t+asOzrM/2sZpLzoi3Px7HFPqXXPcThNk4Cky/x2Ts6rByEpk8KRr1cA==
X-Received: by 2002:a05:6512:304b:b0:545:5bd:bf42 with SMTP id 2adb3069b0e04-54acb21aca9mr2189060e87.36.1742458881710;
        Thu, 20 Mar 2025 01:21:21 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba885129sm2145851e87.184.2025.03.20.01.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:21:20 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:21:16 +0200
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
Subject: [PATCH v9 3/8] iio: adc: add helpers for parsing ADC nodes
Message-ID: <299f990caf58d77cc24200e8d75655661f16050e.1742457420.git.mazziesaccount@gmail.com>
References: <cover.1742457420.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jd3Vv7o0qGxJT9tp"
Content-Disposition: inline
In-Reply-To: <cover.1742457420.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_012123_713254_4CA6F0C7 
X-CRM114-Status: GOOD (  29.05  )
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


--jd3Vv7o0qGxJT9tp
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
2.48.1


--jd3Vv7o0qGxJT9tp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfbz/wACgkQeFA3/03a
ocX4ngf/T0NbTd3rDDggxSnvJxHt0vz0qqlflnkgBtWRvUrP1uMi0zzaf6NeglAl
9kiKhEanC97PDw0KPr+4Xa1zpF2EjSkeH0/3Nt1xdm7lSxduKMe5zt0WAC8WkOXj
2VJ6967Zobm5s2sZ9xr4LQDX7xZEUEG3zoEBxKSvQ6Z5F99fpDy8gh8AfjfyXgIT
c25rOyqQK0jwmlIvEkmTFaBngHTzJY7h+M/PwBoMBwQkr8xViKJf9b+1qzPfk3Qz
NQzVYp9CFSSgeWpVOb8R/cwSrz4zLcans+ETBZvNfrXH0gHc1w08hQp4AFZnEvMg
Uqb0iXUyMPX/qfdd9opXWAvLRKD+lQ==
=br7A
-----END PGP SIGNATURE-----

--jd3Vv7o0qGxJT9tp--

