Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A648AC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jXIG3rwFkUBNHGVcpVvR3tMHmQkVgrY0k20PaQNNWQE=; b=mGyxwaAduQIbkQR7KOeHQ1Fg6y
	gvUxpzwzupA3Lbs98fgaMc1QA4F6CbRz331sS0kdEKcseGgdZWzkz8eAXm3GomT0OJxdtircSnBnS
	vHUIVdYC2gKnqsyuoQLBV0Hk+4SEb08mkvo+ziZHzS+Mfzr9gy1VPFbNz1hxqR+PYqK6F7r+s+9Wn
	1R/kV0k/EdkwQXkdnWrZbqXMN4OyjDu0vxJa4s7v85ho2bbjD1YZE3RL8vukzRxnEvIoWxno3Xmlg
	LgHUTrZN3WdAWLV9WJ/ASAzXCenzsVvOwqU9hCVDPpdFDJvhCUWO7j7Jp/o5Eqb1ZubFldvV2TVNS
	jSJ+nvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdLd-0000000EqlB-1OIc;
	Mon, 24 Feb 2025 18:38:33 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdFV-0000000Eoh2-1AhD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:32:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5452e6f2999so5084718e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740421931; x=1741026731; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jXIG3rwFkUBNHGVcpVvR3tMHmQkVgrY0k20PaQNNWQE=;
        b=TQIxai75anKuHB4enQL/Qnb8KRdse7HPEpuqdurPIWMgHNy6k2euAwCmOx29KeEOeQ
         53tB4PnhtyKnacNeYZPg3g8JE8bifhmYlHm7JGSmwwTrXNzk2tfHHOxfPV3NnyqLh9wR
         vUidh9PlGjCN5/4+VwuCgQbX6b7kzFddrOEhTzi90oVPuiwrmSdNx7vqby1+zhFlnoGx
         5eMa+wiKvJzbT9M+oFfy2U8xQCYwBUGiQprKC9ZlI33uOnT4j+WuMixJDo0lClh/JQrG
         H13XNqpHYvIMcsBowy4oZnZCVEV9TweANe2HjDaqw806atA5j3hcw90GABfxDjBgoh/c
         jSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421931; x=1741026731;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jXIG3rwFkUBNHGVcpVvR3tMHmQkVgrY0k20PaQNNWQE=;
        b=XysuVcPZHiqNIl+3xQSajU3DLi0KRrqlYEv4mA1Fgmu/C6MsJFAhdavxVA+S3lS56p
         IIZ+yr3o+cQFC2d+YHpIOk5aP5v96fwdtabRCliW7xHAYSBQ/eb8+A5eUecdvLvN+Z2L
         n2vMcfGZ0DyuYibFw27E/9p4kAtrFHZtmOGqo3KnnSodgv7o+GT25JCIBGnX05fk+ZJj
         KBm3C1AxVnp+huX9PxERjJNGKyFn/R9Uya9XXpyXUpJwt61kpLjdiOW6+d3iAz27MCnN
         s4WRCpzia22ZzQqmh14gHgVdIWxu/M9eN89YKa6MzSJkkPe7w65KLlMeuuJtCeX6IiPe
         z99w==
X-Forwarded-Encrypted: i=1; AJvYcCUj+k7gXtsVR9g85EQpmQkseHhNKjLgqBmHWNew+mNSInFgHiHL3FKF7yOcTuDovV1r/Xs/bVja5XcZzTREVAdy@lists.infradead.org
X-Gm-Message-State: AOJu0YzOdfiKOoiPJtawpNhbKIi7SUdxdlVZlbb4kpBWMSkMZPU7Dftl
	AyaVtje9nZMx3I0KRZoTMzOyVLlBdk86OkXLOGSg4Kzmy9xxEy1k
X-Gm-Gg: ASbGnctp8yEDI2CuwCCCOEnBLvtLnndLApCnJmWtJRynw1jht7zNxJiRr3RsW7iAH5U
	FibXfUP8Zch6F8fAR5MCbEpn/++MkKxp24xa9v0x8Yos3a4ugJ4EY56oFDrnPq2xgQAw5HIBHy6
	rTNrEGoWFmJfyxhG81lXWMJZd4cl5+mnEKMM9TEOBia9+AUod8Gtmy0FLPPlUOdjO8ESxry+zFh
	9RdOPk5M2/6WxwAUrfDv6M4w5SVXVxRDETFAlEt0GulRvdMeLexRxGLjvCGga8ptAneYnhIxBvd
	lRR2e2qiE9DOB7ZPdBFeaEX1AJ8zaC63
X-Google-Smtp-Source: AGHT+IFELQkBGEK3YIrY6vL2x7pgcre/YMocDwlofZQfU5axSRRV9108mGH1oEpDjZ+YLNE5cZW//A==
X-Received: by 2002:a05:6512:39d0:b0:545:944:aae1 with SMTP id 2adb3069b0e04-548510cf671mr29523e87.12.1740421931035;
        Mon, 24 Feb 2025 10:32:11 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545280ec98dsm3214737e87.42.2025.02.24.10.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:32:10 -0800 (PST)
Date: Mon, 24 Feb 2025 20:32:03 +0200
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
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 00/10] Support ROHM BD79124 ADC
Message-ID: <cover.1740421248.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gHB9+0TKqLctmFZy"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_103213_319920_1960D537 
X-CRM114-Status: GOOD (  22.50  )
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


