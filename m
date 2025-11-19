Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74522CF6499
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 23:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uVy15vkvT2HYjtndZktGfSXQhAfgmuDUEvivI5zi/RM=; b=sCyI7RFqgT37pTZoMAZJ3VHylW
	5ZpPpyBRfdB2gDr2H768okXr3MUQq8Iv5g5mlkyHgN4NrEHA1eMbcPlqMB+wx2bX0AIGehd9Yq0n1
	OtZqGOMA92Xyxx01ubs207NFHZoAfLtFjPSt+kSKhnEZBYt9+dH0xoHniiL2cQ2nUEIpWAg5imG3h
	KCwTXcT6X9ajjOczvTYmINHSXXfGsjvY2JQhfHFyVpgwpJs4pIZxZaVgmOhChnZMmd5GtmFilFlKI
	HiHtpXHglHS8kFxSpp0EkXvjq5TfPZpZT5ZkV2BZjvG0yllM7rbnJLXHwIjmP8b9c1Ad6vOVaYXkg
	KnVyKSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLs3L-00000005r4s-2qbz;
	Wed, 19 Nov 2025 23:57:35 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLs3I-00000005r4T-3Ii0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 23:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhiYG/2uKpdzqn2/b7wFN4JsjjtnezZBm/ONW+r4cJgFs12GYo7OUnFlTP/kFIqTHyIbiTbEyj0tlts8Yg0Bw+8jQs9JUZURh6Na5Rt9BystRTef4pJumVjcm4vSJy1ha5pxROtHYQzG9LSizU8t41GAlEkjC2xiJwqrKbPGp3g2gNylQTqq95X02t8JcWNpSrjk+JiBC3B4EBr76U99Z3mlgj2dGQjDKyLyf8OS3dTIAtziSi8uoc/cqhDf28heD/4Z5hPOec03tfH7GHzMi3BZkU4XIEJk1xSYHcBdRNe5hNbVjI6UJf6g3WfBFi8dAZH5E//dbx0bDukiBhzWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVy15vkvT2HYjtndZktGfSXQhAfgmuDUEvivI5zi/RM=;
 b=Vx9jlWMMJwF1RoYNZPF+IqmeTljh65xOVTXtqM9KaRWTs0p118FJciTYolfC7Hoz4/HLskBmeYyyg2Zm5Re8AZn++XvLbmrFF7V9dcmIstm1VjOY3ZKnKW10gCmfd4bC2hhLj4fCws/pongVLkzC29Uzox2PLyoIFPuhuuSIasdufvrIsZL7XDkxkAX98SGfekDW2j0p2mJFDHJBSngxzqyzSD0jWosOTs+t1iv4C3N9AaFN3wB9L9fbuQv82yxX1qAmfqe7M0RsC2nFRPp2+XIOaJeqf6gA2dz/NwY5s2iS+bEtPZ9NaUgxrm2bPb991cC3kOc/ApCJSl+XO2HmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVy15vkvT2HYjtndZktGfSXQhAfgmuDUEvivI5zi/RM=;
 b=TdgENgqrTa9F8sXdDScFsWlQz69q0V7E2Tv/6XiXJ9rRjj4uUT8+tr2W05DY85egUFuw9S69x4iSmIskSri7rfDjheJ6ok3qBmvBkKjVP9u1OILg6ZYe5OnBD+l+p/S+qzbLcQf7iD9i2uUWUH0lqL3x1oyMblsbF3r4O+oMAzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BY1PR01MB8780.prod.exchangelabs.com (2603:10b6:a03:5b6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 23:57:21 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 23:57:20 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: mm: fix direct map use over accounting
Date: Wed, 19 Nov 2025 15:57:06 -0800
Message-ID: <20251119235706.1944517-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYXPR02CA0075.namprd02.prod.outlook.com
 (2603:10b6:930:ce::28) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BY1PR01MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: b4709a0d-ce3a-40eb-cf57-08de27c76026
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/rnQKh8mcWQfQIgtMjgDSM4g4ScZeCgwXmC4ueEuuNezjCvtX96mHtEqoByT?=
 =?us-ascii?Q?KFGKyLqVAecUUO/fJjLjhmT+7r9qLgDk9XkFhtWjEgkIgbYdrBez3THdQstp?=
 =?us-ascii?Q?MIzy+6sxkxf7k/KDaw9x6eQx5rSHGH3hwpitEZ9SX58Zyu7UlAdZJyqoZfqh?=
 =?us-ascii?Q?MUJVXIAv9vZQvEdeaCq8KAXRGcinh7lkvXfFftw2Zvt2iuT+QrioRRpq/z4K?=
 =?us-ascii?Q?xAObyZit0oGrF5XQoOBgSmKRLITRJTHvYfXKgTeLPRHUhnI/aPxYJmzwn18c?=
 =?us-ascii?Q?gn7xbLzYFF36PP4SPrU1qwcxCumPkE8L+62xqE7gvccEWLoTYXSda5sK15vn?=
 =?us-ascii?Q?drKqJZ6KeBUrqvYSNFelD1fTGvQ0ojVSGDDit0dehkB6ykDvJWA2YebQnSuG?=
 =?us-ascii?Q?zjAuXgQf6qwiaIaHwywiiM4fR+Y/DpSPMb5e5q9CIjepr8jGEJVb9wp/W8K4?=
 =?us-ascii?Q?ToIHOrHGBzd63JLThGsaXp84rTygy95c3DifYSoeYJZMs+oqApLl6kCNL3nB?=
 =?us-ascii?Q?gJtLLog1jaYpn1LzqxfnjmrbdYjs6yGCejrGcvjgRrkyinlnzVxK3hNrWab8?=
 =?us-ascii?Q?xmzJfehc2A3HppiiJck0gk7PEiryi8Q9l1LrWJR9uVoAITTwxr6NwpZkZozF?=
 =?us-ascii?Q?srGc5dCPLBH/Ema6uDixEvQFzqrhmqJ3OMiNZbVcms94y4LrgYEzuMl4QEhL?=
 =?us-ascii?Q?ki0CN/FUANSd3jXskvferr98rN50PMWaHanbXnWK72E2Yh24+n+scIm1IcXu?=
 =?us-ascii?Q?QTLXAFQtOPsie5WfqtIW3BGZSfO5/kweC9ssdyPr5zXsi4K0mV3hPvipo7me?=
 =?us-ascii?Q?garNyf5JDCIDtDk3Ce+l0nld6nR9mIxq+MdfHA8o2dKkb+qz1tdtuzAXLRqX?=
 =?us-ascii?Q?mdd0ydL1pFxRy4LJjfZKnIsOnwGQLVQYYNKPsoFW+C2UKS1QVNI4V1ay3C2X?=
 =?us-ascii?Q?hUIiRE4aEHFldqnQ22eHw8e77coXmFZbEGgP0mO6pN8GKNmerUWdWuETowVP?=
 =?us-ascii?Q?wyhbguWddbA9b6n0GviwU+pFUsBuIxAxJF5jXzf2NajkKPn9ccF73EkgpLXT?=
 =?us-ascii?Q?rywww0QnK42E1QcODQs7iaq6v+1RyPiZCqNbfFuD387bmCDzAhPfNMea3AAT?=
 =?us-ascii?Q?dSlQay/nzi4NVud8tyZZMAL5SLGCoKer3G1/BlyaivCeHGBTGduA3miAP0G3?=
 =?us-ascii?Q?eBBTtvd3mDWIJH9jisHHIW+MYkQCRa1eTDlygL3ONUWTEbRZRe0CsyPFtNPY?=
 =?us-ascii?Q?FHXQADOU66UtrlwBHW123Brzow1nTewOaVOSP1jVpyjIdOh5dLl7UnxRiPf/?=
 =?us-ascii?Q?6qNaZ/P1NIIre+Qkc7hHWpATc6y2JbMTzs5khaPBNWG35q6SqXKMV+K/BrdV?=
 =?us-ascii?Q?fr2geYY5/I5jsoH5D+d69bZ2MfLLkG3mUpCyIsTLIW7otSf6QVWqTHyGVlWE?=
 =?us-ascii?Q?jXmwZuabQ8HbhtfhcKSsgKlY7bLaR5n25stTTSTgOy3f7kt8fCXXr1pIUANy?=
 =?us-ascii?Q?sBXlGXWVIbyCe1gaqiVpcKELSfqRQA5Cp1Jl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3QxIJhU6WM3jKsylStLjg8qklK0IgQAkufVyFGddq7P8V0a7nw3kgEdo+cnB?=
 =?us-ascii?Q?YHVMJFC635AdTdlh9yy/eR89lVNTwbb0jAqNdx67gsCDi4gRbu5kcZdjthQv?=
 =?us-ascii?Q?lEU6jkuIxAFlNJQcrXAxWTbp+IyirSnkZnKfZt2fbH8eGBUDO4H51mtkLJxV?=
 =?us-ascii?Q?1CPEKFbxDZReS9pHPivD5mWWfa0d0K7wnRHeFLO9m16yB87ubyOFsxLIAzAd?=
 =?us-ascii?Q?YzyzsCBvxI+IB6uH2t6N5OtxXdzs4xxgP3kLdMpsfZC5lm8e/QRW7ojQqrus?=
 =?us-ascii?Q?MMmHX1F6v4ZU9eBK8goq6S9Zp+cKIUvCXDDxFlGRN+izhn7IxnxgVW2oJNKS?=
 =?us-ascii?Q?KjL2K1IPpsxMA0aNkwP4q+CwOwUrS+w1KMd1dF3MYh2PvYdLQzU2OoP9vJ5K?=
 =?us-ascii?Q?RFsoy79mzLuo+X2C4DYbENn/tGzEFzBHPOFLGF6Wp/HPB3vyDwj7RF+KEoBN?=
 =?us-ascii?Q?oJRx3Uhfjwqf6KYaE7J7vcoiV4CP+RXmDRmMYH4Oe4c+SWK5Rb0ahct9Tuxz?=
 =?us-ascii?Q?BZUHoCsXVd9A0XFVJKF63Y5WnyR2c0DWMNGDSkiQ/IjXImqgiqKrwYfemAxq?=
 =?us-ascii?Q?MVvcBc4OsItlPnbJYZbNpQuEFQYBYHCysPw5cB4MHGVSfWJdQklTlTHy4gig?=
 =?us-ascii?Q?1HR4B8sEvB7mpQA3D7M90TSkgDk/yBXK+feonnQd0kHoIFz6BLpxx4blO3ld?=
 =?us-ascii?Q?CgufIGK+AbDWo6kYXLVOU97Vn8jOqBSnTKOFRJza7pUSck5yqj4FPi18xn9o?=
 =?us-ascii?Q?K9+7L6G+X0/jgwj7MZfNh7PaghxWH2uwXekUIiXjnO8cgDHiMwaqBwF6kbhi?=
 =?us-ascii?Q?2l8cH38+JQtl9c4f2gCCogw1UL34AFoXhL/ynRCYE9KLYUEF/kTR8N+milzw?=
 =?us-ascii?Q?p6vZm/9HQVttiymJ0MzZb7hkEFNS5z0ZtYREHv/1UgzpsiTuvRUGc95TcKgF?=
 =?us-ascii?Q?cD7h2P42cJdHN5oe8jmg01kvCGYwQnTJ9sfzwxEr3N6XYdmhV2EZuqtcRQmt?=
 =?us-ascii?Q?Ya9n/4Qk8ivZG6HrFdcr8MXlcv336y4NqgHrP1el0WkKrbpEMhh020IA/j+r?=
 =?us-ascii?Q?RDDdljgjx5DAq+Tf8G5I+q4OsCjpR8iXZH/oTyaYDLup860D6ZCcLkJsv07/?=
 =?us-ascii?Q?lwJBj5luhdOrOAsmU9qTtElcp1xjNkVoXxQ0vVu9SUh9Of7WVJIxKQG5jd/D?=
 =?us-ascii?Q?gl+IZi+peDd2nfJz5+Xdo93R8D+ER26Mn0xjcxTH+4wqLYVSWnMECOGtFnjV?=
 =?us-ascii?Q?dqTrJ7UwL/+z0pI6ld2rTF2Gdfu6OcjERP7DEX3yuBJdc06JvHTd9zaavyBl?=
 =?us-ascii?Q?pn36zS8XCA+qC3S053ZWkiVpeQNdA3/7oemUVfNDZ/dPw3KuGeWAF2finzO/?=
 =?us-ascii?Q?290FDDDbOII5pv6wEVJ4hWfQQTFvsjYLq9RhZWYfmo2HlstzW5/2csL0+5qV?=
 =?us-ascii?Q?iyRxhjUSMjgLIme1EIsarz8Pk6jRAjMX32edmtHu9VxAgjong5y0011vBKFk?=
 =?us-ascii?Q?uzsEbvyKsr2+LYplPSs1WlZ4JjxWjiPghKx/T/FE0shmzfg3zYoB4+9YyJ7E?=
 =?us-ascii?Q?wpPdOCgMWCYs8t58H6yfWSJMjTLlpspJALgf+o2rbnT8uLBf0T0AZTNrXQfB?=
 =?us-ascii?Q?Y6lQxdJRklHh7If39SLDaFY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4709a0d-ce3a-40eb-cf57-08de27c76026
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 23:57:20.0350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KRsfs5Wmik/ZgEFKURVutjRP/SaV/NH9/RD4cDVzv0T6j/mMkLxNftmm6XjcoCY7TiZYGoluo8pkmpjU2f5xhZhauLPIkpVFO25qFLRlyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB8780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_155732_944241_52ED884B 
X-CRM114-Status: GOOD (  16.28  )
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

The create_pgd_mapping() families may be used in other paths other than
creating the linear map. And spliting kernel page table may be used for
non-linear map either. So we need check whether the address is linear
map address or not before accounting to direct map use. Encapsulate the
linear map address check in the new add/sub helpers. The new helpers are
nop if CONFIG_PROC_FS is not enabled.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/mm/mmu.c | 107 ++++++++++++++++++++++++++++----------------
 1 file changed, 69 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8e87a80aa4f3..4f3f0dc23faa 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -52,17 +52,6 @@
 
 DEFINE_STATIC_KEY_FALSE(arm64_ptdump_lock_key);
 
-enum direct_map_type {
-	PTE,
-	CONT_PTE,
-	PMD,
-	CONT_PMD,
-	PUD,
-	NR_DIRECT_MAP_TYPE,
-};
-
-static unsigned long direct_map_size[NR_DIRECT_MAP_TYPE];
-
 u64 kimage_voffset __ro_after_init;
 EXPORT_SYMBOL(kimage_voffset);
 
@@ -183,7 +172,18 @@ static void init_clear_pgtable(void *table)
 	dsb(ishst);
 }
 
