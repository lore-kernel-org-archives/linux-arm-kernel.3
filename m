Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBDAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 02:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Njot+VojvNzsoSJKX2nbIlQKTnZ8xugWkM0bLhujTdw=; b=1p/5g6DctPXL/dYbrbYbZijpUC
	cVgCf4xUadu3uCLvAnrpGN/YGDDnl7ASpHhvxt/c6AYQeh7Ae571FKd57Z79K9A9T7fjqZJ/ZhsOK
	acVkcXJ6tO5/12jeL+HXZEbqXKVp94zTSXBqJ313U44iRLo4tSTCV8KIG8GYhrbaQkbyUwkDmIm1q
	oQ/GZGOJdb8dL6WXolZyMydWgSOVyuYcGeve0tMdBs8VvkXqr8aGhmHIdsgTdIfDl90xQTScdecM4
	laSo++Zv4WFhl8nfFMgfli2ust/fiHWcyBUw0Exzd/rREoWBI1mCo+Lesh76huTFusOqwGQjmPPau
	yZtVfsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whe6u-00000000mzo-3mmP;
	Thu, 09 Jul 2026 02:03:32 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whe6p-00000000myF-0DMe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 02:03:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5C/8ZV/d2wiBRareOBX1QksH2utrvVHsRXXqlK6R/Mc4ALEE8aGo+kwGD6Pw3UvqwfK8qzyB+Q/Q+F7j1+90X40tUVHVjXS6UHrkLAFf2Cp/5P/YbM2hT0Gl0t9CBr80oFI/6DLpRdHdJ+/dfNZctV9d/2Giqi2VggEiIbKYOso+y47Mu2s1wsVEu/F+nM2jPa3cJio3vrMYFtLrqhuR/1hDZmc3yb5+JQ+z4zGtaoKBnXOEBK4xDJ3jjr8yIw/aIBNYxTyuCiZoKi4SgddbSZqdvrq8yrY3B+MJbWTXEK2pz6FSQjIvMlrwyx5C86PLW61WakBrKe6BGnYEJ06qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njot+VojvNzsoSJKX2nbIlQKTnZ8xugWkM0bLhujTdw=;
 b=N+Ham62sEfSP/Ir26+nRNvlS5nrxJcHqSwQo881valaNo4ZQy6qiQ1aeyDrkZF7DAbp8WT+60khHYaIwZmaTKnGwwWt1wAMzCbqjaESqv0PVzczl1H2MtJUVBO6bc94C21d8tthtxg6NSihT9DW7V0Dak3z7MEPlEWeTd0sspP+gvAAMtDW14gUUtheuDFO9EOaMxgXZNgElDEE6eA6BpUHi+Sy6pXhrefZGQ8slJYb73vmXwqNyXyKRw9PID7THggtmznnX67LsO1m/JHxjMQe5ukm0p744Iy2EY/rhRtrMAXEpkiM2gVoDKikJbNTC/VEeDuH+Y28FwLZ8/INl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njot+VojvNzsoSJKX2nbIlQKTnZ8xugWkM0bLhujTdw=;
 b=t3tO4iGfmrH9HxdO3esOayg7lMpKViKZNNRcn43ZuCVc2pJ8D87uRoYwdlUvpVaC42BlxBRHqafX0y2apzU44SzzBbcNSR/VhnHfsjZSZs5tLiZiy6cFvBQX1nz6cCUlesQsPZJVln3dQJv6YQ36w5ePjDz7LTglt30Ci4Bpys9x0BZ1eVa/EKqkDnIbXj2FiUt94G8JDxtvXeO0LVUuom3plG7XPK/WFvVsf1U4Fhh3b502ZiVfvQb5FC0tjwbyMZFTWCS28XaFiu7QunxdxY+1kEFPLx9sVUJ4YO2s9DC/GIzB03/8j7rf9TipazsSua5K6hLd2LUJOMT6S7CZAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DS4PR12MB9818.namprd12.prod.outlook.com (2603:10b6:8:2a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 02:03:19 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 02:03:19 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Russell King <linux@armlinux.org.uk>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Danilo Krummrich <dakr@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Douglas Anderson <dianders@chromium.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 1/5] ARM: dma-mapping: Treat bitmap size as allocation failure
