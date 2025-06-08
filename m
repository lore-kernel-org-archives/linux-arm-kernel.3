Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B34C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 21:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDifwxY7gQOfgk+tbRvfbMg2JVV/EadqzCD4+/695V0=; b=bO05s0zrqoOFcPB/HOmoH6mloq
	WriC6SJbsZmBxCq3cysW6csHMUbR6HqDMH+jDICChtoN+W0yzWf9WvFKVL+pip9zw2IbUCvcUJu/f
	RJFIIJu8mQ2ODVMvUQGnMoCP7BCTrC+TN3hBHZwG6ouoQlSKsWcmggFUpA/92cDecBz1oCsnWqOOS
	91BQzbu6UFbOCHvlofEqNmOhSUYnuxg484zAsjboR3zdKV8xOeG2Wwfw0Du2m+taxUDoCF5HUgQT/
	V60fCwDhjT4GTElxQos0jUuc0EcmdCiV0isccLHNp4RYSOX1qRcpMIkhCUwLtFLvXyVKnNuA1FcGG
	75BkKDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONf1-000000030X3-0m7B;
	Sun, 08 Jun 2025 21:34:35 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONMB-00000002ySh-3JW5;
	Sun, 08 Jun 2025 21:15:09 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 4871C3FE8B;
	Sun,  8 Jun 2025 21:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1749417304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDifwxY7gQOfgk+tbRvfbMg2JVV/EadqzCD4+/695V0=;
	b=SV8MICNG8wUHu62OpXIGmq4wfS9Jt4huC9Fk77hLCeJ52SIK35Z2So274RLS//UsWTeTLh
	osYkKhaQZXdcj0ixy9lUe/G8AaE5F2joGJU6PJeRMWCoiDUo5PDHTcr3TticQn/Wlx1Htu
	a/9xieXRv5R2iRv/AVKkTKWAEiOMbSQ=
Received: from frank-u24.. (fttx-pool-80.245.77.166.bambit.de [80.245.77.166])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id E14CF1226F5;
	Sun,  8 Jun 2025 21:15:03 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 13/13] arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds
Date: Sun,  8 Jun 2025 23:14:46 +0200
Message-ID: <20250608211452.72920-14-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250608211452.72920-1-linux@fw-web.de>
References: <20250608211452.72920-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_141507_982409_7CC58280 
X-CRM114-Status: UNSURE (   9.96  )
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
index d8b9cd794ee3..f10d3617dcac 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
+#include <dt-bindings/leds/common.h>
 
 #include "mt7988a.dtsi"
 
@@ -151,6 +152,66 @@ &gmac2 {
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


