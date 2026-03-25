Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24BDFEA82F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToMAIYfDdLF98AYL+fgRMtnkblofR9bxvds0Kk+i8wY=; b=XfOIlMGv7YbD8ZfFfOohaU6MlR
	mpbFW10jW23Vit6hoY/ORks72RLZSyJqCiyP/uFN5eqxKEzSUDX1mWgrmcV6rfu9QU+5BU2OEnGtN
	jcudGH0TZvUvYCbg2A/LpW6n5HUubEzR0b6zpo+6VmHT4Cx0qQmq57ArdSntbx2kz4L0rIjfLEkvf
	8oXjhnne/WmjhAmmfdaLQK3FKIzUu3e1HqlcbdW6NQXNTf73lHh82Is4a3EzsoXWIHUdjN4fimNiU
	rUoKVDFxvSMdxQBNxfL1bBwGKF65powyYhoRHw1bpiP/itr4pehhS7peopG3QT1mo1Lb2AH/dSgLX
	OpcjFCfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8L-00000002t21-2muA;
	Wed, 25 Mar 2026 07:58:33 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8G-00000002sys-1Wft
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 07:58:29 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so296725a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425507; x=1775030307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToMAIYfDdLF98AYL+fgRMtnkblofR9bxvds0Kk+i8wY=;
        b=NyGA84mqN27nBWKE7/iSebqWUrCzckeqkqwHGB7KArgzjHvaytnZNwZkntJZHakawZ
         oszSdnDlBdLSQeNVcZKyaGXv901QpMDlPa7DWhPiLxyBKxrRh4f4xqwMrK8ZaWZxiQDG
         pLJP5wnqpu9NcVTUEP3ILMllBbuRK5DCRoZto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425507; x=1775030307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ToMAIYfDdLF98AYL+fgRMtnkblofR9bxvds0Kk+i8wY=;
        b=Duh12By0ELLXZk/0C2cgcpKAMtmNfONtqJbC2HIv+x4pEhqCEvphiVT5OtkJivUT4E
         2YHWADln8CR8rOlVZ6iSecQ6mihkGJqeXA0nA6qwHPp01I3cqgG20PAjqxKPa9tNf67h
         f+YQh3wfepJ1P4V2/80FW/gI7FGMNodCuAkHk7v+HLt7IWRh2D2m7YwHwidTryaliqXg
         9oTHsDiQlnsgpRSBNdMM5goTd0l6YMQMwqdPQViTu927a7I6wqDTG+Esgkm+JTbRC2dy
         f+/kyhDfiX9lZ9DhyolJ+7oTjgFM8aWz321AUNrN6nC4Q0Y7pj5PDHQtNfBnnBkLuyHK
         m+hw==
X-Forwarded-Encrypted: i=1; AJvYcCUYGNbqb1fpcVFDBK5BkTkdS24A4H8Qil3tnRSL6awOpZIDrUOn9/rVVma9WWOcuROD1rQrKh1wImcv/tKZQOCq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2g2XrdlFSKDseyXpHzOIKqwRJKkdCzvO5O5/DqYKArbc4JYwp
	kHZy378HGzcB93iFzAd3kjMHMOzbEiWFnBbNGembSbKwlAvxJHkrlChJUWPpL0RjXw==
X-Gm-Gg: ATEYQzy4T/Rv1PyE065X1vw8uf4aB7uXfoVsYiFM+NzvkBIx24DfCNLrnPgdV4EDchZ
	sZdZ13i2a3MiGflrGsBCJF8DFNr5EoLEB3T72SEexIPuuWXm/T2sVHjoLXJXZb7oZLMDkFFKRPG
	BWeTR/7bYlEXcimegknS2O6p0GXK7DOSBZLhIYGQl3L8DLAvhHl7HdfrUlaNFVRUmT1NSDlfGts
	idzNo2fpmYoemg2qbyFQKkSxazFGTQPHV+yQ4p31UowDKah9KPstdA7RRs4v+3uKtZK0z8Qeyb3
	lhODY/XckmO7lvCItm0yqtiMOuKI2xEvPPUzMfN+vv5mMTFh++wsQ1vdeKuHLCCTFWi/ds1pf1A
	AfzijJm1ZtxXFStf+KsycPh6YDWi9mEx/Ppocav1wdwwFodeWhj3LBd0KXO9+cE90rG7M3bd3Bs
	3Iml96Ty8jMv0Dp+pjJH+ib4CxAJrr92H6YKgu7fXyyvwqvkAQ0aw/CXHtXVyFrQnvDrpCtTeXi
	iSmwcQ=
X-Received: by 2002:a17:903:3bcf:b0:2b0:4d5f:1f6e with SMTP id d9443c01a7336-2b0b06cc697mr27079345ad.8.1774425507438;
        Wed, 25 Mar 2026 00:58:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/5] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Date: Wed, 25 Mar 2026 15:19:45 +0800
Message-ID: <20260325071951.544031-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260325071951.544031-1-wenst@chromium.org>
References: <20260325071951.544031-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_005828_425325_B58E2082 
X-CRM114-Status: GOOD (  18.16  )
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

The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
in the datasheet, that contains clock gates, some power sequence signal
delays, and other unknown registers that get toggled when the GPU is
powered on.

The clock gates are exposed as clocks provided by a clock controller,
while the power sequencing bits are exposed as one singular power domain.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v1:
- Dropped minItems for clocks
- Dropped label in example
---
 .../clock/mediatek,mt8173-mfgtop.yaml         | 70 +++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |  7 ++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
new file mode 100644
index 000000000000..03db1ee9e594
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/clock/mediatek,mt8173-mfgtop.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8173 MFG TOP controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MFG TOP glue layer controls various signals going to the MFG (GPU)
+  block on the MT8173.
+
+properties:
+  compatible:
+    const: mediatek,mt8173-mfgtop
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: sys
+      - const: mem
+      - const: core
+      - const: clk26m
+
+  power-domains:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - '#clock-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/clock/mt8173-clk.h>
+        #include <dt-bindings/power/mt8173-power.h>
+
+        clock-controller@13fff000 {
+            compatible = "mediatek,mt8173-mfgtop";
+            reg = <0x13fff000 0x1000>;
+            clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MFG_SEL>,
+                     <&clk26m>;
+            clock-names = "sys", "mem", "core", "clk26m";
+            power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+            #clock-cells = <1>;
+            #power-domain-cells = <0>;
+        };
diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
index 3d00c98b9654..89e982f771db 100644
--- a/include/dt-bindings/clock/mt8173-clk.h
+++ b/include/dt-bindings/clock/mt8173-clk.h
@@ -243,6 +243,13 @@
 #define CLK_IMG_FD			7
 #define CLK_IMG_NR_CLK			8
 
+/* MFG_SYS */
+
+#define CLK_MFG_AXI			0
+#define CLK_MFG_MEM			1
+#define CLK_MFG_G3D			2
+#define CLK_MFG_26M			3
+
 /* MM_SYS */
 
 #define CLK_MM_SMI_COMMON		1
-- 
2.53.0.1018.g2bb0e51243-goog


