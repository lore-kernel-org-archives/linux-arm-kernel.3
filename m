Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411EBE6FE51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 23:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YswWISh/KdGMDsoS/c9MD5SK7LW2piRQfmBsEDhIiKg=; b=BhTft+Zk32lLeDppS7RMjLWTO1
	fZHqaVUCS2qSUSZiDf+Ia3cnJ8JRpmvcUUQv4+VPAo+Syho4/y6EJZYiNNa7xtNi3/oC/bu4YROMN
	7XmEXdanMrCyUFIGCRfk2YPUpNRLHwh8MjwpqyJuH/UwfBHgcuE0dp/ZT9UEe7GXZnSL/qrJIbTJG
	GaYwUNWoPnU1Br+Gyyqvt8CXgzsUH+hIFYH9Cnps3xig378w1Xl3NzQv1FJau6Qn/1no1MSZeUuG6
	gDMqPPAQeOOaplVHWfji7gqqjBV065p0MXFYj9e3+BH0qlZ4bFlSRzyJ7rwOR6LgrQTB1oqH9hdJn
	guooCfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBOa-0000000GABZ-13kD;
	Tue, 23 Dec 2025 23:02:24 +0000
Received: from mail-southcentralusazon11011003.outbound.protection.outlook.com ([40.93.194.3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBOX-0000000GAB8-37JY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 23:02:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBzaiRG+xf+3pfZd0Fr2aTZMKEpbhkgqLDeCVLnFGgaTuXlub2BDLrmK+5vRqZKrJK5YeQPnjCwHOv7Yh/PRLo+I234V/L+19GrnBJ7f2KMid6Dm4v3ecOpx6tlxvF+pjFeN0zbY62SXPPri3B1ocMud+/s3ZPjrQGTEnVbjIjtnpnYwqkwzC1A71ML/o6X5TAZi+hA/eDBVh5zxe1g172Jd1zD4ma+ip0xkqYcYnCd4YieAssjzODZ4c4C+1+GD9nBGdiVX/THzcMDGkbyotfqvbDgS98MPQMZOnffcRpvUmFeiP4PmIeDF/ogFX+UWIkXexROVOCSnkEAlCcjFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YswWISh/KdGMDsoS/c9MD5SK7LW2piRQfmBsEDhIiKg=;
 b=L+0wSpBqo8PajqkYbEwzImYVmU2lCt0IPLWAvOlHlx3t7BiMV5fdJ3AL0bxI5jmEhsxCYfopACtR8WZHbKlO1IffMgpjn/Ru7a8XWsuZiCxfAwryglOebAUsG9D4KdVolrloNd+LSsXvQ4eOFZNOR5w59fA20eDvfrUnHqS38AxJ9ah3MJgXhh/cyqfPrPi3wcAs6AtzGQ5ACwvHaapEpqVlRjWB4bPHc31l5vF8JlyrjJBkF4ebRtH3wj3TV5iEWSxhdZpaRoXwK9kTQYaN0ncqi6mWfc+TSRYX/r3UXczm1GIzArY/MawI5c93BYYM1FeeJJBXFtq4xOAL2vgMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YswWISh/KdGMDsoS/c9MD5SK7LW2piRQfmBsEDhIiKg=;
 b=FdQDS9GJ7CuhzaZZHrgoFLyjrzNeLc7L1DdGiFlhcdGbIA1I+FZ9zyKeoSYvFr8BBPbuZ1maxKpJ3Tpi8t4yt+M0dAj2GdMDXANNp3JJ9WV4Qop9dlVgr7+LPqhfXpfN2+XP9IOTjSzn6uYx/7DxnsjGlHhyuohfMsWKmCeweu9OBDe5f5Yf0VZl5+h0BaUf9CTfW7inQVsRGG4wGHwPT4PnXB91rxefHKtF0EL9GHMsrTJfcKt2lv++ZqQVKMIsOAWHAeOujG9+aMU/KzIjpnc2ZXFdgJQq3HQuDS4NNcjQ+2k1NIKCnBh5ATFNZNS3JqTGx0yMv4smXUq9IPp5TA==
Received: from BY3PR05CA0047.namprd05.prod.outlook.com (2603:10b6:a03:39b::22)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 23:02:11 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::2b) by BY3PR05CA0047.outlook.office365.com
 (2603:10b6:a03:39b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.10 via Frontend Transport; Tue,
 23 Dec 2025 23:02:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Tue, 23 Dec 2025 23:02:11 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 15:02:02 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 23 Dec 2025 15:02:02 -0800
Received: from build-vvidwans-noble-20250617.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 23 Dec 2025 15:02:02 -0800
From: Vedashree Vidwans <vvidwans@nvidia.com>
To: <salman.nabi@arm.com>
Subject: Re: [RFC PATCH v2 0/1] firmware: smccc: Add support for Live Firmware Activation (LFA)
Date: Tue, 23 Dec 2025 23:01:29 +0000
Message-ID: <20251223230134.462535-1-vvidwans@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926123145.268728-1-salman.nabi@arm.com>
References: <20250926123145.268728-1-salman.nabi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: ac84ef3e-ac7b-4cfd-7540-08de42774e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VTb0Aq2+spWF8eczpRJMWLk4CcJJUMSQWQ1bsGUqLzciNbjaKRgQESCjN/4d?=
 =?us-ascii?Q?Idj0/Iu8VP3GGwAOYO+1xscfbFIfMD/a8d9eSHKGTFK90hsUl4ujdqBQfNVW?=
 =?us-ascii?Q?E6HB2dejWwNeI1Gf7lJlOMX3HIjS49Zvy2uNmmnDBj0ltdO9PkXjQPOG4Npc?=
 =?us-ascii?Q?jCR6TdSwwpcENmLMvJ9QHAKsEYzUz6vcsru3D9LHF4sF4jQsEKkNLWWbS65Y?=
 =?us-ascii?Q?D7cAjlm8jSItVVUl5nCRScTvk7FF7sJD/MMvjB7nS4JZzV1TetefweqtkP2s?=
 =?us-ascii?Q?Zh/A4I+peKLgoj2+kpF8P4agMFh1c2xXAVAsJaluqDYC3wiG7/4fkcaMmBIH?=
 =?us-ascii?Q?unjdXX8tbnhtIVHTZg+MGgP//RZfQ9jKjRcTo/ByyvldEXnWOMMJWPBRa5U0?=
 =?us-ascii?Q?A1QsMAKRyYbjjTY/rawANhQipfHxP4rMYpJII456yJhX95dnLHFXGl1YReq5?=
 =?us-ascii?Q?I+IvzG14e7F7bjUcMvdEuccpXoklQ5qwcUlptumTuXqDs/1289VJPAeNt/8x?=
 =?us-ascii?Q?iqxVcCYeQnuVLISaXlvkAAyA4xj6dXgzbGmeCmMKVo31Oh3EJntpe1EkJng5?=
 =?us-ascii?Q?ruubbzOGxLcUjLKfXOd4wLLk0ctnwEnZjQa14wVnOifoDZsRrzOQqO04utGs?=
 =?us-ascii?Q?H4e3E4sDjdRVR6rhcj5W4mf1MA3gEsPB1dbrb6cGQwqITUh7VXRlcmhIUjX9?=
 =?us-ascii?Q?JHsWG+MuglThcrqahzqecpzFyhxr7t+irSxmN0gh27VHxsCx3bOJ4HIHD1XF?=
 =?us-ascii?Q?1ShTDjZgx4tlDOX5PZGP2DNVtgpc9Ww8hvdTEt4jM87FtfeC1YAN9GFyEix6?=
 =?us-ascii?Q?rPntCmkZxO+RG/93YQVs83Dh16u8JA2fkiFLESxDcRu9tQS3mjdxurwxoaPj?=
 =?us-ascii?Q?Pp7H9kqK5bCTROWvfA1qyuB0CDf91GTiEwmP7SCSqufZ/yG0avuNJlgSLFtd?=
 =?us-ascii?Q?T7UpigAf+GQmzOVa76rm6IOOyCW3E+e0lPKzly6vgREGa1N5A05Tg5fYiaqh?=
 =?us-ascii?Q?wkCJl07kZFsRkD/Shbhlml2xyrTyuuNoevF1AEHXZMcwrf/uK/ZrbDfH191G?=
 =?us-ascii?Q?+M1fK56SgBY09BSgQ1cuQAEiDz+w5JPGzdDG1bMESJIwFqw9Aneqf8Gb2q10?=
 =?us-ascii?Q?MU2r/SsthJyBDpIG6jzqwbJUAvfisQ3VLNSRCm5ufY0UeOW1IiQS0EpOzyAe?=
 =?us-ascii?Q?pk2eVys1Yjw6JcZdQ872MAuo3ci/vHUS0XGXJcg1fQkNfEtUml7Lr6lzRSoz?=
 =?us-ascii?Q?pQMdPjatRvR5rNcKKi7mbsyJhjmecjsgCJ993GGANZ7YgIsoIQM0eGBAEBe5?=
 =?us-ascii?Q?rTqD87/VxqTnYyRoGMqhd28LW6WZzsbS0NHUfyX0k/xj1FJ9SBIeieWsFWPU?=
 =?us-ascii?Q?j9KZl6MIdJTHn1QPe6F1DYIvYpIrxN2+MjikmNoRCcQq89xU82SHRPgztfV6?=
 =?us-ascii?Q?JCkPGPqt0VlT7d9HB0INFrPUuvFmvu6F50e5QxMYScBqqyov/P/I+qGChO65?=
 =?us-ascii?Q?3TmTSboImyE8GKhPB2tAw4koeAknL1Ay33ZXFm3MmAIj/GvqNglwJwe4QSnI?=
 =?us-ascii?Q?txaTUfU0AAq1S/+c9sc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 23:02:11.2538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac84ef3e-ac7b-4cfd-7540-08de42774e23
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_150221_791872_C61F7914 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: mark.rutland@arm.com, andre.przywara@arm.com, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, sdonthineni@nvidia.com, vsethi@nvidia.com, linux-coco@lists.linux.dev, sudeep.holla@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, chao.gao@intel.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Salman,

Thank you for the patch. As you might know, I am implementing the
interrupt interface for LFA driver. The LFA usecase I am working
with will validate both interrupt and sysfs interfaces of the LFA
driver. Hence, I would like to extend the driver posted here with
required changes. Please find the extended driver patches posted
at [1].
While working on this code, I realized that LFA driver should
use SMCCC 1.2+ version as per the LFA specification. And I have
included a patch to upgrade SMCCC version in the code.
As the initial LFA driver in this thread isn't merged yet, I would
like to request modification to this original patch based on
a review comment on my patch series.

Could we please come up with a strategy to incorporate the changes?
We are aiming to merge LFA patches to Linux kernel as soon as
possible. Since I am actively working on this driver, I will be
happy to revise the initial patch(with authors intact) and post
a fresh series for review.

Regards,
Veda

[1] https://lore.kernel.org/linux-arm-kernel/20251208221319.1524888-1-vvidwans@nvidia.com/

