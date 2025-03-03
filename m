Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237C8C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rKXywdzc/Et4yJtFDduOL5DqpXRTEQpflOuvO6/QFtE=; b=BlnRKVlaYnxn5ev+CgEoWtP1tl
	+AKHXd9vLc49GrGo8OpjmEnknU0ZwOcLqt7x54mfpQk3hRFrU/nQBzXpgC2PlXjgD+NsFRksvRQwB
	gv63xWSBGd1w899RiKECRYBFEg6HVW1CDh3UroHOkoyGzcaTBK70xXIif2jJAIvMl+8iJKizX2mOz
	vjPWBSD6P1MKTZqkOkh9bVVph1MHqfvvH3vWvvd8T0nQ8IzqWeCWrxCZQD/zPSOWmIB13yXreqaHS
	jU7xy9HjlA4RG6C9dvO0TrOgfbJqIsLYQzckT/YaYd5gxoLAaNuy49j2v5hTaxjVATnY5lMIHtz89
	Ckr6p5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4hv-00000000iM2-0l9c;
	Mon, 03 Mar 2025 12:15:39 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp40x-00000000ZWt-1DAP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:31:16 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-548878c6a5aso4822640e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 03:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741001473; x=1741606273; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKXywdzc/Et4yJtFDduOL5DqpXRTEQpflOuvO6/QFtE=;
        b=D46olNAB5uwWBsS/akKH2/VkiwN2TTWLny1jSOv2jJ3mJxBbYrVkXqLJK62k/42lg4
         eElqv+pUy6o+OX+VpDRD6gEvz/t5CxcozxaKIz/RKBdqJidvRS2n9YTjFE4/zjkQasPa
         AWg/9f0Vtd7lq7pXI3mgFu/37tRiNamRHeln/cPtnxYKuCzgmTi/ML9a3w6kvXtktJdi
         GzY1LnpiJFLOtd1bMw52h/BFA3NpImY+4hVm00jTKaiY/eDNg7g7sGpA/D27OjIMOtT6
         ISzZT9s88oHPyihSmAGwfckiL8tcpntMSZusZRwi7eVLQzRwPSRG3zfT77dTDLdwV3sq
         92vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741001473; x=1741606273;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKXywdzc/Et4yJtFDduOL5DqpXRTEQpflOuvO6/QFtE=;
        b=h7axGr0f5OdrxFnNmYQicpSgSd5UOvAZD6/FCYw1z9vWUFqB2xWgVkWKme8cYKUDiR
         sPkxCLuZ9XchXKIyMCJ7eUaoRWjF4TUHgYL9ztW0BmvlGgW9g5YW2gmkFOCC3WUrwIsm
         rLcJGO9AoF3X6OZS+NZRcEKQyoQ+XshpUyBDhvycjIZNCNjK+yx9jke200ENQPtWUoNW
         LhTIYQGco21zhsCNTAoArmlrz1nZLFIudGcjFfY0hjPjo2rScv43omHLoK6v9Nxz/tWV
         7tp9epLaj+fqKu9lMPEtW8BChCN6IcI0IT2A4Du6MYoFB5fxvCMPSz+uYqqiuyGbcMwy
         QUGA==
X-Forwarded-Encrypted: i=1; AJvYcCW1dkEDeH1yC7Nl1jikp/tfzB4N/PXfbTTmPBEqCLPUzQ4AIvYRfjQ/usingNinTR5iwNSZhk6B7fpF5Uphv1TY@lists.infradead.org
X-Gm-Message-State: AOJu0YwdhZvDdsOJq6/dUyF5Jfya7t8612nFOxzJyEiqjbHLI1PDB3n+
	L9kdGyNvm0PiRegdg6W6mmPy7k3MlBjl4VLqsJvc4Y5EVmzeE2mx
X-Gm-Gg: ASbGnct7UKqT1arv0mRXBlIOoMGwSz/Q0m5FKUmw6SadCqev++g2DKTGNJ3MdP9X6Qw
	3/pu5EyIKCUqXqXhvnW1nhqJvzvVIoTCwa07d7MrK5pfOjlGQm139PB3NVd2x83expHuvhjma44
	Yn134N25tSYiswdDVwtD9572+w9bOAIYF6vJZiK8CtrqutadQh+h86hONI6pLmzKuNShfvpq0oF
	LgqcGy914QjSSQ7pXfKOsSpwdseTxJleJGiz5WOE+w49eJZ42/hBmpL9WOmDPBymgWk+pRo4vP+
	QQH9z6B4q6CBZ2fP/V8EUHjAWLBTH1gcnFCbIq0Ye2kfNMAG5IXepOSHwUDaobNwljATBm37Gxm
	Mk3WegJ0v7ig=
