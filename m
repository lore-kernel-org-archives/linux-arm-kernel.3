Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FC4CD4F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 07:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUG6bmMn3sf0+eAMTxFJeYgEa4J0mA7vzNlpoX+BBiQ=; b=VuL/yV0/sA93/XftB9YJPz9QXF
	QPu0nOJ6bzLykl0gugOyRBOrZWN2qHMennd5y4TwvuXw50Y8KAbPN3PgxujgVeK6IW49ZuF6a4Ccp
	E4sCotrTag0RyBUzIn8Z9lTaAKKs16J8oV9bU0qMEPyM62oF2UwUHTqWfH1p/lKnwugyksFOTfgGN
	TBrydZAdwBMn0FJJ8PTiKzNjW0bHWYq1fnVEkfCnHfq9cPn7jdfR12Xbk4jOBWZsq/hHwWanNidDJ
	j21Ko/QU734X9Uwg3PFmLLzdHUHDJruihLlCIgzDurX4ddiLzZAKd5k8mrIeNcRoqqM+/M+eSAY/x
	Dq0jUWtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSFF-0000000A2SE-2SXU;
	Thu, 13 Nov 2025 07:59:53 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSF9-0000000A2NR-3bB7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 07:59:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6/lfOpKfsM6tMT9gJp0aR00cYMwcdUKSTp3vDPQ33AZEKUk6abdGuL/G5HuPbhWPhgMCXkspPbfR2eid5KvzP+j1qx/kTrBqWby9c+mw6Hp64KYlJgMIvQGgEdIKnvkbLNHyXrAZ3hGA2BQo/dTzP47ot7o6Tp2Y6so5GFg+rBn+p3lm6E/A9Kf+omZljXGX1xiC8PxGHL812v6G03vImGhVqmdEA7IhqECUfkxtJDOz0WDl16YJhrrMgFFUC58WnORxj/adNFvAjdp2kDPQtT2kpCouF5bk3eGNASG9+E/PsMQFxuNiHk+eVjU33RG86zsWCn+U8sD9gB5/fUGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUG6bmMn3sf0+eAMTxFJeYgEa4J0mA7vzNlpoX+BBiQ=;
 b=J6bPPeN5Od038LFG/20cgbmQJFBnr4wP0BUvbtF2J9aGaV1md0wJ2Z7CTF2EGvKKATcV+2uZDGj7m0kRpuMMzkgtmMm+29NBWncAWNvfgYUlMklzawxeVhXGDAWs8qQVjygfMZ7l5rwY9XLBVQFS476523XsHc32UFqY1Z0VsCWnNQZn+cpxx9jVfB6dWKt3NxX9M9v+Se5tBoz1BgMXtZu2CAt/lx0fdpXZfr0V40NGAEzTO583+znvSrsbAa1Mc6p6Ui8x/nt5zq6o5pI/Uaj1/ltShpRAQLOYCnf5EnvxOZl76gJtyjtceo5L+Tvg9eIembQdu1G7Dc5EYcgNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::22)
 by SEZPR06MB7121.apcprd06.prod.outlook.com (2603:1096:101:237::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 07:59:37 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::c0) by PUZP153CA0005.outlook.office365.com
 (2603:1096:301:c2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Thu,
 13 Nov 2025 07:59:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 07:59:36 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BECEE41C017F;
	Thu, 13 Nov 2025 15:59:35 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v2 3/3] arm64: dts: cix: add support for cix sky1 resets