--gHB9+0TKqLctmFZy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD79124 ADC.

This series adds also couple of helper functions for parsing the channel
information from the device tree. There has been some discussion about
how useful these are, and whether they should support also differential
and single ended channel configurations. This version drops support for
those - with the benefit of reduced complexity and easier to use
API.

A few of the patches are examples of drivers which could utilize
these added helpers:
 - 4/9 converts rzg2l_adc to use helpers
 - 5/9 converts sun20i-gpadc to use helpers
 - 6,7/9 makes the ti-ads7924 to respect the channel specification give in
   the device-tree using these helpers.

patch 8/9 is small simplification for the ti-ads7924, and it can be
taken independently from the rest of the series.

NOTE: Patches 4...7 are untested as I lack of relevant HW. They have
been compile tested only.

The ROHM BD79124 ADC itself is quite usual stuff. 12-bit, 8-channel ADC
with threshold monitoring.

Except that:
 - each ADC input pin can be configured as a general purpose output.
 - manually starting an ADC conversion and reading the result would
   require the I2C _master_ to do clock stretching(!) for the duration
   of the conversion... Let's just say this is not well supported.
 - IC supports 'autonomous measurement mode' and storing latest results
   to the result registers. This mode is used by the driver due to the
   "peculiar" I2C when doing manual reads.

Furthermore, the ADC uses this continuous autonomous measuring,
and the IC keeps producing new 'out of window' IRQs if measurements are
out of window - the driver disables the event for 1 seconds when sending
it to user. This prevents generating storm of events

Revision history:
v3 =3D> v4:
 - Drop the ADC helper support for differential channels
 - Drop the ADC helper for getting only channel IDs by fwnode.
 - "Promote" the function counting the number of child nodes with a
   specific name to the property.h (As suggested by Jonathan).
 - Add ADC helpers to a namespace.
 - Rebase on v6.14-rc3
 - More minor changes described in individual patches.
v2 =3D> v3:
 - Restrict BD79124 channel numbers as suggested by Conor and add
   Conor's Reviewed-by tag.
 - Support differential and single-ended inputs
 - Convert couple of existing drivers to use the added ADC helpers
 - Minor fixes based on reviews
Link to v2:
https://lore.kernel.org/all/cover.1738761899.git.mazziesaccount@gmail.com/

RFC v1 =3D> v2:
 - Drop MFD and pinmux.
 - Automatically re-enable events after 1 second.
 - Export fwnode parsing helpers for finding the ADC channels.

---

Matti Vaittinen (10):
  dt-bindings: ROHM BD79124 ADC/GPO
  property: Add device_get_child_node_count_named()
  iio: adc: add helpers for parsing ADC nodes
  iio: adc: rzg2l_adc: Use adc-helpers
  iio: adc: sun20i-gpadc: Use adc-helpers
  iio: adc: ti-ads7924 Drop unnecessary function parameters
  iio: adc: ti-ads7924: Respect device tree config
  iio: adc: Support ROHM BD79124 ADC
  MAINTAINERS: Add IIO ADC helpers
  MAINTAINERS: Add ROHM BD79124 ADC/GPO

 .../bindings/iio/adc/rohm,bd79124.yaml        |  114 ++
 MAINTAINERS                                   |   12 +
 drivers/base/property.c                       |   28 +
 drivers/iio/adc/Kconfig                       |   18 +
 drivers/iio/adc/Makefile                      |    3 +
 drivers/iio/adc/industrialio-adc.c            |   89 ++
 drivers/iio/adc/rohm-bd79124.c                | 1114 +++++++++++++++++
 drivers/iio/adc/rzg2l_adc.c                   |   38 +-
 drivers/iio/adc/sun20i-gpadc-iio.c            |   38 +-
 drivers/iio/adc/ti-ads7924.c                  |   83 +-
 include/linux/iio/adc-helpers.h               |   22 +
 include/linux/property.h                      |    2 +
 12 files changed, 1470 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rohm,bd79124.=
yaml
 create mode 100644 drivers/iio/adc/industrialio-adc.c
 create mode 100644 drivers/iio/adc/rohm-bd79124.c
 create mode 100644 include/linux/iio/adc-helpers.h


base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
--=20
2.48.1


--gHB9+0TKqLctmFZy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8ux0ACgkQeFA3/03a
ocVH+Qf+PVSPEXpY6uBYLMku5n+QutsoR3rKRhpzdBZ3Tj+hKJn8+FyCyt+2G/vK
5/D4Svsjq8DAF4yPWYmDk5HZi5zgofR9KWOmI/VgO6amTBx3bZEScWCoyj2i7VYf
O0XCQ06tXbm7nmotSiQkY7VDXaGhfZPMU3nj+xUQ84iZTbTPOI8Os8RiPfstISiM
cnfScD22RKz+5zHt5oqSBmZHB0jrWHzeXGZF+3gZQ6502STKMTfu76PBnpJkc56S
XbSq9SH9cH0jorWT0kYQyqc+7Bsv0SY9LwHP2ynDDmD7PBIF/sA2FbOy3Mk8P+54
jdNn0uGJKc5cEqbL6o1tg85PP6ztuA==
=H7qR
-----END PGP SIGNATURE-----

--gHB9+0TKqLctmFZy--

