Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A126CD343C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1aXsqo7RRpBCeWkw344Jz5WaPV5MLoS9RXAioSHafc=; b=o/bNk+VbyDSLn5kwWiVGOwsIXf
	BU/zYcAWx3q+npkisyBJuK+0blzX7eSJr4cIv9uX3ww44b6qb2nLc1nbJHCGNEJ7/uwCoejKTcQyl
	2uGKQ4/YRPpICfyKT9qoOKSfBR6c9tQUD0y5my4+0HAcrKcgXE4jR/j/48fO8lpUaPUl+FUignhzK
	/U9gEH/06vSrRi55bBqYyl/dw4OoUiIS16iFAtoBvZ3uXL4wjRHMCI8I/IFGzES9M2tDQfoey8GWM
	C5TFcf2u2RodjpHI/cUuuBfNHE1Sc/87mh8D91aIdxytVXaqEZRNKsgo5d4Qmy6oY9wIJjb8Y2M0E
	UqFstLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyg-0000000DyTJ-35No;
	Mon, 04 May 2026 18:25:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyV-0000000DyAs-3ZtT;
	Mon, 04 May 2026 18:25:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B679744522;
	Mon,  4 May 2026 18:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8983FC2BCC4;
	Mon,  4 May 2026 18:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777919098;
	bh=dq0DlKHPTmE3lZvUM4sz1vUEKC1qT3yPMFbvdbPnpkQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YXUe3lYnl48fmvg8/z9OuTgPeQ5Vg5FoZz9rCJcyzjHQxglBpc7GY0P+nReZmIkfm
	 sY0si/UtxmWG8jNZP4waMxyLfeHjopPuiEh6ZDKgk1GZmhZ5ijiN5nD1QMkWEen6QS
	 PrncMNMShnnpzU/1zHBl+IWFmEoWglwdnb34g5ODhFuYJANNW84OR9FVS4uOrZV1ca
	 KeTdmL0Uleiadl7KjxkYZjDtnVsySQVLlDsJPoq7ebLA0iw3zYDjlyl5Z/9Ao/cvL6
	 CMYcHw9Y3W+Ftz8Ue85wuyBhTmk7STPsD7QJ1nvOK2qfBGJUKM/XnZvvr2TBS2OeBh
	 KYB79dMaBRDLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76741CD3427;
	Mon,  4 May 2026 18:24:58 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 04 May 2026 21:24:53 +0300
Subject: [PATCH 01/13] dt-bindings: iio: adc: add mt6323 PMIC AUXADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-mt6323-v1-1-799b58b355ff@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919095; l=2722;
 i=rva333@protonmail.com; s=20260325; h=from:subject:message-id;
 bh=XPIXRDZjIr1oHvzoo9sh4iZKYAKxVcZZDRCPHSoj0Zs=;
 b=6PgEHIy0LQy0rccGbN1mtBbpxZNOpoWD7AzrYh5pCwjNaWk8d5CeZXcYp9p+hWzjpttEQC1a4
 n82lAnVqs97A8v9uCRo+z553P0v6pmYYduZNXxmLK1JJ5X3SUlPMaEW
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=euuVBZGtA2Cqb8Dju84qpQPhvwxyUirJlXpqEPQWKBM=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260325 with
 auth_id=695
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112459_966316_AFEC22A5 
X-CRM114-Status: GOOD (  10.75  )
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

The MediaTek mt6323 PMIC includes an AUXADC used for battery voltage,
temperature, and other internal measurements.

Add the devicetree binding documentation and the associated header file
defining the ADC channel constants.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 .../bindings/iio/adc/mediatek,mt6323-auxadc.yaml   | 39 ++++++++++++++++++++++
 .../dt-bindings/iio/adc/mediatek,mt6323-auxadc.h   | 16 +++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6323-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6323-auxadc.yaml
new file mode 100644
index 000000000000..7dc1ac8bf253
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6323-auxadc.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/mediatek,mt6323-auxadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6323 PMIC AUXADC
+
+maintainers:
+  - Roman Vivchar <rva333@protonmail.com>
+
+description: >
+  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
+  in the MediaTek MT6323 PMIC, performing various PMIC related measurements
+  such as battery and PMIC internal voltage regulators temperatures,
+  accessory detection resistance (usually, for a 3.5mm audio jack)
+  other than voltages for various PMIC internal components.
+
+properties:
+  compatible:
+    const: mediatek,mt6323-auxadc
+
+  "#io-channel-cells":
+    const: 1
+
+required:
+  - compatible
+  - "#io-channel-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
+
+    adc {
+        compatible = "mediatek,mt6323-auxadc";
+        #io-channel-cells = <1>;
+    };
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
new file mode 100644
index 000000000000..c12a21e7ddea
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6323_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6323_AUXADC_H
+
+#define MT6323_AUXADC_BATON2 0
+#define MT6323_AUXADC_CH6 1
+#define MT6323_AUXADC_BAT_TEMP 2
+#define MT6323_AUXADC_CHIP_TEMP 3
+#define MT6323_AUXADC_VCDT 4
+#define MT6323_AUXADC_BATON1 5
+#define MT6323_AUXADC_ISENSE 6
+#define MT6323_AUXADC_BATSNS 7
+#define MT6323_AUXADC_ACCDET 8
+
+#endif

-- 
2.53.0



