Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86533CEFCE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 00:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=53lqhnCwr4+CHlYDfapnRzYDVQNGCrRloa/sH+4y4Sk=; b=1AF/uM+Omh6UoQE076EIJVdGYa
	AijsYTH2RORXZjL9Zv5xtkH7MM0SOX/iC6uo8DPBpEfLVR2sEf5K7qbAIRvhw0zG7HSfUDFurtwWr
	PYgH6NujapOCrFiWfRV2Azhw50hZCuoD1DQn6b1GBBEmZa+FjOHBeqytX04y1vNVkr8C/n4kEz/wc
	7n6HUx45Dux4rSxmfkLHeWQT7R/amJ5wNt6hhAOavBzrY+YmaStsZGfBg/QmHcLGkth/Eql2CbbZD
	Z+YKedKVHDeodFbvGn6vBGqK7LRjO945H54tOvvXP8UhlkQs213+3H1hEoB6jKnjzGpOgehCkfvf5
	iyDV59dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdHRZ-0000000DyAA-3bwN;
	Wed, 07 Jan 2026 00:30:33 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdHR7-0000000Dy8j-3yv6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 00:30:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaS4vfvGn7OuKFwS8Im5BWr5rc1wHdI90ynrsgSLNtali3/5F4pujXjHN9vgsXBR8lrVvGzryUyG0bjrVtzvThUTBvIDg0nmtGws/ZyU9m2VplKxXuVp626JR7oi6XxmFSKuJtaRI6qtL8CiD0fGlds8vkddedaLluJvAtFIUYiWmqPq7rsbok0C/LgFHSF8lYo4hjeKNBzDTQsixYoLJ4CyrvBYilmY9dRiMdp7Iw+HSlYplmVyJ96LuLGt/fw92CFMf6BOkiesm4yi1omL+H00anh/mhEYc51kasPsrvcH41pC+TjRk2abd+umVOxUMmLSFNAcsDvadMd+LpIF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53lqhnCwr4+CHlYDfapnRzYDVQNGCrRloa/sH+4y4Sk=;
 b=C5WJO+YBclG6zs8EPinKOk/QTZqHObasnJlj1yzgE9RY8GhDE5KZ6ca68Kq0ugw6VrYWhc3mdSST520HDpLB6Xga0R10xR4joas6nta9u+ptqHasKaAMNYd9u4j9GyVFTSbV5cw6SIgXg2F6k5e6smpzPWMUWRm4ipTMknWbSXMqx2o+6by+RPFqYY/8VBdJNTOWjycD112tYubk7WXtT9UHKmH2ejUYepGgD+CuBc00xTwQA09VAYao90Yga/Sl/Q44QQ4eZyxV8URQk4XrEVSHfA816b4dA9SxkFBQ45flZQntZRDqo34x3LX0THZZtBwX+riahaOz5QibEFyvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53lqhnCwr4+CHlYDfapnRzYDVQNGCrRloa/sH+4y4Sk=;
 b=j7AzG8oQvwq5k51FBFyoqQcEviHgPRSox6Giyp63NLFMsyOR2rX70lGIdHOJp6gh0GqFPgq5Z0cL8HMN8lWtcJV5Z0yQ+zLijPRQDFHMsx2JGeFDoeB/ngJMD3givHxEoqUFSh54GT8fFf89JH3fwW65fhaz/+TSEoRKSZIsNF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH0PR01MB7349.prod.exchangelabs.com (2603:10b6:510:101::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Wed, 7 Jan 2026 00:30:00 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 00:29:59 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Date: Tue,  6 Jan 2026 16:29:44 -0800
Message-ID: <20260107002944.2940963-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR19CA0131.namprd19.prod.outlook.com
 (2603:10b6:930:64::19) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH0PR01MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c1ac63-4fec-4741-d4b5-08de4d83e3fe
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R2svACIh8J8DIbY2NK0wG2qUE7Atsrq2D1MIeTQNOQkaJcB9Vm3XVVj4x3m+?=
 =?us-ascii?Q?XW7xGvI2rSWKLmr5wKVKQwFqGtZtUh+e2fOws5xV3vDNBH5QVxASByA2nMCN?=
 =?us-ascii?Q?40E9T+GfuJpd2tNARLPTokTunXTkEdqq3Wz0V6A5IGnc3MCT5KXP80ZD/MKF?=
 =?us-ascii?Q?qOsUZNTIe14Bwy3sHrwuowSTNKCshrtASEcB6XlWr52M8bv5VxCRZzjOmLMR?=
 =?us-ascii?Q?BufzJogM9qc5HxConqtWfj0jVQJUc1KNcjFynSRQQMyLZ+gzQJJKjv5ViqkH?=
 =?us-ascii?Q?2auFDM6jxzoyTFkKB6Eb7pG8bBzwf6IV3irfA9krikeYk0H1tRTCe4YgEIWO?=
 =?us-ascii?Q?2d5ybq4iN1CT6mQIdL0nlo6pG4FNMRqyHGLOUz+g+ulc6bzH6KPijNd9Vj4j?=
 =?us-ascii?Q?568aoMUzqyJzwbrhRJE8fso6YF8HJkID17433f5qmCbpx3cYfBHRlq9F3sY9?=
 =?us-ascii?Q?4T0dQDKwmrGjd/inbtn3D5nsfkXbHth5kjzjw0B2Iu3FLxo657gScheuOLs/?=
 =?us-ascii?Q?s8c1eHh70gSO3KWocqUqxa0ccjJvcWKqXWVypKdd5OjclF1URZnakgNb1bDE?=
 =?us-ascii?Q?NrYeNzMLGkfKEYZ6xfPsYZMv0Zt9hmDNkCfe9JHsrWl5nc8kYh7Y4BZCGjLL?=
 =?us-ascii?Q?+zB7W0k3tJdmLhWAluEmvKj18EyeDFXJ+GzG3qUBz3XIGqv0NnwQFSMfmzH9?=
 =?us-ascii?Q?L9Ls2HuAX1H2tyS+dYaJuQRkh/hla4CoxYWvmGu/OrxaFjz8Vwpm2M0grUh9?=
 =?us-ascii?Q?PO8kbNWXwepNYRmZlzI1zzanzgg3CdT1l1NYnL17y0mL2GUXuIxEDc9rNY81?=
 =?us-ascii?Q?xRvasJosv0sDmbAELBT6DnEGqW4+md697epa6KNxR9CvkjImFrSqm+Lx49yu?=
 =?us-ascii?Q?w3y3zFw3DiSKDB1MX9nQecCsqBujkEiTS/6bEDUe+bu78WTJ4csyalQZGsSe?=
 =?us-ascii?Q?EiM2e47Xgcg8xkXE4s4G7hTil4DAW0ytegF3OPxjzuJ7+k9CKs6pzSQzQeIw?=
 =?us-ascii?Q?QUHO95jDwWdzqGZuRdsp2Hhjq8sTrXd8NB0lavm1/ucXa9M2T1KOxu8iDqtQ?=
 =?us-ascii?Q?XEcOsOE3k+FW+zW0xIhbZqN+anhoOs5GdJXpUScR1tgvh7YsiYPiZzy9aZDE?=
 =?us-ascii?Q?nwnYOXdRYhy34xyS+6k1V8CdnZZa7piLqQfwqjxfdMHe96hjYjsz7J9ukszO?=
 =?us-ascii?Q?L1ky2GqMYpNDJCK9YbxLhL2KOaUGc9EScr3x7gaB2MdrTRPalqR9oGA8K+R4?=
 =?us-ascii?Q?eoMS+xi69en23spNHI4fKjUk3CJWPOvCptjD2k7F3M3XSkXoEJ0TknfY4oih?=
 =?us-ascii?Q?sXsuO9ybRLf4Mh9hhnlmqeUyJnIbh+3WvBypZ2eKW6YCXmsToFt/HD14XPJ7?=
 =?us-ascii?Q?Y5urDdn8NIEFqB6i/thxyqQchaijgoSIlUWI7BBzvJyB2HA24oaWnATqv9sD?=
 =?us-ascii?Q?EOk160fF1reiju442XZ66Eqsse6QLbUDdavNUHHDBXRtJC1nSQRnn3dlrwOC?=
 =?us-ascii?Q?Xn1sqBRWHbvhweXAdRTSX1w9TqtrQCFWX16Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bo8Cp3/jFSN721fRGtLcwp0i2nYGVaeBo5g6zZojsIVZhkpXUcb24lpsupI3?=
 =?us-ascii?Q?KekzBkPa/DN5a7PZ1RJAOJtwWUc5JveeJIHASpAASr7g+fqrp66WLEU6Vd6Q?=
 =?us-ascii?Q?0Olj40lFwkjQj/Yj6crfyqKdPYmX+qjYSVQxv/G9f9IEYLFfcedwU48kRVKh?=
 =?us-ascii?Q?1PFyABbsRT+bVhSpOCUJe+nQE97KoomcIo4Ru2s6q/Kj90GKytW3oyoyhWU9?=
 =?us-ascii?Q?9tUY1qfawAuv+syI4DYGQiVTMMPoq6/sYXnf+XH5snHcj1B71c8nxM0jTcrH?=
 =?us-ascii?Q?vEIHtgN4nQ9GhK1GtyuOFQZnfcRNF8q+MprNBHx7noqcvOXAfJCD2Sa1OjsT?=
 =?us-ascii?Q?dNEoTKXJNFIb+eUU2mwPoviSglKX+ug0L5Pz4WUJFSeXacjQ1WWK1wJiHcDj?=
 =?us-ascii?Q?Ui+OzfNgpX/9fbPA/i4HhZdUjwIlkaPITBgyjsGBws+XrGDx4dQdxNU2ZyXi?=
 =?us-ascii?Q?e3tt2EpbOhFR+AI15c3ZsSUHsyTGiN76253XOGW+QchRpnl8nN70BVplwmSv?=
 =?us-ascii?Q?ffHrdqrcthZenaifNeKaBO2hHpYqPR0ouMw/dnZh4kbeVCqCVzTP1Qs3eub4?=
 =?us-ascii?Q?NXt5u6K5dxNMfQFV2Sk8Fa+UNw+Vb11KJK8B9ABvx8MAd77GckOfHnXxZdZ0?=
 =?us-ascii?Q?WwNMoLgv4Vip/6JRJlFsipfVWuvVGAzCh39F2f2e3Vr8Of9wQqLlzYSlj7cq?=
 =?us-ascii?Q?iO5PKQyKim/KXXUDw1lLjXrsXue0EikcBvj5ocTXc4jhVjE6hbhXQUKkH3jS?=
 =?us-ascii?Q?cN4HU91X69ClhreJaWp5sgBCdXr4uXM1Q1EWbGopkUkl+SLlG4strEaaAghL?=
 =?us-ascii?Q?vJP+GdK2PMw0C/v8NNxYv17/O//g5h6cnTYxlIOdHNFsHA8usqQsHNEdy0nb?=
 =?us-ascii?Q?7zeKzDzs7wf6Ok5Gnt83/acCYevf92Zf6PPqd9LgmML137Hod13JXR8SczG2?=
 =?us-ascii?Q?cbA85XlxJYoTGqZJK5gUMb2jfOGs9NfdxpoJrNi0XFq7WWotrcGgCk7DizJd?=
 =?us-ascii?Q?FJrG9rcvsgTgY/8D/JCieqV0Q1eUa41t5o6mNMgRkvOfhkONIw0PdS52Qdz3?=
 =?us-ascii?Q?QyMEt+KaKtOBJ/jpoBdn/RoYnxGXpt4tDJ4QAj416/T/ALcdw95U7beFVpq4?=
 =?us-ascii?Q?/7jllViQWLknmOMNAbmjq1ES1tVqHKImdDhmg05R/i7iu7tF4xE7XWn3oDcp?=
 =?us-ascii?Q?bzN+LRN7PSv/Nk7OUm6PRUGu4nr8FIAuck8P1M4p/C5vLk07Ns/E34J8SHgo?=
 =?us-ascii?Q?DjMyNgYMAQVQbGy0m9aQYF9uJ4P0vanUGTfjzoqge8Z1ykQsBkSrRWBZ2+vA?=
 =?us-ascii?Q?ad05RqnWIeMsrT8HnHe+GLnWHkzOHEV8xD2ygWDeG2vrwKUqIff2jrGNRV9W?=
 =?us-ascii?Q?sDoWeMLsz7BDCha+d2wkTKiW/fp0/ntBOVz4I09gviyMKgcd8UlxYFjORNdb?=
 =?us-ascii?Q?sgl15K0+5vYvUiUN0Huqq/hze/FEuJ6b/pCud4l3mLKVr9eqeTjLaw7htOsK?=
 =?us-ascii?Q?WvMJxDJfT/n6Qi64/DwSVvOv+bk6p7+YpxDdI0H8S/clVQZZ8WScmstoReUw?=
 =?us-ascii?Q?j4C5/qamd0jcV0Y4Ck7p9IFVeH4IKBZOEvbSj6C8r+IXmYk0qSBq50NFKDH6?=
 =?us-ascii?Q?T9w+wHKBwR4hgaCB12tmV89dKMocdw1XbtmuhhudEYW7ZLYsYfYA5FtT8soq?=
 =?us-ascii?Q?rbILxAdM0jbhafY4Tr2Wgx+/ESkNGw6D/xsvqiqDJBCINHzZbETSPt8aonTG?=
 =?us-ascii?Q?H0zKg557OJ6OftXH165IlEgWszXrXr0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c1ac63-4fec-4741-d4b5-08de4d83e3fe
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:29:59.6542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tO5EERTykY0DDuHX+qNmgFUXi1mdFIsdZvwVz6ms+ohUXflr93mTLVokMS9ScWemLyUBVVvXjCA+qoCswg8YwKzw3eNohS6l1RnMLzydfCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB7349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_163006_208418_0F81F018 
X-CRM114-Status: GOOD (  21.88  )
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

Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
rodata=full"), the direct mapping may be split on some machines instead
keeping static since boot. It makes more sense to show the direct mapping
use in /proc/meminfo than before.
This patch will make /proc/meminfo show the direct mapping use like the
below (4K base page size):
DirectMap4K:	   94792 kB
DirectMap64K:	  134208 kB
DirectMap2M:	 1173504 kB
DirectMap32M:	 5636096 kB
DirectMap1G:	529530880 kB

Although just the machines which support BBML2_NOABORT can split the
direct mapping, show it on all machines regardless of BBML2_NOABORT so
that the users have consistent view in order to avoid confusion.

Although ptdump also can tell the direct map use, but it needs to dump
the whole kernel page table. It is costly and overkilling. It is also
in debugfs which may not be enabled by all distros. So showing direct
map use in /proc/meminfo seems more convenient and has less overhead.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
v5: * Rebased to v6.19-rc4
    * Fixed the build error for !CONFIG_PROC_FS
v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
    * Used shorter name for the helpers and variables per Ryan
    * Fixed accounting for memory hotunplug
v3: * Fixed the over-accounting problems per Ryan
    * Introduced helpers for add/sub direct map use and #ifdef them with
      CONFIG_PROC_FS per Ryan
    * v3 is a fix patch on top of v2
v2: * Counted in size instead of the number of entries per Ryan
    * Removed shift array per Ryan
    * Use lower case "k" per Ryan
    * Fixed a couple of build warnings reported by kernel test robot
    * Fixed a couple of poential miscounts

 arch/arm64/mm/mmu.c | 202 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 181 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8e1d80a7033e..422441c9a992 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -29,6 +29,7 @@
 #include <linux/mm_inline.h>
 #include <linux/pagewalk.h>
 #include <linux/stop_machine.h>
+#include <linux/proc_fs.h>
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
 	dsb(ishst);
 }
 
