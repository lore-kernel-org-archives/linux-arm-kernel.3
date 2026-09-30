Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D335CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZNz0bV+vZ3Qmp+o7qzAnxp/cmAReaBV/YQiK0wlxMA=; b=n/YsTCdWvSNs09JD3uYHsITB0s
	Ym6akd6qmRTQ2WQAWdQKK2Fz9zGUSUd+pyiY9hByYb5mvios2WbhD/uHbfj4TRJUAykK7gnqX92s2
	2cQG0o3teT3Vi2Zst3WpeVDntbFzSUXZYM+aP5SDFFOqCNx3T/Ap/f8OVm+fS99hqGM8GU7tfXqpe
	Xf5UjcLSaLHIRvRhnFAHBoLkDBguqhMsFOP8228DZagPILasojO2L++ZgAXa12tNyqAjIisgCK/eB
	6S/fYEbbzHFd5cbkqwr4BF1EgDsny8ClgqRSpAU5pW7xpm75qtpr5FlZdkbS8ebLBZurO0dYDQB5Z
	dwMR/ZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnbs-000000057j3-35mT;
	Wed, 30 Sep 2026 06:16:08 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnbp-000000057iK-3qzQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 06:16:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLh7ywNcYWt6bjAoG+DpJJRkCZ67r8X1g9vkMMBjPqctzx2L4F3B1EyQWyKXtdOlGzhvGAL2V4bcWSFsGDUXv7PXUVn8o9qoYpuq6d3mkR763wHph6e710+q8mr32h3Eu2QdWLbDOAd3eCAOyjDInzWcBDn5WFGLg8QhnA2aY8Zf4o4eu+FxwxaW7Y8wITEEBoNiuhhU0lS6Wcm1CGAhpxOIKmtejnq/fgIdjvgYRRt85RNA8QKS/h9qYje7QHQZyQsIlTG8V213apPFiNyAZhqmDOKjuHbMIe4lnXwrkC7SiwoP2gJ284ePjoXjnT4U+8L+BHM8JNFmt4kGGFTbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZNz0bV+vZ3Qmp+o7qzAnxp/cmAReaBV/YQiK0wlxMA=;
 b=ijDeQNn8zfoqZ2Qw6PNFYaeV5rxA5CjD0gk1dqLwnJthIwmH5O29L5f+1nSdvXNlUnSKT73WJHeXGJuwLl2fbbJEr95w655l1jTXs7YJrk9y3/M/CQ93t0BKMuqv/XXvcV9Ks7mobe6t5iF7pdr9tIu+Qs7paTg+8CHSRGKoHIyaNiPfoJ2rzQjKsCC6vtM2ZzaQNPz4WdHaWHZNo/+ZTt0ALOB+FN+XS3v7ANxNwgFDpIXcN5zGaCDOqVCt3WGWUpz7RFPQG4gq569WwAwMzEXNpQUHM3QNoLI9H1dTrm/AVxqixzc9u7TQzvIm4s32Jco5fGZ81m+4ZXkGCGDBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZNz0bV+vZ3Qmp+o7qzAnxp/cmAReaBV/YQiK0wlxMA=;
 b=pyIiAzZhW6BvHFj+qYcSk21Ro09t2U7/AwDm6nfbzjivtXSKJtwNKDRrBADy6Q8vYXxp/zX1J24r0pfhCKTd3LdTI9YTvBDh6YmyhT3ACpU6XF2EGCRQspi/41msNk++UwIOdHgPj8nmC2ueA/4kkqTFm179VJQYDIzlqSjfHV1jAnf2a5ngMG7ncr2/8JYxCOuypXEy+gqp1zj9R7t3wb4v9xkvI0WMAT4E05AvXeyN4i7u0rI36DG/d8a6x6adx7Gz1C3Q2Cmj3/0/oBG3YoMlR3N/3p7cCZxrHabUzaNtCGVmJ0b1c8wmltLuWkLXJEkYb/RzI461zRoFMI88qA==