Date: Wed,  8 Jul 2026 22:03:07 -0400
Message-ID: <20260709020312.133977-2-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709020312.133977-1-ynorov@nvidia.com>
References: <20260709020312.133977-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DS4PR12MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: 162141fc-241c-44fa-1494-08dedd5e3f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: BIZ6Du94HPAJKWoAbBJ9Qv5cT5rb5X+jyysZdIHeyRCWdxKp04WjlzMMTkr6KmR7E1WGPW9ZCW2wain2EDWamJuWKMysftvlTu8uSgIJflkfp5opS0Edf5jkAHOOCKC9l29uNbYcTKLae/JSQlTUJd+3UEWRT67lvOL1kNxRFAd0Jm8UnhO5CGvasmbM9UcOiUjKeR1V3gzcjwwl/HSGzuUT8iCLgIX0ubUxCAGeFo7l/YLE8GzsswoM8pEFkqtlNDZ0wY3E77WnhrlyaRM2O+3d7XE0JGvWbZZutkw3h2i/AtcF5EICDAz0E8nXyQzl4itrKygnacFPF/LjlO+poiyQWycVriXp7IxyxB+LK46b3wmwU+5KnnILzKFxK2oI5IVjXurAKLoBsQUD/1gsvP3taomI4Hkz417fZvYw/tAkjPBKLDDKwFln0Ztn4hoOtLsLJYpM272re7E2ICFJiXjzcC2oCMhLh2f7BzOQBU38o4FSJ2jyB32S+xS7VwnvPeK9i60TN7WsjCkZ+A392IXCQlkWGbC3hM6jP6HnnysRo+AxRK12YzFKeFKfakQU2E0uya5zRAY6ZVdaYL0N2rJrf2pf4QvEX3yEA6D7WcvP2F47kzxLSRIr6boZDwgrT5GIIq3iDOI+eZDus9ACBd/NKkmyQEx74QQz08GMbCmiqzulfAIlgZQVbPdjCrCcL+9KokwWo0ubwrx8bMc6EA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1bXq6PeBEkHjR4maE8re9jqxScGbl3NJSFz0rDEwYkkdMPeUxIsZquXNOvUF?=
 =?us-ascii?Q?kHkZvzwlVNIdqFCF0unUbOew5JHJj20sa3ScuBcYu16Ls5ZDqYofo83B4fCw?=
 =?us-ascii?Q?fwb9LQAse5VueANLoI2erZAK6A7KjDPktxhWUtCzXs13WQDzOUe6NvnHfMFN?=
 =?us-ascii?Q?WZyEvwRL4BAbtKz994QM8oObFpsJZpYW9Mjm7NCiLOnDhJrbDCGRALL1kCQ0?=
 =?us-ascii?Q?3P4akYYipm4Ww5NQgtZnbwxEN5NsC50ffB3U61tzesq8ZMjSCkoviGvj4rZL?=
 =?us-ascii?Q?BYCDFH6gjdNu8L2sPFRGD5aRdMm8g8ZlNUdmWevMt9Ds/e7KgGoGQ56nFXLR?=
 =?us-ascii?Q?KbKbc/7hCtGYZ9UupSEMTHkAqA+eyV0panmRGeltPDUjnJC9i0o+3y/EvQPL?=
 =?us-ascii?Q?iK4f3jypZ3+L9ERJ/75/kZx8HvANKkY4k2dBfqY5LABcvFTKl9gERmFLiZuE?=
 =?us-ascii?Q?sboHgbXqbp4gHxylE8UIuFhiuol816spai4fgxTkAtD5tpXn4xUEs334wi2E?=
 =?us-ascii?Q?bkYg9jGs2bjiX+qvFZaog4Hi0uJkeiiqOGuZ+b7ikMftjhClFY1PreRs2Ka4?=
 =?us-ascii?Q?aeU5rul/cQYsUKSqFvKcStHdB4POsqLerEGjoGVxb0lR20BgkvC8T+rFCTDz?=
 =?us-ascii?Q?Mbw/CVeKaCSzWZjxmvUeR6E97J7nH6841qK8gLqZv/kdi6wigoVbnWsIvhz0?=
 =?us-ascii?Q?0Ir7GpXxtHHfIFJaQDVUfVbRkMS5AfBCTuGLG2REmrlVi2R6pL4OOYo8RKQn?=
 =?us-ascii?Q?/+PvL7O+LyrJ0VoAw+mdG/UXr6f78A3lOphdJy651H+XnhvK2QjRAMCT3rvi?=
 =?us-ascii?Q?clSLvOnl+KrXseuLL4u4ACCTbcARNbM8RKrveNXoS/KGbwgWAJ0cMFwOXnrd?=
 =?us-ascii?Q?ELSm3oqQrs+qMB36PJYuHzd1bPl8xFHI6jQnqlZ8b7rR0pwEVYzM4QtClxb6?=
 =?us-ascii?Q?J0QI7rnm3a3KcNAkDFLRY4fFl6HTe8B4/KJPY85uhHyskHDs0sqDs7EkNdAR?=
 =?us-ascii?Q?kNL/AjklripmD5JMMnF38oGuQDO8qvuXSLNH/hjma3liDtJNUChHwBzRxrcp?=
 =?us-ascii?Q?7FYSkloncrErjb/SvpnY33CoJsjn0w3628iPeX/ffphP9me1dMVcWtWOH8hU?=
 =?us-ascii?Q?ed0BJLrUEvxbtDAsUbF/tqnBZ5BeUXQhu7gobi0RZYPkWyoxwXHX9Gbe9le8?=
 =?us-ascii?Q?ifEGdav/9GGvY6dp38ZnwRdpFbRJ0lH5vv/GVrPEC0cJywb3UUc/FLgolrmt?=
 =?us-ascii?Q?lAyqdKaJGP/9ADfqqk7/aySU6uqxu0S1Z5Pt1AiMAu7nxWt2ONm4OeUoWXv5?=
 =?us-ascii?Q?vS94H70hRmCvG+f7EU0uD4CNtl6S7L3N//CFNELMNchAEAShzMMjlBW+YNtt?=
 =?us-ascii?Q?gLs1e3rckHcHEb+A+Ai3DuD6EKEH6oq/kIU5knkWBpo/jJ3GoMscUUGccu2l?=
 =?us-ascii?Q?g1Jx2dP7xIumo1FUXZy+Bv/TkOKIPb/QhbBqwzyUab6PnRNvawidhtt7HnFv?=
 =?us-ascii?Q?GKnXv34dXy1ClY96zuhkRVzG94td2OwEFDC3T25qIYUlm3s62cfpi3mBpLnE?=
 =?us-ascii?Q?8cgtQ81sJfTnwcBIUAnpn+l07jYd5dts4tcPVvKUEkK497J161rc6LZppio3?=
 =?us-ascii?Q?z88AQXWn6hEfJUFcFGlG+vOZ0pVUHoLz1mfRE5EAQmLNrUOnJtSXYj0qhs4i?=
 =?us-ascii?Q?FmX1U1hfnLjQSJB9lRBsn22mfW2ywlVKlC7Lr4bMrWteD4iCuT9B04oWt4Q2?=
 =?us-ascii?Q?ZSys0tC+1Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 162141fc-241c-44fa-1494-08dedd5e3f50
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:03:19.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AIPVtFylu+kTOEbgKzAAAkA67syedPSid7Uie2yARMzHEtykXGbkQhxdtqZqhdPHQNUM/Gr2XuLNYDNvNWuQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9818
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_190327_089959_80EA7E17 
X-CRM114-Status: GOOD (  13.66  )
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

bitmap_find_next_zero_area() uses an out-of-range return value to
indicate failure. Check for values greater than or equal to the bitmap
size so the caller does not depend on the exact failure sentinel.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 arch/arm/mm/dma-mapping.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index f9bc53b60f99..7761099dde9e 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -773,7 +773,7 @@ static inline dma_addr_t __alloc_iova(struct dma_iommu_mapping *mapping,
 		start = bitmap_find_next_zero_area(mapping->bitmaps[i],
 				mapping->bits, 0, count, align);
 
-		if (start > mapping->bits)
+		if (start >= mapping->bits)
 			continue;
 
 		bitmap_set(mapping->bitmaps[i], start, count);
@@ -794,7 +794,7 @@ static inline dma_addr_t __alloc_iova(struct dma_iommu_mapping *mapping,
 		start = bitmap_find_next_zero_area(mapping->bitmaps[i],
 				mapping->bits, 0, count, align);
 
-		if (start > mapping->bits) {
+		if (start >= mapping->bits) {
 			spin_unlock_irqrestore(&mapping->lock, flags);
 			return DMA_MAPPING_ERROR;
 		}
-- 
2.53.0


