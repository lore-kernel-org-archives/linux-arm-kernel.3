Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DE4C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PS8mRBMkp+ok8JR+NhbpTuZ4g3DSaO276UBLhVRI7eo=; b=QYYyYuOlRyHKYo7owlF/Wzuue6
	qavZezkB5z0vyOolidonUtiZmodfdta2nBq7t4LTEaHCzDCjwMfAGqnpyIPAqNYWAW8++Sm1tEaXi
	QFXmSLUjrE/HOilnPjTs6nWAQ4aOk4g1k6sG5SBvZj3xmtnap8Tc4MoIoQECULvy39JAgZTnPao1M
	0tFWKnI/A2W5KJQ4uMZv8OcsUeGQyn/xo4w24j4KBL6fqGib0XW3cwMzOYZv+dWO34IOSHv5rt3nO
	zQ0/5XmkM8aY51RmaMDzWwUexQrfI/5A6eyJSYA3ba7fzheqCfxhR3uM1tIXctljWNJ9QT/g99fZo
	AyvHuKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wor01-00000006T8h-2QW9;
	Tue, 28 Jul 2026 23:14:13 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woqzz-00000006T8B-2LVo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 23:14:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4H7qYOpHZcDUmu4t38EV+sLmq+WVqRqCoGVEn2y6h3+sgvR8Wd89l0IekckLE5/NuGTlBwzn5yK3dfyL0tOo8y69iZGbmPClSMul1m77x81ffGy+Jwl/Vce2ftaOZ5LQYswlhF9SQrzBzYs22oCIfBXLcCp2BT/l2Qm/7ivGpYZWFZaaFKSaDYUuja50EjL2v9xL2iU96eyRygnXjqzAvE7CqOo8G07hyC1I8QNlGC5yLAKk0Ycl4jBlSIRjB5mJVFKupWBtkuk4JQBZ2pcma2G2k7bjxN7IbZ6cdKl81rf9ydhMXvWY7TFRtqeAfJrAD4c+W1imBH14ozX/IMRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PS8mRBMkp+ok8JR+NhbpTuZ4g3DSaO276UBLhVRI7eo=;
 b=HWdseqFBQP6LM3sOdulbX99oaOZaF+k17OBtl/Ez7VVryviiWTcvAYKgfiEyGgQDHiA4VPPe8fQRNfxiwXCGYUvFrzUd7wB6MVMI3eMQuIvwamDIJACzHBegdeRYaR+emGJ0qzWqHGRQj6TOVx9FLFTIT0hEqWQ16ED/gE46EqDc3oTWHnWmsKx41Sitot7WN1VBiIo211ZuY2W+fY5HTtP7msA9OWXCa4IjJ5ov69+yW401g871ywZx7YPobc7VAGksN/eKnOq/0OpJk6RxrSu/rJ/2GoRKWTMbtI+ZVlh4MgthkzPhh1vf3C0j4mkFGvzJO58jqwyjfHBtpyUCJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS8mRBMkp+ok8JR+NhbpTuZ4g3DSaO276UBLhVRI7eo=;
 b=dd2CBOlY54I6x+P+ooRtoad5waMw2XP+861IC8rd8zrseTstPoc05soU/jsTtC7pRftIcCx9fXzuD91eKnUYD+kVlm++uETDYYw6YoL+CyUzpDMLay6j1AAMaSdo0ozCRDHQn3cRsikN5BeXsyoNxE+RVA9qrHgIKSk0vm6dpaPvF8EG7UpA/ggoVaOITj+d4Z+FXcLIhgBpzijm95uwbSF9kIpKVEJmmFLj6E6h3lp2eCbaepGE0s68FybVcRnXWoFzlc9MQqgG8kLxYk7JQ7l43kuU9cNC8xePD6VnvX4nrapKFT7cXcbd8k46s7bI537FPDyXikigcR5dceqQog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH2PR12MB4135.namprd12.prod.outlook.com (2603:10b6:610:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 23:14:04 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 23:14:04 +0000
Date: Tue, 28 Jul 2026 20:14:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, catalin.marinas@arm.com, joro@8bytes.org,
	jpb@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Add HAFT support for SVA
Message-ID: <amk3uqotNdGpgc7J@nvidia.com>
References: <cover.1785153415.git.robin.murphy@arm.com>
 <829b1d7eee64869d5c4231e80747367acb41b82b.1785153415.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <829b1d7eee64869d5c4231e80747367acb41b82b.1785153415.git.robin.murphy@arm.com>
X-ClientProxiedBy: MW4PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:303:b7::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH2PR12MB4135:EE_
X-MS-Office365-Filtering-Correlation-Id: 20282a26-ab2a-4529-8a00-08deecfdea6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9vWTRImCwyMcevQQM6OiJQhpPym0X7LVqzJWRXtlfmKIw/SUhEsCTsmrXcfEruCUs7Fzx2tQl1tEXspazFOrXWjUayJQHtrwF2Ot/OYF8xWYxsj3CPzJADxa530RurymA9wecWVD5M1uafoHH/7Wc6DVao59MKqbMxWOn0MIsgN7T2N+8HgvbEzzxbwmrHk3FLl/ZX3FwpNfLMj5wJdPbvOGWTmk4mNO61OywxVDrYA4SWxuriYHLxkRQd362w8r88PkQxpP6ySsj1RyRjC9TCJvn/G3JHbYdoncHuGEj1XryRaG/YYOZqloLF2RaBFy+IzXsrtc56CaAzXQA/zVq3OjmWc5tM49LjPVtyZThRX1xyylNubNk0AFyjAbFT86UC9bn+adFX8GVfPbZM/uFcrmzIW1tVEt+TombLriqLrm1QiXwYq2uIHVIg7dewj++laKNXJLl3l+8Lpf8kOyAwrm1AiJCQfiK+6v/p/Itj87sKIlD8S5Apu2+CiJR34lcpqV3a4wKRW/icSU2zHOnu4nII/f6IpKEjqpkqPqzhAiG+WGk9/3ksuxg7w9cDksqpWSVc4M+THB4fyEpDRsuOXhmRvPHk9dr+BuCOSf6U8lcr9xDttNNiktZc2gQzRztcSgU1tQqdvPik+dvxVeiVyr+C0em3f5F3QtYir8Y0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QyBBLRId1L5hY2NdVund17bqYQnjoRskDCSTIFXzCUhumDMuy8qhSTOlvVyc?=
 =?us-ascii?Q?dfcPLPZBZ3eMORM/RMdAOyzyWeOs4C/KTrLg+UrkDjMrPCcTMqTYmbpAEAVr?=
 =?us-ascii?Q?xTUSSaox6nn/2jGm/Xn3WpxdfdC98q3GoSLB+AaBaMsgIcvkmkwgI/dvKDvm?=
 =?us-ascii?Q?mx/dLNKmsxhOFPBpzgvixyBjkPacHZaKlHpWtKgiEfaikb/4ihnPHSBKIgZG?=
 =?us-ascii?Q?l5xtP7mq5khsbyHEyAauVLsgW6odBZdw7UtGXJ9tYmPtd9oWDc/rYp1VYNu9?=
 =?us-ascii?Q?jlGYSQvoeMycN+y0P2KctYjnx+tsz0OV1BLZ19xrTcIpqr1gz1RQytI8hB9k?=
 =?us-ascii?Q?wYebiKhrWHwyywlW5d+YL9Jy+jlygF5Ix3R6jLUAtwKop7z/rGXO0xhc+/j+?=
 =?us-ascii?Q?kv/AU4BOKA12iF3bJ5IDIPQlIeKGZtoDOakpTq8PLRUMRC3jmGyKYfR2TyO6?=
 =?us-ascii?Q?0p1kVAALZ/KifYQIYqrg+xF02T0uk7chkyT6qNO5eNLgsxkgoCaGDyjTxea0?=
 =?us-ascii?Q?4VJ2rkdb2rM1rZXZlqfe2tmI/ps2w+kjlXVlJ2sUDp57CR01NEHSRCdzWaos?=
 =?us-ascii?Q?JipMdHx4RiK7ELGBO8pZrR47IZonMmrxU5Ym/vIfEWqRdDsf4lEGNsA5CKSl?=
 =?us-ascii?Q?/rfnHah3N8JDjyP7pjcaSOZ7CqGbhywUwCegcbxWpm5u1RiaZ32cLkVtCf0j?=
 =?us-ascii?Q?QTnOgZCoHRJ/dgyDGJn6PwoZXgzL7xaQhlDwkLxRs0YL0TAR7mW2Cmi/Zo4i?=
 =?us-ascii?Q?uP1IKF/rgKHnmrzig54pz6YvSHWyKBS05yqG7MzCMnoET+PYMMBgW3fNsNjp?=
 =?us-ascii?Q?lIMDXekG9OlzhrGsSoIysSbnCEWD1AKWsHaU9Wp+s6xFceUOWyTfcQwmdS12?=
 =?us-ascii?Q?87CZL3phFiZhRQgCAc5iVYiDaV2K1LbUgRw4SV9Z5MmzVMGw2JoWQvZSOT+Z?=
 =?us-ascii?Q?wBLaiNQHIo35BjASpra/4qI9/AQTg+Q6bYxcThRw9QmDp4Cl9ENKKeFlSFAk?=
 =?us-ascii?Q?sCqy43ZQlyMKWQ0f77DhlHWKF39vK3+nDbEF7GkS5hJIGMUHGPXwLU8ya2EH?=
 =?us-ascii?Q?dFUozj4WUHlsWwlrW5ReNUbaqrEcBsUuNA91cmQUjOxQ2RL6yueFhsGGOX1N?=
 =?us-ascii?Q?7yAsZdli+PknCDGs5sfScY07xkSE0SgiW4uJutaU+ncss2Zl5jYVcyADuPrb?=
 =?us-ascii?Q?V+BwxaqjxLF7nC6jXbW9pLajgs+kBAO96oLBqbe43LRl+i/OsvtapFb0s88/?=
 =?us-ascii?Q?Tr2We8w6fqc/fMqWHgHgT6big3sw53w4NMiuNbbwT/Q5Ms+0CbLZiszwXNOY?=
 =?us-ascii?Q?peK5OZIIJfagADf94q8FetPxrlgqTvP9mTKH+d0+tLtQEaGUNhOax4eBvSU9?=
 =?us-ascii?Q?FTOJqPb4vl255i0AAk8Asf2hbm4Mhxyty3vlrnMEJCYltbibFmmioPu6LZWg?=
 =?us-ascii?Q?rZc6ZZOYZFkUvrl/dlG1oH/qjWoKDJLF+c/9l8HxKr6/XkjezItp0nWmKMzn?=
 =?us-ascii?Q?+WLPrfDpg7GwOYeYi4J9CgQJ3N2ibbqBai2/eeU/O7B4Wbfoc3yBKWgLs8Uc?=
 =?us-ascii?Q?bJyt8fB86XDivRa/0M5YVFmxl1IpGGG5iY1+jT/L0E0bIK65C9OfOtD2+Sh3?=
 =?us-ascii?Q?KicWm0wvxgDtdfixdP2qYKjG3F2joymOqgphQYgvbFTVpQtm11EESJDUw3xC?=
 =?us-ascii?Q?30/gE4+Yav2aggYmpsVEftSC1CdzQTywvmnqKbppdnWQNDFj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20282a26-ab2a-4529-8a00-08deecfdea6f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 23:14:04.0279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2P+bkKE8Y0LAzNsHbLvv+x2v9oOOBWuCxS/oEYx2Zd0xSpM+gfztGTixv6gdAPu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_161411_606937_4D595DE0 
X-CRM114-Status: UNSURE (   9.59  )
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

On Mon, Jul 27, 2026 at 01:03:29PM +0100, Robin Murphy wrote:
> Since table access flags cannot be software-managed, if process
> pagetables are using HAFT then SVA must require the SMMU to support and
> enable it too, otherwise page aging is liable to get out of whack.
> 
> For unbinding, we can't disable HAFT atomically with HA as might be
> desired, but luckily we can get away with just not disabling HA either.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 62df5870ebf7 ("arm64: Enable ARCH_HAS_NONLEAF_PMD_YOUNG")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v3: Make all HTTU settings unconditional WRT mm.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

