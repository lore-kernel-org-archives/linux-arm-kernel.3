Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F69C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2poAyTjaJisKv9dsHGd5+dqWdpZE+YAFDR/b1OlxWJw=; b=zO2yRpM1v2u0Ow9YRaf1HiB6+Q
	DSUSEAInKPpdlGzfU/vmFOfPHuMfZJ/jn5tZpOqQo53d2VkacapwUf2oZzlDPAuca5DxpKb0YpO3a
	35/UYrnd0OyD/Peq8qlmfl6v0t76ekFWNW6fyyNI9m2Kth570HYwfwFDAZOvweCXRUT/2JF8aHooU
	BR2jtc4yW0K/x7Y7F0uiSA677NGh2WcgZAe1VlkoascH2/19tifezPrXXuv8IBgnAMh+Y3y3bv+O8
	pSNTOVncKwC9YCJDDhZbeQ28AQlim+MlQ5/pwLE3ADHsYIJ3FrNxowrzFIOcBeqFM+QF9tWB0zfLS
	fdw9N67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4Ov-00000004rte-3S6x;
	Tue, 08 Jul 2025 09:14:09 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3uz-00000004mXo-3wLM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:43:15 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5688hB551106687;
	Tue, 8 Jul 2025 03:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751964191;
	bh=2poAyTjaJisKv9dsHGd5+dqWdpZE+YAFDR/b1OlxWJw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=anCmuZ7fERKb0ugucjioNLELJrsa7BZCuApAfio35DbW9VjyabjGqFd4AXJ+SmS3D
	 8tMF/THFw8LTjm9Epyqu+j9nJ7eFgvYBzD1Fztfu7N1eyBjFLzPGL2Kku0lzsomIsW
	 0803uS5PRUQwa3iVFZjVEExAKOIsU0RgUjvanjF8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5688hBHV848090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 8 Jul 2025 03:43:11 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 8
 Jul 2025 03:43:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 8 Jul 2025 03:43:10 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5688hAp41768283;
	Tue, 8 Jul 2025 03:43:10 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>,
        <c-vankar@ti.com>
CC: <s-vadapalli@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v5 4/4] arm64: dts: ti: k3-am69-sk: Add bootph-all property to enable Ethernet boot
Date: Tue, 8 Jul 2025 14:12:52 +0530
Message-ID: <20250708084252.1028191-5-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708084252.1028191-1-c-vankar@ti.com>
References: <20250708084252.1028191-1-c-vankar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_014314_073680_62483706 
X-CRM114-Status: GOOD (  11.07  )
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

Ethernet boot requires CPSW nodes to be present starting from R5 SPL
stage. Add bootph-all property to required nodes to enable Ethernet boot
for SK-AM69.

Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

This patch is introduced new from this version.

 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index f28375629739..a1a16151015e 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -568,6 +568,7 @@ J784S4_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E38) MCU_RGMII1_TD3 */
 			J784S4_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (E36) MCU_RGMII1_TXC */
 			J784S4_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (C38) MCU_RGMII1_TX_CTL */
 		>;
+		booph-all;
 	};
 
 	mcu_mdio_pins_default: mcu-mdio-default-pins {
@@ -575,6 +576,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
 			J784S4_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A36) MCU_MDIO0_MDC */
 			J784S4_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (B35) MCU_MDIO0_MDIO */
 		>;
+		bootph-all;
 	};
 
 	mcu_rpi_hdr1_gpio0_pins_default: mcu-rpi-hdr1-gpio0-default-pins {
@@ -630,6 +632,14 @@ J784S4_WKUP_IOPAD(0x0, PIN_INPUT, 7) /* (M33) WKUP_GPIO0_49 */
 	};
 };
 
+&phy_gmii_sel {
+	bootph-all;
+};
+
+&mcu_udmap {
+	bootph-all;
+};
+
 &mailbox0_cluster0 {
 	status = "okay";
 	interrupts = <436>;
@@ -968,6 +978,7 @@ &mcu_cpsw {
 &davinci_mdio {
 	mcu_phy0: ethernet-phy@0 {
 		reg = <0>;
+		bootph-all;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,min-output-impedance;
@@ -978,6 +989,7 @@ &mcu_cpsw_port1 {
 	status = "okay";
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&mcu_phy0>;
+	bootph-all;
 };
 
 &mcu_r5fss0_core0 {
-- 
2.34.1


