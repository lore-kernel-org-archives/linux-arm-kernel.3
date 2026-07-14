Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1497C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iv12xa8xSJnJoJEnVnmfSvAq+xLYmR7cU3Hf31un0Nk=; b=vU30EAHnxgPgIoOATYs7iuQ4o2
	K7uD3N1nMg2BqMbSLBnsFa8ANW8j/jKpt/Klce0MoAkcVU4n5xhOa4d8UsRe6HQFqvopDbJxAcOUd
	nSK67IVD9sONoSZv/GQtJ9JG5pzADRnTEli9w90Xjj7ysNdlLMP4Ojsculltm9gnMFaCJIvF37iYL
	EILjHfyW30ydcFrjjsDBtocl5lgNvdlPQope3hZ5GFDQPV1KIRvNsWp+PXSAlITNHycc/w1GbhyHd
	pJKBpUtp8AFEoFG4fi+4NFdOkBiBtjJixwrxRlHC/q3hdMejD0hCXvl6AZW31T/fuyAY3KkvF+xa/
	JLZ6r+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wji9O-0000000CufR-1xuK;
	Tue, 14 Jul 2026 18:46:38 +0000
Received: from mail-southcentralusazon11012026.outbound.protection.outlook.com ([40.93.195.26] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wji9B-0000000CuUP-15he
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 18:46:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhIJ7Qf+QzIcf3om0Cgyg7McqwkdsZEDhT7bLusJoj9BjBhxanHD72sFtn/ONewxheTZ9NSUaxXcZK4r6ZClsSwS4OpmLIvL9nfUasLBpOsCPWCYphvnr1lHduWJsCm4ZD72n5VlRLhwTWzaseU+Hx3MNFUwUb4pPFxjevKOvEsB5mZB3HlBKix/ISmo8CCAeIMGjfJmOxN7B7MEevTlqD92//35HfVUIJTmdhejq9h5z7+H5N28791CZYZDhnbV6pAYPwAOWQYQRCERaLaYDYLXbZ81h8bjgAMx4OGOow2gHbipAZi/eM0LhgTsnQ6EL8fDO1TxTTubNnfKkLlDUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iv12xa8xSJnJoJEnVnmfSvAq+xLYmR7cU3Hf31un0Nk=;
 b=JBmsj5yGWCqX32zqfVLd4UNV5qJtfndml5pi0jCShr6ec4a8A4snfon//djbi67VmN+uXkEvEFxCV3i/zdI12J/YO93x4rMgtgKPL1o3qVvBK7Uox67Htc7bLxM0rard1MOt0mrh59Ic9JMqUDaSN9R6rWobjP3j2nrBZ79f1eVmdiqGx8o2YOg2jALfS50C0DZxyz6peGQkxfCvCK6e2MtgTnMO5Sarf841nyTUm2UtoD3ULN+U9MHKA04Np3KQoZDubKeP4bsP9Us2jzWHU1yitgcK27UoxnZL8l5hfRyHFUFQudQ/AMRvxVRjRDUzgQewTLORZFRj3KgiTe+CTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv12xa8xSJnJoJEnVnmfSvAq+xLYmR7cU3Hf31un0Nk=;
 b=IeJoNMS6yf10hmseBNuO9SmUhmHn9sfjOR0n/Q+qs8Yh0doSw0HCbiwhPHuh86ugFISgdvRKjakSeS2V56fymDhaGlZy3tHmX1el+Ce0et+/ialSPHwmmoyVMCTb4ErxoLNywM+kffRFjSQ7pkhFVsB0P1ENxhqyDL+seiU6v+Pp0OO+c+A8TxBVBR6uQivXkRUs65nQScaZcGcFjj7bqDQ1P6DtmITv78PIkOuL5Br7BGDh1bLmFk53yB7gNggP9jq1gztIL0ajZw52kzQL0MgXRZ2d+HsSeC99/gsY+7iANRArRJ99OpvkftMMwjzv6nJYjU9pEgsFK7qT+ZsF0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 18:46:12 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 18:46:12 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v3 8/8] iommu/arm-smmu-v3: Support the DS expansion of RIL's SCALE
