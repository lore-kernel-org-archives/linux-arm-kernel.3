Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD5BC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73JIQ3h7BNI8yX+F7iHYZ3k7OZlBvEQT7aHQLxKzRog=; b=TNunSz3Grjy9wtQZs1O3VPun0h
	uVW/wUSebGjqhJ0vOCX0tFXK1ExcVppXsnFArLPSLW9z0h3lOACaFVWuS5FDMbw5psYkvca2e0x/S
	9dhqbXUePFp/5gLDyTaO6XlYFHT+E9vT8lLhy9b2OZhx5p7jRxnWGPdMqCEDrlo2E9ShemL2I8rhi
	NS5TFUaYPxRQcHuwKfSSUlviowCfNx+xDFHzbN9zwVpAJaFBl+PBn7xnUCouKKDA7JeYpva+245kl
	pYsXu4RF6ejvQq+Q/Bdnm9h3DOZKVcAc6q658jgLa1X5QiLEOyQNKLZbDEE+sEUUa9O7dEU88Jw5v
	cDuaG3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4NJ-0000000DF3I-0WvY;
	Fri, 25 Sep 2026 11:45:57 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Mq-0000000DEmQ-1tyD;
	Fri, 25 Sep 2026 11:45:31 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 35A4D2008EB;
	Fri, 25 Sep 2026 13:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73JIQ3h7BNI8yX+F7iHYZ3k7OZlBvEQT7aHQLxKzRog=;
	b=UXm65EgZuoBZ9nYqmQOo/13SUjluJOyFzzkZ4LCalnPVZj6a7EPwLOsj4xqhPKWINepqR8
	1cO+potNnIijqousasKzsYvRmXQMws0OfZA4h0HWZGo8PGiW38oUuBsdBWh67VhgiRtoOn
	yjz0aIrsB8+AoMZlZhBwrmkxPpb1aRvu9vxk60pbK537mjaL7rpw8Asrk2GNIY4cMXTK5m
	pWwxDarosFyoIP1awsuD25NaDhq/dAOCqxXwASX+wgrmTtvuJJG8FCuL4whForP4Tothis
	5xMdaRATlx4d662ReGdRcSPSHs/xMJGZKcHtHMUhkrLWwfRr43gDlkbS6isVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73JIQ3h7BNI8yX+F7iHYZ3k7OZlBvEQT7aHQLxKzRog=;
	b=RhCx9EHV3PA+te07C9y2xHwnwXK1LAfgq9nv/Gi+B2CfmPScpoTHIRnGA2Gtnn89Gx39dL
	ZHP7naydmZa1ASQ8W14KJ9V9zdj7V6iSzAG0e8EA4VF+QynVGB/zqZDewo974Ox0QAbmb2
	ioQZIzhImcW0Qlm+kJLyfhLCnaY+qh7McocieuOE7HhAhAZDau+1bQlT+NGx85hNOmrP6S
	hc0Km09EU0onl4CM5T1X7lMz+KExA+AnW+eYH68MrQvxkBHUaP43PT+yeJOBR0Aw7LQNqi
	7OiAO3Y3/DNBkUiNc8t47pm1eKqAQC5biB8WWKlPC067OimTY81g66/BNW6GsA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790336726; a=rsa-sha256;
	cv=none;
	b=EQpJEWDgMPrcHbcXCxSPHB1aUhdSM96Rus7HgnXvduMulaIM9PMpdnMOSdLuDv6txp87cU
	nIxjPufErhUMH9McQlyIjvuNDOaxjWG17kOw8HlTpv4oASqJXsBWTzd36bB0sNhes0Lad3
	+qQFNelK5diYXqzONOUdQLezpcHKWWkc8N/ypMBe/tqHG0LmBcLs5CVk45CuaMgUkpwwgM
	xO8GvguoraG0Zw9Rfm/1J3cIp3mYUzNTdrTTIIOiBoySWOwSbspt5GpBGrh3/JZ+HOFEuu
	KZtiiI0AaDnSJdAp+ZDaM/pv0el7p5ZgmZnve5Fv9kZRbxDMeWk4HZuzxgQTyg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 25 Sep 2026 13:45:25 +0200
