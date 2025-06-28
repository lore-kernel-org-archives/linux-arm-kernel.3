Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CA7C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mw75z6h4HeFha6AF7YI1R1VXg23z1dS7Y1C1o8vw7rQ=; b=hs1PFJSXBRait7zmmA1BNqpInT
	b7i4y62nStCezFsQiMuY+a/KMGlXw04846rHoxNr3t+YliwZRJF4dZtkUynoiUXBc3LVme2iMhNHo
	iNDl/zq9bRH29NZ05brgoUlAjv2XxZOmM+aPNMJsR1G8xs7PltIvCtUahA3rivK9IX4u0ekL4GsI+
	jX4uqMWwCWEbGMLcRvzQjbxly+pR86D5IqIrt/4usHffab8CuHdrLPqUb86QPdO/WOcXt+wOOKi8F
	nYtR79ZsFzgbqMcu5O6iiwy/uZIaHfF9MfYZ7WrShLrofljALeKL52ALOlIzDiu8VR6nenFFLUrGP
	DuwVi+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZH0-0000000H6ZI-1F39;
	Sat, 28 Jun 2025 17:23:30 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYpZ-0000000H3TL-2iDR;
	Sat, 28 Jun 2025 16:55:10 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 213EE5FDC5;
	Sat, 28 Jun 2025 16:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1751129708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mw75z6h4HeFha6AF7YI1R1VXg23z1dS7Y1C1o8vw7rQ=;
	b=b1hVnNrn2C4eTIx5eDheGeJO/JQGljudJdX8L8KqG8Ta2rBPxNkwi54qJeHws5LDIAsQqu
	x5BPgoyM9e8mEt46XQty8Iw2GkArX/rrSBI7cU+rAQ2kn/KGwPNRuRwahCWAF430zpsf1K
	bXq0Zfom8unAibQy79QvCVK+MoECBVg=
Received: from frank-u24.. (fttx-pool-217.61.150.139.bambit.de [217.61.150.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id BC3E71226EC;
	Sat, 28 Jun 2025 16:55:07 +0000 (UTC)
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
Subject: [PATCH v7 14/14] arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds
Date: Sat, 28 Jun 2025 18:54:49 +0200
Message-ID: <20250628165451.85884-15-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250628165451.85884-1-linux@fw-web.de>
References: <20250628165451.85884-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_095509_820374_0A0E8424 
X-CRM114-Status: GOOD (  10.18  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v4:
- reorder switch phy(-led) properties
v2:
- add labels and led-function and include after dropping from soc dtsi
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 4d709ee527df..7c9df606f60d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
+#include <dt-bindings/leds/common.h>
 
 #include "mt7988a.dtsi"
 
@@ -152,6 +153,66 @@ &gmac2 {
 	sfp = <&sfp1>;
 };
 
+&gsw_phy0 {
+	pinctrl-0 = <&gbe0_led0_pins>;
+	pinctrl-names = "gbe-led";
+};
+
+&gsw_phy0_led0 {
+	function = LED_FUNCTION_WAN;
+	color = <LED_COLOR_ID_GREEN>;
+	status = "okay";
+};
+
+&gsw_port0 {
+	label = "wan";
+};
+
+&gsw_phy1 {
+	pinctrl-0 = <&gbe1_led0_pins>;
+	pinctrl-names = "gbe-led";
+};
+
+&gsw_phy1_led0 {
+	function = LED_FUNCTION_LAN;
+	color = <LED_COLOR_ID_GREEN>;
+	status = "okay";
+};
+
+&gsw_port1 {
+	label = "lan1";
+};
+
+&gsw_phy2 {
+	pinctrl-0 = <&gbe2_led0_pins>;
+	pinctrl-names = "gbe-led";
+};
+
+&gsw_phy2_led0 {
+	function = LED_FUNCTION_LAN;
+	color = <LED_COLOR_ID_GREEN>;
+	status = "okay";
+};
+
+&gsw_port2 {
+	label = "lan2";
+};
+
+&gsw_phy3 {
+	pinctrl-0 = <&gbe3_led0_pins>;
+	pinctrl-names = "gbe-led";
+};
+
+&gsw_phy3_led0 {
+	function = LED_FUNCTION_LAN;
+	color = <LED_COLOR_ID_GREEN>;
+	status = "okay";
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


