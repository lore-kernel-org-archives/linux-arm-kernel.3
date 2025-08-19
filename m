Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550D5CA0EF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yih4aNA9IcSfNBRMPy+Nrn2sMcUt3v3mug6AEfsuEZY=; b=Sxze/gFoNJuHMhwcH1TNDMYiSZ
	+vkW0HR8xd+NOu8NQGYDPttOGsOCaJSJFNg3CEkej5JZvD9TMBh+aHJSkfxg80Hy+C0pmy0aT0EzV
	sdBSpy/If/5eZRX3y/IXvjX+FqDsAYUvyQ5lTGzhxmuPOfd6VIMhCMhpVXmzb7foJEVFKVL0wSZK1
	AC2BE96AlIvA5VkX9y1AzN2uzNl2kCnjplibbANfJVOwp+CFqDe4IENRO1ThWQmcuFD2IsPF5gCRx
	aP2e2+O08Hq1mNEqsvca67CoYuWvm707Ii4SrW3HaECMDIbYIQtLZ7c7U41zHwJ5Vo6+/0xzL/0AM
	8tXMV8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMZC-0000000AccR-0mBn;
	Tue, 19 Aug 2025 13:39:58 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoK1z-0000000ACJt-2z9O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:57:33 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JAvLYE2878915;
	Tue, 19 Aug 2025 05:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755601041;
	bh=Yih4aNA9IcSfNBRMPy+Nrn2sMcUt3v3mug6AEfsuEZY=;
	h=From:To:CC:Subject:Date;
	b=WTpBHEr9F3yj3/aE4iE2ZWZ8wOfEo/dIenQk0sQd4OM051LXnJv0wiiAcJQj46tWY
	 bN+hFOiY17kPytVwhVlvX++zB/PEuGe2chnbtCnsj4X4OxCM8RbCJspCO2uXSXH79F
	 hiVEXZT6Df0ay8LBdN3CcvsEX+9R3QYjgSJTlh4M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JAvLtW538323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 05:57:21 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 05:57:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 05:57:21 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JAvHPC2599492;
	Tue, 19 Aug 2025 05:57:18 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am69-sk: Switch to PCIe Multilink + USB configuration
Date: Tue, 19 Aug 2025 16:27:00 +0530
Message-ID: <20250819105717.372893-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_035731_909418_BF41F527 
X-CRM114-Status: GOOD (  13.43  )
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

The SERDES0 instance of SERDES on the AM69 SoC is a Cadence Torrent SERDES
and it has 4 lanes which are allocated in the following manner:
Lane0 and Lane1 to PCIe1
Lane2 to PCIe3
Lane3 to USB0

Until [0], the Cadence Torrent SERDES driver only supported configuring
the SERDES for a PCIe + USB configuration whereby all lanes of the
SERDES configured for PCIe will operate at the same speed. As a result,
PCIe1 and PCIe3 instances of PCIe will either fall down to a common
speed based on the PCIe peers that they are each connected to, or, the
PCIe link could fail to be setup.

Since [0] enables support for PCIe Multilink + USB configuration, it is
now possible for the SERDES lanes allocated to PCIe1 and PCIe3 to link up
and operate at different speeds. USB continues to remain functional.

Hence, update the 'serdes0' node as well as the 'pcie1_rc' and 'pcie3_rc'
nodes to switch to the PCIe Multilink + USB configuration that is now
supported by the Cadence Torrent SERDES driver.

[0]: 351e07e6b2ec ("phy: cadence-torrent: Add PCIe multilink + USB with same SSC register config for 100 MHz refclk")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on linux-next tagged next-20250818.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index 612ac27643d2..f4f7b89bf0d2 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -1321,12 +1321,20 @@ &serdes_wiz0 {
 &serdes0 {
 	status = "okay";
 
-	serdes0_pcie_link: phy@0 {
+	serdes0_pcie1_link: phy@0 {
 		reg = <0>;
-		cdns,num-lanes = <3>;
+		cdns,num-lanes = <2>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_PCIE>;
-		resets = <&serdes_wiz0 1>, <&serdes_wiz0 2>, <&serdes_wiz0 3>;
+		resets = <&serdes_wiz0 1>, <&serdes_wiz0 2>;
+	};
+
+	serdes0_pcie3_link: phy@2 {
+		reg = <2>;
+		cdns,num-lanes = <1>;
+		#phy-cells = <0>;
+		cdns,phy-type = <PHY_TYPE_PCIE>;
+		resets = <&serdes_wiz0 3>;
 	};
 
 	serdes0_usb_link: phy@3 {
@@ -1364,7 +1372,7 @@ &pcie0_rc {
 &pcie1_rc {
 	status = "okay";
 	reset-gpios = <&exp1 5 GPIO_ACTIVE_HIGH>;
-	phys = <&serdes0_pcie_link>;
+	phys = <&serdes0_pcie1_link>;
 	phy-names = "pcie-phy";
 	num-lanes = <2>;
 };
@@ -1372,7 +1380,7 @@ &pcie1_rc {
 &pcie3_rc {
 	status = "okay";
 	reset-gpios = <&exp1 6 GPIO_ACTIVE_HIGH>;
-	phys = <&serdes0_pcie_link>;
+	phys = <&serdes0_pcie3_link>;
 	phy-names = "pcie-phy";
 	num-lanes = <1>;
 };
-- 
2.43.0


