Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D40DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 00:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFtrVBd/IPHzLs98dvYRdlS9honVwwUUU/xr84MDx3c=; b=PzL6RJTINVT4H8kjo1SryH/U1X
	nSfOVyCTm2NvEJPp80lgOnARaIygSdCBPy6lgbRsM34HalDvHBg8poSkIWMAVYNn54OW2xpkY21Xs
	+OhTqBbvQgz4hQ2zgRnb6Wb9dYUPg8oRifG0IEfAfCsYMJzIKrUaGUEsCiQbZtFN6Zm+Nq6OxH+Pd
	11LeqfDoe5EIHKbv+hFz1htlvV2sRSE2mOR/YzOW6CA83nis7T7WEiVZLCzTp17U00x5yj/SObxsi
	okDc/b+41c62HnJPXd0wvSlGACPoMS1jxO9SGb4owTUcfp2jr7GRXxBVSExb5axwD3cbPkMOFswwK
	yt3M4BtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71Gf-00000005Rw8-01Fe;
	Tue, 22 Apr 2025 00:13:41 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71C3-00000005RSD-47Za
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 00:08:57 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08qtt1058479
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 19:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745280532;
	bh=hFtrVBd/IPHzLs98dvYRdlS9honVwwUUU/xr84MDx3c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dOEAwwm7Yfp4h5yaC3HOFLiowvRxBRO/H+f8UU8kSRyc92VV6rG+CZg2WvHUlSByr
	 ackjZI0qqbBWrheNu9XYJuqJ8n5Rl7KkyFL43ruXPNfmgt9zBNuvMb3KqcAX/5aOYy
	 eLc6Mq+NhEX8175bmIVpZMPFEwsBVWuNKZUOleVE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08qj2102107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 19:08:52 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 19:08:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 19:08:52 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M08pDF065170;
	Mon, 21 Apr 2025 19:08:52 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] arm64: dts: ti: k3-am62p5-sk: Enable PWM
Date: Mon, 21 Apr 2025 19:08:49 -0500
Message-ID: <20250422000851.4118545-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422000851.4118545-1-jm@ti.com>
References: <20250422000851.4118545-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_170856_110975_64B2A693 
X-CRM114-Status: GOOD (  11.40  )
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

PWM signals can be routed to the user expansion header on am62p5
SK. Enable eCAP0, eCAP1, eHRPWM0, eHRPWM1 and route the output PWM
signals to pins on J4 header.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index d29f524600af0..c2f55cc5a8ebc 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -356,6 +356,32 @@ wlan_en_pins_default: wlan-en-default-pins {
 			AM62PX_IOPAD(0x0124, PIN_INPUT, 7) /* (J25) MMC2_SDCD.GPIO0_71 */
 		>;
 	};
+
+	main_ecap1_pins_default: main-ecap1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x019c, PIN_OUTPUT, 2) /* (E24) MCASP0_AXR1.ECAP1_IN_APWM_OUT */
+		>;
+	};
+
+	main_ecap2_pins_default: main-ecap2-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01a4, PIN_OUTPUT, 2) /* (F24) MCASP0_ACLKX.ECAP2_IN_APWM_OUT */
+		>;
+	};
+
+	main_epwm0_pins_default: main-epwm0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01b4, PIN_OUTPUT, 2) /* (D20) SPI0_CS0.EHRPWM0_A */
+			AM62PX_IOPAD(0x01b8, PIN_OUTPUT, 2) /* (E20) SPI0_CS1.EHRPWM0_B */
+		>;
+	};
+
+	main_epwm1_pins_default: main-epwm1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01bc, PIN_OUTPUT, 2) /* (B21) SPI0_CLK.EHRPWM1_A */
+			AM62PX_IOPAD(0x01c0, PIN_OUTPUT, 2) /* (B20) SPI0_D0.EHRPWM1_B */
+		>;
+	};
 };
 
 &main_i2c0 {
@@ -683,3 +709,31 @@ &mcu_gpio0 {
 &mcu_gpio_intr {
 	status = "reserved";
 };
+
+&ecap1 {
+	/* P36 of J4 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_ecap1_pins_default>;
+	status = "okay";
+};
+
+&ecap2 {
+	/* P11 of J4 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_ecap2_pins_default>;
+	status = "okay";
+};
+
+&epwm0 {
+	/* P24/P26 of J4 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_epwm0_pins_default>;
+	status = "okay";
+};
+
+&epwm1 {
+	/* P23/P19 of J4 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_epwm1_pins_default>;
+	status = "okay";
+};
-- 
2.49.0


