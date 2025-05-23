Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EC2C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 20:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvqFgLxgbUVf/z6PPtigxcVu6uz3AVutEDmUh55AeNk=; b=z+xkK0kdnTTYMXQk28ZHhOVV2M
	8T3dlU2A33QvV3Y0Wn+Z0KIuXYPp5G/IXhpXpoByoO02OA1fCV8tzBc+OfTeOHApBSrqVPRf11FNC
	TPKTOtPtwfwr8EMbrHRTVQmgYbP+5JuWR9yNgSq9IPGaRRyIdV6RVBlMg2BZOhO43p8zImmI1x9nD
	xU+i4VFI81YirPIA/lDU+Vq/9SoBleWIoytuEuVNXoVC9ZyJ9trEI+ohBfq0VGNujUOitUcG6qVQ/
	DmAJkVpjpOrxJNpUXXjDAqISW0doguE2c/nPgUrTJx3y18/Rs7XsRDhyxf4F+tFW+zPVk1NJocG1r
	ytFIENSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIZ0N-00000004sE6-0dfF;
	Fri, 23 May 2025 20:28:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYwI-00000004rs4-21mo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 20:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748031862; x=1779567862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T16CVZSw9nb0NLF0XOWGUQhmHT+IUu+xaiZrOhiAFUM=;
  b=GbaXSnrip+9X88J4YJ5qrObnteo76X9zikN+dySZYI4W7ayuiMWOJyWf
   +uivXrz5OmkNK/2cFcd9iwVMcJaAH5IDYiOzu+HWyG12SN460sy0mhbJ5
   T29obD0XwJtbQeRhMKuJw/+un1lWMRSCwbiPy1tSbrA+KoDYqcV9+8biL
   XylwR828v23+HjqC9GZZUYK+saNxVCkQpSXALLsKehbDz7AWSLTxKMjw3
   1FmpM7YbIT9razRCd1KifPm53rXHB2cACFGJJk2p1EllCoT2EJY+hk9WC
   ZdxVtDjz1NQoCNVPfwwpkc6AcgWMUPYXk/2a3ZysvTEOXAlkc6O8urh8m
   A==;
X-CSE-ConnectionGUID: KBUIaMEtQL+E9GaMz9Liiw==
X-CSE-MsgGUID: zeZPN2CZSeiEhqUn3L0sQQ==
X-IronPort-AV: E=Sophos;i="6.15,309,1739862000"; 
   d="scan'208";a="46850858"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 May 2025 13:24:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 23 May 2025 13:23:58 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Fri, 23 May 2025 13:23:58 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 1/2] ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
Date: Fri, 23 May 2025 13:24:30 -0700
Message-ID: <569e194346975ac3bb5786c02dc6681625771c00.1748030737.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748030737.git.Ryan.Wanner@microchip.com>
References: <cover.1748030737.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_132422_526915_B17644DF 
X-CRM114-Status: GOOD (  10.09  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Adjust clock xtal phandles to match the new xtal phandle formatting.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  6 ++++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 2543599013b1..79bf58f8c02e 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -35,16 +35,6 @@ aliases {
 		i2c2 = &i2c9;
 	};
 
-	clocks {
-		slow_xtal {
-			clock-frequency = <32768>;
-		};
-
-		main_xtal {
-			clock-frequency = <24000000>;
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -512,6 +502,10 @@ spi11: spi@400 {
 	};
 };
 
+&main_xtal {
+	clock-frequency = <24000000>;
+};
+
 &gmac0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -917,3 +911,7 @@ &vddout25 {
 	vin-supply = <&vdd_3v3>;
 	status = "okay";
 };
+
+&slow_xtal {
+	clock-frequency = <32768>;
+};
diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..411db7e375a6 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -117,13 +117,15 @@ map1 {
 	};
 
 	clocks {
-		slow_xtal: slow_xtal {
+		slow_xtal: clock-slowxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "slow_xtal";
 			#clock-cells = <0>;
 		};
 
-		main_xtal: main_xtal {
+		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "main_xtal";
 			#clock-cells = <0>;
 		};
 
-- 
2.43.0


