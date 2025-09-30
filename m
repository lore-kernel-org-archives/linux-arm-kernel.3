Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B99CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 00:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGc0iT9SLDLuk9C+P/AEDcvkAlpI7l94RvR5GeRSefs=; b=adBAybaoJfv6ljpnUUP5G8UVIh
	sxroJqmZfBlob4ndPosWHQBpKVnLAvtrpDtwEF1scmJQT1tuqCWBoTp6wHp26YtyxZLdiEk6UUWy1
	Kb6hBiCZIMZFMXWWJp990KWSXHDjQhTC2AHSdtEWz7GCZw5z4noIgPAy9hdARs9xvQpWddY3nXIeL
	auNdKAK1iRVeVQF0ElTSCPUhEVjuhHA0H1Wru9PyJmuNHLKB57LuiAbfjyLyte4tz7mPaKjLjnYLF
	ZgPD1c3NZu1ntxI/nMElisHhyqjHIRxqEWMwbgvq+wEcjiHw/2RwDVyP4cgE5ut3clogtoh2IajjC
	17mSt+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3OCa-00000003gPs-3kCi;
	Tue, 30 Sep 2025 00:26:44 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3OCX-00000003gOC-3tmC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 00:26:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paI1/pIrHpr1W4Ygq9ixzJcghalkY+gFO8lMvtREjYeVhhHqSXfuxcYwhHsylH2MOo9w85cV7C1orOtwMJAHISHtHmI4kKsKbpUTxrvRsNEMOkmast5IH5OTMq5OByJh0TEkJTlD4lGUEtGL0u1e38gyfLn/Tbs4MCW3ttTlvyeguMe92Ebo5Q7vzZ73DWiWchhy9YeG/Dp1P7O0UtjIP+kc3K/KvjEjNb1utlPxFlgNLCgEc6W4UhtgpBk2zGjY/kc07UziHWkjtL2uWecrs7UEuvDUTicqa1vEF/876sJjm/Ql0VClMuuiF5OxN4tfsUsu6TkGNZe04nY4qtgQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGc0iT9SLDLuk9C+P/AEDcvkAlpI7l94RvR5GeRSefs=;
 b=PSmLHz/WlMZFjE9PueQ/d7dQtqRAB+xK5lTTyQW7PGJKlX5jBF4k+4zScxdD1BeAHHWuvPJwkrZ/JqLAm3YnmfsfHLj8OE1QmK0uexAe7f6n4u7zJUJhfyd/TwHs7zW30q9p7lpeXwnFr9phlOOOS8ZmaHcBKVNsloXYsh9MvyzORcjlYrtt6vbMkjvKlcQZWnnwvZZOJLByWU13f1nRrEmSKOocyRDQ4ONgQhffVXwjAw/dN2qBrUcKNC6fp+uNOI7QiNDq/fyjcr08a8SeKsFx2cB/N+01nhAMCghXC+FpgENIHOHMWk98GtGvpwNAJ/Spjhm78pcjxEXPliY4Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGc0iT9SLDLuk9C+P/AEDcvkAlpI7l94RvR5GeRSefs=;
 b=lY0YREM4mtVuXJPE6iXWXLUyLBcBePNjgua/oTMNGdI5oZ7gAc5p1siH7L5/8HOR7hKIlHiPnUdQXznj0ncIiVOEUTGkIBJYuaivKI/dP+4Qkz6G+lXpbrOrQcq6zw7NRjzTKKspgOcLUM6TvCp5tR76HBMvNZ/MZk86FPO4dudUJiFNYv3VwyGx2HHjp1Zc/PsIJDmMWdjMMyhCTbvRDf43CP3eOrousQrngQqtRhAcGtmRj+MNyhoRhu0ik5teQr1uABGF9Ci1GKiElojsLBK/Cfflg267SMG9jmLHgsROJ9DcaSkG+npjKjG2BGd4COrXfQWjXAjdBQReKAi3wQ==
