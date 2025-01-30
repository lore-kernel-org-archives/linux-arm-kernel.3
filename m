Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355C7C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 16:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaY0n35Nb7SCkmus3ECKUdBCfM4ZyE4EZNsg5zowUTg=; b=jzaVjw9Z8K9ZY5TZMCAe/GiTKn
	qevL9b2q4Dndx75Dfw4jCvI+08m7l6DuWTviM+1xEMKNLUVMbqG/9muFsT0PlNRofVaOo0OVGJlbR
	KwqFGxHy1Qqly4aFM1XUH2VoZlTY/yo1YpRVxcAQ4qPVEpOW56FPFpgs6u1xPtoLsfZ2ztkjK7d8O
	vm45bU2Le+8NPAgT7iU6ruMV/VTFN85B8ek0QCp0s+wqPn5Jsom/FAi4KRTuozuLs1k+dd86VQkpX
	xfR6ipJSAZ/eIUz28SUpHu3cX8VX6Z9PuHdRIZQ3TG5Vmd7Jr5YceUn61SZzsieA+RuXW9p8e3IGE
	MfA76Tig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXWP-00000009Agh-2T7c;
	Thu, 30 Jan 2025 16:36:05 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXSY-000000099we-0l4W;
	Thu, 30 Jan 2025 16:32:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738254712; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PsLx8JB7ro5AiQA8iikug49vSEv64GeDMH6lR44pIXMIYzzdtHUpMfOWtxi4E0bb31nUJ+szLSi96eYce08+OvcdRGkHMZaiksgyiCe1DmhnaqGE4hNaox6D5PEJI3H4Ee4mwu/svXvcVzIJxKMOwpEkBMSnNtuBehs3KqTMy4M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738254712; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UaY0n35Nb7SCkmus3ECKUdBCfM4ZyE4EZNsg5zowUTg=; 
	b=TUdV8PWu9TKB16r9OATlI82aKnfzsyKluvXbAhEUwzlBXbEIJ61BJNvbyu1McHVT5fGFGFUR0PEEy8oV0JI8xcL9QhBmOPWD5cM5KsX3k/RWN0Y2g+CYEwTPpTBO6JtIoHY8WzdO99lQUrennatAC7+IdS4bNLe9bJU6MiCNuwI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738254712;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UaY0n35Nb7SCkmus3ECKUdBCfM4ZyE4EZNsg5zowUTg=;
	b=i8uv7jiA7HB5Va3CcuDs5oxhp17irJe++zPosZfkglmj77Yv+bZlzJrPpNljDP6R
	xBiyqWOcgS6vPUzuPr6n399QFWk4k5MlUU8vOWv9Y0TGqg1f4T5V/zrCqO+8mO2T5X+
	yHa2WzcQMZTaverjEwI4mHcvCVq/Xc+iXlr22GgE=
Received: by mx.zohomail.com with SMTPS id 173825470884090.2146661595857;
	Thu, 30 Jan 2025 08:31:48 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 30 Jan 2025 17:31:16 +0100
Subject: [PATCH 2/7] dt-bindings: rng: add binding for Rockchip RK3588 RNG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-rk3588-trng-submission-v1-2-97ff76568e49@collabora.com>
References: <20250130-rk3588-trng-submission-v1-0-97ff76568e49@collabora.com>
In-Reply-To: <20250130-rk3588-trng-submission-v1-0-97ff76568e49@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Daniel Golle <daniel@makrotopia.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_083206_285357_5CC74685 
X-CRM114-Status: GOOD (  16.41  )
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

The Rockchip RK3588 SoC has two hardware RNGs accessible to the
non-secure world: an RNG in the Crypto IP, and a standalone RNG that is
new to this SoC.

Add a binding for this new standalone RNG.

The RNG is capable of firing an interrupt when entropy is ready, but
all known driver implementations choose to poll instead for performance
reasons. Hence, make the interrupt optional, as it may disappear in
future hardware revisions entirely and certainly isn't needed for the
hardware to function.

The reset is optional as well, as the RNG functions without an explicit
reset. Rockchip's downstream driver does not use the reset at all,
indicating that their engineers have deemed it unnecessary.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/rng/rockchip,rk3588-rng.yaml          | 61 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 2 files changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..dff843fa4bf9d5704bbcd106398328588d80b02d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rng/rockchip,rk3588-rng.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3588 TRNG
+
+description: True Random Number Generator on Rockchip RK3588 SoC
+
+maintainers:
+  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3588-rng
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: TRNG AHB clock
+
+  # Optional, not used by some driver implementations
+  interrupts:
+    maxItems: 1
+
+  # Optional, hardware works without explicit reset
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      rng@fe378000 {
+        compatible = "rockchip,rk3588-rng";
+        reg = <0x0 0xfe378000 0x0 0x200>;
+        interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&scmi_clk SCMI_HCLK_SECURE_NS>;
+        resets = <&scmi_reset SCMI_SRST_H_TRNG_NS>;
+        status = "disabled";
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index bc8ce7af3303f747e0ef028e5a7b29b0bbba99f4..7daf9bfeb0cb4e9e594b809012c7aa243b0558ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20420,8 +20420,10 @@ F:	include/uapi/linux/rkisp1-config.h
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Aurelien Jarno <aurelien@aurel32.net>
+M:	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/rng/rockchip,rk3568-rng.yaml
+F:	Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
 F:	drivers/char/hw_random/rockchip-rng.c
 
 ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER

-- 
2.48.1