Received: from BN0PR02CA0041.namprd02.prod.outlook.com (2603:10b6:408:e5::16)
 by DS5PPF7B9F1F8E0.namprd12.prod.outlook.com (2603:10b6:f:fc00::656) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 06:14:21 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::40) by BN0PR02CA0041.outlook.office365.com
 (2603:10b6:408:e5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 06:14:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 30 Sep 2026 06:14:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 01:14:20 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 30 Sep 2026 01:14:17 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 30 Sep 2026 14:10:22 +0800
Subject: [PATCH v9 14/15] ARM: dts: aspeed: anacapa: Update EDSFF power
 status signals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-anacapa-devlop-phase-devicetree-v9-14-f08aa0d7182d@gmail.com>
References: <20260930-anacapa-devlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com>
In-Reply-To: <20260930-anacapa-devlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Rex Fu
	<rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790748641; l=2275;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=d+gbUKigG+QOjzKWdxSqXUiSGxAxf7F3rrx3mar7v7E=;
 b=dYZiads6ffHuNUzC6jU5MhSXVA28KaRbeWL0v5RMkXzYnxqKZmaD9+4GZMbRAxDNntHvXd9gk
 9s40f7zJnuiD8wy/qeBejQ5LTNEtsDzq0KDTwfl1FnnpQfZtUuYVxvv
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|DS5PPF7B9F1F8E0:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3e0884-ffd4-4245-9538-08df1eba1173
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|35950700016|7416014|376014|61400799027|7093399015|82310400026|48200799018|18002099003|16102099003|22082099003|4128699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: cZdW5NO98DIJ1R6y5yMYRDcEhV8ZHkF5jky6iD7Dx/YwR95elKVIqcHZqyvkHFA5Sn3quD4gug2iH/CC+BWcW6JmN6z64NSMV6sfiKZ7Yl7nhbRQ5y8DE7yOHGS9g/ujL+ZpHpdYLlXRvgAzzWhnbnpTlcCiAZOnuxPfm01JoRsQz4XMljyp1mFUpkh20MZwCSMvYKM6nxNCijE3Wut+w40cX0n4zTBW1sos2n+rehwXnvLmqBcl5IMwkz4E17Gg1A75Nxv8+i0G1KtiTu54uXBlYZfkXu6QVw/SDWq0rJFod08fq0CFCAYKjT+CWi4j4dTEua3LpwPuegv9Rnmzf1x1Fqg6qlGXcgby/nMaNUFA4pl6o6UQ0SC1IVKUgrJhV6ysMyklynFtlY/XrvU2SSw9ekObH7dG9C9AQNvKKQUBDJb+AgaFMEOaGy1CaghRqF/FExg7wwKoTTM1pbvqm1ZTZwVutIhgPDNt6komY4LqZOUP9A75qkNrFldwaDZ/6cniNv+bh1etMG6yamRZkiJl81SJI2jDzIje45cJ6/fKT03+48TPMmX/FSiT4u9W+wqMzwLYKBFboTuY0JweCQcSJS+8hNNwNVvIIhosUKxGzGLmQy7zG+mwEENRSOoeGrzsb+nrE+ozygUkmAwh++7bktDnuS5z5sF1BsN++Po71r2HA+HQO4vCuIRzyJ0RkTeQNrS0bLmDOhRbY8hPWg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35950700016)(7416014)(376014)(61400799027)(7093399015)(82310400026)(48200799018)(18002099003)(16102099003)(22082099003)(4128699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: X66szdslFrKaWv7M2HDqwyBZtuV/XblNte+UNrMh7FR45uX5UOiXIWmmdUxzNXSGrC5J1tG1n+yog8lIeeOuWZYFJwn1lF11dHjrIr6Jwep93TGulGJtksjbquCPvqkHZAMmfV4HCJs2H7/v3DS7ZW8yddNSdzawqVGylh1Z6AJSAIZJi82gojq9OKcHr41MHwwxtOotsvkI6AOL6GUhK+DrJUnWuY0QWpiOsY/aGj4+HPjpZC2SX1hg+PBmQwnUb7q3H08oSjRFdy6LB5rE2kY6jAlwJlFmBKfzUFCAZmtTVrXv52hD1RkFCkwJ24786ucQldCDExf/ZGxTFqVu/E0FOpzwuFBWDJDRx+7FacEOtz3Lp2GPXtIC6tdH/64X4qRT5CmxZYXNi10hhOA5L+uLNSLO7PqBZ80WM4nCsqWzkSX7ZInbZlD7ju0Cs/Ol
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:14:21.4997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3e0884-ffd4-4245-9538-08df1eba1173
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7B9F1F8E0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_231605_962258_FAFD0AFB 
X-CRM114-Status: GOOD (  10.65  )
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

From: Rex Fu <rex.fu.amd@gmail.com>

The CPLD definition for the EDSFF power status signals has changed
from PG to FLT. Update the corresponding SGPIO line names to match
the CPLD definition.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi  | 10 +++++-----
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi
index 3b3967b47980..698308049c38 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi
@@ -162,7 +162,7 @@ &sgpiom0 {
 	"L_PRSNT_EDSFF1_N", "",
 	"R_PRSNT_EDSFF2_N", "",
 	"R_PRSNT_EDSFF3_N", "",
-	"HPM_EDSFF_PG", "",
+	"EDSFF_BOOT_FLT", "",
 	"", "",
 	"P12V_PWR_CABLE_PRSNT_L_R", "FM_BMC_READY_PLD",
 	"PRSNT_NFC_BOARD_R", "",
@@ -208,10 +208,10 @@ &sgpiom0 {
 	"PDB_ALERT_R_N", "",
 
 	/* L0-L7 line 176-191 */
-	"L_EDSFF0_PG", "",
-	"L_EDSFF1_PG", "",
-	"R_EDSFF2_PG", "",
-	"R_EDSFF3_PG", "",
+	"L_EDSFF0_FLT", "",
+	"L_EDSFF1_FLT", "",
+	"R_EDSFF2_FLT", "",
+	"R_EDSFF3_FLT", "",
 	"HPM_CPLD_HEART_BIT", "",
 	"RBB_CPLD_HEART_BIT", "",
 	"LBB_CPLD_HEART_BIT", "",
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index 5c0d874fa24a..766aa26b6cea 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -370,7 +370,7 @@ &sgpiom0 {
 	"L_PRSNT_EDSFF1_N", "",
 	"R_PRSNT_EDSFF2_N", "",
 	"R_PRSNT_EDSFF3_N", "",
-	"HPM_EDSFF_PG", "",
+	"EDSFF_BOOT_FLT", "",
 	"", "",
 	"", "FM_BMC_READY_PLD",
 	"PRSNT_NFC_BOARD_R", "",
@@ -416,10 +416,10 @@ &sgpiom0 {
 	"PDB_ALERT_R_N", "",
 
 	/* L0-L7 line 176-191 */
-	"L_EDSFF0_PG", "",
-	"L_EDSFF1_PG", "",
-	"R_EDSFF2_PG", "",
-	"R_EDSFF3_PG", "",
+	"L_EDSFF0_FLT", "",
+	"L_EDSFF1_FLT", "",
+	"R_EDSFF2_FLT", "",
+	"R_EDSFF3_FLT", "",
 	"HPM_CPLD_HEART_BIT", "",
 	"RBB_CPLD_HEART_BIT", "",
 	"LBB_CPLD_HEART_BIT", "",

-- 
2.34.1


