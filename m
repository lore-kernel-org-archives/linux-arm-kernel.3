Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648A5F5A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ozJhRqHV7vShx8fI9wXW10pkaLTm6Vl4wo1OcZafVU=; b=ZOAwcXlkb48BPXnoHXxj7iagWX
	FGl2qs8gBcT/SnPvvpzru2LbmviPzhLNa0rRI3+TPd4DZ10f7V5kbpCDFH/5WwAd8i4U5UgSYhZjd
	Pwa8ZH9/MuYYW19vSQK+AxRB11BsBrtWcZ5hbTRhHZsRjkk9FPCUGsMQjxngh9VhR/PenWnn00uJ4
	ZVLYqoj6lc/J04lcJrp4nB7VMaoBADC+pGT7HghrZjIJxyLPqMPo2cVf6pzz/62K6bBcTLSg3G7lu
	1OP0srgcfept/mVdocwFD4zRF6ZjSzpo50+vjFKOeKtPN9VvpsuVnzoJiMjFhdrKA3aghLJmrsMo7
	mJUz0cew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwJ4-00000007jvy-22UJ;
	Mon, 20 Apr 2026 21:37:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwJ2-00000007juY-1y92
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:37:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso13312085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721043; x=1777325843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ozJhRqHV7vShx8fI9wXW10pkaLTm6Vl4wo1OcZafVU=;
        b=XTA1oD5duIUmgyzGktefy9LQcfZToeMKoxTRVUflFjYTdQSrroLWC7+b45ridFfr4/
         DsB8d4r8zHKvyhoY/01gM+xnloQkUxC41QRFJLHa0nqAHQpFuDo74XWc2PQwU9yEDa25
         ajP6Ts+K4mIJwoq0AMSmRiQ/HfNvPggddBCkhvQlg51EoUBst82N1abfj+d/yDiRxW59
         155O2hn0clSEYZdOFUZMUicDwRcvVGCSsgFiQc7tun3Mbqqz3OUJ7x/WthGoUCuQxidR
         mxJ1mXf8seL7aAEzmX9iD4Xsp7l1k4TSd1B86qcCvYrvmN0TWgZk45B++7KX3eQ56tB2
         bdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721043; x=1777325843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ozJhRqHV7vShx8fI9wXW10pkaLTm6Vl4wo1OcZafVU=;
        b=nHBymU0cUDdrU4XEJIm/EKR7G6r5LK3AX8eTTBOXMHE/RF4FqlgSTQWbjF/UwJ3DDR
         ySMc4+d0adHJbMk0m7p4nY41RbFHx0Xp8gabzJ/MP4nN646Mo/Fnq1UamAgY9j39/zTG
         6i2dfebOu8GLoxmLjZel6RICLUudkZlB/P6oCFn7J6XmyXNKYDKj+791TJYySYpFj0M8
         0djVEXlA8bgX/IX3L1cHrOW/iqSRwge595QRFBzzlIWH6njlOCozcOFqa1mXq0I1ruiE
         UiqEQO7v6K+bTER3Uc58yvUPDx/nteA9FExns2xYobdhtfhgq0osV2rxg9CKYzfs2BT6
         WOKA==
X-Forwarded-Encrypted: i=1; AFNElJ8XlL9fDy6gySdP6SqGOBaFXlVP3FduP4bFug9K2jkAVxv2JNxwRAg/z54V8wP2bMwAWlt7tdqJYgoCktxO1Bfq@lists.infradead.org
X-Gm-Message-State: AOJu0YzUxpXb9lxQOC92PZ7zUsMHKVLu04UjTX2eA0wpne9UA17cfzif
	eSURHZ6Ixkrq++FLhYsd78cud0CqwZ/9hM6vNOU2Pb7tJogwxXZyOblb
X-Gm-Gg: AeBDietdpT1nwSus4nVy/vq/lAdLHXkIvhgWWHBtXCZz5nzNMaryLPrVfKkQrJROUSS
	G3S4UgmRIVF4MFf6tkTJ2ugl7zcWQLnN6nEaYy3PTqVRS6QGpZJF9G8ZJEL7VBgTFRWA5uO4wN8
	zLPnVPKBnkP9Mf6Lzi5vJJwbXxMkWhyoMdGFVE3tAci+5RyYBtuzL0ErR19MG+2FxflDPVQmtV3
	GYZCdKOQkqn0i2nK3VCh8BkHYI9ldC8st9ha081886w8BmuGarya6c1mKymEzFteHCGK5mi4y2v
	/NfxjIPZouNW3vtCQP3fS20JBLWwSbYapnVXdja1lHAQmuCKRVkkLlPyOP0LfD2yJDE2d2WqxFe
	n5xeHGZSuG2dXukqrdeyuORMkS/Jy/S0iqpZOvRUzNjNRZX28O3a1X1/qiKOK2lVoG14ud1FEAD
	mfh7rRtfgWlYNhWac+2fcsaGNwH/D0rg==
X-Received: by 2002:a05:600c:6296:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488fb73d764mr213394625e9.1.1776721042584;
        Mon, 20 Apr 2026 14:37:22 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:37:22 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Mon, 20 Apr 2026 22:30:02 +0100
Message-ID: <20260420213529.1645560-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_143724_531915_F47640A2 
X-CRM114-Status: GOOD (  17.11  )
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

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 76 +++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     | 24 ++++++
 2 files changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..f62bd94bd42c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+description:
+  MT6392 is a power management system chip containing three buck converters and
+  23 LDOs. All voltage regulators provided by the PMIC are described as
+  sub-nodes of this node.
+
+properties:
+  vproc-supply:
+    description: Supply for buck regulator vproc
+  vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-supply:
+    description: Supply for buck regulator vsys
+  avddldo-supply:
+    description: |
+      Supply for AVDD LDOs (vm, vio18, vcn18, vcamd, vcamio). According to the data sheet
+      this is an internal supply derived from vsys.
+  ldo1-supply:
+    description: Supply for LDOs group 1 (vaud28, vxo22, vaud22, vadc18, vcama, vrtc)
+  ldo2-supply:
+    description: Supply for LDOs group 2 (vcn35, vio28, vmc, vmch, vefuse, vdig18)
+  ldo3-supply:
+    description: Supply for LDOs group 3 (vusb, vemc3v3, vcamaf, vgp1, vgp2, vm25)
+
+patternProperties:
+  "^v(core|proc|sys)$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|rtc|usb)$":
+    description: LDOs with fixed output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^v(cama|dig18)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..8bd1a13faad8
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_BUCK_MODE_AUTO		0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_NORMAL		0
+#define MT6392_LDO_MODE_LP		1
+
+#endif
-- 
2.43.0


