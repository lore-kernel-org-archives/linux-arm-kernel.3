Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D03FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bar/ljvd7nPiLEOci2PGghOx8THrPZgdyhfX26g844=; b=vwKYz4PEFRo7VI1L+TaxT5yvvm
	HFq+6JEM23EHhK23OoaOEUKHYak9LGiyJxb1aq/Bu/de0qMfiUafqilbtyr/ryYTx+AFL4ysoR67A
	OvMyQs8utL2MglU5bwPXDxUCRbgzPX4H0dPm/ETdk8zOQB4TekiSj+7zuHSmwU3yBonbaTdNas/ER
	188DRurK+UuNRrttPxOt9h8a4CV8r1yGt5iZSEG9E0tKkDMuj1Ow4tD0Gv8/HczTNM4IBxuocrRH/
	gxOugDXaCC3WVw7CcWnvBZPBrkFwY4C+ViUUnVeE3oOH7X8fOeoXdAaVgtaDGMpNkhOGW2ESghF6v
	z1Zm4b6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDaK-0000000FzYD-2xeb;
	Tue, 05 May 2026 11:05:04 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDaI-0000000FzVw-1V3d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:05:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cr50jC/XzCy2C5DAXfOpu19I9RanoJqIj9fwaO55D9OhqHm2QLGm/sOlfh6uL/ducpuxpH65nOOaboH0+IzcmV71sCvza1fFs6F50kYk1P59ErADWrPfw6AzZKl2XLGGQ1t2huZnd43l2JjgqpJsEOtpVKU9vl281UJKUS9m/HyJSPKhNIc5STwtkTfbudQcKAVe9+0O3VaKPaDez5PLShpmCFvKjB3cMAqR0XOZiwir0tGb0ejD5aKTzxdVtiUy4EYhIElrpE8QSVIfga9JQi0Gu6Ctq0lPAqvzH61Mz8XZ9HeXvBITrDG1qHyqH3L5oWWZk7ubmCTp6R9T0wZ1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bar/ljvd7nPiLEOci2PGghOx8THrPZgdyhfX26g844=;
 b=WarI8espnmpOFaFU/C/HKFK2kLKU5IGZROf49eKCO3wG7Ym19Ds53SI/9OMhfKTwHHGLTUhdDHyGxYSEdjKM1zT3MefS+Dzw6H5r1mTbLzkJi1Deolw0cRAGvfy774z/H5qAqzlveLfiECTfBNjz67iNpVa5kuSnJ8Koz1/otzIp2qRNDxGeeaCN09Jf92RiYY7y0WcbLaFGbWa73W8tkLdh5zx4BweQAcIbKibvYdc28aaWtj4p84KYckHmZIROrJHV5I5sFyJH6yo8eBCD2i9eBv5NtP+qXDNtTOfo+j/bSYuhxN44QVHHT2hLrp7g2QZokimCufmf4KzdkQxexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bar/ljvd7nPiLEOci2PGghOx8THrPZgdyhfX26g844=;
 b=UgXVrE3s3wGzYQP4gChgLMOzDnJtf9FK8ObgD9rTGKWhCz48d3L45g/G4xEOeZciM1+O940cl593YiQ2nlbjcDNukXKF/i8I1Hr8MI0qpPgQe/1VtBc4d4wsE5knRnMMiEvd2IOVYBXzD6XdKq8XsA8fXcpEd8V1YQrVOPDx878=
