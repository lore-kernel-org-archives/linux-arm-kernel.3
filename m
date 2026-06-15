Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC46CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CefDNXp0t/3lemxoY4i19YgqNhdG6IWYc6pzOXdnlDY=; b=v2LDyO4I65diAJzfgfi0rL2gWr
	O2dHvHh02LM/55IintFJ+Suweum6GXD/+ANXEYWVFdc7GRtDtrjYgDo4CeSYt84HKdNFNtSCebPHh
	Va5KH9pDyZlZnLr2OEibDO9WpgoEofFb3/M9Vvx8Yn1X6PGkf/Zp1fxF7KXlskopfyZ+QTNN6H9Vi
	V6vMDtbxRjDd107r6Bln4SkrvQEyv9wDE4JN+/zZpgqwV2TMcKGK9lKUqx++YzP1TZQGt8TO0iGwg
	2DFxdQrR2T2wNZmgX4nKt9rZ8FuQMwDX2kYEyePl5ESf9sbWbz38oOtNqJGabaSCXunUVmYdUCDWU
	lqae3LFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZCWA-0000000EkNY-0pv3;
	Mon, 15 Jun 2026 18:58:42 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZCW6-0000000EkMi-3dNl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 18:58:40 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45ef29c5561so2001497f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781549917; x=1782154717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CefDNXp0t/3lemxoY4i19YgqNhdG6IWYc6pzOXdnlDY=;
        b=qIUxtdjfKuowMer5sfxNjiQNRBEpIa6zVCQGsjZifpjLZiPNR5RTe2NzlwRjG1n8Rn
         2sdnXpv5EeoJKZPCvsyRhYt3r19WZTT7ep/WeHox/o4sCpY6SbY11GvTyX19YFW5SdoK
         TNluSrJQRoK1hgvY8YL67UTn/kPJsDZCnwIUSlR3Oo6d8Fx0v+CbvUr44rZ43JXbUU1k
         /bWvWMI2LjmVnlnAk9VjtjRjqAKafTyi3qKIdgcgnTmGxAnYoLFHXtTTxuKbi/QdEjMo
         5+CteT51Mom3fi1Oj98vG1NM/H60nkCDM6zUmg6+Yt3W2xLEYquMJdJPcpOP8KzbjOY4
         TLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781549917; x=1782154717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CefDNXp0t/3lemxoY4i19YgqNhdG6IWYc6pzOXdnlDY=;
        b=EzkAeQGONiKYWJRDtSnybI6Ffa++kVOVc2wtpeMopj/0Oy9qbqIafQZSS1V3KgBtPX
         Fz+1PzV+L4Omlir8enb+H95E2mAN9cyfOUIV+wEUbKPqT1VrGMyBTtr8S18evEJnn+Ub
         8KsXzhZ+3n85XgD87tnOpbwylhGwndIl+7kZNcFfpZ2+m6qEl8Y3/rdoOq7cM6mOIZ5P
         KG4Qnf98jXiyCNrLObCUwpgAN08XRuTYbDbxz8V7J0OBTgmVZlwHeOI8nQYJ3XPWTzcI
         QI68FibnuAyhJ5Q8KrOkSA4aeOSwXBqFkBDPAhDe7+DA0Qds3acL8NK6jZoIEXoEaiZ0
         gXTw==
X-Forwarded-Encrypted: i=1; AFNElJ8JljHia8d1Y9YBfYztw068Ex5uLfKnvd7NmJkuaJfSrmeJRB1iaDs6Z8coS2mVhmy65temoTpLg/VBuohFbxq1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp5qAIR9Hc0abtRTE0buGyztGaTOQv+2xE9LBpk86WbZPmykgR
	D+gTbY+ujp75mM1loWlZKNO8kPAs1dcfJYgQWmb8zNITlBWXVxyWpxDW
