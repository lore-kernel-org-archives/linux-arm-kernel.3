Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A42F8FA90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pm67qKOM3Exkx05WtLYkzfFidvA4Ig/U45KGlldfDxA=; b=YFfa4qSzdYuHwOJtf3Nf93iYPn
	1zY6Ib6brcJtboEF8isCGk/rgrPsrSTl81qq/0tzkGICD82NeSRiGVB+fCMtDsl9gzN1TY94IWoQU
	PvIRPBIv6CDCJmVcQ7Ycl4bSje+HOgUDw6gkVy6B0XUUWBQ10CfCNINVqpRZJJpeZ0u+N/Pq7SjJQ
	/89rznIfEUulC/GBm5GPZBOYznErI8TlzIVIckpq5YeJUYPJ6lvRcxXmLXZfdN1O6Y0pclBGnIefl
	aXwVSRzS3AxNOQNjA/IPx8X/+9xMRER6QkdHaW1nJX+Qgf3SsU1JWe183XQn2hLfzHkPftPkWPeCM
	BkvA+mJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDJC-00000008qiM-1sC9;
	Tue, 21 Apr 2026 15:46:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDJA-00000008qhW-1WCc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:46:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488b150559bso34895045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776786398; x=1777391198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm67qKOM3Exkx05WtLYkzfFidvA4Ig/U45KGlldfDxA=;
        b=EnHBhdFUKSF9zzwG5mrwwE4HKThYSYfBl8UD+qZXWPebzJ2F7PM+OhiiWSuNE+YoUK
         05cvvSJqquvCZiJTYgQgPJwJudUBwfJskBGYhzMmBkGyjYL0zO/p0zorofr9pEWLrLH0
         Xf+oMY8NlXkDpj9JV5nh7tlrOt0LDnZHIVpep7YoZ3XdgulMfPaTZ8ZmC7Qw1oQuv4LM
         qiWTGFaZRLf58oWqVe9KHpW6aFsEgCCTCSIW90QwrmdfVlVNlEjombFqH3h/KsqThyoI
         ePKzdglnrKISsbyEvLTq41k6Xg/CHNvrOOYAKgCBeY3iIESgUl+T4jOnGmvSmwljhj+6
         IUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786398; x=1777391198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm67qKOM3Exkx05WtLYkzfFidvA4Ig/U45KGlldfDxA=;
        b=at2U5cRoteVq8Vktj9fT8J0SSI51E4u8adNAcoaTa5cn958Mvr1VLqecRWP+yRSz88
         kBNwgOQJUG6c4P2CptU0uG0E8nFJ2I1XbV5KDR1a7nKwRb7CHYdktvN8KyHjFQDe26pd
         ayESeD7q8gUmhJ/z2Qwv681+VS0C9gOfNq3Tbi9lnR/VCH2YJ5q3NMT/R39m/BFVoMr8
         ZBKGbiIpoQMIdTXsnWdx78XnAtLQ1fnc6tDVgWSfL4KAzEurTBhRZCmRkqfjFDzLSK6T
         fmbIlA5efGFidlW9KBU2qmUSVqwPRftba3a0xg5DZsMx+1kl7bW838t2jYl3y/1Nz62j
         cwhA==
X-Forwarded-Encrypted: i=1; AFNElJ+RZZ7QHxdmro0CDmcj8W8Pc8tzh8ToF9Iy7JPU6avBC5HPlwPEOMxeCqya4dGVeVM8HrsVjyIbQrPchk0k7T3b@lists.infradead.org
X-Gm-Message-State: AOJu0YxhEDqSOAOh/SOfdOLZiZPLd7ZsBU9qeBn9LgBsLnOSHcdTYjUh
	FuMmzl2GlmydjgjsafKGDc6iaO9x9vnIxvjBTsjxhxeq9hdznoh3G/Ye
X-Gm-Gg: AeBDieszXVPQ8aNHGl7giIeccLfDaHy7fgUIh1++eYMble+xAShjMgSeZBwpgEv24dK
	B/Blg01F48FHKfUMKTlod1+puP+6RIoxA8A1Dm8XqbDtop3+b+IVMML2AYQ4d8V9Qg9fTajwaGW
	4vzXTYxSnmwLPrb87g/0OWQmbn7p+9+mfXjL2Iopok/SnYRihHK61TvQqCrNL7cgir0MUMkQNsn
	WudE5Dwhbe0Vjg81EU+F51+AeMsxJ4KcLX060842t4VSY7FlSEiflanUrxf5JMej7RvIZzPLvZe
	rIBNgTpY8p0qoz2ZTfuXfIl+/nQk6kA+CzW1o8ZrWVLgl1Q840t6mFZiy642lbc8DZdwujwkk3c
	AyAhzaM2xSGn0URJEpjSicyMabeliLHOrwQyH4zZwyMBs+wf5kPYumlUf3jfYQI+lCxrqKhnMvm
	gQWjmgVIW5Y0lXn30Hpt0EOX3yXUOA6A==
X-Received: by 2002:a05:600c:4ec6:b0:489:1f98:71e3 with SMTP id 5b1f17b1804b1-4891f987487mr114165495e9.28.1776786397946;
        Tue, 21 Apr 2026 08:46:37 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c318636sm174759655e9.7.2026.04.21.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:46:37 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd to DT Schema
Date: Tue, 21 Apr 2026 16:46:07 +0100
Message-ID: <20260421154619.227039-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_084640_455115_B1F2D739 
X-CRM114-Status: GOOD (  15.94  )
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
Changes in v2:
- Fixed issues from make dt_binding_check
- Set myself as maintainer for the binding

 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 60 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 --------
 2 files changed, 60 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..1ec50c7611df
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mtk-btcvsd-snd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ALSA BT SCO CVSD/MSBC Driver
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
+      - description: Register location and size of PKV
+      - description: Register location and size of SRAM_BANK2
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
+    #include <dt-bindings/interrupt-controller/irq.h>
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