X-Google-Smtp-Source: AGHT+IHy7eVfyRfz75KlXzMg33WQpUvOMs2XoHaFWGcBRo3/jfRN7pYYEQKL0JaanfwqklYifmbf2g==
X-Received: by 2002:a05:6512:3c92:b0:53e:39e6:a1c1 with SMTP id 2adb3069b0e04-5494c38bde7mr5379294e87.43.1741001472861;
        Mon, 03 Mar 2025 03:31:12 -0800 (PST)
Received: from mva-rohm (mobile-access-2e8451-125.dhcp.inet.fi. [46.132.81.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495cb976e7sm595497e87.56.2025.03.03.03.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:31:11 -0800 (PST)
Date: Mon, 3 Mar 2025 13:30:59 +0200
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
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH v5 00/10] Support ROHM BD79124 ADC
Message-ID: <cover.1740993491.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ok8G6d4pd5Kde/Tf"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_033115_335159_A859CB24 
X-CRM114-Status: GOOD (  25.54  )
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


--ok8G6d4pd5Kde/Tf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD79124 ADC.

This series adds also couple of IIO ADC helper functions for parsing the
channel information from the device tree. There are also two helpers
included for counting number of firmware child nodes with a specific name.

Series does also convert couple of drivers to use these helpers. The
rzg2l_adc and the sun20i-gpadc are converted to use the new ADC helper.

The gianfar driver under net is added as an RFC patch to use the newly
added firmware child node counting function.

There has been some discussion about how useful these ADC helpers are,
and whether they should support also differential and single ended channel
configurations. This version does not include support for those - with the
benefit of reduced complexity and easier to use API.

patch 6/10 is small simplification for the ti-ads7924, and it can be
taken independently from the rest of the series.

NOTE: Patches 4...6 and the patch 10 are untested as I lack of relevant HW.
They have been compile tested only.

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
v4 =3D> v5: Fixes as per various review comments. Most notably:
 - Drop the patch making the TI's ADC driver to respect device tree.
 - Add (RFC) patch converting gianfar driver to use new name child-node
   counting API as suggested by Andy.
 - Add fwnode_get_child_node_count_named() as suggested by Rob.
 Changes which were not proposed by reviewers:
 - rebase to v6.14-rc5
 - Do not include all recipients to all of the patches.
 More accurate changelog in individual patches.
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
  property: Add functions to count named child nodes
  iio: adc: add helpers for parsing ADC nodes
  iio: adc: rzg2l_adc: Use adc-helpers
  iio: adc: sun20i-gpadc: Use adc-helpers
  iio: adc: ti-ads7924 Drop unnecessary function parameters
  iio: adc: Support ROHM BD79124 ADC
  MAINTAINERS: Add IIO ADC helpers
  MAINTAINERS: Add ROHM BD79124 ADC/GPO
  net: gianfar: Use device_get_child_node_count_named()

 .../bindings/iio/adc/rohm,bd79124.yaml        |  114 ++
 MAINTAINERS                                   |   12 +
 drivers/base/property.c                       |   57 +
 drivers/iio/adc/Kconfig                       |   17 +
 drivers/iio/adc/Makefile                      |    3 +
 drivers/iio/adc/industrialio-adc.c            |   82 ++
 drivers/iio/adc/rohm-bd79124.c                | 1108 +++++++++++++++++
 drivers/iio/adc/rzg2l_adc.c                   |   38 +-
 drivers/iio/adc/sun20i-gpadc-iio.c            |   38 +-
 drivers/iio/adc/ti-ads7924.c                  |    7 +-
 drivers/net/ethernet/freescale/gianfar.c      |   17 +-
 include/linux/iio/adc-helpers.h               |   27 +
 include/linux/property.h                      |    4 +
 13 files changed, 1462 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rohm,bd79124.=
yaml
 create mode 100644 drivers/iio/adc/industrialio-adc.c
 create mode 100644 drivers/iio/adc/rohm-bd79124.c
 create mode 100644 include/linux/iio/adc-helpers.h


base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
--=20
2.48.1


--ok8G6d4pd5Kde/Tf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfFkusACgkQeFA3/03a
ocWURggAh0aahWuhR4X2pAbWcrvLlgY0D9RSlfBWXUHB68G1gPrJjp5CTgZLemkh
d8hIvugJVz+G6zfkewr+abXoQbFlTjXSnKUUB6DAt0uoeJolaV6QxfNX9JwyLhMH
v5nQ2dValRMeFZVoh1hUCXjtrTFJCjBeGKqDb2Rb17SxjzYk09ObnyIJRh4MABsl
pyiO6m0xFOLr5vjd7f2sygWRigBYQPuDyTcre5WG0o3vNBTlEfr9BmR8aPNGFaJs
7KvjqfOj8BGczBrxIHCUxMiNkEIGCKODg1dMdm3VBLI03/Uy3LR73AEqzX3wjEY4
BBEZarVDoaTTVCmV9HvB+kvmJdW1GQ==
=xpnm
-----END PGP SIGNATURE-----

--ok8G6d4pd5Kde/Tf--