Subject: [PATCH v5 1/4] media: dt-bindings: Add Rockchip JPEG decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-rockchip-jpegdec-v5-1-30658833cb68@pengutronix.de>
References: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
In-Reply-To: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790336726; l=5061;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=gelfVXPRUI9lntnkL+U4FhD1/gZ6OlA0mb0S8llJ7A0=;
 b=yHzTUbq8ZRk/uC0KQqBuQP+vWFz7t0MFMCat+P8x9bVLRPapxt+Uk3vM2K77r9Q8JFDOntkW1
 QWTJDwVXnhgDBn9N/8Xeprmnq7dFR32mBKHShYlRERNgmBW55cLsvD2
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_044528_813621_492D5BB5 
X-CRM114-Status: GOOD (  18.77  )
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

Add a devicetree binding schema for the JPEG hardware decoder Rockchip
integrates into a number of its SoCs.  Documents the single register
window (task registers plus the LLP link-table block at offset 0x300),
the decode interrupt, the AXI and AHB clocks and resets, the IOMMU and
the power domain.

The core is not tied to one SoC.  Downstream it is known as the VDPU720
and the same block sits on the RK3528, RK3562, RK356x, RK3576, RK3588 and
RV1126B, with only the clocks, the resets and the power domain differing,
none of which this schema constrains.  A compatible per SoC is all it
takes to cover them; the RK3568 and the RK3588 are the two that have been
tested and are enabled here.

The resets and the power domain are required.  The block cannot be
reached with its domain off, and the driver falls back to pulsing the
reset lines when a frame times out and the in-block soft reset does not
complete, which a node without them would leave with no way to recover.

The IOMMU stays optional.  The driver never refers to it, it is a platform
integration detail, and rockchip-vpu.yaml does not require it for the
other codec blocks on these SoCs either.

Assisted-by: Claude:claude-opus-5
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../bindings/media/rockchip,rk3568-jpegd.yaml      | 92 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++
 2 files changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
new file mode 100644
index 0000000000000..27d85f17922ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-jpegd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip JPEG Decoder
+
+maintainers:
+  - Lucas Sinn <lucas.sinn@wolfvision.net>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+
+description:
+  Rockchip's in-house JPEG/MJPEG hardware decoder, known downstream as the
+  VDPU720.  The same core is integrated into a number of Rockchip SoCs, which
+  differ only in the clocks, resets and power domain they are wired to.  A
+  dedicated Link List Processor (LLP) register block, located at offset 0x300
+  within the same register window, allows the hardware to decode a chain of
+  frames autonomously ("link mode").
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3568-jpegd
+      - rockchip,rk3588-jpegd
+
+  reg:
+    maxItems: 1
+    description:
+      The decoder register window.  It covers both the task (function)
+      registers at offset 0x000 and the LLP (link table) registers at
+      offset 0x300.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AXI clock
+      - description: AHB clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ahb
+
+  resets:
+    items:
+      - description: AXI reset line
+      - description: AHB reset line
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    video-codec@fdb90000 {
+        compatible = "rockchip,rk3588-jpegd";
+        reg = <0xfdb90000 0x400>;
+        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+        clock-names = "axi", "ahb";
+        resets = <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER>;
+        reset-names = "axi", "ahb";
+        iommus = <&jpegd_mmu>;
+        power-domains = <&power RK3588_PD_VDPU>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b3..290c3a1452ea0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23699,6 +23699,14 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
 F:	drivers/media/platform/rockchip/rkisp1
 F:	include/uapi/linux/rkisp1-config.h
 
+ROCKCHIP JPEG DECODER DRIVER
+M:	Lucas Sinn <lucas.sinn@wolfvision.net>
+M:	Sascha Hauer <s.hauer@pengutronix.de>
+L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
+
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Aurelien Jarno <aurelien@aurel32.net>

-- 
2.47.3


