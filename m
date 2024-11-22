Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0603E65D10
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 01:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nm3xJqkUNMV4Ed55ikpwm4J38qbiY5kdy1mnIz5BbWw=; b=czSGNpt3/Ue+cdtf17lUfEBcYu
	jQ0/RP74Eic5h6Q662vypcGh+XWLckgmukSVfHomDlMgewujF0FJ353V2hnV/sWH+mfI5Z+1qbvJe
	51jUoUI8cCyOIoRtOZCxGuxaTZIt9xZV10CVgF2onJ00pFxYhBLE5vdMHSo7M4lCrPdP/v3e5NZwA
	83oDdBzvJh5T7jubjTTN4xnOaJunTP2OoriD4g/CFf5/Blk0CdFAVBghd6VGhrILirnjMZHRDgWQD
	WEjinqXxiJzAPsfm2XostWuBM+KB82/9HEwnN1QHWgiTHAvhnI8zNXn//rN7KdhBNzeWE5N4ZlVBn
	eDU1GqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEIo0-00000001NFE-3qJ8;
	Fri, 22 Nov 2024 01:49:56 +0000
Received: from mail-mw2nam12on20603.outbound.protection.outlook.com ([2a01:111:f403:200a::603] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEIgA-00000001KEU-39ZQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 01:41:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2FMWEv3hox6U/JyUE+rlzz6iFINTjUGWYFcLUXTDfIgfBT3h9V3HzuLrnt9F+YL0eUSiZiVMOxMX7855cD4GBtjSJrxQpySlTM2o65fVWah4sLPRvlYmWCDteDfQovXnZHWwYTbPb5J6prZshAa9vk5DfYW1hpxQ2/InISNYT/7JcbYY167448E0c+L8ahI9zoLonrcZPnuXsZXYSj9jxLh/yufemhlopdbTywE2w9wp6NyePpk+OPzvADwKfAODjbWcntxLTizBDAxVCKobMAhMnVS9ds0n2q8saTnbhggyZGN7gMkGNHH67hCaLK4wST2V3Wgd6TNOxKwEra9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nm3xJqkUNMV4Ed55ikpwm4J38qbiY5kdy1mnIz5BbWw=;
 b=iHxby60TV+4AvzVMAUO4VL5LGKOHtuJW/E2rud03DvlXa7ubDzxdbrPtyuxwi8aWPWrqHctw5nYIpwxdMQDzWVVLFUxIdhPBJdKxATGckxh3ljUKqcz+/RhRKUhLaJ5DFd2OaDwDwpC4aCSj6Nlnbgi6+63ARIQPPRG8mRNoLGMDKOQAJbdHx3IhlvRUoK0PpWIp/eBxanRKfYtX1W5102v4CV348iwDFokj0/u72XFViv+RHVTCdPcUaxkhNK4IEOytC6BSdo1m2Yfb+kqNgIw4FDsAJus19rFnJWUB4c3aD8GPzGeOcR+jTDirUHjBSU9s35Qe5Ry3m8yjF60ISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nm3xJqkUNMV4Ed55ikpwm4J38qbiY5kdy1mnIz5BbWw=;
 b=kyr1ePZh3/VATxqd/QmUpzIa+3W4WQriZgirLY6BgXlUbfudmR6Tgddi81Qw/0t3j9SRPvqW0qqDIy1VolC5l8P/V+Stv91P5g5j2BWf0jOeVGuEs40P+bpd3qfdkERc2VEUB7XtnQmg+rJ9vljsGbe+ckHeP2fZBOJhj5iyVWmt9omPaKgz9VxDu02+k5UXiWoB3mWslI7Javzhm0TIw/z6ym8RtLDuE36GSVmM/w7rlctZwTPh2IxwMsBZJAb+G0FifW1Ia8tD1KdDVsHS0OiZufwgV4cyN+FOveTOxWkoz5yWgDh4XaP2+U8vj7+dc5d7fDdxdjJhjNeqCdgRjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 01:41:46 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 01:41:46 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
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
	david@fromorbit.com
Subject: [PATCH v3 08/25] fs/dax: Remove PAGE_MAPPING_DAX_SHARED mapping flag
Date: Fri, 22 Nov 2024 12:40:29 +1100
Message-ID: <3e85c274cb0bb589e90167fd7c4fc0946b3ec94b.1732239628.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
References: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0026.ausprd01.prod.outlook.com
 (2603:10c6:10:eb::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ddf1f9-09b2-47de-c1d0-08dd0a96d340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XXB03acsgYf2X21ySJppxVpGgTw0jn7y7xMwAs2cd/SsRkEn72y6VdCkB7a9?=
 =?us-ascii?Q?GWiWMch9wGGKWsEwN0TtrsU/3JhWdgbkMdHpVKbmBhq4hjfJdWWjgHnjMUx7?=
 =?us-ascii?Q?lhLwnKJmiQ1UvIyC06t7rcxjOPByzOZNuVXEaP7g1tXCKvvY50t2cZq3U/oO?=
 =?us-ascii?Q?i8Ni9fyt4Iv88bb6yxAXQx3BjLtSvtov+aTAwDxM8N1nAE8MnJO9F65I20LF?=
 =?us-ascii?Q?dOUaX3pBJgxqGXtXH4LUYvXDd+7NbEplXCmp8HA1jB8++25wTi9vZIGZDk92?=
 =?us-ascii?Q?tJAoPL/QmxfDgSykKtkQjhEoBJxIwI+UntgmCE6VM6muIqONPz71lmjXTa1+?=
 =?us-ascii?Q?Dz8oPWCP586YweKT2VXKslK5GwYfkBAwWTVBdJj6lUcH6/uqrjF41jezbWUo?=
 =?us-ascii?Q?bIbFgG7QM/+E622pUOqEb/jv96ipLdYPgMiO5P8/VOFVTbgEeNmEVoPeuS7x?=
 =?us-ascii?Q?5iBOpsIJYlsoMzXrp4QuXSNH46yC+MtRb4oCOGc1MZsdl9cuxhGCYKogzlBx?=
 =?us-ascii?Q?Fp7ixWlcxVfbOXwkZFf6keks6RzQ6CkaYdFWoUyBj6fbqrtC904Jejp2NDtS?=
 =?us-ascii?Q?FaypafKzwyD3ienj59AxYTOS9Y2+81aO9tQ6lcgg0liEroU5CCtn/alk2b5W?=
 =?us-ascii?Q?Siw9SfCYBfuvMMmRqu/Bgm/uxQ27auL2uL+P25F2XGV34OpY5WLCyq6dRSKP?=
 =?us-ascii?Q?whA5y1z5OoTFsaZ69W8kwqpEAc2AILmAjpu+ayzWZb36UOqgKES/38lSZZPu?=
 =?us-ascii?Q?DsPJHMqIzRUXFbZcWSIotlbNYa5mE+yrE4aRKdygq4qQU3cbQp3gLyLvf9rO?=
 =?us-ascii?Q?o2es/xkXcQBkHOykgv/H4AOnnoqTUJFcExrOuARc3bIYiFQjyoJ1wlH70G8j?=
 =?us-ascii?Q?C6GJk+XIXD7cl/VpbwKmjCsaWmwglnvxmDp7xcbWOf+ewtDvreivX2EZ0Lb8?=
 =?us-ascii?Q?K8HkyD8VfmShLvsh3cx0xyV4aDvKqfqeT8xJAs5mYWwWMRmUOd75rWpDfv9D?=
 =?us-ascii?Q?zqfpv8pOkWXEKAPfIgeeeTBMjbwp8+uArRGhvbLScV5eJHT79pFdRGSkuAQF?=
 =?us-ascii?Q?ZJzJe8it4o9HDhaDXnZmS+nudDQQ/IIVCj/ntUpaWRLnHujFlP0SpWOwVmiG?=
 =?us-ascii?Q?2bGJKLRmJkI1OkxbJLjfTo/OMpRP7w3dryY/sCLoOtkm7RUXQZ0IaPx6uY3j?=
 =?us-ascii?Q?rBKUHxYuObh052jgn8JsO4eNRU3YGENJDInnuRyqxHHaRyyPJbqCbNFi7Izf?=
 =?us-ascii?Q?BR2vP8/ndd+FQCFtrfSGHUy5IuEnJwel8Pc7/hM1AQspz6QDQVyQ4EQE9xiQ?=
 =?us-ascii?Q?ErEU1C8TZFdy8Cy79M3WbwQK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mwhQ8DMcESTEN+zfBSdtF/EOYmb88y4Aq4ePI7FCujvppROU4AT+szwCMnv6?=
 =?us-ascii?Q?XaJj0T1eHci9qoFmziq4xkWBv5F5MjHNMOvrudlFBUny3fFRkvazSLMu60Hz?=
 =?us-ascii?Q?7vMMnT6nMXyUUQMyA/zfGc8ThCCriCjOTnL9ZOg/AZkprT6l5MNG0tvdST2T?=
 =?us-ascii?Q?4k3P2BeiVo9Fj9WKSmm8/CDpatDWWz4huQkgAHNtuIcgxZ5Rjvh6m9E+hC1z?=
 =?us-ascii?Q?cMS13hItDGmPDODwU+3HmmsVU2tYXOAbtJTHibbtG1esERh6zA62qgcEwjJH?=
 =?us-ascii?Q?KuoGoMGvTcLfW3GgUDAFQQIUIXz0NiuCEYVK5DRfIslcMKaVgAVBsO/Px/4I?=
 =?us-ascii?Q?GFGQqf4uj5rIPKVk5dhq/fGl1JTBbEl2fSFXlcrfPm7fq14Sx3pPw/CLwJeq?=
 =?us-ascii?Q?jCZ2oXhet6H+jKZlzw9MTc5BJxR0CzzviF8vMNrf5SpvE3mEbwxVfXKi4Skv?=
 =?us-ascii?Q?GMdYtmaJBHidjKLL5Hh68J0UUHlIfqP2T1ATtqLyMneHcE8oZGCtDhrRcGEX?=
 =?us-ascii?Q?LMqxLDjwhl1Jq00uYGw2u+OrY/xa3cgU0COdPmLyvcljI9km1Wnco2FuL2iS?=
 =?us-ascii?Q?U4dwZMIlFK2E2k91SgvZo8ItGPp2Y+TMBWxhApirU5r9ZcRoHpXUgP3EkTMZ?=
 =?us-ascii?Q?3l3RpyaFrlUrGAC3iFUrAlqyVbh/UW1QGEtWkVdsVSrlJOpKy93v6TtfULiA?=
 =?us-ascii?Q?xunkaFVbtEh/+3m5VETq6lg0kFeHXHiUI+0CdKk0692aoFvRrgYt9lCHBgi+?=
 =?us-ascii?Q?6mJM0Dk+TZrShNLekZNhD0LRelvamqVqUFndJVZ5pNjqyYxjAzFIcA4Qs6Gj?=
 =?us-ascii?Q?03+jxiAbfxfc875Lf73ZtG+9yaCctxQHqYJA7RDs7FhamTXHfYuJvm1f3oGk?=
 =?us-ascii?Q?msCCXf6rpGlqwD6AcmvicokSM6ZuRI2EPd6oIME9qkyCbttRCDowdKleb65H?=
 =?us-ascii?Q?e7FIzW3qIUY2noeGNM5vVSKnSYhacpoubkRQeJhrQcGU2xMUlb/42PkHKDaj?=
 =?us-ascii?Q?OlziXaJ45hr6nYhCIhx54HBiqFLp1bpWeGZunV+raU5beySgwOcbvdjIaFht?=
 =?us-ascii?Q?2DX/Vx09JeR0y99lx9dYHNL0UkBILTiGZP5u7uwvw2CtoUvHS1TuRzzdd/8Q?=
 =?us-ascii?Q?RsPu/fK0q2yoz40imDDEZAw0JqdCI0Z89b9Dis0+Km9yR+XGS8gwBMdDf1at?=
 =?us-ascii?Q?FADF/vysTbJ/CmUrsiUObKxVdlXeHt/kairi7kroBR4L0m/m9+6Qsrq7RKGY?=
 =?us-ascii?Q?+zTHHIBJJBh2vHoObr6M1fDCFt19AnAOB3tIb3dqIeGwumSZMynKQE7GED35?=
 =?us-ascii?Q?v9DnLgH3OGAtxeBBaxYlS3wnD5qrZtnfbCbutxAA+m7VkCPfvwoB7nFK/3oz?=
 =?us-ascii?Q?ocYjbETS4Ge1OCoGc2MTFiqoEQVwz0vmLhRCqFyuG5OQ7a394u3PKVuldi4j?=
 =?us-ascii?Q?BL+sbFxUcBbjnlrmKz0oYemaSQysba+mcltpum3+Uoxg1iHTnPS/szkzPJIs?=
 =?us-ascii?Q?JspYCgnMdhjUAgWJ92N39X2RTsBwCGRn8sSLBAI2Fm3APUI6AW5C0IW4VW8h?=
 =?us-ascii?Q?wQ0rc0HFVDXbUy9B6+8IlxYBFlpsz3Ef5QAqd8PG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ddf1f9-09b2-47de-c1d0-08dd0a96d340
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 01:41:46.5115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9ZBgneg2q3qlygm7JYg48uz5kjZBtI+gXFUX4GXEDDecU1ipZudlGcCZGxiFE168rImu3Zl9jegmxI9gXuyjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_174150_783451_3CA5055D 
X-CRM114-Status: GOOD (  23.26  )
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

PAGE_MAPPING_DAX_SHARED is the same as PAGE_MAPPING_ANON. This isn't
currently a problem because FS DAX pages are treated
specially. However a future change will make FS DAX pages more like
normal pages, so folio_test_anon() must not return true for a FS DAX
page.

We could explicitly test for a FS DAX page in folio_test_anon(),
etc. however the PAGE_MAPPING_DAX_SHARED flag isn't actually
needed. Instead we can use the page->mapping field to implicitly track
the first mapping of a page. If page->mapping is non-NULL it implies
the page is associated with a single mapping at page->index. If the
page is associated with a second mapping clear page->mapping and set
page->share to 1.

This is possible because a shared mapping implies the file-system
implements dax_holder_operations which makes the ->mapping and
->index, which is a union with ->share, unused.

The page is considered shared when page->mapping == NULL and
page->share > 0 or page->mapping != NULL, implying it is present in at
least one address space. This also makes it easier for a future change
to detect when a page is first mapped into an address space which
requires special handling.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 fs/dax.c                   | 45 +++++++++++++++++++++++++--------------
 include/linux/page-flags.h |  6 +-----
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 0267feb..d193846 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -351,38 +351,41 @@ static unsigned long dax_end_pfn(void *entry)
 	for (pfn = dax_to_pfn(entry); \
 			pfn < dax_end_pfn(entry); pfn++)
 
+/*
+ * A DAX page is considered shared if it has no mapping set and ->share (which
+ * shares the ->index field) is non-zero. Note this may return false even if the
+ * page if shared between multiple files but has not yet actually been mapped
+ * into multiple address spaces.
+ */
 static inline bool dax_page_is_shared(struct page *page)
 {
-	return page->mapping == PAGE_MAPPING_DAX_SHARED;
+	return !page->mapping && page->share;
 }
 
 /*
- * Set the page->mapping with PAGE_MAPPING_DAX_SHARED flag, increase the
- * refcount.
+ * Increase the page share refcount, warning if the page is not marked as shared.
  */
 static inline void dax_page_share_get(struct page *page)
 {
-	if (page->mapping != PAGE_MAPPING_DAX_SHARED) {
-		/*
-		 * Reset the index if the page was already mapped
-		 * regularly before.
-		 */
-		if (page->mapping)
-			page->share = 1;
-		page->mapping = PAGE_MAPPING_DAX_SHARED;
-	}
+	WARN_ON_ONCE(!page->share);
+	WARN_ON_ONCE(page->mapping);
 	page->share++;
 }
 
 static inline unsigned long dax_page_share_put(struct page *page)
 {
+	WARN_ON_ONCE(!page->share);
 	return --page->share;
 }
 
 /*
- * When it is called in dax_insert_entry(), the shared flag will indicate that
- * whether this entry is shared by multiple files.  If so, set the page->mapping
- * PAGE_MAPPING_DAX_SHARED, and use page->share as refcount.
+ * When it is called in dax_insert_entry(), the shared flag will indicate
+ * whether this entry is shared by multiple files. If the page has not
+ * previously been associated with any mappings the ->mapping and ->index
+ * fields will be set. If it has already been associated with a mapping
+ * the mapping will be cleared and the share count set. It's then up the
+ * file-system to track which mappings contain which pages, ie. by implementing
+ * dax_holder_operations.
  */
 static void dax_associate_entry(void *entry, struct address_space *mapping,
 		struct vm_area_struct *vma, unsigned long address, bool shared)
@@ -397,7 +400,17 @@ static void dax_associate_entry(void *entry, struct address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		if (shared) {
+		if (shared && page->mapping && page->share) {
+			if (page->mapping) {
+				page->mapping = NULL;
+
+				/*
+				 * Page has already been mapped into one address
+				 * space so set the share count.
+				 */
+				page->share = 1;
+			}
+
 			dax_page_share_get(page);
 		} else {
 			WARN_ON_ONCE(page->mapping);
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 1b3a767..b905018 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -668,12 +668,6 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
 #define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
 #define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
 
-/*
- * Different with flags above, this flag is used only for fsdax mode.  It
- * indicates that this page->mapping is now under reflink case.
- */
-#define PAGE_MAPPING_DAX_SHARED	((void *)0x1)
-
 static __always_inline bool folio_mapping_flags(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
-- 
git-series 0.9.1

