Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6053C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GCePkwati2EutVL2oM1IjI2/J5CBXP0+KW2tj41W3Q=; b=uYH7dPU1JdEKtsf5/XFzhKO752
	6wcn9NOVkIdq38YpwGDivkgbwclQQ5lWBkojv4Rr/owadH3NaBkVAwdxT3DqlrfboO5Mhl+NwpH94
	gx9vZWheMKi+D9hyQhEma2rcINLRHJ6c/NkexvySFm2qIt32dY1qEpDxcvptAJ9BbuCSXcwhMNQVe
	ykv1oMyxbvxEAcx37MhN/zVoROxD0TDBHEdp3mGILtccJspAIa4BlpwDnyNOpeUoft0WfLFu3vO2P
	ENuTxr2rYnDCa3CPVPqEo25biIM9F3SuitaltUJ1XuFGJwHQMH9UcrYMmHgWYHCoEGyKjsoutR7sy
	00R2nCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmCZ-0000000D3lJ-10ig;
	Mon, 06 Jul 2026 16:29:47 +0000
Received: from mail-westus3azon11011029.outbound.protection.outlook.com ([40.107.208.29] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmCW-0000000D3gv-2Hvb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:29:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xg/nfUHKHiFpkOB33wh94sbCF/jlVElKxbGTBWxoTCdQcQhdSQg2r1CinMTHpe6ZpZhgVU30ajmdqwkxVOqXZgw4uu74+gYeUcrBXu5daWqitShe+EaFyJUAmY6AATDHpXTcPoDtevOm9i3vm/C+NVTGZJ+9PPmSBY0jlbEm9OQ2UUAHwj2piT1S0/r00Bufh5M0i+c7hzQfLMMqTxgv2UK2Y4KyVcvTlVU3SDUlXC5f5Ku0+HtwNTk7vzsyq5MPGotQlB/vxZ343xHpWdg9TtIYAcHWwmPdwcQzfjTmmZ2bGlwJTiLzCtqZDVT0sq6aq395wrMW2dYZTRPrRfNn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GCePkwati2EutVL2oM1IjI2/J5CBXP0+KW2tj41W3Q=;
 b=ffdXJ81mhQSlZeXetTRM3T+OEJeNt4QdMa9m/6CbNn6mxZlNbwPOP9BumvwL4fDy5xi38JUzsYTzfTI/00YoDjX5NKY6ne4e1k2BioRBoxsZak2dMPBQi+tQ8B+xpHcRu+iWsXZ12os/YIzyDnQ8AYSbtU0hKAclaoZmEdQsPqpNC/koaek32JkjRXfCIcBg/CSzY+XIAihJo5OZPAhui/wtQvDuZzm2ZTQiILQ0it5a2H3Xcb+1N4BZdCvu4EktpcVXTXponfisfrzP8R6VxgGOjuOJ7omK/Puq3RI7iiV77/wpnNaCCvGRvvAHsNrBZ5V3Z1EPcu04i8SB1AcikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GCePkwati2EutVL2oM1IjI2/J5CBXP0+KW2tj41W3Q=;
 b=b5CAoB95JFP2UGnu6QMSRUrIbuNaXgILtifUvFOtzlB4UEc6SOdusNi7jIPz6OdoXtvMWgYbVzr4LESr1Gv+n7lzXjgqYQoCEDVuDHzCfY3fmU//UYu0dy50SfO23aYuMtkXXEVvuUxndFq+/5UfInKGPC4YKzwKWl1Au9gy5gk0kCkgoeogMU6ohhbysrsNrF3wAGS0Vp3X6rpmxmKhL5VggncQDeDJ8woFl27dubFQavjCZxWvG/qI433lHA3iD4F1wvH6rbfJJ4TLejGJ1AOoNiw8R/+w9CVej2AOApvn6Q8jsU1TmHmAM6OqWZ6JyQV67vpOLzFgQZauHvj52Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS0PR12MB7926.namprd12.prod.outlook.com (2603:10b6:8:14a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 16:29:18 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 16:29:18 +0000
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
Subject: [PATCH 5/7] iommu/arm-smmu-v3: Move the DMA API comment to flush_iotlb_all
Date: Mon,  6 Jul 2026 13:29:11 -0300
Message-ID: <5-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
In-Reply-To: <0-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0043.namprd20.prod.outlook.com
 (2603:10b6:208:235::12) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS0PR12MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f48a721-59d5-428f-c0e2-08dedb7bb8a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|5023799004|11063799006|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: y26Crma0j50DCjjOW3Klntog9nO7HIJlgF2M1C6YdV7b2xRUkzmal9dcliYmUkRtxGkucZV53+PVD8cVO++7KAKK+GaG16lCH4uW4dlsxFhGSYtAEPgN/KbrMaybaSEArcaZVcPs4rzUMXJPw88maIfLko581hF0GQZ7/GWaokLWnS20odiOuRRKElSq61Izg8vYenpjVG7cM7OS/SjuQyS4qXdeIjeXEk5IL3wZU3mfWvsKEEBK1zJushJ2qz9Hs9P4Xd7MQYqqgfIznkEiQzxw2uG583ETSw07S8HZ4GNTdZtHlXq5p8UwtlePLlIkP+dTkxCapcma2P0X/Vu/C9ux+mMWcnUFqRiJsAbsGjh6iPr7vXQxbCygpVnRN9wITyFW6Sv13hQAVqMqb1dKJIHJn5ofbNZaTO0OgMeQRoax2X91z9H4T9qShnfdPzlYtFjxl4vsFxYECznTRE+AXoucpFdOqXKANtBzy+v0TJ9fnkjqaegk5QS/nYIQMB7jqE6kL1L83ZA1zXmjZDIsNUGbax04LITCAMSbz2qiPDUvz9UdqKZRZh5YMWdWZZEBUqRwG7yzk91+c31pPaPyiB4UI2OO4WHN1x1st6O1a78iv6sOFL3dhUpSiBDHoLaDFe5uWX8zwuhxNdn0GoUg4gjPstCRtmor8lLiniq8OdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(5023799004)(11063799006)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pBx36/D5qAhlfjmAI1dtLgXAq7jN6L6gHV18VbjaPAHEPK/fSU1IYPvYEb7E?=
 =?us-ascii?Q?jk26hSQi+uM959HSyI2vuVTLEfRvbPwdVs+jgZNBGIZIlCREznlyvrSfMF0f?=
 =?us-ascii?Q?XA8HrbhNg/BY4uIFuVLnzpNUCIU1fDrPAO8AOlaLrbU5EpfOKbwQoZzVpmsS?=
 =?us-ascii?Q?OUIxSRwjyFmT/IHX0mBXcLarVKalx06Mbvh1bB3KeOPj2hrVVMDWsW4OXqA2?=
 =?us-ascii?Q?+5w7CsY6hHssUwWAOzINhYwb4qHaaaVRuddtz9FGUi0MOWA6aSvy2i+/b290?=
 =?us-ascii?Q?S01nbnDGym45Oo3xZQh+ZCo9PgD+3lZgNxbPAERrAYsxmgvR0vKOGJpl/bNa?=
 =?us-ascii?Q?gTbKVmm89Apgvrv180Tc9pwyzHtflxUK83vR13oexkFDDGZPQl0nQ2BvTmT+?=
 =?us-ascii?Q?U5CTa+zBkNLqses/17DofhbKmITW9U3bWSXORi/1WUBv2YSMbAr9vT5XTRLY?=
 =?us-ascii?Q?4Rh9zzyKKRwa5rS8QMDNTQB2o9zqo25YkX40o4u0GSbbp7k+sRQ67QWNaPfy?=
 =?us-ascii?Q?82/fAuoBuvGrYIyWBK5Ewrhw2CVSbrS4E9rpwfSH5BKx2h1k2DLGUCPzuwa6?=
 =?us-ascii?Q?Pm3z2C7CoIprA8Q4Fes+2SBXGpHnFTo4j5hR16Jke7+Zl1R0k74TJVqzH8PC?=
 =?us-ascii?Q?+hHl7DU/pdGNkq9ok41MuhLJV3fl/+RSuvqrqEqQ/0thtXPjJ2HGGs6EC9lx?=
 =?us-ascii?Q?cMguehXuhFcRvN9bESnoX62a92/36Q0A6sjrLXksBtVbWd/JmwlLZNlcswqR?=
 =?us-ascii?Q?LIhfT5ibfH0+a/VP69RXhJFlqZnzs5szcrTnv0rRpNgh3+xyk+INMJg2OREP?=
 =?us-ascii?Q?j9kMkPxdyUjqbNwvb/aAUerjMYksn24YwS7MKHYy9a8qUNke/Jn9DPsbP65n?=
 =?us-ascii?Q?BhP3CpgypvEDLStF+9u1EFVq0nq1B47gKJNqlbv21EqajHiRZh1L09linvMB?=
 =?us-ascii?Q?YB5CqiS9JU9IlzE7E6YSwfJJ7p2Qb5IrpIKSFrbBE5nLkCcxCmVheLhCqxde?=
 =?us-ascii?Q?wBCHJ/DM5+wv5N+xajACKcQ7RJHKEJZhH5gDrwQXTzQe14M0iYiUPWxlQteZ?=
 =?us-ascii?Q?AIluqKPjA/9SH7II7uxk7/Ea2exQGsA4tiYx/kFLlRuS+Ron2QayZ0HtF1O7?=
 =?us-ascii?Q?3314uv/BrsWjfJPztrkCrT4qccK0zF/Mz9lOS3Y8tmOvInCa4oK9MwL/EMQy?=
 =?us-ascii?Q?JTUA3R5YjHTC9YNlfo1OzkcEuMBVHjxT7CSn+N8S36tL8SWRQ2eMx/kEaLH5?=
 =?us-ascii?Q?4Sh/IiJHZSEMUzJ2xZktCz7UtR6kVDK9EZYPnW1A1VJQ0TVoZVBi5l1gW4Wl?=
 =?us-ascii?Q?4CAOjQaxHkB6yleor0Z8j6Ari3MqcXMZ8IbNuNBSEBXJzQxe8s3R+Q5RpG6I?=
 =?us-ascii?Q?A+HHrjstE5q7A5nrmSw/X83fFGbX97tvpyOO6YVk3BNYx6nHpdbt9mbyV0By?=
 =?us-ascii?Q?wVfoX5B55VqQu1OlRX656e6L4XiFBy9TT3RBiklyi4JqhVDeaBloBreahY5m?=
 =?us-ascii?Q?nmDX10Bb4iJSKJP5P25Fn8yRtB7PiEygapKKNyhPCsC9ZLJPdWS+OHfdRV2n?=
 =?us-ascii?Q?jsQD0e4eAS+ISdDf5omA2perBp4HUpxnA5eKWSUu/iw3ZcoJ+3554COgJ9le?=
 =?us-ascii?Q?mV5c5PbCjmmCQ/3Jb/hUCzcUl2KpVKKIjsr8oNYqke4yo2aPrvDrA5X4KZnz?=
 =?us-ascii?Q?j3k8P6itKfUTl2gQT81E5+dQUBeXSt6c5wssNvVkkVybky06?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f48a721-59d5-428f-c0e2-08dedb7bb8a7
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:29:16.0765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrDI3HWa+g5p/bw470KE2M2LHjqI2EOn6BHAXgLXIKd1fe9mZ3qLWbTMhh9osI4a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_092944_598913_C68E1A01 
X-CRM114-Status: GOOD (  14.85  )
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

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 31 +++++++++++----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5087603ea18e62..dd22c0f881bfba 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2392,21 +2392,6 @@ static void arm_smmu_tlb_inv_context(void *cookie)
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
 
@@ -4078,6 +4063,22 @@ static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
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


