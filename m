Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E19C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbgG/npWw2NepzS3A/ksrl5rJ4Tlhh8QEzNC+teb494=; b=WTpihkZCTA67QT/PpMmh8ok4Am
	qguPL9ec2lQyyCWwoE/x1SFNkz3chOmjuXwzkXeOEKhHItTq99fidaj4/qODEEJ47Eedg92WLncTJ
	DaVmoxs+P2VrGhg7DaLNZ2s21+hDx5Tp3KIPYHpBKA+S60707bZlOd5kw9Q7gjMTNPjyYCv33Nt83
	U7I9zkvLyw4M7ACOdq9GhOJs7A/M3RwwaT8BjDa8c2SIaqPpTQkQsgW29MYYaSARwBYruEevmIwOI
	Rgghms5vfZyeT/Ikq1Jz34Iri6KbFjQQkbXXUz45FZUJ1YYzSHl50cLS+FnYsxqHvoW9UWr+fDg/O
	94SW//Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdRT-0000000Erot-1lBB;
	Mon, 24 Feb 2025 18:44:35 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdGs-0000000EpR5-3qq5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:33:42 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5452c29bacfso5215756e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740422017; x=1741026817; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sbgG/npWw2NepzS3A/ksrl5rJ4Tlhh8QEzNC+teb494=;
        b=S0pZen/tGWeNRvD5GW8kAvIzqc3toHSa3zt02L3YV6W/cLYATKdQgReoR03ZPfnFRp
         OUq6stb8J0G6SB8nIZ89To0F+e7uuOav8MxfW90Apul8Z6uLdlBOLpT71rvlvrIwPxzl
         LYaYUhHDbgzIKuZj9BQtkZ6//VhluudcO29s1C9FBNOK5iLTDMcXz4Fm8eDp3G0jfqUU
         oyfszZOpmYBDsUywRFD7m+pdcaYsjfe+26YjDyVGYmn97F+hB7zp7QgHn1jHWlX4nDdk
         AYry8fUcNbogiHrKWLPerjpRv29eRgEsj/bV/o+5V2jS6G0fZ/qurc7F7tmS/wTZvoNr
         Dlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422017; x=1741026817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbgG/npWw2NepzS3A/ksrl5rJ4Tlhh8QEzNC+teb494=;
        b=M5OWTb63Je8VP+w3NcJp4RzwCNsDS1Cn17ueTmnJjSXuU8/g7FClRbHgogJtc7Lcwg
         UTCMRf6PYhBqi7uUqRAM7iv3F+689PPb+Otgm93OhlfPW1wHe43kjiic41dQ8r8SZGge
         +GAQBeCdBcPRuxCNxGSNY5rXZ76FiljjkUIkQ1MTUtDRvmoIueD0KQOMCeGkMD0RiH99
         WpPHSk+e1didem5O18gn1jOe9YrzIOP0FVMviRGK6QXN+/raj6nXoD7MN07vSOCF5dFW
         IGDTGBLBN33XoOQUfMS9B1RfWSX+QZRkkA9dBv/RB7vREXQfca4rsoOi5F1jX2fDT1XW
         jQxA==
X-Forwarded-Encrypted: i=1; AJvYcCWtbNR4UaIXbdt6OQfcK31AXEH4dg4YJkX6vcRuOs17uHsZ12Vgq7Ibqg8yTws1GMFjJBlv7+NdvpVXNFcNPtug@lists.infradead.org
X-Gm-Message-State: AOJu0YyPhMnEJp26syykkwTOC3KhJe12ZCKDFwLYd/wwaj3EyAKalgc/
	wxCROUn/OOA0Y0Dxt4cnTvGkNPSHdwOdI9QqVoYbO6+0UKaFsLGN
X-Gm-Gg: ASbGncuKFFJ/aAGrny1BqPBXWm74So7sCWlaqebMbUiFgwwYsfFVH2/87wsHNtTt6IQ
	2Jt0vC2xeRB12Vtshuh9X+2uM+LUZ34YQJsKmAIW5Z9d5cEvoFAo4vdntNy4AUyrg54nsA9bXTS
	mFFRmDUV0S5gX08OkG3S2qg6iB6CMjlc0G8XNewJGzJnTZPcD5rMdIulqk4zvsWgxrAWhy50bei
	9BvKLA/OqfbO7Js9EsjK9Bkyxfdmg7uDii7gb3cpP8tHJRptjkcMiM2FRwJjhLDsgCfZ0EaTn9w
	CVWdPj9hJwVtQGPfi9JOAZH1vMmKuFhp
