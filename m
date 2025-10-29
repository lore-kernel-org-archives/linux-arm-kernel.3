Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED7ECCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=; b=pGCFAyJR9kod3fWCmGpDa3HlP/
	Pqc6d2C/cSap/MEJiPfIDO3OSVEnSvusTbpP6PW/oS4CPpLoyLlwZQjNOZ/mfeuSI/WByIOE9Fsdn
	8ACzFiBizIYgq/sl+ZPxU8BmfPkRvptPnJ4LwPWuv12q71YrjATRoC2pmDuIav0I8mgsJNNpspXAx
	w7aaw+x2fx10ojH9Hi/eMNke/t1f3VrbvhEmE8SUPMoohN5NZFc7TKupsj5/7h+6RUVsl8nOFxszE
	rfWZHaLMMVMbC6JwAjHB7VZ6hgSEeWWkDDLWfMEjzKoZ4EPZCk66MNUAa9dOty41Vj0Rk255oBgKd
	i0D5uuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6er-00000001Sjy-1gCH;
	Wed, 29 Oct 2025 13:56:13 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6ek-00000001Sfw-0Dn1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:56:08 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b70406feed3so80805566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 06:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746164; x=1762350964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=;
        b=EJa3+jFq0BxsEfxJRW36P5xcmRlhCiB+0sMvaQgBx849ctuk/CtuCcJRZYcdH1F3Gw
         ijlJ4r+Qytbo7uwVave3dobaIJMwJaL49U2yWABfF7jG81nOoFTgUYBXb6Tu8W32yAi4
         PNCHNEytQ5PkjY7ievH+b8g9d2jAxivWUsYy/+IyhpyVeBjGbxI8sI+TbM46GF+t1Fj7
         fakcIstBeztquTtkQ/n2Q4TANayEKCozHLYl+IVJpgg4jnwDk1uDjB3Y1Wl/X6zzu/4P
         sYNe/Y/pp/Ile0F6h37xrM+eZCOE8wP8/Ho66kg6R8Tm0F4oO5sR+BfTXeW9h8F9NtnV
         N+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746164; x=1762350964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=;
        b=xRPWaONAC/u+wTlsA8a8h2ck8PrUhoB1ecvFBjy1JtbvXtSU41keGDeYRK8X4phLQW
         DVmc6U5j/RbBssDImupJoMkZLqxb3N+JV9BdtOepCBezlgUZjHhSlPnzV++6Dwa+6RVR
         9M0IeiEQOSa2gVAtmBROaYdaS8mnt0NEw5p/ErOyxsWjvoLj2hIDxmzu+FIfR/g7d0KJ
         xCjL3+maN2w909QTaYwvKPqf2xJgPf46HygoATgwx9hZJ8a/SYxMybAJwOr4rWYfW4ax
         c2gQBa2CC3Ru5mTiaq7LYb4Vol0dhr5F5iQQGFqQtWtC8ZonGsnqtUEAr3wTo/GQcizC
         2swQ==
X-Forwarded-Encrypted: i=1; AJvYcCWobv/aL5e1MLkOWDVJ3SPbAItbSzkPEimo0p9K8+qfyVqd/o46o+Xn5tEE5UKytH7OvJSWv9va6Tx9+eyQnPam@lists.infradead.org
X-Gm-Message-State: AOJu0YzNZJ4nWdzX1UW9cU+KG45OtaBFsfMdVJ5zJoFlFGGRvXbjK5Wu
	WFsAPQ669xniQXdIp7uoQLKJ6Uyj64ZgYMq5yoaKzEcTLe/Ah7ZkuGBU
X-Gm-Gg: ASbGncta5dM1UYmRW1/oePjMt0zA82J9kby6WsccimEBQQgrAUxgZvMKqld4hlC7z6k
	vAGcP1rbxJ8pCXIRr5tdXQF5TSXWptRBcdjGXUqsDPNIKj292FRNcGiqL5u3eorzebWxItXyAxV
	mEZ6adJYZD4gB/6sVIU91JNd7j1S2pT77UgUu1OTCs9G2ULkg9exwZ1sKrG90zG84K+ILW9cjN9
	yTQ2XQpD0QR+hQG9SPX2BYi+8JiMbaDr0XXosJgKgzs+6+rzkCAttlaLGuvwnPG232cVjPNymXO
	FrdMzNJoD4Xqp7c1nHhZYQoq30kHiZ6pKkaPPNvunr9kCTYBbL3Kk4M0/PVEYeNSw9y48TAHobs
	l6hNggNqn7fp9Jp+6T9gx+OTJraQkvGnWIeI2y/2bQqwmkbF7xuOYupkO/FtzmrKtmCvca/ceRb
	/pkjkW3HgLI3+YftyurybpT3g/Gw==
X-Google-Smtp-Source: AGHT+IHH54LZbYTOXZg7mV9ntZU3iJVYCB8V/9k7x05K1JXFlb07Aw0IydcZp3Dr0TOMorMdCHGUFg==
X-Received: by 2002:a17:906:f58f:b0:b3d:b8c3:768d with SMTP id a640c23a62f3a-b703d2cc2c0mr267175966b.7.1761746163828;
        Wed, 29 Oct 2025 06:56:03 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:03 -0700 (PDT)
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
Subject: [PATCH v3 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
Date: Wed, 29 Oct 2025 06:52:23 -0700
Message-ID: <20251029135229.890-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_065606_835644_E0B3FA7B 
X-CRM114-Status: GOOD (  16.82  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
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
index 000000000000..662e07528d76
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
+      - const: bus
+      - const: core
+      - const: plat
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
+        clock-names = "bus", "core", "plat";
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


