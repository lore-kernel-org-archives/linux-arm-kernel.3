Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EFCC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 16:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaXOPNuoWZbkvn372SU9RtPMnt+hVXByG4V0S5FqS6A=; b=kRPfM1COL7qDS7ckg/xjmzHCFm
	npbvn25zKg0D0jkNfwo1RRcdabP6BCPMhK5sErM3yyEYp1hZyOgz0WSe+bS6W9kts0Py+IOfreqNG
	a19fkeDX3O5Lo3MTt9/LpAfRElUpdLf4WxJNxGpMk4TyYaGypy2TZFteqXiPOGzLMk7G1ArP1egHK
	8g71nJ7wkMd/KIEuX/ftz98t4JXfkbV7fYbj+JcUO7mA1HNrWkP9qMsUnig296E2OpkbcFWLCPPnF
	jOClvhfhITmOJT2mto5i4L1Q9TfMYqrejN5jlXXBM4z8/AayiCOw+xphmnQBHaznAPJkvkH/VLs7D
	9zavnsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUsL-00000004L6D-2oV7;
	Fri, 23 May 2025 16:04:01 +0000
Received: from mail-mw2nam12on20625.outbound.protection.outlook.com ([2a01:111:f403:200a::625] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUZv-00000004HdM-23M9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:45:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2Wdn5cduixafIA8HISdvxapFCNlc/s8k4pULzDX7RDfJ8lYQJTKXX5jrkvNA1HtL2vugmh9sSv20MSbbyeFjnyRvD7cLccjm6SZK44NpQ3+Kp8CEgmVO1lMNLFIS0xWHPlKWIELhxpB4R9MUPiJ4utzdxYnHshrXGtCKFAnNpuYOo3n3vs/3tPoe0DHxlDvChzt0u28J40s+ssgVEX7lXui4auqbzPNRvsXoApu5kfcO8b3H5VI4e+jaavBPoNLn5XL80Ewhj6TpUcLWrnY2pzYqoe52x25dZ+Wo16brOCiTDtTKSmctHZL2S0EMkwpJd5Sn5pqLQg91kErkaiRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaXOPNuoWZbkvn372SU9RtPMnt+hVXByG4V0S5FqS6A=;
 b=fNC3iLj0K7IOtzz7zjcyByxwLR4lDj+I/M7TeZNthE2b9k/FVwGwIbC1nxGuWNHvsmvUMe5TPLheHFYJFrEhXeiEFkmNsMK9V+ZDjsBnbuCR2gHDU/WBySoUIywmcZFQccwHb57nSEFWZs//Qrm+zcYvywkQ4t+YeAj6vDhwdLyNK0Z/3NaXlnFHGPjK4wZp50ao9WBN25vyPV8SLsTF7cjSi+Q092yMSu5TLRJTW2+52Rrc+gufKZOxsQuGL/vQhCY+5Tzel/jvbVIWCjHTYjQV6agpzwLlTVcnjdYQsYRGzLgEZqq6+1K97r9f8CyV4AnN/kotdHQLatA9i4n4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaXOPNuoWZbkvn372SU9RtPMnt+hVXByG4V0S5FqS6A=;
 b=KD43nDE6y96vy9X97YYgeSVQiTBJAUjoSQblK1AbWVgAV+bAoYw/ZUZ18+qXljTEOe91yyVRrtc2DUEkJVV1ymA/L8FgpOeLCWQ5JBEOqY13ta8OAPPLycGUTTyzSGVHrfXLPM67hxDL9YKi3IavqE/JetHlNTI3NSPjdEEe8DsHiWy0Ku/RSw1sIkF57nJ+JjR/BcGdaF8rTi8OSUNMyjYkf68JiUmsfGCFv5kc9+4QfCVcbklmrYSKBw+ZE2sNnwX+E7Z1vRA56CyLKg3GDe1C1kJ9qapsMGAmjw2W9nLsfaSrN80jr0588lUJ1K3guMxCCgzTAtettu5LxWQIgA==
Received: from SJ0PR03CA0288.namprd03.prod.outlook.com (2603:10b6:a03:39e::23)
 by DS7PR12MB6021.namprd12.prod.outlook.com (2603:10b6:8:87::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.26; Fri, 23 May 2025 15:44:54 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::22) by SJ0PR03CA0288.outlook.office365.com
 (2603:10b6:a03:39e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 23 May 2025 15:44:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Fri, 23 May 2025 15:44:54 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 May
 2025 08:44:47 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 23 May 2025 08:44:46 -0700
Received: from localhost.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 23 May 2025 08:44:46 -0700
From: <ankita@nvidia.com>
To: <ankita@nvidia.com>, <jgg@nvidia.com>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<ryan.roberts@arm.com>, <shahuang@redhat.com>, <lpieralisi@kernel.org>,
	<david@redhat.com>
CC: <aniketa@nvidia.com>, <cjia@nvidia.com>, <kwankhede@nvidia.com>,
	<kjaju@nvidia.com>, <targupta@nvidia.com>, <vsethi@nvidia.com>,
	<acurrid@nvidia.com>, <apopple@nvidia.com>, <jhubbard@nvidia.com>,
	<danw@nvidia.com>, <zhiw@nvidia.com>, <mochs@nvidia.com>,
	<udhoke@nvidia.com>, <dnigam@nvidia.com>, <alex.williamson@redhat.com>,
	<sebastianene@google.com>, <coltonlewis@google.com>, <kevin.tian@intel.com>,
	<yi.l.liu@intel.com>, <ardb@kernel.org>, <akpm@linux-foundation.org>,
	<gshan@redhat.com>, <linux-mm@kvack.org>, <ddutile@redhat.com>,
	<tabba@google.com>, <qperret@google.com>, <seanjc@google.com>,
	<kvmarm@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <maobibo@loongson.cn>
Subject: [PATCH v5 3/5] kvm: arm64: New memslot flag to indicate cacheable mapping
Date: Fri, 23 May 2025 15:44:43 +0000
Message-ID: <20250523154445.3779-4-ankita@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523154445.3779-1-ankita@nvidia.com>
References: <20250523154445.3779-1-ankita@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|DS7PR12MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: f8aa7f71-3dab-49d4-77fc-08dd9a10c395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JYzbOzNnY/DENusrRt2EEJFq7HiLBP3TmDjQVd6PfQgemvTe2bGyaK2uMxR6?=
 =?us-ascii?Q?DGjVMYdw1qfDAr2pFd/rfm2qQ1+gnWkho3iqkxKJVWWmu3Yf/nJ57xSfaDO/?=
 =?us-ascii?Q?4+U2Wro2TnC0a7brT/lDlUJqCzanZYqLa71GxTlU2ZKR2jjN9VzB21Qf/RcK?=
 =?us-ascii?Q?MTEMIC1qh+Nzo+JBnHBAt006o83GsF/TYytiDtPrAL8C+dBE0Xt1/KCI38m/?=
 =?us-ascii?Q?WK/85hvKTs9rNnXW/QeXjBIPuKnK+z9SGtqiB0Z2DgDJCNy2NvJKMQp+XKiN?=
 =?us-ascii?Q?v7TAvvFYO14vETIAo4hUafwjdxTor134eu9OhHbvSKDKT8fAKp2RWMG2ZIw2?=
 =?us-ascii?Q?evpnBbsO0/tZnblP4OvO7pzmLZxSurLLrJU2LW/Xoqq/DX3IixWD3xFa+Jyp?=
 =?us-ascii?Q?MZ+Y32z6YAVpf7e+QYAuWWgGPF6yedzcQEL7OZjgEgqiv9L9IpN522otlZ9J?=
 =?us-ascii?Q?MaiNPemnNI+Eo3L+/XyHuUeUfLo6AAKUI96Slz5abyi1JRGvPB4KnKhIQ4i6?=
 =?us-ascii?Q?6ecgkv6NQJV0c0k5Lz10uDEsQ6yBi4WUqmnxc9ZF5CZ9vSlanqP8PbTQAMVp?=
 =?us-ascii?Q?pMlpkw8Yu0hxZ5PZbV0D7C5rgqfhBRn6/Tvr9Dxs+f7j2EJo79gD4L/Wge6L?=
 =?us-ascii?Q?yIuvRRBTpXPzgQse14y9MQFbsRdQbmb83vXz+u3CsTMjoi/uYydDZIkx3FpT?=
 =?us-ascii?Q?Gi/C4lv5J7P9srOgvqkWaopzwCoPVxIKeDX7O/T3fIZKOXavQ7NqHn2Usqjy?=
 =?us-ascii?Q?q5hKrlw4S71G4M7kCIi4F5i9a7mDm9LMYfVlFSc8qZGN4GtiREGyvM102I0i?=
 =?us-ascii?Q?0Pcu3omTU1NXL05dmc20prA5sawYN+YDQFs+Jx0Jc0nd24prVxpDndTlTmp5?=
 =?us-ascii?Q?1wM5a+4jWfOdjPIrE+mEoUdGQ6rAQeg07iTmQZzoZDBspAK0jVNiVyW28jRF?=
 =?us-ascii?Q?iu8FLLmQ0oxl2E0tmhPRI27fSRKZVAVqhkV3Tv8UFA1wHG7Zh3qOsn46gIGj?=
 =?us-ascii?Q?m416jBEbnByMSZ7g79mHkQDJ9SdDqSoPcvpPYCLWjPSAQ1XMVOBKYW0+5Ago?=
 =?us-ascii?Q?gzMUV7axwYA+WpssTJR4IYFnZD7i9eM4V5UAWvvoEzINzo5SugOox1NDqxXr?=
 =?us-ascii?Q?asKBpUoeagvSml3nf8o212sWLr6epRCd55FAZbPLJuztHpRbm7RzaqMGH4Ab?=
 =?us-ascii?Q?z4C8BKPgaBbPEi+G1tc60IYYv3sOdvmgxupAo+pMNut7b56ifjMlJFEgG1+g?=
 =?us-ascii?Q?TQ9Sp4TMePY7CwYcN3BLjIESAcZGrvLl7G8HyxgddQN6rHUVfZqolCijK+Wi?=
 =?us-ascii?Q?xRP4jQk/wvF4Ou6d/J1hxijI2HBb9BLghoQ5wPrfRPnwxMnxYa6bLIC4Q2oO?=
 =?us-ascii?Q?TN0+LiQJ7eKuJZjhqcPYS7QobLBYOIyrjlfYr/VWQgD8EOsgwpMgJQ8ouHzv?=
 =?us-ascii?Q?KkSQhOdZ8YZKq7eW7Q7NsywE49iKBBjdaHN+Yl7rSxBlanB0q6/nBmAH193t?=
 =?us-ascii?Q?CWIgPbkj5lBItiQ4cs5yKRelSAe3RI7aMFcNRi3UKOBJ51v/fIA4sYOxVw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 15:44:54.7849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8aa7f71-3dab-49d4-77fc-08dd9a10c395
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_084459_528465_694E15F7 
X-CRM114-Status: GOOD (  12.13  )
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

Introduce a new memslot flag KVM_MEM_ENABLE_CACHEABLE_PFNMAP
as a tool for userspace to indicate that it expects a particular
PFN range to be mapped cacheable.

This will serve as a guide for the KVM to activate the code that
allows cacheable PFNMAP.

CC: Oliver Upton <oliver.upton@linux.dev>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
---
 include/uapi/linux/kvm.h | 1 +
 virt/kvm/kvm_main.c      | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index b6ae8ad8934b..9defefe7bdf0 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -51,6 +51,7 @@ struct kvm_userspace_memory_region2 {
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
 #define KVM_MEM_GUEST_MEMFD	(1UL << 2)
+#define KVM_MEM_ENABLE_CACHEABLE_PFNMAP	(1UL << 3)
 
 /* for KVM_IRQ_LINE */
 struct kvm_irq_level {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e85b33a92624..5e0532c3abc2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1524,7 +1524,8 @@ static void kvm_replace_memslot(struct kvm *kvm,
  * only allows these.
  */
 #define KVM_SET_USER_MEMORY_REGION_V1_FLAGS \
-	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
+	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY | \
+	 KVM_MEM_ENABLE_CACHEABLE_PFNMAP)
 
 static int check_memory_region_flags(struct kvm *kvm,
 				     const struct kvm_userspace_memory_region2 *mem)
-- 
2.34.1


