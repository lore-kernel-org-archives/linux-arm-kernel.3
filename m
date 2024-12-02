Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444FCD78316
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+NbD+wZQ6ShmiTE1VBzMI+WZ0I6gWWrVj/25CLxM5M=; b=w7vLdNHdgptT9ZDjpZiFZJxTb7
	wDig8+EeBzzDtGbs/MH6iPWcVH3Z3RrphOZY2zJZHdyJB813jQe/OySk7ZbrnYPtG31ZNUWF6k3v7
	fUmVW34eLhFCsKUkZIQTrxqaLcTuwffx9sMQ+TcT06UAqI9wxtbqtDqMQXplniJi5gKlWEtL3KuqM
	JfCEiT9e5zVEIn3UA0unHkTK1ygjLAjV/g1hENpKqEUQ/pfv1quR1YPHow8lKnAd255CmtWVshbH4
	HMcDgK6ItknrAV8A9gxAHa8ar/aaIpY5NcFfbvFyY1ODh84QkTUqU32m6FnfpmhLOiJ9reIr6t6cu
	2AnzOypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5kd-000000066xL-25pr;
	Mon, 02 Dec 2024 12:42:07 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VN-000000064Br-03RS;
	Mon, 02 Dec 2024 12:26:22 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 9FE8B6046B;
	Mon,  2 Dec 2024 12:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F+NbD+wZQ6ShmiTE1VBzMI+WZ0I6gWWrVj/25CLxM5M=;
	b=ve43uN6ZvLOqxl2lmQMnJ2uQBQ+GcRMqa7bX86qX3Rj4PskemQh4N+1kxThe4XiUI/niXd
	Pgi9K8zr/j6hiFg/Tr7qFLYke3t8Jl5TsGndIEMtlCYkIJ6KhbZx4s7xJzMZ17543iOYGd
	uWXgm58HtaO5BTDeREfkSZVidlC8rpY=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 23765360552;
	Mon,  2 Dec 2024 12:26:19 +0000 (UTC)
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
Subject: [PATCH v2 16/18] arm64: dts: mediatek: mt7988: add i2c-mux on bpi-r4
Date: Mon,  2 Dec 2024 13:25:57 +0100
Message-ID: <20241202122602.30734-17-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e9fef51d-d790-4f4a-a033-1e5bd1d942c1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042621_195690_19464611 
X-CRM114-Status: GOOD (  10.06  )
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
---
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index 550c373b3d70..9ceefc990000 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -2,6 +2,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
 
 #include "mt7988a.dtsi"
@@ -138,6 +139,45 @@ &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_1_pins>;
 	status = "okay";
+
+	pca9545: i2c-mux@70 {
+		reg = <0x70>;
+		compatible = "nxp,pca9545";
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


