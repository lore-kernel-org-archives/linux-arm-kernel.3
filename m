Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDCCCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SaBErezl/wZPZpNO6FAWV3T0UppCC78jVgZ3Ljf6hk=; b=DeRltykY/6Dq/J8LFk4RRa9Kwl
	wCgqbUw6UVo3bEW3FcJEKR/uGCHOtMWWILO+y8dI+5RY4m/VYyMPN/Z9QaTlcPXcgs+9TAO0Pyj66
	Q9hyraQDCzSBq5N390VIbxHAbXEgBI/aFdU/Z2wn5K2sVIt1EAB9zjcvMKM26NW/EHeFPKznXXcuN
	ErobuzIbZu/02HsvSVoua1Ok7/z55GA6Kzz2AprqqFoLoeradKtCyy7eJwMJmT/obN7XxOV62vxdZ
	G7tFBzB94g9vyewCCZHO6xXau1CRtQwBg2WMDddaIWZu3qBSM8h/skkCPfVzd78HbqzDlez0NdiFL
	+A/H8kxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PV-00000003wG8-4920;
	Wed, 29 Apr 2026 17:09:17 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PQ-00000003w7G-2WKD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:09:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxVpKp7CUk2NZbmrLir6TRp0Pho6rJHd5p9bPhJMWh9TH/V7VOsq2ygW51xjQqrTUK+shTk4MFNQSGdRphPQyEGFlgrYxuR2lLrdw93wZ3axmQAlNQ6dq4cIuJ7eoFC0I+2tsR1XfNqsVVF5xF5cq1yr2fdEedzFoKMfOfOvV6MkO0dFRobt5W8KSNUPCAxA/S37SO5UOswOAI7iSsJIbsBcMoaiAgi9KenSIxd4+0xrfq3Mu5jOUdApvsC3ux92Y9YQ29KBggWifaOlgSQOB/u5QOwtdTcDKeryChd5MprJozMMErxw/hBsK7Ubh94wDp0Hde68wGXmtnuhXMYkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SaBErezl/wZPZpNO6FAWV3T0UppCC78jVgZ3Ljf6hk=;
 b=sXHyLiscIO64YklzzHjw3jmgw/SDuWlMEM0NeexqyUbqLeBYvxHAFLzodyUJ2AdQpmx0XOaVsyjjcjofcIi28QZEbD6BgLuT/cGNeGUrfJLhKgWLbhiAb20MiGPIJ+6u4Qgx4qwXzuL5WGikgnGLWuNcL9hqVpZ7I0Kj9+GOHmAQtb2waz25ECxwtwws9UFMs0k2Cw5JAuFEJMWtU8l8tuFwZsg9fpGRSAtZOKKXCKFEdUiT+MH7GjTjgo5BFsP3TzbmKv+eDFKh0VfE+DeZJL8VPsGGuvqwqXpKwTjSmWC+DFzmQumVqIHGJZ1wzvj1Lh1gPQUne2LeV2XMJnibiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SaBErezl/wZPZpNO6FAWV3T0UppCC78jVgZ3Ljf6hk=;
 b=DgOid+ne+/tW3e2wUCnlT1iUqqlVuo6kChg1zNKuHqezonvNTBh4hHHbbG3A1RAedA1lfAapKFgkm1vTTb/vrCAKUXYCj1YqDb6CKpAV26/eLndB3rlIHcyNeBh2efoXirKdGXXrSPFdba0e1aetwWb+MeNETCTFKP4P8RG0Ma8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA1PR01MB6671.prod.exchangelabs.com (2603:10b6:806:18b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.26; Wed, 29 Apr 2026 17:09:07 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 17:09:07 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: cl@gentwo.org,
	dennis@kernel.org,
	tj@kernel.org,
	urezki@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	david@kernel.org,
	akpm@linux-foundation.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com
Cc: yang@os.amperecomputing.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] vmalloc: pass in pgd pointer for vmap{__vunmap}_range_noflush()
Date: Wed, 29 Apr 2026 10:04:36 -0700
Message-ID: <20260429170758.3018959-9-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260429170758.3018959-1-yang@os.amperecomputing.com>
References: <20260429170758.3018959-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:806:130::13) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA1PR01MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 924d4255-888a-40e0-93db-08dea61205d4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|56012099003|22082099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info: /sfJlzasUJM6lMTekuJ1jwpOvE27Zs2usJ1+a4qwsti4k8Q3dkigtMm97+ObP6rSdoB0UronwZDs5d5GwtstMWZZD6WuW6ZnXuf2dbTG2HtT6j6aG0knjx2AaxAQ6/Uppc8d10H3q1zgTZXrBmdOi6eGY4OAmcsaiSOL60bnxbg8KI/BQr0/ulSXBoxrIRE/Oc2SBrt9PfceI70SpGpLwqE2OskT0Oj4UJsYznd16KAuJReydTBrR8ZOKO9eAsz+w18TLxDqHjryCNvz/bW+03NtcGy8dU9wL6a2exr9Vx/jKr9mJDhbf67QsVTdmZwERUx/Q1h+RpqrpYaSVUEBBbhx37KbLl/ipJUHTtkuq5PfsoaL/ru+ib2l6HEhTMbjWvHQV55zrKBkG2OsUCVTEtWqFJiZX0DoskuqjXA6gYmg/n0VDHUYjciJc6R+miqrITPvAvAWVoFTuuz8N3oYvFczysqJlRlpV4+SGkWI0Sg2pHW22CY1uWh+PUfJntHVng6tStKeeOI20BheWlcCkQf7QqJKzMCcmFOGfZL1mmBsg6Ak+BGsOHsS6cCLCY79lyQ6934jRu03yhQOewVZoYYUXjiTr1JaoOmTBPHLUDfiiiDqFk+vqbSM4E5atxo15I7PcbzUfbD1YTu6GTQHpfliwLotKCELbosVjE9k8ioSTIrT08HBPhtapYOcXt6B8Mkp5vv4MLJkpAP9gIkqSNXActJbuA0OdTuaQJal2wL62si1MkjY4PgSqBS/w4gT4lcZRNM7Jv9lALe4/QXlGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(22082099003)(55112099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bhAUMmHR88RI0gk0wzO05OZZBljAUL7JxVz4uhVMFUMT/pBXx/io0x4FyyY+?=
 =?us-ascii?Q?PfrXyAYtHrr5jcIsDBj5yd9b9gFyRgKoFBsAIAYYMLibFAvoY7qjyQ+kpLo5?=
 =?us-ascii?Q?/ZU69VTtSND685/W9j6grvyTvdPYFZ0xdc6kElVrFfJrNQ7RYHs8dUXvg4qI?=
 =?us-ascii?Q?M9Oym6IFFhLTR0bWANVTF6gtaxoVXfn694mjOHDo7XDBOKuZXnCUPmiro4Om?=
 =?us-ascii?Q?vw0jG3jZC9PC1mWP/rIm9USlZWjQHxvREIZv++ehE4T8UAfskzMxgXTxJLxV?=
 =?us-ascii?Q?VriI6R7Q5aTSIgoutqKBuS3CsdV7DrqEgZNGRXZRf5BxFkMMN1dwPFwBC4o6?=
 =?us-ascii?Q?H3ESlvPpPlvW41o7dqJwrpxDbEIG3pjE5wAVaCqrvN1v/rrIYg/IlwuVVCRh?=
 =?us-ascii?Q?8PuqC3hdyZSMut0KCZB1DyYkfNprL6KQ4KQFTKWwZcSXi1HqbJCjE543FpbD?=
 =?us-ascii?Q?yvccCvKNWUqP7f5dXyYqO78KDgh5r395mErQH1G2iHY4GPPF3/ffkx40Fa/+?=
 =?us-ascii?Q?Zv0VqI+7iUonRHOfa3FPhsxHEklgHdeRCfbRYq6xcVUn8HD0tu4OI91ZfnJ+?=
 =?us-ascii?Q?P+mj1SJSFFaHzryVZ7YWozv9J32YUoGFm28VkRGETrnNBb/pGefy10KL1nJL?=
 =?us-ascii?Q?Tu2TpwXHyTrfzetLiau1YEfm06jZNucqzgB45fSN/BzyYsFn83ZDRNdasu2c?=
 =?us-ascii?Q?hva5M7wSpeIqNcD9x/IW/gDppWIz5T0kYe57sY5mYeyNDG9txt/jbIXzN3sO?=
 =?us-ascii?Q?9SYpPHjETN/RfM/7fkwBVleHLL9MgotKlflZRiLhT5jFgYta6izYsVzsfn25?=
 =?us-ascii?Q?a5trcETT5CCu/klzQow48EKaoaYErf2HUaW128GWcvv4JIZa/Sn4OTDHyXTu?=
 =?us-ascii?Q?oMe38zu8KzXrEpMlaO0Az7zRRNEUwMsmQEL4sUBwBH0VFq9j9iOLxWC7ig3Y?=
 =?us-ascii?Q?PKmLh2hGsUa0RVIM5ksv5jGaEnyycxGmbATFfpqNebpf5VsE0WyUzdrkXe3m?=
 =?us-ascii?Q?wM9Pf2Opuoq70Q2tMGNJ5HF0VQCA62viS8doEm4CKzqA/k1xawb9LNJC6Vmu?=
 =?us-ascii?Q?8O4U7owdLh90oX88P6Jty5+yGG/4ZtLu71AJ0S2PZLvUl8OxiURRmmnjZ2Xd?=
 =?us-ascii?Q?5Y+yUM0LNrTJMe5fScEKyAQP+g6kRq1QKwf1PmeCfSXx5Z6J02xiHOjuVjzk?=
 =?us-ascii?Q?ITkVCJ89chPfACGUnm/4gjNN8csR4rBcBKTJzjJ3sDoH0q/go8LSjuiEBaie?=
 =?us-ascii?Q?tWVKMuBQddsiW86xcf7IJ63TOBsKnh9Bp9GFQ04egHeNIz7lwLTy2M+NRqmU?=
 =?us-ascii?Q?qTftLDnaDoX7gbcGO+gwNDGhorw/uAzlq29ejUkRmAMaUbsUyr3mSCvrvmvr?=
 =?us-ascii?Q?eXycRR7f6PZlQ05W/n/fh6tePpsFOvRcie+7KdklHdkQ4Y3I1MVP8VZoa/pt?=
 =?us-ascii?Q?unIrYkVTNtUJiUijV6VEKjGfk+2e5+kFvFX/f9+JedTEGRzmwh/fqdXhnogG?=
 =?us-ascii?Q?e/m4Y2nXShj7jW/dYwbCLTjjIG6L6JIswtpRn3rTeQCsT8V44hgDscOmx59M?=
 =?us-ascii?Q?jZb/3h2pHWey2531eDGsOiheuz+IzGZI/9Tve6M6WUGsAh49tI/nehKZQOfl?=
 =?us-ascii?Q?pUkoQMeMvl33jECHHxiNznup7a8eTyC/5iHjOvaKfmcD/eYKrI+t/kGm+u+r?=
 =?us-ascii?Q?GVf8kpF3964qbwwNDxmt4wOxvt/pzcfM8PdEkWQuypKh/Wz1toRSjslM+9em?=
 =?us-ascii?Q?WcEmt7oS7tdfuh4gQI1qNEfbNIL4nfo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924d4255-888a-40e0-93db-08dea61205d4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:09:07.2164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMOSS98TY2dNYCgRzvH+9e0BFEMLuJGIOjtZ60GgwK2s0jhz23Zfa5csZdatwM/AnzTSeFjYklSCJRrzAQxjZ3cUe4yHKvL3SL85yJjkazU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_100912_804515_64DCA22C 
X-CRM114-Status: GOOD (  13.37  )
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

vmap{__vunmap}_range_noflush() assume manipulate init_mm pgd.  The
following patch will map percpu local mapping into percpu page table by
calling them, so the assumption will no longer stand.  Make them take
pgd pointer as an parameter.

Also make vmap_range_noflush() non static, it will be called outside
vmalloc in the following patch.

There is no functional change.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 mm/internal.h    |  5 ++++-
 mm/kmsan/hooks.c | 14 +++++++-------
 mm/vmalloc.c     | 25 +++++++++++++------------
 3 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 5a2ddcf68e0b..1e54945f8750 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1553,10 +1553,13 @@ void clear_vm_uninitialized_flag(struct vm_struct *vm);
 int __must_check __vmap_pages_range_noflush(unsigned long addr,
 			       unsigned long end, pgprot_t prot,
 			       struct page **pages, unsigned int page_shift);
+int __must_check vmap_range_noflush(pgd_t *pgdir, unsigned long addr,
+			unsigned long end, phys_addr_t phys_addr,
+			pgprot_t prot, unsigned int max_page_shift);
 
 void vunmap_range_noflush(unsigned long start, unsigned long end);
 
-void __vunmap_range_noflush(unsigned long start, unsigned long end);
+void __vunmap_range_noflush(pgd_t *pgdir, unsigned long start, unsigned long end);
 
 static inline bool vma_is_single_threaded_private(struct vm_area_struct *vma)
 {
diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index 8f22d1f22981..e2a0faf344b9 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -135,8 +135,8 @@ static unsigned long vmalloc_origin(unsigned long addr)
 
 void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
 {
-	__vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end));
-	__vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end));
+	__vunmap_range_noflush(init_mm.pgd, vmalloc_shadow(start), vmalloc_shadow(end));
+	__vunmap_range_noflush(init_mm.pgd, vmalloc_origin(start), vmalloc_origin(end));
 	flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
 	flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
 }
