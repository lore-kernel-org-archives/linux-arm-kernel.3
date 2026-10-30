Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0655B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O+b24QtM;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=flNDkKyH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oEUkhLQ9hiwnAz7jBimcklLa0OaqWnfTgyZa3o1XbJ4=; b=O+b24QtMxjI2Mh9MEC+htzqH2q
	F3jNt+waoxRQWYLR8Q2xZYjGaTLOPX1tPV5raM7En/mJX8dYd6bSdvfV1zuoGna5QYvPgcJoZfBjf
	rzxHRxEMK+DWbBuSbK7arCNaquV8pnutttM08NIRyCEhRBqlriYMtfdd6ceERR3xehdKzs7PyW5eq
	yTvXwuKCJ0oVyX/6BH2isxq1tbK7eOO2EK5yZHSVWchNkJ6GlsgUeCK1K8ZNBbtj6aWz2NdBSRjUy
	8kvL/0p7zbtf0aTSTbUhp/tDMGbViJp7yNBjHdXKsZX5HM9NTVrXIw9d+7KUq9MzkIx+c0Us7weEq
	xDJ5s1IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqj1-0000000CISj-36SU;
	Fri, 30 Oct 2026 17:49:11 +0000
Received: from mail-northcentralusazon11010071.outbound.protection.outlook.com ([52.101.193.71] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqiw-0000000CIPf-27kk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWu6VpoiQh72N+ZUwMI+0nC/JSVyC+PSVYEkGSIjq0F9rJFyRue65ev2mfPBNzjQWibFze1zqCIgr+LdBiObK5CmJ0MpRcncRMRkdeTG+FQXqczpU6QXz/n2rJFoSYlKH4o3xVG6QV7VPMJOmnQPyXCRhZ1mao/UddJj7r3qq58sdGdsUQ0NXQYkj/0X/Q1CwDqKVnqlWTmuSjROfN2kYNgdrSnweABy4hKNDeY+D9YR7+juLbV1u2TzRlPkvZjYjoAKqftW69B7q2ng3f6OrX+dHGPrqr1RWzYJ2Jzkqx/1sCgRTI66FCZwSf7HKxAf4YQHlu4xIaF+yvbYRRDo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEUkhLQ9hiwnAz7jBimcklLa0OaqWnfTgyZa3o1XbJ4=;
 b=cjPMA2Sl5a7G0DjpbJLxVmpCwQe6UCcNYnzoiWvrcLctr94J4wMejGaGoiUxyAHVTJMAd1HUWzZrJzwJF4YiL8iV2C7TM32z01/NQiZI62afNETNiEJIGlJfyUTkZWO4Zs7nfidcC0zLtDSwuM0DxJyUHVTqCTKYuncZUPSnc/KWbsPGw336601jRmlbyO9EqBXZUgTLNOHP31U5eCPaNjcm70EXwPGG55iBgHXThBUyY2gOKLjCkXID64Vo2Gz0HvQmWbGAhr3Xb2+C5x+FIrn+l0eXAvJaD74Q8+4jM8Ce5QoeHlhz159AKjZWYK4WoX4bGDWd689TSUigOLFCRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEUkhLQ9hiwnAz7jBimcklLa0OaqWnfTgyZa3o1XbJ4=;
 b=flNDkKyHuOBlX8wunqTPjcflGW8QkJSopoYt6/T/GaBTn7wdyBbdTZ/VFi7j1EKym1IjdbalQRS4YcvhMZvZ1uYxVlroqfOJaC/yh/yhNjALh/4HSd2xExP57/f0IfTQ68nYN2eKrNgyNYyApHlZReBD0bE+u1mzYpywYPZzOg9pspfYvvxNaXzXfmDvQJ0UC5EcCim4TSCykPZJ2jivpIFQdF2l9/YYLm5rOrbUteRMwOEEhEd0w0GDEBRvFoddeAM8YFu7n8btMInYwbXO2T0jX09gdEB9V9MXhlmygots1zzPCpE1S0pVOz68MmonC2sRkIjPliXcx6as6xFOfA==
Received: from BN0PR04CA0057.namprd04.prod.outlook.com (2603:10b6:408:e8::32)
 by DS0PR12MB7780.namprd12.prod.outlook.com (2603:10b6:8:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 17:48:50 +0000
Received: from IA0PEPF00000045.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::7a) by BN0PR04CA0057.outlook.office365.com
 (2603:10b6:408:e8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 17:48:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 IA0PEPF00000045.mail.protection.outlook.com (10.167.249.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Fri, 30 Oct 2026 17:48:50 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 30 Oct
 2026 10:48:25 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:48:25 -0700
Received: from build-bwicaksono-noble-20260804.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.56
 via Frontend Transport; Fri, 30 Oct 2026 10:48:25 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <acme@kernel.org>, <namhyung@kernel.org>, <irogers@google.com>,
	<ctshao@google.com>
CC: <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <skelley@nvidia.com>,
	<mochs@nvidia.com>, <rajjoshi@nvidia.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <john.garry@linux.dev>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <adrian.hunter@intel.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v2 0/9] perf: Add NVIDIA Tegra410 uncore PMU events and metrics
Date: Fri, 30 Oct 2026 17:48:07 +0000
Message-ID: <20261030174816.1544471-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000045:EE_|DS0PR12MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 898c4bba-39e3-4a93-9843-08df36ae0e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|6133799003|18002099003|3023799007|56012099006|11063799006|5023799004|261026140227099003|261026121527099003|261028144727099003|261021123027099003|10067099003|261021121427099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: fqrKS87C3uko3V2qhx4sdRbGZLOjREOwyrIcCjmn/ONS5Qg2Q3XiHKtwm21DuOP9hn+3f2jzryPcn0/pYv9MNbLOsomGaNM8Nzk/CD4XpJ/L88q0o5hDezm3qU3P7u1tzTmv2wKEvD/HMYo3+KsFwGXkPdIDzCoguwrvJlW9Evo9fzZAbKY8aC+jKizdzrJTkw/jGoK/1mtk+MwDvzDP1+u2+rkRYxLDKe4gFkJFr0EeM9vwqhqjajGZBeaBK3c+5aGcwZaCJxg2OW6/4D76Mq9geGoiXEeQOT976hayYELO83/bTs2DGgx3+CoRnpyw24mISGPDn85v6T4IjrZopmpnleyMZxkw5Q/sMo6t3NyMXOsM/WJJbI6rZ+NIoL2k1oXhCQ5UmOmlRpZRA0BZgThX52S5l8KwHZvBsOenzoLEnV5X7lAoKjQLAHbpdWmwjq7LMh7mjFxkeD9N/tvJUmD/CsCqGMuPVGWgwB76aV+QY/cGCJVA5p8mOQw6aFrz72Bguj5brp+KEuYvX4U2KAMaXtR8LiIWCjQRhGoht6O1/3n1AbTir9f7xz7elDsZ/tT0+sm+rtpntuUJ8rEVwXcEEGvtmuev1eLO7oPtTciocXeMiA+M80Zq3rDIR2+8EqV8sjkPFKGpgPrAL6+jZMzhlqh8/ursFSUxmpWnGHNw0Zoja9kuSG6lW5gxdZGuLLg7K9Kr5+bUvXzZon6QKQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(18002099003)(3023799007)(56012099006)(11063799006)(5023799004)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(10067099003)(261021121427099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NOzfKPdrYR8C0OTUbsCPGZ2oaVToUxW/P4+O4GYLiWRug6WxJRLeZknswAmkbWhG3AZL4bNCaYGNcfdFI5zP/PdoZzl5mlkmgybzsrsiwakZ+5/ems7Jts54JET0OsF24GqCpKQWIs4aWL53l1vgusBoo9p8jZGmDovTC5Alj25ufpi6zvYbtH/497veUJHkTLC0/Bi2Tch/3v5M66q+ddsuIDj95Ye+ee9HzkBkoY7xXs7JOjl2bLcMSiGv7xoYitloF4tMX21tp4Qz6egQgac7sxB6TfxGedj4bDPVVuqhKJCv0y2xBDFvwyEhMuMDYcqw5GddLmOe2+ClQuqkm807Ud7sUeaOjca4XtXXXeSQEQlQB4Wk/7g8wHLYwkpK3BV9s7rVLHws6mVyJAQzmCcs/7DD1tY2zFxndRm5dB5/Jea36KDLcYciYAgLndhE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:48:50.1338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 898c4bba-39e3-4a93-9843-08df36ae0e5e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000045.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_104906_787800_979DAD8F 
X-CRM114-Status: GOOD (  13.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
PMUs, and fix perf's aggregation of PMU instances that are numbered in
more than one parts in their name.

The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
chip-to-chip interconnect PMUs. It provides symbolic names for the raw
event encodings and metrics for bandwidth, frequency, and average read
latency.

The PCIe and PCIe target PMUs are named nvidia_pcie_pmu_<socket>_rc_<rc>
and nvidia_pcie_tgt_pmu_<socket>_rc_<rc>. Their json Unit uses the
existing comma-separated form ("nvidia_pcie_pmu_,rc_"), but perf only
merged instances that differ in the trailing number, so these events and
metrics gave one result per socket and were reported incorrectly (e.g.
with --metric-only), as discussed in v1. Patches 6-9 fix this:

- Patch 6 adds a check of the cpumasks of all merged PMU instances to the
  zero-count skip in perf stat, so a socket that counts nothing shows 0
  instead of having its row hidden.
- Patch 7 merges PMU instances that match the same comma-separated json
  Unit. This also applies to the HiSilicon hisi_sccl PMUs, which use the
  same json form; not tested on HiSilicon hardware.
- Patch 8 labels a merged uncore counter after all of its PMUs, e.g.
  nvidia_pcie_pmu_*_rc_*/cycles/ or nvidia_ucf_pmu/cycles/, instead of
  after the first instance, such as nvidia_pcie_pmu_0_rc_0/cycles/.
  Output with --no-aggr is unchanged.
- Patch 9 describes these PMU names in the ABI document.

Changes in v2:
- Move the uncore JSON out of the sys directory and remove the
  "Compat" fields. Thanks to Ian Rogers for the feedback.
- Drop "perf jevents: Process model files before sys subdirectories",
  which this series no longer needs.
- Add UCF SLC and memory bandwidth metrics from all sources to local
  CMEM (read, write and read+write) and from local sources to local
  CMEM and to remote memory, PCIe bandwidth metrics to local
  destinations, and read+write bandwidth metrics for UCF SLC, UCF
  memory and PCIe. Thanks to Chun-Tse Shao for the suggestion.
- Add patches 6-9 to fix the PCIe instance aggregation. Thanks to Ian
  Rogers and Chun-Tse Shao for the pointers.

v1: https://lore.kernel.org/all/20261019164241.403644-1-bwicaksono@nvidia.com/

Besar Wicaksono (9):
  perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
  perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
  perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
  perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU
    aliasing
  perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
  perf stat: Check merged PMU instance's cpumasks when skipping zero
    counts
  perf pmu: Merge PMU instances that match the same comma-separated json
    Unit
  perf evsel: Name a merged uncore counter after all of its PMUs
  perf Documentation: Describe PMU names numbered in more than one place

 .../testing/sysfs-bus-event_source-devices    |  14 +
 .../arm64/nvidia/t410/uncore-cpu_mem.json     |  43 +
 .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++
 .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +
 .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 +++
 .../arch/arm64/nvidia/t410/uncore-pcie.json   | 249 ++++++
 .../arm64/nvidia/t410/uncore-pcie_tgt.json    |  83 ++
 .../arch/arm64/nvidia/t410/uncore-ucf.json    | 764 ++++++++++++++++++
 tools/perf/tests/pmu.c                        | 134 +++
 tools/perf/util/evlist.c                      |   2 +-
 tools/perf/util/evsel.c                       |  83 +-
 tools/perf/util/evsel.h                       |   2 +-
 tools/perf/util/parse-events.c                |   2 +-
 tools/perf/util/pmu.c                         |  65 ++
 tools/perf/util/pmu.h                         |   9 +
 tools/perf/util/pmus.c                        |  47 ++
 tools/perf/util/pmus.h                        |   1 +
 tools/perf/util/stat-display.c                |  20 +
 18 files changed, 1737 insertions(+), 6 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-cpu_mem.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvclink.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvdlink.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-pcie.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-pcie_tgt.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-ucf.json

-- 
2.43.0


