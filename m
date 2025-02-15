Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E07C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 23:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykTHsvTL+qGG5v5/5FMPfK6N4hOl/V+kaltWfaRofSE=; b=47H58CYNyL8dYre6o2CE4XPz0o
	M7OCnmKZ0NVuGCh1ySgQKvOwFx0Tc7zqA3ff3cFQU1tqoceSg+8nKpqXg9nJ4BeOXFSe4NLPdjJTQ
	DE1aosvVzQ1uBYGbSF+R1LptpepBPbq090AJ3ZpxastZbH0uXPIkc+HLjZIPyx5RNR0fH4VmDf+la
	oM/iWkfnk0OLxQ9G3+egEOxAQnUhgCzGOZxBTunZKU9hnOtW7TtPqUAwa8qX/GnTw5rmYecP4eVoI
	A6f4+/ZOaYN4BpgjLuBQN8j7+Q8x88cpMq8j3JCIL445eCUzy5CqD0aKgWaAPgYCx3RLVR0zaQKAI
	dnrT6Kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjRo3-00000000ufE-22j9;
	Sat, 15 Feb 2025 23:42:43 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjRh3-00000000tbB-3Qgn;
	Sat, 15 Feb 2025 23:35:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1739662520; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZAOxQ7NEBSAaMaBLFhGz19v+OPogx+5fKT9mFiwaqrnZ78Mqgf3AJXcZfdnvvqhUvRsg424z+BnHSruSlA3/MQg8vdOADOJJeYs9FTohzgy6nNLGMhpK3wrHZQ241yw52PCcFQZGEhwDkVXDGjWkvS+cb/yvoTNzxctkUVJHKzk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739662520; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ykTHsvTL+qGG5v5/5FMPfK6N4hOl/V+kaltWfaRofSE=; 
	b=AoKXcPTCngMhPK2sTq5bPc0HbCxG9cq7VbYoyiJfIYbR95R4sBVoe/SdfMwsAte1VRuue59y+RtIwKvRXwggjjJoNMp2iufiEbHPxqOGkdqlhP+3qzckLSDCqDtQGrB5dsNBe3KuxAYm5r/XCeoeKJZH9/rdAWKxy5OHslCghOk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739662520;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ykTHsvTL+qGG5v5/5FMPfK6N4hOl/V+kaltWfaRofSE=;
	b=ISc1ttd3t4Zjep98WFy0mkAl/V3p+1YBlSRUbXiixs9gNWDVsR41TS5PF8BuCr+2
	kZxilXTIXj7V/9UY8yxv66w1YkLF52Mv4ZVzJKuSdisByNKdy6IYoNMZjK34zWHxzlR
	C/9Q14QD4fnOWsSMTe2fUnOiSnS3NRSsWi1kdgNs=
Received: by mx.zohomail.com with SMTPS id 1739662519156579.278733592755;
	Sat, 15 Feb 2025 15:35:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sun, 16 Feb 2025 00:34:53 +0100
Subject: [PATCH 4/6] dt-bindings: thermal: rockchip: document otp thermal
 trim
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250216-rk3576-tsadc-upstream-v1-4-6ec969322a14@collabora.com>
References: <20250216-rk3576-tsadc-upstream-v1-0-6ec969322a14@collabora.com>
In-Reply-To: <20250216-rk3576-tsadc-upstream-v1-0-6ec969322a14@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_153529_920827_6ACF6982 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

Several Rockchip SoCs, such as the RK3576, can store calibration trim
data for thermal sensors in OTP cells. This capability should be
documented.

Such a rockchip thermal sensor may reference cell handles that store
both a chip-wide trim for all the sensors, as well as cell handles
for each individual sensor channel pointing to that specific sensor's
trim value.

Additionally, the thermal sensor may optionally reference cells which
store the base in terms of degrees celsius and decicelsius that the trim
is relative to.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/thermal/rockchip-thermal.yaml         | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index 49ceed68c92ce5a32ed8d4f39bd88fd052de0e80..8d27ddefcc64e29f0faab059888805802c948b41 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -40,6 +40,21 @@ properties:
       - const: tsadc
       - const: apb_pclk
 
+  nvmem-cells:
+    items:
+      - description: cell handle of the low byte of the chip fallback trim value
+      - description: cell handle of the high byte of the chip fallback trim value
+      - description: cell handle to where the trim's base temperature is stored
+      - description:
+          cell handle to where the trim's tenths of Celsius base value is stored
+
+  nvmem-cell-names:
+    enum:
+      - trim_l
+      - trim_h
+      - trim_base
+      - trim_base_frac
+
   resets:
     minItems: 1
     maxItems: 3
@@ -51,6 +66,12 @@ properties:
       - const: tsadc
       - const: tsadc-phy
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
   "#thermal-sensor-cells":
     const: 1
 
@@ -72,6 +93,29 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1]
 
+patternProperties:
+  "^([a-z]+)@[0-9]+$":
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+        description: sensor ID, a.k.a. channel number
+
+      nvmem-cells:
+        items:
+          - description: handle of cell containing low byte of calibration data
+          - description: handle of cell containing high byte of calibration data
+
+      nvmem-cell-names:
+        items:
+          - const: trim_l
+          - const: trim_h
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg

-- 
2.48.1


