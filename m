Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9F9C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEv/QeTTU8uznZVrhB3NefQvT7EnsvRBY5/HZ5xc4BM=; b=F/V/o6fwj8BtoIQypZl9WJEAKx
	2puBKeNBpdUURnE/zF+MYeDjKlSAresoXXJCpcEDUlTvCU85MRBc8sObiJEGEZJXAp6TqvregjthZ
	6sxm/ayXfaAMG8LQPzfJpptDT4HDASoYkZ7PlbLJdojEb0WcRfTKjflOSMzmifm/FNC915Zbu79p3
	W876ysS+DSfHQzx7lWQrORM61/LNGDzsn3ow8g8lmvAqT5wAM8ONR4VOiDB2WBl5l7aqZqYRmGhL2
	FaK8SMvyBNQ9QygnZH0FMqCdXxlsQFcbs/qzdULYLdoZJNUuZQAdN7nrfjwPExiG6vhERRSf6KYue
	xAC2Ba6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFGq-0000000GxEU-16FP;
	Wed, 12 Aug 2026 20:09:52 +0000
Received: from mail-westus3azon11011066.outbound.protection.outlook.com ([40.107.208.66] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFGi-0000000Gx8c-1Qy1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 20:09:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ml6Yglp4VKoqpsmP4P3jHdYiisGsEaVd5Y2HNY+3sEEYmG4AT6AFHQ6rjJ0ThOJrMxAkmC78qRMnpw0jz6TLiZxGUFBDnaOvJ+DUhdWZfUTJ2RM7tGfFk0JQpGopdLfh8dqgq9sHEFsf/kXHsxrcP+ah/3M8E0Z9TebDcCYz6JbOHg9EWjW8dpPuVXsBAZKsNFNt4anFyLOYNDviLIsEOUcv7mPYF/ElQkQWjxDen0VEVghhH3NK9WqwCBfnTLYEqjJs+2JtdgtZ30U2Vq/W+Fqb2PFqRPo2ZQiJ1s2EKdqMI6sljiWEJSwREgTsHYW+2bW3nFxlRsLla47vmnV3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEv/QeTTU8uznZVrhB3NefQvT7EnsvRBY5/HZ5xc4BM=;
 b=NI6f4kS23fi+QjTyhwYFJVO3xG4j4kgNX1eoxU0wWtGvMY1JK7NpBNA8u9oJ094/WOBC0K0aRjRrjemVWhkPZmO6vUuSkgBCrhZ9zBkCTz/dsuqreGVah9POXcrJKpCMwOdfYgTS3Jn5N8jZ4UjDxKHMVFls9Bz14VwYZzA7KGUXBcu/Rl0lgCoQFUSdUoBeJrzRaeG0EhCpe+QKhr6MBcmRdYLC2lXJx5AQGVGv76cuYu52gTNoUWLZzzCaIki4JA4XlP1tv6lnSoal+EgGoyo6SPG0PAI1OOL0RV99apaAORUBq+4+seD06B1DOa1kiAqNmwjqbhmYHy95b7NSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEv/QeTTU8uznZVrhB3NefQvT7EnsvRBY5/HZ5xc4BM=;
 b=ZZjXdK3xpIR8lbEGTHT+H+TLqyt1Vsf+852FGFPHb6ogGOq8Ogl+r8io9AO3NIRVpQ4faQu2l3J3ceL6ejYQqrZPg9C+6r1qKgC9Hzo1Z4d2YtiTSPGtsfDHBEv4w4QURkwfW9M6Z8yAKbDl2V9OxsniqmPvP9SyeSxTYZgczUN+0GfqMsvwYUtTro4IL6x2wQPKMcFE+tHD8rqG/OtgDjMc+baGgtOgW7eHAhb0lx1whb0AXnhAVlA2KdVP1vkAe4M3K2RHvGzfeOmL239I7VDCI0UY9UwFxWjd2y1A9w6AMZudQ5a2MwfWECAl1Ncu5dzoO7zLFSHcl3/3DUsSlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB8121.namprd12.prod.outlook.com (2603:10b6:510:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 12 Aug
 2026 20:09:36 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 20:09:36 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 7/9] iommu/arm-smmu-v3: Move the DMA API comment to flush_iotlb_all
Date: Wed, 12 Aug 2026 17:09:23 -0300
Message-ID: <7-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com>
In-Reply-To: <0-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::20) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 762e9e56-d2d9-4fe0-7d30-08def8ad9cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|366016|5023799004|11063799006|56012099006|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: SMSKYv36rsVJ3Z9lc0HICzRCdfk+nEDQohD5Ij9ew7yUIzCu/c67K2xW950LEvnq9bywAhvw2gs1WbkURDX3utk48imDXEvrrdW81BgTXOUqKLPGJVACHJxr4gRmJeQODS3mHnpyNGe+TFJz1xJ2rlia3KFsXJnhnzSAF7+fCl43OmAv//jBt8W6MV57GuWU6FdV8YYVWNGkdpadjpEbHEvp2/4UwgyAOX9nGnWvc/k4kR5niZwQcmmH5gSQ1nITdjqYLDOTxclEREzSYW/bRLSlNaGLoa6Aj2otVCGj/cgtwrs8EWYX94755A+Jqc2MMHm2k4q+zMZ5eXn/ZZ5z1EbnPvsoICksVgR/dR/auJQdzc88hSYLRB9n+taOwyBwE+3NVxWBdPCbYd0a6u4HmZ3taD4Gi8LFjrlmM9mfWqdCrlN2L9Srr+ZSLCYUX1e6RsTS+Kn1LVaGjdAdN4M9x/+xyZ7DkeVkPOCb7ex+URffxKS+RlI/j/z/7qdKOwmSkwkOLYShsJBtgyay8Z+sX6Fohq6jAMQrH5haA0C9DJsPxHwszmkvegDCc2BLOePXRWywkZIOw9srlW/NiPiV6WDYgrRjt6oI0q/bzXCaNid4M30sTyquSiX7a0cdm5WWC4iFgqZmvP+AVYwEHavl3yc8aDTkuL43KfQYco7F+ME=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(366016)(5023799004)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rbhSptKeBDIT2V2XAHubLUz5DMBXfxxF2zS7aoOZGaYQ9hPZcFOE9bEjE0Sc?=
 =?us-ascii?Q?h/5RwjacuAF2WWa4bV/HJmJHmyNRRZdfRMD2IiqfUPhwG3Ii6QIJNX4dGOcD?=
 =?us-ascii?Q?4R8VVJSvbhl2yPy2+WWbZUCZG3r5dX8G1Kbdp92WLx+eczO/T7F51BGDx0qc?=
 =?us-ascii?Q?sLEJ57NZzrFx81/ElwzQVnmQgPEBj6SIyYCpHKfAGWKOD6CI9r6+WcZK60Jt?=
 =?us-ascii?Q?Zk8yKxFQLcuI+pcpTVpoJ0R8Q3Mq1WuwW/zGM/xI6LKKKCisNw1bM9+QDkKZ?=
 =?us-ascii?Q?6inGnPgfQun7h4gF9ZtJnLyO2/sx42Ow9VWiiyewhi31oGEVlOshsUBA2Go7?=
 =?us-ascii?Q?DQMJuFWP8wA/auyXOOrhOYDfIpyB8gCLoW9jUuj93AkYSjhXoJb1j3ozPJkr?=
 =?us-ascii?Q?s5IsTylTEVIg3YKsV2k+Dxz7iz8rsrLSzuTMLgoLvs38D1/O1Dg7/o0Z7wSn?=
 =?us-ascii?Q?hPaTvnWbMvam+Ar0ax3dWqn1uvF1gya/kt797p6SOuB4WhH0XmmTBPdvtjJQ?=
 =?us-ascii?Q?fWfZnqRzkkvrpwRQ9+yC5MleNtpZZU8+4jq4bKJUm8+UMR5UCvX7I25tb50M?=
 =?us-ascii?Q?qXLaXVeiZi7DbLN8pdA3CHIUtsS3WTzGgjSE8IQi4lBhA4+eX6eeDyhxF+LW?=
 =?us-ascii?Q?XE4DWqQQd4rAO3DptqBDX0H7d6we+3+2I4XPq0EU0uKV/AyMn2alj80sEBuW?=
 =?us-ascii?Q?/TCqlPhfKwdLpuGfe7KCPer3/RcRmUJHJc1MitaH35cO5LL0k0nNx0uugxzI?=
 =?us-ascii?Q?p/gF5ORU5sknB8Dt4UVnx+Li/2cnAFSA6bNW18Ps97wkPej3wyrKKReDwWk7?=
 =?us-ascii?Q?lNLrmYFK33vUYXSEe7oJda+D3NbXALGsBbO+6B+mtOTEUfg90mI9NG78dQnX?=
 =?us-ascii?Q?KJ+12iwR8gLl3mSIPYaaLnsV9Znjeikc/AT09ktIus6VwUdY+QvAGIgWTKKM?=
 =?us-ascii?Q?l+VXVTWEUQBDeWTDJRtU5FHZfXHEuDUSfA3eMQtrbUdjmmQQ/cl3bhGMbdca?=
 =?us-ascii?Q?DH+VHbVv6ALzKM603FPUCJxt4HYuRdnuDXzeo7+mz+FvqH4A/oEB45tz6aeW?=
 =?us-ascii?Q?Yj16kjWN+jdt4jZrvN1SJOEaQLrn0EQuMGleDektV+hWHOCaFzdkDzMSRj10?=
 =?us-ascii?Q?a0oHvMtnjwBLJYzc6gbMVvvLvkTZYtO7DMlPLHM8Mh863RxpUiMEPULKprA6?=
 =?us-ascii?Q?feSgycPsg04XDuTMYCtkyJwkzVxGz6py8kTEhkqFOlWQ1PW0/nGuZiwB4uKm?=
 =?us-ascii?Q?1RdmhMLROZFuduWfBNPPovo+FXMpluuedb0q8O+9xRK+VRx43ccd2tyKyDAh?=
 =?us-ascii?Q?TCeFLv7COPjDPJ5CKXyVGOSxE3cIp+kzOJKYxP7gJaRynbpF42bni2plioQe?=
 =?us-ascii?Q?kboKiN9QFNReEXwOsts1k0m8RMTt3LbjeK4z6fw6DShgkhnGCLVN609Q1vX5?=
 =?us-ascii?Q?IzhF0mlQ0bL+eK48R6JQ1MFBK3T1dGnWp4zHaB+nuPkDkda+6vZlmY41NW1V?=
 =?us-ascii?Q?oAkK/Rw1VtXj3BMpdSVPX/ZGFQSoXZGU0gFNMzG6djoH5Op/0ikGOw8tVvuc?=
 =?us-ascii?Q?zFKC2IP94l1JDJBCp1Tpk0D7v9aHeuyWeiMn3L5qw/w/bgOI6aMNzEcn3e01?=
 =?us-ascii?Q?D/tNm+xMEK9rFnT+MRXWPQeagtgHN4aHe1ejTKuibnkUT7IvFC4gjagECfya?=
 =?us-ascii?Q?qn5M53GMTm77sB80vDI6nzq2qeWuS2lGJWkyGViPvhFezDTkB1BmhbM0x/IR?=
 =?us-ascii?Q?eYDM0GD0kg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762e9e56-d2d9-4fe0-7d30-08def8ad9cfe
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 20:09:28.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7wRQ29UPRkAcgw5Y7pZ6KXbjjHUZ0mxv94RbTzfsLnIYsjGcoxoaCs3Ql3fzlJZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_130944_393294_7BADB3DC 
X-CRM114-Status: GOOD (  15.24  )
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