X-Gm-Gg: Acq92OFbw0H8baRIuHobt5z4WoNwaO+RzlWIDF5piApTyFwMD4mgTTdej0NZWyDQ9Ye
	4dVvSx3cbvAJukOzEH2lhT96gD23V32outaXTXDbc1SaUh5KIIQ7bSbH0Rs81W1WVby0k4jtkYJ
	JOVTEXNrnOwJFE+H8VHKlCXWZvq9OUQGCk8c+S+N4LXEHl1RlEmc9B2RLVJRxeV9caS1dguMI9Z
	z8v62hzcoFIEyXFKt5zXpgTXmB7UziXdurpNF9//+1KpWmXVMQ0sJpk7kTi/MuLZ6IgOZfdJJK8
	0cUGIz07mcNlI/BYC2Wzl7H+F/xomw3HQHab/hHa1sjSjpjgfZt38RyzVIYnHY+VywHmdTDIawx
	9kuXX+eITpS4dQQHBXZCJKKwCD5gu+08rSs6uhBaF+MvtEwxstPAKlHhBPg+QX7J3tMWFI+uNrs
	WqgvWRG2l+L6Kfii2G
X-Received: by 2002:a05:6000:2384:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-46077f2db06mr17081462f8f.35.1781549916699;
        Mon, 15 Jun 2026 11:58:36 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm38040538f8f.20.2026.06.15.11.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 11:58:36 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4] ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT Schema
Date: Mon, 15 Jun 2026 20:57:50 +0200
Message-ID: <20260615185810.11804-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_115838_930182_A0252B08 
X-CRM114-Status: GOOD (  16.12  )
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

Convert the mtk-btcvsd-snd.txt DT binding to DT Schema format.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Changes in v4:
- Removed minItems, maxItems properties from reg node
- Removed the reg-names property
- Adjusted the example

Changes in v3 [3]:
Sorry about the spam. A second round of dt_binding_check + dtbs_check
led me to additional improvements:
- Use reg-names in place of a non-informative description property
- Simplify the reg property in the example

Changes in v2 [2]:
- Fixed issues from make dt_binding_check
- Set myself as maintainer for the binding

Initial version [1].

[1] https://lore.kernel.org/20260420204514.1640995-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/20260421154619.227039-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260421193858.347258-1-l.scorcia@gmail.com/

 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 59 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 --------
 2 files changed, 59 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..1b7451655476
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mtk-btcvsd-snd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ALSA BT SCO CVSD/MSBC
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+properties:
+  compatible:
+    const: mediatek,mtk-btcvsd-snd
+
+  reg:
+    items:
+      - description: PKV region
+      - description: SRAM_BANK2 region
+
+  interrupts:
+    items:
+      - description: BT-SCO interrupt
+
+  mediatek,infracfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the infracfg controller
+
+  mediatek,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Array of register offsets and masks
+    items:
+      - description: infra_misc_offset
+      - description: infra_conn_bt_cvsd_mask
+      - description: cvsd_mcu_read_offset
+      - description: cvsd_mcu_write_offset
+      - description: cvsd_packet_indicator_offset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mediatek,infracfg
+  - mediatek,offset
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mtk-btcvsd-snd@18000000 {
+      compatible = "mediatek,mtk-btcvsd-snd";
+      reg = <0x18000000 0x1000>,
+            <0x18080000 0x8000>;
+      interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_LOW>;
+      mediatek,infracfg = <&infrasys>;
+      mediatek,offset = <0xf00 0x800 0xfd0 0xfd4 0xfd8>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt b/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
deleted file mode 100644
index 679e44839b48..000000000000
--- a/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Mediatek ALSA BT SCO CVSD/MSBC Driver
-
-Required properties:
-- compatible = "mediatek,mtk-btcvsd-snd";
-- reg: register location and size of PKV and SRAM_BANK2
-- interrupts: should contain BTSCO interrupt
-- mediatek,infracfg: the phandles of INFRASYS
-- mediatek,offset: Array contains of register offset and mask
-    infra_misc_offset,
-    infra_conn_bt_cvsd_mask,
-    cvsd_mcu_read_offset,
-    cvsd_mcu_write_offset,
-    cvsd_packet_indicator_offset
-
-Example:
-
-	mtk-btcvsd-snd@18000000 {
-		compatible = "mediatek,mtk-btcvsd-snd";
-		reg=<0 0x18000000 0 0x1000>,
-		    <0 0x18080000 0 0x8000>;
-		interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_LOW>;
-		mediatek,infracfg = <&infrasys>;
-		mediatek,offset = <0xf00 0x800 0xfd0 0xfd4 0xfd8>;
-	};
-- 
2.43.0


