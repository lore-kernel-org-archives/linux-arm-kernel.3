Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D43C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 07:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3632GqMJy9BSnLDnJnvtjPRZibk3lzWckHWzzg/oQM=; b=CnMlRUe63L6rpvsLyDeyRqLSck
	/69cj5eAlgAIH5ayL05fWeh3+G8brbFrEPGhagIVclb9xw8hL1c/bN57MNCsYbVcFLEHJOlnOkdxQ
	HRANaib5d4A1ByZJ/aCwmUEOm0fveWtj80Arz6m+ict8BM7Ae420hLXlqnX42dmAPsLPlJL3H4s8F
	5f8FEiT+0XQ3txgMQMWuOhMP4tmAVrKUVLN+lMyJJTPItmCBcAOKfmxwr79ov4IU/C18SljOJpobr
	WF8c95B5PXyoCi6AKzIays45pG7SjkRaE7xrjndO8U1TL4CnNeBu13Hno/NPqDU+CLA14+YNdLWbZ
	JIW/zeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmuU-00000009G8B-04FT;
	Wed, 18 Jun 2025 07:08:38 +0000
Received: from mail-dm6nam11on2061c.outbound.protection.outlook.com ([2a01:111:f403:2415::61c] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmiU-00000009EUS-1bmr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 06:56:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbyWohZqzDfGRu64olvVIE+yvKdy0oxugnK6p0CImBV+SW6yWaad2QUoXgy0haI4IunXW85Kzjw9CxytGJ56ON//QZjMlAK5pR4rPD/MM34f+IaWQEa+Q3yHTnR/6RyZdX3SpgPMeuCwdAzq0ZcU5iRAk2zjt3yDjljFaXNDEaclHoOI5e7IFCw0mn2Rr91JuTlMF0Jgq44rFJfeTmGipt0vjhTqninZ/g3hXgwrOba6fYNcMhCulGLKqjYTjqvvTnrm3rdfp2upVQPdzEm6LEcmBNvXn2Vj1l8mQ8+X7dqgi65ff3RCmFVSSSG8mbwnb8i0UAkMz+l0GXc3Q39KFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3632GqMJy9BSnLDnJnvtjPRZibk3lzWckHWzzg/oQM=;
 b=vGp8p5DINcfnblcInqtOeBbrZG/sOxrD76ohmaa7ziSc4Yk4PMzpbxUlr4AeztOQBqKSXQzr8Bc/WBk1HrXBZY1gxpMhhycGGDwxZCYS1+jZbJnhw/gVKLKAlgDYM1KPsYEIXaCEFbGTjPXOFeZaI2T3h6g05FTUIFlI6uZvXGqiXiKROOe/ofqIEnEXeUXY8i94z4xTHty8kfc1IXh6KQivA8EyWre+brSuSQpXCnctfd1XnnHS66KzUNUR8KoittvruhivbpG7/sG0VJf9QOuxV08Chz6fiL5igXeXO6MOFdKPia9hb3V4QwImApzATQexJ+pDrmHLDjQfMKxHIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3632GqMJy9BSnLDnJnvtjPRZibk3lzWckHWzzg/oQM=;
 b=mGpQOtm0p/GJI7DCEBlziTq910C13htc7w+MFb2+AjkG83F3EUNj0UIh/2av3gSpdUmjPDVYgsJM2TQPy1J6IobGAOv0On9WN3apH5DK4lAh5sQ5frUpqry5Rws5OwIFcZyZqsG3lWrk7kliUmqLb6K5wFmZwvpP7afStaqzmp+9e2A2EIlhZk/x1fX38R4MIQy5YMvZPJcWBl8AL1p7oj6ZpYAh7+KYu7+cvHGVfc5UIq9S6LHkSEfzmrgooI2wswwk5rNX+OZNl45qLckZ+QX0CJbRQD4iacnfi4ICBqc0xZQ9z+DNwF2wwePXbLDS7BBy39tSNFrA7CoKYRgBBQ==
Received: from PH0PR07CA0046.namprd07.prod.outlook.com (2603:10b6:510:e::21)
 by DM4PR12MB5747.namprd12.prod.outlook.com (2603:10b6:8:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 06:56:06 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:e:cafe::e7) by PH0PR07CA0046.outlook.office365.com
 (2603:10b6:510:e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Wed,
 18 Jun 2025 06:56:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.0 via Frontend Transport; Wed, 18 Jun 2025 06:56:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 17 Jun
 2025 23:55:48 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 17 Jun
 2025 23:55:47 -0700
Received: from localhost.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 17 Jun 2025 23:55:46 -0700
From: <ankita@nvidia.com>
To: <ankita@nvidia.com>, <jgg@nvidia.com>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<ryan.roberts@arm.com>, <shahuang@redhat.com>, <lpieralisi@kernel.org>,
	<david@redhat.com>, <ddutile@redhat.com>, <seanjc@google.com>
CC: <aniketa@nvidia.com>, <cjia@nvidia.com>, <kwankhede@nvidia.com>,
	<kjaju@nvidia.com>, <targupta@nvidia.com>, <vsethi@nvidia.com>,
	<acurrid@nvidia.com>, <apopple@nvidia.com>, <jhubbard@nvidia.com>,
	<danw@nvidia.com>, <zhiw@nvidia.com>, <mochs@nvidia.com>,
	<udhoke@nvidia.com>, <dnigam@nvidia.com>, <alex.williamson@redhat.com>,
	<sebastianene@google.com>, <coltonlewis@google.com>, <kevin.tian@intel.com>,
	<yi.l.liu@intel.com>, <ardb@kernel.org>, <akpm@linux-foundation.org>,
	<gshan@redhat.com>, <linux-mm@kvack.org>, <tabba@google.com>,
	<qperret@google.com>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<maobibo@loongson.cn>
Subject: [PATCH v7 3/5] KVM: arm64: New function to determine hardware cache management support
Date: Wed, 18 Jun 2025 06:55:39 +0000
Message-ID: <20250618065541.50049-4-ankita@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618065541.50049-1-ankita@nvidia.com>
References: <20250618065541.50049-1-ankita@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|DM4PR12MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: a60176e6-6ee8-4283-06b0-08ddae35324b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c5iCH+/0VDUsXVbKU7DFHuZOXbHWkxckbhmPqyMZIet0sfisF1INGuLdluDi?=
 =?us-ascii?Q?14k4Q3uvOT3vrxzdYyBzpEiYlBQffQMqrgBezWcF6m+280AFFON9XEPJWXg8?=
 =?us-ascii?Q?Ne64CrH8IWagAShEMwJfJeW7j2Pdb8tDkm/cT8Dm8DUTp4WS8DuUm3qCABNm?=
 =?us-ascii?Q?1icmEJ9UQBXv5rIC/fZOzT/tlnGVKCGd7e4RMK93y2o449DKXgiJTZtr0/Jk?=
 =?us-ascii?Q?1GSwAY0EQ8/TDTunYVK6F5CJ6+uNjy5KlIAGoT1QxV66bPn3umftHoWyy6uM?=
 =?us-ascii?Q?hl5LSugXlXwdzzxrHWTUPo6M8KzngFfS11mN3WB30uyvB2Yu1SqPQRszJXhd?=
 =?us-ascii?Q?Pszp7TzCE1rhrHVW30Vml8GeHl/AUXGi2TjyON8OrSE7TUEXKre63f/pohfA?=
 =?us-ascii?Q?gaj9/Nz1MyInEZPsll+IVSwD4N1OIqIFOVGBJ3sqWebGOf2K+d9O27Uu3vD/?=
 =?us-ascii?Q?fA5Ry3do6rxoBSWFCn/8zdKYkSVJuLHIzg3wJT44KrZvrdDriHTzfy6H+oaF?=
 =?us-ascii?Q?n8UzANGX1dFHjSTzAEr3AGBgc4NNtHbRezqpiIY4jZpxr4mv2kA7AgByZ6sh?=
 =?us-ascii?Q?1fWFTBWgWqNV9W+/oO5t6EdRn0iH71VAg9KAz8+zLdrpCjh1HAj33tqnqQnE?=
 =?us-ascii?Q?c2OoWFaUpX9cv8UQ067fi5qKOmGYg0HVTYD1omWdQ/ruD3wtTR+oLuLK7jdc?=
 =?us-ascii?Q?pSfS8O+BTZJblS8uif3vVHSqWKEL2nvho71clevj4K6MuXPGCmd54k9KiK+6?=
 =?us-ascii?Q?xwMx68BMUhCt3qERt1Wt07kKeSs3nqzw+S3JC+A6SujWeezxlO0EHQR3wuvD?=
 =?us-ascii?Q?pXwP1KQSphnkwuO/Bhesw2NQ/gORfS8cgLJSSKkjwRcbOAE6EvRehyStlDc1?=
 =?us-ascii?Q?RHbuC3iGF6CeyLo2MCpmiFkzDhSnDFa3wO4CZcPWbNlfYPKKNWUP6pWUuG1Q?=
 =?us-ascii?Q?ybM9rV9vQzMR7idg6KTJappiWBcQ2Hchn0WALaf5COcoJivlY/VikttANBxd?=
 =?us-ascii?Q?DRYZoCMdC7nGIcYQCRZ/lBUF50OZe48Jb6HP879iZOsmxmApNuzqvvFOKQwP?=
 =?us-ascii?Q?/6YYYmaxlUjlqXaI2G6hiZBD2t/GFBSF/phLEUpKJO6Eu9VTpeyqa5rhmOfe?=
 =?us-ascii?Q?m8RSsRmtBDRjoFJFNQM5dkHwkKW+eNbss/hf4GYxbPrq0ibbsni+9JHAiJQd?=
 =?us-ascii?Q?2iO5ZpL9cIFHH6BIEK50Hol2hO2EYehzdCUlE9jaS1/H7iixklubGEwZUjxh?=
 =?us-ascii?Q?rjI0EOcwut+CU6pVE8JdvYdp50qJITmP6xadifItjH3Y4oQJRpv5fvQusGc8?=
 =?us-ascii?Q?Au03YCp+0AYFvn+4ghbyeizDBgdUE8k/SBD3o5VT1cUJCwmIoH7h8phC/eX0?=
 =?us-ascii?Q?T93FvW/eecRIapAMv/T5ioVL7Zddtkz9nxnwMoa5VQyldOhOgmUPPTUv0lwa?=
 =?us-ascii?Q?vcNVVXyndwdGQPEr6GA6xKI6B9Hp+34ejuYVj3X5E0UD8Uqy4xv3r05LwhWz?=
 =?us-ascii?Q?mAD+T0ws3KNAK+EZ+HtWQujMx+DAwxOZbQETGITRW28HeJTDnn2yEPYCwQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 06:56:05.6152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a60176e6-6ee8-4283-06b0-08ddae35324b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5747
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_235614_424363_891A1CF2 
X-CRM114-Status: GOOD (  16.41  )
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

From: Ankit Agrawal <ankita@nvidia.com>

VM_PFNMAP VMA's are allowed to contain PTE's which point to physical
addresses that does not have a struct page and may not be in the kernel
direct map.

However ARM64 KVM relies on a simple conversion from physaddr to a
kernel virtual address when it does cache maintenance as the CMO
instructions work on virtual addresses. This simple approach does not
work for physical addresses from VM_PFNMAP since those addresses may
not have a kernel virtual address, or it may be difficult to find it.

Fortunately if the ARM64 CPU has two features, S2FWB and CACHE DIC,
then KVM no longer needs to do cache flushing and NOP's all the
CMOs. This has the effect of no longer requiring a KVA for addresses
mapped into the S2.

Add a new function, kvm_arch_supports_cacheable_pfnmap(), to report
this capability. From a core prespective it means the arch can accept
a cachable VM_PFNMAP as a memslot. From an ARM64 perspective it means
that no KVA is required.

CC: Jason Gunthorpe <jgg@nvidia.com>
CC: David Hildenbrand <david@redhat.com>
CC: Donald Dutile <ddutile@redhat.com>
Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
---
 arch/arm64/kvm/mmu.c     | 23 +++++++++++++++++++++++
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      |  5 +++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d6e0d5f46b45..a71b77df7c96 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1287,6 +1287,29 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	kvm_nested_s2_wp(kvm);
 }
 
+/**
+ * kvm_arch_supports_cacheable_pfnmap() - Determine whether hardware
+ *      supports cache management.
+ *
+ * ARM64 KVM relies on a simple conversion from physaddr to a kernel
+ * virtual address (KVA) when it does cache maintenance as the CMO
+ * instructions work on virtual addresses. This is incompatible with
+ * VM_PFNMAP VMAs which may not have a kernel direct mapping to a
+ * virtual address.
+ *
+ * With S2FWB and CACHE DIC features, KVM need not do cache flushing
+ * and CMOs are NOP'd. This has the effect of no longer requiring a
+ * KVA for addresses mapped into the S2. The presence of these features
+ * are thus necessary to support cacheable S2 mapping of VM_PFNMAP.
+ *
+ * Return: True if FWB and DIC is supported.
+ */
+bool kvm_arch_supports_cacheable_pfnmap(void)
+{
+	return cpus_have_final_cap(ARM64_HAS_STAGE2_FWB) &&
+	       cpus_have_final_cap(ARM64_HAS_CACHE_DIC);
+}
+
 static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
 {
 	send_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb, current);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3bde4fb5c6aa..c91d5b5f8c39 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1235,6 +1235,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm);
 /* flush memory translations pointing to 'slot' */
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot);
+/* hardware supports cache management */
+bool kvm_arch_supports_cacheable_pfnmap(void);
 
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eec82775c5bf..feacfb203a70 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1583,6 +1583,11 @@ static void kvm_replace_memslot(struct kvm *kvm,
 #define KVM_SET_USER_MEMORY_REGION_V1_FLAGS \
 	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
 
+bool __weak kvm_arch_supports_cacheable_pfnmap(void)
+{
+	return false;
+}
+
 static int check_memory_region_flags(struct kvm *kvm,
 				     const struct kvm_userspace_memory_region2 *mem)
 {
-- 
2.34.1


