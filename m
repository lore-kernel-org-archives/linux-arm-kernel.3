Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6B8E68956
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oaa1DPXZ74C2kbo38pTb9/mIOv59ifQcGQv3KI+ngJs=; b=e8D4BODmc1k5z1hR6WniuJI6iz
	uFPDBz/y5yTTFzT3LwQqqkq9a6xHlKpmg4BhkgC6NjvaX3+P2Hb8QFzk2KtXFn1I6fMTLBjK5EDiY
	IREsrloLISvJkfQ+RrWdj3mnKaAhJnLRi+yH/G5Y6VSxfSWmUH3mUUY8bnO17Px8dNKYR98muBctJ
	XoCMaBbQF1ohCQmv6nlkkZpGO/MVHC5G4sm22QhzpDJLyKrY14YX+PN6uWi37BsLmFEb/nbaW7pe8
	nZ/Frdy3oCAFlQfxcPGmUek65vgDZRHI79ImZlHNyn46csFska5tb5paKpc6N3Hny/paMb3NphgrK
	wS1gAeLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PNG-00000002mCJ-33na;
	Thu, 31 Oct 2024 07:13:42 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PDN-00000002kUd-0Rh6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358204;
	bh=QWIMkRwFSfYR0dNnMv3AW5ldohDRRnDT3LYte1P8RX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXFadOLvX/GyAtSLeo3PViVQiCHN8pHiW359bVjDXZzTgblk1t+pxwGpmJ4q3gqb6
	 cpyoKU+1d4nsp21NslKYTVrOXz/v1lM0NMt1sfV/qp/OP1UDfQYrZVL+r+LBfIJlqG
	 y6yZR/SnP8iw6QcuWbmubI9sxZSwPgW3Vh94XGOifz7G3ZJfCKDEN9M9qJN1xJPeRe
	 DV/1WBlQ585KqQznivxbsAI12bc0Vrafw8//3fv1ysvHsEYxOT/dT2ZxFUXFEm0FWi
	 dafOJL60o4i4FuV25DhD8bu64vjs8J0XukE00Sf/xwr2J/T4jZiUvr6SzwlYCe68yU
	 8ykoXM91RFSVg==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] arm64: allwinner: A100: enable EHCI, OHCI and USB PHY nodes in Perf1
Date: Thu, 31 Oct 2024 04:02:20 -0300
Message-ID: <20241031070232.1793078-8-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_000329_233777_1707273E 
X-CRM114-Status: UNSURE (   9.40  )
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

From: Yangtao Li <frank@allwinnertech.com>

Add USB support on A100 perf1 board, which include two USB2.0 port.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
Changes in V2:
 - Add dr_mode here, instead of in the .dtsi

 .../allwinner/sun50i-a100-allwinner-perf1.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
index f5c5c1464482..2f8c7ee60283 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
@@ -7,6 +7,8 @@
 
 #include "sun50i-a100.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 /{
 	model = "Allwinner A100 Perf1";
 	compatible = "allwinner,a100-perf1", "allwinner,sun50i-a100";
@@ -18,6 +20,36 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_usb1_vbus: usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
+		enable-active-high;
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
 };
 
 &pio {
@@ -178,3 +210,10 @@ &uart0 {
 	pinctrl-0 = <&uart0_pb_pins>;
 	status = "okay";
 };
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+	usb0_vbus-supply = <&reg_drivevbus>;
+	usb1_vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
-- 
2.47.0


