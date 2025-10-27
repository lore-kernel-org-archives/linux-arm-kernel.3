Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20728CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86wS83iRZgbmCRQF6Rt9NPhgkmcjn0GBkuyJpwn1yJQ=; b=vlK3J2QT7B9QDPPHkdhOFFKqwA
	F/a/CQSzQEij8DHcfxilMeVdRYiCXGLmF1eBu0bCOGQ92b1Z2HzAO4IykiMe+sJmTW02wTYPppBQV
	7OWZcknalzf6iYsf8rUsnWJKHo1Qv+lI3u6p5zJRHNmWl4Yfw9HqxGD2VLl7YiYlElKVZQI1BXyvv
	fBDhmDffEe4IWNYJ7InhAFAfvUslGgjF3TKVML3p315829gSZa9HjUqxMyVIT+WJ1zPt/da6Sp6Ll
	75xBjNyd9ZEuKtzLHc53KIPnSePCOXTZBY8oGJzYS4VNF8BmKxJGRAXXG7klvNi7weq0IpTp4KoYk
	8eA1M+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQFn-0000000ELMS-09ge;
	Mon, 27 Oct 2025 16:39:31 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQFk-0000000ELM5-1j9H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:39:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9dX2g5b36NqfOeNjYKZuL/cjAsxMRsgqo6sLxl9kDxaLjl/IyraDqhFFXCJOQdvFq++NuTQ9FMhoBU6/DpaS2EMwi1nQLeO734lQzF3glbSl6LVV3VBaBP2d0E/Kl9527IyXR81Ek2K4o+61GgPMszLmj+6vwB1YaLsiJ5nHIO+WcaiUdnv5Xu3xVzpM2UwVqzuz4MUhBEYfjLcV9T6DHgBcKHdlj1THWAN9Qg4A8aZFg/tgAAjxrdGCRjS96QE0SQvoe2xn6WCA7avCpF/Ptj+uMvoh+7+3qfaxjoJFmImuijkeW5+0UlJQG0htgznvsLtSMVhMhnuYUTYS/qDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86wS83iRZgbmCRQF6Rt9NPhgkmcjn0GBkuyJpwn1yJQ=;
 b=sNm4LJpy3bJce/ieJlL9KtYLyXvkJ7yvuTsJZw4ne/uTO+kJbrgtOA201QuO7zw0yLr2b6poxJZf5hSp0fRcYvKC/sHuhVmOm0aGn/dc5i10kDYaLNczXWnSYvCPXGyiOj8IQi7L/7ELtGzGVcqPLXZ1sL4aYJEoiL7JH0nPkM4JEfI6kXQm0lddTB/bj/yXLhvBY1w51N30B6diq9pxl+P8zEoVdxOqqUnMbNUt6J2piJAhZoaf+92dSyxzfY21RMXDNcLnWt7843pdmF/SJsy3FZL+u/7/zju/q0hJ3jK64ZQHKJAukf87E8bgd8hIfch/WHmiQfFyMgovbK2SNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86wS83iRZgbmCRQF6Rt9NPhgkmcjn0GBkuyJpwn1yJQ=;
 b=Jw30kYm3zMGQIXSuofwlBfk5Inw5a7aKvGyOiId+oZyYea9R7t+8YI9pd9gK4fL5BBwh1MWk/u+YA6Rgw2JExL4s0O2eEIQ9Fwc05h85oKipsaZyyPf3WOYl/a5Mv3wXlSgL1hoQB8fywfHaAVnQny08xM2MMJK/2U5b3J8WvYk7r4+4YdXqs+LlgTAJmjQL6djEv7PCkQq0tqRVZ+/8j2Q2XcEoJXZyNNatk3DkFO5/KT28p/dUqUUMuebAhsk1jqIDN32WYaK7vBOpu0lYxQ7fN3+jVWY6vIxHJPKzK5QAGuXLyq/H7V7r1FP6e8HNmzsVJeQYn1+bohOEBx+I5w==
Received: from SA0PR11CA0123.namprd11.prod.outlook.com (2603:10b6:806:131::8)
 by DM4PR12MB5964.namprd12.prod.outlook.com (2603:10b6:8:6b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.19; Mon, 27 Oct 2025 16:39:17 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:131:cafe::6d) by SA0PR11CA0123.outlook.office365.com
 (2603:10b6:806:131::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Mon,
 27 Oct 2025 16:39:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 16:39:16 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 27 Oct
 2025 09:38:57 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 09:38:57 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 09:38:56 -0700
Date: Mon, 27 Oct 2025 09:38:54 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: kernel test robot <lkp@intel.com>
CC: <will@kernel.org>, <jgg@nvidia.com>, <oe-kbuild-all@lists.linux.dev>,
	<jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<balbirs@nvidia.com>, <miko.lenczewski@arm.com>, <peterz@infradead.org>,
	<kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/7] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <aP+gHjiZf6jpFTHU@Asurada-Nvidia>
