Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60E3C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 00:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6B1qk0FhIAz7yoZNuejvkiVETda54KM8i2pXYDXu3Q=; b=rr+Q7aFvXWZgMkbbY8ZVGdmi+v
	wz07oRFv9KlFS7TB8lrtHbYymiURqA6zSuI7EfGegIxpOtDKunVwHV9dyt1MSt69oZ4PRsGKF3XN2
	fsl18EQZYOm7g9KEp3VcbTTxn6QODiZzxIDO4nkRWpa/efHX7DRVmxZlttpeJ9Vx2ctTvUhQrS60m
	DsCuGMr1lYF6zMLDzbB0QFFNy2MQLX7j5NFQmufv8RE9YHmav/r0YEiM/75WdFM0OcMYMfgX/836Y
	EepPBABrG/XksdpwIwKpWAhHXmj475e/pS5AFUR0wxzIaPeP5Ra2TGE+qaNBVOM1eXLDlq9uLJVRa
	4NdIhiKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbUHg-0000000FpO2-35Fs;
	Sat, 25 Jan 2025 00:44:24 +0000
Received: from mail-co1nam11on20621.outbound.protection.outlook.com ([2a01:111:f403:2416::621] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbU5C-0000000FnTy-2Yh0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 00:31:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZhN01//hFqHkG3EPjq7WP9ouWJjO6p74Ft/RSApiz96dgJq49YR4r4Rhd/NLDRvtzia/HywKW9YQAv5e77C7paTiIVXQNWUtk46KEOQBI96/0Gxit2M69ppxJwmVrP4upuJm+EOdyoiC3/mHWim4hC0j9ZpBEzLYf3NcfYJE2wZDqsAFFfYlMosepkOVS/lFxPJ2d5PY5678LKwhzx042sTrD7hQ93caWwizUW5JcVlLnvBPmF0O2UvQTxS2arjVAt/A6mWXSXVPo578PRPvcQ9XlwtfwhY3PY4O7tzfo1LVfqtSnUaOGFNh6/6Jgp9+u70Q+EZEzSOgwUfEhaVrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6B1qk0FhIAz7yoZNuejvkiVETda54KM8i2pXYDXu3Q=;
 b=SsaiPrDGLdZGU8TypWiWNHB/R/AnU10F2A+WHnyV4kTH3mGVi6wLKO0lIRty3zY0gvB8lEiOeHlu6zyURinS/+iTIkErqbe+QKDw3aKdiEJ8MouRCWFB8DpKOk+OgvuwWOX2+9Ge8hl6Ud3vHosPQU8HSADAlj8lTyPETmJFoN+a5znqVTVhlkY2eCO2k3pRvhEFZ5xBGvBn9JmvDDsxnZdVooL+cz59VpuXzGUIBKEyvU55mK3iUKr2Xb7/Eza2K0ofZPNGOanB/KGse+x4jshslWyiEDztm8tqCRj0whWXdI0xb6o5KjLgaLIqp360QnnxPzmy0SUbo5NceEVNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6B1qk0FhIAz7yoZNuejvkiVETda54KM8i2pXYDXu3Q=;
 b=EL5M6w+ImOQG77IpnGh7I70ffLffYqmyS/U+SspzZpHkxH+/nxr9K7/vx7WuoqESbSqqTU7nraUJxpS3VYNTCFevfnZNt1tjzN0d6BjzN9PmncAyoVNBuXFmhtaXkzk06Lgw33a24ueVv6Q3PGUIl51QtqvaoZl6mi8w75gDvh0erdgpaqwomypxhW5TvmdMxhCpiUJqNxR08CEFD4vh2vnGH9NeWUr+nls8CMkpYKcVJXSJwcle6XmWviT2sacuTtyglzcies3091qxsURns9pYdLaKkZRUDC5CJtfKhFqGU3/kXWW5Fp0EpC/OhSzHTIPTOLXxnq56R3U0H4sRtQ==
Received: from MW4PR04CA0274.namprd04.prod.outlook.com (2603:10b6:303:89::9)
 by MN0PR12MB6149.namprd12.prod.outlook.com (2603:10b6:208:3c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Sat, 25 Jan
 2025 00:31:24 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::eb) by MW4PR04CA0274.outlook.office365.com
 (2603:10b6:303:89::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.20 via Frontend Transport; Sat,
 25 Jan 2025 00:31:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 00:31:23 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 16:31:12 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 24 Jan 2025 16:31:11 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 24 Jan 2025 16:31:10 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: [PATCH v6 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE for DoS mitigations
Date: Fri, 24 Jan 2025 16:30:43 -0800
Message-ID: <436ac2021bb3d75114ca0e45f25a6a8257489d3b.1737754129.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737754129.git.nicolinc@nvidia.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|MN0PR12MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4fae67-985b-4771-d833-08dd3cd798fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mSTpPlMOIb2jOSEzWGqb2YHmEnt7rUDJCNsZiu5J44gpoa3tjbayvJjOvoxR?=
 =?us-ascii?Q?xIollgb6wSeRPRiOOef2yqoQYCwfOXFvMSiQ5wV75Zp6SnuEVrnNmXtZYSDc?=
 =?us-ascii?Q?2PA4rRe93d3JDbzYfPi0v+WAAB4ejtABtLFSDngUNjD/n7PhIOr4HYX9KfU5?=
 =?us-ascii?Q?wvXyi+N/Uy2RH9cmDzQ1tWVpCc/+PamLLKxIVVEf6LvKhlTizIKTXPTFc9wO?=
 =?us-ascii?Q?5RACLMTn+ctHs7paQl4y+vhGt0tauFnvZ/1Ux2Z4T9K3zUtPoD9SMSD67ACP?=
 =?us-ascii?Q?jaNLyCYN9NH7WJ6aUwPGRekoSWN7UHrLa6d9dTWoTdKKTXW987X7t3AP8ZkZ?=
 =?us-ascii?Q?XKys7WrDrLdENmt+x7BX8OXu3XsNqgpWgaOLUuidC53Dr66UNU2r1g0xcIiZ?=
 =?us-ascii?Q?G+kbSDIYfdirPyXgzCEP07jw9PNeDSFk1o1YNW5ZJTCyuMMjRr6Da2HKPCk3?=
 =?us-ascii?Q?3o4fbZBSJN2jt2vinxoAnnZdkp1IuM1CV/EQYeIP4KByb2sj2T/8s9ALMN0I?=
 =?us-ascii?Q?QdSi2XTJrVeYnFGbiQuYS3ZZWaRrlTQ9rIeyE8hm8NXWNvByfT4qQtSRi4Ze?=
 =?us-ascii?Q?RF7bFMgMhpfoO0CNRI4CjrjWsbMCrGruyPRgjMcimw0yApBhW5oDt3DInJS2?=
 =?us-ascii?Q?ZiAzUGkk/raP8AyTBaIifayM+fWFTrJKgQ2NQ+il1YXUJvwMVuL5mu3eCoDb?=
 =?us-ascii?Q?vGwLJmAxVm8XPb6rpK19j60BlweuCc54MidVrYvp2F/tcz5fPqP+zwCVgNXq?=
 =?us-ascii?Q?8CYprTw3EzFbVvo3inNlEK/WtqDd3ehE50JQ3AalRXPJIQ37KPvcTAFjAcfL?=
 =?us-ascii?Q?F6VNH2nsN9iEX0m/L9oEPmuM5fkyzxHDn6xaTcJ3c17l9/l3JaKla4VKEv+C?=
 =?us-ascii?Q?qAv/v++c0Dps/Zc2ieJ0gikFEZzPLCU91qt2qUcdrow8mQq14xVwxhLX6T1t?=
 =?us-ascii?Q?peZk5C/QvssE1II4qYw06u3p2gm4ozGccNQrInAR2qBXWnxtgXYpAMUYiq15?=
 =?us-ascii?Q?vtvCfW3Nu52NycX1Sk2BTf/SOZNaeVYiJeScDsIUg3RurVCBo0uFyV+2uxiY?=
 =?us-ascii?Q?uu+TF5RF9IWtD0ayNNsq1UUUyE4nrXvJmzBu//vJ6O+4MxnYxPUx7GB3AmPI?=
 =?us-ascii?Q?VAZ6x/NO8HgyIWdx7it5kupH0Xz+gm62QFfAGGTCSMNrbungdbcMHridsREF?=
 =?us-ascii?Q?8ins8uyUBx6Plz2Af4Nm/zsA836/agzFx7GOxBEk05v9/qBGh7QHuyl4dSXr?=
 =?us-ascii?Q?1+2/nrZYjtLTSQ2ej2YW9ou2kul50aEmK2iIajJBxDSGibmX1DuoBxpAXwra?=
 =?us-ascii?Q?lZ8xsl/YHrnzhtLOt0u3R2Je63/+ZrXwhDb40AIWXBeag8ftf3hr67zYzIm2?=
 =?us-ascii?Q?iXm6ZOw8mCdYsSGjJID+KRCGG+y8dWxazQallR5IeGDRFiCNrjKVgwwPPwDG?=
 =?us-ascii?Q?hj5IfeXt9zHGvbe8noI125R4YoAqoB2bjhUjsx4wz4Ug4cltPgw9Vvf1ROxv?=
 =?us-ascii?Q?DN4ZeSBINcnjdZQ=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 00:31:23.8599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4fae67-985b-4771-d833-08dd3cd798fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_163130_641580_BC2357B4 
X-CRM114-Status: GOOD (  12.91  )
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

There is a DoS concern on the shared hardware event queue among devices
passed through to VMs, that too many translation failures that belong to
VMs could overflow the shared hardware event queue if those VMs or their
VMMs don't handle/recover the devices properly.

The MEV bit in the STE allows to configure the SMMU HW to merge similar
event records, though there is no guarantee. Set it in a nested STE for
DoS mitigations.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 2 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         | 4 ++--
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index d24c3d8ee397..7181001fc5d7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -266,6 +266,7 @@ static inline u32 arm_smmu_strtab_l2_idx(u32 sid)
 #define STRTAB_STE_1_S1COR		GENMASK_ULL(5, 4)
 #define STRTAB_STE_1_S1CSH		GENMASK_ULL(7, 6)
 
+#define STRTAB_STE_1_MEV		(1UL << 19)
 #define STRTAB_STE_1_S2FWB		(1UL << 25)
 #define STRTAB_STE_1_S1STALLD		(1UL << 27)
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index ceeed907a714..20a0e39d7caa 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -43,6 +43,8 @@ static void arm_smmu_make_nested_cd_table_ste(
 	target->data[0] |= nested_domain->ste[0] &
 			   ~cpu_to_le64(STRTAB_STE_0_CFG);
 	target->data[1] |= nested_domain->ste[1];
+	/* Merge events for DoS mitigations on eventq */
+	target->data[1] |= STRTAB_STE_1_MEV;
 }
 
 /*
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 59fbc342a095..14e079cfb8b6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1051,7 +1051,7 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 			cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
 				    STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
 				    STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
-				    STRTAB_STE_1_EATS);
+				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
 		used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
 
 		/*
@@ -1067,7 +1067,7 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 	if (cfg & BIT(1)) {
 		used_bits[1] |=
 			cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
-				    STRTAB_STE_1_SHCFG);
+				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
 		used_bits[2] |=
 			cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
 				    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
-- 
2.43.0


