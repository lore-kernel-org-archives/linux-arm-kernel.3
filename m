Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C118CCF9E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbwZnxuB9IcJ5eMRnkmIgBrPsgTiM988Bs07y1THEKA=; b=amc6grgTDYJ+nWxfIql+u8I0Sf
	/94Y2gUGfiiuJOQGaMg68m6NjbGJziiqUep2/Ov6ufKuSVZg54yk7SOTcU3V2W1uhgAXQFtEq+5ea
	nWziUCbSdWqrZvpPs888HW2VmoyKlN4x1m+hj77MjfbMZcaeCVRrP6vg7g8DdCzmaFXutYdLBEpGZ
	D8W3tw/lli6ZiusaTEkvPgdqMEgeteIXKI4WGWrOLEXXl+dmKBuKIvRpTR7ZHTU3aArayDFiAXRGn
	YIyqWhGooSVT94zLQd3EaUD0YiDU4gLEWqcX8hr1ogZgPdCrhT8NbWmiy2L67dRQAMXduNk9odF/w
	SbWRa47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcOd-00000003k7L-2RR5;
	Wed, 22 Oct 2025 17:13:11 +0000
Received: from mail-westus3azon11011038.outbound.protection.outlook.com ([40.107.208.38] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcOW-00000003jz9-2FPU;
	Wed, 22 Oct 2025 17:13:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBlx0+41eqQQOp112CQsSGeNJVNJWGifog5i9dhDWQ2DE3xO0bBPVLL5AwNdKVWW62WhhRz58mLXaD6SFifmvsXgd0p42SsnLhnJhX2dV3DrVgrq6X4wBLuerd+bAChmKQRY4hyr4s67+gIH+AjYcNnKD2gqavAHjNph1mhCWvEWm0lZUVEWNQg+QZLcMKmGDC1IeCrZ2aZq6JDz024uEcvglortGSydJnddJhFFryTnqFAtkgYEWAB6fQUIIRgL2u0lPzh0AJ2JUgw+lZNLo/bR869kkShXMwSOCQrBGtCwlXnk+ttJQ0x6UT715RIKy0yXK5Wc4fa9v46VfcmWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbwZnxuB9IcJ5eMRnkmIgBrPsgTiM988Bs07y1THEKA=;
 b=IzQUDwUrgYc34HLGgQ4/JuICxsMIvQsJeQFpaK63QHVeE1xuG5QtuqHHKlm9vo2zmBI5cCy5nC9hMrb21wbtWG0lqyyKUBAjKOeZ3vzJXOXW2MAQ6lATwATdKWlPG64Ui2rjyjqC4v2O/7CAHOiwQD/L1VkrC+rxYffdtYhq31tYp23LuFnC7gOX5uOz/L9lT8Jx7eGZwjNXYigWtnNQe4D5fWUVGBp4lCNFYNujvBa0h6xKDG9Qr7jvEQcyb863JTeX+wAIVvcaQYPOp2CVZichsz620rM+qJ5+OyCcng88qFYRZakG5QRi0q9eYrwEFGAJ9c+HO2zhTFtkmrm0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbwZnxuB9IcJ5eMRnkmIgBrPsgTiM988Bs07y1THEKA=;
 b=giFfGPQ6P7KqkoPDE2XGw29bTkQkeWUZ/ubgJK2y6HGa8BOUzypOQ9XQO9gH+GA2S5uTaqs4EfsLour0n34bmZ/qKK9v06csXOeJGmzJhcYX4Q0xX833Dzj6ucFrjwSxLP7xe5TVWIqCB0m3OSu/pYpBBImDCDBCwOAaa60QmOdywqrym8dbln2hts8JhznuCv/VEi7WdmMsU9+T/bczjhPtaMmPHKuR1UnQHPBztjEPrFZ49PGU/QBOyJw0qfegauXUG+qnePW1Nw2TDvIu+YmVmXr7v77ZI+6P1Ylq25ttVolksJ0Z9Gf95+1VQzD9T87XX2hUkyhhItdkzXEJvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 17:12:54 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 17:12:54 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Benvenuti <benve@cisco.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Leon Romanovsky <leon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nelson Escobar <neescoba@cisco.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>
Cc: patches@lists.linux.dev
Subject: [PATCH 1/3] RDMA/usnic: Remove iommu_set_fault_handler()
Date: Wed, 22 Oct 2025 14:12:50 -0300
Message-ID: <1-v1-391058a85f30+14b-iommu_set_fault_jgg@nvidia.com>
In-Reply-To: <0-v1-391058a85f30+14b-iommu_set_fault_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0281.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::16) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MN2PR12MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: 1661be58-2b32-4ef7-62c3-08de118e3cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iZfwkcJaxBBZtj0C6FDprD7x3PUKMsLoUlcqaTIu1fdNcvPjeFfyJJSClu2Q?=
 =?us-ascii?Q?jI8gJdrFTEjutYJb587ZzoRYdNqfZkhLZQdIMI34AmBhsGUYZo6vAy8zQoFY?=
 =?us-ascii?Q?Hjq3AKzQKMpHMBunik6qw9epltSj6XEUhaBDCODM6SiPjDjnJcTb/fbbJ+3W?=
 =?us-ascii?Q?gwbRZR8DdfeLZNgDlLiIuVXC1diYxghlhN3VblaPBGAri/R7YZ4HX5S+lUm9?=
 =?us-ascii?Q?LfkoD2x48ftDJ4pt+ZmnfKi53v+GQmSJkytRYHARd6FN4gSlN8necwdcsE/c?=
 =?us-ascii?Q?8ZK8BJJM4z1EoDGo/c9VTNT1TbLsFf3u6EIC4ua8/R247sljB+s8YxWZ0cRZ?=
 =?us-ascii?Q?IdpvfWPks3iS+xO4uyzbS7OZJNM8mFqtiO4L2sqZSwEjIxJlEkplunZy/Jy6?=
 =?us-ascii?Q?wtqR7VMzuWqzNQCqHrKB1O+A+juMrNJ4o3dF9qzfVed2NpxaIzEFRs6WUQ1z?=
 =?us-ascii?Q?K/JSTLEaAVdEKlRxkdu+pT/JkrHOujulYko38kfjxFmlcyVIBDUFjSvITFUZ?=
 =?us-ascii?Q?9YXtkGiX53O8A7of5qafqauZUGgYSpp32sro43MHoOHph5hkYTg0sZ6aBuAI?=
 =?us-ascii?Q?hfQKqoaCjSav+qKrmJtrYadtvECZB4Gvbtlyt8BquczJjl3377bm3EH9AW2i?=
 =?us-ascii?Q?CsTcKI5z1XoVsHpEd+p0cFTkszzqRHKcdVYDbgkGBtxhqNsdCD6tSuX+QOY6?=
 =?us-ascii?Q?qPYngVWbP5LyFZIS2zaLv4JiUCOWTohmWgRfxo58oNM5vvWQHjSBoicJHNrq?=
 =?us-ascii?Q?a3qCX+FFydWyuvX1XRBbkXIWhG+QydsFrXmuB1xX6eFK0Mb9SPfPxtL7nuxd?=
 =?us-ascii?Q?cdEhTIC4gp/bRo1C0WePCcyYtAQWa6Ept/ig/dhhmHcL2Wq2xAWtMEw28H2H?=
 =?us-ascii?Q?L5rzN8oS8WWZE+OFG/q/fNEPj7DFDhI1tBkkue46fcDbyaChRK9CREDQTFM/?=
 =?us-ascii?Q?vovmwzSu+bQ/MzSfG4ctz3z6PyOLKU+U9RZUThEwWRw6WJFNh0K/iQZmmXpY?=
 =?us-ascii?Q?8rvt2S+8ldtqC1LT+olA9k102VmSUWTKW08GZFC5CHsCwk31NnhrEABLRtJq?=
 =?us-ascii?Q?YhhQZf+bW9lQFcbWLWXQokiFDfzhxkAGC3RrX9ivMqjibuOMKr5yhNyQk+wH?=
 =?us-ascii?Q?nKYtNYjm9wWZjVqGMickDoPxa5uPh0cKyCFnPsNtaxFfkc7bMkccTW7Fb/XE?=
 =?us-ascii?Q?o4DuOnZTMqpYfUFKAxXWz6wpaNNKfbyLqTNlfl2BtJxYtqC0wDl09iKiaT9K?=
 =?us-ascii?Q?y3+M4J0V6g4Dmn7FANv5TRy1AjVB/2aB/zAEN6sylYYj243S0UrXBSslwjel?=
 =?us-ascii?Q?ItPuYfqvyglsSGjNW/py+d6yc/N+zaHUTW/dm9dApCi0ewpP7myluqw3sytv?=
 =?us-ascii?Q?k5J+gbt8mH9PuXXmLdXS+YGWjKqcD2H3MVwWnWAuPlJ9YQTh9+FLr3REVstV?=
 =?us-ascii?Q?gQz6KVvwGr1LnfJzaXwnChIk/oFrET6JpXKP9G8z2i/O8IsZmO4CGcO5jHSn?=
 =?us-ascii?Q?RglsZVO+dSGmvhk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DpXw27rww2vOhK6sL36pMO5/IZwMOzCdyjO6YBiDjp5KMRspmsLD9O11uQKc?=
 =?us-ascii?Q?GD0vucCzLZdwnxBSuYytwYATy2vBV3TbGYJvYNG50ZCzbtXn+ufqgRGm11RU?=
 =?us-ascii?Q?xT7YqP/eFs5t/kCxhbbS4lBrQ+p9ftwMJKZ0qP9KuvQDsLf5ZvHQThN2B5ON?=
 =?us-ascii?Q?ed29k1MHRZrxF4a21KO4UZ1/rPqT4aNg1mzZTtuNyjSxDbYi6ULEH5rLBTBy?=
 =?us-ascii?Q?zJ+NT2zuP7u2ijiP5QkYtEKVWOr2nbtw8U5S2idFMAr8HB9NckEyPPG6Rdwl?=
 =?us-ascii?Q?MmV9Rd32TDVo+k47dUyXuP4Mjjc8TlwI4jjfDMOjCzSIiUWmxVqKkNBLfHs7?=
 =?us-ascii?Q?dA56DQ6CAxFu+Gs9/vY+KBc3rIXkSLB/yt4w+0CwkEgU09gcF3lnoe2ptYZ8?=
 =?us-ascii?Q?jtFwJt4WgeNeHpJ/Lgue1wVgavh3y1Jb+8S051rfCXxcVLORd1xNRdwIuPJN?=
 =?us-ascii?Q?20bGO0mHakoM6/ppdlY3rw1pvWHe7iBhWfPZLVF2s23cLg5XknH39y242D38?=
 =?us-ascii?Q?e8ACUp/MKKuE86wSRIxXR6iJDrceA750dGk1Q4lp9T1RbSsTm6LXy+k1uqRV?=
 =?us-ascii?Q?omvxS1ydC0TE9W98Z47oDsVHcddMPwR0HpOBbWmgncuPmEUoMJKjpQx6GbEO?=
 =?us-ascii?Q?6rw0DmeOcpVzEuXLBs8EWS+vKcfkaSNXZRIUzlNctWkyBIfihtDtTHW3+/ec?=
 =?us-ascii?Q?ElgX3cvAeSoyWZ9WXmchh9YViEhpxtQYlLJR+NIWARmHaI4EDQkM3yjq/bht?=
 =?us-ascii?Q?G4oTME9x6RpbgiqkxvyO8r+M/bmw4m+xk2KN4b4+8uWtotmIb9p6m9Q5Zndp?=
 =?us-ascii?Q?4TCGoA9dULGFCUt6ZxmtrDVbZWd8fMYUL9yPh26P8uar+ba1ilLs9Ju2ZOTh?=
 =?us-ascii?Q?NTOlxo2J/NDtNvtDYGQ67C9JgvEoYc0vLBEOljsCOrn/y24gNPpBMKsWwI4I?=
 =?us-ascii?Q?QllN+JmphTDk84unaOgy0vhas7zeAjed4uXtCv+QYfrQ41i9zlGSFo7Yo6MG?=
 =?us-ascii?Q?miXXqyRjKpl0Krw5TjJGP3ZEBhYu4I4gp3zdXjzAPRHhqS1dyhXfEpDVMo2u?=
 =?us-ascii?Q?9aBcJw9pPzvTLrwFsx31BSera2wiGHukMAT3Aquk5QGY5dEThbizSyxZqxGQ?=
 =?us-ascii?Q?Trfd/sqfHNDzsY08ZGgnrhTUn03K5NDcAHXNkzWZOETInvRZvFphuC4Hn5Vx?=
 =?us-ascii?Q?mh7XTQvBtSOMC80I9dEwZFdhFqXyKfdh0tzX5WzNAPeA5DcDTFNbxFoWUK10?=
 =?us-ascii?Q?SxMw4BM+sii8XuIfxA6+qszlMyqdnJxBgFDFaJsxfBC6IgAEFANaYNQB7VOZ?=
 =?us-ascii?Q?C61n7oj6XC7jxxOC/9H5GD7ArccfJaJHklyMwRpxBvoyZqLF2bCADCILtc9g?=
 =?us-ascii?Q?LVONtls7TsK/GuKn/hl3Pj8mL1+lx9TbKv0RKIha6plH4vc72yUvL7Msx0ZM?=
 =?us-ascii?Q?aF5MBdeXMgJOpMnbbkV6AwsLYQjmQLSh8hr1gCD0OA4UiG67tbbaFtUQp5SG?=
 =?us-ascii?Q?FO9302i2ZYD3t51nzYad3GekHMFc+yodhoHPmc4EFbphJ6GcCu44wS/MXk5c?=
 =?us-ascii?Q?UDygoVduiRoTJuU5mgg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1661be58-2b32-4ef7-62c3-08de118e3cbf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 17:12:53.8193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQrUpw6VkO98I6Cr9cbk82FwUhw5AlgBIrY3lhc7e92zKx8Ku4sq6Yh2QZpNJpB4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_101304_575861_94380B34 
