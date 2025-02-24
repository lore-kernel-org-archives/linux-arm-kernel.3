Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D667C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N39GuLsH/GHnLWfi6A3DaLvaYCvcqGiUvrrDOML07K8=; b=TpyGZx6+KYryswqKxSR3AJICIq
	ChrONiovO878Mqu3kUJRZWV/EexyDvYrA7FgXLeDcd7r7VZ6lEoaKv7uScfNLvoLTotz6AlsnRCp3
	DMiObVzpeCK1Qh3b/QVJQWgV/RthF3SjcYpUTi/FIAZQB9ZabqvDmkQpbXB9Z3aXMIa+it5ziDOwg
	kq2Gy45VwuzESTK48akMWb+jjLXJdxZm2Bu8w6kz1cKASA0CE0NUaDykP8p0d2/t+97ErKVJ0Fq4w
	TkRhVrP6IIoHwhU/zu0YnRa+4KiWPmptIRg55f0vBN1pynq88FeIR1k3TfCrHg2QHlgCJWdOIQYYi
	MkH+P3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdN5-0000000Er1b-0tyV;
	Mon, 24 Feb 2025 18:40:03 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdFu-0000000Eort-1olt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:32:39 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54605bfcc72so6517271e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740421956; x=1741026756; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N39GuLsH/GHnLWfi6A3DaLvaYCvcqGiUvrrDOML07K8=;
        b=AiLwS6Jr9o7OBQY4Rbk4YtHwP2HVsyNfQqP+v04WWiMc7/AftD0P/1MEQco5UdUAMv
         LpVqav2xx1dV6LxvMKe+RyQ11lkyMD1G35Kc6HBM124ItGECWMn+lPObiD2gP5cSPMqs
         ayrR+Zpe5PivavMY930TVsv4L5fVI2NwLLOpYHWRG8UvBwWvxp2iWZwx/JWNDbOkxbsj
         pwAQp7JOspw2ZTTTAXkQBP5KIZ8FFEUXtjMulEJk/B7nYCioq0fbLjF8mS29g+2xBzEs
         kMnUrTwmHqGlcBQrsCFJ5SyFHtnSyFV6haES9EgN+PpYjAuj2PxWcCFhWEEpMx5cFRbS
         ymeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421956; x=1741026756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N39GuLsH/GHnLWfi6A3DaLvaYCvcqGiUvrrDOML07K8=;
        b=VtV0zgCjjn32AaG0kcj/F7XBlgDkPQ5nLT1fFO0Me90GJcmSBBMH1jvKm465R8wZcS
         6+BDcge1LlP+vO3dUzysQJTl3DdQVSIAnN+5/UqJmpscmN+Rw/nDco2Cyqwy1VUYoRRb
         xA1FSdFX5FV2CvrYKZRChL/l6bc86rTiXq6bBx0Nddx9UrSL1m1ihhgqdsScu6QTr7Rc
         AcvLczqjnhz15YuA+dBGn5mKp6GUOejsZc/ud9l0N661mQiqlt6zj9ijOF4abwir9IiI
         0Z3kYm5vlPKNahSLlzfLKwBS01hIF2TQAA+ab5X7wl6KeICjxqd5AHW7PDUrQ3xyqVyO
         jo9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQt4sgNYyvwQaV4KdQbNlGnkbLb9DHYRR9deBBjqYNPYpLUdAl1xO2a3PvIdX9jV76g2mbC1IHjPyyWiUkQa7u@lists.infradead.org
X-Gm-Message-State: AOJu0YzMOP0+GqDbMkePFup8cU/HV4b9uS1ZCrH3an9MOCs2CkMp8jq3
	V9Z9ACHtEAcNRkYYRIFzFEf0x6y/FkRVOUDpM294njGuLeeX6yOd
X-Gm-Gg: ASbGncuFI4EeMMRhdWwxuEsGsemXFA2KXC5TJ8zX41y9IUY94Drb435nYWz03qWwfS+
	2F3DO7iwyycObecVrUIER/K6u+YNpKdKD+rae1BAkSk58o3Hn0k8NdjUXj0kxzOo7Xi/6VDdsEx
	tXzqoo66nI6or1QZ168GxLsSBfrYM0g9uo7wofl8YYi1mSpZ1JRhUKIjQLSBwZ2hC/0/ySP6KVA
	rFDvMLNx2x+eHHjGKP/EiDhkfvLFzpB9RdzfDtXMayEU9Uuq3Mxlw8DWC5J/AOkeCqRWs7S8Si9
	ftg7mqRpR+9caauBhmNr14zIFeKUVaYq
