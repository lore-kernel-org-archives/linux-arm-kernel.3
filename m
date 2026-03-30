Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB62F3D61F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZY/r0Q2Y0NxdHq45+egYGlikRLogBMu0oJhE3y/Rf0=; b=lO5OhzRUjzko4o23ig7AQDSA38
	K99vcxrGjiVgee4ebQmNVI8HKoSqFsvKhMKP68JQSla/63XogPjrG5RhC7RY19VXfpHQ5YxXu6FIH
	SIcidGp7c9dgvxMv9gJv23lp2PJz4tdHg/3w8/kRd9Qo3ywlSPB7iN/ElNwL+Ix3LfxTD4+JOMb1p
	6twqB2j2D9q1gtfS04WUfvrdYrL0UZPGXUoBHYduuWU0pcGZbXRarq/YnHqxieVR61fNC4WQet2zZ
	aND8BJfwCX/HVWDREhlq6uYArkmJCIm6sYWn5Ov5zYFCuFfY6t+SoME3ccfRkF80AnX0JdjJIVwwh
	0opG45GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785o-0000000Arq7-0M2o;
	Mon, 30 Mar 2026 08:35:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785i-0000000Arna-3CvE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:35:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48374014a77so50158685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859721; x=1775464521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZY/r0Q2Y0NxdHq45+egYGlikRLogBMu0oJhE3y/Rf0=;
        b=GDgHF++bpqaWQuHthmwm+odE1Q2k6LXPiwwEFLW0XfImurCUlrdnQuesNiZOXWEP4r
         rhiHFEzpo8vj+xI5W0zs11ghAHy8q0jUVXrveQ1OT1mFWBrIPpMUWFuGCtVpUtzWugCS
         1FoGYnmY+NJwtT/mF1AScTBAQMslT4XeMFjI1NcO4gq0QJkArBCSbEaXUCO8N+cvyDZl
         IvO373TrY8McLnSoFa6gcrbRBionP/0AOv7WhAtudFePDG8ZHUgptjWMhk6ZTRqYy0Kb
         zBs4zoMmptET13C3vn7JqxDAb4ipVQCdhTN6JZeakJyj5Jd1xorRenkoUS9MrSW2tDh7
         L52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859721; x=1775464521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eZY/r0Q2Y0NxdHq45+egYGlikRLogBMu0oJhE3y/Rf0=;
        b=eAW4lXRFXNdXHKVjRsZ8guuIo3WQgd9XbXTT9/aGPrI33D+q1RsZatyPqZIrtZGCkA
         3nPToH6J7+RLKwxRugJOkV6XcCezDHCVGXI0cD7BA0kMfErlb6MOw/hoUiXShpdpcSUl
         yxE1lSbZ1MIpadmQYWIpDZxofrAFumGWlWXC0rmJfKDnOtGghW9os49lct/p9lJqBATj
         PH8AmZWD0DJEQrOnLVTDFuvImhNly+/viJutc3QWT8EqPUetAQjWn17TROFax3y+PNh5
         dVwAC0MyvmXu1MhJSf/CYdkN+llY5fgstEb6g0nj2JcomjkARd6CsOmWaU8paa9e353c
         DNxg==
X-Forwarded-Encrypted: i=1; AJvYcCWn1MBm+LcMpDhPHrwDP4FX8rCgQC63ob9UYEfbDBYfph1TEFKsn1wFRTl6kHPNLwJJi3zPtDjjac9b4GSo6zwU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj2NqTp3LYYt0IdTIIUraDMlO209a+iA/cV8SDSBgDQX93l8jj
	pjfBd2cdI2mjgCB5fo5SqQ1QIJnZZze7a2R7QUzeHiRRT/4CcO/2bZZy
X-Gm-Gg: ATEYQzxqNE7GKLPJ9afmHprmH5UY2vBqGPe6GK9NnvfzFJbUDXO6zi54CENwWYMDQ1m
	n32URhMngWsEJJBeo+3sfX8/wdQR7qgTTue01xYbIjvaepZcPD8GDgJFAWnVhY/l+zuXHijSNlF
	wYNqQ7KfQy42yhiu5zzmssCue0lMPGq47v+/xu5Po5UwjGxfzU4WGjLpikwXWUPxkfQNnvH1NMe
	U5v6B8pBY+S2m3ACHLzXmDUW+uDF22W2cgI8WL/qdW+C8glNlnel94BA5WW1NamULYINMIT7nbH
	dt+E0xNNGdQEJYhPrfXk88KUlIX3pbUWbjYI00e5ypDk4XMU4jxbZBQuyRhApjqvDeQiLWHLkU7
	djP+1DdIfhyXmYSrTlNJuDB0pDVpFj48ilzNnhzT+2iwY7Moze86eF+DSJsR9OSGQcGjl9SvVdZ
	i5hU2X09+s/6ceoRMZUR4=
X-Received: by 2002:a05:600c:4e15:b0:486:ff92:63e5 with SMTP id 5b1f17b1804b1-48727d4583dmr192584345e9.6.1774859720682;
        Mon, 30 Mar 2026 01:35:20 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:35:20 -0700 (PDT)
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
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Mon, 30 Mar 2026 09:29:37 +0100
Message-ID: <20260330083429.359819-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013523_699899_5DED6511 
X-CRM114-Status: GOOD (  17.73  )
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
 .../regulator/mediatek,mt6392-regulator.yaml  | 74 +++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     | 24 ++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..24fbaef0e717
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+description:
+  Regulator node of the PMIC. This node should under the PMIC's device node.
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
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|rtc|vusb)$":
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