X-CRM114-Status: UNSURE (   8.92  )
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

The handler in usnic just prints a fault report message, the iommu drivers
all do a better job of that these days. Just remove the use of this old
API.

Acked-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/infiniband/hw/usnic/usnic_uiom.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/hw/usnic/usnic_uiom.c
index 3fbf99757b1148..f7fb6246c83aba 100644
--- a/drivers/infiniband/hw/usnic/usnic_uiom.c
+++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
@@ -51,17 +51,6 @@
 	((void *) &((struct usnic_uiom_chunk *) 0)->page_list[1] -	\
 	(void *) &((struct usnic_uiom_chunk *) 0)->page_list[0]))
 
-static int usnic_uiom_dma_fault(struct iommu_domain *domain,
-				struct device *dev,
-				unsigned long iova, int flags,
-				void *token)
-{
-	usnic_err("Device %s iommu fault domain 0x%p va 0x%lx flags 0x%x\n",
-		dev_name(dev),
-		domain, iova, flags);
-	return -ENOSYS;
-}
-
 static void usnic_uiom_put_pages(struct list_head *chunk_list, int dirty)
 {
 	struct usnic_uiom_chunk *chunk, *tmp;
@@ -450,8 +439,6 @@ struct usnic_uiom_pd *usnic_uiom_alloc_pd(struct device *dev)
 		return ERR_CAST(domain);
 	}
 
-	iommu_set_fault_handler(pd->domain, usnic_uiom_dma_fault, NULL);
-
 	spin_lock_init(&pd->lock);
 	INIT_LIST_HEAD(&pd->devs);
 
-- 
2.43.0


