Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F89C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 16:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRH17cccG6/U4hLd0fePgcNIt42zxj9hdhIfpswv9sA=; b=0tT3qzYF1GZsNupgg8AOKJyyrG
	xKKZNVwVE3mpf4iYr8NNyglQ/t8wFMU99QZid9r/18aDvBptYgoOLJ8/Wsv/Od5I9mTqrlwFPzHVx
	30gjEL613/iRl/BxknO4GRBLJYv/gv/K3Zc3JGCo5o0kz20fudSobf00ToeWR5FqadNH+dtZMOun7
	8aSTvxFwuGeAV5/fjahLamlo4P9MhXfwe88nzvsndFULgT3D7ct4LmbRBGXEkQ48KhAqJcWIy3SiT
	sEhmaS2Cqg1NX6v087V7XnkdRW1u+nXxwaTG4fFlA3DF5vpxORKuYO/6qLcEy3wyf3tq5LSVUg4Me
	UWYZhd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2bt-00000006LlY-2c6I;
	Tue, 11 Mar 2025 16:37:41 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2Yg-00000006LQd-0mEe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 16:34:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39149bccb69so2189719f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710860; x=1742315660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRH17cccG6/U4hLd0fePgcNIt42zxj9hdhIfpswv9sA=;
        b=erYXFR76vrzGFv/J6Tb1vPI/pbhLkJOX9cJJhBux20ODNJHgPHvg9G5mqA2tv9OJE7
         gjEjuz94DsDtpLmvCcx+vpCfMTM+CDrpoiXN/TGkWaLDWmHvMOE5FRbknoSc6zb/pcbO
         cUgqoqc2F0bB9dInGyoVILsbLJyKopWaUg0D1vrgSASjEI0Ffrw965FmkuIHuNDDv6E4
         sIg4ms2lkif1BjzVo/snhEuyJy/0HEBpIo3ToFZSIWshzvsTBewTVoZsYJfpPrzC5Kvm
         vgUN/WUosasWbLJ8P6ceH+M+0570/m/lhtaOW7lJnsUhpS3ZD0CIigOGWk4z2e4/y8hB
         blKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710860; x=1742315660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRH17cccG6/U4hLd0fePgcNIt42zxj9hdhIfpswv9sA=;
        b=XIM/TVUHzDMmombIX4H9m/tyjONgqUa1ucL67OLTAJlPtLmTJbRlkpc3CkQubct4es
         qD9apA7qbiL/djPAhUQa3pWG+3KHpNSMXRkR2nmwEo7t2n1iK98w4+UG7GWaNh0M40iN
         TSqgYcJRu0wgA7c9fhB6AI9ve92VNYQdkBqSr52KO/sRZSoWRvuDv/pWmiZW3OzXh7ED
         aMrUCVBuTetCbK9zqTT43nFGjGF+rhkpw0lHad9ee4cnLdxG93t9ZxHW3mn9U+CeHEE7
         YktLXhm/iH6p83meCSRnuzzD8WTjK976+H7srccJvlMhgKYpkurSzqm8hVhwf7PHs0d8
         WswA==
X-Forwarded-Encrypted: i=1; AJvYcCXAzat25UGeNIVzwAx2Skwvw50Af0VuiIVW0pDl+z9coqCjxOP2Ff+nZKpKvsi/TU8VqfdhPBEHzMLuDDtH0ypm@lists.infradead.org
X-Gm-Message-State: AOJu0YxFou33CeZV7JC2K3EmOyZ7GNUZSQHdnCoOpRIjbuqmwLgMvPls
	yef9KGEkBnFdmgourFtUqI2IGZpKD61n4xx9LVaImdEOoVzCQQ2b
X-Gm-Gg: ASbGnctvXLnTldfIpLtlX8+hIPga2TzB/twtxnZU/5g+buvsy2tKBOWUs1WmiRpfnV/
	ljwBIOCymDSseQ2ocHqsv3ZfLJ/BRiB4RwYOxuTEwNeyU2WVNd3vZ/ybSD0ZgFo1/Z7Rub4hL9p
	Qa3GhTjreASVNQSEw56ecStX1GGE3KXZJbdRB/DLCyFyDL4DkaIkh2HHwBqzx1W+X7p7rpLfQXO
	X6arAN/5Jfowj2HkrAvFwapvHIL4SkERF59FifhpV/HsQlsYUzUfDcApsm8JDND/3l5aUuxC6zL
	3HTO5+m9y4CONi18JPs2UfAvNygQnsPMatcNdys3cvYSAFbjrcNmU1pOkDOfeDT+qWEcVUD7C6L
	L7sx07gc=
X-Google-Smtp-Source: AGHT+IHzNwv3pt//uPp+AK3oZyV5NFTP6P3+wVUbCg1pfACSK7yZfLYQfZuyJtz1MusPNtaNgle6HA==
X-Received: by 2002:a5d:6481:0:b0:390:e8e4:7e3e with SMTP id ffacd0b85a97d-39263bf6882mr4377953f8f.6.1741710860435;
        Tue, 11 Mar 2025 09:34:20 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:20 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/3] ASoC: dt-bindings: support imx95's CM7 core
Date: Tue, 11 Mar 2025 12:32:53 -0400
Message-Id: <20250311163255.2664-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_093422_224074_FF2AC6BE 
X-CRM114-Status: GOOD (  14.46  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add binding for imx95's CM7 core, used for audio processing.
Additionally, introduce a common binding for NXP audio processors with
Sound Open Firmware (SOF) support.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 +++++++++++++++++++
 .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
new file mode 100644
index 000000000000..f00ae3219e15
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,imx95-cm7-sof.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP imx95 CM7 core
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+description: NXP imx95 CM7 core used for audio processing
+
+properties:
+  compatible:
+    const: fsl,imx95-cm7-sof
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: sram
+
+  memory-region:
+    maxItems: 1
+
+  memory-region-names:
+    const: dma
+
+  port:
+    description: SAI3 port
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - memory-region
+  - memory-region-names
+  - port
+
+allOf:
+  - $ref: fsl,sof-cpu.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    cm7-cpu@80000000 {
+        compatible = "fsl,imx95-cm7-sof";
+        reg = <0x80000000 0x6100000>;
+        reg-names = "sram";
+        mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+        memory-region = <&adma_res>;
+        memory-region-names = "dma";
+        port {
+            /* SAI3-WM8962 link */
+            endpoint {
+                remote-endpoint = <&wm8962_ep>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
new file mode 100644
index 000000000000..31863932dbc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,sof-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP audio processor common properties
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+properties:
+  mboxes:
+    maxItems: 4
+
+  mbox-names:
+    items:
+      - const: txdb0
+      - const: txdb1
+      - const: rxdb0
+      - const: rxdb1
+
+required:
+  - mboxes
+  - mbox-names
+
+additionalProperties: true
-- 
2.34.1


