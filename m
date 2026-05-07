Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AD4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrxA7BSMnbY7dwCnVR10HivHrg56dK+24n1HzGNNEKY=; b=Cw/UqFqFUrl9OxJxlIp6ug/lBr
	jW0EF591/WNOWvGMywHMG4PF8gXscoJH729ZXy9adrB0TMFRB5y5hm2XeoT8Po4VQSyUK1sYoXmxZ
	j7FZMcxOiQCx3P3qMxNUgdksdsyKNVZJ4kfUzgHNWaZT5o0GOGEjawqdE/K9K5MGW6CrGTEZthc50
	u0VsPxwu4W4TCRi2s77UineMYRT+S1d2oGVHnu4x8aFSvgTDYegKEGMXRX6sOC2XmUyM9+uvzAeHu
	jGYNyMczlWVhguQ1ot2wdVZ4GxrK9HqEJxo5TwupM6R786JWxHhknm/wMstAHlC+I4LCiPTX7bZGk
	sg9DPOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6Dd-00000004vfV-3gBO;
	Thu, 07 May 2026 21:25:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6Dc-00000004ves-1aK6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 21:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA85560582;
	Thu,  7 May 2026 21:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CD4C2BCB8;
	Thu,  7 May 2026 21:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778189115;
	bh=lExF+Vps5ZWvx5USh6xM+CXm5v6V7QZEs/hLepP2+QM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S+kqvGXzI4A796QYpHubo3JRsp6VrCnQcp5MxufXdPBJSrSfAMECAUQFPOiTQNMip
	 IGDuq/4vP4Kh2JQr3sqdoz5bbNBsVaXlA4F3bVlve3H3gnifqfJLpSyZVkeUiBEZw/
	 /BLMK0JlEuIYSRQEZ1gLxNHMi+6bODwChs0h10rl3BbI2LgzTFep9oxX7QUngldqGg
	 wBo+go2QfpITnVC2QdlNrkh+y/zUbLCpgnghSyNoqUTtBVjvq3bkUGdmZ48xzSxo5H
	 TAi51YeVsnIcFmGhTSurBstRdOcv4A7m5XoIXMrqEqDpBMlguFQ3BsA2BAFm+pdY8+
	 jmCFGP48A9sLw==
From: Arnd Bergmann <arnd@kernel.org>
To: netdev@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Aaro Koskinen" <aaro.koskinen@iki.fi>,
	"Andreas Kemnade" <andreas@kemnade.info>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Felipe Balbi" <balbi@kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Johannes Berg" <johannes@sipsolutions.net>,
	"Kevin Hilman" <khilman@baylibre.com>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Linus Walleij" <linusw@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Rob Herring" <robh+dt@kernel.org>,
	"Roger Quadros" <rogerq@kernel.org>,
	"Tony Lindgren" <tony@atomide.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH 1/3] [v5 net-next] dt-bindings: net: add st,stlc4560/p54spi binding
Date: Thu,  7 May 2026 23:24:49 +0200
Message-Id: <20260507212451.3333185-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260507212451.3333185-1-arnd@kernel.org>
References: <20260507212451.3333185-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

The SPI version of Prism54 was sold under a couple of different
names and supported by the Linux p54spi driver, but there was
never a DT binding for it.

Document the four known names of this device and the properties
that are sufficient for its use on the Nokia N8x0 tablet.

As I don't have this hardware or documentation for it, this is
purely based on existing usage in the driver.

Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gmail.com/
Acked-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v5: fix name in MAINTAINERS file
v4: renamed file to st,stlc4560, matching the primary compatible string
    require st,stlc4560 string
---
 .../bindings/net/wireless/st,stlc4560.yaml    | 61 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
new file mode 100644
index 000000000000..a32265c07350
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/st,stlc4560.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST/Intersil/Conexant stlc45xx/p54spi/cx3110x SPI wireless device
+
+maintainers:
+  - Christian Lamparter <chunkeey@gmail.com>
+
+description:
+  The SPI variant of the Intersil Prism54 wireless device was sold
+  under a variety of names, including Conexant CX3110x and
+  ST Microelectronics STLC5460.
+
+allOf:
+  - $ref: ieee80211.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: st,stlc4560
+      - items:
+          - enum:
+              - cnxt,3110x
+              - isil,p54spi
+              - st,stlc4550
+          - const: st,stlc4560
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  powerdown-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wifi@0 {
+            compatible = "st,stlc4560";
+            reg = <0>;
+            spi-max-frequency = <48000000>;
+            interrupts-extended = <&gpio 23>;
+            powerdown-gpios = <&gpio 1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 21c0ef0b9ce5..7defcc6e2072 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20142,6 +20142,7 @@ M:	Christian Lamparter <chunkeey@googlemail.com>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/p54
+F:	Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
 F:	drivers/net/wireless/intersil/
 
 PACKET SOCKETS
-- 
2.39.5


