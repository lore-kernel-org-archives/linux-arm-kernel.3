Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D7EC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=va2pvWmTusgEpgeYLRyDeBT6KWSDeENhUBZHU/VVNr8=; b=Q3uQq0GajkTk14FxTX+B6LQsyW
	WxPbgCyZU9WuHwHayxC10KOFvOpt5M8aYEcM+M0VdXHKySvbfh66oUJEfu5dAq0g4SkmXKtWnKQLB
	u7nHajORN0T21C/DDCx4dGdGc8qNjF786bM/3iIJZbi99xul20nAoxKe4d2LK2UiGeQq88yErgyhR
	e+7YH594Crj3f+A04ojLcO21hF0Kv7ElJiWyjGSaq2+HnHZVzBSYbRE9ENJpQhlg1f7OrhF5nV+Oi
	kKNjf+AuxoBv5zMhc1gRdrjKc9xRzNsuBg/0OAXMsKca96Hjgjq5dimt7YmaeshUnSafXwz8UnPCe
	BLHeZb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdQ0-0000000ErYX-2ju7;
	Mon, 24 Feb 2025 18:43:04 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdGe-0000000EpHs-14gr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:33:25 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-546237cd3cbso4781765e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740422002; x=1741026802; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=va2pvWmTusgEpgeYLRyDeBT6KWSDeENhUBZHU/VVNr8=;
        b=DXMoP5hovAr7tI197TOuhroubm3Tz1xfMZFmvbIh/yMMkxp8rLMeQS6p55OeSmx+48
         1jTVYzoxrQ+q00cbHBeBBUn26wa31aiRVk1PmJDMlFOdGMlgH0AauMfO/kidJv+7aLFK
         fwp7mofXrAn+NpBHlES5HWQi3dA3eBqnTqQNR6n0Mvy3is5OBaxNla0+zhIJNjXgSi4d
         7pSoH0nNQUfaJG3TZvh6RWGheuGmBeiJrIevB6L+6epPs1tyqXmGntAOS0eaIXxgSzPp
         4CbHPP16pqZkoE9HBcqox1zv91ZFiBhoXL6gQh7lqtnFGPQOUETwYAQOFw1GdULm8gDS
         NBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422002; x=1741026802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=va2pvWmTusgEpgeYLRyDeBT6KWSDeENhUBZHU/VVNr8=;
        b=ckceInj0fn6kWmvU+9VW/lc8PH7df9r9/iJwe8YT4XQ1TRVwoemANbfQwRZ1o6Ajb2
         PY2yMwYm7yu1dGJnL8sGGbrl6UhKA6kPdvzwRGy/lEjgI/TFgOrcf/5iH1JBVHnqgRNO
         4NEslGJ9KHgM6O2MPBFBzpOtbZSoS1CzvSBtBG0F9hckKW1BTlD+Z7u32HfhEP8qcYa0
         oelkcR2WeLjUlN4E1YG24gpDPRCS2/iGkq+pKqatsE6IWh4HwIgcuaPBoOv8oLjatXeP
         Vk9RikuQPf1aUrlD5947ltwfIUfyf7VfvOxlCMXoY1Ke59dBJ9vTt6ixf0PQhp5g7sRK
         A/JQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4lyCmJB3qjj9Iyyi7yzG/YOUlr5UwDhn5OIGkrXzDSEbMCV/nhAQOik81+ehXubKbz679LOXR+aOFxh2xqh41@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/A92tI0gNSXuxp3rZ5CamuFA+O0UuBPCKA6AnHDaiA+h0pOwy
	X4YQ6JIPHIwsDv7gB2PfVf3PwsK3j58B6Hgw5SsrzO6pQeVd+mtw
X-Gm-Gg: ASbGncsMrGXmB1LoUze/vxY8j8gIh//4S+R2KuXRHyrWPQhxMOoyg/r1pZmpmyB//1e
	ODH/roo40+zoJukyBGpFKmFGyzjxo0mtiA1q3sEvH+550z0H9iW0DL6OimAhRuyI7euAv7R2ias
	iEeIorG+AQvuRu/IROzrj6pxLFcTewKI1bw7XAaOtB+qMdqivZ3yHj4EVNQG82Uwf3SoOZ7/W3a
	yWeDEjq8JNeakrNSrjOtxwFinOCK6TT3XIiLb4HW/hDelpBBi2fhMBMvpm+vhhijJB1bpNMUyWf
	8cUviNaj3J0dk6unIGih/93eRPmDDdbd
