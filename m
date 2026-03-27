Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B39A10ED679
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 13:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=no0uujIoaeBaN0lzDrFX2OOJtop28oGgvskS3mBh/+k=; b=rzTW/Vv4A2eaCAr3gr/VNUx3ed
	EJPYojfYwWzCK8uSW4MVPwoDEV4s22nbELTQk4eXsn5aL8Jhv9cZesGggfJlZDgUBMf/H8jSIwHHK
	GCN3ee3ztCt/pL8znX8eba8H/WBgcfUl3SA61n+bO6Ha7eoXimcbHVJbR6TgkeKJvADtPuziRfHpR
	fwy5agiK1Ht7axvblZwk6Yt1NQKxUyuCfpQdG4PMMFFd8VnQi8TfpYNW96H+BhaFTGlrEgkaPdwpa
	NCqX+3kivh6RyIQA9rniHxw/1+6h7WOQLDpuW3DbolaGDjBTAhZg10jrKLcypX1nzSaXZXOtuN7DW
	U87JCYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67XK-00000007TOb-2vhV;
	Fri, 27 Mar 2026 13:47:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67XH-00000007TNW-0ftE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 13:47:40 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b04d051664so17944875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 06:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774619258; x=1775224058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=no0uujIoaeBaN0lzDrFX2OOJtop28oGgvskS3mBh/+k=;
        b=bIQr2/xaQFXwJHMQ+1/u09JwLkef2Fa766y5gZhivphgXazCefzfyHg7ajjn11kWTL
         dQs02VYzab9j2iki886ZkoLpNoDfNWkX24o152n2DQmtBOBkt8ezzg8UvfV3AqCvl2Oj
         bEarZczZbtFZ/VOlMcoNE6+2DcDvHZwX1guJENDmIC2z7o5uLZAYES7+uRY7WJk7s/6/
         AXuZFmoapImVQDx0c5t5F78QL14sb/WbnohRSB16EMvKZ2hJRFl+IkyfDjndfsJzjax8
         MkQc5lPd/ZYOqBNPiZvC9mbcAjlapztz9LVGFIh7qLzvUKvZgek4JisYe431Drn58L3f
         UIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619258; x=1775224058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=no0uujIoaeBaN0lzDrFX2OOJtop28oGgvskS3mBh/+k=;
        b=EmDipkhRBtaVOGC/eFaCa0aOmMlfLzxdean6VfNxf3KgC6R2jMh0I02jQq6C4Qz+bp
         g1a5cg4z7Scs7T1fw2EdGxxeiJF3Af3gUHAz/snIRtuRAEiv1GHyY/chCKP/i4jASeLi
         UcnIAaV+LaLFiopr3QNHFWbeiA8CjF7Vex8mN6dKEwIH9avaaCoV9vqBXrq8fw5SZuXV
         OsgXiKaYfi+AvHqxgB6uxncRsA410zJ/JZPMIJ2GtkgtUaR0E38RxYFmBUDU5Ma2OFE+
         gqGldrJR/ZYo/oxCsdyUTYWeu5IvH8d5+VSzJk4+1az96thQarwvrZdHGzRO01CEHiXM
         LqvA==
X-Forwarded-Encrypted: i=1; AJvYcCX5K+Z9Bho59FGe+xcZLrnczMDb4zVY16gFL2lS8wl+X/+gSJQYHRTGB2lXQT1/l8n3PNpzOm1oIPVWSVevw/tO@lists.infradead.org
X-Gm-Message-State: AOJu0YwbRG+6+ZFk03CiFWfhS0B4McW7FvKBk33NHDr0/2z0aB8BNTWM
	HYrLlf7o8c+ncPyPf2EroKavScC3EP/VTmOyh6o194RwlOK10FkZ5I8l
X-Gm-Gg: ATEYQzwSfdqCOsbXGNP8l2Ynh4zEJrDw3q8NuYCnOSBvAK3ZR5Ww4OLGt7JQSCUeXV0
	43/NFbEDea7nkDeHyKvZ93FgLTIJeTfW7+OOatCwnG+SaeNnOKr6yMpKlPenRtf024Pvxkf8Wey
	XWVVNC+Vz/gloInEeNy2C5ZHdS4hfLuSBzo1wXMKX8a0XWNIXdXmVJjNwQhinR6VdLv7TFKshnR
	1wb4K/jA/OEXu5z4FhopiElTLW5jHifciM2C+8FCJsxuPFViHwrYv78ATQh8y6upnVvlqeXvuMp
	crC5EL16DUviEnmOxWeJOO2+1l7C+mRGMg49xTz5HJMJmTsh37fkm1xRyKo2hsUk9RW1u6ycgTz
	c5z+b20jRg58t7kYZg/Yx7BQ5I2Cxwg+WmG1xSUlqa/fmTDNx3FQAOp/CvpeHG5phf5BQM+n0/D
	jr6Vpvl8Gw2pVsioc+96Dl/IbVOcUx
X-Received: by 2002:a17:903:8cb:b0:2ab:3cba:42fa with SMTP id d9443c01a7336-2b0cdd0555emr28331695ad.46.1774619257719;
        Fri, 27 Mar 2026 06:47:37 -0700 (PDT)
Received: from snowman ([2401:4900:614d:8cb4:a69f:d838:ad5c:7358])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76b6casm62403545ad.16.2026.03.27.06.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:47:37 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	koro.chen@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v2] ASoC: dt-bindings: mediatek,mt8173-rt5650-rt5514: convert to DT schema
Date: Fri, 27 Mar 2026 19:16:49 +0530
Message-ID: <20260327134649.31376-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_064739_208178_C36D2ACA 
X-CRM114-Status: GOOD (  14.07  )
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

Convert the Mediatek MT8173 with RT5650 and RT5514 sound card
bindings to DT schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v1 -> v2:
- Used two separate entries for two phandles.
- corrected positioning of additionalProperties.
- Fixed commit message to match subsystem.

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../sound/mediatek,mt8173-rt5650-rt5514.yaml  | 41 +++++++++++++++++++
 .../bindings/sound/mt8173-rt5650-rt5514.txt   | 15 -------
 2 files changed, 41 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
new file mode 100644
index 000000000000..ed698c9ff42b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650-rt5514.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 with RT5650 and RT5514 audio codecs
+
+maintainers:
+  - Koro Chen <koro.chen@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-rt5650-rt5514
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandles of rt5650 and rt5514 codecs
+    items:
+      - description: phandle of rt5650 codec
+      - description: phandle of rt5514 codec
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8173 ASoC platform.
+
+required:
+  - compatible
+  - mediatek,audio-codec
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8173-rt5650-rt5514";
+        mediatek,audio-codec = <&rt5650>, <&rt5514>;
+        mediatek,platform = <&afe>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
deleted file mode 100644
index e8b3c80c6fff..000000000000
--- a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-MT8173 with RT5650 RT5514 CODECS
-
-Required properties:
-- compatible : "mediatek,mt8173-rt5650-rt5514"
-- mediatek,audio-codec: the phandles of rt5650 and rt5514 codecs
-- mediatek,platform: the phandle of MT8173 ASoC platform
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8173-rt5650-rt5514";
-		mediatek,audio-codec = <&rt5650 &rt5514>;
-		mediatek,platform = <&afe>;
-	};
-
-- 
2.53.0


