Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF02BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hUrd+Gyy/ajIhuvrP2MqW/IazkO3sAPZGITYXZm04k=; b=muTI1JCWjGcbhjXl9mwDnkEpKE
	GEqK6DFu52ICqUf43+WXRCqENJble/JZg5DuYFN3XlcnNGWxpPR+m0rAs8XDCMFHjMyPFNMKlrjz5
	TypQv6X+vX8QJJ9qkdA8aDzxmC3/sY8Xym4en06ZW+30PGirLLduFnPQjR0kU+gyFqpf96VKDRYwR
	z4wW28KbTbY/kSCxEjJm/OjwhCk25YItbAVLTWSFVI3Ny4HAfyqapTCQlx39YTnuyfYkfEkJIIjop
	KoVdyM2VuQXqZEL2FgREn0guv/3Gzi3s1h5dC03oO3YccqveDqAVzhmEqWKQ2XDAAb8hjAK3fwtPj
	6ubpeKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjGH-0000000CglN-2nwC;
	Wed, 19 Feb 2025 12:33:09 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjDX-0000000CfQu-05VN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:30:20 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30737db1aa9so62785061fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968217; x=1740573017; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1hUrd+Gyy/ajIhuvrP2MqW/IazkO3sAPZGITYXZm04k=;
        b=cEU9++BEQYQsczZBPpm2+ArHAwSmPMgZ6y3lY3tezX9BSbBuG5kawJuh9/LHrjsfwH
         Cci1QyLAqcYx1POezumIBhwnQanB9/PRZFEXY2ZmuhiQ2RILn5nNjG0TjpxgEducxNp1
         U9X3OLG57FimaNNurRoTr1xediYvK8WBBVC/wEoPf47Yc1wH2CHmPI8j/6Sy9RC26zt6
         AVReqAcSrPzVNfRoKuxGKSONQxIoSDlgGkYEIGrX+a7ulQcrI3DEkV9+oBEEJwYP/efS
         37fFyOv9lMZQgLZ/MkF6fhMNQWaaS9uPV4lQ/p87ebYK56DZDa3lThcHbrvsUoJZknk7
         ij4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968217; x=1740573017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hUrd+Gyy/ajIhuvrP2MqW/IazkO3sAPZGITYXZm04k=;
        b=KPPbTwBypvaG7K/RMMak4PRXShQ2PZUOfgH2bhDeNre9CTxQX5YgyuDw8gWf1mm+l5
         +mTySc9XEJosTq4/9yfPFCTwRZowfjQo1HXBj6H7zZWH31QoIlKsQ47htDWg2w9f4s43
         /CwMZTnUbNpFBiF5ymNSjz4oNj/KqRtZMPsPL3T4ira6xJqc0VMZTeesWz+Sj/aYuKWi
         Y0UjGXXWwK5YgQ7Pvau/340Q/TNkGyszQ8DwEP6bYRBoPLxdTUZQtVUS6CFK8V+7oBCy
         p/QWZXnp7pvGgddkyUazzkJjjrYq0SQL4BVg4a10fP0IsJff8Hy6v5BoildHk3JKiF4I
         HmJA==
X-Forwarded-Encrypted: i=1; AJvYcCUBN0vrupzPffHzraOhENzQd9xX2jCa0RH6Vtdjv+yoGGVX+U7Hs0DKWR21oVcG/RGBDtmcbaPQHWFASntGiGFo@lists.infradead.org
X-Gm-Message-State: AOJu0YxvtV2o4dOiSzhEenvzVdvJIUSMIm7XzSGQ6ZBYtib+/L2Q5hCR
	9+PAUQo72BHFjAC5O37x/U94RpXK2W0IhYm4VwOkFuSGoeXphvm0
X-Gm-Gg: ASbGncuUBpxq0VQ7u+GJHlu8uijY+LyRsOWeNYnNCgIh4DPM67Y5EkLXk6algmyhQLs
	71QGtmg1rJmxm3Rqb/Lu0lJ190KVgpIHsPHQED3oYiQHPyCvl5cbq9MbH9mP/EZJK+Cv/LyRe2r
	SSfjvPchPAbZhnmACcuigCrTsszo9w0ni/JFJ0GxPKnmlV9TAf2TpkACvAKV4wl1Xv4TmAaAvsj
	NXd9LQdqYPVWQ38Us17fSjGv3IMNyfX4h8sALdoCI+rWT6W4qPOuWk53FRN8N7p6ADqDYuym43m
	N6gwhjXjWLcZRk7strzYEg==
X-Google-Smtp-Source: AGHT+IFF8ZAOezRn1kWhpmBq+gPrOLGIPq15CfW2c+RFEDW/9HuXUxU0qk6Hp+MJg1WFZfej+FArLQ==
X-Received: by 2002:a2e:b176:0:b0:309:25f6:8dcb with SMTP id 38308e7fff4ca-30a44dbb334mr9639561fa.5.1739968216796;
        Wed, 19 Feb 2025 04:30:16 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309e57cc68esm13923301fa.114.2025.02.19.04.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:30:14 -0800 (PST)
Date: Wed, 19 Feb 2025 14:30:09 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v3 1/9] dt-bindings: ROHM BD79124 ADC/GPO
Message-ID: <52db5ddb99dcd8da847f8fe595efa74c3ab1573c.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R4M0D4QEb5Wt72s2"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_043019_061493_75D2EC53 
X-CRM114-Status: GOOD (  15.10  )
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


--R4M0D4QEb5Wt72s2
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


--R4M0D4QEb5Wt72s2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1ztEACgkQeFA3/03a
ocU2GAgAi1f9EhPjwB6NYTSl71jogLZMg16q4DlOdHT5/QC1eZtxXbrJF0fqBJ9b
ZYymKkMVy3nlmcL75k/CoKlQFQyDLmJ5QG/bb2TsI8P+WvTTkW/njLa9K84ZC2cB
rd3U/DxERcFfHZc2mCrJPIWsihlIHDcISg6dN14sjtv9EV1aSj4xufwmOxpqSmLO
nyIjYvI3wPWsrxUCm78ukA02eDjmyPnXQwI5D7vANv4YSaoZf9PTYZ5l01iWgNw1
mwKjV9GLgBtz4p1+5TJ/R6+JT01hf6lriq6oiPL4Uf6aWn8hJoUbrceEk6ZXCj9F
sZJB9KYXRQpvgzQpYoLYwhSzkJ2YGA==
=A04d
-----END PGP SIGNATURE-----

--R4M0D4QEb5Wt72s2--

