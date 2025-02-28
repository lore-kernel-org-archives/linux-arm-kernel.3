Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28027C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 03:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92BKGlNCPFH50JMw+ilesSOP0I/ZNI3TrI6Rb+xr1ag=; b=4ibVSu39evjOIRg5MgRCObBycD
	tRgXXL5l2n/cEeg7XXY8nZ45IiHhO6LVym5CdkXXM1BYkM885fMsT54M0LlYCPgLuw0P3ksQjPokZ
	YwJAGg9DeJ9hT0ZLCcpQ73Bhzv2vUmiMLi7h2eAnAKaHTXxBAwB6Dxs4XVzbPhTIVxZWnfKhnxhZA
	6ye4tSO/lJjzWw2r1uHd/JV2cK7G1IAi69XnFhqBcrFbmOwpNqkX4WMCVLqR3ySoA45Kiy6aAWgnT
	UiGgUqJ5CAa2sTW9GLdUuFBN58UXa3YhMfGla0QPoAkkPkszZRD1g5wp71wZF7/xCaIlsnNuUK3CG
	zTjv+TLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrM2-00000009eY8-33O8;
	Fri, 28 Feb 2025 03:48:02 +0000
Received: from mail-dm6nam10on20615.outbound.protection.outlook.com ([2a01:111:f403:2413::615] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnr6h-00000009alx-0tzY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 03:32:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPutJRstmMMc6MHC/zyKbMkMxA30mKD5jh2WkVMpRiZNekUaJB/q7fYpLfYe+sgRvJV2xNgyUtpEwPZHbiRMIeFjNusrkx7n4KyN0D8vRSjufEMI2MkVGSL7b102Nqd0i6nZyv/ZRt2mY2qFBoNPgaqMnOUOTkUKccg7awirfAypLnstdQwv0CsIPHmNfMuN/H3ZKd2dqSD0vtynXHXXHEMopykHy4osprNU+MyXnnKYuEhkn5TPhmGkNhxqKtxoim8PYrG28T+g6/kL5CYjR6uyDusXAoWKsI59agGHWdDy/NyFK62aETztNIDxUUQ1zVYnHDZS9Ob6UhvrJRFvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92BKGlNCPFH50JMw+ilesSOP0I/ZNI3TrI6Rb+xr1ag=;
 b=ngFrwpPYWm1/XFZqX1l0SaU0tEspMVUDmJshEm+I4wR5ufF9BGzpaf2J0ER0zDqhs8Naawr6i2/1xj/xieUEcHYXEbnhxxTs1Ijf+i6nIpdo9Zs4Hfz+f0mdtugdQi5rrWOWBTgWPsc9du1u1iSaXWJxVKoVHgi7/AjNoSuf3f2HCten7T7q7b6TU95HSmBG4uIbXdRWDgoYFFfn1BJsvsZpEcxfLfpBq3s5tDBHaap7CW5vPXHy9yYxVmH8Lde7MvoZ969+5JpuzFunTv8+dQG19Pn0HhdiWQ92dkmnFcQp8b80gRxtaNqDP+aqgwNbQ0cgCTcSf/rm8UWmFHMmCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92BKGlNCPFH50JMw+ilesSOP0I/ZNI3TrI6Rb+xr1ag=;
 b=In5t2oNeMARo4jtdGrHkvFeVbkuVu/0f8b74Gy+xyxu4hlqoJInKkJ/cZZXlxbmVhGToJ4+n39tUQWPi+1YEwiNOITIPNlv02/vCZBvBJEdlKQPgk58gRxCe8EoQEHCRBwDz22438zTyvwWkAiLkrRWUyf/GBB6unh4TL74InnAh6wyAlvZpH/sGNlVWY8PPA2sUQ5JaE2jL9fdOsqUOpKQp6ookxNFAMN9RYj6MdyQbb+XuWbd9muymOGHSb05LP1H507zlZ2IdwGWAnFhtLJ0Obq4mj11Of5iwPC6pGKcYH9sb1wfN8PSUgnImcS0wRLhIKS3a3zQ8zQHt1uqVIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 03:32:06 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 03:32:05 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	Alison Schofield <alison.schofield@intel.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v9 09/20] mm/gup: Remove redundant check for PCI P2PDMA page
