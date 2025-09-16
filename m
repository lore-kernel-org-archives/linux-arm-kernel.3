Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53014CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eC/sulH2mseeaiObNeLNUQGTpaf84l7yndW7viSPpP8=; b=Xf4sdW3LJBW4O/asdaAjUyqQR7
	0mfJR1CM5Vz53V7P1KCf+BLRzWqBIgivRiOtGYFq29HVig/LsHG9LDPf5oWR4ERIK9Of59oteQV/S
	5jViY+v+gffIXZVswWCLXhtRN8CTB88wg3zA0/hdpFBxk4JWtkWPIMlcn/zcJTlMsrM6bGWuPWr9D
	xlHd8cnpd3ZeFIdTovnrptWdC6zDzwpTQDlNAC5N3iIEf7GZHgMYhUWVaNwEYjHnoKlufDc4RvFS1
	58I2yH9csuX+P3+X1/wGL/AvHB9ggYNc7yq596YwMqfSz1uxnG7Fr0o8wnGYg0P5S1PirYtQGjvio
	ogHmYH3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRfG-00000007JVj-0Wej;
	Tue, 16 Sep 2025 09:07:54 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRfD-00000007JV2-2RN2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 09:07:53 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58G97j121334931;
	Tue, 16 Sep 2025 04:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758013665;
	bh=eC/sulH2mseeaiObNeLNUQGTpaf84l7yndW7viSPpP8=;
	h=From:To:CC:Subject:Date;
	b=vysoebr9SxI1haSqG0XZJLoHLedO/UH1CHRUpD9cEVGKAq1lRmRAm867MGKL2IJEu
	 QwNMAvPWO7xpT0mZoREShhL6fNxAPoAyXPToOk/tBgeTwnX48QYeOwkHqlgpgyOAUI
	 h3nxiCgjCVonq9ENfBKawTMp87dPXvNzJ4PEGiw4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58G97j5R4052228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 16 Sep 2025 04:07:45 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 16
 Sep 2025 04:07:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Sep 2025 04:07:45 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58G97icV1377927;
	Tue, 16 Sep 2025 04:07:44 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am62d2-evm: Fix regulator properties
Date: Tue, 16 Sep 2025 14:37:36 +0530
Message-ID: <20250916090736.2299127-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_020751_788018_96E1FA01 
X-CRM114-Status: GOOD (  10.49  )
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

Fix missing supply for regulators TLV7103318QDSERQ1 and TPS22918DBVR.
Correct padconfig and gpio for TLV7103318QDSERQ1.

Reference Docs
Datasheet - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf
Schematics - https://www.ti.com/lit/zip/sprcal5

Fixes: 1544bca2f188e ("arm64: dts: ti: Add support for AM62D2-EVM")
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---

Boot logs
https://gist.github.com/paresh-bhagat12/9a4a1aec5119ceedb386743921432c91

Tag used
next-20250915

 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 83af889e790a..d202484eec3f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -146,6 +146,7 @@ vdd_mmc1: regulator-4 {
 		regulator-name = "vdd_mmc1";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_sys>;
 		regulator-boot-on;
 		enable-active-high;
 		gpio = <&exp1 3 GPIO_ACTIVE_HIGH>;
@@ -165,14 +166,16 @@ vcc_3v3_sys: regulator-5 {
 	};
 
 	vddshv_sdio: regulator-6 {
+		/* output of TLV7103318QDSERQ1 */
 		compatible = "regulator-gpio";
 		regulator-name = "vddshv_sdio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&vddshv_sdio_pins_default>;
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_5v0>;
 		regulator-boot-on;
-		gpios = <&main_gpio1 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&main_gpio0 59 GPIO_ACTIVE_HIGH>;
 		states = <1800000 0x0>,
 			 <3300000 0x1>;
 		bootph-all;
@@ -334,7 +337,7 @@ AM62DX_IOPAD(0x01d4, PIN_INPUT, 7) /* (C15) UART0_RTSn.GPIO1_23 */
 
 	vddshv_sdio_pins_default: vddshv-sdio-default-pins {
 		pinctrl-single,pins = <
-			AM62DX_IOPAD(0x1f4, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO1_31 */
+			AM62DX_IOPAD(0x00f0, PIN_INPUT, 7) /* (Y21) GPIO0_59 */
 		>;
 		bootph-all;
 	};
-- 
2.34.1


