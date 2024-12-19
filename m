Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F82E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 04:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kgYKVg/xSi0OK6+9rmWNn2jW6wdrAhpNb9EJq1WRLWs=; b=UvGRD8vlXR2KPBf1ayTqhLZeQ5
	irZ/x02M+ISfXDsWp473l01hMPa+rNukcmWxWN4INjNsjXA4nmHFqy0WCKNK6A2+SZIWfAspnxZ57
	grMiNLWC/5/FgNwnGh0ihwDLxd16EiVrhX+T8lYVeIJIM8uZITI9PYAX9SQYf6Qh7kOSLHOcAH+9F
	YR+IUQcu7dLoRvoP6GK3IW2wauGyNkdUF2ZZDceVa/ZjXkZMZK5WtxkMUzc9X/eMkbPmvg26W1grQ
	//u6OlkbP7bFQOQsIX0Pu8DBcZ7Wj9E9U1yBO78Jv2M+4+0l+/WK3sJVS8oA+o3WWdbtkiHWtoIMW
	YljPLqHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO7tz-00000000lyz-1e1d;
	Thu, 19 Dec 2024 04:12:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO7ss-00000000lto-1iCC;
	Thu, 19 Dec 2024 04:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734581494; x=1766117494;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=R2Wn9SYot7N14emTkPFRNkyiryUGhE+kyUJk2LjZOi0=;
  b=EBr8rPR4102+y7IML+FcQbOJ8Ug8bOxtvFabhmxFOCRlNjAPq/K1OpKQ
   Q39vZLtvgF8ZZD2c08L07xjjwNKq+ysSqJDQgFfWoGKDBZdx7CehZyhNW
   m+UJaYggpgTyHfJ5tCFwZlZeZQ8v0Min+HAlrpozHUydAO1txnVMJmvv6
   /ksEkUe7PA1rZbEF6bsKXcQPyf/6FftWF5T5jrZd/MBYALbHFVjDw3Z2a
   sGcOpQdAQbB4kGshMo5HCLaEdLY5SavKvO37kBSboEV/da0XZ03ZH7hUu
   BbKMaeDVa/MUuurc6yGPHjtHUl+KvE8Y+GGIC65aw2EsIRjP5o/feyCMF
   g==;
X-CSE-ConnectionGUID: Bu64aKVFRiuMCGIiLDlv2g==
X-CSE-MsgGUID: rY+Ot2OJREaaV8hnCrck1A==
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="203189664"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Dec 2024 21:11:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 18 Dec 2024 21:10:51 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 18 Dec 2024 21:10:46 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Thu, 19 Dec 2024 09:40:41 +0530
Subject: [PATCH] dt-bindings: mmc: move compatible property to its specific
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com>
X-B4-Tracking: v=1; b=H4sIAMCcY2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0NL3dzcZN3inPwSXQNTcxMLC8uUxNREYyWg8oKi1LTMCrBR0bG1tQA
 n+/BZWgAAAA==
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734581446; l=1926;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=R2Wn9SYot7N14emTkPFRNkyiryUGhE+kyUJk2LjZOi0=;
 b=E+4ohOGm0CaZHEhi41ta2R+gPmJ7QEzV7VjPBewgBaV6JA/zWVQkda++p+wMyWejCmzWZGXVu
 wG8dVRWrIxcCsm7OfEMT6IptgaUCI0vnKZNd5+qBf+W2cNXEuM2Zpz5
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_201134_731028_92187DC3 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Move the `compatible` property into its specific binding to make the MMC
slot more generic and modular.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml | 4 ++++
 Documentation/devicetree/bindings/mmc/mmc-slot.yaml              | 7 +------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
index 022682a977c6..7600a4988eca 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
@@ -54,6 +54,10 @@ patternProperties:
       A node for each slot provided by the MMC controller
 
     properties:
+      compatible:
+        items:
+          - const: mmc-slot
+
       reg:
         enum: [0, 1, 2]
 
diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
index 1f0667828063..84c4605658e0 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
@@ -20,19 +20,15 @@ properties:
   $nodename:
     pattern: "^slot(@.*)?$"
 
-  compatible:
-    const: mmc-slot
-
   reg:
     description:
       the slot (or "port") ID
     maxItems: 1
 
 required:
-  - compatible
   - reg
 
-unevaluatedProperties: false
+additionalProperties: true
 
 examples:
   - |
@@ -40,7 +36,6 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
       slot@0 {
-        compatible = "mmc-slot";
         reg = <0>;
         bus-width = <4>;
       };

---
base-commit: 7fa366f1b6e376c38966faa42da7f0f2e013fdab
change-id: 20241219-mmc-slot-0574889daea3

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


