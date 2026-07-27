Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0D6C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiS2cO5E4x0Awi3aXHlbjiWygQvLxKx4fGNRAdhWDNQ=; b=wnUKgyAg/EjX8ToMpbB4Y1xX2m
	CqcdRptdPkq+RHEYTCD7ryHW3UlYAYMCCUkYhYVYMAmeRs5/fL3D4M6nN7M6uEAXqek8BVWxkW3ND
	Z+ARK28TPflKTST9RI1bArznuHXrTZh/1m1uUtK2N5/b4EKESYR7uQC+lLyXeB43eE+t3KnJpH79m
	Uxd3kpKu/+ocOmaL+LYj4QEp1Efo1h2KruWf8EFAshyFdHl0qTnnNBv7ujZvjQZOBDpjIMTcoW7wX
	y3v0g1HsNp8Dmisr5uOldzf+WwXnkRt011b+MU//yLvaD+PM2cJI4DxdzVEIyMwLjAnzT+M29CCOf
	55Petn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHRt-00000002Is6-1cO6;
	Mon, 27 Jul 2026 09:16:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHRn-00000002Ior-13wa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:16:32 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-ca80d708489so1652396a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143790; x=1785748590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiS2cO5E4x0Awi3aXHlbjiWygQvLxKx4fGNRAdhWDNQ=;
        b=QoPj4lTRnQuuWJ3E/0s6a6xSxwloOKglFaa7Sry4KYqINTd+zPOrInaVUbkdnRlopJ
         SLjZR+QHdlnk5uLBDnvWgo9a6CboXMVEAEyCd3VsskjYVaDhC7xLpgYBcTJGcOws3itx
         rpj9EgM7vA3ezFYgUyKr1P2zOxlZmhPIXe2LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143790; x=1785748590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eiS2cO5E4x0Awi3aXHlbjiWygQvLxKx4fGNRAdhWDNQ=;
        b=kfIvZ17thLxyo90a6gOJiUstyCVqTrit/lHRzPg4f2XAuXO3rpeo/DOisBEXcM97/C
         K18tM9Q+GRTFav88NUCVWV8Gn8NtcQxuUoyMrMcvWwpSH9Ufke43WyT7RQyqrfPhFiAN
         oG9bI7k1Eawtfkg/m35kpG+cEih/H5xuL34XKcE4QxEVs5Pd1doVh0yDV56IsD0UO87i
         qU6NOPDI0jks+Y7C9nmDG65bg9rspgjhDpkDEFyaXiLC0iYuVMc9r9otd+f1U0/t4IJx
         WxYnbyB8+DUZvPwlXrM89yCEofuG15j5VbfY11pzvgfKVaVhY505ed3LK7zrnqlQwir+
         Egfw==
X-Forwarded-Encrypted: i=1; AHgh+RoX0gQeQwx1OK9xPVd+jNCXL8g5ZSGFAAq2X2vu5ssGUZriJIuS2bXEEJJ1/THdYzBKdyFgbRuhB8pOqE78gLmm@lists.infradead.org
X-Gm-Message-State: AOJu0YyWL3SIi1oAtgaPOeooMUN/+L/0P0mMDrPvY1g3Jq/3r63MJndM
	SxEjKBr1+NysRYbtt3G+WWOT8aiRUHxBxUaOXgma/scdSiXpCHJIk9JzYAkwYFHKIQ==
X-Gm-Gg: AR+sD13MkvIc48q7WjImsmBrJE0xL0idltAIDlZAbjejJEJTQSiyOgwVEjAUjWm5Zdx
	39w/bVWQgW9jtBpVGPwOiSDZHXEh1BEHD1gHv7n+Hjf9kM3zvho4p0kdVSqK8T8B2R9PxwMH25u
	PRBhrrOBWCTOfIXF3fj9IFrbzbzYV0/gNkko+lMcqc3bAj2JL1+7otoInNTk7W3D0DBdcJyZIjA
	7H7Wz8uFJq7j8bNYRf0kcMmhoidrT3/BgfOBFRt5YRxcd8+loLjBvXDvVpjiMTQUEiQlMBWqLOA
	QV3FLYQ9lHBR1bBRbRwVDhOaGrRSInsShrIomqGVKxu2sUJIVQh4Pn1cN0x8eSWTNuk136laL9v
	FGQQTgg3JrU85OSrIoSt+5BRCgt1ZzQYOuV3C4jZWto6mZbZfJH5yYUJ3dav71oVHYCIsflJrtq
	mxn3sNLjOXFTzzeKNhEkhhsGWDuUYLZkJTXbG6+y5W6AnCveArQ4GA5edJjw==
X-Received: by 2002:a05:6a21:1644:b0:3bf:8de9:c64e with SMTP id adf61e73a8af0-3c67eecb1fbmr6693314637.2.1785143790405;
        Mon, 27 Jul 2026 02:16:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:29 -0700 (PDT)
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v3 1/5] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Date: Mon, 27 Jul 2026 17:15:50 +0800
Message-ID: <20260727091555.1023910-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_021631_300660_38548890 
X-CRM114-Status: GOOD (  17.76  )
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


