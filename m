Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E499CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKtAUMp8I4InAjO6BNf7Pxp+hYj1wnC9eytEYfo3tps=; b=AYX6Ds+nqkV+b2nlIcVNDLiShS
	wKncpgAW1RbVBaCod289GtGe37raJOtVN6Bg07+Bp4csk2TbEM7y+2yjrdzecFjo40CnwBwK3RLT+
	jYs9qqDDmbNJ9qyNNnVDy9GpaIqfL74Ffht9MZHMOG52h+yhoMpOZiK4l32BEX5nqk/fP3pkn244A
	jXGn2jIld68ZsjGke9swHTHmTGP0xZBLB8ClHe6FttGu61NwoyMM6jdQgwUESgMZ0jGiBeFXUyUuP
	zM8wPagdmCKg7o16nvTJBBGXG/ImznUkhP/i03HmFgBw8E+SxgCZydcxuOXNgGTEB4o6qWSMMeMO2
	29TfSWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDaI-0000000FzWF-1eQP;
	Tue, 05 May 2026 11:05:02 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDaF-0000000FzUG-245a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:05:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPU52cFaqGsPco+BhQH4Y09iLldeH+IWSqJqpZG+cP2ND/KtPxhZh9MWSnfmxx/viqlrGLSuBwgjKKnEflHnPuNOS5mCnN91mdo1yXL4PwSMrpPJZlM+srwFm7w2+9pJ7FylSSGTkGLxkSiLODCFr8fa84oIcuRBZCEHnSwa1Wk1cah7K17EPt7AqkrAYj7V9jCoUjcMjpAn0pUY4jv7utgPW5rv92e42qPwt628dCfkolO1toboUE8wPwv+Y9sqnGlKNEtyKlUpeZhQCSPp53+y151rZg/ydeIDJudakeemZEyrUZm6HlnD4qQ++IlQu/57ny7aSKJ/JfYhvV7k0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKtAUMp8I4InAjO6BNf7Pxp+hYj1wnC9eytEYfo3tps=;
 b=GUjjC7ryNrVYaW0P29E4nu5XwMqlacSzKTuWFb76aDfM+7w4zooFOUfL1fgr8LVPn+xJV0RT2duAC4i6s4o08VdCl0600cRDWCmJfyKuU/40t675M4utfyyBR+ERTbRw7+9ENM+jWzNJsj2EbPuBsICyBh2y/q3rwYffV4jiq6452J8CO81HIw23R6itBENumbAYrM5RLPgv0sRJaKpxvosWx4dPrwoOpyMpIpIqaTL22erhrGrQbAsaPt+JDub1+ARmX/6T+g1YB2zCMZ6STdDzvMYgkbWwoyGhglld5nqjWdrjslIvrD/VA2JFie9cuz7QVubtWRhBaU5EQqA+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKtAUMp8I4InAjO6BNf7Pxp+hYj1wnC9eytEYfo3tps=;
 b=ZEQJRip5rV7V1cJ9zgkr1ztNWE9d9TCOlNFNq/nXaSE4LYfkOm/xUEapHfo1qO1oibNaMoNotxcc8wvDr63lwdE8WhSwiCtAF85mDx5x151YUwpjIicv+iiAsvs7nHL9eQqYD3LI5vOyJKp7T+RmDiME+LNsiNSKIm2Jcc9b5Nk=
