Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB595E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uixtMCsS/wv+j4qweODMlsl1da3nZrt3WSC8+Wqjz3k=; b=RAvaczrGXdZx/9LdFiR6/xPmSN
	QmiyaPNinLsg8v9VMBN5b5Q2GKzMhtk4qnZBED6YnTL2QEPJdhSCaRqAOD69bnvqiOFT55EsmzbY7
	rlQie/w3sSGH+tvoVHEubUr19Qdj7q/qkQAab2tZqCuT3ZDEid8rmoK7qnzV00dtbbmLHfznaYSfI
	JSV48SnAq3dviFbobAjZ5HqCB8IUTvsZzId23mFPWEG/cDi/XicqVvdxU70MOaHum388qbCZksWxD
	9m+M7/COwA4n19dtuQu3foJE36aQDAADTX7RvJ/aoUMTUfEFlolxBO30QsByrvRo5f0GqINF31q3g
	ZpnSn0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNU5V-0000000Cxqd-1wpB;
	Tue, 17 Dec 2024 09:41:57 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTda-0000000Cr7r-071M;
	Tue, 17 Dec 2024 09:13:07 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id B4531100875;
	Tue, 17 Dec 2024 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uixtMCsS/wv+j4qweODMlsl1da3nZrt3WSC8+Wqjz3k=;
	b=Rzf9aAxbk7a04+a9D5R+CFzQaYARXYdLWGoxsYNOCKHvy79X5VXTjNcZT+nG2WddOneyDp
	9qIyIIQjHiZGqjGZv4p1iExys44JIe8+aE4z+S1MFFM1ZCtiAjhT9PVaXdmhPcJIqu9K3w
	Uj5t4+OzEL9gGjDxYGctG+CQA3NAzm0=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 0667610030F;
	Tue, 17 Dec 2024 09:13:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 18/22] arm64: dts: mediatek: mt7988a-bpi-r4: Add PCA9545 I2C Mux
Date: Tue, 17 Dec 2024 10:12:32 +0100
Message-ID: <20241217091238.16032-19-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 3a0deb92-ae26-450f-ba17-960f73ac9588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011306_210889_5F743822 
X-CRM114-Status: UNSURE (   8.69  )
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

Bananapi R4 uses an i2c multiplexer for SFP slots, rtc and eeprom.
Add its node to the right i2c controller.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
changes:
v3:
- move reg after compatible
- change commit title
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index 3d165f7b29dc..0dc1fd9265c6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -2,6 +2,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 #include "mt7988a.dtsi"
 
 / {
@@ -70,6 +72,45 @@ &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_1_pins>;
 	status = "okay";
+
+	pca9545: i2c-mux@70 {
+		compatible = "nxp,pca9545";
+		reg = <0x70>;
+		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			pcf8563: rtc@51 {
+				compatible = "nxp,pcf8563";
+				reg = <0x51>;
+				#clock-cells = <0>;
+			};
+
+			eeprom@57 {
+				compatible = "atmel,24c02";
+				reg = <0x57>;
+				size = <256>;
+			};
+
+		};
+
+		i2c_sfp1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_sfp2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+	};
 };
 
 &pio {
-- 
2.43.0