+enum dm_type {
+	PTE,
+	CONT_PTE,
+	PMD,
+	CONT_PMD,
+	PUD,
+	NR_DM_TYPE,
+};
+
+#ifdef CONFIG_PROC_FS
+static unsigned long dm_meminfo[NR_DM_TYPE];
+
+void arch_report_meminfo(struct seq_file *m)
+{
+	char *size[NR_DM_TYPE];
+
+#if defined(CONFIG_ARM64_4K_PAGES)
+	size[PTE] = "4k";
+	size[CONT_PTE] = "64k";
+	size[PMD] = "2M";
+	size[CONT_PMD] = "32M";
+	size[PUD] = "1G";
+#elif defined(CONFIG_ARM64_16K_PAGES)
+	size[PTE] = "16k";
+	size[CONT_PTE] = "2M";
+	size[PMD] = "32M";
+	size[CONT_PMD] = "1G";
+#elif defined(CONFIG_ARM64_64K_PAGES)
+	size[PTE] = "64k";
+	size[CONT_PTE] = "2M";
+	size[PMD] = "512M";
+	size[CONT_PMD] = "16G";
+#endif
+
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[PTE], dm_meminfo[PTE] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[CONT_PTE],
+			dm_meminfo[CONT_PTE] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[PMD], dm_meminfo[PMD] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[CONT_PMD],
+			dm_meminfo[CONT_PMD] >> 10);
+	if (pud_sect_supported())
+		seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[PUD], dm_meminfo[PUD] >> 10);
+}
+
+static inline bool is_dm_addr(unsigned long addr)
+{
+	return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
+}
+
+static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
+				  enum dm_type type)
+{
+	if (is_dm_addr(addr))
+		dm_meminfo[type] += size;
+}
+
+static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
+				  enum dm_type type)
+{
+	if (is_dm_addr(addr))
+		dm_meminfo[type] -= size;
+}
+#else
+static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
+				  enum dm_type type)
+{
+}
+
+static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
+				  enum dm_type type)
+{
+}
+#endif
+
 static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot)
 {
@@ -236,6 +316,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 		init_pte(ptep, addr, next, phys, __prot);
 
+		if (pgprot_val(__prot) & PTE_CONT)
+			dm_meminfo_add(addr, (next - addr), CONT_PTE);
+		else
+			dm_meminfo_add(addr, (next - addr), PTE);
+
 		ptep += pte_index(next) - pte_index(addr);
 		phys += next - addr;
 	} while (addr = next, addr != end);