+typedef enum direct_map_type {
+	PTE,
+	CONT_PTE,
+	PMD,
+	CONT_PMD,
+	PUD,
+	NR_DIRECT_MAP_TYPE,
+} direct_map_type_t;
+
 #ifdef CONFIG_PROC_FS
+static unsigned long direct_map_size[NR_DIRECT_MAP_TYPE];
+
 void arch_report_meminfo(struct seq_file *m)
 {
 	char *size[NR_DIRECT_MAP_TYPE];
@@ -220,6 +220,35 @@ void arch_report_meminfo(struct seq_file *m)
 		seq_printf(m, "DirectMap%s:	%8lu kB\n",
 			size[PUD], direct_map_size[PUD] >> 10);
 }
+
+static inline bool is_linear_map_addr(unsigned long addr)
+{
+	return (addr >= PAGE_OFFSET) && (addr < _PAGE_END(VA_BITS_MIN));
+}
+
+static inline void direct_map_meminfo_add(unsigned long addr, unsigned long size,
+					  direct_map_type_t type)
+{
+	if (is_linear_map_addr(addr))
+		direct_map_size[type] += size;
+}
+
+static inline void direct_map_meminfo_sub(unsigned long addr, unsigned long size,
+					  direct_map_type_t type)
+{
+	if (is_linear_map_addr(addr))
+		direct_map_size[type] -= size;
+}
+#else
+static inline void direct_map_meminfo_add(unsigned long addr, unsigned long size,
+					  direct_map_type_t type)
+{
+}
+
+static inline void direct_map_meminfo_sub(unsigned long addr, unsigned long size,
+					  direct_map_type_t type)
+{
+}
 #endif
 
 static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
