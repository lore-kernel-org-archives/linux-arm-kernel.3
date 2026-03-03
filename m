Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539EAEDEBF2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1MTAzHF7gld8iWn8VNVxYPyf1UnwTxC9cHmtT2ONOXg=; b=TtgAzLZMc5z6eX1jKEnnN+845N
	DmfZY8krDJdNT6nZn4FF7pboZfGaG96dWV0zRC37uuoTrs8T7LmNlNwpi0P0+jIh4zCVkyS1ILR0T
	sgMLVUNmh1+CqGE5ITpoqvYCd5X50cfUMLOTYq8XC4YxvCMYHdsp6z3qr97bLbA4uy6U11SM+QBgO
	Sl87Qm/62yP5jlofvBmiGOvvrDtXbHhRa8sRnvalO0MCm+pjTvrjzWlPolqWQVuScNFyk8zynP4R+
	Xg0L69btunC1gXRB+WKv7V0WQj4p9pPkS4evbo0VITyY7Qpg1L9EGbY15pleKfwGvYnz7xMOZefvu
	elBRvR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxW80-0000000FtQK-0zXN;
	Tue, 03 Mar 2026 20:14:00 +0000
Received: from mail-westus3azon11011005.outbound.protection.outlook.com ([40.107.208.5] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxW7w-0000000FtN4-07eb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 20:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qF9o1K9BuLDxB3286AcZk9YCDSbH9DAqRfIjBhiJwWZh9bAKifkPshV0oQBxtZ+ALE5FZozG86nIAce3nnAYNjTZhyeRglCCacYlfrjTeYmtzOo5SHuvSmsgynEaTGyRYoUInO8Z+ZjFdFI+aCaVXPMY5pMLgdgfIXPQvDe5Bu2LXQS5lUmMDAZumqkYbW/d+XCVFXqzOcwCeXvVi7pLOEphEm0rDVqLGGoEmMYXcpMDSN13gkp9cYoXRuunJh9/xh/R3oelv5WyZz1RjooAhcjRCDRFTTAkq6+QgKQwYJXvVRt0bD4PEVFFgCpYewdMU2/O7HIlC+XgUdKISsShjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MTAzHF7gld8iWn8VNVxYPyf1UnwTxC9cHmtT2ONOXg=;
 b=VWhS6kVfc4h6KOg4aKIGtuMW8cvBhM49kIQZ9QpwsgMRXLT8kMzzRrrchEcgGfi7SKAAhSvVtkOTwAoDKfvyOVW01+vqgbKlKm/g1AERH9KTTIek00HuoC0IGr8C0V8V9VJdgTkSjUJ1KqF8TklR7vv/+14iE+SkwSY4qVqSsJUZg01LuP7Tge1RIYAFRYoc53gSYo1JGaQ/+iTFl9dgqVRjR6bcG3u2Cr+mAj7mTLIzT3wPIbyWqpr8HmGcsHaPMlqLVvnpgBTnaz3ZNng+6Azf4FcTC0wcSaCly9fzvVYl+9FrJaRYerjZwGeHbdzCUZkmtpfz2gRWKwk1tralbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MTAzHF7gld8iWn8VNVxYPyf1UnwTxC9cHmtT2ONOXg=;
 b=omovecm0Kf+2Y+8H+fK1LBqyhzNiyNwxOiJryCNRRO8lMCvHQANibUzLKBicBI8rDAatOh96Ul1qpuijDh2xwZFjVjFg+tYsBAFrPti4mYdxm3h/Q3lflVwgvH/oPEdvuKyBwfiqy7z7fw+suaT4DsIJNh57kKkxvKg1pAiTw4p2rAqrGCZNq1J0Vq5wRsSF5+AISU4AfKzA68P4G+jyOTN7aj0TEOkKOPveDCcRZnixLYSl139/OfHJbAkhIUFL5hfiK4HkgXL2kNHD1IdlEXx268pAjZkr0kNhNgewXrPqBM6ufV8jItjQNRB+okvf7RXg0EEdAHGsioRIGpgl4g==
Received: from CH2PR07CA0042.namprd07.prod.outlook.com (2603:10b6:610:5b::16)
 by SJ0PR12MB6968.namprd12.prod.outlook.com (2603:10b6:a03:47b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 20:13:40 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::43) by CH2PR07CA0042.outlook.office365.com
 (2603:10b6:610:5b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend
 Transport; Tue, 3 Mar 2026 20:13:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 20:13:40 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:13:20 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:13:20 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 12:13:19 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <praan@google.com>, <mmarrid@nvidia.com>,
	<kees@kernel.org>, <Alexander.Grest@microsoft.com>,
	<baolu.lu@linux.intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RFTv1 0/3] iommu/arm-smmu-v3: Add PRI support
Date: Tue, 3 Mar 2026 12:13:04 -0800
Message-ID: <cover.1772568590.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|SJ0PR12MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: aded358c-f9e7-40f3-22b9-08de79615c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: YGH7XyXkRrRRIWZCPECD/rZS95l3uRDtSNjXLdL2yG5fwyHoFh3qP6ur+AEenus2IaE56jJ4jNisllZqNWJ/ohzFD1PXFbvWNMnSEPnR7ctTfsyr5cHU91dntpc4ZoJxCW2fBuUGg7yyhAnTmb2YGr2x8gBTRUd1UiYU1lOjzn82dncIetfmUyC4aC6D4eILv+wMyOllWVxoOeIpwlVE9kfwrzX3jA5PK+iYTlahYGqzHucpm3pC/OM5s6dSjXrQFEeFvt2p1FopgUb38OZU+5f7AfbPQSbBNW+9Pks44R3a79vD0LxQXNdlpLT6uTg9YLGly8K6hl/jq1UU25RVDfbg1IgaZ9M4p7p7xr9ErG6OH63A2GuxIpgTHMom9LK87BF2MpH5Ipc9mRkFkwpm27iVT6F6hhr6lHBLKK6Hc7p0FY77BDoF4T3IsUt04+Vze0bvvDaUIEp48iLamK2/KFE6gAR684ctgt1n7PaANBb3R5ZJJqZiK7+CAR3XyAAIZmorMQgRzOQ4dM6CFGymhzVPkdhcPYT51xSHHftYCjzPkr9JwaIah7jVNO9Ge+0OJAw9m4cer7wO8DBez1TrFbdTULGHaA0EsUYqBufIdgNsyzRb+mz/BKGtmWWJudHkvAylkklzLv6CUJ50T55AuaEGhCg9yt14Nt2HN0QpdTjl37QTvtXX0Q9QQAbxM3a+shM288VEyWcvzKH7/9UQXzcLXvd6EAMHNVT5fnramyUauJMEgJo/d7GAA1KPos7oDw5LBUPWJIJ83Flbs3PQ9eNnHNmPzGPoYQCLov1+ZvTKBGHUz60H6SoCVAmsN3JGjNUlWQw4TQbTPjjxv92TNA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JX7srePCzayUEC2wpZJP5BQQNcUXaD7RXAC0ckdYkHUmdKTrDhv67MXTVUU/3FBv2rzwuq1hSpmCrDIotCdirtiec9wMciA5QpnF5NFdAS7nCQi9yWjPP2tV1hpD8UbfV0GmYv4LinWmLmfkhaOI+OOJMh+gN0R+R1pBaZPW+zPsKpZzXZj3r6MAs2/TVIfp/vy/qOWvRrjX+tT+SXb3u2uwWm34eQmh6lGwkF1fZEht/TuPbnJCi9vJF8OByNWyvH5Zf8kl+y2blYgiDVzQGkd3ja1SDpJ5aAJMeGFzANJy+thlqkJTX7+rGx/2+BPnt6lo1rTdx2ifb5G4L/ZCxFQM/22Xxz6LMWPZBwWf/0PE8xMbQeTSVt9+LiClyV47nnDE2EmVxIw2z0vbOv8hnc+1IV+q0SAf9Oh+EtmcLkLALpDZg6BExEb+PKUWAyEh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:13:40.2677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aded358c-f9e7-40f3-22b9-08de79615c86
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_121356_079323_A7752252 
X-CRM114-Status: UNSURE (   9.52  )
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

Due to a prior lack of real-world hardware support, the SMMUv3 driver does
not handles events on the PRI queue nor respond to IOPF faults.

NVIDIA has introduced a new SoC that supports PRI, and other vendors might
likely have hardware requiring this feature as well. It's time to fill the
missing pieces in the driver by leveraging the IOPF infrastructure:
 - Convert PRI events from the PRI queue into iopf_faults
 - Respond to iopf_faults by issuing CMDQ_OP_PRI_RESP

These patches were initially written on an older kernel and lightly tested
on NVIDIA SoC. I have rebased/reworked them on top of v7.0-rc2, so further
testing is required.

This is on Github:
https://github.com/nicolinc/iommufd/commits/smmuv3_pri-v1

Malak Marrid (3):
  iommu/arm-smmu-v3: Drain in-flight fault handlers
  iommu/arm-smmu-v3: Submit CMDQ_OP_PRI_RESP for IOPF event
  iommu/arm-smmu-v3: Support PRI Page Request

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 135 +++++++++++++-------
 1 file changed, 86 insertions(+), 49 deletions(-)

-- 
2.43.0


