Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A73C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0T75/EutYIQThS/ZfnwY3OlWCqIaGeaNzqSXOb58pGA=; b=GdzjfL/Bq/koX7QrUb+eWmRlFi
	GdMBh7Fb0w7escB/K9nT5iIHIMkKiRbmgaU4GHXyOLITuWeTaSGDDOZmtjWV/N7MWeqHLREemV35B
	9iAfxq0Lv6K1vTQVw6Xrnpk61pU4pUZdD5lL+bkjyz8cWtiUKW3vauVMa7LZXyqfCJezdFm9ZkxtC
	2jElPagfm1H/9Hgk9K9W4PKerSa4PqW+sI0tnXplydrVLWe5GaU7smhaCiMEMFCxrJ9xUwMDmh6eZ
	HyLR/46uk1+FAglxm7ABiFIqcIx20o2OhAp9BB0myE3QVjUlkAagGXs+id9/fmQwPQqaQOacd5U28
	xQcw0y5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxF-00000004mvu-3bOS;
	Tue, 28 Jul 2026 09:18:29 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodx8-00000004mrv-1Uz8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:18:23 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2caf228a910so27636855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230301; x=1785835101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0T75/EutYIQThS/ZfnwY3OlWCqIaGeaNzqSXOb58pGA=;
        b=MulGHsHitJqe9JpTWoCj49Rj144UZYgS8fNub8XIDBef5kg2ue0BWeTKLe++RvuFV+
         r4RMP/aZXZqlg7Xzie4B4FsRYpWzO9cX2a1G8F3XmrUHkMEV3MrkYsW2hnWZbcCEFhpj
         Uu3oz/+hYgr0q6HnmKS6d95wR41rKk3BKsGSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230301; x=1785835101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0T75/EutYIQThS/ZfnwY3OlWCqIaGeaNzqSXOb58pGA=;
        b=glH7k1RJ0A5TM+wb3zZI9e+4FILWMbOeD41J/aisGmhYxnusYgNBKWU9pASE3PX+1p
         mR2DSTll+Khbg9ne3ONQhqBsxH88VlOnv85tsF6tN6rHijSUsZMjwcs2CBwtDssgqYcN
         35zqhwvcY7OE/yDK84w2xxdvkLx+7nytBqz61Y/IBOY1iBoYYSGKppg/4lrtYL9zfbBm
         hXvEcD7ugZSqxB0JjfeMWiH2YxspXv9sjtY14TNe3zXsiFpeChUv09yvgZJzGYgfBEvJ
         ns5knyc2fDUuDfWG7AlT+NXMxVNQnAOKEiNrI7+e6oEdCorITRj9EV8QvuInOvRIUxKN
         YyCA==
X-Forwarded-Encrypted: i=1; AHgh+RoN+N9VsIllCBdHRcfngypsbhs+5ExyW2hjs+852zgoJi50Mgh9e0epXgMI4+oSmBtcL3bCEfYC83/gp45r55GL@lists.infradead.org
X-Gm-Message-State: AOJu0YwJSdwyoAQEIiGxZ+mAv2VWcaRTwnLzm3KUc4Ai2mFNPQx3WSmu
	nBR16jJ+rqZ0lui3HpMocM5rjxpjETlM2Y1r6tGIT8+m5DBGtwnV+bD1g7nzlJU5DQ==
X-Gm-Gg: AR+sD11M8TgYXMH1w2ovnycjxktjTvTJoQ3IdV4nOZPjoWudKAFimCh4z+b/Dl6Tw7e
	7oFDGpuPOA7/dvqkvehCisCpdED5SDTkt6fPV9fSr93lVReSy+58j8qYMxDH0QraYto0VCELOXK
	9xySHDR2dzepL7ad/ckULI0jUoaOvAhn7YQ/VMSL7Cjo415LG8ZOO/Eo9RHgdKow6MAQe+Cp2Oh
	kYies9B5nK58o5uvf0lN2nvCy1WOAp8aLBzg2/cwPFDFpbolfLujSjXI5NjgbbFX241nl2YaiXb
	W/hAKNqDd49Khl+4g9yhVixNUS/sSrSViNPuyDEdsjWnxosvCfsCJ6UH7q2N1XhqetUjZMpb/xi
	vcoko7vDIfzn1tYfMeQXSTsyXjOQPqZ8xYfehjLGHqdyuFEPwdeWJky5SLCesJEFOOruMgv2RVV
	bkLcTdOLpbrsjTL1iTZsPQFqryJU7879VcQE4aY5Q8Lp0A59Liop7uFFRaqdQScrJEBnxYgw==
X-Received: by 2002:a17:903:fb0:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d015c91d62mr18424095ad.10.1785230301466;
        Tue, 28 Jul 2026 02:18:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/5] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Date: Tue, 28 Jul 2026 17:17:59 +0800
Message-ID: <20260728091804.382753-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_021822_421698_82169EC0 
X-CRM114-Status: GOOD (  18.05  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.55.0.229.g6434b31f56-goog


