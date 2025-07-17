Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0445C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 07:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HSPnFyNF0e12CZ8RP3toYIZDO1PR9IFpUTBypYhYBs=; b=TlVMpAgfss+lR6u9iyxY81N0UN
	anGILXVvPVg9t2v0HXvId+DzCKWHGOPSUVhr47YHOy9DHbLJIOTN2IHL4YxZbs5Itxp7PaOJ5mdiB
	bK4YiUYVARITlWz7gUery1310rTnO0J2zlbBWWR0IrrGVQ5NuXr/r+29nhqFl0jiZb6rSzEJGe0ie
	gMvtCbsDebsCLKMy2k7zQcQyKd6GRtHJWAAefaRuC8LT4vUFUDfYvcFVocyvfDYqY6+TCYN7h9AZd
	qXyVYrHSjGZbq3idqt7idFVQO8lwUrfzLkcrneyms/qmGkve/xF9vspimtZ6xWVy8ntJwsc/bTVrq
	2ZrBXhXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJN9-00000009VED-13v7;
	Thu, 17 Jul 2025 07:49:43 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIwh-00000009QEh-28wK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 07:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bP9DI7udDsB3ebtLbB/M9/l+my9+GrhCclO0tPUxvfmAKO7pQCqSi7l0/JgMzUlf1qyQi9G/DFGRq40gN6uDjR28p8PXf3ryu97MnQue+R0lWzSwhI+UhcV2D78mK/sB/xdfxCKF8/EyTmEIf5+qdnZWw7IpxzJIPhQb6o+SQwvP/vYsOSQsYre1XJI8Rp4cKom7BbfWmBPIYvDucb/WkEUBujXY5chLKsvQGs/ARyolXYUTePMCdv3vxoHDbOn/SBHQUxu3yCmyAG1jrChxinbhLJHZDRNQ3mciqxE2BtOifP2VbxxbVg3aWfvIid+sCE6VLQHq1+wCtYQmyAq8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HSPnFyNF0e12CZ8RP3toYIZDO1PR9IFpUTBypYhYBs=;
 b=k9gH+n8r/8qi3BWpB/Ft4sSw+y/prfF7OcNGEhsfSsbvjD1jAMDwQ3WKpWIepVABNdSdXnX5MyMsWyAvrwBCJruX50aKWvEyH/Ohz5CQCm76PTDec4++AfRWI6m1xsXpugBG46KHNIOosaomJ+UNX4LNin3IE1R+2Xg0wDkCFLfoxcIuDarBegH7ohu5c+BFTKLwltARE11CEApW/0fVWipZv9/wIU/GSPKk/OEmyRtksDKYWZGXEPd7B3EMGwsWop7T8MfuF02ETddGyEv94fRhdJlH9UdCjxGnslUvdo4V4PYJvy1bts576FaD31N22rx6BZk/d948CKoTK1aUIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) by
 KU2PPF58AD76D06.apcprd06.prod.outlook.com (2603:1096:d18::498) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.39; Thu, 17 Jul 2025 07:22:10 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096::cafe:0:0:88) by SG2P153CA0002.outlook.office365.com
 (2603:1096::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.15 via Frontend Transport; Thu,
 17 Jul 2025 07:22:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 07:22:10 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C8A9941604F7;
	Thu, 17 Jul 2025 15:22:09 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Fugang Duan <fugang.duan@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v10 3/9] arm64: Kconfig: add ARCH_CIX for cix silicons
