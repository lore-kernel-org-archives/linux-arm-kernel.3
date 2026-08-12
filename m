Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD45C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 20:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jglHIL8KoMYLF/5vepR4ekDWkytXU6Yh+ib+2a5IuQk=; b=uCRaelI1sBma7NFjUEyVNT2ZdB
	yq30GXlpf6JmcYBV/k4bXeQcCTQKsFBBP4u1H1kQ2nSAD5porAMu4Om+my9sCKP8AzDt65oakggDS
	uLeEOz7yhiZ8N3sfTQYc7HBAZNiS9/GvLLqlATfdsfD43ukLAjlO6NxoZ1gmf1524hsotmC8FQ0SO
	tenZqJK1F9O2ByZdDlGRnmXf9+xmAooWwYwNq3TPSdHz4efJ1ITP9xw12MQcGZC9amcYCmydcL5fJ
	vVJHxlWhsn3PH5VVOQmXpIZt8L1rElSKBw4/hW3IWe+UYYHtLSmM1grqSHY7QvPKZr6SwpiLSRL0F
	2nNnMgoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFGq-0000000GxEr-1fQy;
	Wed, 12 Aug 2026 20:09:52 +0000
Received: from mail-westus3azon11011066.outbound.protection.outlook.com ([40.107.208.66] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFGj-0000000Gx8c-2afP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 20:09:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0Lk+pdUjfCiNnTbKCmjT5k5Zq7XkKuTso8bIe6IjCv/Q73IsN0qoCxScOG9nfEAeU8m9JX05v8cuFjJyc+3UAZ+jJ/9jl0XeD21m7dqgDnBp/jwA9285EdGsMdEezDYzQkHrQuS/O32pXzK80KvRJViZHztrhWbn7NgNPxZ5hvQyk81RXPo6DxjhSDBzUzpqJZgwhg2yziepbhxKSU9rETfdkv1tfyIXMVl/SrW9vNx9MAEhZn3cZIybdFBPJgPfnlTY6hOincA6LkB91vchfYMPRIuk+BQGbrBJphm68TLHTrSbpJ996U9aQNM4cj1mVcUOnpOlVwv5IWBaakgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jglHIL8KoMYLF/5vepR4ekDWkytXU6Yh+ib+2a5IuQk=;
 b=K3Lt1z7u5eE5NdB46BHx6GGjsVeRdBvbEGT/7yAPHslzlDHgtLu+Ee4NuMYuXam6pp0JU3FHe6a4Bla15Z8xhMNFgWh/nlbcc6Z19XWy3Er+wMtnT4jDlZ8v9nTjOIO/hnkODE8Yp5R2WskY3HfDGBRPRwiZ4De0/2kR8xrnWmuW/dI96/g7XrwnkygrLtJ2C3NIOGo00z7ETKF8xQteElwqyiL7sV7o0sFa6zZol+ve5hsX4YSOmUJFEvu5MjjAOcKTbNcByVTtSnJeQXeq3cENeJL12orps7cL5hY8uADznuYL6uSTIzHxe0as9HzhZ/0rVvbc4MfY6HyyvNbNQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jglHIL8KoMYLF/5vepR4ekDWkytXU6Yh+ib+2a5IuQk=;
 b=gJsrPILlV6loe4m1YK/eZ9mNbyuI8IAjtPfdeS+QTYB2ALjySPGhIRJ7CyZj99BDOAco5Fn3Xc0Ydp+j+0ouidtgfLXeif3wlU470ZFEzjrBbo9ifOCP6W51+fE/GiETaGe11UfjDgIKlhE12wX8zNeF+2SwE4OfZYCwSNDglGdeBqWvPEsxiEMwRDialarpvY3P4TZ72j2DYY2ElDup17NciuwJTYvsw44mxNJOX74a5PmhICradQro19N3mwrd6BewdCfDD+EwgzkCuYa1jhQG4C0gysz8TN06Tb3LjJqdivdV46IXgExnasF4gsgRfaZKumJ7EQ1NrnlGybfvGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB8121.namprd12.prod.outlook.com (2603:10b6:510:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 12 Aug
 2026 20:09:37 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 20:09:37 +0000
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
Subject: [PATCH v2 9/9] iommu: Remove pgsize from iommu_iotlb_gather
Date: Wed, 12 Aug 2026 17:09:25 -0300
Message-ID: <9-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com>
In-Reply-To: <0-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4P288CA0049.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a258d8-22db-4661-7bc5-08def8ad9df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|366016|11063799006|3023799007|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: QGiNzKHtyYQOjcETgZN8jiEhDTLW2s5319Q40oZMJe5MKDHlM9wf2kCektAFuZuFFsGgvuz+KVKPukoCN1xtqDus3QT0pu+IdFRWcnjlxLZapIvO8eC3lF8vnuTVlKBD3Ybto+1amyN399njBGfQy0cTfq9Byj3wwjy3bdnjuyZT9JkQw8OTTI0rSyl8dIX05I60vYPMWW2SgO0J98/it0VYwxsyEPfAp6nHU04hotI7+BM9VShv63shvWlWWIk+A6aSSIOg75FQuOmVFamq5uQndi3g74pH5BgE1p1ai9X1ZjwcgDC6yqhIvqLxlIygJHmsyER7wPwYiz3Xj6QemQZkE/E5/RRLAAH/QifFD1Px90JsYDKFyxqp2bKQEUMKSCPUPSnSy/nnE53HFUCG/QNN8bQxWUt1wW364DauGi8SSSyr/ibyx6n5A05bZ+TQbmFFrhxvxceFy56gydTtRQPb/8S/Su5FIIy95B+2/VOW7tdAfSuAsY8W4g9gvHdOMduj4Rjf06GMkKjPdaFb8BIVF72iZLJb29GoYwvG3UkqqYT3bEcRUY4t4MYH0LlrwMVvrsTOoZDpT7tvLI2UFpiWbhxbIxrfe1v9532gKj9KDBnxWW+jHxR22wKBjKEa/T/ZvSiKLwSeJUlXPjGgxvSGjK+bxq9VBh9Ngpa47mY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(366016)(11063799006)(3023799007)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MfAEMgsek1TxSuIFfzG87e2nGCYCkmEMk+fSGj1zC68UluQ9tSxQpjNMaSya?=
 =?us-ascii?Q?JJMVgu5T2ualtJy213TCaNVCTMPvQsUYsXTkGC4mmMYVF+uhqMckpDnH/aTt?=
 =?us-ascii?Q?Eq0BX3FI7ssCIf/l6/aL166e7CWlkRGbbD1XbnNQY47SRsTetSxITPGbJfoB?=
 =?us-ascii?Q?10fsNVctbC5r9qwtIKqy+2Bo315yxO8/SLkphvSbMa66PwY5QgKpgodRlDNI?=
 =?us-ascii?Q?WqrspjJD8+NUH9EfuYTqDm14T2WxiD38lPHIOfVuX7lCLnLwBEgH4XdzZRv9?=
 =?us-ascii?Q?VnBvPuxXLa78qdVtv14HLwEf5s8mODDwlVi7nnoNjp+hKgdX1UcKXJBDkH59?=
 =?us-ascii?Q?hauAc39zZuQTwZAW/JAD4Hq3I5ublQMD0mca3b7W2i/aTnOixxZTpx0My14E?=
 =?us-ascii?Q?DAET6xVSUIETPQh6u0iUYP9KWrZx4IOlc5zjluVTEHtBw989c7Wf0bz+BHBN?=
 =?us-ascii?Q?CNcd9gyExR0QU6nLgB6NPCJDx8orJaWdKSvkqHDoZrQesex041NSlvpw0cbZ?=
 =?us-ascii?Q?EK2jyLaMLFyYzksMObfyozc2+3nzXkz2dY72DDd8+trh2BbXzPfGwe9n4Gi0?=
 =?us-ascii?Q?D6/39aIdNacj6HxfimvnoXh5l9kfAp9JvapeiIz6rV9m2JctgSRboa+Nv6h4?=
 =?us-ascii?Q?cGBD/mTx0NpDfZLRoon8/MUoHoO+j0Ue+kVveHHd4t26A4NSc9aSGbw9cf1q?=
 =?us-ascii?Q?nBQcTHnmLM96W/ajDzOlviyBBRU2eT1iy/F/1V+FW9ud3+BcUTgeHfCgRbnJ?=
 =?us-ascii?Q?gNJcHRPOQRvx/YgOcAJg7pagt67xmjotnBb/HWIYk+SF0zZOJDujvxHQGwBT?=
 =?us-ascii?Q?kEWPN2UfKXtnqvtUBZx0JuNGDGUIrLUAlgGjrwIhRWBzOjzWjx1nCZVdf022?=
 =?us-ascii?Q?Jrzls2tJ9PZ5DMTv9AW3h+cKxWWwPrsz7WAFZryMhfUe8yxczBwv6LXWVcQR?=
 =?us-ascii?Q?UL4A82pNKY80JsYWGhe+SKqs73VlgTaNiIaHNnLZ7YMVGx0yl57XqZBvzNfQ?=
 =?us-ascii?Q?NDmN2iMzLTOyeD1l9M27O0o04bgrYyCwPFWgPvqD9qZUw1pSt/rPFQ61XMJm?=
 =?us-ascii?Q?m410hqkGi/9WnXBqNx8klgJlrLxDEc0ZbzyY4VNanyR8m5u/j/1ymQ21GHPn?=
 =?us-ascii?Q?IIkIjirRFylyMkMU/gkzGGxLBwKzw6FHdIIqNO5xJ7jh+9xi2WZKYyIm1Fqf?=
 =?us-ascii?Q?SCbgO+BlVks7CEo9aWO4fx/RFJ3gRjYF3+ObR2/7adhXXRStvJJjrz+PX4vE?=
 =?us-ascii?Q?WXKRllMECAuiewFm2zGZktEzOK7w7zAGs8xEK3QmB0J6ig6OjHK67t0uKe9r?=
 =?us-ascii?Q?tAmclHhHA3rtZL7xz/oq5FGxoesLP9rj4TNCjiijybf5Yax8kB10AquZ2O0P?=
 =?us-ascii?Q?dsegyBNfEDr2QycDrMoi/zW81ecU1/HePhhup3jjJzYkq8Vs+tn70PiucFfR?=
 =?us-ascii?Q?3SehaEG/F8d7OksnukuNDqH/n0k83jTdCaxNakFKTNxsgB3JQBjwz8hNJavy?=
 =?us-ascii?Q?aOPEiHX9KBx8pg0o9Dy0IiiXW48Isc5vUA4U7FakHadXq1WYeQUod3cVMZct?=
 =?us-ascii?Q?Velpws2DSvSUyBqWl6nOHVj4FZoufC5xPbcflhs+f1emJJy10IIS4/sbrntr?=
 =?us-ascii?Q?knwfnVM738bL7oCqYqYpTJ6fAZctTVmelj4ma/ZLJ9Co5oVcdFAXHDrt0Ik9?=
 =?us-ascii?Q?FD7YDADoZO0CJZ15PGLaDCuS+cj0gPio0FOBXEFs4KKTo7UWk0kqhA7VXD7/?=
 =?us-ascii?Q?Lry7wJXWLA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a258d8-22db-4661-7bc5-08def8ad9df8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 20:09:29.8057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBcw73qNSfje28Pq7j7k6atvKf2qCQ9GeIsuQbAbWOv4Yl/XmWtjn9CH0uldTbt4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_130945_686795_5852276B 
X-CRM114-Status: GOOD (  15.39  )
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

SMMUv3 was the only user, remove it and
iommu_iotlb_gather_add_range_pgsize() which is also unused now.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/iommu.h | 62 +++++++++----------------------------------
 1 file changed, 13 insertions(+), 49 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d20aa6f6863ab3..adc45038e7ec79 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -361,29 +361,21 @@ struct iommu_iotlb_gather {
 	 */
 	unsigned long		end;
 
-	union {
+	struct {
 		/**
-		 * @pgsize: The interval at which to perform the flush, only
-		 *          used by arm-smmu-v3
+		 * @pt.leaf_levels_bitmap: Bitmap of generic_pt levels where
+		 * leaf entries were unmapped. Bit 0 means the leaf only level.
+		 * If 0 no leafs were unmapped.
 		 */
-		size_t pgsize;
-		struct {
-			/**
-			 * @pt.leaf_levels_bitmap: Bitmap of generic_pt
-			 * levels where leaf entries were unmapped. Bit 0
-			 * means the leaf only level. If 0 no leafs
-			 * were unmapped.
-			 */
-			u8 leaf_levels_bitmap;
-			/**
-			 * @pt.table_levels_bitmap: Bitmap of generic_pt levels
-			 * of table entries that were removed. Bit 0 is never
-			 * set, bit 1 means a table of all leafs was removed.
-			 * When freelist is empty this must be 0.
-			 */
-			u8 table_levels_bitmap;
-		} pt;
-	};
+		u8 leaf_levels_bitmap;
+		/**
+		 * @pt.table_levels_bitmap: Bitmap of generic_pt levels of table
+		 * entries that were removed. Bit 0 is never set, bit 1 means a
+		 * table of all leafs was removed. When freelist is empty this
+		 * must be 0.
+		 */
+		u8 table_levels_bitmap;
+	} pt;
 
 	/**
 	 * @freelist: Removed pages to free after sync, only used by
@@ -1062,34 +1054,6 @@ static inline void iommu_iotlb_gather_add_range(struct iommu_iotlb_gather *gathe
 		gather->end = end;
 }
 
-/**
- * iommu_iotlb_gather_add_page - Gather for page-based TLB invalidation
- * @domain: IOMMU domain to be invalidated
- * @gather: TLB gather data
- * @iova: start of page to invalidate
- * @size: size of page to invalidate
- *
- * Helper for IOMMU drivers to build invalidation commands based on individual
- * pages, or with page size/table level hints which cannot be gathered if they
- * differ.
- */
-static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
-					       struct iommu_iotlb_gather *gather,
-					       unsigned long iova, size_t size)
-{
-	/*
-	 * If the new page is disjoint from the current range or is mapped at
-	 * a different granularity, then sync the TLB so that the gather
-	 * structure can be rewritten.
-	 */
-	if ((gather->pgsize && gather->pgsize != size) ||
-	    iommu_iotlb_gather_is_disjoint(gather, iova, size))
-		iommu_iotlb_sync(domain, gather);
-
-	gather->pgsize = size;
-	iommu_iotlb_gather_add_range(gather, iova, size);
-}
-
 static inline bool iommu_iotlb_gather_queued(struct iommu_iotlb_gather *gather)
 {
 	return gather && gather->queued;
-- 
2.43.0