@@ -286,9 +315,9 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 		init_pte(ptep, addr, next, phys, __prot);
 
 		if (pgprot_val(__prot) & PTE_CONT)
-			direct_map_size[CONT_PTE] += next - addr;
+			direct_map_meminfo_add(addr, (next - addr), CONT_PTE);
 		else
-			direct_map_size[PTE] += next - addr;
+			direct_map_meminfo_add(addr, (next - addr), PTE);
 
 		ptep += pte_index(next) - pte_index(addr);
 		phys += next - addr;
@@ -326,9 +355,9 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			 * to avoid double counting.
 			 */
 			if (pgprot_val(prot) & PTE_CONT)
-				direct_map_size[CONT_PMD] += next - addr;
+				direct_map_meminfo_add(addr, (next - addr), CONT_PMD);
 			else
-				direct_map_size[PMD] += next - addr;
+				direct_map_meminfo_add(addr, (next - addr), PMD);
 			/*
 			 * After the PMD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -435,7 +464,7 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
 			pud_set_huge(pudp, phys, prot);
 
-			direct_map_size[PUD] += next - addr;
+			direct_map_meminfo_add(addr, (next - addr), PUD);
 			/*
 			 * After the PUD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -596,20 +625,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
 	return pa;
 }
 
-static void split_contpte(pte_t *ptep)
+static void split_contpte(unsigned long addr, pte_t *ptep)
 {
 	int i;
 
-	direct_map_size[CONT_PTE] -= CONT_PTE_SIZE;
+	direct_map_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
 
 	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
 	for (i = 0; i < CONT_PTES; i++, ptep++)
 		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
 
-	direct_map_size[PTE] += CONT_PTE_SIZE;
+	direct_map_meminfo_add(addr, CONT_PTE_SIZE, PTE);
 }
 
-static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
+static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, gfp_t gfp,
+		     bool to_cont)
 {
 	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
 	unsigned long pfn = pmd_pfn(pmd);
@@ -631,13 +661,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	if (to_cont)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
-	direct_map_size[PMD] -= PMD_SIZE;
+	direct_map_meminfo_sub(addr, PMD_SIZE, PMD);
 	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
 		__set_pte(ptep, pfn_pte(pfn, prot));
 	if (to_cont)
-		direct_map_size[CONT_PTE] += PMD_SIZE;
+		direct_map_meminfo_add(addr, PMD_SIZE, CONT_PTE);
 	else
-		direct_map_size[PTE] += PMD_SIZE;
+		direct_map_meminfo_add(addr, PMD_SIZE, PTE);
 
 	/*
 	 * Ensure the pte entries are visible to the table walker by the time
@@ -649,20 +679,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	return 0;
 }
 
-static void split_contpmd(pmd_t *pmdp)
+static void split_contpmd(unsigned long addr, pmd_t *pmdp)
 {
 	int i;
 
-	direct_map_size[CONT_PMD] -= CONT_PMD_SIZE;
+	direct_map_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
 
 	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
 	for (i = 0; i < CONT_PMDS; i++, pmdp++)
 		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
 
-	direct_map_size[PMD] += CONT_PMD_SIZE;
+	direct_map_meminfo_add(addr, CONT_PMD_SIZE, PMD);
 }
 
-static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
+static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, gfp_t gfp,
+		     bool to_cont)
 {
 	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
 	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
@@ -685,13 +716,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
 	if (to_cont)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
-	direct_map_size[PUD] -= PUD_SIZE;
+	direct_map_meminfo_sub(addr, PUD_SIZE, PUD);
 	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
 		set_pmd(pmdp, pfn_pmd(pfn, prot));
 	if (to_cont)
-		direct_map_size[CONT_PMD] += PUD_SIZE;
+		direct_map_meminfo_add(addr, PUD_SIZE, CONT_PMD);
 	else
-		direct_map_size[PMD] += PUD_SIZE;
+		direct_map_meminfo_add(addr, PUD_SIZE, PMD);
 
 	/*
 	 * Ensure the pmd entries are visible to the table walker by the time
@@ -746,7 +777,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pud_present(pud))
 		goto out;
 	if (pud_leaf(pud)) {
-		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
+		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
 		if (ret)
 			goto out;
 	}
@@ -764,14 +795,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
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
@@ -788,7 +819,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pte_present(pte))
 		goto out;
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 out:
 	return ret;
@@ -875,7 +906,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
 	int ret = 0;
 
 	if (pud_leaf(pud))
-		ret = split_pud(pudp, pud, gfp, false);
+		ret = split_pud(addr, pudp, pud, gfp, false);
 
 	return ret;
 }
@@ -889,8 +920,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
 
 	if (pmd_leaf(pmd)) {
 		if (pmd_cont(pmd))
-			split_contpmd(pmdp);
-		ret = split_pmd(pmdp, pmd, gfp, false);
+			split_contpmd(addr, pmdp);
+		ret = split_pmd(addr, pmdp, pmd, gfp, false);
 
 		/*
 		 * We have split the pmd directly to ptes so there is no need to
@@ -908,7 +939,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
 	pte_t pte = __ptep_get(ptep);
 
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 	return 0;
 }
-- 
2.47.0