X-Google-Smtp-Source: AGHT+IGuoaXIvmZgefmGuVB5f6nZE8zpUKpcTq1FcueeKygwj6PXc2F3VGYVqvK8LafWdWjrrE8P6g==
X-Received: by 2002:a05:6512:159b:b0:545:fdd:9ef4 with SMTP id 2adb3069b0e04-54838c5e1bfmr4544720e87.8.1740421956169;
        Mon, 24 Feb 2025 10:32:36 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54771f058casm1259809e87.188.2025.02.24.10.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:32:34 -0800 (PST)
Date: Mon, 24 Feb 2025 20:32:29 +0200
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
Subject: [PATCH v4 01/10] dt-bindings: ROHM BD79124 ADC/GPO
Message-ID: <4d390ca96434a8ee35c0c850cfe4fd49e99db653.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OoD2QNHpBXvMQxnR"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_103238_481673_9EC6E6F0 
X-CRM114-Status: GOOD (  14.61  )
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


--OoD2QNHpBXvMQxnR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add binding document for the ROHM BD79124 ADC / GPO.

ROHM BD79124 is a 8-channel, 12-bit ADC. The input pins can also be used
as general purpose outputs.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Revision history:
v2 =3D> v3:
 - Restrict channel numbers to 0-7 as suggested by Conor
RFC v1 =3D> v2:
 - drop MFD and represent directly as ADC
 - drop pinmux and treat all non ADC channel pins as GPOs
---
 .../bindings/iio/adc/rohm,bd79124.yaml        | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rohm,bd79124.=
yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml b/=
Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml
new file mode 100644
index 000000000000..503285823376
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/rohm,bd79124.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD79124 ADC/GPO
+
+maintainers:
+  - Matti Vaittinen <mazziesaccount@gmail.com>
+
+description: |
+  The ROHM BD79124 is a 12-bit, 8-channel, SAR ADC. The ADC supports
+  an automatic measurement mode, with an alarm interrupt for out-of-window
+  measurements. ADC input pins can be also configured as general purpose
+  outputs.
+
+properties:
+  compatible:
+    const: rohm,bd79124
+
+  reg:
+    description:
+      I2C slave address.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 1
+    description:
+      The pin number.
+
+  vdd-supply: true
+
+  iovdd-supply: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-7]+$":
+    type: object
+    $ref: /schemas/iio/adc/adc.yaml#
+    description: Represents ADC channel.
+
+    properties:
+      reg:
+        description: AIN pin number
+        minimum: 0
+        maximum: 7
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - iovdd-supply
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        adc: adc@10 {
+            compatible =3D "rohm,bd79124";
+            reg =3D <0x10>;
+
+            interrupt-parent =3D <&gpio1>;
+            interrupts =3D <29 8>;
+
+            vdd-supply =3D <&dummyreg>;
+            iovdd-supply =3D <&dummyreg>;
+
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+
+            channel@0 {
+                reg =3D <0>;
+            };
+            channel@1 {
+                reg =3D <1>;
+            };
+            channel@2 {
+                reg =3D <2>;
+            };
+            channel@3 {
+                reg =3D <3>;
+            };
+            channel@4 {
+                reg =3D <4>;
+            };
+            channel@5 {
+                reg =3D <5>;
+            };
+            channel@6 {
+                reg =3D <6>;
+            };
+        };
+    };
--=20
2.48.1


--OoD2QNHpBXvMQxnR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8uz0ACgkQeFA3/03a
ocXYDAf/aZy7lHBMV/y8BQfayGuvRMNa+yzPpPHq/dU6XF5PEhMqMJ3UsVOhR+1d
UGxrDIENa7xyOPAw3ixngeMix77PFLLj/SwSFcDID2NWy5h8HsjTPdIlPZ+/2m+N
5f7BlMlr7tJYGxTerh8S9zrB2JjLQu15lX9FKyjbGwyjBeLJNLur6WyGPLVKxlKC
lYtZN4TXAoU1slNTQkNhaOeJA6MBzokAx0R9Le6wvULUuzyEykpl3k2ULVnOXR8/
zSGA8NBGCgJYExdvpYqYy8x9b8yZec+Lz7/OxFKuylNYCSm0E6K6nNJQY+9V3Pt2
m0cy3LLxtBGaVFknxcgYneSUA3z7iw==
=70g3
-----END PGP SIGNATURE-----

--OoD2QNHpBXvMQxnR--

