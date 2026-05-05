Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D9CCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQnjE5I+o0Up3UlhYIpHokB9uz3+wYv0Cpj1ohW/uOM=; b=JRwq1mPhu7IcD5Ip8+gSDCSHNm
	VZofy593x79iWycYwX9+zcGWG3oA8x7s+YQX3Bjyq290WIldn9txVsqarjOVn858etUyYuwAdrVUg
	61mazjSoiYhtxCD3DYoIQRoblLLSR+5IzMJ5IyLzotocYX1Q4VQkymSbcs0zPBAep+sKaTA2rUy+4
	5PIcOgMIJBWSjC1F3k68p5v09JFnKHvrzIKRqWWWHxT9xmEx/rz32/u9oIVUACyhlrDBWh96PzIxW
	4XbrghkiwcunzIrCku9jOtHdH7UTurt67jKEoHUdEqz6QgP4E/KaX8F6guHaYquemyQ3njUW0BNm7
	etkZaRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDZo-0000000FzFZ-2m94;
	Tue, 05 May 2026 11:04:32 +0000
Received: from mail-northcentralusazon11013000.outbound.protection.outlook.com ([40.107.201.0] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDZm-0000000FzE0-3By6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:04:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+UX6d30cKzucMnpeBsgDE7F4A3LRClC7+MKRQy7lDGNoK1EcAGBlzaL/t94Cq+hovcq/MfxBGvBf+3hrBfHgmHYhv6MupgoWcZ8ruXxQATtXtVk4litSEZUAg4N231d59m3kpDtioG1ngXlGpVXh5qSXTo34WCFWFUKer2YsuXEhXNKV9YOMI4Nu9A62NsVB3vruGGujBpXWs3629QvPp2UEstrQ08Z3tuHGRBkJ7oJs8IsBBFb4gqtzlpofwjCuVZp6A1EitaKGt+ush9MUA/VCTVMNbuTOBK1Qzt37W6PVDopgmOCVMRDQl6rDWzQZ0OAAN8K1DkkKsvRcIsJ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQnjE5I+o0Up3UlhYIpHokB9uz3+wYv0Cpj1ohW/uOM=;
 b=ca2Ej1JO1aMjsPVPKeZYtPRnO6Xtmn3l8r8RDsrMmIaVQ/WmWMVvbFf+ZhurmIcm7LJ/rt/pkZVzAh9dARRDDwSNT/ep8FE+q42t2JpaWThyC3fqPaAWKk1DZ4CilcNBup6sn5qVL+MCCkp/8gi5Gg7fbRnseOFlg0qIBDTSzxCWmKTCd7EDuusm0kqdzUWMtrB46S1hQazVtTvy6TmEP6s0cYILDKi+Nwn8Ux6QIgTeeUnmBUU4F2RL2mSzu7FJi7tYB/wjghiHCY0E+Jm/u82tpbPA/lSPqJgMD43zmet0G7KFg7Eq77f8kt4iFGtIqZrymW5r7180+qi2cP5mJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQnjE5I+o0Up3UlhYIpHokB9uz3+wYv0Cpj1ohW/uOM=;
 b=k84kXY/KfknysheW8lJ+mvg4UUAhcPmKWGMEIsII1qkHH/6Oqk04KMlUbwIjpIEkDA7/QSEGft0a0RJDOiOSyXxC3I9TyFp+NrdDYixRwVB78Z5VJz4L2UcmJSBJPliN9dqMLeKtHq/PpRgJ81ykWcdwLgzVFDK1rsEz/uWBkBY=
Received: from DS7PR03CA0219.namprd03.prod.outlook.com (2603:10b6:5:3ba::14)
 by MN0PR10MB5934.namprd10.prod.outlook.com (2603:10b6:208:3ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:04:25 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::89) by DS7PR03CA0219.outlook.office365.com
 (2603:10b6:5:3ba::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:04:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:04:23 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:04:23 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:04:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:04:23 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645B49h02831834;
	Tue, 5 May 2026 06:04:16 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <josua@solid-run.com>,
	<w.egorov@phytec.de>, <matthias.schiffer@ew.tq-group.com>,
	<d.haller@phytec.de>, <francesco.dolcini@toradex.com>,
	<joao.goncalves@toradex.com>, <emanuele.ghidoli@toradex.com>,
	<ernest.vanhoecke@toradex.com>, <rogerq@kernel.org>, <eballetb@redhat.com>,
	<robertcnelson@gmail.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luis.parga@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 01/13] arm64: dts: ti: k3-am642-hummingboard-t: fix USB clocking for compliance
Date: Tue, 5 May 2026 16:36:02 +0530
Message-ID: <20260505110631.1144200-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260505110631.1144200-1-s-vadapalli@ti.com>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|MN0PR10MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: d27550ef-5ae1-43f3-c261-08deaa9610f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: J+2zXuz3eHvwm14uYEUlu2aRm8FxWOFVF72u8RzXmo6toBmNriv58QywqWDySm7Hwwsoy+HNKTE4afhm4K/6/44PUcqIQooNMP2FDAOiNQRdc5gv+wVl6qXv5qFax2Yj/4IeCo5Bo5tyL87EKyut+dAK0LuxYb3TGgVM122Uj4Fz3byKT9/iSZNAfjXnNfhD0cfVMu4OLks9HR3bEshBRoFnF2pAl/ifJaZ+Q4s4Hc4Qz7cUX2h+PD+f/SXgZeoEqTvTsavVnHUidJ0yPhgQMpQ0GqJ3BHrrhPCs9M08Qp9foPOsW+nPPtR1AOcsS5THyAc3DrVBZguIspp45zRuE8x4UxmFQYO/AA2H2uMyz7GKVDI/Dj0JSU8BQOSK2Gi6LB5dEclN6pU8SngFCTBgaFcT6NXyf9AaPdG/4EEKi+AyvYA4p7u0fZTgnKZdjnN6pzXN2nRtW/rgypFaZSzAQnCSgRRBPUJkcyth+vtVFsXi2mRcmqmLfyxKl8ZdMZhEYdyG72B850UfNXNhLF2nY1lfYgdMokAvBN52FSrZW+i6jwQ2zItjesAjGF1bZkdqr3pezdSjzMZ7LOg2nabVpu5BSuB3lIcQ0wQC55/vU4O78/jmyJr1aUnkUXE+LTjrQV5+4ReiTKFl68UciGv7fNNv8XqHg5bHhZwnYYydC2ovsCXhLZZv/A7NXqjQ+SMEYI3m1XqUMmZ+dOqG1PhsHqYatGCTcDZT4f0XNg3mSzsHxHbK8YDRk3IYzrgvJTlJw/ZHbq603uY4Y4DGamvHeg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ikPP8WpYZcEh9l3sD886+/pc68pCJQqov7NR+9MO4z1izPDFjiHVdnuUANSapBGTNicSZDvDzHDaOWn6YRzMGKWDuf7ZagDe8yNVNN2JYOc53khG919pvLSlj9Eg1V30Gv60mfkJVRO8nxFnMd2ZiSFr6QkWmXf+jm7v3X1hUlnd5MaTDzKCOVb03oshU+kihRUnl3xdnw1WCnaJeLWMbJMSVCIBD+dKg1ZW2OPeWdSyvsgP4O3aXVUtZfZcfp46TjC6vFCfGNQp6MrFQ+AXwiHG7fNPFtTw78YrEZkLdoU7/n7IqdiFoxKX9QRJ7kCqEkapUxPJmsX53UXieOs+o5oHX+1d0hk5CEdL/dKF/JGDTiYHrrqoSQ8tY9o0OzicPn/o8mfyP2s7x27a5TvPWl3cjxnGJ0BjoKX0ARgYU0kbLgcVOyD83ZEToWSldPGf
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:04:23.8599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d27550ef-5ae1-43f3-c261-08deaa9610f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5934
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040430_812489_72BCD0C4 
X-CRM114-Status: GOOD (  10.13  )
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

According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
the USB 3.2 Specification, SSC should be enabled by default. This protects
against EMI violations. Hence, enable internal SSC for USB SuperSpeed.

Fixes: e2b691804319 ("arm64: dts: ti: k3-am642-hummingboard-t: Convert overlay to board dts")
Fixes: bbef42084cc1 ("arm64: dts: ti: hummingboard-t: add overlays for m.2 pci-e and usb-3")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts
index ee9bd618f370..90a158531f60 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dts
@@ -15,6 +15,14 @@ / {
 	model = "SolidRun AM642 HummingBoard-T with USB-3.1 Gen 1";
 };
 
+&serdes_wiz0 {
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
+};
+
 &serdes0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -23,6 +31,7 @@ serdes0_link: phy@0 {
 		reg = <0>;
 		cdns,num-lanes = <1>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		#phy-cells = <0>;
 		resets = <&serdes_wiz0 1>;
 	};
-- 
2.51.1


