Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8A1C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jmqe/ZBEBlrP1T1bepn+6W97vg9czKOMLOLDcitW/Fc=; b=ojaRch0RVQ0JO5ESJeVQcXwmP6
	ZI0rinvUX6yKKdOT3J07jTP/ItUkyIuJZDkwfO1bylJ5QwxfdgBOM5+GnUnQn2GIpdoONIrZzY5Bp
	yzgTcddEbbcYMyvNp+6acPJOORHl8uOeSXIHKRZSR0GN1Mpb99oEUn8mTqUsf/6yr9yOYdQKkAVFP
	IHvkxn8HqDwfcQDsJUszmf/abfABVoUsBiPSjMY7FncUOaETQjKYKAkJtzvtpTd7SLEFTTY74VmOb
	AQE5sJibKKuFlM4pVY1JpagXjKdsc8beO1UzYuimruaA1oCoSjcVZ/7AppJJG3zndLEiKS02DY03j
	X3QZXaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uitDV-0000000AHBE-1DRf;
	Mon, 04 Aug 2025 11:18:57 +0000
Received: from mail-am6eur05on20729.outbound.protection.outlook.com ([2a01:111:f403:2612::729] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisqS-0000000AEXq-1huS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:55:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2mx01KxlLL8KxlhWQIuE6VmdMMZzdzB81K0lYSERv9Lv8nh493voi14k6OZ451nOPtgoPxI+O8cEavj0ZqLMWzU5y8ZFp06fDZCFIv9Ld+jb1/aXcScyMdCXXkSC1vDzMRUSfkOq112nbzYL/BagvgogDzBzJtjegV15MixKaVt+HYyMqnmbeztalbC+UB9+PNdS/eTQagSaAsMUB5sU+n5p8UtGAEuDQt5YjgS8WbOpwh4cfDHNjGMUD/sQGViEHtmty1DXcUOyJsK6K75W4O61gDY08rlRMexuDYOU73gQn2VcR6QzqAnuJZRM6a/gV5jF7BMapn4gnuQ2xfx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jmqe/ZBEBlrP1T1bepn+6W97vg9czKOMLOLDcitW/Fc=;
 b=iBAP6Uw932UZkCDFrzRj0Hqmku05a7pqHrGBceL8OUR7EUwISa67DVRVeBjLMnMUPcO2yEVDwfkjkMS5YlJcjI2rNPl1XL2Lh+bPNQbYNTNqFZpVB+lXc602kYqB5IYY4xUlKW2DCTawh41oaovV0UIK5m3SMZQNG8qhySXlv9zgKGskY75H0Un5UP6WmNQNIkHP18zj93H6I+UyWxlsOmdb+e6uQmK0p6T48O2+acPhC/eALjQWSQBip0KX7ksb9yEz9/RrEG6DLjw4q5vyn1ILbgl1grg7pH3Yb41NbePtno5W1O59vnFje/DUNSJWIvimlHfxuxP3izO66RfNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jmqe/ZBEBlrP1T1bepn+6W97vg9czKOMLOLDcitW/Fc=;
 b=n3VGFg6uYXtFEhxh1/KU//xqskR62Yz4Ksp/0Pmg0RI3cb+j63NU4N40j+seeAFE1SRd5JPA3UwLvpOQNPDX18Wi/43142eZ0Oc3vLffizBC9hNai4LSNT/Gx2hpwVvxYGxthp2I6nVRYwRQ0HFTFYP2so4RgTbBA2Y18eQaEyY//H4LrFLZuVSd8BLjALoA17ND26jsuM7Ho1jler1aEUUgWTtWbAvjesu0+DYHomKPo27SQR+UL4x2nSKOzSF5vkQi9B27Nq2QSXzU4ar8m9v13P4QromYMqJw9e5IttWiDgMTPHtIOEwfLCzM5wNlAiilssU6l+/mag7dw4VIvw==
Received: from AM0PR02CA0156.eurprd02.prod.outlook.com (2603:10a6:20b:28d::23)
 by PR3P195MB0713.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:32::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:54:59 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::5e) by AM0PR02CA0156.outlook.office365.com
 (2603:10a6:20b:28d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Mon,
 4 Aug 2025 10:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 10:54:58 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 4 Aug
 2025 12:54:57 +0200
Received: from phytec.de (172.25.0.51) by Florix.phytec.de (172.25.0.13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 4 Aug
 2025 12:54:57 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <obh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH] arm64: dts: ti: k3-am642-phyboard-electra: Add ti,pa-stats property
Date: Mon, 4 Aug 2025 12:54:50 +0200
Message-ID: <20250804105450.2322647-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|PR3P195MB0713:EE_
X-MS-Office365-Filtering-Correlation-Id: 142400f5-0165-43f7-73c7-08ddd3455a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rGT3A+KcKY/9zC6sz8zJlQ9nfmAhDiUiPCq2irx8R00kKThgXyfXt1D/oP9K?=
 =?us-ascii?Q?Id++C/sO56pS8sKQuoVzfWT3TxQNsozo8epI5WeVfuelHlScXUeIcVL5nrEA?=
 =?us-ascii?Q?9uT69MEOmpgx/a68mMhv2Kjrq/kePpbKMx9ZtMwyQ0NCoIMf3YRUkmF06Xow?=
 =?us-ascii?Q?L7rctow0A/7U97pXNo4ceHCZNniQve08EpXSBmcMtNQMvPB/rC/Vh/Lo4ZUu?=
 =?us-ascii?Q?RK6Ttm1kerze+dAe4t90ZVWujbQttRwrq+b52/N2VCqQYAQfirLjm0Inv28v?=
 =?us-ascii?Q?4mtI47U25QYsSebch1EgmoAHnbHVumLVRp4VHEaA2NxrD8Xos5kCkuqkXFhD?=
 =?us-ascii?Q?1pi+38np/7tyli+ZnVR/s93jfoqFZ5KWZcu0yeg7BKlnC71AwqHKGAB4xhhJ?=
 =?us-ascii?Q?1ez/Q5iWm2WiWrarueadgoRlJYtooHucdBehyJbrduT+yxgXL+1JE6ZEN3fI?=
 =?us-ascii?Q?/qcnEEcWz4Rn+pwo9nFoynaSwxEXFpunZSnDIrCgu1aYnazJYBLxTm2FnUu+?=
 =?us-ascii?Q?Eo78bYujZfZPc+U+GvoBMbKSxxTsuJbzsLRyOUyJnoT+XjXjWMbLEHCD26yf?=
 =?us-ascii?Q?eVOyBX4DI0b0STdz8BZ1MnnIDiqwHYZwmBR5qoclfAH446SifmePG2Dxo2Kk?=
 =?us-ascii?Q?ZdfgvnL5mAZ+OTLsAFLAy6YKpgZ+XxTLoLMDD9UVDm9KZUaeF4MtzAih6Zt3?=
 =?us-ascii?Q?QGaUMcl0RmqDvoojNthkQjXtAH5czCONrFBgpCI/y0onwfL/gtShyLJShCdi?=
 =?us-ascii?Q?EQIwjv0UeIeF7DMcBvAVu0dVZOma3EaaAK1bx2Tvyz8+7hCbXG9t3VASEVgW?=
 =?us-ascii?Q?tM36gvqReqbV8SAAjOCJkt8nd5ENdaZ/A+JTKmZTmm/BO8/M+uNCvxew+PNc?=
 =?us-ascii?Q?eEpGpdXWjw05rQfw4/UD1jxpXmwYrwfNuSUIVtTUgIkLYeM9vISTevugmNVR?=
 =?us-ascii?Q?mOB37EXEM/lnHUyZ+m/6kI9Zx9M9XWEGB0Y2TD5Vdh18vNlcn+Tk1yWK7pw6?=
 =?us-ascii?Q?DLjpofOq8Z2Ifcx5wODe5Pw2vr+NJVk5L76FSM92kVo17JB1if9XA0wcD/3k?=
 =?us-ascii?Q?LEWZE/R0kEjIo7grc3+wSTsQ1mz3ZDrzUGCLBImbGlWp7r36Xjbhu8VICY94?=
 =?us-ascii?Q?YChyiRxKLEb+TsOg6nidJ/315adKp/ZCZ+lnrbqnFwoNyPTlxnZO3h0jv80L?=
 =?us-ascii?Q?ypWUSUpz+NakbZ7YT3myWhVCZW7NN8IHtWGyIQ/Qs4CSZmiPKzP/O/x/9e8k?=
 =?us-ascii?Q?eKo+XTRuvFrXTefEDRIDeSuFfIGfyQpciTYeSsrj/Ajgf14ow5IDOA/cVcv5?=
 =?us-ascii?Q?h/WraSfBo8JUItS8WXsr5KD8+SLkwyyqm1jxKsU74uefni5Ym21fRunID4mC?=
 =?us-ascii?Q?8j6bNMAyo+gSovOTjWLq/3AvzvGlcczUGvQ+DX77PYc1/QKF853mJgEmi9SH?=
 =?us-ascii?Q?4BTFdTDnNnXpMq/2NLm7s/LpP+WoFeGznbB08ekUiyXG51X3kbPKe6nYLW3C?=
 =?us-ascii?Q?YZxNzhaAxPTMu3yuEs3XHRucvhVekd2ZR5P/?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:54:58.0094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 142400f5-0165-43f7-73c7-08ddd3455a78
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0713
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_035508_761759_B515E46E 
X-CRM114-Status: UNSURE (   8.90  )
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

Add ti,pa-stats phandles. This is a phandle to PA_STATS syscon regmap
and will be used to dump IET related statistics for ICSSG Driver.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
index 129524eb5b91..e4afa8c0a8ca 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
@@ -100,6 +100,7 @@ ethernet {
 		ti,mii-g-rt = <&icssg0_mii_g_rt>;
 		ti,mii-rt = <&icssg0_mii_rt>;
 		ti,iep = <&icssg0_iep0>, <&icssg0_iep1>;
+		ti,pa-stats = <&icssg0_pa_stats>;
 
 		ethernet-ports {
 			#address-cells = <1>;
-- 
2.48.1