Received: from MW4PR04CA0164.namprd04.prod.outlook.com (2603:10b6:303:85::19)
 by PH0PR10MB4551.namprd10.prod.outlook.com (2603:10b6:510:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 5 May
 2026 11:04:53 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::f1) by MW4PR04CA0164.outlook.office365.com
 (2603:10b6:303:85::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:04:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:04:51 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:04:50 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:04:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:04:50 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645B49h42831834;
	Tue, 5 May 2026 06:04:44 -0500
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
Subject: [PATCH 05/13] arm64: dts: ti: k3-am68-phyboard-izar: fix USB clocking for compliance
Date: Tue, 5 May 2026 16:36:06 +0530
Message-ID: <20260505110631.1144200-6-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260505110631.1144200-1-s-vadapalli@ti.com>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|PH0PR10MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: aaaf4462-cc93-41ab-f9c5-08deaa96215b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700016|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ub2irB/gUzK3deQJQJ4dUDjAr6AvYgWCUu4+zKLa121HAtx/HLvykhVCXgjBroqVbQhaxwduAA448NSINibAflZ0hYf7A9V9kUqnBnay4FZOca9FSd8Z5CQ70UE9Awd/rQ/FsvQcnlWqbEDs+j0jGVi8Cd7GXXDhFN3ZvE5RBHH1SRJd0KB33133T3vrG2Zu2SLDJ++UBYshjXPus519p2xKPgamu0bqPavaq5YZ3Rm551+BMvfNcKNbYD2z0dU1YsQqksggw0LeIqbJJHMf/uq3Nj3aUIhnt5KmJDNHWRRrPXFI4AbqyH3NyaWBbU4c1d8HA7I5/YbH0BSb9mQ2gyhZLiEDN95J0f7ct6Hesp9M2A9CRvLHF5/rcBpVuAlWBVH4O5RG+z1//oTHE7ZfJjlQOI0gzFMXglE7IaScowXouN2wRXb9cXmvOfpGDdJyVlw8+6A81EQFyNlMfonMuxtKIlzqpbMWrO5zdsIyCfULQPLtL3aIX6U4bD86kiJsrUpGyO17em6oUamCpWIZrNckm/4Bxn+magAnbpNUrjblLYg4/t91+gH7MOMeIIbtxMBCCXKu7ZLqOSc7R+zLWthyZ1zOEJf0NQ4AMD6OAm7Jw+4thjezVJ/okm74TRw+pfXbosYHbAZlZWUpxA8B/CIVaqvP2InGbLQMzMEbu6iQ2riMttyTxVFbQOLTDZM25yY/DN67laMm/5GPDCduubSd1KeDjSaKuIL8JA34P4sBAqth0gqfsvJjop/NlpQccJps1EICqSJzcIkMyzc2rg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700016)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lyENaAjX+XT3lVJysnig4WFCDfZYJlt59w5YhYh7jHwRNYVIwphHqBVt32f7uIpVJjKIyKqK/JziE2G+7QtHc+f32oEJmC3eQhq9k2PQ7GzMB1kgHII2NFasURqkj8jDnaV4fPeuFNPKdWTxcM+r4hVW/CsQCh85PKHsA2VVWNQA0fSzfSNHEgW136Uh6FAbv/ZVBHyh6vJhgwpkp6oIM33ietzRP+Q0DBcSSH48kHNBdD2fw/dkRnHBsXMbmSicBEMMgi3+tGlHTZet3hOFnDFJ11TIfZu75F41n5Q/JKIjffcTo1yDsl/KthHXwjrY6EQcr8CESSumQ/mtnXP4MIie1rZPh2nbPdqkemcO5xNn0hWHOhpbGR4YDzR1QbvzJnb7tIyRwNxX2B6mYhKc+QVosZumsXpsCxto+HozNuWnk7ZBG0woWYJTstQ8jcOe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:04:51.3333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaaf4462-cc93-41ab-f9c5-08deaa96215b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040459_536238_033C3ACC 
X-CRM114-Status: GOOD (  10.36  )
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

Fixes: 8bc3b1c86452 ("arm64: dts: ti: Add basic support for phyBOARD-Izar-AM68x")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
index 225fe7a7803b..d9b61e426ff8 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
@@ -505,6 +505,14 @@ &serdes_refclk {
 	clock-frequency = <100000000>;
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
 	status = "okay";
 
@@ -522,6 +530,7 @@ serdes0_usb_link: phy@1 {
 		#phy-cells = <0>;
 		resets = <&serdes_wiz0 2>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 	};
 };
 
-- 
2.51.1


