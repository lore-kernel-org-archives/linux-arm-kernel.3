Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31574C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 04:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVxCj6B4/M2PTspa9DBqCrG5/2JiJpmmRHwoKMmKbQU=; b=IEJXfsafr2PEyIZhIJpV5AVbte
	ZmDciOLvqgmGBcpqdc5ZTDb5mg7juD85h6y31qee1Oivmhf1+AbkjlVICjOqTQU9KaDdUHMEP1buw
	qAL5wV0l4I5qrq/GqRNdyCImiRS12yrOdqE06zhMR8t8ACoKWvfaHGVtoLRUjnsmpRiJ9ZYR5FMcQ
	Co80GWLVau6OlppJy2T5yJL9VsgAovLMeJk4E/qqP/L2g9uwCy6TU3k75ZZ7lQYGVP4X8v1FK5PNA
	IcyEAqjhRBh+e6QpDyG8q7OTFlNruZ95mZ+duyCYltXm4a4jPakyz15kCGfhgjMRm+/Q2rgqbnOHH
	bGu5g+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2od-000000045pN-29kg;
	Fri, 10 Jul 2026 04:26:19 +0000
Received: from mail-southcentralusazon11013062.outbound.protection.outlook.com ([40.93.196.62] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2ob-000000045ou-0X3b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 04:26:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUveUNYU9Tj4+aJ4drZZtlvVTOZvrWOazigNpWSgJpA8ENSUQgpQqYzksyk+zBorK0I/hc1t7bk1uSaC0/49L1GnnBslgQNIyAujSN1QZBntxeA1Ol6ptHe+5yAFJYIFhdTlJedQasnI6aagFZOGazbPc0YYs3rx84qHCjFGHEbWXR2lVddt4pmj2weTNclfitgiFH9lN/PDwi/aCFejaPzMQ6Cams2Ph0vKH4phrk9z1IvDs9evuELSlLndz6a0+Bb4P/uBgZ2Kiz9+xJHsmAHP2ELnZHiRNDkDhH9KjRQ6wZ+il/w1+hDi3vP5QrCGfz7KQH6nqOnX9J7O96dRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVxCj6B4/M2PTspa9DBqCrG5/2JiJpmmRHwoKMmKbQU=;
 b=v3qBmQh7CKI9sXAz3FTCR1l/xB8CGYmS0BG79MSWN8q/eUdV7OYbdntJAAz1DkGIodi5e2qxE1sbDMfiuA4ojrx0v1j+pzA0qecClD8UEt/7nmBd4+obUjx2Kjz1y09t79JPGPlKIB5kBT2bC4cUFnQOIjhEXxjh3a4e+TnrZwnUXF15Q53iQ2Bm5T9Dq2mBlkjmOLGsz8QukhCrKdj31HChDkzfRGV8VNZwIpAX16gGEpi0zdMcUlT7ZJiHwyosbDlld4G3nmT4UZoyhWR2IZMbY/Br00E/ippoQyXMY3ef9Ss1EummoX04IQG7Y9IHjV9WDULiGApnk1XKNu7IIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVxCj6B4/M2PTspa9DBqCrG5/2JiJpmmRHwoKMmKbQU=;
 b=jjSxmyXtnE1BAUhu/p8nIlD+iCfUBmofibG+WfkyXwRwhQGTxSp14c4OSeJjxHoBXqSb3LfSlkLtINvSPuNC1eAC1Fss/gBfNkAovaiw3P9yWP/B86Zbd7J1iR5JqU9usVMuw/PJ09eWEJTLStPKGxJM0whp4NxL63tTluweJemGw5D50LcMYA3mon/ROCdZVEKrQ1+yZgCmk3JiHrQFQRiEHm8P1w4veIfU2Q3rDdWaKUz/iAvNYekuj7v7mssL9EQyYvKgr95sa945K9J+6k6FkdKEmf6W53WvrnoPGHRW0U3zWqbBON6+COxi76+VTqVANcRAzP+FgXAs/NGXAA==
Received: from BL1PR13CA0065.namprd13.prod.outlook.com (2603:10b6:208:2b8::10)
 by SJ0PR12MB8165.namprd12.prod.outlook.com (2603:10b6:a03:4e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 10 Jul
 2026 04:26:09 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::94) by BL1PR13CA0065.outlook.office365.com
 (2603:10b6:208:2b8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.4 via Frontend Transport; Fri, 10
 Jul 2026 04:26:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 04:26:09 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 21:26:00 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 9 Jul 2026 21:26:00 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Jul 2026 21:25:58 -0700
Date: Thu, 9 Jul 2026 21:25:57 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Ashish Mhetre <amhetre@nvidia.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<iommu@lists.linux.dev>
Subject: Re: [PATCH v5 3/3] iommu/arm-smmu-v3: Enable CFGI/TLBI-repeat
 workaround on Tegra264
Message-ID: <alB0VfK5n3PsE8oK@nvidia.com>
References: <20260709095613.831769-1-amhetre@nvidia.com>
 <20260709095613.831769-3-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260709095613.831769-3-amhetre@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|SJ0PR12MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ee0889-b7a3-40f9-48a3-08dede3b5e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|23010399003|11063799006|22082099003|18002099003|4143699003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: H2Ap6Zmc6D+PMXhAfcEQv9mPPaA2IbaqYGzP4TFvp+uLRZRQpslbSpx7ayypufdQh+Y/Ud0DrgLtp/OblrqN3Gwognl71CvwMc+LmOXkswqNG5I6Rghx5/OtcVcrFSOpF//FxdHFOYTeoDw1eQMJjRdFzHiFF+/iUG9zNkAuqW9xcIwJO9w9G4amxusAw/VhfeqjksLtXlRVJXUZ7EhOBrB7bwkJgMkiZB4+vXqxBrnnzcC1rqjxrmkVzT5jkAVnr6ZO2hVeLUWM9U7CuN56uL7zxd7++j+5EgrM54GabXt06gK2TmgYLjJvjEOIhv18pf0bxrdafv2mF1GfI8qqmcJCkk5GAB+WCArvkb3YshHxdwN/X4eMGgmIQcIcw870zX5x/mfc3lb5a7UhuxyCjpEvQW1Npj5RZHazSGhekNnGByFulWPt7rxIcLkpJzxYhf+GW3r3bF7g7pg2JwwTrgbXeFY/QTdXA5YAHJzleCFZJzr3AdqXn81IBW0Xz91qjIgVciEnokrwuYNVGGL7OMSCFpIf7QMkiyFdqUyQvFQkRVH8qb354s9Q+0Wv5F10/TWOkhEIbpege46j0++9M+HSr1u0ratAmg8KBMb0sOdu7qffNfIOvqnub+oVPtt3cJSA6XMzJjhkj7Gj2FAlxwURn0I0l8Zfr6tXhSFuKuUFmTLRsSdjcOADY6HbnNwM1Ofp7czpafsiqDre0ieUJw==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(23010399003)(11063799006)(22082099003)(18002099003)(4143699003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 915jD9XmF21Szxof4IRwU38F+oHx7RaFlelq1d1FkzCCwVb79OebJ5QTPYGieLDAo5skUxckNJ4YOhyylIHnrjkQyP33E/hICWnSoj7HMQNO4uPTu9T7s1gLM46nP5QtbfRz4teK6RZrARb+gkJUsSkwxaFfDDllTLJxt2h+S0pXhQzvropgPvndbHrZtmcaYQTfavvXieLkQ20t7ePpiVVyChNEZhjJ8E5pSik6HISaLoPrQ4nmtJRn/WVuPkxNOQQVFVduf5zMc7XR+QFRyH1vuuh/4TAVLsB/+8qykEnoQdfH1WR4jd+OIPn4M3yPTniZCNSKAFYzavruoj7lG02IwvSIpLGr5NPCu1uFAzsbCoIv+cFEMAXUc4lqZ6gB/VB8I4eKVvIGF5jpgK9YTqsrYRVVCEThz6DPsKiuhZzmiRoG/7AUIW8oxUIVLsqA
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 04:26:09.3002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ee0889-b7a3-40f9-48a3-08dede3b5e00
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_212617_169190_EAD24AB1 
X-CRM114-Status: GOOD (  13.10  )
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

On Thu, Jul 09, 2026 at 09:56:09AM +0000, Ashish Mhetre wrote:
> Nvidia Tegra264 SMMU is affected by an erratum where a TLB entry can
> survive an invalidation that races with concurrent traffic targeting
> the same entry. The hardware-recommended software workaround is to
> issue every CFGI/TLBI command (each followed by CMD_SYNC) twice, and
> that infrastructure is already in place behind
> arm_smmu_erratum_repeat_tlbi_cfgi_key.
> 
> Neither IDR nor IIDR flags this Tegra264-specific bug, so hardware
> detection is not possible. Tegra264 is device-tree-only (no ACPI/IORT
> support) and already has a dedicated "nvidia,tegra264-smmu" compatible,
> so DT-probe is the only viable detection path.
> 
> Enable the workaround on instances matching the existing
> "nvidia,tegra264-smmu" compatible by calling static_branch_enable() on
> arm_smmu_erratum_repeat_tlbi_cfgi_key. Document the erratum in
> Documentation/arch/arm64/silicon-errata.rst.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

Sashiko pointed out a concern at PATCH-3 regarding the static key:
https://sashiko.dev/#/patchset/20260709095613.831769-1-amhetre%40nvidia.com

It's a false positive. But perhaps we could fold in an inline note;
it'd belong to the missing description that I commented in PATCH-2.

Nicolin

