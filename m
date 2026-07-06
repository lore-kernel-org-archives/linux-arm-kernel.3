Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA9CC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jglHIL8KoMYLF/5vepR4ekDWkytXU6Yh+ib+2a5IuQk=; b=kqKgi5X/YzrjhBCVuB+RdxATlH
	MsF9/x5CIHvq4WHN/4yonLfufa6NMTO/qU3cLQV0UtGBYNXGZ0x8agWfNErMbiQvnsM53MYyZuZZH
	RoGDpnGBIusyNMTKRzP5YdyPNpavOKyxhs9UxcVAW0BmD/NDmdm8lB2KE0iuoXoV6CY4iwKtMleZ7
	e6mtHqrGlMKT5ZHB/l9sFjqXBTpTvBnBZLKxX8aKgescp7KXK7dzCHr54pZW+6ojyIABQqKPmzd6N
	PvB+AHzwYxRHiECV53YtzTafr+uwnvNnaXXM83DTiUITJ5s0sq8rT1mFCwMvdKdELccptKvwlngDI
	MOQtfY5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmCo-0000000D3zm-3DLl;
	Mon, 06 Jul 2026 16:30:02 +0000
Received: from mail-westus3azon11011029.outbound.protection.outlook.com ([40.107.208.29] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmCk-0000000D3gv-2wHr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:30:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nh9Sc90mSXnwyRMjPFhwhYn3Z+f6cBToD2jO1zGzU/VT0iw+YUoulIBRY1pWrc1OAUJjxGhlcZqM1GXc7Nl/UPqmyb1oCnL1cO2jbAfu4W4LaTAij14hTiS53JF37QP4zhscMHSuwUjaSSkXAoneWgGWpsy8MT8Izj52hpdC7ij5Nz/wO+dKIgOJYTFmnKRGrikHwsAjG8YsMentkgMhhk08/xG7o12rrjRfIxzbRBjmQH5iSjbQisMjpUfjzp7OMQjdXAawBYq0hc/El2eCgrT+aooDBIoSsnw6EVs3Ylcgn34y3JyYRy9Hg0meU11ZlM4NeQCcf/WUC+mlbq6usA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jglHIL8KoMYLF/5vepR4ekDWkytXU6Yh+ib+2a5IuQk=;
 b=rrc7zNtMSaT7ioQO7TwHV35IIhzawg+RHfaEB3Vj3Rz2IWm9ENk6tr80mxToqt/3SMWe2IqJjX0LekFnKnYMXK/YarxpTTkzSr/853lUZrHoAAREHMfOU4xERXUMOx7zSPcHnQAq0L0m0fZLEV82VSaf0BHPdJOgZvax5FNFVqwegu+IvV38g73vQUvzimPy77tiSy4ew3oL8M6q6r6M+e9C6EwtSAuCDlTrWfxkoZc7LEmciawSfe89XqUDEm7EYKlR+G6L0+9vCH5yYJGX3DJY4UqBeL6DddXKqCwtAQfLO3s5nTwEgdmr7nPxv/fO0Kq91tQ111n7js4sV/6mkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jglHIL8KoMYLF/5vepR4ekDWkytXU6Yh+ib+2a5IuQk=;
 b=DdPBJsjpGXmBhrHF/Md/Cr7Ykw1qlxIV9mk7emfympU1bT78lbgd/312oy3Lk/Z3XkhIQC5N3jd7IDbtSPTTiMSGvAfXkTTUhCTQ0gjjhdJttavDVAceIISZ95MNRp1k6OgUgS4+Rb4QGRPEbwpyrm9OLw5MGKvQFEPVnSWJHvA9cj/z7LhjHXRrvfhdxWwjlSDbr4MLdOLut9GGxzOiBq9+TpW92ft1f/1SLT8zo5T9+HCv6rfM2q4LhuSM49STwzLHYeCRAIv+iM9qvQTdjEyARYULR3QaIufYfOyFRu7mr5lqGERP8Ml06SPxTyqDRZ+1bmDax66Q/DYB2Zyzuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS0PR12MB7926.namprd12.prod.outlook.com (2603:10b6:8:14a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 16:29:19 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 16:29:19 +0000
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
Subject: [PATCH 7/7] iommu: Remove pgsize from iommu_iotlb_gather
Date: Mon,  6 Jul 2026 13:29:13 -0300
Message-ID: <7-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
In-Reply-To: <0-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0373.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS0PR12MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 365169f1-e23a-4c9c-07e9-08dedb7bb8b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|11063799006|3023799007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: ANjYZnn4H2Yc5v1PEu8nZDe8bOEQCcTQ3TfF57aKG5SMUlQjcekGWUbSgjpVlTBqnqEogCPueB4g4UkdEi9jjGWjbh1pBHFfaRNCMyIAXpJxIG9g8FDKiCnIdouEPp61enB6xVDXZTnRIzztts+bzaGKDZEXXcqtF3lGKsirZQrDIS3qBJdFzQRe6Yf99kaVR7BAKWTZgU2rKpUi36Fpelt6YIxAjzcuEr4KnJjmo5c2xo3B8O03l4w+E8WzhkuDoz8I0wV5KtSanSolN/nbov1sh5RbdU0GtG3VmyztbWn+qM6DkdJ+jejhw2G6JYGQkNxK9t8rZUS+Bzl+RWpTsapTr7u22Q0/7IcoGaa6gVpMIFCHL07rm7okTiGmPH9M0fc2Be7az7eUUjy4KRNUDJZ5ZKBXxjV3FrG42uDjvwvNmxlI72aMdE+Osw4YdZPBRD3A88DyujI0rzOn1/vzUQMbgUqnN5lNgdvcTS+xQlm27CzNLf+qlDMZLfBjBqKUpTQLrbfBYt+p+sP2mX2ORDY1FB8IhfVgUT3p16cIvbqqV8/NXD9zeQTmhZRQNxjtuqLy9lxs8VIYm8GdKmuk2pGPwp4zS8pGlLfenBX9qvdcrGGSxTlz11MxlqInwlvZGmhwEmOtbXmPk//NjhhWVcyFcmSoI++ce7an8i3KwiE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(11063799006)(3023799007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1/lmkXUxUYvNSScQ5amiTIYPIzCywKcilRVwgFmYO2VNdkQK7HJyMbFKS1By?=
 =?us-ascii?Q?wj5hQDS6i5MIWRUquJOfDR1KrFvyQXm/+msLYtP5kZoRY//J9uFd1GFxSv6I?=
 =?us-ascii?Q?fM94nvpe7oPF8moIjtI1T76LfzeKrt51XM9xmZ0FXXBt2IqhD6RnsTb8Fb1D?=
 =?us-ascii?Q?MXjtNdNJNzzhsg3uZ+OQkIywhIO6VAEV66BjB94DTVQ/hOmQKW0KCnzE0Nwl?=
 =?us-ascii?Q?WfB7HPKvlUrGSK/ngI6asST6Sdv7s5QHmmg7S6218Q1Y9GSzKvqk/KbHc4SO?=
 =?us-ascii?Q?X8V8nPusRICGVyEDCqZAg87l00RzNjD9zfAL/pQiam+QAZ+QquXW4CkqFnG9?=
 =?us-ascii?Q?aEKdvUfA6jeyjKlyG3rHs+3pUwc8ZhnZtJTyIsUFUoadEdgqK5ZyRxcc8xXx?=
 =?us-ascii?Q?LJ2zLBlPCSvqt/soyW3QPa9QrrwpORwNNdRfc9EJ43qcDBE364WpToP2/JAp?=
 =?us-ascii?Q?Pr90OBjsyZ09WXp09AWqxKVZ0d6aWT2EBfwh2rBYnDUbqaXsRiSjNgmELHhp?=
 =?us-ascii?Q?GRBFqwjJpUYr8nqdKD6WKDT8AJ/6FrIu6PYi5JTpoQNUsgchLT02rIchaS+g?=
 =?us-ascii?Q?/equ9vjesRgjLa9/PENLRdlf50TtfywAf6JMzNe6oaW3/d4gOYsxgF3r0Z2A?=
 =?us-ascii?Q?mSS26ZRvuughZX3RddDCHqQCC9qGS5HezLD/H/x2zO4HKeAFjwXx5PYe4ese?=
 =?us-ascii?Q?3fwFAm43i+xhwgdLL9q2UkTJikDkhhTN7myrG+Vmf9m3UbZW8QPohHakMMpW?=
 =?us-ascii?Q?cKuW9oFX0hhAC2v5XRTkjcoMhQV87Lio6ZGtRYy5pRWQ1fJXsdkmQ3PjQUIY?=
 =?us-ascii?Q?8w+pbh1akoeouydAjoUMvIbuEFCFmqkCOlm1guIwr2HHPHpHQMO8u/4Eajy+?=
 =?us-ascii?Q?eSU12cArrv1RZEjQW/iYQhsMvbvgDl+Z/0QLg8syJNCYJ9kefFAaRcZ4/vqI?=
 =?us-ascii?Q?EvG/k4/nCcsGwxYOuY07PpvqrW4GLz2KdQTym63RsVIFyYkwxVfje5+644oz?=
 =?us-ascii?Q?fkBfQNy02tOwpdaFp54X82es670OIQTXCIkMjCw6kwWYiiI+QfDZPryZONZo?=
 =?us-ascii?Q?5vNK+rFrCYuJRjT6g65ce13ZE5xKJfyS0U6iFUExk7FCegowPamt8LCs0H5y?=
 =?us-ascii?Q?CqZftuLXDxcMz6k3zssTREzipCPlL3JZ9PPIS2KknxcLSoRWytYKEJAVw7LO?=
 =?us-ascii?Q?uQs2EUucxf6JxwjBvK6plC/PUMtNy75rPKYF4YvAc1zjfoH3T2X4bzW7d/1P?=
 =?us-ascii?Q?B3ggH8P4Gs55W6ij5fbVf1kTjiQGNP+KCPH7N/Tfrxl1KW8zHyN+EQDsSFiR?=
 =?us-ascii?Q?8YPUDsg/Sj/EU0ecnq1G4pL5rggl+3ZWXHIy5ASzC9PNTcWjQpDsUL4d8SPo?=
 =?us-ascii?Q?YRASxwfiXAVKYUO0/1rZlYk4Wm4jEssI2OVr53lfDqOHGon2rrJyX2FxnPCy?=
 =?us-ascii?Q?IVDRkqBh6R56rtmDmMchFyUQdOyEzHyuQAk9DCLC+OEzUnrNQod2EiRqTEwZ?=
 =?us-ascii?Q?L+2WoHXwwc2UNIUeqFe8dVHnWH/c5G152tXTZfwheoJBXBH5LFr8bHwdW2cE?=
 =?us-ascii?Q?1sM/VrNGTzDy7bj7+T3kgXYNOFAJBHLyaE2ODKizrIuQDn8X8QRsfOJKAYLn?=
 =?us-ascii?Q?okaCQQshOq+ckKlk7cT6hwGVIC0FaY0VAztd6/IV4ajlPaSWC41jsMC1H4Qk?=
 =?us-ascii?Q?hNoBgOEVRJ6O0i1OgKLLhN6wm/geGdYgiptNay7cffMM/khF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365169f1-e23a-4c9c-07e9-08dedb7bb8b7
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:29:16.3591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmKnGfFc9sPfMIA9BYkCA1MCdbe9VpDLTFbTiHW6cLrfBGrOnQXWcUG0NooVfHM1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_092958_749173_FA0FDE99 
X-CRM114-Status: GOOD (  14.71  )
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


