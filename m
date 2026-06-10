Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1DCCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 07:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpBvpmCe4WH0pO0hg0uZk2zeEEhtNXDrMWMFRarIwIg=; b=e5Ls/R/zZx4nsL7EjI4ILs/2MW
	Vro1xld87W2ZqA9J8RzGg/fP1oSsXh3+FJQUHLWTJQ8MCbjdbxKFlEXsNEFfrh2ajtG1ibAH/4CXh
	fGL2zmxWzyyOxybMm0ve2LZx6vn65+9jvywWtUchdZoq6PRYKWMDEkQ3CC2Nuv/7t+BxHe+Rzccqa
	mt3wpGHv8c/42/adsDzxooRJy1fLTI03IRij1Rh1wEylvq/BKmso88p8Ul2RVu4al8ijmIX05Q7h1
	JKuea7nSwE6f7+WSlVf6yv2sr+GoE3vQLWVUv50Kg8ZCzrOGK6qG2S7B1QbmTjM5WO9ceZnjodVju
	uuzmHsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDbq-00000006yND-1xqj;
	Wed, 10 Jun 2026 07:44:22 +0000
Received: from mail-koreacentralazon11023120.outbound.protection.outlook.com ([40.107.44.120] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDbn-00000006yMf-2pGV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 07:44:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DM9rzgkrQWX9msKUehw1c1er16GIxnLo5a5pJfU74pDlAHvLQjnDuMqf4mcM+YePOA4eZ0naxlZRZFyu+LomV8KSJEHmkqIpLhfojDOFDjGyEp5vfNpAO/XjAM6GAUmImuSBUfHe5ZHpSmriMVjh2nITh2xBQyPNSwdNUcVm4dEK642Bsr9/qbVo00MrzA39f5wkh8iWhDczOptsaRsB9ks985qh3rX/0N7EX/dbBUd67al7pe6ob4RG7E4WmZKf5CkpEpXQNj/NxabaYlurOd2B6OHn3h+/1ntjKIGPt0zZTLjHKt6FSphRHCIPnYrRhHG4BGKBQ+cxZBywVWRwzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpBvpmCe4WH0pO0hg0uZk2zeEEhtNXDrMWMFRarIwIg=;
 b=mPwGsxT6Dj+R+bbdG0ZmrkXfNFJZY30egaalWlNojCBfNzfpk23eNzdQdsmGvXs9liHM1EqNnMOVY6ziJxVsGEvUKt6JPp2eEKFMlYl1tSmeaTEjaVtji0YRbEl0Jaex++0Nw1xrmDVk+fQCILU3AcLENkVO63az6W/S+j4ZaDEL3K7aqW5gVX62T/Cr6193ZoQRv6UVY7RVcMli/SC30QiowT1jBBOHG2Y8BXlWUz1cz2Y2kLp0zLGP98foVL5sem/mpHd6eJL59YWTORZNBpIaHqu7iwmWjPCDIdMsM64N1Lwxvvfx5c+xVF0M0GyqlQs9yChMctu5R6uOWnllIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4PR01CA0066.jpnprd01.prod.outlook.com (2603:1096:405:370::7)
 by TYSPR06MB6442.apcprd06.prod.outlook.com (2603:1096:400:483::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 07:44:01 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:405:370:cafe::50) by TY4PR01CA0066.outlook.office365.com
 (2603:1096:405:370::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 07:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 07:44:00 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1456F408426D;
	Wed, 10 Jun 2026 15:43:59 +0800 (CST)
Date: Wed, 10 Jun 2026 15:42:25 +0800
From: Gary Yang <gary.yang@cixtech.com>
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Hans Zhang <hans.zhang@cixtech.com>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	Jerry Zhu <jerry.zhu@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Yunseong Kim <ysk@kzalloc.com>,
	Yunseong Kim <yunseong.kim@ericsson.com>
Subject: Re: [Question] Enabling CoreSight TRBE in firmware on CIX Orion O6
Message-ID: <aikVYZDMYuPscIKR@gary-System-Product-Name>
References: <5d1bdf6d-ed77-4de9-b788-cf04a98d054d@est.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5d1bdf6d-ed77-4de9-b788-cf04a98d054d@est.tech>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TYSPR06MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac86d5c-7be2-4531-6189-08dec6c4093e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|6133799003|56012099006|3023799007|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nESZ/GtQbSQp7ajgWyJfnuC/+xiOIakjlAKr/gJwdf4DkGm2kWL1XvJns0k837ocBnRlBRTbgyw8NVMQwGFsWd4v/YWa3Gv3phOBJidRdoMOywS8s6FVV0wKa7GX4QgawbyP2/i/Z1ZuGRZn4FH2PGwZoktcugoXG1ycYU52JXrZXVmfXo1ax9qHMit1ghU3h5rx4k7UhwokBLgvte/aum32LGAHt08LmYtnX8cuVCr752oSLyrPqptHfliWTRfkTLBFuQ10I/AF9FnG7/DOTU/DZ/nJ8hiuim4g+YyoxCVm1SRtQ1nMFUWYYocWHzolSflY94d8amCqN59AZ1Lubtdrgt4UoLb4a19vxdiAf+BpZ/HnBF2xaCvB9obAHnlJPhsuUelF/wQ6KgM7dJmAy4Q0CsaTc4UjjpDmSshF+g/glco3YfeUURkAE2snJaXyrlF7mbs512n5J8ehpCeVPO6TJ15txkNqP0ePaIrgHSdhF3Xai2P3hqOu8RDMAPVDqtIIOxvJHjfYkIgEJOpcx7ibmNqPefieTXrYm5gq1lXHZTzYj4ZoHFf9/inr/PpEhD/LPqnedvZCvc1cOrSeJ+0Q4kM7t4JaZPJXe6bL4mufwX0VIQlduguhHSFhzoyNXEuo2/TdztWpR6vo8L40pFyFQINILnID/vcoDxQgAbncZrgnA5riZBcecZTlWSGkQdWgtdZHtuVCjbnNmeHVSGoDEevuR6RV1IfUMY4uJBY=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(6133799003)(56012099006)(3023799007)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zLYEWrerBjdpQGlPBQ8vxo+bxEn13P45tiTrcIB6V7tPL2ut+f5+V10TD332/bS2UOv2a3c8haFKFMs8V0GoRqRuBCGsuMYyjr/fjrVuGowZb/BSgoRAH/8NcBXTJ4dmL189xZ89fsM1n9bLsMAfIkgD98iKDMDM1aqquiVwTR28WfchJyKl39CLQ0jyUcvqTwUIN18o/T/oWehvr+a3j/XNLSNCdgWhkDcqYm4NnZmWqwaD9vNv+LBtW+aKJVNDB9LIQ4BMeTOOBVDgrcs31PYQzsrb4Pjy9i4bQa5SRAez93uzA9GKQRhRr0SzXsn991Kx6ZT1vLnVe1TzH3GyEhda0AvxOtl7W9q9wvg2KW0V0b2uyvPcFrkyVva1FJy1lNffA7cksfWzS6DIPV+maYo7QPtpCRHRv9LFyo0vi5UMYmvQzMVhCgx6oC1bF2oL
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:44:00.1241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac86d5c-7be2-4531-6189-08dec6c4093e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_004419_740554_51EA93E1 
X-CRM114-Status: GOOD (  23.78  )
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

On 2026-06-09 10:40, Yunseong Kim wrote:

> [Some people who received this message don't often get email from yunseong.kim@est.tech. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> CAUTION: Suspicious Email from unusual domain.
> 
> Hi CIX team,
> 
> I'm working on vock (https://github.com/yskzalloc/vock), a tool that maps
> userspace programs to the exact kernel code they exercise using hardware
> trace. On arm64, this relies on CoreSight ETM (--mode hw, for non-kcov
> enabled kernel) to collect kernel coverage without requiring CONFIG_KCOV.
> Without firmware enabling TRBE or exposing TMC/ETR, I cannot verify or test
> the arm64 CoreSight code path on the Orion O6 at all.
> 
> I've been testing on a CIX Orion O6 board running Debian sid latest generic kernel
> and found that CoreSight trace is not functional due to firmware-level restrictions.
> 
> Test environment running Debian sid arm64 kernel:
> 
>   Board:    CIX Orion O6
>   Kernel:   Debian arm64 generic (7.1+unreleased-arm64, CONFIG_CORESIGHT=m)
>   CPU:      Cortex-A520 (0xd81) + Cortex-A720 (0xd80), 12 cores
>   Firmware: UEFI/ACPI (no device tree)
> 
> What works:
> 
>   - coresight_etm4x module loads successfully
>   - cs_etm PMU appears at /sys/bus/event_source/devices/cs_etm (type=12)
>   - nr_addr_filters = 8
> 
>   $ lsmod | grep coresight
>   coresight_etm4x       118784  0
>   coresight             110592  1 coresight_etm4x
> 
>   $ ls /sys/bus/event_source/devices/cs_etm/type
>   12
> 
> What fails:
> 
>   1. No CoreSight bus devices are registered:
> 
>      $ ls /sys/bus/coresight/devices/
>      (empty)
> 
>   2. perf AUX mmap fails (no trace sink available):
> 
>      $ perf record -e cs_etm// -- ls
>      intel_pt: aux mmap: Cannot allocate memory
> 
>   3. TRBE module loads but registers no devices (firmware blocks access):
> 
>      $ sudo modprobe coresight-trbe
>      $ ls /sys/bus/coresight/devices/
>      (empty)
> 
>   4. dmesg shows only configuration manager, no ETM/TRBE device probes:
> 
>      [ 4479.881313] cs_system_cfg: CoreSight Configuration manager initialised
> 
>   5. DSDT has no CoreSight ACPI devices (no ARMHC500/ARMHC501/ARMHC97C HIDs)
> 
> Root cause:
> 
>   The Cortex-A520 and Cortex-A720 cores support both ETM and TRBE in
>   hardware, but the firmware (TF-A/EL3) does not enable OS-level access:
> 
>   - TRBE: MDCR_EL3.NSTBE is likely not set, preventing non-secure
>     trace buffer access
>   - TMC/ETR: No MMIO-mapped trace sinks are described in the ACPI DSDT
>   - Self-hosted trace: MDCR_EL3.NSTB / CPTR_EL3.TTA may not be configured
> 
> 
> Can you check enabling CoreSight trace support in the Orion O6 firmware by either:
> 
>   (1) (Preferred) Enable TRBE access from non-secure EL1/EL2:
>      - Set MDCR_EL3.NSTBE = 1 in TF-A
>      - This allows the per-CPU Trace Buffer Extension to work as a sink
>        without any additional MMIO hardware
> 
>   (2) Or expose the full CoreSight topology in ACPI:
>      - Add ARMHC97C (TMC-ETR) device with MMIO base address
>      - Add ARMHC502 (funnel) devices if applicable
>      - Reference: ARM DEN0067 (CoreSight Architecture ACPI bindings)
> 
> (1) is simpler and doesn't require ACPI table changes, it's a single register
> bit in the secure firmware.
> 

Thank you for your interest in the Radxa O6 board and for the detailed report 
on the CoreSight trace support.

The firmware (TF-A) for the Radxa O6 is provided and maintained by Radxa. We 
will forward your request to the Radxa firmware team and ask them to evaluate 
enabling TRBE access from non-secure EL1/EL2 (i.e. setting MDCR_EL3.NSTBE = 1 
in TF-A), as you suggested.

We will notify you via email once there is a firmware update available.

Best Regards
Gary
> 
> Thank you!
> 
> Best regards