Received: from MW4P221CA0022.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::27)
 by BN7PPFD91879A44.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 30 Sep
 2025 00:26:28 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::53) by MW4P221CA0022.outlook.office365.com
 (2603:10b6:303:8b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Tue,
 30 Sep 2025 00:26:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 00:26:28 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 29 Sep
 2025 17:26:18 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Sep 2025 17:26:18 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Sep 2025 17:26:18 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <bwicaksono@nvidia.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>
Subject: [PATCH v3 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Date: Tue, 30 Sep 2025 00:26:00 +0000
Message-ID: <20250930002604.346306-2-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930002604.346306-1-bwicaksono@nvidia.com>
References: <20250930002604.346306-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|BN7PPFD91879A44:EE_
X-MS-Office365-Filtering-Correlation-Id: db6e2acf-4ed9-4711-ffa0-08ddffb7ff38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FrX3UM8zxNo87DYmHpSVWnKlqC5Ca9cq5ts19Q41bTBHGXx3LdCxE3aGJAfu?=
 =?us-ascii?Q?3P/v94QvdkWZQS8aKvlemroC+JqP0mrveA9pz0FKAEnyVZESUztuPzCWXnCL?=
 =?us-ascii?Q?zbBNiTuT2204eZAFhNqbTIyNJOWY5dyh91frxlPp6KILCnJ1oQNRjHMGiucI?=
 =?us-ascii?Q?pB/7k+QMAf9FpQTtXAVHBgfeDA2MZ3Y4UnkkW5FMGY7FjHRI+2naZ4JFXlCY?=
 =?us-ascii?Q?DJGTiUyrEFQo8tGCOHqevaXv4+b3Di24WNptzAulzy65Kk/It67ziWSqU/EA?=
 =?us-ascii?Q?lXO+e/HohDcULrBoBO7x99xgSWA43svdtKCzUy/yBsbE/u9Al1S6uQXScwJT?=
 =?us-ascii?Q?8jehInXUfwxvIPjGWBsfydNn8X1sygHWnAkRh9EIngbhHWUBgUFOASkqzDai?=
 =?us-ascii?Q?/yNuvFrbRSy+FZ5PBSBZCa0za2Nr5esAqQEkmC7ktHuU0zd03Hg+lDKyhsyz?=
 =?us-ascii?Q?5IqqaPC+ZBcC7eMkIQO/UIGY5TA411nWajTpAeQRzPCm8IPxIABLWycVyPc7?=
 =?us-ascii?Q?78HT7+eQfRnouylFg5RszyYIiaIwFOSJCUuCS2cXgEB2SsMCSm+lTKeKEjR2?=
 =?us-ascii?Q?LweVU5Ve7zCWsv0kUw6AR/rloIaqFg0TbMTN5+zOUAbWi2dnsj4xPEGPdqSP?=
 =?us-ascii?Q?92IK7CUisNQejkT6g7N09xtnsgfVDzwLk7BVKjdcduYJfnGJZKY6XqaDjuhH?=
 =?us-ascii?Q?li6YNb/S+2xSP0hM4Mj3p/O7koJgVUpO/J5oO7rk03lf84IpUg5T4pS4KFX2?=
 =?us-ascii?Q?jHMngsSM7utC1PFPytfrxxd9E1UmF0f5THJTYzy2KWT760jISLWreBLyyHxl?=
 =?us-ascii?Q?NcPU1GXcGyteFtdCET+klm0yvfm2X1N8H1xTvA7voTmY0Skd9rO2zo9U8hlP?=
 =?us-ascii?Q?F6ogA8KQXeCm0NZyRuCaVAJ0pc/LPEb4YlJJs9E9eCchMXegdVDt0HRn0gPy?=
 =?us-ascii?Q?oKQfKOrhz+hfx8hpHpZcTMGuGsKUTw6TqIU7XAOO3QVg9kWGV25PcwDmtf0z?=
 =?us-ascii?Q?KfT7/VAKUeMt+dgUE3mk2GliYO/KLL/825tUiQhRKHQaJF1kYrjylGkumDMn?=
 =?us-ascii?Q?7QaWxLRLXliCd0u04SS1Cw9ih0LWeYk8BNXnTFlhXXddFuf21MhJsNl30L1q?=
 =?us-ascii?Q?nOmIoxEgF/2s4WY6X0CYCTok/2i0DmEpNSkYpSRQcsDs4CmpTKmC7QltF4Tj?=
 =?us-ascii?Q?Os2F7DLbiREu09BFIUfuB0Q9O/HZ58vLXsc58Wy+H6QtSmMoXJAppajMZpfb?=
 =?us-ascii?Q?iFeXnYHtxdy5jENYzBoBBt1b/tKeFMov7EybefJ/y2JREDFTj+jB8mQx0Qr6?=
 =?us-ascii?Q?jajnsiVxxVF0oJsmQWKJTLriJPzPC7A8Nm6rj0tSHOs5wWxb7ORbprsYbElD?=
 =?us-ascii?Q?71UdvBrg6CRAgQTluHDrJ5Yw+m/PdySjfDcOZlhiyXzcoSsZXBjx+jHFpS7H?=
 =?us-ascii?Q?yb2GGG4LiiuD6o7FutnYcQFP/GaKaH+QrEAE5nFH7JB769iD6+CWhUnphe3n?=
 =?us-ascii?Q?kfF4XafyKXOtV7wqVQWhTpCV8g4X932fJjw13TT5mgEqgK/HAzumjoF0GP1n?=
 =?us-ascii?Q?oLKcGnK2s+40WPbvJK4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 00:26:28.1870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db6e2acf-4ed9-4711-ffa0-08ddffb7ff38
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD91879A44
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_172641_967341_3C306A5A 
X-CRM114-Status: GOOD (  12.41  )
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

Add interface to get ACPI device associated with the
PMU. This ACPI device may contain additional properties
not covered by the standard properties.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 22 ++++++++++++++++++++++
 drivers/perf/arm_cspmu/arm_cspmu.h | 15 +++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index efa9b229e701..75b2d80f783e 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -1090,6 +1090,28 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
 
 	return 0;
 }
+
+struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
+{
+	char hid[16];
+	char uid[16];
+	struct acpi_device *adev;
+	const struct acpi_apmt_node *apmt_node;
+
+	apmt_node = arm_cspmu_apmt_node(cspmu->dev);
+	if (!apmt_node || apmt_node->type != ACPI_APMT_NODE_TYPE_ACPI)
+		return NULL;
+
+	memset(hid, 0, sizeof(hid));
+	memset(uid, 0, sizeof(uid));
+
+	memcpy(hid, &apmt_node->inst_primary, sizeof(apmt_node->inst_primary));
+	sprintf(uid, "%u", apmt_node->inst_secondary);
+
+	adev = acpi_dev_get_first_match_dev(hid, uid, -1);
+	return adev;
+}
+EXPORT_SYMBOL_GPL(arm_cspmu_acpi_dev_get);
 #else
 static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
 {
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index 19684b76bd96..bba513224586 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -8,6 +8,7 @@
 #ifndef __ARM_CSPMU_H__
 #define __ARM_CSPMU_H__
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/cpumask.h>
 #include <linux/device.h>
@@ -222,4 +223,18 @@ int arm_cspmu_impl_register(const struct arm_cspmu_impl_match *impl_match);
 /* Unregister vendor backend. */
 void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match);
 
+#if defined(CONFIG_ACPI)
+/**
+ * Get ACPI device associated with the PMU.
+ * The caller is responsible for calling acpi_dev_put() on the returned device.
+ */
+struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu);
+#else
+static inline struct acpi_device *
+arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
+{
+	return NULL;
+}
+#endif
+
 #endif /* __ARM_CSPMU_H__ */
-- 
2.50.1


