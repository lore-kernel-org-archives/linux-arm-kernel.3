Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99075C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJlXUyXaSg5/APv08bqYlwg7ApzeLY4Yu8IAGzZsa6I=; b=xtSxX+uHst+zTs3mtcuLtvJgPg
	RgdxxOINL6ihHgBrE0SU54Kj5WzYtLT7HZbPRd7gH6lm8PKgWSsq9gFRwQ+vvU8UGs7dO5oxFQ4Dp
	j6ZwUq3N0BXtSqEf0cr4NiwIsionrF85iMuWl+WLZLfKcAxhnbBzmirwS4KWpIu+AFrKr+pKVLSTG
	cSR9VCmjoTkPMVBL+5BrpX2G6tfkA3B3q8ggs9q+S/P630sSO0u5Ov28OuagebCQbEhO+rB55Dl1b
	WwnsRiJY2y++NNknd4FFahJoJQuMsBQ5q0TZHAMqh/C8PvhPB5v5RFZJhceKrWQ9Inqk/kgpnVxhI
	W625mvYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uog-0000000Drot-0Q8F;
	Thu, 24 Apr 2025 11:32:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tlo-0000000DfRB-3uj8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iJlXUyXaSg5/APv08bqYlwg7ApzeLY4Yu8IAGzZsa6I=; b=VMtbKuyKq/q6D/J/ZNrahMvCtE
	vVHs0HM8kC7E9863TfLpznCoY2H7aDsva5AuMuph9Dfra6RnhocTwLgN6jwkXvwAc8pv+HNMotyNq
	csaNsPFZVWp/JUsVyvrZQb1q+Ax6lvcVLSPKzsU0LYK/GRYn3HXeALArsgSP0twNpCCSCkjWAe1UP
	6rQMNi9bsDPCKmZa0GlChpaYtI8zi6TJs4F033rYpey5J/Y80WCe2oisWr7Gg1EFGRTpRN/xPHbzQ
	qnaQudCm0pes8+thwBpYk8pi8o401flZL1+6DcG24RvAofk1bB+gxRHIFNk6KMMGG0nBY7bK7/hMf
	rtU34tOQ==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tll-0000000BjU5-3kH5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-227b828de00so8279445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490323; x=1746095123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJlXUyXaSg5/APv08bqYlwg7ApzeLY4Yu8IAGzZsa6I=;
        b=KTusuxh12oOwncC/qouk4BYfBUSQJDGhZUifmWEwTVKd2Moq0Sg4FC9PkTM/pAQ7jg
         XZ+0/Z84g5JijpS3t5BpIL0njqfrRHqAZ6txwqdssnUj/meyp3OdauohuBw0LjbP3hzf
         e43uqs+2yTgXEV1uvWvWRofUcFzsaOir4mMn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490323; x=1746095123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJlXUyXaSg5/APv08bqYlwg7ApzeLY4Yu8IAGzZsa6I=;
        b=XQO6nm0FdKhKbPcnLMlmEnQGlOprOHux0PY2Jn4+B0o7GNPlnK7KnyRtKrhehcgzDG
         jOAjUyuhD1rRvDZlibWR69mKTk5yRrxYGL9b2oTD9IkSA01jmrFazcV4NTgjgl92w7zp
         X1vLZqXkgVa86Rc73fC1YXqy0CSHXDF4RWdohaImm3M+OHEvfF4y1CbwCkh0S7sF1lT9
         UJL7wouBq7feCHm7M4Spj0oJhVBdHikPROKbpvJHwbacF+JkkNfWHWe8QzZ5i5CXOnZO
         uTOynwH9svKNftG9dxEEegap6efNpDSxPH4Evtzkxz+mGZEuz0Bgpm5U2EZE+OEG1FHC
         /SZA==
X-Forwarded-Encrypted: i=1; AJvYcCV1AVNPYas83nfid/+WDA3Ce07z8S0g5ju5J040K0RJD/7XFYenrbD4BIRHdzywpBgvXsqM0dJyuYLaZd5KxNam@lists.infradead.org
X-Gm-Message-State: AOJu0YzG210mycfZDtOwP/x4uzi0AgJDnzB7Ctxl4TbXfPWKF06OZM9F
	fyjaqkM5DBIcrQv+78r1vgrvnHeER9HAUnhpOvoswXS2ONgVMq6TEmvQHoSvWqVa/ireNLu+gOU
	=
X-Gm-Gg: ASbGncte8gEXGyq2nq7m7czkF0vageG/mz3G8xwpN7aYpkxHV9ObZtkNRUXeSDb0/xm
	klW5IXGnS8iRzGnX6RgijNK1NXSReqZ9KDtgRfWW4k3J1GTzki2BDPV5Ek2+pKbEKhHFLbjqy8R
	RGsEvVlsnHEPKM9Szk/ytdR4QffY+P41PXQaCr4Q5jep6d+Q0eMu7I3q2EaZCGtN9VkT/Fg4jTf
	6MqreO27ACTbN5HTSwnAmb+kBOg+N3eTZut2C3xHmas3TT4v4txaJpFv/lufk8VLePr3v3xZzoF
	b/sBwr78z1ZnlI9l0cBq6CTnuAmKaQlhELNRH6T27gnv5a6ljJs0WXu3sA==
