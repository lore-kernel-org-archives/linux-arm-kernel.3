Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A683D3ABD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDpF9CRUti3227FTVYa8lLDjxUwHOyud6eed1Is6rDA=; b=FaV0s5s3tszo3wQh+g16Vkaqxr
	hFzsaYThYdilwtiO3rUdCini0JkdbBH9CfJVLmhFYN5zQtfAeFuEwI5wHzcgSdLU7YRPGj7x6OVKS
	hM6AQ8A1eMWbsN5laVH9vODuRoz5xfzKHiATy0zy9T0t+WxQZBDmadDa+DXBGTCzBLpnkDjqSNNDd
	O4qa+ZJMMTNmQQ3OWTUjUljapMxpZOMaoHJBU7OdJh7fjV9F0IU5Vs9wVMnCWuAlB9mc0JB0HO9D2
	VK7XJL0Wy7IaB9q7dUfkBEGBeakli1uYa8uMcg/hdmTV1VL8r5scKkEI/QhrMOEIAELpoKpQTPbbA
	wYlVqOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRgXx-0000000AO8n-3H5s;
	Sat, 06 Dec 2025 00:53:13 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRgXu-0000000AO7L-0xW8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:53:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlQn+jDWY9g27E7T9fEx/QrRB5kCwGI+7b4KtTfkYalWU5iZkvx8tQkp4J5Se64U3CdlTebxplUNgyIAY7Z5pSs9sfo/UsRsJEs+vBzLc9NP9Jloc5mFIBAT9IEEETUyjqEM7QEwVRR80I1O/9+ryIOe4adpDuCcjkejrE/wAeZQKLhnVH493X7PUSOMIkQ3ltLZcMGZpx0an9kPF0twsJ//h5U7lI+vZj9Ec8eqGESrsW66y6xcLPc7KwhTplGSBtzF7yOaSZAktCetHVrx6Uck4adtpNopQk3WYoyZHL/oYkSnPuL0UyVGqsWBLPRVyv7/3DhMyHGzfxPa3C6+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDpF9CRUti3227FTVYa8lLDjxUwHOyud6eed1Is6rDA=;
 b=BFfiZNNpjsXHQPZD4/gb0ULwq0Tgj+FAb/XDik4Zkuk3+hHw/yBzKQyiLc4BATX7XN4zXqwSgUwo+Hmu03AXjDf1f2ZbLnu4vzdLweO6s5g/cWSwPhzQratjrUrOr75C05ULfAQC16+tZOJ/gCZ2r32oH9cDR3LVoTjFDxORjPJSjTCCpHGkv8EkOCi/Fe5kPpAZfBjisNpGFU9iurmohPZ9AN3fqBZwLz3NKZ2WhuEOZOo1RoGtmhj5/4EZHEv6vnxhhLr7D01k1dwA50tgQOX0VRJ0zfpWNs/e/FveAjAh4xOyzaS8CgEbK76XK8g1bL9jd5tMueHECiO+EPDNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDpF9CRUti3227FTVYa8lLDjxUwHOyud6eed1Is6rDA=;
 b=ceIQn0szkIMn/vPk6sUxg6IZITel/aUtB5E4O04cGlxBZRFMfuzSrl47qm/Uu26RgTcizi3XQIaKVRMdcYVG4b1SOBn3yNyw9QLWFBZ7av1uBPtoLW+q6QodKpW9Y0LisXwGFDvAVRT9g7l4w2QY1GzUP9h/u2/JQmZzgd45MOAsl8RMLFC6Vp4GdRBv+9BzF9M9A3yWISZH6iptCPi1fXc9EYW+0AKgOr/N+ZnyZ7UfSm6t8tZRgeQ8UJ+ihJWq9HwlXidtvJxyOWvP0d05JwBNzbq+vGEWJbohb1XfbBHtEhkTRBIYs2nUZrlT4JFRf3b0cb6ZuuypavxUItSk9w==
