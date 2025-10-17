Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D235FCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxZng1eP3nkpNL2x3zSCyGZ+U+wKEAYbZhmRCawRv6g=; b=I6ZY3E3VTWmRZT/hQBydbWczx1
	E1v4NLLtTKYYgovkuEUEQiEU7nVhfyt9AMpB10rHZbyeRcUVIBzNvWQeJfWWeG29CIhyBHRK+WCRr
	K+W3xZvjuwwYe4yxWor7aZF3g7GANOj9KWYO4olxDFUk5Te8oEpf8o2Uur9fDoQJmH4TV7qp+05Gu
	vSZ3miLQ11bqXoUXKew9HrMV+qTS0IskMDmjF1JELlC/PFaMPav3rgF8zoJ+l/5cteC/JmEPDC5F0
	+OharN08RW0XYnew7j2IzX/VEY93FjxI06L5xtUjJjNUtZ6blcX7YIL7NBkaVuMx8LQhqUwYtju7z
	ifIrzpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWx-00000007ekT-3Lj2;
	Fri, 17 Oct 2025 11:21:55 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWs-00000007egb-3Zfp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:21:52 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b3c2db014easo398760766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 04:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700109; x=1761304909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxZng1eP3nkpNL2x3zSCyGZ+U+wKEAYbZhmRCawRv6g=;
        b=erFfCtUSojAOhbDmQ7L2jrf9yAJpSWZLuLF4lgkPYLcJLYaMrqodMANLz1g3XkrZVw
         MzRp+SkrpoUdx8AWbz8bslyvQZ3Iv6125hUtd2TD53rxsAikJqeW1FPiRyNdnnXpalLu
         9vSagKoqq8cktoeMgIfkmvs1NoybXtt0wwo5Cd6YkGgK0Goyt5cjz2GByAerV9XRL8rt
         YEhG506CZ0FukttTNIzhXCCAPsa7XUusFPVY4kc8qBvwC4IDS2TQ2Yb9Sl6lZZWeok8I
         ObNNssCU94JUnOl+G3yiYlecPzhPaYhoH0FzXc/yNxmXAruOOQBCdFw52+sUhicef+wS
         /k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700109; x=1761304909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxZng1eP3nkpNL2x3zSCyGZ+U+wKEAYbZhmRCawRv6g=;
        b=KSRrpxdYketMGOHhS0FBRrd3El/BUEV9sCYrZ+RX8Azjqkskw+NIck/CZPIWNlcb4Q
         uyerN3aktUSvyFzhpe9aPcZZBfqj/uILIOtdQK1gmepnjgu7UTcJgMpzVJLQuxtFs6ia
         mqdUQfD9i72vglXDN4zZQW50tM1WjltM2eZidx5uLzyPcqZI5jWCGn/0/+OEeWC4l5hU
         U/tQRhQHGdVZSg028QfrdOvB6yopwE/cb6nlbgC9C6SI4yNPIEL6qvAAmd6nmujBa20e
         FU0B7ZozhXDyNm0IfK/CoXMp4xWgAtjuHNcnoYTY/BGSUOxhM4HYpg6iB0J/cmJPQCvT
         2+7w==
X-Forwarded-Encrypted: i=1; AJvYcCV2iJ7bz4d0F4Eo0s7PR/bQKCwpwAuFfk8syAa4bti9QfEJjv3gkiLW68OOfzlo+cJOBccmyi5CXmWdch7MW/u6@lists.infradead.org
X-Gm-Message-State: AOJu0YxHVGGYpz57HXppmHJ8M3wNp4IxpWWRd+lWGjchOGYaG63L75z/
	XmG14OTtQraXsgaW4487yvlQ1F1BIZsZOWBEmuHM5CHWzzzGzD4V4m50