X-Google-Smtp-Source: AGHT+IHzoPXeAj/1Vo9RnY5qRxxsQ+IrUuZpo38gzMRReAUYEIPY7nVtqmt5PXAnUiSLOPEIxc+1ww==
X-Received: by 2002:a17:903:32c9:b0:224:216e:332f with SMTP id d9443c01a7336-22db3db1596mr29371075ad.48.1745490323281;
        Thu, 24 Apr 2025 03:25:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 01/13] ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
Date: Thu, 24 Apr 2025 18:24:55 +0800
Message-ID: <20250424102509.1083185-2-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112526_014777_B84E4147 
X-CRM114-Status: GOOD (  15.96  )
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

Convert the MT8173 AFE (audio frontend) binding from text to dt-schema
in YAML. "clocks" is added to the list of required properties to match
"clock-names". And the example was slightly fixed up in style. Otherwise
everything is as before.

A contributer and maintainer for a recently added MediaTek audio binding
was chosen instead of the original submitter.

Cc: Trevor Wu <trevor.wu@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../sound/mediatek,mt8173-afe-pcm.yaml        | 87 +++++++++++++++++++
 .../devicetree/bindings/sound/mtk-afe-pcm.txt | 45 ----------
 2 files changed, 87 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
new file mode 100644
index 000000000000..a95215ba6361
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for MT8173
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: audio infra sys clock
+      - description: audio top mux
+      - description: audio intbus mux
+      - description: apll1 clock
+      - description: apll2 clock
+      - description: i2s0 mclk mux
+      - description: i2s1 mclk mux
+      - description: i2s2 mclk mux
+      - description: i2s3 mclk mux
+      - description: i2s3 bclk mux
+
+  clock-names:
+    items:
+      - const: infra_sys_audio_clk
+      - const: top_pdn_audio
+      - const: top_pdn_aud_intbus
+      - const: bck0
+      - const: bck1
+      - const: i2s0_m
+      - const: i2s1_m
+      - const: i2s2_m
+      - const: i2s3_m
+      - const: i2s3_b
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mt8173-afe-pcm@11220000 {
+        compatible = "mediatek,mt8173-afe-pcm";
+        reg = <0x11220000 0x1000>;
+        interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
+        clocks = <&infracfg CLK_INFRA_AUDIO>,
+                 <&topckgen CLK_TOP_AUDIO_SEL>,
+                 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+                 <&topckgen CLK_TOP_APLL1_DIV0>,
+                 <&topckgen CLK_TOP_APLL2_DIV0>,
+                 <&topckgen CLK_TOP_I2S0_M_SEL>,
+                 <&topckgen CLK_TOP_I2S1_M_SEL>,
+                 <&topckgen CLK_TOP_I2S2_M_SEL>,
+                 <&topckgen CLK_TOP_I2S3_M_SEL>,
+                 <&topckgen CLK_TOP_I2S3_B_SEL>;
+         clock-names = "infra_sys_audio_clk",
+                       "top_pdn_audio",
+                       "top_pdn_aud_intbus",
+                       "bck0",
+                       "bck1",
+                       "i2s0_m",
+                       "i2s1_m",
+                       "i2s2_m",
+                       "i2s3_m",
+                       "i2s3_b";
+    };
diff --git a/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt b/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt
deleted file mode 100644
index e302c7f43b95..000000000000
--- a/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Mediatek AFE PCM controller
-
-Required properties:
-- compatible = "mediatek,mt8173-afe-pcm";
-- reg: register location and size
-- interrupts: Should contain AFE interrupt
-- clock-names: should have these clock names:
-		"infra_sys_audio_clk",
-		"top_pdn_audio",
-		"top_pdn_aud_intbus",
-		"bck0",
-		"bck1",
-		"i2s0_m",
-		"i2s1_m",
-		"i2s2_m",
-		"i2s3_m",
-		"i2s3_b";
-
-Example:
-
-	afe: mt8173-afe-pcm@11220000  {
-		compatible = "mediatek,mt8173-afe-pcm";
-		reg = <0 0x11220000 0 0x1000>;
-		interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
-		clocks = <&infracfg INFRA_AUDIO>,
-			<&topckgen TOP_AUDIO_SEL>,
-			<&topckgen TOP_AUD_INTBUS_SEL>,
-			<&topckgen TOP_APLL1_DIV0>,
-			<&topckgen TOP_APLL2_DIV0>,
-			<&topckgen TOP_I2S0_M_CK_SEL>,
-			<&topckgen TOP_I2S1_M_CK_SEL>,
-			<&topckgen TOP_I2S2_M_CK_SEL>,
-			<&topckgen TOP_I2S3_M_CK_SEL>,
-			<&topckgen TOP_I2S3_B_CK_SEL>;
-		clock-names = "infra_sys_audio_clk",
-				"top_pdn_audio",
-				"top_pdn_aud_intbus",
-				"bck0",
-				"bck1",
-				"i2s0_m",
-				"i2s1_m",
-				"i2s2_m",
-				"i2s3_m",
-				"i2s3_b";
-	};
-- 
2.49.0.805.g082f7c87e0-goog


