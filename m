Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7F8C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 19:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hpMtOqZiSLiIGO8kc1mIrDBucAWcsR8PwKegbblgEpc=; b=mY7M9IlfxO+XiF/hylmxsmrReJ
	esnZqppLbnfAUkCf6u9gJPoiPzZhnf9LTaqR0A5dDp/pKGcgdsZolSMmfJqKCplIIB2+I8xjGskK7
	SdOnFa6uuRNHBx05QYAzEyb3t8C6CqVY15R4vNhzKva5OzLwxyLJRVt7rVfUNZo2dNtduv2plyudy
	tXzN4JR0tUj2l35PBZ54RMHo6kIfq58tJY7prMRwL3UN1QvkqMsu9fjmrAsY+uiSKdQKJ2h7MAfFg
	ZM1WFGWOBQOqCy73QPFT82CCbUx0nEKyyt9hEfBOrnNcMD2GhoATySNOOInGdAaiae32t0HnWZeM4
	4qG5z4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwNo-00000000XgO-3f9f;
	Mon, 21 Jul 2025 19:41:08 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwLK-00000000XNL-3JnD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 19:38:36 +0000
Received: (wp-smtpd smtp.wp.pl 24661 invoked from network); 21 Jul 2025 21:38:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1753126709; bh=hpMtOqZiSLiIGO8kc1mIrDBucAWcsR8PwKegbblgEpc=;
          h=From:To:Cc:Subject;
          b=ALmF0Q5REAESnZClzcSPXbk7RPTkysq8AN1uN+U+CuuuzhZjZPdZKVqhnjGqkwmco
           DANvb/2IhVZTafk+n8HJPoO1PnNDAzF4MNiYLSGMNU3kmkWAWk3yn8Fm4T1YdwNIkT
           JVdQHkTTnib7D+y0LzZNqPnklsqUCDoCEKPGvPi5OTOj5F/SXcNtReuSQznqWEqVW0
           rciqdOefhpL9/qmk2ZgQ4/BgRz1gOF6QPDsElx+qh+rY5YU6huVOLEkPH8AccWPdty
           79uDgaWOQYAhqWcO6FxGiFqJZZ3zgYomi31SKCjJwDj31uPvfE1qPPQHy/YEiNgZaE
           9GiI3vq4RD1CA==
Received: from 83.24.129.157.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.129.157])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 21 Jul 2025 21:38:29 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] arm64: dts: mediatek: add LED and key support on Xiaomi AX3000T
Date: Mon, 21 Jul 2025 21:38:19 +0200
Message-Id: <20250721193819.2465981-1-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 80b19409167d9e40770cbfef1a4bc0d4
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [4UM0]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_123835_261650_DB0EC629 
X-CRM114-Status: UNSURE (   8.67  )
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

This patch adds support for keys and LEDs on the XIaomi AX3000T.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../dts/mediatek/mt7981b-xiaomi-ax3000t.dts   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
index a314c3e05e50..db399cb3ead7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only OR MIT
 
 /dts-v1/;
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 #include "mt7981b.dtsi"
 
@@ -12,4 +15,37 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x10000000>;
 		device_type = "memory";
 	};
+
+	keys {
+		compatible = "gpio-keys";
+
+		key-mesh {
+			label = "MESH";
+			gpios = <&pio 0 GPIO_ACTIVE_LOW>;
+			linux,code = <BTN_9>;
+			linux,input-type = <EV_SW>;
+		};
+
+		key-reset {
+			label = "RESET";
+			gpios = <&pio 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 9 GPIO_ACTIVE_LOW>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 10 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
-- 
2.39.5


