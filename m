Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C5FC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 18:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lg0farYYNXRMdZ0JjD5tfrPNskI+Nf4yn/GtkpwzAr4=; b=n1KZRfgn8b4quJzxUnaf4QbDHI
	IYDW7hwES2bDvz4PYsjayL9NDRS+bpdX/XwwnaXCFkh4oQqVqnDy8SQhZ0JJuMrvVDLpMSnwyfqet
	/ihtRLs3Bx7wAlP8iN2Kenhq2DCNh6uXzmHpKl5t5jOho2qTyU8ZQ5wTvtW/a7jKdaIAzlGK4U/hI
	y8m4cUXk7VNORomZEiKi0ctYpydwBCGsqiGaSvE2i996vLLD8UjhYtOZCZV5j6y51JzLiYIrOt/ao
	d6F7lNPSa5M90N+S7tum0asSGWWqCyhYVo/csw6pgm/hH+B7KOn2kH1a6KDzd3XQbgqzt9+q4oe7H
	iJYJHseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfO57-00000001Hjz-43pj;
	Tue, 04 Feb 2025 18:55:33 +0000
Received: from mail-bn8nam11on20617.outbound.protection.outlook.com ([2a01:111:f403:2414::617] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNlZ-00000001EOm-49r3;
	Tue, 04 Feb 2025 18:35:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKinin0liPQBI3N2DdATGmzHacABng6D4ZbZ2Xpy0axq4p4YKdYZNgYrshb9wdHExiTiNrJysMPQdtIcJAl2x7Qf+R38ZSNvoSP4yUMEW06YCZO92OvKmvfJLyIZ5xJ7wzBUHktVqb++ZyCki7EYWxLgM3auZLI1yOhJSLO6SNMpsaGxADbRYnDmiP+pQGTtYAt+p1Q+LI4xbcSFeOeziykpD4g7ikoK5zqGuHGVASoNsLTcX5iIEwn2xigOAw1vUQ5GQ403AnfNEpvh3S7CacQtttKm6JGNst6mdhGJ8mIeOPGVgVZjg/fVSWAUEpB2WCnXBkzxumvrBExsunRzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lg0farYYNXRMdZ0JjD5tfrPNskI+Nf4yn/GtkpwzAr4=;
 b=t1Oq66YPRcTvH8ufLSf7ALWiVKXJn3HvkMspCBbiEyD6rsLxguPEaBF9ZzG2APZZPiqjf22t9gtPs1bFGzk1KLWsDkc2ahUOmTY6tThMVB7d8xtx/d44FqbGT9sc8BAyYL30TcM/6cQ1dGfcGxuANc52D/IfEKPeQztiGaDqQrf3h0hSONCg4/OygNYEcJmXH+BCBY1yj/ruaIVlYjGW3dt1KtRmmGzPokm87T2/HiKzQBOOjIpjNw6k2PpQ/BlkoaQYLOl1vY79OlzVDoC46U+tu4/VIsNij7HRmQ3zY7M9Ng9I/+iIILs6HRCD4zlHHW0uOmmkTrirG8xA77WYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lg0farYYNXRMdZ0JjD5tfrPNskI+Nf4yn/GtkpwzAr4=;
 b=HGhTDsZEE5brwEGaPs30+TLbKkLSUtuFmVT6JbyZUONAzbJoMCPSXedeUumPfcjKMTu0EJ0S8jKihp0KT40mBvVwUHgOS6mtuGyCnjYe3SaQrIZkT62MW3axEeIszpvtPFK6RnnCtQoq+1dvTwFWMF57aXJJPM069YJ+NyMOGUyPnYhUXPl8R7VdmVRzfRQ7IP28YmD3prKgBoUiON87cygR49+1Nu2oScEPxSMVNz/9XgZEmqbURbnCFGU9wkmnRhGholLyCoavw0BQKvgeJjXT7uYwBi2osCw/8CfP7HPiOJo1SFNtruJ+QADrIe/2rGvVtfIlrM7GeGOD/7w+TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB8226.namprd12.prod.outlook.com (2603:10b6:208:403::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 18:35:12 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 18:35:12 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 16/19] iommu/amd: Use roundup_pow_two() instead of get_order()
Date: Tue,  4 Feb 2025 14:34:57 -0400
Message-ID: <16-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0386.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::31) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 325a5342-b58d-4ef9-d52e-08dd454aa4b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h/EEE4F6FvIx9istyxjET8m16R7ST9kgvf7R2aiCZU5dlKfOwHVbqOdllcMP?=
 =?us-ascii?Q?pLDVR62n2DEo3mz0I6NxIGEiZokRyNc8oRKxIA4Qg+CENtPDU1Z5L2jbf8cJ?=
 =?us-ascii?Q?t9Wn5PetmwSmmOiTI/Px1RLkraKApHln1Gfy4aneUu8e+bf3dGH5b1e+5tRx?=
 =?us-ascii?Q?7GJ+4UFbAdOAYn5N2yxPVIv2JYwODHI4Fof19PBbsQXjb2N/rpT/2VGWrcw+?=
 =?us-ascii?Q?ls7RD5bUP50Bqf6dzCnatsmTDqEE9YSeqeBHCIg7ipwWcgBQuDKarefAoZXH?=
 =?us-ascii?Q?dONuMLav/jRF3VeRaT7iVcbpTxnry0KJcYzlDDJ7ZKYi29g/AVltPO5Je0n4?=
 =?us-ascii?Q?uTVglB/KtqyPRB+DlLZq3EtHWW8gf7p2MprfgkjeuSM8kYfJbIbwWcsC1Uq5?=
 =?us-ascii?Q?kYfQeqYWefvmVvMiCWiQhNk4nJ7f7RirKytw+JuoUR4fx5iNWea50IJRRWuj?=
 =?us-ascii?Q?+ZjaiupeI0bRvuZY7bVwjC25hiSKIUvT/VzErMnED73vwfdGA4UzG/XBdcYr?=
 =?us-ascii?Q?7qOP1yQgm+oDGgOfFPoEBVMsbEpQqwOPB9VSf5rXCPY1th8p0YkH2z8WZeTx?=
 =?us-ascii?Q?LRpwoX9qOxrpY2kD5UcAyB+Zkbg04giqNN3a/3y06VazkhY45Wxj00ZLYiSL?=
 =?us-ascii?Q?nz+LliphsHqpeFyTVBL1Eu7R5HuLBqgjHwy6AGmrKpTLtRe6T0FqSo7ICrNZ?=
 =?us-ascii?Q?qvzRvfTKhdRdRyUQCw6f+MKqlPEPrQniSJsEJoNp80LC/u24WcPxoNyDfzJV?=
 =?us-ascii?Q?i/TTUYQMSeEaezMsvZFT0cIqP+UIbR/mKQtDrbbsmXXUq5mqkjwlud4vwkuW?=
 =?us-ascii?Q?GsQ+keHMvBnoiAT2aIzBjQsYNWwt8by6Jakj/oZFA0aABb065KF42DcqBhvr?=
 =?us-ascii?Q?G2VWmsnAptE+VAn5h3C+BbPA4DpKYN4KbNAacJZDAcf02vOGU+dU4+MIhzBf?=
 =?us-ascii?Q?vgbQYXWfoWVtwSk+qVIndG1GvCDXcE4bgU8vjEvK2p+LSkAjfuoUcWpAt+Rc?=
 =?us-ascii?Q?gZytlkiw55lnQaijlZW3Gqz4msdvXUHtFpVE+SCrQdToZZgfIXXjIMH7g5TF?=
 =?us-ascii?Q?3058KcKgfghoSkFRghAKKBMOHltrAQD+9xAFojO9FFX2aaJ/4oogVMOQTFyl?=
 =?us-ascii?Q?JjttWA7nUPQgmMCdY9JaJck3wI2+KTT4g//0mg/dFqHGcr0q0Zjs5LHbNK8g?=
 =?us-ascii?Q?KVLbiFvmZvwCswirIuZl1F/2h/h5aTw6azmVTnT9RN0VjMLqB3LbdSmiK9Zb?=
 =?us-ascii?Q?LPBPICQ6k3lEQVWEqCmtZwYrtKW89qz8a7/19soc9PrfvgH1G1v++7QexwC3?=
 =?us-ascii?Q?7MuSxUP+VYt5At6W7dRphQ009L1mq9Za349jc4DrONkJdwV6BxMGjWKPe+Uh?=
 =?us-ascii?Q?iCufc7q/825y5sOl/z11eOBOu8EVbbhmLuAQ8X7E6njI7JQLRe6csAjac/sB?=
 =?us-ascii?Q?ZLW8IIFeGWk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PFAVLEETWDJubnzP3LvAbzZtXUak8VPTXdv+1N9sytGE4uVE/gP4Bh5X02l1?=
 =?us-ascii?Q?tsql7mdeXnJYtgMI7+YLjKPNs8xqEizd+llYi3CbMGuIv38rg5BnGMhpBNXo?=
 =?us-ascii?Q?vDtCpcPD1y5wzLD55htT2DP5sFkmaW4DBzYqWd2YC7wN4NoFMqKcVGe6WhYX?=
 =?us-ascii?Q?BHOkLrQG+jxqM5gCoE31W/xps8VnoevjwWvLvpdWdsmc1k8C8IAuL5myZA6I?=
 =?us-ascii?Q?b6EW3XEcq/AyFJK+ad2xCor1t/hWBm7Q4QcRhw2QfpjtFSsvoeBP1dT3j51U?=
 =?us-ascii?Q?+NAvd6HgJ/nAepkXaazyPpc1yFvW3IThPg4fGxotzL6zrVXx7uoWWEvbNceo?=
 =?us-ascii?Q?X2P9NkQMrQwnoey0WcDyrp+K7qZ9PCIIzLV/3t2A5QxE+hUVKck0TEc/DgCs?=
 =?us-ascii?Q?QlnnckdM0k7KR05nadkOCn8feBGTRQwEnDqS1F8+lwjP/ox9LpoFXD7BZwPE?=
 =?us-ascii?Q?Xuu3mQzJH81Rf6orPk8ZV/lpThxW6j/MRRvqCo7VBkczlOkNv6hzo5O+Fkxv?=
 =?us-ascii?Q?iyMt+ARy/UJhHKZ1VlwWImYkiLXdCtUAWtv4EapMSU/uj0W2mYr1vOlU4TQS?=
 =?us-ascii?Q?9Vk+bj/P37G1R4Lo4gFh3ue0TumPKMAwdKGBY7MVZ0+Srik8zDJfT0t/Ackg?=
 =?us-ascii?Q?Fkw4KaghuoGuQvkk6rpayF88KXFxUr0S6e4k/cVfDoxBWf7hF6YdNJQFIVGl?=
 =?us-ascii?Q?Dn1E+Wo6Lq/zaf5kwmew3b5z62Le4cbLZ/T05V357irmCLTAatW92D+gOs6o?=
 =?us-ascii?Q?RV2wJp8sAfASbMsARDJHN3FKDIB5OFQVu31vjb7LEKhOVUaAzo2wzcplNVto?=
 =?us-ascii?Q?N/qqCcHDizg04C86xDx1qXl15fml/3oYNxn+brQ+Q6zafvnZUFM5OjyX44d3?=
 =?us-ascii?Q?xZnmCtdbGpY3celVJUXLvptO/JkCev2PBhnn3lu3HrtJiN3T3No7jFK2i4jP?=
 =?us-ascii?Q?a3kUFxzmBPnD+47k0I2RjPaphS5LD+tihqsCaeNtpZuSMyl6jYHfji8GtSHi?=
 =?us-ascii?Q?/kDzysDpeQPxJp4056nOvBp6fkJnSrxLODeHMIHpbTIrJjFRs9ROj0lXVyfB?=
 =?us-ascii?Q?akRI/LbKhft+Nj/PKZPI/pfd0ob4GcAwoNZZS3EinyTN/HZV+8KS6Yb8qPRG?=
 =?us-ascii?Q?jwd5w9q7NUKPWUiIeWUSu2ctB7ewKaecPsTvNav+4bhaR+1f5N9u5tScmcfW?=
 =?us-ascii?Q?aa5EtbETMLCsRADy8uKzbetSAI0NhCCzxIZEKGy/1wVR1kfVHnZL14hMXZCQ?=
 =?us-ascii?Q?/r01me7WTrbHp7Fj1aWZUFKyy4DyoaVHK2sWLkA1oKZ2w17DSxCE+yX1JxXC?=
 =?us-ascii?Q?Cb3Rs6skNEjUaenOrVTSbsIgEb/zzwq7Hs1MymslR+2RWeASUUCbSeg9/ltd?=
 =?us-ascii?Q?vGGD0wPTj6O3ggFfQjhOT9BHGO7INngMqm9yxq9ZSL+adQ2ANlVLoRcD4Mjh?=
 =?us-ascii?Q?ako0uo7eZjaYMtK4kVB0RZoexKtWKGJeByLcLVlJi3A3KQFzJ8sJrFtWhtEt?=
 =?us-ascii?Q?zK7eU1TN4TzJCAvWZSTnaAAvLvCC6dGScVrUnZxDvk0ae7mIG7UpXOOhFk4Y?=
 =?us-ascii?Q?lKfyNUI57/inqAKCBoo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 325a5342-b58d-4ef9-d52e-08dd454aa4b8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 18:35:05.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2GhM5xk/82RXy1L6QlBuVuVK2tN9hq9WjccJ9WuijZrtTPl/ZQ9QCtKd91ItS6i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_103522_085484_0A3516CE 
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

  1 << (get_order(x) + PAGE_SHIFT) ==  roundup_pow_two()

Use the shorter version.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/amd/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index f1c5041647173c..7d77929bc63af3 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -247,10 +247,7 @@ static void init_translation_status(struct amd_iommu *iommu)
 
 static inline unsigned long tbl_size(int entry_size, int last_bdf)
 {
-	unsigned shift = PAGE_SHIFT +
-			 get_order((last_bdf + 1) * entry_size);
-
-	return 1UL << shift;
+	return roundup_pow_of_two((last_bdf + 1) * entry_size);
 }
 
 int amd_iommu_get_num_iommus(void)
-- 
2.43.0


