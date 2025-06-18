Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FA8C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYgHwaqz7dtM8GcCWTXjx6ztNzQMVJCmYW6NAwCYghI=; b=HXAM8roYiK8Msiyu7/5FMNezEk
	/VCOHgVerG5Y8/sxRSN+dbkWyjZRYzAO/PEHD79nixdvCQO2kHHq0B+V3JHexH7cr1BZh4JgrupDG
	N2oWB64mNfx+S5UvhXA8/p+k8VJVToTABWfZSFsg1BhPip3Le15cWz+u0VbL0tiKizEQiAjlabk9E
	cMkFqW5D1J3otQizC68FeWfc9n/Jccz6E1kG97GL4Uv9t7xtSIddzUiMLHXWQEUKHi3p3U5GVgAA7
	NYMDbz3xz+J5+V6uxr2b2OGGQ+oCgKYsOBxEzaNhFVlI3p/QFxsIVYPXfcbSKXFIwAVTMcVWuZxmC
	N2sK11OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmsI-00000009FtC-1Lwq;
	Wed, 18 Jun 2025 07:06:22 +0000
Received: from mail-bn7nam10on2060f.outbound.protection.outlook.com ([2a01:111:f403:2009::60f] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmiR-00000009ESq-0nel
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 06:56:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEn30JkBxoUxvRc77r7/2sWF38xiPirY0lIlq3ZzvZ8+3rQvHdjishVl9tv9IwHjMDsXWsaWLzoIYahxYlzAOYpPYef2cqFiFVWWFNe9csKzettOihMEUl4N7CxG9+RI4rK9WV4U5lzFk+SFZF5r+wvZKy+wRWBudoH6ziuhqN/PSHFlADxX8i7eJQsDWQgHmD2f5gVmMshggLjKNYrjqMamlomN4m+nnClhQwWRbzXB94mN0voydBTosLIjgwCyZu8tmCHhFWbP5XG5asuhlQfZJSfKYb0Y9X6Fh3L39LbSdc2SFwYgOqofjv1Y+Kb/4FZ/dxs4LJ5W37k4WZWMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYgHwaqz7dtM8GcCWTXjx6ztNzQMVJCmYW6NAwCYghI=;
 b=y1I6jxnux30oqJCQlaPzalvSk56aTLL5tRdOHslbLE42mVP8PoAk9ueAb+WVelev3Cwyz4yKUvHyvVGbC6Kf/Xg2PCpWFdWxB0GgWgNQxpvU7uHRSEXdg32wCvq6A5zp3hkSaYlM6LmQipYby+vMoVEVyhHN06Ji6Cfhu8a2K0GUYT/tTrXQyJver64u9rhqzXNsQY/uFLD3XJtuKAm1WzDmMX/PHSQ19zQ91pLvzOgijHzHSrPaXQZ/atYw2JeRcRBuoN07eKGJVG2rwZQYhGCSs2XdPkAuCaKpKWnCkuLW8EetB1DW24viUa+cWQC9LC7ktPMX2NT36u9hxKkTMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYgHwaqz7dtM8GcCWTXjx6ztNzQMVJCmYW6NAwCYghI=;
 b=B9hlHugqxnzdklgyCylVRs9ryZGcbmzXIpeE87N0u8Pik979Mi3B8PvmtDYb213dvxo1oeaxGYfSIausrvEIcosCsfkbCLpRiW9ndtmmMStkckPBwxZFIpGKsYcuIbHEoQMSDh5iaPo097jJtXcokTJWw9kl6zHRGne4T617A/WaRbO0xpTY54Kda5MQNaYf6pWq7yrppUz9vWv/3GXHBxioOAea0DZBedbTBE1vlCzHLrK7ZeY/ydce/xeSjXuCcSIkGbLSufX0zLVP4vHrd/JBEyELrf9f0kj95bNqQ7L5Zrz5ICpRJInlQlw5GeTLKGGL1xIoo1C3GuvvHkrJ9w==
Received: from PH7P220CA0111.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::35)
 by IA1PR12MB7760.namprd12.prod.outlook.com (2603:10b6:208:418::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 06:56:05 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::27) by PH7P220CA0111.outlook.office365.com
 (2603:10b6:510:32d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Wed,
 18 Jun 2025 06:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 06:56:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 17 Jun
 2025 23:55:51 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 17 Jun
 2025 23:55:50 -0700
Received: from localhost.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 17 Jun 2025 23:55:49 -0700
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
Subject: [PATCH v7 5/5] KVM: arm64: Expose new KVM cap for cacheable PFNMAP
Date: Wed, 18 Jun 2025 06:55:41 +0000
Message-ID: <20250618065541.50049-6-ankita@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618065541.50049-1-ankita@nvidia.com>
References: <20250618065541.50049-1-ankita@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|IA1PR12MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dacd5bd-1491-48c4-9f68-08ddae3531ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rShfu/Q5wNpE5miOakxkvJTfopGWH08LNs88ADyV2MWbKscKnNrX8xFYWKvb?=
 =?us-ascii?Q?xRVQo1f7iOo/sp8AGrdRppQ/FNWeiAq/EOfzaSzT7OexwbygTmSW/HYuu8Hq?=
 =?us-ascii?Q?NF8xFchndPTQKUVMcaJ5i4kSm5jtWMnWirepW8xFPjPoeRc3XJU0EBUX0pBm?=
 =?us-ascii?Q?5YV8vy9XzHDbfuujrfFWkkMKoQQunDI4vpjQ3rGGcFl+ofJGX61fhNda3N3X?=
 =?us-ascii?Q?Ebjt/BqD70Y9I50ugf58ljRoJmv2haASZ74GyGwrR6EI0dE+UL4XWuPbXmUU?=
 =?us-ascii?Q?bhWIKq1yONQsEMOEN9ySHdJqDExQbIhnaKqm/2Dz4XqGnzBrjnHiE/ioZ8NN?=
 =?us-ascii?Q?wVI7ivFILVhkjW4vOlvZNGEJ9AR0tU5cm9SFuxeHs+KUWXrN7JRjEc/oozGZ?=
 =?us-ascii?Q?cPYj90NFhPWvPwfBjGOoqWTsynJ1KMkTAD1tXpxnCNrwFXD02AKeXHtXHxJ6?=
 =?us-ascii?Q?1Ror5g0/g73XIRZ+PM8Yd+zMZVqXkyVBM1/IaCG3ifk1rR40DDjEih2QpPc9?=
 =?us-ascii?Q?C/GsgvJVX2aogPCTOF4tLofMvBQQBB5OlG//XjJplBdXTQn0Cpbm7Ww5dhJF?=
 =?us-ascii?Q?+7gkalsyHhspidYLSkL0TLYRvxlOtBlcOuwlMLtdvRUbJaJI5KXSOQnrZGSi?=
 =?us-ascii?Q?vHo7wKB4oiauyv3jb4PzAnTdtyzjjTRzJik+HqRlWTUEAZ/XaAbdpdLzWnbg?=
 =?us-ascii?Q?KaF8Bzd2KEki1x3WloD/XitwKFIjzYNIdsAR7+H6dUdMDksH2DVQ8nrsQRZk?=
 =?us-ascii?Q?fDVdC99R2njVPMGyx8ykN6Vx0vXFsDZWRDpHxd6tnDsMGy9V0VUrut0SyRt+?=
 =?us-ascii?Q?NgfZss1bHkv7HQXMq80sFNjzITmOs04J8RMI+LcLivH81pBwjBhzeFUU93Qd?=
 =?us-ascii?Q?b9XJRdaUrW7oX2QUrxQWanE9fnHfYHhDIgzM9xj0tt3MschYZcOYIokpnsSr?=
 =?us-ascii?Q?ZOjSnk0cSyUZ/l2gMV765v4l8HHkeWtvJs+0ebR0web9zicsjoVyYrexRLFj?=
 =?us-ascii?Q?U9RR74qcbM8IG99iMJzRQ+P7KgMDuAeVzdudA5pzW7pPF7PJxiQe7TUO3BWO?=
 =?us-ascii?Q?dbrBH8Hkr+pqGOyL3NGGlxe2+Dm4aMMlJbeIR/Y2c0sxLzzTFTQfcVu23o6F?=
 =?us-ascii?Q?Hm8lfFDHtU7b7HAUpEaIHLbK9xJWMEm84SOfaj6IGQbQzjJC94M9GQ5lj49o?=
 =?us-ascii?Q?25fgpiyc59tUHKUpkLwGSHNjiY+1Epc1ehNY9KlIrbFP0h055Z56//PAxlhG?=
 =?us-ascii?Q?WdnNPnzLsJQGtAdFL18mtrezLZicnl+zgzxDmumORonz749gHVaxbjcg1or8?=
 =?us-ascii?Q?JM3BvFoFTmIcLwrR4swk+mQB7Mysgk9vsoLdjOW/e3+zw0+zCnvDXEEnCk/O?=
 =?us-ascii?Q?cceJWecrpl43N/4YJmWTrXJALlhZiHkbGJa76krWai2j0y+UfXJKerWgpfpv?=
 =?us-ascii?Q?U1HPi1OXIVuX+l2a6XD/xbSRhpRMYNbogUST7x1jzQ/8JZT/RlwN/ZiTGLU+?=
 =?us-ascii?Q?4x1rFe9TvojSZamb6yqCkir/2f2el5kvftRvT6+mSmz6pCG7bH518eW+ug?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 06:56:04.5372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dacd5bd-1491-48c4-9f68-08ddae3531ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_235611_233458_FEB0D02D 
X-CRM114-Status: GOOD (  13.82  )
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

Introduce a new KVM capability to expose to the userspace whether
cacheable mapping of PFNMAP is supported.

The ability to safely do the cacheable mapping of PFNMAP is contingent
on S2FWB and ARM64_HAS_CACHE_DIC. S2FWB allows KVM to avoid flushing
the D cache, ARM64_HAS_CACHE_DIC allows KVM to avoid flushing the icache
and turns icache_inval_pou() into a NOP. The cap would be false if
those requirements are missing and is checked by making use of
kvm_arch_supports_cacheable_pfnmap.

This capability would allow userspace to discover the support.
This would be used in conjunction with the
KVM_MEM_ENABLE_CACHEABLE_PFNMAP memslot flag. Userspace is
required to query this capability before it can set the memslot
flag.

This cap could also be used by userspace to prevent live-migration
across FWB and non-FWB hosts.

CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Oliver Upton <oliver.upton@linux.dev>
CC: David Hildenbrand <david@redhat.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
---
 Documentation/virt/kvm/api.rst | 13 ++++++++++++-
 arch/arm64/kvm/arm.c           |  7 +++++++
 include/uapi/linux/kvm.h       |  1 +
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 1bd2d42e6424..615cdbdd505f 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8528,7 +8528,7 @@ ENOSYS for the others.
 When enabled, KVM will exit to userspace with KVM_EXIT_SYSTEM_EVENT of
 type KVM_SYSTEM_EVENT_SUSPEND to process the guest suspend request.
 
-7.37 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
+7.42 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
 -------------------------------------
 
 :Architectures: arm64
@@ -8557,6 +8557,17 @@ given VM.
 When this capability is enabled, KVM resets the VCPU when setting
 MP_STATE_INIT_RECEIVED through IOCTL.  The original MP_STATE is preserved.
 
+7.43 KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED
+-------------------------------------------
+
+:Architectures: arm64
+:Target: VM
+:Parameters: None
+
+This capability indicate to the userspace whether a PFNMAP memory region
+can be safely mapped as cacheable. This relies on the presence of
+force write back (FWB) feature support on the hardware.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index de2b4e9c9f9f..9fb8901dcd86 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -408,6 +408,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES:
 		r = BIT(0);
 		break;
+	case KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED:
+		if (!kvm)
+			r = -EINVAL;
+		else
+			r = kvm_arch_supports_cacheable_pfnmap();
+		break;
+
 	default:
 		r = 0;
 	}
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index d00b85cb168c..ed9a46875a49 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -934,6 +934,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2 240
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
+#define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.34.1


