Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E34E63C8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjoOo4y7MbEaHfhOl51+3TUyXUUZ0cuhmErPfi8+mZw=; b=advN4GbYeAnh5p6f/GCr2PvGk6
	uey8AD5DSGRZXULqAI/YRt59PHTZZMU1pRwbLRVANFe20qeJ3nCAvN8LHnWQsA5Mfqpqk+jE8Pz6A
	ObQZ1QRMpMl56am37gtbgoG4mQKbxh8Um7mKjFz3ivGQ9SrFc+lmPMVVe4hKUguZMaLTQcd130X9Z
	WCnfwW34YSxUDUtZHLTaCplV0L0mFKiq3uzMl51wdWgIwJ78yoTL3L5mdTHlX3kjrzHGXaIml2kGX
	yzybJqDgCGBjbClYvOnNVblbzSZ8Y+AtXfOrJCZplUpRCOL4xAqHNdEU0W88YS7CT/lTgjTTGDUfO
	XWCKmvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTZK-000000005u2-2yQ6;
	Mon, 23 Feb 2026 10:53:38 +0000
Received: from mail-westus3azon11012031.outbound.protection.outlook.com ([40.107.209.31] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTZH-000000005sx-2qk9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdeqXY3YyNOY8+8E9Ja3C5GIzu6rRbYLyoiqxnXX8HGoESnfof2ysvXADd8ZaMEh5HCB4MpBuMqm9lZmxpPkmG/pwzs+8Uv/VuV1g4uNUdC9Yuv0JgefH6txy1F68WHfrMTmaCZAxaQN9+2pV68ELkN4umw+3X1agEv+XSpGw13akXCI4353vzkm1NDaLVh4rmlXdJUzr7tfgncOZ6A3LestNEfBuERnJTrUHIuEuZFdQ5gRy3XG8CVa4ek7pa7ORhGaxG98CdsSrIH45/mMfnggH2YublzAcYUvB4AZrbV/2gTNLsAMaqe25P9XoDRUvfaa+T8FHG/tXhrs4wWd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjoOo4y7MbEaHfhOl51+3TUyXUUZ0cuhmErPfi8+mZw=;
 b=CWSvkP1wtsoB9742+imKoVYqNFdThZzJmQi7g0T8HH49em+t1McfZlvo2L/4JnllekmDWSip0VuIWtMf2G8M3Qq/qkG9odH2x/b2Hj/NkkkIdjgqi4rFDQoO8v2wkoJThYou4tQRTHL0Ucvh5bWidLUqrKHp0BtVH7jhZF3D6f+8evZ9m+3G88+8l2Pbf6cbs/Tz3zmKKAgqo9b/EI2bDz8VCi/UAbETDIu7AwpB2QgvCzqOL13vga1FZT3BRniJRIWWKOCrZzeg6GXtz/gnajBczXoKXjfV8drZm8mQ4V+Eyb+UO46nitEvfGdUShEtcSQaxzuVWeCJSD1nCTiWrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjoOo4y7MbEaHfhOl51+3TUyXUUZ0cuhmErPfi8+mZw=;
 b=ue5Pa3+UirOdXScAqMrKBnlNCBHVhPw+c2emrpcep6hi1aN4j6DH48TeSc9UVQMc2LdsNri5jIBRyqgQP2P+marrXDAVdQlpWXvOidP4o/Eawp41X5vK0LV8pbra241msoFy7dbz7H+pMRkqxQe3yqVpbbCwiwfF97/pTIkfbgE=
Received: from PH8PR02CA0004.namprd02.prod.outlook.com (2603:10b6:510:2d0::26)
 by CYYPR10MB7649.namprd10.prod.outlook.com (2603:10b6:930:c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:53:33 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::4b) by PH8PR02CA0004.outlook.office365.com
 (2603:10b6:510:2d0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 10:53:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 10:53:33 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:53:32 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:53:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 04:53:32 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NArIFG179443;
	Mon, 23 Feb 2026 04:53:29 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 3/4] arm64: dts: ti: k3-j7200-common-proc-board: add ti,min-output-impedance
Date: Mon, 23 Feb 2026 16:24:14 +0530
Message-ID: <20260223105448.1110428-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260223105448.1110428-1-s-vadapalli@ti.com>
References: <20260223105448.1110428-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|CYYPR10MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: d56c4642-54fd-4179-3bc5-08de72c9c9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sS2UpzCb1Bu64w5nculZfwBZfaqWIukhmkmCuCJdPN1VZNbg3YuZjG/reCXG?=
 =?us-ascii?Q?ysA8y5RZogc3HFWEreaIUItniKQh7HAr72pBIEqcDxyzy0qFY07Krrx1nRHI?=
 =?us-ascii?Q?f0HkVJ2dBl60BRN0g+tBWyOHSO/3MBMlTDz4dKeUjSuMqO63dLkAdnfgml4P?=
 =?us-ascii?Q?1U+9lTesVrVF13DgofdhijYK8bJXjkKAoSbdpJzrvKkb/jSNLqtW69Tz41hm?=
 =?us-ascii?Q?Jt5LPIY4xMkegzmSwU9CE9THBecxCO5TvHTbEFqGxAlE8+Tn6PXEsaPUwa2m?=
 =?us-ascii?Q?A3hbd7z85SMprHYAuhGqKDJEol2yj//sD5RBobgailRxnuYqQGfaEgposi9g?=
 =?us-ascii?Q?T7Q6L1DxNxIOO5rHe7+C6u/XjpBPcHKr1zlfLo+cTerYDaWnVHRdBYRMqDvY?=
 =?us-ascii?Q?P5xc5k1yx2GcQ0Sh1NTVVJcrfOZfDcnNhrA6Q1jU6QxxhwiklyVj74zl6DUA?=
 =?us-ascii?Q?EkJ9HWeFA2k1zMhOcC3+qBoMmNZchWgq6DjDCFSlyaPhYHLXyLILapij7VIJ?=
 =?us-ascii?Q?s46xET5lNwdoGyv0Xk4o+HpxYM8Z4TBznU/EKNXDAkp1apIhggMX060z40wp?=
 =?us-ascii?Q?fei/Lvh+wgLcw9MnqE9QYuCci+2jycvjBGLt/O6QnEMFkG2+U4mLoofhED6P?=
 =?us-ascii?Q?nIJ5Db95zxJLQBwXawZNBpvX2IvxQUfsdl4JaeJbHJB5TaZcRUHdaicBkGTM?=
 =?us-ascii?Q?i+AcGT9s7EYatmkUORZK9pLJdUeYDjDXc9OFqogXFep0QzErF7Jqd5c8uYQr?=
 =?us-ascii?Q?GIFQc/QUqIrc6xkiyjeFHW1UG3BiwZti0RBbbKVKSNy7/a+Eu8MgnYDWZTyL?=
 =?us-ascii?Q?s16Y9RmhksVO34YUhH+AopK3JtS2PNFKshFws7YZo4b2bEkt8RFjizyFh6xZ?=
 =?us-ascii?Q?fzQyb8MHOKrmqI9XQx68VKWbswtOIHvUiQ0osvMQrpiu+zBmmozInVScy26u?=
 =?us-ascii?Q?Soto8/sT25XXYbR5zo1g7KAJW4+0Jw4J4YhHKtTjR+lS5tDcz3uyoyNhjWPM?=
 =?us-ascii?Q?ZpAz+0dBRCtMKV2+W7Ktt8y+dqEuXy9rGQDFED0j/JlTXhcVWX8GTYBGocRi?=
 =?us-ascii?Q?tVSHlY4gc86Nd9wAMFYiQvtCdtUBnJRkXQMap5/yGg1hTK/rMq7b4UZgbQ4l?=
 =?us-ascii?Q?eEXWlQeGVN0nmsi0t2C27V85AZ7hnFX7EmzC1carepaak6HMWWRvRT9t+uOa?=
 =?us-ascii?Q?9sUvpMH/DleLo03eyUyg16TFWTxd3mLirLPn2vO4Y86KykH3VnKmusuKSAj9?=
 =?us-ascii?Q?X08o2+BIqpeCklqRYQlsS0Ufq47uVr0ai7XrGmeGks/KEpcwI9Hr69Pln+R4?=
 =?us-ascii?Q?1VyLhys0jc8rExLTEoXuNQOLFZImWRBppzVKaCmQdouyNrAgaN7P+nA+tURz?=
 =?us-ascii?Q?Tqpo08YeKRL9mXrPlGy4YO6PF6Uw/LhnNS3c9fhuvKnzBudg/gYNNJ1YZgwd?=
 =?us-ascii?Q?3G1GRZaTTCJlLI0nwnNb3Mw9cIHfK+tZ185rURrYJ5vY/X6I6IpV/uaeq7Fv?=
 =?us-ascii?Q?kUi59NwuAifW/KTG/GD0r1wMwBFCK6DNikHIHm2wqZ7vQbgPd0i08qnv5MwP?=
 =?us-ascii?Q?LZQBHA9l2301ek0ts/nPN5alTdMPti0Q6+ThDL94DyUyiqwJIYDiqnTniA4R?=
 =?us-ascii?Q?jzDxBmZBkCjVIL4LQ+GBSvGNLpbFJEijtknLRgxhSBIfgl1djB+UWODnLndn?=
 =?us-ascii?Q?fHj4FA=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OPxf7a2aRXi363BYTSiWRxqQ4rX97Qk9f7tTt9DjD015e0ohNI5/QTaIq6NbJdPWjE1x8MAcbvi80RmORZDXgFgSOF5X+0afwyh0R4HCF0QWgybCSJ5nf1Q9umEvBXrW3FvublLmd43HPhuWtfAVTjfAjGMtZ+PkTSCSSeBoz75HjXXsYaAun/f0K+mXDXyhSuaNqvyr7djjHQUz8i1RROZk9O0/KpCxJuX+KTJn6yBFwvUsXNTwTPih3euYWqVspjoSCJENIZn15QskXc0KOsXZIr8XP8eaFgJ9R5zMConEFardM/R0Wa4/SYtj+uILSzd72hRM4PtFziRQO3S5AWttFvwK2asIEvkcSAdtTXHIanNYJOziDDJo8IsAXZ6Ok8fDNP1RMGYG/dvNESSg8wBAOAKK9/oqlFKI/JqrvzN0rj6PwnCfMPnm+F7MtfIl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:53:33.1043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d56c4642-54fd-4179-3bc5-08de72c9c9be
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7649
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_025335_722615_2761DAF1 
X-CRM114-Status: UNSURE (   8.98  )
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

The default impedance for the MAC I/O lines from the DP83867 Ethernet PHY
is 50 Ohm. Based on the board PCB traces, this impedance is relatively
higher than expected, resulting in CRC errors for packets being transmitted
and received. Hence, add the "ti,min-output-impedance" device-tree property
to set the impedance to its lowest possible value of 35 Ohm as described in
the DP83867 Datasheet [0].

[0]: https://www.ti.com/lit/ds/symlink/dp83867e.pdf

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
index 3e5efdfe87f1..54dea36b153b 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
@@ -331,6 +331,7 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
 	};
 };
 
-- 
2.51.1


