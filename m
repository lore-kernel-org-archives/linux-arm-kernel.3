Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05176C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgBqH7rUaFMbK1ldKLDc0I0GBrcJc+3ZZYqVQ3rPs/A=; b=F19V7FKxNAp7afmK0pewBi0aD1
	/hgKYUztPmLKIlN+NcRMi8o8bREnZtLlF3F4A4LcUGH9U60qwS6kGp08BUBgF/EXSUHHdRsCFV4bc
	Vn2q3IPyvGGGhX6Q7GiZ1R5K5WLtglDj84sN7XRSZT4r7pEaIqYN2ZYJ8Gk15ODGrudb8/BmW9NmX
	9uX2chA9xz2PGsSIbvmc2vE2pt1ljgDFtbGoKdAzN+k26LPEQEDTyMgMxKYkSaiDpQrL2J3iaynxs
	n78bbzPcwiJKWklb6Tkyh+A1u4SSnKdjfiPqKKsT1EqpXsP5dG2pSW9xnJzzesyj+HK8ElRB40zhd
	x+daIJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6pk-0000000CZGF-2jTl;
	Fri, 28 Feb 2025 20:19:44 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6e3-0000000CVF9-2Rvs;
	Fri, 28 Feb 2025 20:07:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1740773248; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B2VvnYR7p99Z/FRBV/uCqpgeU1cr1Hclbd0EsEJtpMds/+3/JgPNLNlS8fH/tIfjXlgjIGNbwllBFAd4rHvB36OEo8vQtQCyCvTWuOhsSAyluXMDyqI3LLCIONtj9HrgUBWZZwnZuA+yMQC5t9ZkFDxJV/HzLG61q9LkD5uq0Hk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740773248; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TgBqH7rUaFMbK1ldKLDc0I0GBrcJc+3ZZYqVQ3rPs/A=; 
	b=G2GVxEywJ9p9jITkbo9dBVRXgsoe0lgat2SHGtkYFHmdn0HspecsHz5Ldcu+07ScWG7076PEE9yN/3+1FNZTzysNXPS8ADm5RgRLn9VlfYnWhvNXLG5bQ/omgGfLxc3RWrxspQhHMgVTjagID7IrveWvyRgDDb+HHuL2lFls9kY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740773248;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=TgBqH7rUaFMbK1ldKLDc0I0GBrcJc+3ZZYqVQ3rPs/A=;
	b=k896J3VqAZ6YLxIhJ6gVqNm2vGpQicQRZUVtz/gmhxiSHJfRIryyqjhasim1ry+6
	De6KfzBC4cQ2BFmzsa7ZpBvJGCG7YWQgrLSPLTYtBYMj+gs0fOURRgEatxIsing3Nbf
	QWgzwQoX92Xo8fNp2r+GgM8dKPgql7nz/dNF39aU=
Received: by mx.zohomail.com with SMTPS id 1740773245418143.92950731334724;
	Fri, 28 Feb 2025 12:07:25 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 28 Feb 2025 21:06:54 +0100
Subject: [PATCH v3 4/6] dt-bindings: thermal: rockchip: document otp
 thermal trim
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-rk3576-tsadc-upstream-v3-4-4bfbb3b699b9@collabora.com>
References: <20250228-rk3576-tsadc-upstream-v3-0-4bfbb3b699b9@collabora.com>
In-Reply-To: <20250228-rk3576-tsadc-upstream-v3-0-4bfbb3b699b9@collabora.com>
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
X-CRM114-CacheID: sfid-20250228_120739_692396_F909A96A 
X-CRM114-Status: UNSURE (   9.27  )
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
2.48.1


