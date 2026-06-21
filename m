Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C45ECDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 08:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cr3pdjQhJUwUIpy3MtQLNp8w7Jmlbm2OlpXRHc3g1wU=; b=fCkItsQJbZfsYn9ezNH2dB3ce+
	X7+sO0+ULkEba3GiF5nTHZXT7EqKvepIKRdbGdatTd9UXMQcrPOFUb+ztNUV9Cy+2OykwKPPnn6T1
	OLJwuFDaAI1203lR1fFXtThzmb5SBFk/acaGR3yHIsmD3j8nbUsPQaeq1JovESd0BUVLegkBkMJPL
	ZROrPIY7XC0S5MBYBdqlIuuHdt9hvu+9NSgiwozEeeftaTDRUD+tTIyh7KE1b4vUX/AlEWA77UWYP
	melAbDvBTBVc9aMhd6eY97IfX/opKXkdJFrPcN66PrHQBKhLvR6HF+vuR95fEHnZ8R+6AvSGWzIX8
	8xsnWQvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDN5-00000003pkm-31RT;
	Sun, 21 Jun 2026 08:17:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDN2-00000003pjL-3p8u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 08:17:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49249707788so6665215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 01:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782029855; x=1782634655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cr3pdjQhJUwUIpy3MtQLNp8w7Jmlbm2OlpXRHc3g1wU=;
        b=RVIJHngGYyQm1o2CCPw1/YOYbP3WfGtWo0DEUQVctcMuFVVnBePC4utCFr1PPTXbHS
         Go77tlVGIwpvjLPAlZ3e6zyD0j64ro0+gQk811hd2Dn4jiiXzLWibnySNzfnis9JbaOV
         4aKAfD5vEvKNtk+Nw8Zi3TBHmQ4W+etymY/M2yH4awZDssNjwFRo5BUANTEzsKMlL7bN
         vNRvEd02mHP+kgaQFOkj14jkaZTK9b3SE+xP9RBdcyMBrJ8r2vEVH5Ut/oD+wsF6K86c
         +pE+rFkuGR6RdC90IAASzfGyv/ZiP8T0yHFQJUgpd4jghQuOkC2LHrVa1YVXdD0yqU46
         7wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782029855; x=1782634655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cr3pdjQhJUwUIpy3MtQLNp8w7Jmlbm2OlpXRHc3g1wU=;
        b=aH0qyL1+UW4ucRVSPtbN/O+YXIDDvRopxgGuiN13d16MxwJ6QMy7MTBw1gNtN8XZ/1
         vK2wYzXIUXCyKGAK+YGdsN8ekE9zNekeq9yj+o5kdzc6XR/48nE+zh1xWWGYbelXuv+d
         m6uUHJFMZVe760tsdCUON7A7R6eCqNBEhCJ7iIAz6rxSgs0BmqMzKEdre/qWcjM/LvUp
         v0C4MhSja6ZMHxJ2Em3Fqo/PBYedV7zWx2OBpf1a+Csz/XihPxc4q7C2lvtoKhm5kGRC
         Yc5CB1MjlnINZg1tO8N+Awbk3TsHHLHHj0uQCbZxYWHBOa0zSIXKLkcc0tzLXCcN/yrX
         5vaQ==
X-Forwarded-Encrypted: i=1; AFNElJ92IKaxEzwz2Vh79MXK0TiJNaM0jmPfVjDaRzPfua/ExQgKGuuayJgOI5G3/+gVM+Q/xss9qxs82LsMug7n0/fC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxuk8U3M2S/WPiJPjb/1ELE9Gecbk3ilvbkPZfrXCBx5jTeUyRC
	keIsPWdPrsTONSx+uFsxhkbkzPUtiwVfd/q/Bm/4b3MS7iK0dZ9xjfMD
X-Gm-Gg: AfdE7cmrAC2PUH4JiyQr0meupzN47KE3JFjFxfrCwvqCLqKYknSTVCbO7eGb3/kmosA
	W+7c4nTy5fOoo5oy6FDoBec37xZLbWQ28wXSOuikAqgfgxXpowXOZb7joAP5z4rulIGjYqHnqga
	+fMtdmm1bUyBnhsENINJYt38GsYbnjDvz32F9kT0PlNa3BluAHI3ZaWEu0RAWZwCAdv3IwlvJGm
	9qVzH6S+S8JZqTMgvZk8+pdI9R6reP+VNLid96D4aStdW4DFRZjgiKVH5FscaThgMJITOB7nnJG
	gcqWL8XGH9pm5CxI6sRf1Ea+rwWOUaEmunHEs0/ZdZQG0IocqZiwFXCquACO3fA/cr/isBdLrA8
	9g9AKyXmClAKsL+wTMxaQnoZtyH1d4Eh2+S2DYBva39vw2fYIiF00QlbLRvdqbbRg1tXiA+Z4x5
	Djk6I83w==
X-Received: by 2002:a05:600c:8b4c:b0:490:be1e:6ce6 with SMTP id 5b1f17b1804b1-4924908ab39mr81863715e9.9.1782029854882;
        Sun, 21 Jun 2026 01:17:34 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm194100445e9.10.2026.06.21.01.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 01:17:33 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Sun, 21 Jun 2026 10:13:28 +0200
Message-ID: <20260621081634.467858-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_011736_979324_F37CF942 
X-CRM114-Status: GOOD (  16.39  )
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
 .../regulator/mediatek,mt6392-regulator.yaml  | 112 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 ++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..d74721d8f2ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,112 @@
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
+  compatible:
+    items:
+      - const: mediatek,mt6392-regulator
+
+  vproc-supply:
+    description: Supply for buck regulator vproc
+  vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-supply:
+    description: Supply for buck regulator vsys
+  avddldo-supply:
+    description:
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
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          BUCK regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          BUCK regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 1]
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|usb)$":
+    description: LDOs with fixed output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+  "^v(cama|dig18|rtc)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes: false
+      regulator-initial-mode: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        enum: [0, 2]
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..2e1f41e0ebfe
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,23 @@
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
+#define MT6392_REGULATOR_MODE_NORMAL	0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_LP		2
+
+#endif
-- 
2.43.0