arm_smmu_tlb_inv_context() is the wrong flush_all for this comment,
it is only called during io-pgtable destruction not during the dma-iommu
operation. Move it to arm_smmu_flush_iotlb_all() which is the flush
that is triggered by the dma-iommu lazy flush thread.

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 31 +++++++++++----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 22ff4aa01d208a..f2e4b66ebf1ce5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2457,21 +2457,6 @@ static void arm_smmu_tlb_inv_context(void *cookie)
 {
 	struct arm_smmu_domain *smmu_domain = cookie;
 
-	/*
-	 * If the DMA API is running in non-strict mode then another CPU could
-	 * have changed the page table and not invoked any flush op. Instead the
-	 * other CPU will do an atomic_read() and this CPU will have done an
-	 * atomic_write(). That handshake is enough to acquire the page table
-	 * writes from the other CPU.
-	 *
-	 * All command execution has a dma_wmb() to release all the in-memory
-	 * structures written by this CPU, that barrier must also release the
-	 * writes acquired from all the other CPUs too.
-	 *
-	 * There are other barriers and atomics on this path, but the above is
-	 * the essential mechanism for ensuring that HW sees the page table
-	 * writes from another CPU before it executes the IOTLB invalidation.
-	 */
 	arm_smmu_domain_inv(smmu_domain);
 }
 
@@ -4176,6 +4161,22 @@ static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 
+	/*
+	 * If the DMA API is running in non-strict mode then another CPU could
+	 * have changed the page table and not invoked any flush op. Instead the
+	 * other CPU will do an atomic_read() and this CPU will have done an
+	 * atomic_write(). That handshake is enough to acquire the page table
+	 * writes from the other CPU.
+	 *
+	 * All command execution has a dma_wmb() to release all the in-memory
+	 * structures written by this CPU, that barrier must also release the
+	 * writes acquired from all the other CPUs too.
+	 *
+	 * There are other barriers and atomics on this path, but the above is
+	 * the essential mechanism for ensuring that HW sees the page table
+	 * writes from another CPU before it executes the IOTLB invalidation.
+	 */
+
 	if (smmu_domain->smmu)
 		arm_smmu_tlb_inv_context(smmu_domain);
 }
-- 
2.43.0


