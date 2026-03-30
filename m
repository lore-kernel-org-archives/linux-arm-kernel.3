Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE74710D14A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBqLd8nbAiNhQUPGsWTWfPFH+dfcAJ5ITxLlLX40Ahc=; b=tHQpjGRkratVIAwChSXc1OuD7u
	d7Q2WL1l4sRA36UuuUEZGIlWU2Kq1E545hrla2k4od8PJT+5Y2iwNB+hKwoFgJeF4cB7k+M19WiBI
	M8uAQvD79Odt6Gv5BtBRHcb+CDv7WgaU9Z7ywLLxFkTvDFgIZdSc3V/iqgHuWVDG44p06z3KkERTi
	BS8RkOhYmPRcFVtye16D/sxCtqOogliKFab6xNrip6nrPOjVDOxj3q7sTEZkYLZHmi+TJk6sKEqLH
	Gw62vx9gAfb34AG61fAPGo6QJlYkKRswPG8BJ+QYTjGaLaOICkRPCvzzT7ytZZhH0Aa/46FSpeXct
	su4DlWZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BJb-0000000BCke-0Mdm;
	Mon, 30 Mar 2026 12:01:55 +0000
Received: from mail-westusazon11010039.outbound.protection.outlook.com ([52.101.85.39] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BJM-0000000BCgP-0g2Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:01:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwwoS2tNnDHD3uOY6K18+3PTSNyAYXj06WfYYeg8H0DcxFRIGPObnlsX+XbikTxk7EnfIE/aA3Dtgwg/qOee98QTduyQlqI5gIkAOx0oVIK6JR1rWuwDP2g77J6DCnQ6qiVCc2BMpbgk39rm5yHfxF3x7jCIV3qGAPsH6S3h4qh/3ElCJvPHPtgHsU4droSPw5Y1bq+mIriqpd/7E5N/IvO7vX1TWRdmzldbdqh7O5F4A/917m8NejX8LG3f3QIoMdt+CMs+LYBSN9GF3gR2s3teryRPubGlbV4KV3+RAgzvfxcxSgQMOcJaKvFGCtZBJQLM4JUFYgIFzBSgRUxD/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBqLd8nbAiNhQUPGsWTWfPFH+dfcAJ5ITxLlLX40Ahc=;
 b=TWO93JeJq74Q2hOwyTMqZKlyahItfaO11U4t84loIBJ6jgwsejHmxiftIUgp+AZuoGw1Mdr3GE16Zx061xakI+05iViW0TvZIsWYhkTD96NZuHC1rDNQ8S43CTV/zIqvw6CbsrW6CWB7O5Wp9c9XdWht6FsrXwjBjaeNC5CveY/+2MU/x7cVuDzB8DIVi76m4jwFiSaZVDyDwlll+p1+T/vrnyf1byTPS8n8ve0vBu+LVeNRXyScDDyQgpddbKcKB1XEPI30mvg7INo6z96UI8MRF4O6Oe7PDi1uITmOmfQMnBKGAJaN8fWFcxfzKub9DyfBcpMQSKE7kAAMjyBfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBqLd8nbAiNhQUPGsWTWfPFH+dfcAJ5ITxLlLX40Ahc=;
 b=TnkRJufBEfWounOPXmJbpG51R+4kKcakBfHuE4t98VKg+r72q6YVCS5B2ICBXPfnE2FwauClVJU6sCz5enA1FL7aQ102tZl/UNYvwc7ybwcAWL56dH51WDBZ38/tkbnd40oe0ZdTIQN64Kv6qwbLwCRWqCnQxZUB9alcMVuaRoQ=
Received: from SJ0PR05CA0061.namprd05.prod.outlook.com (2603:10b6:a03:332::6)
 by MN6PR10MB8191.namprd10.prod.outlook.com (2603:10b6:208:4f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 12:01:34 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::1b) by SJ0PR05CA0061.outlook.office365.com
 (2603:10b6:a03:332::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 12:01:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 12:01:33 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 07:01:32 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 07:01:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 30 Mar 2026 07:01:31 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62UC18tF242506;
	Mon, 30 Mar 2026 07:01:27 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<rafael@kernel.org>, <viresh.kumar@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>, <d-gole@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <k-willis@ti.com>,
	<a-kaur@ti.com>
Subject: [PATCH 3/5] arm64: dts: ti: k3-am62a7: Add ti,soc-info to OPP table
Date: Mon, 30 Mar 2026 17:31:03 +0530
Message-ID: <20260330120105.2985200-4-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330120105.2985200-1-a-kaur@ti.com>
References: <20260330120105.2985200-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|MN6PR10MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b35a42-2389-4f2b-4f8a-08de8e54164b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: 0OhmHj7A+z4yDXHqd97PrIGj3Y1gzWhyOPBdvLg2yyOJ7wY3E0osSfno9ygCkY7xDu0iOVoylzwOnR4VTIvBcJ/E/LSCsbjofcfCr6mZ20dJ3ctCw8AdFnvK4clTC2h+9dj/ggVgHfJCgXrJOAFKkOP2MTWsiDxvlW6Mu6iG2Z0NG3LqKPyRdED8sBZwX4YJdTLQNcqpTLPkaxH3JU1p/Dnx+e0t94gFo6uo6slFZp+Q+uJop4rMP0l4qWuAptf9mZTanM7lC6Z20K6e9ZxHPO/myHNIgLXVZxL7+a3fjKyTKmO49QE9roZjHcHoTXKgjj2j6neZa5xeVEAOmpnj1KdssjAUjSq+dg73lLWp8XBLmtDBX9xjJLESirgoMnoCUXTdcOoYg5Tdo0Y9CkVMs3qPNQS0lY0y1Pe8g2j0GCviF7KRTq4DOLeC0HsrgKz5/5aXk+AUfjw5eNxN4hzcJUXgx997GvsOnYoJTYXzNSVoldRNZ8Bn98s7Mx+3Cdy1AYzi4pv5Uz/+69mk0CsxJRdlMxfGSrElZyVNpXziklMYdOAIX/MKS9PyO9iCkDCvvF4hBg9c659YDV1FVhiweF0OpTsilNDvXSpzh+0/si/NqnW2v8GSkMv/VjnHyTKMtZYd8fuLGl1g2CNnttXj5hwdD1s6R8r2g9UfrzWWSBqPFkVz9W3Mk2D/LwqfEmzXJQMp8Q0B9TudaJWi2CaxmDRtN2+i7CJZVbSMPRPVMONh/EukWTVRtuUJ7lt55Htg5sMZ6IXFsJ4XA9H+mG3tGRep+Mb0KZzvklhY2f5YNfYHlMC8DzC3kW4iSvQyiAOn
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1ftRpa3LlbY8YUd2s5VwRTSKinvFFYS1DxLSgrChYkf54eGU3vIUAR474yaNwUIjzCfEwAq70C+ibqdbsjvB2CkOIkZMg1Ne0+vqhABei5/SRH3ZygEXJbuiA9cR8I9647ofk9s7TqfJFTg7fjTo5R/K0g8mdRfJ1b+spsAHIi+NHt67uzuADPp9PZWf92i0JgnucXDm4FFGH1eS83Ug4pZEAa8W8oBxeLqr/y4uInwtNCUQ3FfLXjBEjCaEzOkWI5YTWqr4XCE2UodOZfHvkVkzjmm62Q+T1eoSg4SmiNqxykF1enZVAVU8S+AOXhb2O0Iz5hscmqp5x6whSlMoGS7rlm8j2xo7VQ+12zxrF4QiOcpo58R6+A/SvWcse4DJL5vhq8+6oClNzBMAhca2Wbwtj7kONcm3wlh9p2I2FmTDryGxN3drnldDqg4h/LrZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 12:01:33.4359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b35a42-2389-4f2b-4f8a-08de8e54164b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_050140_201487_5DA6F7CE 
X-CRM114-Status: UNSURE (   8.73  )
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

Link CPU OPP table to k3-socinfo driver for dependency tracking.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7.dtsi b/arch/arm64/boot/dts/ti/k3-am62a7.dtsi
index b6e5eee99370..6d1459e9ea71 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a7.dtsi
@@ -109,6 +109,7 @@ a53_opp_table: opp-table {
 		compatible = "operating-points-v2-ti-cpu";
 		opp-shared;
 		syscon = <&opp_efuse_table>;
+		ti,soc-info = <&chipid>;
 
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
-- 
2.34.1


