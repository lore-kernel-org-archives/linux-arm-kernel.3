Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10CBD58E62
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpDbCuK/g1lKjtT/9XeCqkJmcDgjO7aNH4btcOXV42s=; b=BiPhaDvFOGW8sI8x/WCahhw1Jt
	PK5mBiEKqJteSwmy9ir7zpdEs6fVoC256L/MPI3c08MPTQ54mKX2dMP10JM0muVGm9AB8GKdtkadl
	46Yt8Bv+x7moEeQaSi52skG8Q0faYmXim9BZVKpc97cg9jyQv1YUlBJEh7P/g8NPQ1Q1WoAM6A3Q3
	AK0JuFFbT047B8rhbjghnsvnIo3RMTEwxh+6myl3/Z+WyWIAZJdMnaWVSgaJu85PXynsYLYYQMTU5
	KrP5nSekjAc+Po/HMygkvJ/DuWlC3xMld8rrDEvVuAQNuUC5acUFqqcAn5IRMDb8FmDM3Ufk2QVn3
	8ghipdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwx0u-0000000CLrc-3yQg;
	Mon, 02 Mar 2026 06:44:20 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwx0r-0000000CLqC-3m6V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 06:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdfSGXirroAsL7+dynVo9CODt0u1wJLoCHyO8sOKte5ivg+PPGHhK2KDTLhE1vZgT4V5RwT6dOmKWRO7ee/Jfmb2yX4O3leAwB1Y4l7OZZrjj5sIXKx0lAUgpbYp548voqywwlwPfpNckCuyul+CUD+IWV/S+a5/65RqMAq5kagjzWksm9h60Hkek98s+YRQG7eWlvD+nY0GB46NQd8IFI0Onloi7MTo7Bg0sW402owdtWw/ok5/AXNOzIrwNhX3SJsKyVYVgbCtSJZN4B5DNhopPL0s0REHhSrUP//kWNZD3/ae4RFQ7nnefGqgqhrY6FKHQphQI7FC7+Czf/4E6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpDbCuK/g1lKjtT/9XeCqkJmcDgjO7aNH4btcOXV42s=;
 b=H0RDjuxb/MpUGBKlBQJNj6Gf56n+31K5dsC+4oDPFlwcdhCcpZOZY8TFI4eH/WzRXKptwEkX5ieCo7XS6GrQZBnr0fqgvLJU2YMVp6YKDhsnNhdvzvFOdM52mLSL0sNI52kTafMUYtIBuJQES/g2MlsHvC6mHeZLXigJ/up9AEQ/RuMrhaOX5S7MZLf3N+ecEHIMHtXVcl3MfgXqVphnTEpobVYVZM/xVkHARGohiBaGSU+yxdn4KjFE7HMMyLqFMS66EHn9R9mGYTqtK/flsA9+uLN0kGuKWFS/gtYG8xYjQyHn4GbOu1/Dp9EpYgVFi6Sv9QeyohQp1lpJurPw1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0086.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c6::6)
 by TYZPR06MB7172.apcprd06.prod.outlook.com (2603:1096:405:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 06:44:10 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:101:2c6:cafe::6c) by SE2P216CA0086.outlook.office365.com
 (2603:1096:101:2c6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 06:44:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 06:44:09 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 57BFA41604E9;
	Mon,  2 Mar 2026 14:44:08 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v10 3/3] arm64: dts: cix: add support for cix sky1 resets
Date: Mon,  2 Mar 2026 14:44:07 +0800
Message-ID: <20260302064407.1914014-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260302064407.1914014-1-gary.yang@cixtech.com>
References: <20260302064407.1914014-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|TYZPR06MB7172:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2e2effe5-57a6-479d-d1b4-08de78271bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: RmESRmRgJxv/YBS4f2KwMAzj3piwNja+e338MfmiAHfATets7cEZNY0aDooG9yIbhkYcmsk/w1zyoHD+4ZkwqAjSDnNkdg1bValI5p3LQqDUYtt9/u/HXlON9DHqHUZQwt3vsppJvpwnOdSYmSA52lUG4D1kQ5NGIpvq4PYJBKUh/B4isM5fhUoQ/PObJToIqHLsmpfZi86/rQatz8KkIrx80ITganfXG8U6VgGzJG9QqTjckrkawDyufotAjpTHYe47oq1dtdoiwoOH/PDTbY8wsSYhl//r4sUFfr/qZpHYLGB15CkFggzUSXp3Tb+hXMaoAJ1Y/0AsXwnjMd7VXcFOzoRN6wXNXwJkpQeTzoqG20wZ3z+4OHNNEIBId7i9gqTIDZ5L/TYHgMKfcFAFXSiWmr+j9AZVJ1jTX+rYYqAyU2VutZW+Yw6g+pxPve1VkN3tsqambXqDjpqSllheTizheuMmFay7InZ2DmmUbqHc/xP24dfuZFLcwBgks91veRe09dX9L00Zq1bb01+aBro0kysDO9ZSgPWaK7xjZidW+bU2R9NRXbtEre1q2rp3d9BzgOPECSuGt8EQOHaEc+axbb9/s5nhZHnWAiw5DWF3P+/DYdO/A3E/7aGU94E4zlMrg6XeRAgbM2rrlNRS5UgaFRnQXK4m5yfK/BxMIjbg5N9FoBdpdyGj2ZF8WzIhcPjhpMZoUb1gLdVupFM4LgumHP80zNGRxxFz61ShfoasPX2HfoTZ5CVpygeEtTX/BJtR4Vyq/5yfRKvD0jgyaNEnyeVY3Zj3H0+RKSrahWj8F3cUi4rGBz8L1z8W6mao
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: POgeq6+u+oWYBi7cT9kY80orGLLgF9aVk8k9RZTejedp7N1M1IQza6uHm7d+G664pjrGBFJBERw7vN95Kj2xHhLvDu6DoAtpndqVjC9//cNhVrbdU1TrF7XC3f7XGP3COEZEjIZ0KVHl9U5kzUl16HRbwXgRC64p0zI3uQyOnQca7rW4VbvCgVXFQvfKhRIgtuf9YMNK7bOOuyeAGn6Oc2laFwJECe0UkoZw39uECgskgfMIarOehRKdIzOU2LgQSKYpxb5uTF63bdqd970Ta1pVfcWutaQyJzCdWnc9A23sZW6J7XR+WlOuyWutAPcWojwzwXf/i1GtPhG9zCnUcQjFUVOOrUd5Oq/Fp0IUXsRFQqfgCko984PVKOwQDAgG8ar6+iFr7DPntLmz3rP3vaL0OwR29dYO/p/Y6Ysb43VJ/3mVJtIRfj2IOzwauwsz
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 06:44:09.3288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2effe5-57a6-479d-d1b4-08de78271bb9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_224417_970465_9B635F6D 
X-CRM114-Status: UNSURE (   9.24  )
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

There are two reset conctrollers on Cix Sky1 Soc. One is located in S0
domain, and the other is located in S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 64b76905cbff..a28b877cced2 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -348,6 +348,12 @@ i3c1: i3c@4100000 {
 			status = "disabled";
 		};
 
+		syscon: syscon@4160000 {
+			compatible = "cix,sky1-system-control", "syscon";
+			reg = <0x0 0x4160000 0x0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-pinctrl";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -568,6 +574,12 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		s5_syscon: syscon@16000000 {
+			compatible = "cix,sky1-s5-system-control", "syscon";
+			reg = <0x0 0x16000000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-pinctrl-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.49.0


