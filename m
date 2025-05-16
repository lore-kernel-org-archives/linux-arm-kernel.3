Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48439C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 18:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDKwXO4W7gl7E+DfM+kKfgbEcodSxNbRXwjNIlU84So=; b=RolP47U0WsueCoWF9Pe47PE7oU
	TmZ4PTWluEcg410U4UH3QHHkTemz+Fx8ixI1/VAs7jGEbR++xa1xjOwVou+qTw7RiCIFKa0WVXNjv
	OgZH/ABRtD12rrQs2SMHzYWsls0lxrn9DDO59Qz1WiLHP+tB72NR0SIg6uxW7+nm7I9EDvWhAzPXX
	+t6rDI+SkNqzRKSsrune3LkoQCd7acU11/NnMwSgpUnJK8lkmSvPfMVGD/XMfIfrUVo/f1Oq3HcSl
	1e+frWg3V+ymTRPMZfoAmrB/ZBkYzrTsU8bMMt5Gv7xeKujep5+ELI8qeud+btlAJOH0KKaY7roht
	c/QjbxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzro-00000004Kd7-2ShA;
	Fri, 16 May 2025 18:33:08 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzNl-00000004FNi-43bg;
	Fri, 16 May 2025 18:02:07 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 43CF11007D9;
	Fri, 16 May 2025 18:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747418520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDKwXO4W7gl7E+DfM+kKfgbEcodSxNbRXwjNIlU84So=;
	b=AEBfa2DyrBYvNlT632AR13bSsOAc33Wx8Cos7GJIi9ttjOZe/InxjRTNRBeGNriqggZpMH
	YqwXfgPdJRoiNYzUUTGyS6HctDezfsouaXCHJH9aO7zD9AEMj7s9UQ1Mh0s+PlHcc+9qfW
	GqhtOTCOloPflj9RMEknhYZ9jtjcUcg=
Received: from frank-u24.. (fttx-pool-157.180.226.139.bambit.de [157.180.226.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id E91C71226F2;
	Fri, 16 May 2025 18:01:59 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 14/14] arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds
Date: Fri, 16 May 2025 20:01:45 +0200
Message-ID: <20250516180147.10416-16-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516180147.10416-1-linux@fw-web.de>
References: <20250516180147.10416-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110206_148947_0FCE0F00 
X-CRM114-Status: GOOD (  10.57  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Assign pinctrl to switch phys and leds.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- add labels and led-function and include after dropping from soc dtsi
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index d40c8dbcd18e..9e4ae4c4ea17 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
+#include <dt-bindings/leds/common.h>
 
 #include "mt7988a.dtsi"
 
@@ -126,6 +127,66 @@ &gmac2 {
 	phy-mode = "usxgmii";
 };
 
+&gsw_phy0 {
+	pinctrl-names = "gbe-led";
+	pinctrl-0 = <&gbe0_led0_pins>;
+};
+
+&gsw_phy0_led0 {
+	status = "okay";
+	function = LED_FUNCTION_WAN;
+	color = <LED_COLOR_ID_GREEN>;
+};
+
+&gsw_port0 {
+	label = "wan";
+};
+
+&gsw_phy1 {
+	pinctrl-names = "gbe-led";
+	pinctrl-0 = <&gbe1_led0_pins>;
+};
+
+&gsw_phy1_led0 {
+	status = "okay";
+	function = LED_FUNCTION_LAN;
+	color = <LED_COLOR_ID_GREEN>;
+};
+
+&gsw_port1 {
+	label = "lan1";
+};
+
+&gsw_phy2 {
+	pinctrl-names = "gbe-led";
+	pinctrl-0 = <&gbe2_led0_pins>;
+};
+
+&gsw_phy2_led0 {
+	status = "okay";
+	function = LED_FUNCTION_LAN;
+	color = <LED_COLOR_ID_GREEN>;
+};
+
+&gsw_port2 {
+	label = "lan2";
+};
+
+&gsw_phy3 {
+	pinctrl-names = "gbe-led";
+	function = LED_FUNCTION_LAN;
+	pinctrl-0 = <&gbe3_led0_pins>;
+};
+
+&gsw_phy3_led0 {
+	status = "okay";
+	color = <LED_COLOR_ID_GREEN>;
+};
+
+&gsw_port3 {
+	label = "lan3";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
-- 
2.43.0


