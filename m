Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CCCCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=; b=AW91BxGLf4Aw0fnkKCBnBa30Se
	MO/u57wYBoRfU6uM7jR5O9b11ENs9bDXixKUJ9mtGRqtFZ930g1ZGQnwOPc0I6DMs2WL9bSCxkVez
	RDEr5XVp17L3zsY+h2O5OywEGQN7fLHR7ajSmZ42jNETskKC43dsSO/Dk4Jh5PQtKxixyX6U8e310
	UQ5GzQzJGqymkWNgEqDZ9lGgfBxpVhxoZGksg9gtDjPDUGIhoogUBTWz7xW8UkGIzYsRxwiDGApxc
	9yltJwe4XhiC7UWtu02WarBFACrv1Lep2kH1pbEcoA4Ad16o0lP7rnkze+OC1yPKJd93hqAuf+9E8
	yQvycbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlb-0000000BkrP-1rCU;
	Tue, 04 Nov 2025 12:04:03 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlZ-0000000BkpN-0fwN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:04:02 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3e9d633b78so1278755266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257839; x=1762862639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=;
        b=RM3OuoG4HSyPMJ1n8Q5cogsIxBph+080x0gWPoG9XuAx6zxi4KysP3woGxz++i0QaL
         TMepSC/7yyHyvtL7j65LW/W54mBPX0CiDMifEpyb/voQib4/y3H9ki9yQmQgNLJOc6rf
         U13kJ388evOwMSNbLY6bEL1Sv0p9Ahgh5H+HqYmQ584rX47cic+CjTqJwTcZlkrBZK6w
         gqY1oUE1M/Sa63XPqNt0mP70HQXqfyAaiwFNmOAILZxOmV1FCTlhJ/rEG14tbgxzx5Hb
         L9jZe4XNJcAPSezm0sM1+mON01/42TYFJpgRZxXDlyA6G0Hl+mj0YWTLuoQP7wKrZVmb
         RAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257839; x=1762862639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=;
        b=fYPebDuW5knJxNlMDNcm1SzL5i92R1wfVGRUPBUnrs3zzeOO49inr9QiD0EAMcvrJA
         XAk2W2tyhp3PV51srh+7li5xHb+VU6j8fY2b51FhpnHfHW/L/VUzApU/ohw37BmH8QxY
         pKfw5ctR+5ikexGcarGlGj6ox3Mrx3UWGbCc90k03muu7oWOZ/2AH7FP1ljOxk1ywByI
         HPsyLnVUWqDvRPgWRuEPEe3sS6AxrNy62ITfUXvmu7QySYchxXU/UKfQu6LSOgwNPz2Q
         hVfq3WAAbCPVXgn+sMfEcDNIhwl9vTee4JZPEfYWYxMRE5vbDBTR+xNibcU3mEiUYVzw
         78Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXk/Y5DJCo9QI4IuzsATQ1vcmdIjftIagQVCTqMYomaXkIyneC45ezekehhZ2p8nzQaYP/FclgeX6w3GKgM7paZ@lists.infradead.org
X-Gm-Message-State: AOJu0YztRd9IOhDfum+hfK7i+prr9ay1G5ddvALaLL80uxPI9gpChNI/
	3g2dJYU/frvMA5haLemxb/mKvD5N8wPaYf39kpCqNi0Ou4Mj8ZK8WdHu
X-Gm-Gg: ASbGncuSgmOXrrOitF2EqZPuRD40HP35M0OcZiZHstWccbYPZ1wpHC36glKvPOxBiTU
	EFZqyHvHZsEQ1LzdvkChwoi6YgoEr8Q0/GYjue5RoVrCJU2iZ4R827BuVxXIkClRE9qfUckdq2k
	krjj2nkSWqRECnw7pUvHzRdoGZwErvJImT8DJgwwggnhBpi4ShXEvfjDkNtvEoXl6cfETEfyGCH
	LMSbLh03hEIaZ/ShGTY7Op5tEKCSgaZRahabgvieFbOX0nPrLFZ/9Q400ZO94WoFhlSJh8v25AX
	rNLYMSEsnE17Cx/mCVQQCRtSfmC4HoDvtP/boMO6bTo4qcSOoXuJ0OBNS23LFvQXHH7UpY1vb0R
	o9pbXL5owz22e0Wys2v3O5PCFfVMlgiYO2PiXYh0McN+2qbeMS/9UC+GUt6qaImtYhvNTVF38xS
	YInKyzXTlv5J8fOBEAWMhtzU4E7Q==
X-Google-Smtp-Source: AGHT+IG3QLmyCjtX5/Ko9tQsUxnNB5wR4XCiP6erukrj/bGwetEYdDQuHsOKUbEeVB4dKQgbNrFB5Q==
X-Received: by 2002:a17:907:72ce:b0:b6d:263c:22e1 with SMTP id a640c23a62f3a-b7217d7eb1dmr363856066b.31.1762257839139;
        Tue, 04 Nov 2025 04:03:59 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:03:58 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
Date: Tue,  4 Nov 2025 04:02:55 -0800
Message-ID: <20251104120301.913-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_040401_230149_894B88B8 
X-CRM114-Status: GOOD (  16.42  )
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


