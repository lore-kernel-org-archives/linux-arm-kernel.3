Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB32AD609AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tjTIKW9eo5borKok+xBtBjM7UMaGh7skviWUJzH4050=; b=dqnqi8WUQIFHbByGPmw8qbDOwe
	eI6whqE29jvPdyjK7lcpU/rG4p8G0ySUNivWBvpcxxVUoOhrjvTE/A+PonsNN1xYMVV8tJ5QaF3td
	GjByPMaYFCKQrBHLTi/+pCBWX/hZgJRxVXbnZbRTA9DFxgmBm1b4eGWmPhfGcGXLFckZSNU92j0jr
	EYJOluRc4TLXxKpY0vUVRapTsBBCcTXiL5hcz6pvCB3DyQcLTm46s7OS6J5k5lxRUwYelcF8nsL/u
	QivCNrPT598qIGxY272wdVzAsRYXxArDcPFrqitIaESsPtau5XHCVN0zq4WyAngA8SUpkrGrUuyY0
	HSyQWfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGD3P-0000000CWr8-0CSv;
	Wed, 27 Nov 2024 08:05:43 +0000
Received: from lelvem-ot05.ext.ti.com ([198.47.23.236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCut-0000000CV5p-1fhr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 07:56:56 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot05.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AR7unwZ757910
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 27 Nov 2024 01:56:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732694209;
	bh=tjTIKW9eo5borKok+xBtBjM7UMaGh7skviWUJzH4050=;
	h=From:To:CC:Subject:Date;
	b=bT4ZJj7NarbK8iwZtvoi31q9/+DVyFKMh4ed5q0v65ldsu40xVo+/gUS2NIn+JwDG
	 1qwvH/9Z44BZPO2LBPINGCWJd4MdzlQ9eHIJ4Q5zH4l+wlrB6XDFOgPHQRR85n7Qj/
	 a1NHIcmresNaptBW7D+E6fkmRfdg/jsvJbEi8lps=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AR7ungO104187;
	Wed, 27 Nov 2024 01:56:49 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 27
 Nov 2024 01:56:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 27 Nov 2024 01:56:48 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.227.92])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AR7ujN9052665;
	Wed, 27 Nov 2024 01:56:46 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <vaishnav.a@ti.com>,
        <a-dutta@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j7200: Add node to disable loopback connection
Date: Wed, 27 Nov 2024 13:26:44 +0530
Message-ID: <20241127075644.210759-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_235655_608362_498118EF 
X-CRM114-Status: GOOD (  12.57  )
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

CTRLMMR_MCU_SPI1_CTRL register controls if MCU_SPI1 is directly
connected to SPI3 in the MAIN Domain (default) or if MCU_SPI1
and SPI3 are independently pinned out. By default, the field
SPI1_LINKDIS (Bit 0) is set to 0h. In order to disable the direct
connection, the SPI1_LINKDIS (Bit 0) needs to be set to 1h. Model
this functionality as a "reg-mux" device and based on the idle-state
property, enable/disable the connection bewtween MCU_SPI1 and MAIN_SPI3.

The register field description has been referred from J7200 TRM [1]
(Table 5-517. CTRLMMR_MCU_SPI1_CTRL Register Field Descriptions). 

[1] https://www.ti.com/lit/pdf/spruiu1

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---

Hi all,
The above functionality can be achieved by changing the idle-state of
the "spi1_linkdis" node. As observed, when the SPI1_LINKDIS (Bit 0)
is 0h, the connection remains enabled and SPIDEV loopback test is
succssful [1]. But, when the state changes to 1, the the SPI1_LINKDIS
(Bit 0) becomes 1h and the SPIDEV loopback test fails [2] indicating
that the connection between MCU_SPI1 and MAIN_SPI3 has been disabled.

Test logs:
[1] https://gist.github.com/anuragdutta731/9ac287f27f1dfb3a5ccee4cc86e02dbb
[2] https://gist.github.com/anuragdutta731/3ed7b7b5a1a3dab494ba46858b972088
 
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 4 ++++
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi       | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
index db43e7e10b76..f684ce6ad9ad 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
@@ -409,6 +409,10 @@ &serdes_ln_ctrl {
 		      <J7200_SERDES0_LANE2_QSGMII_LANE1>, <J7200_SERDES0_LANE3_IP4_UNUSED>;
 };
 
+&mcu_spi1 {
+	mux-controls = <&spi1_linkdis 0>;
+};
+
 &usb_serdes_mux {
 	idle-states = <1>; /* USB0 to SERDES lane 3 */
 	bootph-all;
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
index 6a8453865874..56ab144fea07 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
@@ -184,6 +184,13 @@ phy_gmii_sel: phy@4040 {
 			reg = <0x4040 0x4>;
 			#phy-cells = <1>;
 		};
+
+		spi1_linkdis: mux-controller@4060 {
+			compatible = "reg-mux";
+			reg = <0x4060 0x4>;
+			#mux-control-cells = <1>;
+			mux-reg-masks = <0x0 0x1>;
+		};
 	};
 
 	wkup_conf: bus@43000000 {
-- 
2.34.1


