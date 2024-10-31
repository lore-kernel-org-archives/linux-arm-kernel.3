Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44AFD767D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cL53IueEP6hvRhpDtpjzOr68xizZVzXf2tQAV4NvcsM=; b=UDtSrsB9gS86YsfTISm4OK2POb
	/wm4vvdZNrjcZASN1OR3ASJ79p63dvgJaFXx7JosoVyzVhbFIFP95oG0/hxxmI7wHRsbcXrowrOM4
	1BViBycf2nfNN4wS6eNMcHPJsVuam2QfRK3dkkycXD/f6xk8zoqRbrHMgX/UiTgTuWjmcTyW8s7cF
	NvMtbz8rcmO047tTJJEPOCJPm0RVk6TmDqk3D89gvR2fyMxtoLKakPDtKl8e1PD5Qq71RvKpOn71d
	vNoxgEtHz2FThDd82v8cmUG3quzpI2iQM81rrTDXAc3hRRDhHcRYfqZhEZGOlPJeevW2hqG0WGPuM
	mGv74R/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W6o-00000003nkI-3YYG;
	Thu, 31 Oct 2024 14:25:10 +0000
Received: from mail-mw2nam10on20601.outbound.protection.outlook.com ([2a01:111:f403:2412::601] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W3Y-00000003n5v-1feY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:21:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXuKCLRZD+dcUMCIrlbAPvm6qiBXK4sANXFce570Y7yLM6VCwzXiBA1dsdxoS2OECKMdR4o55BJ+UQ7HkpbHKhFPxgsxtfzx0dpMikTCaPhcAmqR0cIYBQyln1uiC7VbVHYMHLOu1NQ48IZGMaiBvFcBkMa6XOQgImQVVPjYhZ7fFygZFc//IVPLPsLbIuG5qjGDzGqSEgon5wurdrCva3KaEVytaLt89HCoEj2mgTHFsuegTIESuBnpt2kWDPdjA8IYNLXDQb8a7CST53C2Ms1OzI6vtrzbdtQe6+hkn2/eFWn9Mwm4pkGi6PrkYJ9H98dGmZUc6An6JAVhxdUHAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cL53IueEP6hvRhpDtpjzOr68xizZVzXf2tQAV4NvcsM=;
 b=Oifc9CSZs5yCijihDGUphhX9IDgKmJScdkEQcyrdg7iRjfAM25B6Qkj080xXoT2jzAmFkmupsNQIaWoFiLkCI80KvOG81fmh1UeK/5v8JWE05bJM94JQFjfy6nt2pTcsNUKM25S9bGE645EAJiMgbG6uVLIW21YQHMgjw6WKdCOpWmyLklj95ZtCljoUKT1rs+WkNkRbB80HfCzqB9T28cFI0OXfI3scgHK1QGOFkrwe136dj08Cycfq6iSOyNeL+WdHyOw3JYeajRzJ8rHXcMk+7bK3hUtU++uW0jKgEP9bOttS/aqHv2miOYDh35z/O5EQjZUcxoytmj0bInKErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cL53IueEP6hvRhpDtpjzOr68xizZVzXf2tQAV4NvcsM=;
 b=HKnksQ480q6dSCfKx7EQnW9XEMXJscAa6zr5GevNJpFdv/XXlO4iFi0nEzYqV4ak4YRox3awAhJjS3t5XFnCLrCMRZxwlv8i81xZt534lvIhZ9fkSghWHGQrtOsP0zNCm2YeGNmLfU/M6YgeydK0eU5H86dSwNg45WtQHA9BP4UYFIyNgeiVayyI4A9CD3JZbqV7YhpT/c4tgiq999v4bwfi2I5YcqpFBn5Sn0jgVK1VnUp0Bs5qL9sHFsJVvSc61bR9CLDtPDLuD5hubL6/Rh06lzOl02xz4vfREnD5PSaZ1y/fGKp4ruMPQ12Ag6u5FMPj6KbhfNd7ivoq6pmzGA==
Received: from DM6PR02CA0154.namprd02.prod.outlook.com (2603:10b6:5:332::21)
 by CY8PR12MB8242.namprd12.prod.outlook.com (2603:10b6:930:77::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 14:21:40 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::4c) by DM6PR02CA0154.outlook.office365.com
 (2603:10b6:5:332::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
 Transport; Thu, 31 Oct 2024 14:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 14:21:40 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:25 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:24 -0700
Received: from build-bwicaksono-20240327T112120892.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Thu, 31 Oct 2024 07:21:24 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <rknight@nvidia.com>,
	<ywan@nvidia.com>, Besar Wicaksono <bwicaksono@nvidia.com>
Subject: [PATCH v2 0/4] perf: arm_cspmu: nvidia: update event list and filter
Date: Thu, 31 Oct 2024 14:21:14 +0000
Message-ID: <20241031142118.1865965-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|CY8PR12MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: d44a89ee-728d-4ab5-8091-08dcf9b75671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g4xXOgDzWrs4Qu1ev4AvfxbQESr6d5w0G9Tp9hb6nk1RWozDRn/v8+1HT7J6?=
 =?us-ascii?Q?Jyw3DVEPoCG0o0Jw/acvxR6fMZZIvV5oLG4NL8t5UIPddxWL5KCUvcxGbh41?=
 =?us-ascii?Q?YcW5Jr8Iw+cIpXrnoHLSJ8/lJkOood/uV0DNiaUtD2cSM5d283DXZzZ0zJAO?=
 =?us-ascii?Q?J/RU/qyO3J2qLql3uERpAEsmglI4PmtNWQex7gfUESkg0cZGWdiiCFrBL707?=
 =?us-ascii?Q?47Jsd0gkDX0oF9g+mrMwv4hW53w/NP9AcH88apL6oeBpyuQzURtigdy+jVnW?=
 =?us-ascii?Q?vvSUr8u1sUjL061GKvOQp+p0DPq5BEE//EnIP+Wdw9gRYOlXm+3BxcSghTCT?=
 =?us-ascii?Q?ZEDCB8yu/cyNJbLcsoFAphCTAROqu0Fjci0OucPUlXArhBMKOGgdNVJ40DcO?=
 =?us-ascii?Q?lPujNONeEiX9e1xV0twQOLKQrE4b1Jnef8nfpwOVSKCyHYNJyxygg3eo6OS8?=
 =?us-ascii?Q?D+/v/xNYZMfwkTdSL5/zLA2rcG7qju2qE7WealRjEcLIFw8IeRfNDVjyBekS?=
 =?us-ascii?Q?JUoP3BuhBn21eT8BfoZWOX8Bkj5SaXA6ZTGykiQyYY3PR+4OQQwPzJE0IgJO?=
 =?us-ascii?Q?gRW6hdsDSCgdMFb/iBQJw+GnOUsBR4yC0lt7yobF8mJWJb8AttUFVCJTbM4Y?=
 =?us-ascii?Q?WpYmv+TAhBegd7XGZpEe/5MQ5b5YMc4u9yRWjkkz9QfhAVAWzcFnWKept3UC?=
 =?us-ascii?Q?IhIWV5/roK4O8vEr3mv4oZUHJSmSdOmPpbwRaHe6t0W0L7/sWhuRFiOPANkv?=
 =?us-ascii?Q?ofF5IsvU4cWYoxd8oxAYx0X6GfGyjp0xpkB5JGnZWYWYFrKqeSCqSkPi2R0x?=
 =?us-ascii?Q?14PN7TDRssQs4f49JGAzUbWbonz9+CtD1vP+94B+krnX9FU6jwG5VFWSHz/I?=
 =?us-ascii?Q?HnQgwThjrM9jOXICZHNF5I+1GDKp3AHOFSjZGv+QoCaxfRPi0j3CpqSWeSam?=
 =?us-ascii?Q?o1+3h8uFPOl7G5GnFeFFwN7qzvNq1V84JNhyVeptXNfcl7x40c7EcS5+PJNe?=
 =?us-ascii?Q?u2V5i4nk9bOgP+SDoWmGQva8FKfZv7DVL/k3jnbl5s+NLCH+LxIS72oYokMV?=
 =?us-ascii?Q?461riBKwrlyUqx3XkpFD3RFjEWsvSL01vhxcOqFuUpou6lCfHi+dPFKgoD8O?=
 =?us-ascii?Q?WB7prv4Hn7pPbsGRSzwkoyAN4kUi+XZ81uj49ozl/cYHtHuPyX8XLk6EqWQd?=
 =?us-ascii?Q?dDAvICqEaCZeD9CUj2CkWBN4K56J0iua335K+hBxSTXYgmMe/CBrHgVA05iH?=
 =?us-ascii?Q?9+RGZCm2sZkIAFlq02b7AZ1D/s8ollkstj0obRx6hP8SMxLQ49I+7syRa5I2?=
 =?us-ascii?Q?Uo/1g0vpyeiJDBflclXAoFp9d84i5ifIoEIj5Arw6tilw0KQiVs+HFjx1V8z?=
 =?us-ascii?Q?04pb155r/YZbCewwLAd1gPWP7IDphdzO02YXjo8BQcC+aJt83Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 14:21:40.2034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d44a89ee-728d-4ab5-8091-08dcf9b75671
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8242
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_072148_475468_EB132B61 
X-CRM114-Status: UNSURE (   6.69  )
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

This series update the list of supported events and filters in NVIDIA Grace
CoreSight PMUs.

Changes from v1:
 * Split the change for setting default filter value.
 * Add new patch to fix NVIDIA PMU sysfs path in kernel doc.
 * Drop the patch for CNVLINK PMU events renaming from this series.
v1: https://lore.kernel.org/linux-arm-kernel/20240918215846.1424282-1-bwicaksono@nvidia.com/T/

Besar Wicaksono (4):
  perf: arm_cspmu: nvidia: remove unsupported SCF events
  perf: arm_cspmu: nvidia: fix sysfs path in the kernel doc
  perf: arm_cspmu: nvidia: enable NVLINK-C2C port filtering
  perf: arm_cspmu: nvidia: monitor all ports by default

 Documentation/admin-guide/perf/nvidia-pmu.rst | 52 ++++++++++---
 drivers/perf/arm_cspmu/nvidia_cspmu.c         | 75 ++-----------------
 2 files changed, 50 insertions(+), 77 deletions(-)


base-commit: ad618736883b8970f66af799e34007475fe33a68
-- 
2.34.1


