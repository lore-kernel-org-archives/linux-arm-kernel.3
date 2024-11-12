Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1348AD41D61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+nvaEIkJi1JKRsX47Bn13ItbUtldzj6zpPQcXn6HvLg=; b=pDQEI/8sdTlFO1fibuUHbNFhFY
	055j+v7V2Damk6Q6Nd5Ck72k/kbI8/r9/gb11rRJkHRG4VZNafT/irQj4O+9Z4+jeY78g+ZKu+kOs
	rFw/ppvpOOlGuwpyZ+GdQvGmiTT7Gt/mLzrezAbkXElPtDndswwVUmmdLxfbf7blzhYJTR7ubsMHV
	hUDHpLciqkJLQ+V0SKoDflf1Qpj7j0NJuoCrLzEpCauitsGLNanur2+QhnDHzM4C+dxPXSSZTkpSF
	YqQFlFF+JHkUr8SIsAiiHEa/rIoqJsXNBcTW6kIjPnhm1+7nbOzzGHR30ihfwuJ5eCcnEXIDIIT0u
	tGtwqlrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAl8w-00000002RNU-2fj7;
	Tue, 12 Nov 2024 07:16:54 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAl68-00000002Qx2-18R8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:15:05 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABLu5fw016704;
	Mon, 11 Nov 2024 23:13:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=+nvaEIkJi1JKRsX47Bn13It
	bUtldzj6zpPQcXn6HvLg=; b=DU+hJHfMvUD7n8xtXhOdgiOi89/Db9Pc+i/1WMj
	XcFwklXYKFNUaYJyi3c+V1lfwL0boqORmWpiQhhmjZkrUIer+NKWykBbeapnSCuK
	QSm+ZXlC1X+IVN/3IathgJP8C28X3TtSZpQaFpWFSiS6BW3qlDyf2LzYjiNeLRJ7
	CZGEOi18w+d5e7TIxGjmfNeKcFbxm4YwqUFGXhoeWDR8Y1TQrkORv9s8dnO+5c7V
	yUrq4nsL0RNhlF1Y9Cv3RbvuUg6spXPvfWJn+nTGFufw36OvIem1oZBvsFsV0eJi
	8DG6CPVJIbI2piYDB1VfRpKqP7LccCtYaiksliQnMqc3fqw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42un9d1csv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 23:13:54 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 11 Nov 2024 23:13:53 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 11 Nov 2024 23:13:53 -0800
Received: from localhost.localdomain (unknown [10.111.135.16])
	by maili.marvell.com (Postfix) with ESMTP id 0A18F3F70B2;
	Mon, 11 Nov 2024 23:13:53 -0800 (PST)
From: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
To: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <salee@marvell.com>, <dingwei@marvell.com>,
        Jenishkumar Maheshbhai Patel
	<jpatel2@marvell.com>
Subject: [PATCH 1/1] arm64: dts: marvell: use reset controller to reset mac
Date: Mon, 11 Nov 2024 23:13:50 -0800
Message-ID: <20241112071350.762111-1-jpatel2@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3ZGkxgAhdUC6TpdclIJI6IyS3PWbiEOt
X-Proofpoint-ORIG-GUID: 3ZGkxgAhdUC6TpdclIJI6IyS3PWbiEOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_231400_449002_C5C6106F 
X-CRM114-Status: UNSURE (   9.55  )
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

change mac reset and mac reset bits to reset controller

Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
---
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index f5aef6a23f65..f358f9809edd 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -6,7 +6,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/mvebu-icu.h>
-#define CP11X_PCIEx_MAC_RESET_BIT_MASK(n)	(0x1 << 11 + ((n + 2) % 3))
+#define CP11X_PCIEx_MAC_RESET_BIT(n)	(11 + ((n + 2) % 3))
 #include <dt-bindings/thermal/thermal.h>
 
 #include "armada-common.dtsi"
@@ -276,6 +276,12 @@ CP11X_LABEL(gpio2): gpio@140 {
 			};
 		};
 
+		CP11X_LABEL(pcie_mac_reset): pcie-mac-reset@0x440268 {
+			compatible = "snps,dw-low-reset";
+			#reset-cells = <1>;
+			reg = <0x440268 0x4>;
+		};
+
 		CP11X_LABEL(syscon1): system-controller@400000 {
 			compatible = "syscon", "simple-mfd";
 			reg = <0x400000 0x1000>;
@@ -548,8 +554,7 @@ CP11X_LABEL(pcie0): pcie@CP11X_PCIE0_BASE {
 		num-lanes = <1>;
 		clock-names = "core", "reg";
 		clocks = <&CP11X_LABEL(clk) 1 13>, <&CP11X_LABEL(clk) 1 14>;
-		marvell,system-controller = <&CP11X_LABEL(syscon0)>;
-		marvell,mac-reset-bit-mask = <CP11X_PCIEx_MAC_RESET_BIT_MASK(0)>;
+		resets = <&CP11X_LABEL(pcie_mac_reset) CP11X_PCIEx_MAC_RESET_BIT(0)>;
 		status = "disabled";
 	};
 
@@ -575,8 +580,7 @@ CP11X_LABEL(pcie1): pcie@CP11X_PCIE1_BASE {
 		num-lanes = <1>;
 		clock-names = "core", "reg";
 		clocks = <&CP11X_LABEL(clk) 1 11>, <&CP11X_LABEL(clk) 1 14>;
-		marvell,system-controller = <&CP11X_LABEL(syscon0)>;
-		marvell,mac-reset-bit-mask = <CP11X_PCIEx_MAC_RESET_BIT_MASK(1)>;
+		resets = <&CP11X_LABEL(pcie_mac_reset) CP11X_PCIEx_MAC_RESET_BIT(1)>;
 		status = "disabled";
 	};
 
@@ -602,8 +606,7 @@ CP11X_LABEL(pcie2): pcie@CP11X_PCIE2_BASE {
 		num-lanes = <1>;
 		clock-names = "core", "reg";
 		clocks = <&CP11X_LABEL(clk) 1 12>, <&CP11X_LABEL(clk) 1 14>;
-		marvell,system-controller = <&CP11X_LABEL(syscon0)>;
-		marvell,mac-reset-bit-mask = <CP11X_PCIEx_MAC_RESET_BIT_MASK(2)>;
+		resets = <&CP11X_LABEL(pcie_mac_reset) CP11X_PCIEx_MAC_RESET_BIT(2)>;
 		status = "disabled";
 	};
 };
-- 
2.25.1


