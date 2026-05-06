Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A91CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wENkkocfv33Eu+N1AJY8biL8WJvvKj0EPHbFigieoFU=; b=dfduMbdhSDKjw/BxlinvjjXWOV
	UI65OmRJ4K6zMnr1Z0lxlLJ6eDhp1F3mPoeCpiS3zmvuxpYVw7PBYMDWk6Erhfq3+SWTu/OSdHmaY
	1c60vMQdj/u+RvY0K1/h9eOMvIAM+jqpaR1lXJ2Qp5AYgxZ9AdcJZabYe0Sr4fl/PF8Fxmyl2f5Xh
	4YXW/ZSJ33wth5dod27JfS8xAnxHzuBmsN8zwzUOPPThVjS5rBTLu8hNuKIccWzDpEqHU8He5ZxY1
	O2dSWOcqU4BkuiNVhQeI9DpgESPWoFb2fQiMphFtRW+DQaOZ80lyiiygvuRI02cyBAyXAD2gbuHTV
	sHJz7RZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcwZ-0000000118e-1bT4;
	Wed, 06 May 2026 14:09:43 +0000
Received: from mail-westusazon11012013.outbound.protection.outlook.com ([52.101.43.13] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcwY-0000000116z-0Lei
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:09:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAZNt9vrzr5ELORf6Tc8aeiXc6b1uKRWswzet9DsO1P3jyY2sUEtKZXBl1EwU3LuLAV90scDF6XpSBlpA6JXaCGJid7LveOv2zszu4++858J9daZb+68qpWl2QKRIecDRQsKQEaFIpvSvO2ItT4fDpVxtTZtgCLtSsi2oBH4RJjVbJ4JJ9X5ridc+xZ8Zu7uK9eM0hCFsdrl5ZWoyNCSwlCib9xqQOhNt0vnAvhkmc3FPXmOLHkQcyXgY3RxFh52k2qDUvjElLbzUcFfZ2ShA5bl0HO+yrahkQ6DTKUR8ucnrkzYEAZVxrW3kT5Yr6JeKf3ZZI8FPwlQO+uCxYUT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wENkkocfv33Eu+N1AJY8biL8WJvvKj0EPHbFigieoFU=;
 b=ROg9wyYJ+cN6v5QrsIKGV4lmFR1f6PXBGmn3kioyjrdREzBK537zPn2rzTZfmpTNR/mMrmjPjuZOG3ZqrvMpGZcqR+n1t1TjKPaSD/EtM1HUYtCh/ZxZBvvDXxz90uY8ajx9AC+0R4IM5y3hCJZ8WQeBoeSfONubEylDvmzRubXrOKwVod7felRCJNq8bn4dTwyXayW6n5LFuaLMkbwc6Vc9VViNC6xPJa+s5RMqJNDkprPds6sneOwjaSl2MOthCVGKPr7ugzwW2HreZwLpBbtS5w5DtUbMC51jxl51sEM59vPrt8RAelfICAnaXY1PJw0/9hMUb1CXv1D/DggAuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wENkkocfv33Eu+N1AJY8biL8WJvvKj0EPHbFigieoFU=;
 b=qKh86olkm40m9iJhTwS1VouvDMpKsYu82iYWYezya6Ihy2NWb6aKv4pahUMFsxfVi66jaVW5tajrLhmLVpi/F9McuLckUvuxtwqDRC0Tb9ngAuXQB8ioXgJ26z3HG/5zgabrR+LT2sMynVyDJ1taoUQnKwJwYLezQHGAbxPcBLY=
Received: from BL1PR13CA0437.namprd13.prod.outlook.com (2603:10b6:208:2c3::22)
 by SJ0PR10MB6423.namprd10.prod.outlook.com (2603:10b6:a03:44d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:09:30 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::60) by BL1PR13CA0437.outlook.office365.com
 (2603:10b6:208:2c3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.6 via Frontend Transport; Wed, 6
 May 2026 14:09:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:09:28 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:26 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 09:09:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 09:09:26 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E8IWu1221395;
	Wed, 6 May 2026 09:09:19 -0500
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
Subject: [PATCH v2 09/13] arm64: dts: ti: k3-j721e-beagleboneai64: fix USB clocking for compliance
Date: Wed, 6 May 2026 19:39:41 +0530
Message-ID: <20260506141040.1368918-10-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|SJ0PR10MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bfce4a-b4d8-426d-8d91-08deab79160d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kW5GVq0LwdIPuZOmYAQNZGKpq7Brre907MjXv74drKID1EjMk/i3lRU39Qfh1LRh+RmSONtZPrnwajcguCC6RBiwkEnK/t4ljmVAsK3wJ9K4XsDGPbkx7RvZSLaRtIOdPALPuobmp4GRQ8oLecAM5lVeplGiKEfGdbNfTdyQIW24xHkat30BrvZyGRd0JtvsLeoPcUXTcg8ZSIVX5K/Mg0a9QkKWSwvE2VQwBQkqiwGGWTj35M6SSUf8E1cBo/BM6DSHh+yUV+SFp394L8b4nJejJm/gbctJB6iBrDdHlxwfO3Q8doMpKe4RpoMgmBhYme4tp3le6GgVlKh0UeyyD4o8HrCJAdJOcZC6GlR++yeH4g3zmf9BAWmVTDbVWoNcuJO/RkvPKxW70jHJzkVeUi1U4wI5kaMV62dGyWF00jBJ8dhmjx+H7+SapXOrjbwfVYDNtLlgETOh9L3676h3BY/l4X3jjGIw1Oi+x3fbefcXR6YQ3sRu76GKXWpjL0DSKac5wS4B2MqyFL+83rQgnZX984Duzffe80m5dP5JJaE3fxZTia3/WOW9M7MkZDKZx8jt6Q1iivXXzZZIglUsqPT9ImADPFiYWSiqnBIBhzGikW3NJzySflv8VkvHreEaNOxPddxULdhrCd4+PIphFa5TAnON3VrYFUoSijCnED8mbRS18DkYbCvNZVWa8og803NUs06LiH2RAYXebjaL00FUesyyOBiRB3D7+0beMB1jC+Yq3rNGA7/pPHhXUEjRZlxuiEn7cHHlplXv80g54M4xXnWFxV/6htFWRnQM9Uo=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YLq0iUTZn257oFfE2Qo6+MEhLIAtGXmt0Vkqj1bgBb1CvThuoQ++DV9EJoCQHxyby15lsQSNskcxx5SCs+zXiZgVZfsfpxpH1z9B2tDqRe+kgjrlB4XhFERkx1y6E2oP26P/L9MwQmF1GU+9yXys7J9umUiIsveb4gbl/+WMfHAYGBrZNsKKUVSL00LY6gmvgvVzLhonnPbU2PXxhJe4O/Bo+gkUdHlMtcLQlkFvXYuXCqPcdppd2U9HA3CWE/fomx12o2go9YdSa7c4FYjE+wZB3hNtxCClETioOPIoN0AH3g6j54oTKiKk3PYrSkl7+VL1HFRX5zHc4FzHTn1/lmcxL3KTG1Qn/aHM71qcwxrLJ6TVXjKm533cpZlvjdvrw0z3D+bILMzAW6GtOOlVWybuKUYmKB0EwUSGGb4x/gcChKIvn5zTFE6ofitKtqmJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:09:28.1393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bfce4a-b4d8-426d-8d91-08deab79160d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6423
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070942_197692_58EB55CE 
X-CRM114-Status: GOOD (  10.01  )
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

Fixes: fae14a1cb8dd ("arm64: dts: ti: Add k3-j721e-beagleboneai64")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1:
https://lore.kernel.org/r/20260505110631.1144200-10-s-vadapalli@ti.com/
No changes since v1.

 .../arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index 8040b6528c18..1e87c6cf146a 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -578,6 +578,11 @@ &serdes_ln_ctrl {
 &serdes_wiz3 {
 	typec-dir-gpios = <&main_gpio1 3 GPIO_ACTIVE_LOW>;
 	typec-dir-debounce-ms = <700>;	/* TUSB321, tCCB_DEFAULT 133 ms */
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 };
 
 &serdes3 {
@@ -586,6 +591,7 @@ serdes3_usb_link: phy@0 {
 		cdns,num-lanes = <2>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz3 1>, <&serdes_wiz3 2>;
 	};
 };
@@ -621,12 +627,21 @@ &usb0 {
 	phy-names = "cdns3,usb3-phy";
 };
 
+&serdes_wiz2 {
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
+};
+
 &serdes2 {
 	serdes2_usb_link: phy@1 {
 		reg = <1>;
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz2 2>;
 	};
 };
-- 
2.51.1