X-Google-Smtp-Source: AGHT+IFU/BAE8/JP2/pFWB6uj3X2U5hpIcR9yw/fgE/bh3vrS5xv0stjrRkIhM1Vu3CupP2zc9Z8ug==
X-Received: by 2002:a05:6512:b0a:b0:545:d72:95f0 with SMTP id 2adb3069b0e04-548510dd0efmr39333e87.24.1740422002020;
        Mon, 24 Feb 2025 10:33:22 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819ebdf6sm46721fa.35.2025.02.24.10.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:33:20 -0800 (PST)
Date: Mon, 24 Feb 2025 20:33:16 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
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
Subject: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xF5zIPCTVvd4fOx7"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_103324_304270_618A1EAD 
X-CRM114-Status: GOOD (  29.07  )
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


--xF5zIPCTVvd4fOx7
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

iio: adc: helper: drop headers
---
 drivers/iio/adc/Kconfig            |  3 +
 drivers/iio/adc/Makefile           |  2 +
 drivers/iio/adc/industrialio-adc.c | 89 ++++++++++++++++++++++++++++++
 include/linux/iio/adc-helpers.h    | 22 ++++++++
 4 files changed, 116 insertions(+)
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
index 000000000000..d8e9e6825d2b
--- /dev/null
+++ b/drivers/iio/adc/industrialio-adc.c
@@ -0,0 +1,89 @@
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
+int iio_adc_device_num_channels(struct device *dev)
+{
+	return device_get_child_node_count_named(dev, "channel");
+}
+EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
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
+ * Return:	Number of found channels on succes. Negative value to indicate
+ *		failure.
+ */
+int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
+				const struct iio_chan_spec *template,
+				int max_chan_id,
+				struct iio_chan_spec **cs)
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
+	device_for_each_child_node_scoped(dev, child) {
+		u32 ch;
+
+		if (!fwnode_name_eq(child, "channel"))
+			continue;
+
+		ret =3D fwnode_property_read_u32(child, "reg", &ch);
+		if (ret)
+			return ret;
+
+		if (max_chan_id !=3D -1)
+			if (ch > max_chan_id)
+				return -ERANGE;
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
index 000000000000..5d64244f1552
--- /dev/null
+++ b/include/linux/iio/adc-helpers.h
@@ -0,0 +1,22 @@
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
+struct device;
+struct fwnode_handle;
+struct iio_chan_spec;
+
+int iio_adc_device_num_channels(struct device *dev);
+int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
+				const struct iio_chan_spec *template,
+				int max_chan_id,
+				struct iio_chan_spec **cs);
+
+#endif /* _INDUSTRIAL_IO_ADC_HELPERS_H_ */
--=20
2.48.1


--xF5zIPCTVvd4fOx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u2wACgkQeFA3/03a
ocWTugf/U1pTmo4p4LmDyyZYpi+D/ws4cKRUHOYY95vJckFOlwmOyc9U8dRpKI07
CFWsUcrb775GbqfUGpnkaq6C9Dyshlv+5vR0jWcdV515Q5z9qHNr7e4ZOrvdu+/O
6jEE8Hipav5vG4H68tsNCS75NO7cLDgC2JeelX2ry90AkDVOKxJKlyhfi3ZEOIvw
S9Ijn6lg54WX7n3OwKScW6jfnMAOvblou4tprOk9IniYGwCKrvaF6SCT+2QdD+5/
l9+0JnbuM7wmW9OOIBoUFBO+xOOYK33VSlcFFmpfcsz2rH3Cvhd4itABZA1GnapM
y18XWpd9QPm2V4txHMpe+vT46UYnnw==
=+wbV
-----END PGP SIGNATURE-----

--xF5zIPCTVvd4fOx7--