@@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
 			pmd_set_huge(pmdp, phys, prot);
 
+			/*
+			 * It is possible to have mappings allow cont mapping
+			 * but disallow block mapping. For example,
+			 * map_entry_trampoline().
+			 * So we have to increase CONT_PMD and PMD size here
+			 * to avoid double counting.
+			 */
+			if (pgprot_val(prot) & PTE_CONT)
+				dm_meminfo_add(addr, (next - addr), CONT_PMD);
+			else
+				dm_meminfo_add(addr, (next - addr), PMD);
 			/*
 			 * After the PMD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -389,6 +485,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
 			pud_set_huge(pudp, phys, prot);
 
+			dm_meminfo_add(addr, (next - addr), PUD);
 			/*
 			 * After the PUD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -575,16 +672,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
 	return  __pgd_pgtable_alloc(NULL, GFP_PGTABLE_KERNEL, pgtable_type);
 }
 
-static void split_contpte(pte_t *ptep)
+static void split_contpte(unsigned long addr, pte_t *ptep)
 {
 	int i;
 
+	dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
+
 	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
 	for (i = 0; i < CONT_PTES; i++, ptep++)
 		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
+
+	dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
 }
 
-static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
+static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, gfp_t gfp,
+		     bool to_cont)
 {
 	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
 	unsigned long pfn = pmd_pfn(pmd);
@@ -606,8 +708,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	if (to_cont)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
+	dm_meminfo_sub(addr, PMD_SIZE, PMD);
 	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
 		__set_pte(ptep, pfn_pte(pfn, prot));
+	if (to_cont)
+		dm_meminfo_add(addr, PMD_SIZE, CONT_PTE);
+	else
+		dm_meminfo_add(addr, PMD_SIZE, PTE);
 
 	/*
 	 * Ensure the pte entries are visible to the table walker by the time
@@ -619,16 +726,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	return 0;
 }
 
-static void split_contpmd(pmd_t *pmdp)
+static void split_contpmd(unsigned long addr, pmd_t *pmdp)
 {
 	int i;
 
+	dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
+
 	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
 	for (i = 0; i < CONT_PMDS; i++, pmdp++)
 		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
+
+	dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
 }
 
-static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
+static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, gfp_t gfp,
+		     bool to_cont)
 {
 	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
 	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
@@ -651,8 +763,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
 	if (to_cont)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
+	dm_meminfo_sub(addr, PUD_SIZE, PUD);
 	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
 		set_pmd(pmdp, pfn_pmd(pfn, prot));
+	if (to_cont)
+		dm_meminfo_add(addr, PUD_SIZE, CONT_PMD);
+	else
+		dm_meminfo_add(addr, PUD_SIZE, PMD);
 
 	/*
 	 * Ensure the pmd entries are visible to the table walker by the time
@@ -707,7 +824,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pud_present(pud))
 		goto out;
 	if (pud_leaf(pud)) {
-		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
+		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
 		if (ret)
 			goto out;
 	}
@@ -725,14 +842,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 		goto out;
 	if (pmd_leaf(pmd)) {
 		if (pmd_cont(pmd))
-			split_contpmd(pmdp);
+			split_contpmd(addr, pmdp);
 		/*
 		 * PMD: If addr is PMD aligned then addr already describes a
 		 * leaf boundary. Otherwise, split to contpte.
 		 */
 		if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
 			goto out;
