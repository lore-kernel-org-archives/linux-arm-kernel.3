Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05149CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wde17v1Jf/TnKIUzENXzMqpVxR313zjptt5UYyvo3uQ=; b=0r47JKv/b5MaCp8YVasIIEwLsn
	RvuO+obFh0ahOKhq33kwI/ql1+YbZ7iAa0FU/UAuWG1gqyjOnr+1Yeyx2mhJVjGyevdfJUc39BQq1
	r9pXMRVSJvQXoZSUQ+1/b/7GBy+lB6jluwOoc8FzIjD7yRJVplNoSrTVIandkcbnXQySWbNpToHG4
	HHSt5XZpaF8W9uc6RYQsrVqYTT3sEVZt9O/e3eEMiOkkPGJNg0wz4VIqvQfAaGCcZTKpDyzzZyjaO
	ozWNjquZ88ZzSSMP7qt8XYb3gUbeTi7004m57IVrMfrhNQj3D3ORs5nta02em7eKMLqYV5WhqV8oV
	CzOEHXOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS1oL-000000034qY-0IJE;
	Wed, 27 May 2026 00:07:49 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS1oI-000000034qB-28r3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 00:07:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmiSb3P5w0Kozb9pv/yNpvqN4CIsfwRSqAeHIbmV4Tg4g/xCgzMCO3n/BAyMfkO68qgt/makCCDVS3SON70kns3aGnHTqF5L4AD5RgalbaggWrkO84Gk373ffAsP+9dIE7e2A5E4TmoBS0PNg9LNz7kxSCWv/REXsaVPIzajCUQRC1fqEdz13qeMwuUCMUfaZ/4B1huG2Vue9oUk4nesmdhDA7Yjqw3O6k9XhQtbBO5W8BaHsHap+j4hkXRip+eRa0+Zew6k0VedCq0drhXgnPv1QBXsGkXkY8vG5VDIUpbm8kKKxcDIA4UWAPFKCTPnCrBgFoqQHjHA5XygirLr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wde17v1Jf/TnKIUzENXzMqpVxR313zjptt5UYyvo3uQ=;
 b=iswk4fmezd5Ikhhf+H5fe7jvIMcsFmtZJ8n52OJPSHEywmA0mp1SXoehNTpTlpMlKCSqdfLjzptgnmBuo8PDhH9sQ5ApRoVuXztsXWsuec3xx/GNUwkzl3t/s+JWwB3NePjjYi6ar6YQWxFrqNrw78jd7fGt7qSdUeguY9Nb8GvFiiVNBwDOFqZXyi30BMneMvBDwqLKIYC3pEXSUfHw8fLF8eKGy0fOqmWDiBpuOyESOvGkmyj9sqnbi0251MK7GZllZ0+r0j6jMikYCPedlsoVpYIDhbpUBVVxxHjftJH4pJWbM8QNHqrc9HXEjYlzRLYi8mRibYqjPjrlA6480Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wde17v1Jf/TnKIUzENXzMqpVxR313zjptt5UYyvo3uQ=;
 b=SUeN6nyXlIaaY+YYs2/a9WVmKjjDHWU1npXHSX82a7pyjukhyUKfPOhmkE2XAd9WU7Uo+tSYudaQX+xDJSL1NhB75y17EMqn559bRYwbpTq3muEhr9kA8O7CI6OnuUcPNUvkyB9a31FBp3fiQCZsYT+NDbiivbjtxdtGVZ/7Ftsv5a0m3zJ52OPwqQYE0oTYKlyaA8dvS0/VFDZY7VwXmlFPOlQaGfiuelSH4qlvzv4HYN4pp+GfbDxheIMF6OrNKLIAk8B2+ExOkysxGRxhurSWGd7clCxg8VdL0QfJEaRRJilFDyUYzIuK06wVpY+eR4DXnQNF/pUGYX6d1splEw==