X-Gm-Gg: ASbGncvpDjUiOhFQvGVYfApVNGnHwMMJudVXUb1zynn2BWzW47ikE8MtWdAIBdjghFP
	NBhkh3+OXO5Eq9qbmdDoe/C7x6kyCkosHJOi9OydT6tLKfIoc/Kzm+tFAxKLVYcFWDdHsHscJfa
	x1Txo48JTPnNd6EVgtt/OT+AniW+mZSolq3gnKAOqy3qIeaVqQgElRaINjV+z31q5VsjzhY2yFu
	ylMfIbRl5OH5hAlGo5iEFYUc//ZvZOdI1v6ZSbodGDegoZBFA0vTEXblAhkgL6Ml2KIMOQuvDe9
	vxij5THGh8NfqDdn5pZUsEEdLmz9z3YDtRGbuUim0kNope0gBXMtp3EWAg/2iLqIYg38wU15TbQ
	/LY7BbvZLkV42WaDCrpR9CMswb2owlIPL5P3/AJeS0oO+GUW+yV+aKC/DMXrBiIdIx6mykRpUxb
	e2GBHQuo9LLTxj2ujS6jPWN6e8EDoDnUU1La9eUA==
X-Google-Smtp-Source: AGHT+IHZNMQeXplbUH41+dThExjmzBGzSWreEUPNrbP0M9e+9ctpnllogrXxNq4uh1jLTdNf2mZ0sw==
X-Received: by 2002:a17:906:dc90:b0:b3d:98fa:b3fe with SMTP id a640c23a62f3a-b6475510fe2mr380187166b.63.1760700108569;
        Fri, 17 Oct 2025 04:21:48 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:48 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
Date: Fri, 17 Oct 2025 04:20:19 -0700
Message-ID: <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_042151_199667_7B987D78 
X-CRM114-Status: GOOD (  16.05  )
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

Add documentation for i.MX8ULP's SIM LPAV module.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  | 72 +++++++++++++++++++
 include/dt-bindings/clock/imx8ulp-clock.h     |  5 ++
 .../dt-bindings/reset/fsl,imx8ulp-sim-lpav.h  | 16 +++++
 3 files changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
new file mode 100644
index 000000000000..fb3b9028a4c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/fsl,imx8ulp-sim-lpav.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8ULP LPAV System Integration Module (SIM)
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+description:
+  The i.MX8ULP LPAV subsystem contains a block control module known as
+  SIM LPAV, which offers functionalities such as clock gating or reset
+  line assertion/de-assertion.
+
+properties:
+  compatible:
+    const: fsl,imx8ulp-sim-lpav
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: lpav_bus
+      - const: hifi_core
+      - const: hifi_plat
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - mux-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8ulp-clock.h>
+
+    clock-controller@2da50000 {
+        compatible = "fsl,imx8ulp-sim-lpav";
+        reg = <0x2da50000 0x10000>;
+        clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+                 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+                 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+        clock-names = "lpav_bus", "hifi_core", "hifi_plat";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        mux-controller {
+            compatible = "reg-mux";
+            #mux-control-cells = <1>;
+            mux-reg-masks = <0x8 0x00000200>;
+        };
+    };
diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
index 827404fadf5c..c62d84d093a9 100644
--- a/include/dt-bindings/clock/imx8ulp-clock.h
+++ b/include/dt-bindings/clock/imx8ulp-clock.h
@@ -255,4 +255,9 @@
 
 #define IMX8ULP_CLK_PCC5_END		56
 
+/* LPAV SIM */
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_CORE		0
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK		1
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT		2
+
 #endif
diff --git a/include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h b/include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h
new file mode 100644
index 000000000000..adf95bb26d21
--- /dev/null
+++ b/include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H
+#define DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H
+
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST	0
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_RST		1
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL	2
+#define IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N		3
+#define IMX8ULP_SIM_LPAV_DSI_RST_ESC_N		4
+#define IMX8ULP_SIM_LPAV_DSI_RST_DPI_N		5
+
+#endif /* DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H */
-- 
2.43.0


