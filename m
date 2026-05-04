Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620C4FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9+S973VEhtbV0vWBhIsDJH6lSw/g8GJeR7OfMw8/Nw=; b=eIkXfwailzsmiYNTF/ekqYIWiR
	912rswldVJ6og/UT22mnLjVaItHSTcSiadtH+0DynOesgR5UR57kFiH1mNuOomNFiBiLYBO/QuwZE
	xESNjmF2Q7/+FWn8P8xaEi+SUlNzW8+wIfgyiWXhGzlHL+NOIJskrflEnGZRfugZBMkWFAgPsmLSE
	ILDuYcGJgbTgbCrvjD+TS6p1YKoELFtGFjJaYM1q7TnZwoUYoUuoTgAzKnzyiO/WExRgFxP/8OsRy
	z4W0iJbR/3YuBvUl0pyXgaQpPLFT6HcvHBc4yAQNSzfZJPg/PsCKhivvFT4Zao7RRU4j0VmNc5xYX
	eZVU3XFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxya-0000000DyKx-3h68;
	Mon, 04 May 2026 18:25:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyV-0000000DyBO-3m0b;
	Mon, 04 May 2026 18:25:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D665F4455F;
	Mon,  4 May 2026 18:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A81A2C2BCF5;
	Mon,  4 May 2026 18:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777919098;
	bh=KLZKepons1ktWUi2cBQErmKekVgkW3Se0X3Vct8Tzv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B1mO8BP2bXa0mSeeC6gqwke9UdeoBN4BX+2IJ0Ya0DQQdDwzhTvNxMSxEcqmuShAA
	 7/gQmd3onHmtystCjQTzrBC5Wh84Y50FyLiMjuzDO0eza1GZkezcC6LNjR4gC0lI6v
	 kttLs6lSd8EyfMWpQ9Lq06Um+fVa4/3Fo+i2Fj41I2/wKxyLBDlUtBkA/f6tJZWal2
	 jXJ5IuDxU3a7vax+fDKwFePN5W9ZalBC3MhIUENFxm2BopTB2YHqHVIPsKHoRj06MP
	 9PXZ8b32WDLBKsOifR5sd8yV2zZ95ICRc/MuxcHgaAAqBeV8atQ/sTwtdhOztO7McP
	 6WXhao6WeLE7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D107FF885A;
	Mon,  4 May 2026 18:24:58 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 04 May 2026 21:24:55 +0300
Subject: [PATCH 03/13] dt-bindings: thermal: add mt6323 PMIC thermal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-mt6323-v1-3-799b58b355ff@protonmail.com>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
In-Reply-To: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919095; l=2523;
 i=rva333@protonmail.com; s=20260325; h=from:subject:message-id;
 bh=Y0jGUqql3soeCei8ikkZ/UAUGnGbcX1Kt0zfmNLXZe4=;
 b=lQx9pnqPRHZhANCq6Fot6muIYsncfpNjwFildJFkPJyUUmvivT5WyxPskKeUZyyj05VzSA3s8
 QsmJn2RmGknDE3xVFJJ7MX3q+cv0iIOMyuptPHzDdSNh8XjAkhcp4/S
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=euuVBZGtA2Cqb8Dju84qpQPhvwxyUirJlXpqEPQWKBM=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260325 with
 auth_id=695
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112500_048215_6CFD3793 
X-CRM114-Status: GOOD (  12.91  )
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

The MediaTek mt6323 PMIC temperature can be read using AUXADC channel.

Add the devicetree binding documentation for the MediaTek mt6323 thermal.
Due similarities with newer PMICs like mt6358, which include more than
one thermal sensor, the #thermal-sensor-cells should be set to 1, to
avoid breaking devicetree ABI in future.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 .../bindings/thermal/mediatek,mt6323-thermal.yaml  | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,mt6323-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,mt6323-thermal.yaml
new file mode 100644
index 000000000000..1882816ba274
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,mt6323-thermal.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/mediatek,mt6323-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PMIC thermal
+
+maintainers:
+  - Roman Vivchar <rva333@protonmail.com>
+
+description:
+  The MediaTek PMIC thermal sensor uses an AUXADC channel to read raw
+  temperature data and applies calibration data from NVMEM.
+
+allOf:
+  - $ref: thermal-sensor.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6323-thermal
+
+  io-channels:
+    description: >
+      IIO channel for the AUXADC to read raw data from.
+    maxItems: 1
+
+  io-channel-names:
+    const: vts
+
+  nvmem-cells:
+    description: >
+      NVMEM cell with phandle to the calibration data provided by the
+      NVMEM device. If unspecified default values will be used.
+    maxItems: 1
+
+  nvmem-cell-names:
+    const: calibration-data
+
+  "#thermal-sensor-cells":
+    const: 1
+
+required:
+  - compatible
+  - io-channels
+  - io-channel-names
+  - "#thermal-sensor-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
+
+    mt6323_thermal: thermal {
+      compatible = "mediatek,mt6323-thermal";
+      nvmem-cells = <&mt6323_thermal_calibration_data>;
+      nvmem-cell-names = "calibration-data";
+
+      io-channels = <&mt6323_adc MT6323_AUXADC_CHIP_TEMP>;
+      io-channel-names = "vts";
+      #thermal-sensor-cells = <1>;
+    };

-- 
2.53.0