Date: Tue, 14 Jul 2026 15:46:08 -0300
Message-ID: <8-v3-4e7f64f4e094+85e-smmu_tlbi_jgg@nvidia.com>
In-Reply-To: <0-v3-4e7f64f4e094+85e-smmu_tlbi_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0425.namprd03.prod.outlook.com
 (2603:10b6:408:113::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bbe34a8-928d-4de8-8e7b-08dee1d82c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|56012099006|22082099003|18002099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: gG4cVC2bs8GaT/uzL7KIa7ZuVJW1DfEEEs76JvmUPBNxjjLZJfTiRz35uArOXVL0GWvXGhTlpax8gIoq0PWuzLPoKnOJdZOfgtN+omszG6Y2QT8cYzSyveJu+xCBewe4r7Q41XIdjxuWt1RsosS9iUPSp8Zk9eNN83tJstqMyl2QDGfVkD3cFcGGpV66vMPE3rgzQpG9b76pW+9f2ObeoNMpv44LTG0pckiLCQY8krI96H12JpO87B45D7lxDU3zf3Qe+ZUfF8tLB873dk2GUKKkSdfMDzGPvZ3BbYtQ7YK4xXvcnnAGoeuJj1uFoEtDR+mS3f2JER4SL97+XsUPqVlpXqojKaqreCq0ZcZ/BFNzQckDua1CxnMhiiflSQvPqChqYjQbwXzRl1Bi0HY/OBMVjE8N/RE5JC9TF43ZGHqvNG+2qdxbI2s6HP4BGHZ7K90epOYbHDwjN6igicRitLxfTt/i3eqI2zuku4H/wdEuXZjZVA6zZNb0z+5NmPFC4g0Q03P2AOJl+8zEJFZdep6te4PIt0+/+aThxIqZM83fUJ+LbPx+ikaAFrIJxBG3EZZgS5gBkHouJ7Ho3uV1XYoBdk3wnNdXXWywZfxHe9vn13TIIA7V6YHASrtC4jFXCwwZ3/yESQdowoUsCRj0ER92qZKgG2iGWe7xAc7HULo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(56012099006)(22082099003)(18002099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q8TePc+w9sasf0PsgSoRIMVuuI+h/raOjIaj+86NjF4p/MAz+aFQaAyDqgMq?=
 =?us-ascii?Q?ki8lwvh+MkA1aVmAHjOjnZnHOKoMNrKQO3+Zur4GN76wHVlsiNvCf2xGuZf7?=
 =?us-ascii?Q?xYaNYSFaDOpUipUabl2riizfYG2v+vJSzUYRg9k4rEORcKy9soAgJvePkeug?=
 =?us-ascii?Q?B0RUmqRKu9Ry6i4W63iNHBHZ5UA3PidgLI6eB25yGLf/yRBJzuXVC+xdVFwE?=
 =?us-ascii?Q?FOWd3SESmGOKxpu2LFHs90JQcCOeOI7Vo90w84ntggjIlkUKk+iPp6XnxGwo?=
 =?us-ascii?Q?oac2OJZY5kD/w0Nq/Yi9fACvKOH2w0jk8Q8libnQp/UYBrvhfTnzQfp6j+1i?=
 =?us-ascii?Q?2vtmTwFYFkDCnivmdZDVq1DxByLOCbevTrz6CuoucZHC+HqcW4/zrmhZgvmu?=
 =?us-ascii?Q?9Alb8BBUAsBPyNUubgzdU0OpL7MsoYEA6Y9VAA5lhxIqrNn/0M3YyJswJsNi?=
 =?us-ascii?Q?j5as7e+Opj/vOWs0QqNS53jhbY/jfL4OyYuP/8rNh/MIk2b1PpmAIIgKYVet?=
 =?us-ascii?Q?Wp33jO5AuKRDKqFKtYFY026hIqHROg/8lKNDEHWSAQbq/QVDeoNKLPDIvW+n?=
 =?us-ascii?Q?W3AUGiAnY60Qnp+AjAD6WowwRk7Tvw7+T1GR9bZrYkxW6pXw+zO+su+RMBP9?=
 =?us-ascii?Q?T+rqLkbbCHeVPBbiViMnA+9teP44k31zgAooic8zatGRaKGqTcLeTyAVJ2Kd?=
 =?us-ascii?Q?HRPIftMVGj6nJOAXkB9N6eoEI1RrOVw4UDX7prKHiAl6JMKi9UHI+n7HRlNK?=
 =?us-ascii?Q?7U7LV/05TaheDIJF4FTnt7L1wZQcw/LF2Dnjwr1Olk+CL2cyfjOAPkC7BJFd?=
 =?us-ascii?Q?9SUPaOoay4vAuYshkZpF3jS+YtJe72mU9ulExCliOiCNHXGUm58RsiXTtNoA?=
 =?us-ascii?Q?nb15Ae5ZWJJ4YwhNAboleIkndFTaMuyIbZ1Z2A1YQZhZPrjmAMiNJb0Wkqnw?=
 =?us-ascii?Q?iFeu7uOzQOuXRMkqqzJnZvtT3pTVriHrWqcrDkWQK/Ns2pi9LcL7lnJN4A6U?=
 =?us-ascii?Q?CGvk2nfqXedJ79oKW/3Vy5xWInu/6FcxpWnmw193rJKYhzXIhVcJSO8Nuj3Z?=
 =?us-ascii?Q?l9XFFzN2/FIrxs5IQUlHKUf55ZVzjz0pkcbA/XQenpIcYa6q+OECGbG104xf?=
 =?us-ascii?Q?sSvqRSSVWBzTqk70d2m3WgHFtlOzcStnIkT1qiFCn1V5ShuE5Q8Tl3aXfJeD?=
 =?us-ascii?Q?uipmffgbIEEghp2GW31MoDm1a+5S2LJ1gIEcLAYYb44K5vzxtSDp95TIXnXa?=
 =?us-ascii?Q?gbbGP1MYDbIGSNc7PcO8eNrzBEdEz0aX4VFul2CAwC8B4f2FuEE7QlRHbIap?=
 =?us-ascii?Q?RZHw3U2HQz+VEwOzfN3S38UamPFFhYRGYuyjKLInPnmoa6YunBDU/B2UPJ3j?=
 =?us-ascii?Q?+uuZnp1bJpOEn26TOQvO+j9c7qajcpeYqnuMnz2IJdIb4oNdDBhdcPEsSR9j?=
 =?us-ascii?Q?hLlfso9IbHghPupXjLOM7Wdw7rRe0PnkfxCW7araN3rPgZ7WAA6rWMmOY9PN?=
 =?us-ascii?Q?luhFC/zHS35lS/4/AzEBshKYs43w0RadJUAb7r6rD/LcW/2y6NfWOZ9xl1do?=
 =?us-ascii?Q?anHeJnoiNX3mIBmZGRXMEcR40rCBIA45PTJwk/JQEeV4TsS8kJoi6xhcFYhT?=
 =?us-ascii?Q?cgRfeoRmvxG53Aa6QfYkFC+A4pXr5gVsqjokfsFylP/kbJ7ui031gwIN6/Sj?=
 =?us-ascii?Q?j0mzBOfM0V8uV2Rd5Z1Pc9C7vdR7RSiomZYcIequEZh6db1/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbe34a8-928d-4de8-8e7b-08dee1d82c51
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 18:46:10.7665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6izUhMPOW9YwXtDCQSiBu3ry3v6RLkUPV8JZ7WVPvXaurKvGZV0lTmCd34tMKP7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_114625_307119_298E92FA 
X-CRM114-Status: GOOD (  15.40  )
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

If DS is supported then SCALE can go up to 39. Detect the IDR and compute
a scale max that is compatible for the entire invs list.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 16 +++++++++++++---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  6 +++++-
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d54fff36731116..b1d47a3daa0070 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -991,6 +991,8 @@ static inline int arm_smmu_invs_iter_next_cmp(struct arm_smmu_invs *invs_l,
 static void arm_smmu_invs_update_caps(struct arm_smmu_invs *invs,
 				      const struct arm_smmu_inv *inv)
 {
+	unsigned int scale_max;
+
 	if (arm_smmu_inv_is_ats(inv))
 		invs->has_ats = true;
 
@@ -998,6 +1000,9 @@ static void arm_smmu_invs_update_caps(struct arm_smmu_invs *invs,
 		return;
 
 	invs->has_range_inv = true;
+	scale_max = (inv->smmu->features & ARM_SMMU_FEAT_DS) ? 39 : 31;
+	if (!invs->range_inv_scale_max || scale_max < invs->range_inv_scale_max)
+		invs->range_inv_scale_max = scale_max;
 }
 
 /**
@@ -2487,7 +2492,8 @@ static unsigned int arm_smmu_compute_ttl(u8 leaf_bitmap, u8 table_bitmap,
  * fits in the 5-bit NUM field (max 32 units of 2^SCALE pages). This may widen
  * the invalidation range.
  */
-static void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi)
+static void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi,
+				     unsigned int scale_max)
 {
 	u8 tgsz_lg2 = tlbi->tgsz_lg2;
 	unsigned int ttl = arm_smmu_compute_ttl(
@@ -2536,7 +2542,7 @@ static void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi)
 	 * address beyond alignment to tg (so long as TTL=0).
 	 */
 	scale = fls64((num_tg - 1) / 32);
-	if (scale > 31) {
+	if (scale > scale_max) {
 		/*
 		 * Range too large for a single command, use full invalidation.
 		 */
@@ -2788,7 +2794,8 @@ void arm_smmu_domain_tlbi(struct arm_smmu_tlbi *tlbi,
 	 */
 	if (invs->has_range_inv) {
 		if (!tlbi->range.use_full_inv)
-			arm_smmu_tlbi_calc_range(tlbi);
+			arm_smmu_tlbi_calc_range(tlbi,
+						 invs->range_inv_scale_max);
 	}
 
 	/*
@@ -5262,6 +5269,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	/* Maximum number of outstanding stalls */
 	smmu->evtq.max_stalls = FIELD_GET(IDR5_STALL_MAX, reg);
 
+	if (reg & IDR5_DS)
+		smmu->features |= ARM_SMMU_FEAT_DS;
+
 	/* Page sizes */
 	if (reg & IDR5_GRAN64K)
 		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index ca6f0bd21d7df6..00c6b726e39895 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -64,6 +64,7 @@ struct arm_vsmmu;
 
 #define ARM_SMMU_IDR5			0x14
 #define IDR5_STALL_MAX			GENMASK(31, 16)
+#define IDR5_DS				(1 << 7)
 #define IDR5_GRAN64K			(1 << 6)
 #define IDR5_GRAN16K			(1 << 5)
 #define IDR5_GRAN4K			(1 << 4)
@@ -415,7 +416,7 @@ struct arm_smmu_cmd {
 
 #define CMDQ_TLBI_0_NUM			GENMASK_ULL(16, 12)
 #define CMDQ_TLBI_RANGE_NUM_MAX		31
-#define CMDQ_TLBI_0_SCALE		GENMASK_ULL(24, 20)
+#define CMDQ_TLBI_0_SCALE		GENMASK_ULL(25, 20)
 #define CMDQ_TLBI_0_VMID		GENMASK_ULL(47, 32)
 #define CMDQ_TLBI_0_ASID		GENMASK_ULL(63, 48)
 #define CMDQ_TLBI_1_LEAF		(1UL << 0)
@@ -756,6 +757,7 @@ static inline bool arm_smmu_inv_is_ats(const struct arm_smmu_inv *inv)
  * @rwlock: optional rwlock to fence ATS operations
  * @has_ats: flag if the array contains an INV_TYPE_ATS or INV_TYPE_ATS_FULL
  * @has_range_inv: flag if any entry's SMMU supports range invalidation
+ * @range_inv_scale_max: max SCALE usable by all range-capable SMMUs
  * @rcu: rcu head for kfree_rcu()
  * @inv: flexible invalidation array
  *
@@ -786,6 +788,7 @@ struct arm_smmu_invs {
 	rwlock_t rwlock;
 	bool has_ats;
 	bool has_range_inv;
+	u8 range_inv_scale_max;
 	struct rcu_head rcu;
 	struct arm_smmu_inv inv[] __counted_by(max_invs);
 };
@@ -954,6 +957,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_FEAT_HD		(1 << 22)
 #define ARM_SMMU_FEAT_S2FWB		(1 << 23)
 #define ARM_SMMU_FEAT_BBML2		(1 << 24)
+#define ARM_SMMU_FEAT_DS		(1 << 25)
 	u32				features;
 
 #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
-- 
2.43.0


