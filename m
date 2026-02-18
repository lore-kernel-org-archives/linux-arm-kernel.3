Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6120E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzJwW+rDIjSvp+cuZC55o3fEpLUEyBZm585x6s3jeuE=; b=nPUfDIwvMkV/2sZGdkKey4z+NL
	IF1Fw1vDgKuVwGoYkKCdGX3itaOzC22i4W/5HUIolD7h5EZs9wrXJ/1gjOG7LGSvmU0nbKhhksBDQ
	urg2hQpUK3KKEIwwSLRA6fNkzWwVQAsSpGsVfkxVa9ZOagjdpKEwKMF/C7vExkY9/1Jfw802mI2Db
	G6g/85S4nRa9r/mX9TJpzbnVQrBrXe1t0/RIT1enxZhWtLVz0gW59VAEENWCJrboLc4JCHvdm1hhB
	Un8B6zgQGXyeuqdzMvV9Mc+CxNzldOlN/EMdDXwiPYk7w3c9xi0lC4oA6GaqC7QP50d8YLwaCvcxg
	wTc6+MAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsj1B-00000009yZM-3UOv;
	Wed, 18 Feb 2026 14:59:09 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsj19-00000009yXp-1rlo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 14:59:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrQ6urdblv9eD2sHwMc3pmitbEPfETnUBKoxmLK/SO2H3OqeXZnly+zG7/2t/lGTs2V7Z9aFspVIapNZ4VjDi8CgaX0uVJZeN34s2VdYGVT1CSKzWvfJAlRVxqpg9DWoQDAbE4q/3lC6+FJp8C7Cce1k+QTnuapmn+rP1IRmCuHuAoAZzlcyD0twCWbfh1B7Qi3UIIFm+iqVVIOTp+DFMVqe+G8XmAqJwbzuiYT+zsJ8DCxeVIw4CEU9KLcle0bQBJ/yKWOdxujMlMQ2N4ZyIEf0XHjlzBSyDQx+uNeSWX6jtB6UacRPsNlkf9ReZqsnJ+ePWnhU7xooCuW9/Y12jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzJwW+rDIjSvp+cuZC55o3fEpLUEyBZm585x6s3jeuE=;
 b=U3jt8mFKkwe4WV4Tf6A72AA2bEsoU89d54m5KFhfTZilSSldsBp4ZgVlunOX6Lf9W7AF0o3KfM+3LwvmwKaIiq5WA4qglYgoXGkfXi8WnvjeCr/+TQYWHkgycNMU5n4QvrgsY6/f2Qzrzs3fOoIN2q6nZmhDYdVr8+2tCrZTYR5tKcB+bn90ehmhbI8FIODhDZpDargnrEPfi1m3IIlpMdl7nsaDdb3B8V8QKQahpwhg9DI5wcFz6Zn1lhenrOq8ARao/I+qsrfFCR+qJy89D0idr3XwbQwieIDt6WrfeQtYHSioITjUFKuXPASXEAuODZNeeFRFzE/I2AdvgTohDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzJwW+rDIjSvp+cuZC55o3fEpLUEyBZm585x6s3jeuE=;
 b=H3YsSqjTcF0LuelprdUoR0Nor003nvDucfRigCW5R56DqREqipHZkBnjQOfok4nbd+9FMwsPrfjzTxwdYfOmjTgHcQeKGw0dH1S2jFXA4NT++4J4qCo3K/8cB62kKFlRxI7GLJGvmk52bX+F9tOBpZVfq1sUXA9tcKkKb6e3Qb2Ab2h7y7n0du99kWYdb5umclwB6zeQ7dgaqhsmheCLofZu+92xSJHb2D3vcZFWWCbxJXYFhwrCIee3wARpCSY3qNOZwxImir5HJEYDwepIJMZ5xK0CwX6x0DXndCQr4Lk65wuIqVg4g4xrw/MR4Rfs6O9cDEXU0TZnOllAVF7veA==