Received: from CH2PR03CA0008.namprd03.prod.outlook.com (2603:10b6:610:59::18)
 by MN2PR10MB4383.namprd10.prod.outlook.com (2603:10b6:208:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 11:04:58 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::69) by CH2PR03CA0008.outlook.office365.com
 (2603:10b6:610:59::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 11:04:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:04:58 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:04:57 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:04:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:04:57 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645B49h52831834;
	Tue, 5 May 2026 06:04:50 -0500
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
Subject: [PATCH 06/13] arm64: dts: ti: k3-am68-sk-baseboard: fix USB clocking for compliance
Date: Tue, 5 May 2026 16:36:07 +0530
Message-ID: <20260505110631.1144200-7-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260505110631.1144200-1-s-vadapalli@ti.com>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|MN2PR10MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eafe7d5-02b3-4af7-ff6d-08deaa962565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: Izgjs230yKWWNVhCTz01CzSmh2nmbYG7raQ6geIUi72qkSaY50n0/cJfxo4vfVa+DXkm8U5i4KC4kTLWNWzWpcrAd0Zm7OpSRMHRivVeUmCle9T+gIx8xwEtm2QMPxnUM0leDi1FTPcLfLiKsvwaGrJDVPFXz0Dg2YRFUSQgNoAZvLPl/94UgD4bhktbiDvT4pCnUAYOhy7zxutJ5lt0DJ4j92OviP/MON79dqJYagZYOFsoF+SqtcpQwcuca3mCAyiPovMKKJsBcM9Pf4q+TR6KpEd9L/JIZ8dGe+0hiijhwgO33nO5cOQFmoVM9tRtCwDnf/rlMEuZ4gPAW2+cyaOHh7aXbIYaFIUcPay25QIJcxlMceeBjhAyame3+VrlOX9BahKQOnWWEr67/uujrvfxkIw35xnbKmnGX/y0gQJfsoNZuLqOZ/eGVxzHnRI3jVaJXG2FADDPXuF8T6YkHaaIIt+OL8T0My/wBlu6Yi0iw0+3U0ubXIBst2b/f0tCRUUdo0jMWzWWYaEzeSb1xEBqAgAGWdlp0qNDuGErsBc+msacOBykwbwHvO8yo9+TBRoFQURQTr8mjDoR7/2eOAKgHPznQ86AzAZjdctDuo/atqpENUroH5allzu5FgECh4XhKkrfbkzE5BS1gdtCohC2UDWI9VnYlHSNkZCQgE1WBnLuPxLWqX3tvRMoeP7fcK0LmEWEdbqDONX7KFQBX56zknXdFmDiDWFQb2WJWNzn3/wY7COlNciGsGA5j/40xX470gB/yAisy7BJrYf24g==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mvekPSUaXskI6vhDImF/y+2GKsvRAuLvtDx4h7pmLeaLa8WTljVLjnjvmKmq3IMS5qCcfZnARMH4p/o38wWmwV8r1ylY7CRtXfiQo2lRaCEBZGBBv4O+clQ8uFs4x7ugphlcubz6pflE9YoSOVvmTp2g/qf5PIpvuS8ImFZlwViMxI849TJoTGGjNgSS3PY7hv/z//hAZ8/Mz1aEO+MDqPWzsVEp7RrHb7vj6/zzXOgy5lQXt+EgvU+Ad6zpo3wfBqa7kwkMFKIyiDJZW+Re1oHiFmnn4Xmjkuw9VRfduRtgQCPaktwL9a/gWo3pEEyAjZ6McNI6wWAyznmEdUaE3HDFtGl4i6+DkiHatzQsKb+MuLi28oHyuMM8djUs1zd4y2SX62ShaR2euLcBM3JJBRYx/wX6jzLK4kLu6huTz8KD3RAXfgMJAlv+bflruJ40
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:04:58.1399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eafe7d5-02b3-4af7-ff6d-08deaa962565
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4383
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040502_403400_D70EF48B 
X-CRM114-Status: GOOD (  10.05  )
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

Fixes: 067878e6cd25 ("arm64: dts: ti: k3-am68-sk: Add DT node for USB")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 8178333fb2b4..d44c3685503c 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -793,6 +793,14 @@ &serdes_refclk {
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
 
@@ -810,6 +818,7 @@ serdes0_usb_link: phy@2 {
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz0 3>;
 	};
 };
-- 
2.51.1