Date: Thu, 13 Nov 2025 15:59:35 +0800
Message-ID: <20251113075935.774359-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251113075935.774359-1-gary.yang@cixtech.com>
References: <20251113075935.774359-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|SEZPR06MB7121:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2ea27f13-c9fc-4b65-aceb-08de228a9721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DuPTEYHLsg4r/PYmN9QPyy48+dkbETTRkYfYETqqjdjL8Z4kcWX4iZFPeYIA?=
 =?us-ascii?Q?by/tcvdmGForiawGuTUAObStbljCy1yz8RHCTvnCm8n+Vczxrkta1bl2rlrv?=
 =?us-ascii?Q?IHmD99euAMtjRFWH1zsWbd5uMe4P4FVMK39uF4WE+RvZ4t1PgEy9zQ/YskL1?=
 =?us-ascii?Q?gHZiKNbpE0qU/r1mAspshlN8Y2VRdCFCkFJv16Co2l4sF6YQrd+/VsgV+ped?=
 =?us-ascii?Q?fR9hpv8PrLgI4+fewzPW2aaa8lVBjsb4Tq/PX7RMgDOcJUW+2AmQhl/khPpA?=
 =?us-ascii?Q?W2DBCLfpqqn8aT6phzInF2yjoZpeSNL4m2500hTZBJIc29wmzXRMVQg5BDJ+?=
 =?us-ascii?Q?PXQszVisVQrzJvk/T5Us1swrSW92R6xtIiDl3035Om5EhIlO341OskGL5qcV?=
 =?us-ascii?Q?oZLpayLLuB7DLwzeUjdi6pYf0vpueTLTjoV+UrR2zrTFMago9htS8HD9SV0f?=
 =?us-ascii?Q?EJy4uH5lCvO5D01wXoRC+zNdUHgtF183olooUGDWq4qZy610zDAKIozSy/dR?=
 =?us-ascii?Q?yfoDqXBVOQNueJJYVr7ngpsg3+ZzvNxIcOmysEE5Y90tffOpkGcrEH9XKNHk?=
 =?us-ascii?Q?ZaPgTMOAk6LCYqSA48p5x8du90/ahPVXAWgSUVtpQSDUpp9dVcNxcGBB7f+h?=
 =?us-ascii?Q?9Di7qqBo9M+UvhzLR6FQLVl+GOng4femSSM3CxYueZKmwfbnc8ddtF17CrXu?=
 =?us-ascii?Q?ZFFymJ1Jo0iEOIRHvzLzCByh8H8jqkr28OT0AVdsWMLxd0PuIpzEpd9Va4Gy?=
 =?us-ascii?Q?HqS8/8vOuudo5ZjciXsWZN7ZW3GtwRat2QDrx0wGxbw7qch4H5tJKWmCcylq?=
 =?us-ascii?Q?WAB11od7pR+IDOlpD8paR9p/ugfwt9rFUdpC+HYOXYm+Y8DpMR08nYCGOEgf?=
 =?us-ascii?Q?t0aphdOUzov+IGqKPf6SbanfvCVIf66p7HJjcp2gCREhU5VesioZKZ0dsYAs?=
 =?us-ascii?Q?Gr4WHZl/5NKZ7l9iyLjOWgI+jPneKesbnY1mhm0rB6UTeNM+Ilww3cQpV6QS?=
 =?us-ascii?Q?wyoEAe/Aa5Y5UNaPwN9IR0jO4AgA5wkJ7Oz8iAiO2FNiyFuOYdgI2YfH4oww?=
 =?us-ascii?Q?CUIKRmN2YucL4bnQMSupP/lekRQCQJGZwSRlpM8ss0ouau7C8kgTxGfD3RPb?=
 =?us-ascii?Q?GZxaxk5PjJPPf+rneCxAK2V5LnYcAh9XIdOwu/yAwcjwIECMsqRy2IziRjPZ?=
 =?us-ascii?Q?Cwk52wQI8NzLgT57Yy/n/G1SC9WKGQ9YzCLKcCY49V5GazKe2+ILKtdGeuoo?=
 =?us-ascii?Q?ubslEke5Fnqpj6korw2jyqMTN0CDetaz87LkrDSvSjLNuY0WNys8jXNIDVTI?=
 =?us-ascii?Q?yGDRKjDHCDiThBbcJmSwSCv4/6twoj4fTI1eTltCPT0xd4bMV9Y4GJ90Go3q?=
 =?us-ascii?Q?V/JZqZMP2xpvhb8mJCaCYXsh93AsS9qjGZaJIxcAYhP+U7t4jlrq+o5xAlSw?=
 =?us-ascii?Q?t0m3LdXhiDKhXCwRD9AM0Zd359hkipeAYy9kfW7sjItIRJm183p456FXPp+n?=
 =?us-ascii?Q?pkr4ihMnbfWc1z2C6rJcZ32FFG8cYUjZKUyeUYa03M52WOoUYueoAt+ZlJHR?=
 =?us-ascii?Q?vIXbf8R023kF//hq88Y=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 07:59:36.7134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea27f13-c9fc-4b65-aceb-08de228a9721
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_235947_906069_0D173F28 
X-CRM114-Status: UNSURE (   9.02  )
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

There are two reset conctrollers on Cix Sky1 Soc.
One is located in S0 domain, and the other is located
in S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index d21387224e79..157672bf5dbe 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -348,6 +348,12 @@ i3c1: i3c@4100000 {
 			status = "disabled";
 		};
 
+		src_fch: reset-controller@4160000 {
+			compatible = "cix,sky1-rst-fch", "syscon";
+			reg = <0x0 0x04160000 0x0 0x90>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-iomuxc";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -568,6 +574,12 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		src: reset-controller@16000000 {
+			compatible = "cix,sky1-rst", "syscon";
+			reg = <0x0 0x16000000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-iomuxc-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.49.0