@@ -181,7 +181,7 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
 			vmalloc_origin(start + off + PAGE_SIZE), prot, &origin,
 			PAGE_SHIFT);
 		if (mapped) {
-			__vunmap_range_noflush(
+			__vunmap_range_noflush(init_mm.pgd,
 				vmalloc_shadow(start + off),
 				vmalloc_shadow(start + off + PAGE_SIZE));
 			err = mapped;
@@ -203,10 +203,10 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
 			__free_pages(shadow, 1);
 		if (origin)
 			__free_pages(origin, 1);
-		__vunmap_range_noflush(
+		__vunmap_range_noflush(init_mm.pgd,
 			vmalloc_shadow(start),
 			vmalloc_shadow(start + clean * PAGE_SIZE));
-		__vunmap_range_noflush(
+		__vunmap_range_noflush(init_mm.pgd,
 			vmalloc_origin(start),
 			vmalloc_origin(start + clean * PAGE_SIZE));
 	}
@@ -233,8 +233,8 @@ void kmsan_iounmap_page_range(unsigned long start, unsigned long end)
 	     i++, v_shadow += PAGE_SIZE, v_origin += PAGE_SIZE) {
 		shadow = kmsan_vmalloc_to_page_or_null((void *)v_shadow);
 		origin = kmsan_vmalloc_to_page_or_null((void *)v_origin);
-		__vunmap_range_noflush(v_shadow, vmalloc_shadow(end));
-		__vunmap_range_noflush(v_origin, vmalloc_origin(end));
+		__vunmap_range_noflush(init_mm.pgd, v_shadow, vmalloc_shadow(end));
+		__vunmap_range_noflush(init_mm.pgd, v_origin, vmalloc_origin(end));
 		if (shadow)
 			__free_pages(shadow, 1);
 		if (origin)
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 068a6709062d..8ef7d9987e18 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -295,9 +295,9 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 	return err;
 }
 
-static int vmap_range_noflush(unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift)
+int vmap_range_noflush(pgd_t *pgdir, unsigned long addr, unsigned long end,
+		       phys_addr_t phys_addr, pgprot_t prot,
+		       unsigned int max_page_shift)
 {
 	pgd_t *pgd;
 	unsigned long start;
@@ -314,7 +314,7 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
 	BUG_ON(addr >= end);
 
 	start = addr;
-	pgd = pgd_offset_k(addr);
+	pgd = pgd_offset_pgd(pgdir, addr);
 	do {
 		next = pgd_addr_end(addr, end);
 		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
@@ -334,8 +334,8 @@ int vmap_page_range(unsigned long addr, unsigned long end,
 {
 	int err;
 
-	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
-				 ioremap_max_page_shift);
+	err = vmap_range_noflush(init_mm.pgd, addr, end, phys_addr,
+				 pgprot_nx(prot), ioremap_max_page_shift);
 	flush_cache_vmap(addr, end);
 	if (!err)
 		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
@@ -478,7 +478,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
  *
  * This is an internal function only. Do not use outside mm/.
  */
-void __vunmap_range_noflush(unsigned long start, unsigned long end)
+void __vunmap_range_noflush(pgd_t *pgdir, unsigned long start, unsigned long end)
 {
 	unsigned long next;
 	pgd_t *pgd;
@@ -486,7 +486,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
 	pgtbl_mod_mask mask = 0;
 
 	BUG_ON(addr >= end);
-	pgd = pgd_offset_k(addr);
+	pgd = pgd_offset_pgd(pgdir, addr);
 	do {
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
@@ -503,7 +503,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
 void vunmap_range_noflush(unsigned long start, unsigned long end)
 {
 	kmsan_vunmap_range_noflush(start, end);
-	__vunmap_range_noflush(start, end);
+	__vunmap_range_noflush(init_mm.pgd, start, end);
 }
 
 /**
@@ -670,9 +670,10 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
 		int err;
 
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
-					page_to_phys(pages[i]), prot,
-					page_shift);
+		err = vmap_range_noflush(init_mm.pgd, addr,
+					 addr + (1UL << page_shift),
+					 page_to_phys(pages[i]), prot,
+					 page_shift);
 		if (err)
 			return err;
 
-- 
2.47.0