Received: from SA0PR11CA0143.namprd11.prod.outlook.com (2603:10b6:806:131::28)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 6 Dec
 2025 00:52:27 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:131:cafe::ae) by SA0PR11CA0143.outlook.office365.com
 (2603:10b6:806:131::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Sat,
 6 Dec 2025 00:52:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Sat, 6 Dec 2025 00:52:27 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 16:52:20 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 5 Dec 2025 16:52:20 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Dec 2025 16:52:19 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<skolothumtho@nvidia.com>, <praan@google.com>
Subject: [PATCH rc v1 2/4] iommu/arm-smmu-v3: Ignore STE MEV when computing the update sequence
Date: Fri, 5 Dec 2025 16:52:01 -0800
Message-ID: <caca8d769b1ca0d0ec196a4fb264b0e36b1a4074.1764982046.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764982046.git.nicolinc@nvidia.com>
References: <cover.1764982046.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|SA0PR12MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: c271487d-5866-4b4f-f8e1-08de3461ba42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8xqyGgbdqm+oY6eJgnnY5ODWWA1VA2H51EaHY9sDP3PBhgmSOWLvqilfUNbG?=
 =?us-ascii?Q?Vv7MHAWMcTfwTm+lWPy+YRklzFoVS8UGHZYXLD7+qefrLdgknDRCpF6BGAi1?=
 =?us-ascii?Q?PAa6qpD2b3x+8fRsYRUwv9uGiVBS5vF4NUEbNsQecWqQkQJlzQZ4lJZGXtXz?=
 =?us-ascii?Q?6r3on1oaKtrihL6fkQLiw7PddJbYCkF31Yae8Zkgh65K6BW/w9+GAMaagOP7?=
 =?us-ascii?Q?1LURJd41R6U7Kyad+yjYzIkjI/IBBxIpXeGyRXropxdp9mbxvicSjCDBzvnp?=
 =?us-ascii?Q?rpXcgTRGq9y8NsTiIn89FFsi/A8Ba9iWFyYW72gtRnU2+4zv9V+SfWB2JRCB?=
 =?us-ascii?Q?qOZvxNk2CdSaXwNG9qqOUwOVGnCuiccSSXxeY07CewPSy+ShkA9Nge+KHMtl?=
 =?us-ascii?Q?awuGsfoB/Q4kHBQpQ7cQyoh0WrsmIpLSSYQdxRtbZ9Kw9ev5szgaTmtQzHYw?=
 =?us-ascii?Q?RcNNh6eFkh6tHRD76Qs6KT3ZicrZ4luokp51YvzW59/wNuf/t27xHMuzbFUh?=
 =?us-ascii?Q?D87kb3oXtBt3eUxUZNpOYFhs7cbAIe0ZHW1nO5BZafMpxyERMAZxqDdg3JqP?=
 =?us-ascii?Q?sBqAVWpw/IEXnxRbJTjak45xwTxKwabIs/RQjelS1IPtgGUeWv8gIqD+PoJ5?=
 =?us-ascii?Q?I+psWYGauYG7bIllUnBWf6AZz2ciZhNMpwlZ2+GQwcGvI//qaPUTZ+StxeoH?=
 =?us-ascii?Q?D82OFC0B7btp2zbTGEAtOsmk6MAcmaxSOsTSb3o5VC0ofW3V4yZ0Z8sW5IIt?=
 =?us-ascii?Q?Ky1dXxg+5XOWRdWJY+6so5s72lP2423cTVt3LpB6FfgyYdU1CgcJ1MVeEelb?=
 =?us-ascii?Q?olgr1/zMdK/MhzEoeM787At4nRDDwAPtMCumPYjD3dR2xs36IJ9OMi2jtFwV?=
 =?us-ascii?Q?gg1dZ6rAbY3pRNYqi8EWMx4r/43WBTwJ8SVIBmRkkxw1uTNBmLwY6tfSH7N1?=
 =?us-ascii?Q?QD7YrDjyRGy51KkepmSQovlDAPpkgN7w7BLcl0Oq/yWJPCVGtoZ4tMZ6LjeH?=
 =?us-ascii?Q?DydgmqiJrv15Bw8ueFo4fOVfXCw6D2jr2Lbpgbv9Ef/7VRwILFYVlhrdh2jg?=
 =?us-ascii?Q?7F3/6FLaORUlWe7zdpch3XAM4sN4lEh2NkvcybkxTDin0IRsRX2hM0S624FC?=
 =?us-ascii?Q?LFbCJoyLsv6rSpV5+MmWrYF5lr1sXAi+2x/vMcyv1CYJfre0W62741l2INKG?=
 =?us-ascii?Q?j/Onm5OG9bMU+KkEON+e1/mwnKH1q3djDNLEDhTvNM2sfcFirKWkPgSt74Cu?=
 =?us-ascii?Q?PRiqL0ZNPr1ORdlOMD1623Tn0TKWmBc66lF00oKP6/u1TTztI1NySW7KpMo0?=
 =?us-ascii?Q?Cb4nU3KKNHbtH7fWzW7LHXMqMj9DcOztTEM9PPH1l9oT1xL7LEokv6VJM8Fk?=
 =?us-ascii?Q?f3ahnd6u3NTKia7N4WVchllUTE6B9bpL0tiaFafXH1jTm65YJkaCFE7Q2wjf?=
 =?us-ascii?Q?YGz9yK6nTVgjw9hOOnEwFprWLZAr2K9LEqfjMkw8USIEp1nvzMcPWumkcBk8?=
 =?us-ascii?Q?+jjz5Gr8igSpPK7xQZ/fRxgUhWlzNqZKcXTGENcTiqv3CtcS5oWRsLJbHLWG?=
 =?us-ascii?Q?iZWlqJhzSCg6Bex6dPs=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 00:52:27.3289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c271487d-5866-4b4f-f8e1-08de3461ba42
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_165310_268437_BD2AF1FE 
X-CRM114-Status: GOOD (  12.05  )
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

From: Jason Gunthorpe <jgg@nvidia.com>

Nested CD tables set the MEV bit to try to reduce multi-fault spamming on
the hypervisor. Since MEV is in STE word 1 this causes a breaking update
sequence that is not required and impacts real workloads.

For the purposes of STE updates the value of MEV doesn't matter, if it is
set/cleared early or late it just results in a change to the fault reports
that must be supported by the kernel anyhow. The spec says:

 Note: Software must expect, and be able to deal with, coalesced fault
 records even when MEV == 0.

So ignore MEV when computing the update sequence to avoid creating a
breaking update.

Fixes: da0c56520e88 ("iommu/arm-smmu-v3: Set MEV bit in nested STE for DoS mitigations")
Cc: stable@vger.kernel.org
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 95a4cfc5882d..2df657c87abd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1052,7 +1052,7 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 			cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
 				    STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
 				    STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
-				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
+				    STRTAB_STE_1_EATS);
 		used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
 
 		/*
@@ -1068,7 +1068,7 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 	if (cfg & BIT(1)) {
 		used_bits[1] |=
 			cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
-				    STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
+				    STRTAB_STE_1_SHCFG);
 		used_bits[2] |=
 			cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
 				    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
@@ -1085,6 +1085,16 @@ EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);
 VISIBLE_IF_KUNIT
 void arm_smmu_get_ste_ignored(__le64 *ignored_bits)
 {
+	/*
+	 * MEV does not meaningfully impact the operation of the HW, it only
+	 * changes how many fault events are generated, thus we can ignore it
+	 * when computing the ordering. The spec notes the device can act like
+	 * MEV=1 anyhow:
+	 *
+	 *  Note: Software must expect, and be able to deal with, coalesced
+	 *  fault records even when MEV == 0.
+	 */
+	ignored_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
 }
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_ignored);
 
-- 
2.43.0


