Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D4EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1s5SW5XXy2Nmw/a2myc1LsBMYI2XBbGAAdPmoWnhN4=; b=VXOgX9l7G/+vgNXwVUIqtEtMtg
	jDlkC5mu6AOHlwPBFYKo5KYKq++DMZpZ0ARrkb6Gwx431nSOrzAmBmvf+RJFNL/oIKy5e4XunVLKp
	5MGLMyHGu+QKYjTqBFyQYxyKfDJJFarvN5lF6WKTCp5rwIYqFLn+1K5IY8vYmn4O3wvyR2EytIAdt
	Ky40l78nQr44n+YYPnuqIwZEsPwrlmyFqn8jrz1TYd8ALnZNp1bKQSgg6A2YPmzj7tiLQncBYwe8r
	7sG9ySYrZxxbQZ4NSK3G00sNbCBilXHlBbvf2Ypo5lXMe42L0Ct8y1/HwOcE7h2IaHSWTdxHFRnHC
	+ffDajVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOz7B-00000006zEV-2uWd;
	Tue, 10 Jun 2025 13:34:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAT-00000006mKw-1a79;
	Tue, 10 Jun 2025 12:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P1s5SW5XXy2Nmw/a2myc1LsBMYI2XBbGAAdPmoWnhN4=; b=eevEDcWbgIjw2dSL+/0c0A0mRT
	5FlYtwpp6C8S/z5jy05GiYNZM8HkwbT9Kk4xs5ORPp3u9DKdVYJWXwn6oBx7xNLdbjehbi38X6iau
	PLRJ3a4pntqBdOcatzaEnFx/lbg9+NsZ6EAcSDj3nb9FD/4vN9TVyE5GrDvgMCaFkwlpGk63b0SZ9
	Fu/bTPRlToxCMsd6fEGNk0ETunkaEqNt+MXlxT/RI1MvIY641MeO0Mh3cuBP3xt/jTH+Q7kAT/1t4
	OB85okNDX4BUtsI58l2IQIKc4jN+awpI6HL8maJaO/JT8AE1HhF4AFipNwBrqkPPT9J5Y4HeqBD/s
	mMGubWzw==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAP-00000001oTU-33Oi;
	Tue, 10 Jun 2025 12:33:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749558785; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MeOm41MaWGxGL7YqS4yDr6YL5/olgjHZDsXQuea9QkvhYD+8RtW9XaIhto0djhvM8rGSbD1Uu2PsZ1YFEKHVgULB1MPgfCp4LoouN3Y47wWetlq2jH3RsZPI6gzrOjFD2NKav+ElL3YGVhBbRz4lwlZyXKAXuRAYwptu+LgMH5Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749558785; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P1s5SW5XXy2Nmw/a2myc1LsBMYI2XBbGAAdPmoWnhN4=; 
	b=GAGJdAdkS2hsWAm2KlXqSB83GqJfFf9+2dwnE2nz4hzAR7QGpvFKqfNSeQ0/vjj5pGd2BY90BKyde/41WSuD5Q/DDjrOE2vA9q/5xcMqBBVWGEAvEOqeENXXNvhl/EEE441+QoECt04+xLf8m4fTOPHoaiHKHMDOLper3aIQ6gk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749558785;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=P1s5SW5XXy2Nmw/a2myc1LsBMYI2XBbGAAdPmoWnhN4=;
	b=gkJdcgSeGcq+BldCIcz9rSefLdShudVUVLHy5TUE3k1hhZ+T5/U3bF4hqtb6ffCr
	u5EbzpzuZGuf5Hfq2wG/5dctOeU1yMFcWIj6goIsGVJJnIBM84d4nZtk3WV51BM8oY0
	tLE3ewmBPpD9ujJsl3qN7cykAc/OqZWonGEOMk2E=
Received: by mx.zohomail.com with SMTPS id 1749558783838173.35577891638252;
	Tue, 10 Jun 2025 05:33:03 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 10 Jun 2025 14:32:40 +0200
Subject: [PATCH v6 4/7] dt-bindings: thermal: rockchip: document otp
 thermal trim
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-rk3576-tsadc-upstream-v6-4-b6e9efbf1015@collabora.com>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
In-Reply-To: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
To: Alexey Charkov <alchark@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133326_349186_0DF779F7 
X-CRM114-Status: UNSURE (   9.92  )
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

Each SoC that implements this appears to have a slightly different
combination of chip-wide trim, base, base fractional part and
per-channel trim, so which ones do which is documented in the bindings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/thermal/rockchip-thermal.yaml         | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index 49ceed68c92ce5a32ed8d4f39bd88fd052de0e80..573f447cc26ed7100638277598b0e745d436fd01 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -40,6 +40,17 @@ properties:
       - const: tsadc
       - const: apb_pclk
 
+  nvmem-cells:
+    items:
+      - description: cell handle to where the trim's base temperature is stored
+      - description:
+          cell handle to where the trim's tenths of Celsius base value is stored
+
+  nvmem-cell-names:
+    items:
+      - const: trim_base
+      - const: trim_base_frac
+
   resets:
     minItems: 1
     maxItems: 3
@@ -51,6 +62,12 @@ properties:
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
 
@@ -72,6 +89,27 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1]
 
+patternProperties:
+  "@[0-9a-f]+$":
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+        description: sensor ID, a.k.a. channel number
+
+      nvmem-cells:
+        items:
+          - description: handle of cell containing calibration data
+
+      nvmem-cell-names:
+        items:
+          - const: trim
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -80,6 +118,29 @@ required:
   - clock-names
   - resets
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: rockchip,rk3568-tsadc
+    then:
+      properties:
+        nvmem-cells: false
+        nvmem-cell-names: false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - rockchip,rk3568-tsadc
+                - rockchip,rk3576-tsadc
+    then:
+      patternProperties:
+        "@[0-9a-f]+$": false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.49.0


