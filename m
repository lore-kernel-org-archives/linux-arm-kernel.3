Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436F6CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzYO6+GtdVWN+dSsFYSeTriv4zTdz06pVUXUI2tMVSo=; b=NNLG8YNF7fLu3cKg6FOFiWn9LK
	zcHPwSfjhtZ2nza3ycf+FhjBMyU2AueUd41IucD0MJDCumbMi8kpSEDlzQ8FGqy92pGxJvGGYAouC
	G2BiSHTAlCKM2nxv5escYZVA3Jo+Ujo7j2xW2euOHi1IFz7a4mXt/8TaXhsL+2MLXOULDfO4uws8x
	s4gk1EkVsa/OySAkYVyFNETzm/nOhtzJQNZ374aHXk4da+3GYsHvbW5GGY6c8khOHDKZzZiFHThLx
	hLUkQscd05L7FVXJ6s6rT8nAwicg2l7j5S4nJlQeRsUjUNOIZhQlbTvDvPDJAzZc1Y6SlU0YkSeXm
	ZdOoQpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDaZ-0000000FzjR-3LSk;
	Tue, 05 May 2026 11:05:19 +0000
Received: from mail-westus2azon11010018.outbound.protection.outlook.com ([52.101.46.18] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDaW-0000000Fzh1-1uRI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:05:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4CVT+RELxli3sB3VdNEH2ubfegk9dDEAX39k1SmcfJAfMosBEMmcuiV+TJPuzX1Ybj7awVlgcwlKNGbm06HLYgE9BANl6i/XKcUBUUH03B5PpvGP0YlAZlblJKZ90ITMDHPTCdKDAACIXU0/aiLxd0V7D95WvmdyPAiq76aSOsqWH95Y0L9r3u8RlPsNCU3+oUN8zob4Yl63jdBkvf+ZwBfLEd5d2egNOYVh8Jh+y4rC2ByoB+yVeqtT4l/2Sir8TKfmn7hk/e82AjGZuOzagePV+P3VKKW0v+NuIbJAprSlbvxvx6NjXKrI4hN1jrxa0SIB9x1INLYOgF8pVwX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzYO6+GtdVWN+dSsFYSeTriv4zTdz06pVUXUI2tMVSo=;
 b=COEW2qzwSTVshN20Dguq2Z6J7Q75/6v0Y3BV2U1jHzVNUOzN7xrNX5eXkqPSdsTQS5twIntafD/YakVdzwz/bupF5V5HzvPwkeIjVhfKLfSfzwni3sSgL7rsIvmqc018YIny1kAbbYmOpd88NXxzHTfKYEkFFXeh1ybB+sk5M3rRnCOMa39BRcSDOdcbZUIalTwDL3elCP9jirvUfQ1tZmwJhliqn7RARLOLhZk/u4MlXSsIC9An1tZvXsKVZxa3GklqAJMwNzSbXc/ZMlg8Cs41hs+kiZqia3BvxqjgMDFozrRb26dyQCT0oBVPdKmhaB2c/m7zEZbYmxButz2kxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzYO6+GtdVWN+dSsFYSeTriv4zTdz06pVUXUI2tMVSo=;
 b=N2rnB7u0iO0Y1HHAixzeIe4bX7IEjfHiDWXErGqwZ6G2uM5A5eJ9SnO4JYKdxEuU0E2OxuZN04DZiXGww4dRnJt3Pf0s7+WyCrGuJ/hngKdQC5xj8XBN/XRW6IM9fUN8MUan8kiXefBfAkcnMLE1CFcnMrFA2V2MDoPydWYv/zE=
Received: from MW4PR04CA0176.namprd04.prod.outlook.com (2603:10b6:303:85::31)
 by BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 11:05:12 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::f3) by MW4PR04CA0176.outlook.office365.com
 (2603:10b6:303:85::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:05:12 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:11 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:05:11 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645B49h72831834;
	Tue, 5 May 2026 06:05:04 -0500
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
Subject: [PATCH 08/13] arm64: dts: ti: k3-am69-sk: fix USB clocking for compliance
Date: Tue, 5 May 2026 16:36:09 +0530
Message-ID: <20260505110631.1144200-9-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260505110631.1144200-1-s-vadapalli@ti.com>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|BN0PR10MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: de5885f1-f772-46c0-65c0-08deaa962dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: fGeGsu/fgeY9lfNGxXxb+mMdP36xjNJTKFeWXM3U20qJTbSv5o0v9XOnSFjDgeVyM5hCPinUL9UQhXAItk6ztBiflBf9hOrI80kgksnizNBiCZxzRZt9+PEexPssbtGibOHnQE3WTkW6tQi/Fxpo4Jo31yLgFy/7hrVYtoLl1BDMwp6DNA/OPuf0xumb5pFPOZVym/EgwXdwlOOq9llaaS8QGUtHKvypTBU+j6G3SRiOINJnv1vr0YIkkrLTgLn8xfF1p2fh2Vh8y7SrGRCrO0VQ1WHkZSURPkgmKnVmjoo2mSWulD83Ivj25AHK7ZHjZP5Vnm2pdvjHXWI78AtsOxcEaTCg2gxNkjIVst4nmfWsUqd5kvS6L3YuHYxKcxVKbb1VjleguZ5FfSMYJ1eUZtKFUZ4otiolaJZPWpDUBJ8nlfOYP8fGCEe0ohkwekN6eQtH+eaPGrCTck14FZG7LHIFpuZElFduz8NCGgAGl0/csvHhJRICLE0aG40HsupsnPFkNky3K6fYgQYZWdgpuHEVnL/o/ryV7jhe7dh/9P4K76p2Je/d/y7hkE3B5r1GVCsRRiKRI3xJGLr4FAEhe30uoQ2VQOWrPzOs9K7oyp56mWBBdYO2jVgneqIIKe4oTUChfn/bo22ThQmyn+1U29V0TpSbyP256ocVCyZ0OefEBj6/+gk22DgdlcyKQOygL0efMx06OJeWZ1NYwZO8qy3yGiMGc+owc8b0/kxasDGpoalPOf5ZWZoYBZ4+/nfc8/+VI7cRmNcWX3hUfk1YOQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kLfkqpAPKc1sFpdYUFz6eMMNAwhTMkk1e+vssEedyvmutxGAgZWgiJAAHSeCUKSDqymRa0cu1fJbzYbzBX6kuxs507asU50ZHNkszNH3OwAnh/XFXKPcuPAwdRlSnQiz8H+dpKcqzT83uMPP6XigJX9wuFf7KYXAB6DYSzqJZ+eXrnUTLqVgBcwdkUaGfM1b/PxmslV6/hUJXXkswuqDnF9a0y8PZCm37Nv8Sb838IdiaqXrIF1mq/lhRT2zzMh3YorBFpg/DBzDA/SkmJiknCCjyOokiJ5EeMqltbOBRxVKV1RPeA4YmsXjd43kwV4it6O/EpejInnyHBfdTtc2B7deQkVrfesYyI6HUGXfDjn9BW+atMZXxchEVOJq0OOAlk6aKWmX3pyZrlMzlw5yWK2UynRPvV9MumnjqHLpoOO2ogQCTvfHr1h9sOdFM2H4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:05:12.1833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de5885f1-f772-46c0-65c0-08deaa962dc8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040516_494695_273170A9 
X-CRM114-Status: UNSURE (   9.79  )
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

According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
the USB 3.2 Specification, SSC should be enabled by default. This protects
against EMI violations. Hence, enable internal SSC for USB SuperSpeed.

Fixes: ff7b5e93f16a ("arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index e56772a334c5..0412552a927f 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -971,6 +971,11 @@ &serdes_ln_ctrl {
 
 &serdes_wiz0 {
 	status = "okay";
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 };
 
 &serdes0 {
@@ -997,6 +1002,7 @@ serdes0_usb_link: phy@3 {
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz0 4>;
 	};
 };
-- 
2.51.1