Received: from SN7PR04CA0223.namprd04.prod.outlook.com (2603:10b6:806:127::18)
 by SA1PR12MB999107.namprd12.prod.outlook.com (2603:10b6:806:4a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 00:07:38 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:127:cafe::1c) by SN7PR04CA0223.outlook.office365.com
 (2603:10b6:806:127::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 00:07:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 00:07:37 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 26 May
 2026 17:07:20 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 26 May
 2026 17:07:19 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 26 May 2026 17:07:18 -0700
Date: Tue, 26 May 2026 17:07:17 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
CC: <robin.murphy@arm.com>, <will@kernel.org>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linuxarm@huawei.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/5] Add debugfs support for ARM SMMUv3
Message-ID: <ahY1tY/KL4ynWghX@Asurada-Nvidia>
References: <20260328101706.3448655-1-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328101706.3448655-1-xiaqinxin@huawei.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|SA1PR12MB999107:EE_
X-MS-Office365-Filtering-Correlation-Id: 630051d1-6731-49f2-054b-08debb83f62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700016|376014|56012099006|13003099007|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MXkoo5JK5jAo2xe6wM5OBmeoqXcGC4vA5RMcCLEaVSn9atJx7bXN6qsp3Z8eGcy9BPJdg1F522RA1H1YUoIjwyJhT2P1dNmiR1Ce+8SRcaGvbUjMm21PiIiBeJTQZSZu49jOYCXdFX1PqJnCpN1KIhKmMcW0LsZIErHV12rlDaBwCj+rhEmj9iuZbhZslJYcbD6Vh8A+rG7PbSq/6a3Sivg0BTiOTjFrhYp4Sw6aUNLfHHFqzLWGs0HcqG1Bwf4Lix9/sTyw7rMnUsYG5CwX8EjTimvXHT17FI11LGcAUHOuwcQAQYpe6SixoiqaDHPq7w1CDokxaJUgEIwWcTOrW4AAaUyhLAwEpqhXWgHFtHtDh5do53bUkpsMlhFY2GK2iUvo+NQcR5RozTtVsAGYRVVFNGGWOxjceh4yjlF7DuWkuEAVYltDdNdy+r+CM8n5LDGbPTfQC3gFb5O8wdu9Y9Xx3jybdsMxfua1cXwdz87ylzA8zfv4Tr8DOXHodAlmGQEjkbYm7tFfh0gkKVSXoF7EZMBWf/YkijHIjjeHf4Kh1qDliZHUa80zmRh1UDpJo5BY4YAQ4r9GRbnqL5XLEw/V5qOL2TLgEjogqjjRyDbcjCDkifReu7Pv+eNVnlsPqYZKd/wF55lmrDFPeVaLeRGafDxDP1piFu+zxbSGEjkByDSRblljei9xREDu6cHiMc7Rtw4109xYT1YHM/xYlikDLJUITnkBHUeV7zBRxno=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700016)(376014)(56012099006)(13003099007)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7zEcqGtUYR6Bf3MZuFn5kuSKiikjzEnY6fUEtNkfxmd9WodIriRCBZO19QmyOJKbQqBdxxWJgC4znkQaImiWZ1QYUxG/LxD8K5h+OxFfBYuwo5yOaJ8MveA0II4RWxm/2dmLBGPZZ9sfGIxYl6SMzaAzDyLQDUKfjxb2K9LMDpit0Z+FQM24fjFEU1Fhc9hhnRChTrdNXIHT3Z+fxDYt+5RQVgB8X2l4PNnikiUQbdfOf41KT4x7vFcwQvnDJwhb5I+Fm7hUIQRWPKsv6S9RaCnTt4AIIs0ENiBc9hS9243evriUqYMupxmLLHJanh8tKgJRMhXfRCihl7NoXB2KMGz8myi7UbTfz/eiJXFbeJO8ax+rfUs/eiSDA0X7bfw3Z325SleTr1CEueacr3JsegFeX2Z5eTcGyflf5qYYNLS2m4HZ0C5MD1k+ReJzHf7E
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 00:07:37.6756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 630051d1-6731-49f2-054b-08debb83f62b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_170746_563593_25CC7E9B 
X-CRM114-Status: GOOD (  12.58  )
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

On Wed, May 20, 2026 at 02:37:06PM +0800, Qinxin Xia wrote:
> Add a comprehensive debugfs framework to the ARM SMMUv3 driver,
> providing visibility into internal hardware state for debugging
> and performance analysis. The debugfs entries are organized under
> /sys/kernel/debug/iommu/arm_smmu_v3/, with per-SMMU instance directories
> and per-device stream table entries.
> 
> Each SMMU instance provides:
> - capabilities – static SMMU features and queue sizes.
> - registers – SMMU key registers.
> - stream_table/ – a directory per device with subdirectories per Stream ID.
> 
> Each Stream ID subdirectory contains:
> - ste – the Stream Table Entry in decoded and raw format.
> - cd – all valid Context Descriptors (Stage 1 translation tables) associated with the device.
> - a symlink named with the device's BDF/name pointing to its sysfs directory for easy navigation.
> 
> /sys/kernel/debug/iommu/arm_smmu_v3/smmu0/stream_table/
>     ├── <sid>/
>     │   ├── ste
>     │   ├── cd
>     │   └── <dev_name>
> 
> Changes since RFCv2:
>   Address review comments from Nicolin Chen, kernel test robot, and Sashiko
>   automated review:

This seems to reuse the same message ID as RFCv2's?

So, it ended up with attaching to RFCv2, on my side (mutt).

Sashiko also failed to review against the new patches:
https://sashiko.dev/#/patchset/20260328101706.3448655-1-xiaqinxin%40huawei.com

Nicolin