Received: from MN2PR22CA0024.namprd22.prod.outlook.com (2603:10b6:208:238::29)
 by DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 14:58:57 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:238:cafe::ee) by MN2PR22CA0024.outlook.office365.com
 (2603:10b6:208:238::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 14:58:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 14:58:57 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:37 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:36 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 18 Feb 2026 06:58:35 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v2 3/8] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Date: Wed, 18 Feb 2026 14:58:04 +0000
Message-ID: <20260218145809.1622856-4-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218145809.1622856-1-bwicaksono@nvidia.com>
References: <20260218145809.1622856-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|DM4PR12MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 0690fbb9-2d5b-4323-b2f0-08de6efe3e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pwP0yMBONvzDt91T+vKoLRV3WPwbtD2bKu5ax7OIa1yYOwkzvjlf+SaiazAn?=
 =?us-ascii?Q?0duVJeGrCMFLbMYH3ICNB0qZYQXQT/eZmlcB6ortgYfyMh3FT12DXjh6eonw?=
 =?us-ascii?Q?VN+B3C01B8Cm3skDdAeNwZtwP2iPz1nwf5FbiSA5x0sMxS2/2bqXbKSR4AAA?=
 =?us-ascii?Q?JIduXP7d123PF7TeMTVg3ZlZbyn2nBqYa0zuYg6E59dmEM71ekwIjAiBYooZ?=
 =?us-ascii?Q?N4nFZD+/r87odYNjSbU1LPz4rcjODku3GZbDTOkHvuz1HL44kRDQDQGZcEPc?=
 =?us-ascii?Q?mlQzAYz9K+ByVFz8XjSTLcHxh5iVNa30hfdSxLT0m2YMeIP17svwkbBOYgR7?=
 =?us-ascii?Q?ipOYmaCAP6aQAN6J79WD9TX0U0uSVXTCUoRbst2xGe+xVM1kUlrLRU5c6kL6?=
 =?us-ascii?Q?OVtoUPI8ABKfWwb+2LWepWqp+7vqCevy5m63UVRA1iMo1JuqpLtp/Iz6gDjZ?=
 =?us-ascii?Q?yKgd7iV+W+JkoG7VppKF9VhvfsjUJlat6ZL35iSTQrP/9A6E5SpbfSeFC91g?=
 =?us-ascii?Q?80W8iHy2d/bhBWXxGuYgWWKxG9Pjc8zESirROCygbJBxDoo3+vOXNUjUGv+O?=
 =?us-ascii?Q?G9zyuJRkbKJUbmRAJxDr44frZVTAjc9wKsZpaDZzTE0vFFAjCCYV4A9h3Qbz?=
 =?us-ascii?Q?MR0tc39yCi5I2pOQoj2Y7KJ3pdVoaDN0Dm46ghnU1qIhBuv6cjLtanoc7wCG?=
 =?us-ascii?Q?Ytq7W+9BprTapRz/4ljz2O0nN+NfgiiO2V0/FfZVJiF244RyWKGqSPBsbNLo?=
 =?us-ascii?Q?9hBlDqjX8QVIj2XnFR1MPokGjYkKvsKp0zo96+z9+ajoqnE3azys5aDficB/?=
 =?us-ascii?Q?Efg9yswBjdslSAiYpWuySXUyW3+wFVgyhgW8ZsBU5eGcrSHz5iWBqGCM9QC7?=
 =?us-ascii?Q?YZ41I2QumEw2uGAiRrftmxDaRQ5TFRe0Mvjozk1Hb9lMIHx65fWCDXW3AlJa?=
 =?us-ascii?Q?1kOxeRPOIhfPSsL41dy3S2vx90uhIoarkUOe2q32LOkiMmQ5Csj8J3CP81eb?=
 =?us-ascii?Q?7eujA6t/Ty2jpxY4+DZqlzGDluTBezpsD3ovautWSPWoVM6H+v75vDX1FyEi?=
 =?us-ascii?Q?jM7egPizNJ0rp2P07ujRI6dmSi1n+qeG7ALGhiFew8P9+BAMyABjX4PYK5Nz?=
 =?us-ascii?Q?5S/w4VGCyPZmLHkANWX3/KIcGsLbzRSM8kNzInYzcGWho4zFt+fXjkUtw9O6?=
 =?us-ascii?Q?tA4TKXilZmi189Pl71RkwYV3GqYfKPPs+pexp82thZl/0Ma9+FdNA5arM6Pf?=
 =?us-ascii?Q?2lmRVUsnRgY14fQB4LA3QDM0xoIkI/zNdzmcgCGZ/hjKoMRAkm1tX3E5FTn4?=
 =?us-ascii?Q?lru2UtfOeV0R+vWjUX+ADtB9e7P85xsKUNOMaDZAiNLPa3GCnTPxTYltEPJc?=
 =?us-ascii?Q?iO+UI2Y8NFchjTlCqvkYPdsJeAuuQo6iEmGXcKjIMebHRHrf14Z+1mq7jT4X?=
 =?us-ascii?Q?A1SbLxEdJLX5f6uRyI9Julq1s0n+lYxZkv3ReiPdZZWkhG6BKws5c9ksSh0U?=
 =?us-ascii?Q?n4LuygwZZ/Hjca/RJdz67gZ6JiX+HlvJQf7d/z4L6txrxoC1TbgmEL5vdMRG?=
 =?us-ascii?Q?3EcKJn5+OPNDkxS/gec8v14ZYC/LP5mYiURKSHBPV1BXWDDKey05qjqiRqjq?=
 =?us-ascii?Q?0W8GUVjnx3c9PRJp2gMnp9L0nYOBcpS8/0Sf7yRFcb4B9AxjUJ21z5/1DYrQ?=
 =?us-ascii?Q?8n6OyA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3GjFh1oTwA4z/hpY75nKrwiQwwAC37mx/FRxdQQ+lVGlWqwGY9nEbnTVvbBLh+blen07aKKh4f4X4FmdG1nuBte9oQnuGedL8r8BQlTCzhzt4BAyGrY4zgTkIvrhg3g5rMO1LvyIEvZxjxP2GbPKz9A/8iNIBMT7hG+GPJM+woSuowiAnWy/Bid2lmfELSZox8LZka/ifWp6l0h/NHAeVp8E2tXzsMwUgkExY7hOIOJexo+466W/HI0qTSIybOlU/+1sU9j6M1PpPGB0J5g2XrQxPj9/nFWGWWb44q2hh6Huk9E/ya7R8k/VPG9l9GhWuv4CvwK73NJ19grIHxOx4oAyI2yYrM6haBR3eFGSUMutnv2uOSsq3cU4KLkpBIRvBnBywu1exunf1fRrrYExvbtghGbe3VHcYWfm0ahA/EDlfjriQnibHKuAd9M+wY6l
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 14:58:57.2450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0690fbb9-2d5b-4323-b2f0-08de6efe3e02
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6496
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_065907_985627_C44D0AD9 
X-CRM114-Status: GOOD (  14.40  )
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

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 22 +++++++++++++++++++++-
 drivers/perf/arm_cspmu/arm_cspmu.h | 17 ++++++++++++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 34430b68f602..ab2479c048bb 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -16,7 +16,7 @@
  * The user should refer to the vendor technical documentation to get details
  * about the supported events.
  *
- * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  *
  */
 
@@ -1132,6 +1132,26 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
 
 	return 0;
 }
+
+struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
+{
+	char hid[16];
+	char uid[16];
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
+	snprintf(uid, sizeof(uid), "%u", apmt_node->inst_secondary);
+
+	return acpi_dev_get_first_match_dev(hid, uid, -1);
+}
+EXPORT_SYMBOL_GPL(arm_cspmu_acpi_dev_get);
 #else
 static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
 {
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index cd65a58dbd88..320096673200 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -1,13 +1,14 @@
 /* SPDX-License-Identifier: GPL-2.0
  *
  * ARM CoreSight Architecture PMU driver.
- * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  *
  */
 
 #ifndef __ARM_CSPMU_H__
 #define __ARM_CSPMU_H__
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/cpumask.h>
 #include <linux/device.h>
@@ -255,4 +256,18 @@ int arm_cspmu_impl_register(const struct arm_cspmu_impl_match *impl_match);
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
2.43.0


