Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781AACD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sABG+lKtAHUTO5Cqxkxq6R2TEVtprUt9atrmsVTwQpY=; b=EdJa4WAzlnwsJ32osvIhwLo68O
	Dg+i0CqgykwZPCh/hcfsBaPkFAJDYaJ/E6UKvPflUj2UkUNDUoL1l8LjNL/OTiSX7ge0Ko+psLON3
	2+OopPgTEyuDhGbFPpW+605smNVUqNkEjxw6WbKVCugva+S7aU3OPpZj8WNCR3DqWCCXpojvPm2Xv
	JGx3xbDeJhJk8pH2vr0lrvSHvSobQNMXKJ3iB4cdCIASITf8hzl03u7aq9MGZMD9FqZSDs2LMHQsP
	LaZgHgprvihtO9ABMyZGFOt1wjlnb8O4q7aT7wEIXeviAYPssLYybpjZW+d4K2wbbj2kHjyIpv/Jn
	ew4P4npA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcvw-000000010fN-1J8p;
	Wed, 06 May 2026 14:09:04 +0000
Received: from mail-southcentralusazon11013002.outbound.protection.outlook.com ([40.93.196.2] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcvv-000000010eM-0gNv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vc79Li9n5BYiVifzTb5CENkIIGJD8Y+uiGWRaifBWSwTVU0xQtzKiJvKU2oD5E0+TgK018jjFfKGOI4wh8RPG9K8wCD+yWZOMWw67cP7p3QYdVb5nr1OYUqanR8QnY8q9kbB/oYBTl+77OPnyG3+OgvweQ/9MdvrhgsI5NC2o5dFehQ2OV6jTixrv1OwLPk7pPHLHM5zGOvu6ViLGXk1gQOVRjb/7BM8rSD2g+cDdEvk8l0lGkFQKQoI2g0Fa18lZrm+gfPITopIw1Rj9SXxboSp3t0R2XD6GdgmGHMNqBynQRZhpIdLBIR+uV3ORDIlotq1WQJg/0cAfyaPD/+nSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sABG+lKtAHUTO5Cqxkxq6R2TEVtprUt9atrmsVTwQpY=;
 b=BeRdrewuuwzWb24EC+q97Q67CfuGXEKZoTi42Vd6a5Si9pzt+anZtCzEfCIUBQ8D+Sa5xGx9xsVsjP1n9Nq0s0dM+3jCS2w4O5cIUzAMUbiL3qyfEpCUNtZphPlyRjaYoL8gg2aUTbg79wcb8b9OVA+ALvebvz/0tWoja6h+FYS9QeYvqlWiuCqGZCcJ8r53QQ5WBsM9LuAY2ulEI3aQqJZny8ctsc8U1WYrgwPjHmXVIEbl0qeVhAMQloaqWc7/YeBMVh8B/SsrmCY5rww12txpOurZ3l98TGpwGMXO2CtDFoAUB3nPkNYUyeeLOFVvR/YRmeNh3UeZwzLcBA1W9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sABG+lKtAHUTO5Cqxkxq6R2TEVtprUt9atrmsVTwQpY=;
 b=hn1LNGVyArmtE71dwRlJRY74xS6sXSp8XoukKpBOKlrnj4W4eXvhV/HIiCVxf8UMPv1l1iD+RMD2pzrqEjfd/RH7lmFfUcLQmr7kAVCEXjnt4YeK9y2JuBIvOgNJUAulc3GBEQQyxgi7xPaGnxOtKkomx0BBQ1vPcw04L8VBueI=
Received: from MN2PR15CA0033.namprd15.prod.outlook.com (2603:10b6:208:1b4::46)
 by DS0PR10MB8127.namprd10.prod.outlook.com (2603:10b6:8:203::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:08:54 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:1b4:cafe::94) by MN2PR15CA0033.outlook.office365.com
 (2603:10b6:208:1b4::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Wed,
 6 May 2026 14:08:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:08:54 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:08:52 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:08:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 09:08:52 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E8IWp1221395;
	Wed, 6 May 2026 09:08:45 -0500
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
Subject: [PATCH v2 04/13] arm64: dts: ti: k3-am642-tqma64xxl: fix USB clocking for compliance
Date: Wed, 6 May 2026 19:39:36 +0530
Message-ID: <20260506141040.1368918-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|DS0PR10MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b5cfaf-aa41-4234-48c5-08deab7901fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: KoAuZjruF4r1QqylJvQjzXg9mFVRYWCZraYVg2vv8G2iHPJ6akXM9lkU8rRolq/cJjDh7RucZP/4Xl0rT0B4iBd7NMJp7vlS07QTqkmhPrEUHuRo6UKfjMK2bAHMuX8xw7+SaF5nWe06+22MQbLZ5ln2xjJD3I9u5rLBMReML04ZmrYdQT3MoqVzd0wsT5+WRJkJluBC6Rl8MGGH9FhFWU4HzJ3FdcnL2/Iitb+gcPo7U7quK/Ai5yRO2V5QiCaA3aeZEF1zN/2aOAESgVglzN++OYR7OjiGM6Q21B/AWX8FmQ3ufMOZfJIlHF0cZD2vZXRaaWX6/Ckb0+rPZVt+wfelvtPt6oUGySH3bel5mlpkKd0PEc9kC3DtqeNUafVjc44DdwqwqzOrt2gReOPf48IlNopfagLYyk7Xd6pY2/FQwBMIoKWbS11ps3nx2eaj6s9uED3+da2qFLpaKY9B+kZgsYMTeO7FcCN+5HPQnkpl3YsGrE3HhzmcxB7A8TWF6/bYWDbDhSYRUO4WWbMNUQDfdJ62GMdKL2kHh+9TuaoIyS4+DxRBUIQMETmjdte8J1wJepc0dPA2//Mu+oRn5HK0Ct19N8bUBdgLZDaSjirEDJoeRri9qPrIbI/btYIEiK7F3BaaOtQqeq5bO18/WkudtQbR92HLQYIe51zxIvT7YWHdGIdxyudnetwJ7756bK+X7ubz4ez41Ef2dxpZenURBAGRX9CIerxsDM1VWKXprMjbKumGqiD8OLFaRpso2hpVoboVNBe5TESzbCQpqlXA+auruBqeTP07UznT2f8=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rcvk3uNYPIblNrIQm4qKtvB1hG2P4+tu19z4LLVlFViPx51SoqueS5eCvJ+34rSmqDsOMp1dhmVtlWzPPXt26O6cdpKEXZz/bF3nX9MrUaqOOPMvH8KFhj/gQf94FISIKCSA176UbWFEbUpboWmumQttdnpN0TKPPZVjSUR/1wlw0i4JO/jG1PcCTqUtnw39SYNxcgotxP2CviCePMkpd+aMlN0QM+u3nU8zp3IZNgNUr4U+OVFK+S3hhv4n4+ygwoLnyi/cKIjjUifKsH0JL2i5WiWV3JOI91EIqANGlUsdtqBq8LFlh4/LsLIpL3fDdbCGAD/lk/Jife44bCbo1Q+q9kGEMfjnss3qtnp8Z6BEWoSh6GENlONHWriSJ4pjd9/U8scZSoiQMzWqoyHq+V1/C2v3HNjD64V3BiGylNpygAYbyKL2DJxxfYpr9DXx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:08:54.4845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b5cfaf-aa41-4234-48c5-08deab7901fe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070903_206305_A1491EE8 
X-CRM114-Status: GOOD (  10.00  )
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

Fixes: 4717a36f31ec ("arm64: dts: ti: Add TQ-Systems TQMa64XxL SoM and MBaX4XxL carrier board Device Trees")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1:
https://lore.kernel.org/r/20260505110631.1144200-5-s-vadapalli@ti.com/
No changes since v1.

 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
index 46be6824dd16..e5d1b2ebf2c8 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
@@ -504,6 +504,14 @@ &serdes_refclk {
 	bootph-all;
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
 	serdes0_usb_link: phy@0 {
 		reg = <0>;
@@ -512,6 +520,7 @@ serdes0_usb_link: phy@0 {
 		bootph-all;
 		cdns,num-lanes = <1>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 	};
 };
 
-- 
2.51.1