-		ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL, true);
+		ret = split_pmd(addr, pmdp, pmd, GFP_PGTABLE_KERNEL, true);
 		if (ret)
 			goto out;
 	}
@@ -749,7 +866,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pte_present(pte))
 		goto out;
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 out:
 	return ret;
@@ -835,7 +952,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
 	int ret = 0;
 
 	if (pud_leaf(pud))
-		ret = split_pud(pudp, pud, gfp, false);
+		ret = split_pud(addr, pudp, pud, gfp, false);
 
 	return ret;
 }
@@ -849,8 +966,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
 
 	if (pmd_leaf(pmd)) {
 		if (pmd_cont(pmd))
-			split_contpmd(pmdp);
-		ret = split_pmd(pmdp, pmd, gfp, false);
+			split_contpmd(addr, pmdp);
+		ret = split_pmd(addr, pmdp, pmd, gfp, false);
 
 		/*
 		 * We have split the pmd directly to ptes so there is no need to
@@ -868,7 +985,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
 	pte_t pte = __ptep_get(ptep);
 
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 	return 0;
 }
@@ -1444,37 +1561,57 @@ static bool pgtable_range_aligned(unsigned long start, unsigned long end,
 	return true;
 }
 
-static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
+static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
 				    unsigned long end, bool free_mapped,
 				    struct vmem_altmap *altmap)
 {
-	pte_t *ptep, pte;
+	pte_t pte;
 
 	do {
-		ptep = pte_offset_kernel(pmdp, addr);
 		pte = __ptep_get(ptep);
 		if (pte_none(pte))
 			continue;
 
 		WARN_ON(!pte_present(pte));
 		__pte_clear(&init_mm, addr, ptep);
+		dm_meminfo_sub(addr, PAGE_SIZE, PTE);
 		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 		if (free_mapped)
 			free_hotplug_page_range(pte_page(pte),
 						PAGE_SIZE, altmap);
-	} while (addr += PAGE_SIZE, addr < end);
+	} while (ptep++, addr += PAGE_SIZE, addr < end);
+}
+
+static void unmap_hotplug_cont_pte_range(pmd_t *pmdp, unsigned long addr,
+					 unsigned long end, bool free_mapped,
+					 struct vmem_altmap *altmap)
+{
+	unsigned long next;
+	pte_t *ptep, pte;
+
+	do {
+		next = pte_cont_addr_end(addr, end);
+		ptep = pte_offset_kernel(pmdp, addr);
+		pte = __ptep_get(ptep);
+
+		if (pte_present(pte) && pte_cont(pte)) {
+			dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
+			dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
+		}
+
+		unmap_hotplug_pte_range(ptep, addr, next, free_mapped, altmap);
+	} while (addr = next, addr < end);
 }
 
-static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
+static void unmap_hotplug_pmd_range(pmd_t *pmdp, unsigned long addr,
 				    unsigned long end, bool free_mapped,
 				    struct vmem_altmap *altmap)
 {
 	unsigned long next;
-	pmd_t *pmdp, pmd;
+	pmd_t pmd;
 
 	do {
 		next = pmd_addr_end(addr, end);
-		pmdp = pmd_offset(pudp, addr);
 		pmd = READ_ONCE(*pmdp);
 		if (pmd_none(pmd))
 			continue;
@@ -1482,6 +1619,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 		WARN_ON(!pmd_present(pmd));
 		if (pmd_sect(pmd)) {
 			pmd_clear(pmdp);
+			dm_meminfo_sub(addr, PMD_SIZE, PMD);
 
 			/*
 			 * One TLBI should be sufficient here as the PMD_SIZE
@@ -1494,7 +1632,28 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 			continue;
 		}
 		WARN_ON(!pmd_table(pmd));
-		unmap_hotplug_pte_range(pmdp, addr, next, free_mapped, altmap);
+		unmap_hotplug_cont_pte_range(pmdp, addr, next, free_mapped, altmap);
+	} while (pmdp++, addr = next, addr < end);
+}
+
+static void unmap_hotplug_cont_pmd_range(pud_t *pudp, unsigned long addr,
+					 unsigned long end, bool free_mapped,
+					 struct vmem_altmap *altmap)
+{
+	unsigned long next;
+	pmd_t *pmdp, pmd;
+
+	do {
+		next = pmd_cont_addr_end(addr, end);
+		pmdp = pmd_offset(pudp, addr);
+		pmd = READ_ONCE(*pmdp);
+
+		if (pmd_leaf(pmd) && pmd_cont(pmd)) {
+			dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
+			dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
+		}
+
+		unmap_hotplug_pmd_range(pmdp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
 }
 
@@ -1515,6 +1674,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 		WARN_ON(!pud_present(pud));
 		if (pud_sect(pud)) {
 			pud_clear(pudp);
+			dm_meminfo_sub(addr, PUD_SIZE, PUD);
 
 			/*
 			 * One TLBI should be sufficient here as the PUD_SIZE
@@ -1527,7 +1687,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 			continue;
 		}
 		WARN_ON(!pud_table(pud));
-		unmap_hotplug_pmd_range(pudp, addr, next, free_mapped, altmap);
+		unmap_hotplug_cont_pmd_range(pudp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
 }
 
-- 
2.47.0


