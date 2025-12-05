Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF025D2F7CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+V2u7nRmCpg9spwzBQm4im+Tl+FWo1t6BknZ3of2c2c=; b=EzRCLosskYdV4Tq9Rg0xIoQk7w
	t2sFQozPN6rR1w6X1i5f1DnqkfQKLAo+rp2EJBILILhC1EXGbtUCwnGd2+HUDiZtHdbGoHfeWJBc4
	EFA05Z5jBfhnNH8A4hU9wepRhToww+id2DEpc0H8onWsLy51NdsPxDWM1S+pwjOVyH86mjY8rkIlx
	B3eNOvM3rPp5rOJYYA0BFAFS35wUmbIvPKVWk4kpV3uoV21kCl0Jty/V0ld6jQtG4kHStBYpX2fru
	PnqImfVXnvhAabA3YvJz9e6tbEfz1TTCykieTDSvJ/NbgitAfBIYtItNVOVHiF6+Agcf8YYqWzoMc
	ex4wvJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSeT-00000009M1V-1nbP;
	Fri, 05 Dec 2025 10:03:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSeP-00000009Lyw-2kPi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 10:03:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EC5231A1F80;
	Fri,  5 Dec 2025 10:02:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BABA960731;
	Fri,  5 Dec 2025 10:02:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5407D10B60759;
	Fri,  5 Dec 2025 11:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764928971; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=+V2u7nRmCpg9spwzBQm4im+Tl+FWo1t6BknZ3of2c2c=;
	b=MvphRKhBbogxsicQHo0F+2kjeNZiuu+0DYx2OzMy1RcjINF7QPUr9AhWjtcVdui4tDOKS4
	MTm1XVMikaXUlvW5O/kQ5qjCBr0CG3oabDy6wJP+M3WfxWRi+JHEgFMCn6G5+dVhG1cbGn
	5ROFZuEr9P1bCIqfftDggpirDIoClHAGuK0HunsvjCQc8kcOoWFvzGmkNorhTVIBZ73ATv
	AkFBr+jFBlk2NsJYvgJbtNHxwkpUMfplvgE59eFgZhI4x5LZF62vlcK68aGX3r/5GAPFS9
	lPQ5hH8scLLP/wxpkCs1SOobnmZkCoTXaenOZkS9vHyYeQlM6aI7f4akQOm22g==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 1/4] dt-bindings: pwm: sunxi: add PWM controller for Allwinner H616
Date: Fri,  5 Dec 2025 11:02:36 +0100
Message-ID: <20251205100239.1563353-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205100239.1563353-1-richard.genoud@bootlin.com>
References: <20251205100239.1563353-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_020257_827480_6A6476C8 
X-CRM114-Status: GOOD (  12.45  )
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

Allwinner H616 SoC contains a PWM controller quite different from the A10.
It has 6 channels than can generate PWM waveforms or clocks if bypass is
enabled.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 .../pwm/allwinner,sun50i-h616-pwm.yaml        | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
new file mode 100644
index 000000000000..b89735ad3a43
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun50i-h616-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 PWM
+
+maintainers:
+  - Richard Genoud <richard.genoud@bootlin.com>
+
+description: |
+  Allwinner H616 PWM can generate standard PWM signals with variable pulse width
+  and period.
+  Also, instead of a PWM signal, a channel can be used to provide a clock.
+
+properties:
+  compatible:
+    const: allwinner,sun50i-h616-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+allOf:
+  - $ref: pwm.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun50i-h616-ccu.h>
+    #include <dt-bindings/reset/sun50i-h616-ccu.h>
+
+    pwm@300a000 {
+      compatible = "allwinner,sun50i-h616-pwm";
+      reg = <0x0300a000 0x400>;
+      clocks = <&ccu CLK_BUS_PWM>;
+      clock-names = "bus";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <3>;
+      #clock-cells = <1>;
+    };
+...
-- 
2.47.3