Date: Fri, 28 Feb 2025 14:31:04 +1100
Message-ID: <260e3dcfaf05ff1c734a49698ed4332b5dae04c2.1740713401.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
References: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY8PR01CA0006.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::31) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ2PR12MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd65de4-2769-4efc-53c3-08dd57a8790c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xcAI7Ka5WZsjZFFokCtuwJGj6QifVFtsT5uQnCRu3kpK6f2s1j0PIvVZu7z+?=
 =?us-ascii?Q?gQa3l6TV6FxZ26AuJFdn9zsCgRUh+3d7Q1kfNInFSlLte/ROTkb7Z2weIuYJ?=
 =?us-ascii?Q?/qEZtE9RTWcwdH6lu8wGzcm7yhP7gERNHkD3KnlXqJJEk5JykL0SXtcKMSBb?=
 =?us-ascii?Q?o8MHCPonbP6b4E4Nb2vHeLzbC0v/xVipn3k/tZTMqhdzQytp7Jwfwkxbeaok?=
 =?us-ascii?Q?dV27iemSIUwgYccn6uJrlVo7CExJqdQoMv34g11Yujjnx8sp2LD0sdefhq1t?=
 =?us-ascii?Q?A4LNqPyIK/RgDnIDieds/YYdgDEUUFtgIO1vGJC4HiqiXkskp7s1C1SMqrR/?=
 =?us-ascii?Q?3RwmjQhw3et8GJNoKKHZ8gayoMrFELMp9MBViw6IfeiYQoB5uPDcxsMm52An?=
 =?us-ascii?Q?JF0lAjZLpVvv8pLExgObQGlHKpQdAMzGVDaHS89hf1MGnMZVuCm4mjcZRKkx?=
 =?us-ascii?Q?4jUwI9NnWSTLd3Zt+CFHi2rfOnBfwUlrEPpmfpUk0ca3arOMydaIqheDcHNp?=
 =?us-ascii?Q?JLE9djTo7YZ4Bk6RqNlVjc+eozf/+1RkVh65JBzinqTx+1rSVzvNqFmw2+4o?=
 =?us-ascii?Q?yqVcP0F6o9nLyI0zEh7FkKzydQB/To1gYEiYzWo172hisucly8oG8f1MTFqV?=
 =?us-ascii?Q?3Z1iAEun09CwPZ4EL5KMUX5TRhn5Kb09kvfigT9PANqrvWAg7/y5/3PFYwpu?=
 =?us-ascii?Q?8pg+PhdMM/0h4Zy+qY6ZVOJi5tOJrcJY7r4plfbpWJC2Ruo7N01MTe1131hU?=
 =?us-ascii?Q?9tWo1jqwJWnV768XRVH4/dudtsHbL9w7+e5qGWGss1Cz9gzL3EmNK4+SzuUX?=
 =?us-ascii?Q?jUj/flrw+kmAaVY2cs4j0wKm54U7CxhZybTEvdAHC16aCLNNCDHmBmj4GfZk?=
 =?us-ascii?Q?92I8gEP8lmdN8CozcAs96oatlksoATxRr0oWdpQ0k0BL8COQVldExS7sItN1?=
 =?us-ascii?Q?eiPzG4LNnWEbjpzrzDqwgH9iK4ed35YjQP9ZAFVuAtXAN3Za2Vp8bxj3vOy8?=
 =?us-ascii?Q?r6mG608zmSt8XEQ296mGcs/V5zttb303psuR8LcWFQ1F6s41j6TRbbSKIkg1?=
 =?us-ascii?Q?NmA4PlLidgrac2QerUXeMgIA7nyggvzueJn0B3iZOwRseZUZhBsB4EEIFsnK?=
 =?us-ascii?Q?wNC/rgbjZ0G+rfLvGW+flMthT9tzjFCV4FzzQTT+M7dNltC1NS41T5jjsXc+?=
 =?us-ascii?Q?FzNmrabNRZ8W3z36bVx04uIjUxRN+iDB3ydPP+pOuw//aD9TfcZbYWe68z3J?=
 =?us-ascii?Q?l1lRXBE2h+g/NzcHD2BD807jB5sNySwHQPkl6vqQ4S0LL5Kk3ThofxYtSE+8?=
 =?us-ascii?Q?doXBZzOcslwbpuRpsV+stRXSlsvTJeeSno121sKB9NVIcXBGURfVpXipIiyH?=
 =?us-ascii?Q?P/CRwyXXqy5zyckTfVkz9jX/Ynx1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZNSYYM0VgFoTINIbMPdQK3yFiXkRQZ6DjgYShPyr846+Dz5pzCyYWJISak9M?=
 =?us-ascii?Q?vAAKSvdL9mLk2Xp8VryLNZoo+ReIlcExATNn25ak9Cv318EJ87LOAJ7Mb6UJ?=
 =?us-ascii?Q?T27B+g1m9sjW3vHfMWzr68Inu6sOEeaNbY3Iu0D2yLwjmS49fmtgYkLx0q3y?=
 =?us-ascii?Q?7jfF7s0BlNrNRR0b4J7NyUHv9sLmiegP+VF2juUwIdXbZL8+4+SxNfelYkzw?=
 =?us-ascii?Q?gnnPyrq041O460bJgsGyRFqdXLpyLxhb4f4+DroVmaAE+jb8qFB6kGrHYIfD?=
 =?us-ascii?Q?jzz2efmYSO385wwiBGxgSda6cxiQ0q2Q/i41hXG1gKS5EAzdwSnv8wsAHgga?=
 =?us-ascii?Q?D5Xrm32A4sJkucLk0tjB9bdUYi9sGWxjsi8ZnXKtDEE10jZV04r3BEVch8Il?=
 =?us-ascii?Q?JRf7tT8MSnD670y3oJCkkx8bHOVQPunscbdVqPPrRsuo6dxnspgazc11BHyX?=
 =?us-ascii?Q?xypvkfhhjKDwgNLQMgdgRcY2w2kJv8KyYgBmGJGZSYgqKxb4Znhv74XC8vQp?=
 =?us-ascii?Q?s+lJweu57IHrbT2FlxqPwp4HE4DO+MikkD3FFXM5JS9R1/nXgcclkEj6cxZH?=
 =?us-ascii?Q?lhWZVNPDR0oh/3P6MQdRDSsVL2N9kolctfgSinU8Ox9JXfqWl0znE2XaRZfy?=
 =?us-ascii?Q?Kytz7A78EHbPbc4l+LCJhXRV0GD94DPwpXKCgDXyIko+DTFmzvNly2rlLBzy?=
 =?us-ascii?Q?wrh7MyW+YQ1WRAXKW1yB1YnXKo6rtlsgFj1SU4/d58KV4dPoLszdhKzQix7C?=
 =?us-ascii?Q?CjGX+/DT7xDcOT7F3RTpTpimlBGGaDEsFn896sb/pxYskK8Wvy7Hl+GxrKh/?=
 =?us-ascii?Q?paFkqBoIwYF/nXd0385tM227RypSmReiIfAAu/xyYSON2ZGfVIO4a6AVEUCz?=
 =?us-ascii?Q?8HQJdruO7FUT8LM2Jmg/GcvdfcM76qyNIH1l0pefh0YZ4AamhnVNxxijKw98?=
 =?us-ascii?Q?FBWYINQob7NuTRQ2ffAMCL2yr/ksJmiF891Dm8DZrnVCjKCFN2VfxHbY/ION?=
 =?us-ascii?Q?SoVENybr4YKqMOLcUqCF6tcvthLgibc81drWrEUWGasU92HLHw+LF4kHUWGa?=
 =?us-ascii?Q?PVsXz9tOzXsICZ2gFDbLHWCSRPC76itmLtR3DjaZu5uCZ/PsAD1aO3SbjlxE?=
 =?us-ascii?Q?Rq11BMKX8gDx54jMj7NJEeraybfadXYf5Ugmf8YsSXcrsLp42/smDbYN0Y14?=
 =?us-ascii?Q?uyyp6Fyoif6+77Y8iiwlrIvwa4auFcVLn+LxBB9TmZ8fTlK5fL4yC54XMz6y?=
 =?us-ascii?Q?n9BNdxciJsntgOBmVEbqk9kCCoxvO4YVT4p41tx+NTFmgPQOQiJAp/5InQ22?=
 =?us-ascii?Q?vg05nRuh1sQ9HU22yGpGJahEFhvYjhuP4myzJglef4wlyDNa46XlSmB/uDu/?=
 =?us-ascii?Q?mcTfqSsc0ao9qQRdj0nHxulXnw1hITP0GaLJ/sF6jAN1AvLaf9pcWKHRFZQn?=
 =?us-ascii?Q?A2OCDOfFTatS+RPpuPxdBzURiFfL7WKzn6AR8fwXR4omNbUG3QRKqBahXmju?=
 =?us-ascii?Q?VoxxTWRYbiY4gBLB1+AXqfG93/xdS89K8vqSgjOfKZQVSc0FMcByaOm8H2K4?=
 =?us-ascii?Q?5PJ+ApbjpZM95Tbuc7B9mUPxHUl3XaG3rRLwozPa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd65de4-2769-4efc-53c3-08dd57a8790c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 03:32:05.5876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9BB0W9PBNUCspUjlmeVV5947m1zx+SORTEwDRvF8qKXsvSuoZCF6zIC24gVidxIuzKvJ1l7SbULmV/v4fIKkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_193211_253725_14077B60 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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

PCI P2PDMA pages are not mapped with pXX_devmap PTEs therefore the
check in __gup_device_huge() is redundant. Remove it

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Dan Wiliams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index e42e4fd..e5d6454 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3013,11 +3013,6 @@ static int gup_fast_devmap_leaf(unsigned long pfn, unsigned long addr,
 			break;
 		}
 
-		if (!(flags & FOLL_PCI_P2PDMA) && is_pci_p2pdma_page(page)) {
-			gup_fast_undo_dev_pagemap(nr, nr_start, flags, pages);
-			break;
-		}
-
 		folio = try_grab_folio_fast(page, 1, flags);
 		if (!folio) {
 			gup_fast_undo_dev_pagemap(nr, nr_start, flags, pages);
-- 
git-series 0.9.1