X-Google-Smtp-Source: AGHT+IGBSL1yjpp7J6W1giQ4I2dWNpu3PXBwrEQmef+HokD2Y0Oka/qGiW3kVLsJKEKXgtjM51bkUg==
X-Received: by 2002:a05:6512:4013:b0:53e:239b:6097 with SMTP id 2adb3069b0e04-548392717f4mr5798488e87.50.1740422017026;
        Mon, 24 Feb 2025 10:33:37 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54850e58973sm11520e87.23.2025.02.24.10.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:33:34 -0800 (PST)
Date: Mon, 24 Feb 2025 20:33:29 +0200
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
Subject: [PATCH v4 04/10] iio: adc: rzg2l_adc: Use adc-helpers
Message-ID: <5658fbdd886cc7ada278a42c63a140bc14d1277d.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mtOolVTi1ZqGpvqI"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_103338_987686_1D323F1E 
X-CRM114-Status: GOOD (  25.51  )
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


--mtOolVTi1ZqGpvqI
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
v3 =3D> v4:
 - Adapt to 'drop diff-channel support' changes to ADC-helpers
 - select ADC helpers in the Kconfig
 - Rebased to 6.14-rc3 =3D> channel type can no longer come from the
   template.

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
 drivers/iio/adc/Kconfig     |  1 +
 drivers/iio/adc/rzg2l_adc.c | 38 +++++++++++++++++--------------------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 37b70a65da6f..e4933de0c366 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1222,6 +1222,7 @@ config RICHTEK_RTQ6056
 config RZG2L_ADC
 	tristate "Renesas RZ/G2L ADC driver"
 	depends on ARCH_RZG2L || COMPILE_TEST
+	select IIO_ADC_HELPER
 	help
 	  Say yes here to build support for the ADC found in Renesas
 	  RZ/G2L family.
diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 883c167c0670..51c87b1bdc98 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -11,6 +11,7 @@
 #include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/iio/adc-helpers.h>
 #include <linux/iio/iio.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -324,21 +325,30 @@ static irqreturn_t rzg2l_adc_isr(int irq, void *dev_i=
d)
 	return IRQ_HANDLED;
 }
=20
+static const struct iio_chan_spec rzg2l_adc_chan_template =3D {
+	.indexed =3D 1,
+	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),
+};
+
 static int rzg2l_adc_parse_properties(struct platform_device *pdev, struct=
 rzg2l_adc *adc)
 {
 	const struct rzg2l_adc_hw_params *hw_params =3D adc->hw_params;
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
+	num_channels =3D devm_iio_adc_device_alloc_chaninfo_se(&pdev->dev,
+						&rzg2l_adc_chan_template,
+						hw_params->num_channels - 1,
+						&chan_array);
+	if (num_channels < 0)
+		return num_channels;
+
 	if (!num_channels)
 		return dev_err_probe(&pdev->dev, -ENODEV, "no channel children\n");
=20
@@ -346,26 +356,11 @@ static int rzg2l_adc_parse_properties(struct platform=
_device *pdev, struct rzg2l
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				     "num of channel children out of range\n");
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
-		if (channel >=3D hw_params->num_channels)
-			return -EINVAL;
+	for (i =3D 0; i < num_channels; i++) {
+		int channel =3D chan_array[i].channel;
=20
-		chan_array[i].type =3D rzg2l_adc_channels[channel].type;
-		chan_array[i].indexed =3D 1;
-		chan_array[i].channel =3D channel;
-		chan_array[i].info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW);
 		chan_array[i].datasheet_name =3D rzg2l_adc_channels[channel].name;
-		i++;
+		chan_array[i].type =3D rzg2l_adc_channels[channel].type;
 	}
=20
 	data->num_channels =3D num_channels;
@@ -626,3 +621,4 @@ module_platform_driver(rzg2l_adc_driver);
 MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
 MODULE_DESCRIPTION("Renesas RZ/G2L ADC driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("IIO_DRIVER");
--=20
2.48.1


--mtOolVTi1ZqGpvqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u3kACgkQeFA3/03a
ocWBYAf/brWd7/SyZ84Uz2yw5H7dpkgJJ+92jtAc/7YINSXooW/ZlWxIWkRc5/wl
NWJyaGDZO9innoXJSHn73DWXGKJOPJ/QUeLqjW86wN+DyDJdz1cOI24Y5GpOOq3B
dzzsKxxwfVuI1Enl4cKBkWR63OjFMdjk7OF/wex50TQuC964i/hkTQYyeB4+XCpB
3JddSObvtByksJW26s7jnv9bvsC8XhnSz37Vw2P5etG0umGjPp2FHqREvq2Ou/YZ
3RBzlihjDWPLO5cDVa6pKAFATd5sufaJl8W0t8I8IFm8Nc4mn3h+uYqUJGGZ33i5
dXuQHwUK+I8QBlWSHvaz8wnI18JegA==
=WOuY
-----END PGP SIGNATURE-----

--mtOolVTi1ZqGpvqI--