Date: Thu, 17 Jul 2025 15:22:03 +0800
Message-Id: <20250717072209.176807-4-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250717072209.176807-1-peter.chen@cixtech.com>
References: <20250717072209.176807-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|KU2PPF58AD76D06:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ebc28134-bc6e-4828-8291-08ddc502a504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ORMuzLkNchQ5Ttvl5IU+V7eWRMZrN1EEdUkxvNuSobgWsYKQo+eZ727Ckp9j?=
 =?us-ascii?Q?yZi89eDZGf3MvEdT6FYPdsAFXTTKLAmFfAuBPNYTumjUV4amhtPiecCZ1ch5?=
 =?us-ascii?Q?ELI4hH7NGjjuHYrRmF2NoKPrfMVV+y7YKPOP2jlMXS5nJ7QueokCxOhVZ8xP?=
 =?us-ascii?Q?6El6aamqPRfV8q6WL8jI1OpV6wTucRzPZ3eXLVGfmaQur7PI+LRfCZulp4ys?=
 =?us-ascii?Q?xZb1cIwutn7+ApRCKXn/92neaeY3TEeE89eLCnZo0D9KG1x2kwnP2DRDnkq7?=
 =?us-ascii?Q?swDg1vDGD670kfqRTllgnhVYvnt4UBvs+85UMbJ9UwRvRfY2o6fPUvwbV7ro?=
 =?us-ascii?Q?og82joLbSpOPKfuIgh2Czzwg+c1c+jt9IilHCNkVkBQqrBnf2LNeoGd9xKx6?=
 =?us-ascii?Q?kYspBSQrpAG9V6Mfn7uH8H2HbuE3oukQV5yHxSOsR34b0pFHuGuOUQdT7jEs?=
 =?us-ascii?Q?UG93xHIGJtzDyJEEG7bSojCH8RwXQtJhvdM4XlxBQhV624/qowm/8MdDVtYe?=
 =?us-ascii?Q?m2THmObplmTe5IHmleYERmI7/Hm2mb21Skn8Dk7bQtrEBJleLeyh9DjUxd+F?=
 =?us-ascii?Q?bIbz/dM3LDjLgNFa42qYLYt4REJxiQWIBWAuHBK6XekoJ0qMT0Hu8VrDfZx2?=
 =?us-ascii?Q?a0SPlGxxMvHPSqtDTfj2lwsIsb7l7n2xJMu7NAE6kQ9NvgK/1xFkm/elZH5G?=
 =?us-ascii?Q?OrenwLzQiHk8+HyVLOUoRZ8Gq34SjQevQ6520urYkBQy+WLu1cS4IWfg2m3c?=
 =?us-ascii?Q?cl974Pjdfv7VvSnMHKmWQjovxxhPyGUfuHW+V+Cz4kvsVywXReyzfekiPB6k?=
 =?us-ascii?Q?0ihnmbCdnvrORWfxtinltcJv796mEIqMbq5m3+yzaV4bp8bzcPYQnzA2ZHkF?=
 =?us-ascii?Q?ZmgJ3Mkq/jIWpDG80xuTyprq0R/+BIkPPV6wNymn+20h51lwA3l/I6AijoC5?=
 =?us-ascii?Q?iHtK4Ob2SbcA9UfwdKQQxDDF6s1vkebasg4VqNJhkjlwkYwGkyC+CF3Yzg6P?=
 =?us-ascii?Q?B4QJQssbOD+MJb1Uj765m0Xa4qP5rPlHmNOWSm0Z5NweENOiRYPMt49/ngxF?=
 =?us-ascii?Q?OUT/KD4763UN1EmEk4LpqruYaGfoOGy7vu56CTHM4QIFujOCOECbFgxZglzN?=
 =?us-ascii?Q?2Sq5uV8MUNDDO0soXA4Xkx5x7fidQ1uf4eWUU74JyLLWfDvIyXiYgfnt4pBg?=
 =?us-ascii?Q?ktRd/aQDvQrjVMAsRo3MkrnP0nmeUAfBgGLK3M/wims3fltK7ULzlemLPDHZ?=
 =?us-ascii?Q?vMNkZ4vcnWBtlPN2rxAPbYhqQlQF8PKEMxkvevkPxllFDgNzFM3rqcXDHqow?=
 =?us-ascii?Q?N36t/Kt7z2oy+iUj7KAZ7zQSUmCEGcNaxPaiY1MKn1kQ8vkoZOKOMdDpkttV?=
 =?us-ascii?Q?gCZD7hiWXNrC/evElKCUW6NKMMh3szG+r242/tWeyTAN2aCu0qvktlQ1pcUj?=
 =?us-ascii?Q?zpI32gZowWm8Yx/eFnbo6c3M1Khx+h1LrDoOjZQ02I3oVMDjLlmEk+ts8Q4D?=
 =?us-ascii?Q?d5fm3c+9cqROuCEYBDTAI/gubGQpyJxoH0/A?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 07:22:10.3928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc28134-bc6e-4828-8291-08ddc502a504
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF58AD76D06
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_002223_569146_908E2E33 
X-CRM114-Status: UNSURE (   7.89  )
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

From: Fugang Duan <fugang.duan@cixtech.com>

Add ARCH_CIX for CIX SoC series support.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..5eda66aea359 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -106,6 +106,12 @@ config ARCH_BLAIZE
 	help
 	  This enables support for the Blaize SoC family
 
+config ARCH_CIX
+	bool "Cixtech SoC family"
+	help
+	  This enables support for the Cixtech SoC family,
+	  like P1(sky1).
+
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
-- 
2.25.1


