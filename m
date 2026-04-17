Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE00F8DFF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QLjCW5U8n35GeT+Xyq4K77tEnnrF+/ceRxnMD0mE40g=; b=1wEYy7Pl8WRb+gZ5vMM6eMhgl5
	Lao4IhmmrzFuAXSo9cH16dWhKJwJtpIQfvQlYBR53QBQErN4uGtchKwaD/Jbm91Xfp58wfzm3C1YV
	DaJ0/NqIB5jsm2vSt1LiY7DvkuCctTOeNgLN3BCKitvH2KELo3XWJD7u0Nfr9wRLDTPUymjClJMFU
	EIlpAlhUZ0xYTu+GkOcE7FVFa5aN/WRvBTgHFlVZP9HuWeoaaE33A8nhdUhdCISsqu1o2mXbjQS4P
	eyhy8DnaxEfcD5EhYpPI2LmGNQjdYj2GiEIeU7lKdZ6tiUl1KMC9K99LPEMEGlGGkmQJhi62eSc51
	fR5cpmuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnUE-00000004Lsq-3kLj;
	Fri, 17 Apr 2026 18:00:14 +0000
Received: from mail-westus2azon11010001.outbound.protection.outlook.com ([52.101.46.1] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnUA-00000004Lqf-2sOX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 18:00:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9U+ZZVzJVsR11yWLniWvoV90z9CHGLE42bsKLufTHG6dSoQImLtuM0uCEhzWbOZvlbmVymhaMkjn34Nm4OoeMdKzBGNb5Z2CWKKn4iIeyUxOUIOk/ehV/aPjmc3vi37hiqAFJNZZS+en7MEtfcHsDUNmJPdR//UaJO7dp9g7+tmQ+cBdexWiBO1TX7VlhD74LLEPTmEG0vRRpScBEOQtIF0F6ne6lUXHUEnNLal4QvDcThUiYSS8XFNrP8EZhhoUrF8Jk9BolaG4u2r6H5s9vBH0h54JUIY9qy+BN6IaCKP4X/5wQiyhNbZbL7awEYfwS5M+T1WiBPTUxrich3T2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLjCW5U8n35GeT+Xyq4K77tEnnrF+/ceRxnMD0mE40g=;
 b=lmBTtTAjk0jF87N2PLm6P9L2nlsDHm4E7A5GiXXP3KfKyf43zLVgh7OuGvJwy93jlZbl5WVkJIad6Tjc+Va5g/6tfz2bGOpdIClaXzzDntzH2Cbw0SpV6m8Vk6UAmE2tCsVNFxpdf9/WGxrrzpT5bp3EhkUOlkmRm0NbpOlN+WQLaq8qI9PHFQ9XUHRQgSM1GfuV2zUxLUaHbgEBMGmblbkE/0RNZ5HhU8QUK03A1J+el67dWKRYFJBmOdd/b40gXMQOy9iitFT25mw9JQFXFQFhDAf7b4ZNx2CiSHsOJ3FZdS9+kpiYAeX0N0oQqF1IutDU33VPiO7AautFFbUMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLjCW5U8n35GeT+Xyq4K77tEnnrF+/ceRxnMD0mE40g=;
 b=oTHyRhF8u/c3FP5PYA9UgGrT7hjQZRabq16BVUkTf4Kv+xI77cNF23kTPFYLskoNf9TGBeucUPyhbMwHShEsC6yxPzejteZ+WnxTIX7o40Qc73qxE4qtEaIz2McbuJ9TvG67pWNaqB7b1np+ZZlplWY1SJcat4aSzTLn6HIy+yc9S0bSEEA0a+PgyFoOoh4Dj6Tm4P4ixs+eH/rLJhjupaUO9UcF5b2sHj37nQ+dxwLgaa86supbam2n2sCcd4WVtPK1PTt4SOagUDyO/vOiYcah1iozB6nUaCsJe5WQSu+p167LtCXPJcz17zx9ZWeUamubTTlmjqGjRV0uKcsNCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by IA0PPF0A63E7557.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 18:00:00 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 17:59:58 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH v2 0/2] gpio: drop bitmap_complement() where feasible