References: <345bb7703ebd19992694758b47e371900267fa0e.1760555863.git.nicolinc@nvidia.com>
 <202510271909.iEzPjNv4-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202510271909.iEzPjNv4-lkp@intel.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|DM4PR12MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: cc68e198-09a5-4027-3769-08de15775ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KQenywuB83oS6M2MZSvZb4JB58daJ/rRMQzVNmLSNB8ki5zsv4UmTnFnOUlq?=
 =?us-ascii?Q?J+mGwkAr4x7XlCMtS6rsbvHhe7CMdLCSCIeiIOglI8ZDmVibuGJmG9/w/eId?=
 =?us-ascii?Q?zRcGx8Y+irj7bjLi5y9EeAnRG2IWF+KO1ZoLevm6iFUQ87AxXTbs0PTDPAXY?=
 =?us-ascii?Q?dWuLkLoMvOWdWvlFLnv4+ICfg8MOyUkR45hSleEghJVB8FYkIhCHmMW0Mmj1?=
 =?us-ascii?Q?MmR3/RwYnHvTLho6jbQu66chaLiUyRvW6baqgrt0BaxfKzTt01USgxg+pX/O?=
 =?us-ascii?Q?I0Aw6Dm3JPVK3LGMmHlbUCCiB1ablvsXOrPLonolkUSQN6S2kgB8bm/GAtTf?=
 =?us-ascii?Q?q5NZAUz1PsnzoofyNL231gAcPiGCRlotqvDWrlBgEme0Rul1xrWg1OO1oG0u?=
 =?us-ascii?Q?E53D5myAOmouBq/CjbgYWKtGJZ+j5Xu3aopjN68u2oH1Bu+irP7bgXGJi5al?=
 =?us-ascii?Q?/DrJP7+omY5JWnlUGWwKMfcQLZ1226xiPhIhz8MY1m4z++dYc2v3E8hX2c5B?=
 =?us-ascii?Q?BgN2UYMpInZyM7pdQ5H3aFl86BDvAGIKjJeLz6UOXKnoRXnhOjh9w84Y77yQ?=
 =?us-ascii?Q?bW8yjRcWiw/yDK7N1RYbi4Zu4Ntn9LXf+Fr68pTL6SeeaCf6wyStZzhokJJP?=
 =?us-ascii?Q?Gsi6AWvWjTNy9RJ4GE+Su+o4sd72pJJW/yOF3iDSUfw+HND/b+ZbmzDhvDS3?=
 =?us-ascii?Q?MJqSBUSW2qZzr7/odulH1wJO+koiCrUafGGjFL8bmaPd8zSPcTsyAuLf82rS?=
 =?us-ascii?Q?J+E1lzD4cI6/Qj0DmY3skcqyMO28NaJqj3YeBD7S9Z2x5JIFzgvNWzUQKmJc?=
 =?us-ascii?Q?7xGh8AdUys/KHo/doYdHgwLhzIQSFAcxUHS3ixxW3XXZcyurpPDipeH6uDmH?=
 =?us-ascii?Q?pYqXEiGSg+KKOjPDOKcnhqNEfX6JjyWR2v2u194IExEnlXG28qhtXG/ROLKs?=
 =?us-ascii?Q?pBmiEKTo9ZIvCu8W7wahUC31wtJH4NHZ2knET3YiI/VGbbHUC3ZZ8jqrdid0?=
 =?us-ascii?Q?xy40JqIYyTkWlEV1vUzc5G8G2FeY1E8spXOtGNE1/VaEmTyrgciKaq1/YBwx?=
 =?us-ascii?Q?ltlOzPfTzP3LnC/XRLR6L+q9viGBpZp0l5l1lfZnqbknz/dFsMy1GKE31GR8?=
 =?us-ascii?Q?na5lyTD0suOde2o8ygx4zZ6vnQJsZUKI2SU437u1szxSTJfnNVMHDAr0ZdCw?=
 =?us-ascii?Q?boQsGOiAm/kykiVEmCGtNxTawD9ZibN7EAOZBY7ACqCu5HHJincwr3tnv7Af?=
 =?us-ascii?Q?/SliVtlm5BA7kDng9UCaspGaLLkB9JrcfjYDg5OhROgNO3MKhklYdldomRR+?=
 =?us-ascii?Q?zfI0Pv2JmyDmWcXlNwvwCotM7//7QBNpjl61ALWbGWx/0jb0gmLxTG7QjV5Y?=
 =?us-ascii?Q?tagEuCBsvPIocWFma4bUV4vriBN2mgxpNTkfNNUA0RmLfX6M5TBdmSxHAVlX?=
 =?us-ascii?Q?pQRzs2DXUQGIQatavkxFpwkI/s/Fwg49ixYhajgqnvz6Qz9ICpEJf6o15l79?=
 =?us-ascii?Q?fnGfjkJvcM4X4P7e3O0mdTWhQykRPqynhXSZ46eFDweqFmFEVxemQWxyD9UQ?=
 =?us-ascii?Q?EIHC8xyq46u/ALPAdbc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:39:16.9005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc68e198-09a5-4027-3769-08de15775ee2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_093928_491166_9EC787B6 
X-CRM114-Status: UNSURE (   7.97  )
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

On Mon, Oct 27, 2025 at 08:06:03PM +0800, kernel test robot wrote:
> >> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1062:23: error: static declaration of 'arm_smmu_invs_merge' follows non-static declaration
>     1062 | struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
>          |                       ^~~~~~~~~~~~~~~~~~~
>    In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:34:
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:731:23: note: previous declaration of 'arm_smmu_invs_merge' with type 'struct arm_smmu_invs *(struct arm_smmu_invs *, struct arm_smmu_invs *)'
>      731 | struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
>          |                       ^~~~~~~~~~~~~~~~~~~

These should be added under "#if IS_ENABLED(CONFIG_KUNIT)" in the
header.

I will fix this and send a v4 today.

Nicolin

