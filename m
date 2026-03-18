Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903EB103E197
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucI1VpoOF8SXIqxz1Ls6Q9HI1Th2/zJLOADwE4rqh4E=; b=nYaKBg2L1W1rZ65cNLKmjXBGZh
	kMRKkJo7QRW9XSY7X7cItU1WlDGr9deZ3xAeeyU/itP5uGPn21Lsy+uDDGqgHGz7buDitYrQyzlwK
	zVmN4SwKsKTXp/a9HrW/zm+w+4a0G4LarD27yexl+sO3kfkPEa8taQAVit2HX8NDd72PhpLhUEM9Y
	Io2IqZqmYDLb7VdCJ3QpJs8vXxgRZt29/QS3nmuFUpHV4vEJDUAJBiH8OMC2GufrtGZ9d3Sftkcc3
	Ry1ldc6jaGbdXGMG+W5yGyRWnXd7MMs0W0cYwWgV8d5zlDHgaV5dnitql2Av9padI/7sxd+p+y1kS
	AsBh3FDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soc-00000008hdz-29is;
	Wed, 18 Mar 2026 15:28:10 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soV-00000008hXj-0KIf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:28:04 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b98069e41b0so93167766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847681; x=1774452481; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucI1VpoOF8SXIqxz1Ls6Q9HI1Th2/zJLOADwE4rqh4E=;
        b=hPrhCqHl+XSEhn5SncyAHjZ13C7T3whW2NLqFVxZF8tp6yf5a51yRhUYAxrspD3ezZ
         6TRKDqDJt8qlv97iF4RrPV7oEY30aEt4QLEx7Plft03XOXfJw05A+9soR4diqCjCHysA
         CI9huCidRqmPDENQpFZhLJitNHP9UANu/rt4G3bIHOsTIrDegf6T6rEuUCMP2wsXiRX/
         N8DcMSnckDtbrC7pl0YjrUM1pKoM0B0N/twSVtH5gsSlrJFKUZI5g5Z0cnqEUP7TKity
         x4hV3fgtm/+iVq/+ewoRRg63Lc0yArVWl+lsxMSbc9lH23Hd5e4X19HO0XWguZSSSRDg
         ABvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847681; x=1774452481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ucI1VpoOF8SXIqxz1Ls6Q9HI1Th2/zJLOADwE4rqh4E=;
        b=CgqNrphzh8gdoz/VGPRzHX48ouJPrDP8sMbwdSKUFKYVVa4juqXIKMpWROk3HW9Cth
         kcOBIoMXoXQPKI3tvxE8R/zxOXcqXMuWjKR9h0Mie11AyrFx6Ze4EByfEMW80p9Yg7D9
         eCibHG0ym58tMfQ76dtwWatekM43A8iCyZk/kXyElZpuv6FxgIh5PpQRcqkvCX3t3PPZ
         L+PYk1dLakanZx1LKX5OJopPdx0KUeHC5v2z5KKf7TvZ0MoxFiZHCfoDtPup5V7+IB/D
         33PKuwT39MmRV3nhBt5K0p9phc5BQRXDTp8SdXrwyi7qDFVZWdAPHyreOyVZIFQhwh2O
         y/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2SJPiODtBZ8UKmytpgUXIyKqK0EIX/RQABIkUmgiLZdRscf2tdEwniaJqalKASKb3rF4n/WlmxlSZ0h2bUvpt@lists.infradead.org
X-Gm-Message-State: AOJu0YzTO9aflHPR4Rpd7qoYfQUqbSiUBZVpC2HNrhHYHYU8t6LJsyWI
	KVHggTdW7zvUnOD8XFbHaAiCgO0e2OHIAFMo+x8WkonY2eEH7vTNJt74k9d+GTmwykg=
X-Gm-Gg: ATEYQzwng7RdWeLT/ZOVPze0/ZcrgQG75r//d0nXiQgHciKtZmYGkDBP1eA/h0XDrz4
	VRXKQkmp+ggFdQJSxdni7E2BvbY6Q1N4OYvdqAof+rdHyc1mdzorMbxFIZdG1aA43Jm7II2+oct
	162Rmsyv25hFYiFlUYffCTatgjg5QDwyQ9/RUXxcqWY5kjh5GSCHY3UpxPvlIrKYM6VfI0iSLd1
	FXF3uxpHz6X3GxzzxXWILA5Ioo6pc8Z/OSagSEPNIUDVnWEJQlKyxAWr2K55l/DgMd8TNM9Y3S9
	PRhdFSYO8KI05Hq3OqtNCu4iIGvH42YoyBQ+ebhYUY88DR6JWquMHPKshk1MgpXQOL1OjhvFrVf
	0V4klPuWKesvm5dIcsWXkvnSrvgdt0JZMBNZWLib+J9XL1vFjqexy8xn3tX2RfQDLrpvM9G6XGL
	nLSZigUaOPTlf0qgT5HzfwflFR72p6NUFJ25gfY0uRyjkN93agm6QK0RMqQtbpQNnop9+Csy+0I
	G8dlWwBRRKot9Q=
X-Received: by 2002:a17:907:6d20:b0:b97:c068:555e with SMTP id a640c23a62f3a-b980f8f881dmr1151066b.1.1773847680981;
        Wed, 18 Mar 2026 08:28:00 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:49 +0000
Subject: [PATCH v8 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-4-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_082803_144013_3A69DC8D 
X-CRM114-Status: GOOD (  12.80  )
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

The power domains are a property of / implemented in the PMU. As such,
they should be modelled as child nodes of the PMU.

Note:
Because the properties added are 'required', this commit breaks DT
validation of the existing DT for Pixel 6, but a) that's simply because
the DT is incomplete and b) a DT update will be posted once the binding
is accepted.
It is not possible to write the binding such that it supports old
(incomplete) DTs in addition to the full version, but as per above
it's not required to keep supporting old DTs.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v8:
- move comment from commit message footer into body (Rob)
- fix incorrect use of ranges in example (Rob)

v7:
- really be consistent with quoting (Krzysztof)
- drop invalid tested-by tag (Krzysztof)

v4:
- consistent quoting using " (Krzysztof)
- add samsung,dtzpc to example
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
index a06bd8ec3c20..52c47252b801 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -16,6 +16,14 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
   reboot-mode:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml
     type: object
@@ -39,9 +47,23 @@ properties:
     description:
       Phandle to PMU interrupt generation interface.
 
+patternProperties:
+  "^power-domain@[0-9a-f]+$":
+    type: object
+    description: Child node describing one power domain within the PMU
+
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: google,gs101-pd
+
 required:
   - compatible
   - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
   - google,pmu-intr-gen-syscon
 
 additionalProperties: false
@@ -51,6 +73,25 @@ examples:
     system-controller@17460000 {
         compatible = "google,gs101-pmu";
         reg = <0x17460000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x17460000 0x10000>;
 
         google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
+
+        pd_g3d: power-domain@1e00 {
+            compatible = "google,gs101-pd";
+            reg = <0x1e00 0x80>;
+            #power-domain-cells = <0>;
+            label = "g3d";
+            samsung,dtzpc = <&pd_g3d>;
+        };
+
+        power-domain@2000 {
+            compatible = "google,gs101-pd";
+            reg = <0x2000 0x80>;
+            #power-domain-cells = <0>;
+            power-domains = <&pd_g3d>;
+            label = "embedded_g3d";
+        };
     };

-- 
2.53.0.851.ga537e3e6e9-goog