Date: Fri, 17 Apr 2026 13:59:52 -0400
Message-ID: <20260417175955.375275-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:408:e7::10) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|IA0PPF0A63E7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 983740ef-34b4-4048-b91b-08de9cab23a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: IuqvcicLRzoVX1xrpQDhGKT02z9G1OYUFR9zR/QGApZ5wc83NbuySbBdT0T+2gvuy8gOYa3YtnTcSZvxsTaSUPECQtq5XOC2XWmNl0n8sNn5w+J/66UezE0cscyB+AFzVccVGRq2CATDSpyL+ABHsUjcz/H2ps3LFSFootYVwbL3iRCxv0V2jnpjq9IhsngH2PgJUMoNgiT9tNQJN0nfZTk25hndMoSO2Os31z8Q3dNljCfUagl2688u1RknZNY6dzWMN06Udl/TWCKxJZl0bm/q9K0wrhpxwczs+7aw9wPQiJ5ivM9Ao2x6UIrbEmHXhwwlojVDF5semY7ErNNJ3WJZSmvTbA8zU22eniYeKGpgZ/8Y3mkAoAA8fsLX+Bj0xivTDG/bfZucxSWoM7Lxbqtqeg+S//bRFg2ojiDqHZ0RcsA0IT8VkQP4I2zO2WXnoJaF4IHQehM+biE4ye3ydamBCQmouHwRALdedqBUZS37g75rNiPfVNTjbX3QFkBQsCHKj02yxVsBhLDqO267KEZzntGo1/YFUeBPYh5t3fgxqyAJtUNQ5L5PKGkpKD3S3ElvyqIk3A7slerAKy6Pbc7Kaxo1H0516yigDSInAya8DBZWjjMmaaSp2VBp7/hbOnZRqktlDw6Ci+wNzRpDYRJ34f66BR8bHnMAFRmAaPZCM3j/89629Qtp1OyAApwPC0JLCjYw7IewmurkuN4jvg5RMYUexRyI7njfpl7hqOyEAve8g4tiG/LNV/vgVRCqzUM8LK8tv7AtVyD7xuq1xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7tR/CJFEBFxctvjau75ZMcIP9UActaODJzweElk3/0h+dopLxYlo5WInebTR?=
 =?us-ascii?Q?93p84W6UAo3A3SKY7j3gLc1JrGkW+kgFwNbVKX6l2BPOSJQQowhh7H9U913u?=
 =?us-ascii?Q?pspEYG8kF6Cra+X5ISDATKSXxM4G2k/D3G+RBlyv7C/IFMdY9Tag0QmF/QWm?=
 =?us-ascii?Q?VPC9wfpMCFImLevwh6X0kpMDkukfohPLy1cDVVoaLtb2PV1F35S4PJGnPega?=
 =?us-ascii?Q?KL+Mqzd/fcNB//ORLEHZdW+ESU/CF+cF68Wqk7ED0vqsVJtFRLz0PBBJNtxH?=
 =?us-ascii?Q?/eEnG4DjFdbpLUSzZCydRk+YSbj7VIdcrwcH3M8lXUlC0pf9dKllKf3Y05fg?=
 =?us-ascii?Q?c2gecKHpYtYyA2t+wRNP2zjwF/KiL3ocaLI29EFPBfbatVCiVrCj+jz9lGBg?=
 =?us-ascii?Q?c+X70pxf80WBR4QuX+xZHoNdWarxLee2KZN3b9WlkJs+LfXPxKR+oxaDPdFT?=
 =?us-ascii?Q?J4rJ3OjFeSeUyxDEOp9V06P0cS/OIaQ0/z982XgW9OEGZdgoej1n0dU99ym7?=
 =?us-ascii?Q?UUWSwKL4kH0k+v27jEDijMiO3RZnABYXcqoh8kDWU2VgnfP64I1E42XE1V+3?=
 =?us-ascii?Q?85KyPyw4+gUdx0pmHzW0C3WzWiM8KfpQ/dJzYkM/gYI863XFfWGN2mpDDW9G?=
 =?us-ascii?Q?G1ay+tqiua0upE8qdAl4Gf22UMvVE2FfV9L081OuG1XygKDZVuKfUVTfRtQg?=
 =?us-ascii?Q?Ean8/ONE2HEOLguCMJXgPm2FhFws1GoimobcXDqs2e7O78g6tkatG7HD074F?=
 =?us-ascii?Q?ogW1PBxB8RtDqqIp5xRCewkpl9t480iYpUl6X1/3DnMjCZDdCXYEO5sG6AWD?=
 =?us-ascii?Q?C0JKJuu+FK/jX8yU8LJGFQcdz4IcVPowc+xLlnQ350zQOUVqgXl87ptANmg3?=
 =?us-ascii?Q?FlnVB3CnUIia+38iFhDeJx3VO9faX/rQHqZp5AcDBHRlqRAUDU12O0SJaa8f?=
 =?us-ascii?Q?FhfVhz8sISCz78l+oUl6pPZIaplwDQnBgOVCxT+1759ypTY1D/PqU1GmF3lR?=
 =?us-ascii?Q?JsOdDm3SEhNAhYm+8XN09oCGBgqm6mQvGakgzmXkWAEPTzmuSeb3W02GVklE?=
 =?us-ascii?Q?OGKa+aujVgd1EBXfX9gCqgZgrK3wVNzqxlTeAfxVGrv7LM+v8ffJj14d/Scl?=
 =?us-ascii?Q?b9zJuXge7nUzPpQib/KU8/3tVyCtaXA3dRU4ExjJcQAbOiQrsN3glRs0Ujef?=
 =?us-ascii?Q?Zvmy1Mdass0itZeB3j7C/8GQttKy3ZQz7Y8Y7uR6UiIW5aC5baT1LGy09Bov?=
 =?us-ascii?Q?QjaZmKHFmp8cx9a8J23ZFK/Zwy754TuKdT7uCDx34Tn7z7BZw8OVYcaGDp6o?=
 =?us-ascii?Q?G4JaFMPbHag9xlL15uvpGB9ay2theqLWn72nHFFkIV0VNlAFoWBE4+oKIQwv?=
 =?us-ascii?Q?yACjh9ibytJHvhtzotqP5pNnUqb7Rk25+c1xS6oJ53jfQS9D2lSLmI16zVKN?=
 =?us-ascii?Q?Peh5PE32fjkdTuVjEH51w1wQaNZFw6jQzqyYLpV/smKftqgb+W0Ihu6Nw6sh?=
 =?us-ascii?Q?6fKHVLAlzU+bv1En/8r0nkIdrTcIL/EUq7XxGVldxwaNTO3HUJwGDVSKNZ4Y?=
 =?us-ascii?Q?fhohsJXnNDhp7uZMt37i4yjVSlpPlUCgpPjLbdwqKwWBwPZK1dhRmPN9/qdC?=
 =?us-ascii?Q?N+cCnzx2BlYjoEhpROEFJJl5tXGFU5/PBzprRZRB4mJuV2R/n34G3ggPpMaZ?=
 =?us-ascii?Q?hboOO/4LcMGBeAzK8BP9VMZG4W5vAlgzC3o+/pq7lcI1+OOyJ8ZWk3tnY2vQ?=
 =?us-ascii?Q?ToJkgF176DaZ0U3zktPfsUeHHIab6fk42X0JUDXxTmlI+PYCtdNZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983740ef-34b4-4048-b91b-08de9cab23a8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 17:59:58.5804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPc1w0JtTbbxRPPCInLZfTPSszOwEFC/scfMhWyJpTEDgssg6OWgwyfUIR3JkRVabDip/B/gssDkbafIxJCNLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0A63E7557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_110010_825525_F667850C 
X-CRM114-Status: UNSURE (   5.79  )
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

The gpio drivers reproduce the following pattern:

	bitmap_complement(tmp, data1, nbits);
	bitmap_and(dst, data2, tmp, nbits);

This can be done in a single pass:

	bitmap_andnot(dst, data2, data1, nbits);

v1: https://lore.kernel.org/all/20260417033439.318930-1-ynorov@nvidia.com/
v2: 
 - cleanup typos (Michal);
 - split per individual drivers (Andy).

Yury Norov (2):
  gpio: pca953x: drop bitmap_complement() where feasible
  gpio: xilinx: drop bitmap_complement() where feasible

 drivers/gpio/gpio-pca953x.c | 7 ++-----
 drivers/gpio/gpio-xilinx.c  | 6 ++----
 2 files changed, 4 insertions(+), 9 deletions(-)

-- 
2.51.0


