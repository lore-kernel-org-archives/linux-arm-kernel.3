Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC01C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzJ7HiyjmGOFvvSleiLVSawnJ7uYixezoFqv8uwPtDc=; b=gG+xlisKHpuGk/saAaCs/OEtFw
	EDNRxTsOMcVrWq6VZp4RztUkxati1akBIs5zy9Rm+3oGEHdpgw6WviVHcOmQT0AD60811ud/yXd6y
	dLbCGFGaEfnBrv5+lmGeXXxfBT1Eb1v6iDqf/khKM7cC1L9uoffr11bV44evRov9Bo6ojbpsEanZB
	0PPs00JYVLHmSYmal0NFtL9+B1IP9k4jr9al3bAe8We1XwhN+PYsfONMutBY/h2VHnPgQaeNOwUs2
	rgTC4iVcd113MxeDjwfuowktDgmI7jThEV69kahk1cNl+1MXa+igp28BHD5WeFkkuYG46uRE6VG1a
	PynL/3+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkS8r-00000009Icq-1yeZ;
	Tue, 18 Feb 2025 18:16:21 +0000
Received: from mail-dm3nam02on2062c.outbound.protection.outlook.com ([2a01:111:f403:2405::62c] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkS7N-00000009IOi-318c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:14:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdUtQEscu8T4iPY0qgVnP6pPIybkVO1QHb+DIPpvJIHmMLKiljQsiiu+7SFJiBx8+10fa8ISNzX+7QsKRQxxwA0Unug1mKjji1Lskd5AJw+zZAOkHpIAAQojLcahop7AH8v0BqN70HtoRUw4oXfOrSmjU5lrItHRSrIjaQZsbJpVWGaKGiqLhehbv88BGuRwNWTwbD8Skqrat9yjNef+aUPJZ0ueTqvgkIBHSjd8KikH8sPUFRJF+Y4OkzOL+A714A0GZGT9nd5vNczSE6uWJhwViBeRMJOF6V9qX7BMSa08mUtXjHz0Fb/mpO2YvzmVz60fg0DRt029eJav/v9z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzJ7HiyjmGOFvvSleiLVSawnJ7uYixezoFqv8uwPtDc=;
 b=etfjVFKBLAfL+mfaUNM/S7twfx+JYLQYNW6Yk3XcvRHmXOXokrtuATWYnVIuWowDU8UC8tPSJZDQXZsEVg3I3LpnE7H64ftWGTx6UfgBZeoPrGDofByPx/8cqg4bqrfn5CNjAqq+O2T7Ph+XpMFC1ZlpV25GB+61imYGzqASuMV9MNAU96UiZod5gmTC+rLDD5M8Wz1wCLNzEiOA9f8xi/X35L354gPY3Nnyk1U66NEsPPQES5VwndcjnYt+sX1L2n9kuSzwK29ghKM050Pd6Hnud5nHZZz7yUxu5LZTIvdhm17ugVcmP+svVkHJGp/tFmfHd7MN10NdOcCIeOzIYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzJ7HiyjmGOFvvSleiLVSawnJ7uYixezoFqv8uwPtDc=;
 b=L/Z0Tjg1jb40eLS1vT2xg3x0vZ4Kw509Tm1oAFWrdt8kSIRuJfthXpspwXYIkZF5oA3V1Y6JNw1kjOCYMJ5mDvS1OfpoUgaHoTOJbZBzJuPsUzauZUOTEQDLetrs41ApmdGD3RsSbop8Y7LxFBtTmIjF23MTXfyUkD0DbvCaCPxMgX0OtAVtPBGt6GTdLlLcAs3L1/lOTXqmciRDzvnFsrfP2L5QhbzBxmtWW09hW1n+D32DDsunFznqFmGDQTbcF5/ApUIGzSzSgZbi5OJM24FJJWVYfkfod9hbB8cD8tMFi+d6BxGVnaJD9i3+H8wuXN9eOxPYz8HYtQax7sQafA==
Received: from MW4PR04CA0295.namprd04.prod.outlook.com (2603:10b6:303:89::30)
 by PH7PR12MB6467.namprd12.prod.outlook.com (2603:10b6:510:1f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 18:14:42 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:303:89:cafe::e2) by MW4PR04CA0295.outlook.office365.com
 (2603:10b6:303:89::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Tue,
 18 Feb 2025 18:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 18:14:41 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 18 Feb
 2025 10:14:24 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Feb
 2025 10:14:24 -0800
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 18 Feb 2025 10:14:22 -0800
Date: Tue, 18 Feb 2025 10:14:21 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<joro@8bytes.org>, <suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: Re: [PATCH v6 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE
 for DoS mitigations
Message-ID: <Z7TN/QmQayhNrMGc@nvidia.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
 <436ac2021bb3d75114ca0e45f25a6a8257489d3b.1737754129.git.nicolinc@nvidia.com>
 <20250218172120.GH4099685@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250218172120.GH4099685@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|PH7PR12MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f5260a-ca53-4444-84de-08dd50481d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L0jLB0optLP2Cm9n1PMers9BvxQMuepmiNoZlu0ZIQBKr3z2WkfGwXYv4tBM?=
 =?us-ascii?Q?TEiBIlFTjv598gH8/iNnjb66fXGSSspIO1MLHFS9V1RACf+YaaFPJwz7nwnI?=
 =?us-ascii?Q?/H5YXUODrn8ApARMj38OVgjpWM13h/gTbBOAmfF8siUzmLpXLVUMjsvZ4wM9?=
 =?us-ascii?Q?KKoc0yA4fkftx77TPXA+jaHTQQA6a9H3DtH3d86MQw+OqawskdYzhHIK8iqd?=
 =?us-ascii?Q?hij+0oJS0V6RK28rcoCKQj46X6SKmIkvBG2Vb8s/doppAMfM62u28/0yHw6p?=
 =?us-ascii?Q?wXWe+Pe7x8OAmiIdwdfyPyLSE4MpoIkGXL1Lmj/OA995M0RQC1p3xYAB+nvO?=
 =?us-ascii?Q?RP/fPa5NuXHD3bR8wtc3Y4xINBiJik6PDeM3txESPhMnYQ3xEZe2H41AgmIM?=
 =?us-ascii?Q?gdusZL5c8QCMbVcd+Qva9oK/osRrJ0I5rk8L/6GNPu/ZD+yGIVnLAb5RSpai?=
 =?us-ascii?Q?EWD10rjjK+srORuyYAAppJJG0VrLdCn02eXsGSNc063ToM46kM0ovfo46KNI?=
 =?us-ascii?Q?VgeHHRoMXgv2swOIdLC174OS35GIHH9RO/xQOfSZikSkysAKvJzznsaiOvDP?=
 =?us-ascii?Q?QpHsS00q+uTN41wlQLPRhPueeKw+qMSywkpX4PIDadEVg/bUy2LB8OoDQAd9?=
 =?us-ascii?Q?a/2Gek/sHGxrms8e+wU2kzrSVa29Z/YX5+ViU8vTu07w43zFuW4ChQTd9NnE?=
 =?us-ascii?Q?DZeiI/TOAdvBsaKUxQ5V3lH0N85ZzrbAfXposqC78p7Hv2IxYkb/PVzNAQXk?=
 =?us-ascii?Q?EFya+NcDlnx/h8qCT9tnqeoWWSoY4eOzFY2GFju7DJeGCDYWnwdRahBhiEbR?=
 =?us-ascii?Q?XH59Y4YLNbhB2HhydjYQHMyKmRib3ga/HVPikIIb4dsQb+sESxOWiU/EWf82?=
 =?us-ascii?Q?9/n/TpJCqMT8JON2a1ZDrDadXSlwMy5XeQrudlrNY/u9EMph5dkGWMoKEEmp?=
 =?us-ascii?Q?l4W2aJCsnJD1kWtyeffLw1wPR9PwsKf5fJ4V7rAM9WhlIIzE4M8VCyj/iUCI?=
 =?us-ascii?Q?zHNBcbBzdg+SQuPqTCwSjHVevgmBVhkuGyQBcqJFr6U7YPMBrYfp0ccw0pi/?=
 =?us-ascii?Q?HGQYguKtyri7I8HJKkjGU8rGwzfbHVgHtDREQoeNyZxpONQQgEYYExRMV2im?=
 =?us-ascii?Q?fSOLSHxQQyFsEhT3ZNIOE3NgoEA6GuVnkZ19xwEtyJ9LTB2ojmTUBhyKZxH/?=
 =?us-ascii?Q?lCQ0t9ZvlO5o27gby4TkDnLKdxwPP2M5zPuzUgrHMUabkd4k4L9aGv5GarYO?=
 =?us-ascii?Q?svwXUNkXuHs3ztH3bFy1pdpaPIj/XRN/XC6Ha/tJaw0Crb7uxTvvKHqTVOJ3?=
 =?us-ascii?Q?IKpKZ/o+7mTphTQZN9+Cnm/UaX2aN150X9NefVlPM4uVromiBOJMxviDGy1+?=
 =?us-ascii?Q?9/BlT6kSCw/5ijjfPZKGBk7aldKaY3MuzcXs0QWEbsq0V2aAMcvIMPNkmMeh?=
 =?us-ascii?Q?9LJfbxwf0baBLo6niGvIczmObortjD6BiucZj/A0+XfkyFXIzGzPGuQYCOwL?=
 =?us-ascii?Q?FYFULiGoZuXDwHo=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 18:14:41.6459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f5260a-ca53-4444-84de-08dd50481d6a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_101449_757081_7471A421 
X-CRM114-Status: UNSURE (   9.82  )
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

On Tue, Feb 18, 2025 at 01:21:20PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 24, 2025 at 04:30:43PM -0800, Nicolin Chen wrote:
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -1051,7 +1051,7 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
> >  			cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
> >  				    STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
> >  				    STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
> > -				    STRTAB_STE_1_EATS);
> > +				    STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
> >  		used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
> 
> You also ran the test suite?

Yes, I enabled that in my config, and didn't see anything wrong:

[   10.832738]     # Subtest: arm-smmu-v3-kunit-test
[   10.837549]     # module: arm_smmu_v3_test
[   10.844208]     ok 1 arm_smmu_v3_write_ste_test_bypass_to_abort
[   10.844339]     ok 2 arm_smmu_v3_write_ste_test_abort_to_bypass
[   10.850507]     ok 3 arm_smmu_v3_write_ste_test_cdtable_to_abort
[   10.856669]     ok 4 arm_smmu_v3_write_ste_test_abort_to_cdtable
[   10.862934]     ok 5 arm_smmu_v3_write_ste_test_cdtable_to_bypass
[   10.869200]     ok 6 arm_smmu_v3_write_ste_test_bypass_to_cdtable
[   10.875550]     ok 7 arm_smmu_v3_write_ste_test_cdtable_s1dss_change
[   10.881899]     ok 8 arm_smmu_v3_write_ste_test_s1dssbypass_to_stebypass
[   10.888512]     ok 9 arm_smmu_v3_write_ste_test_stebypass_to_s1dssbypass
[   10.895482]     ok 10 arm_smmu_v3_write_ste_test_s2_to_abort
[   10.902457]     ok 11 arm_smmu_v3_write_ste_test_abort_to_s2
[   10.908355]     ok 12 arm_smmu_v3_write_ste_test_s2_to_bypass
[   10.914263]     ok 13 arm_smmu_v3_write_ste_test_bypass_to_s2
[   10.920269]     ok 14 arm_smmu_v3_write_ste_test_s1_to_s2
[   10.926267]     ok 15 arm_smmu_v3_write_ste_test_s2_to_s1
[   10.931900]     ok 16 arm_smmu_v3_write_ste_test_non_hitless
[   10.937536]     ok 17 arm_smmu_v3_write_cd_test_s1_clear
[   10.943435]     ok 18 arm_smmu_v3_write_cd_test_s1_change_asid
[   10.948995]     ok 19 arm_smmu_v3_write_ste_test_s1_to_s2_stall
[   10.955074]     ok 20 arm_smmu_v3_write_ste_test_s2_to_s1_stall
[   10.961244]     ok 21 arm_smmu_v3_write_cd_test_sva_clear
[   10.967419]     ok 22 arm_smmu_v3_write_cd_test_sva_release
[   10.972941] # arm-smmu-v3-kunit-test: pass:22 fail:0 skip:0 total:22
[   10.985141] ok 1 arm-smmu-v3-kunit-test

Thanks
Nicolin

