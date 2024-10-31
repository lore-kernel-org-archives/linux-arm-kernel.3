Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547EAD767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sc0wayrCwhBP46xmuHB6xKkAAGt1sl6aBp4pTNM+u40=; b=OMSN7GuurCMw79WOipl0RcXyiU
	qAjxf4cyrh0/oPtOn8qcGUBOMqbz3ow5JEJprz/y3wVK8z4dz4+pLfJObIryOkdAOZ9uHOL13HpWn
	Jpov5utc1yNa1bZn9ovBemZ9St2bDEW+Y78HRpBy9b1bNTCpk0eRjseVOqQabM1zYlfxD+5kQuGa+
	QHaxfgac7EG0AvS3wiBPkPFM0sE7qChGQjnVqDp1yXFkgencv7ltU8h/h5NgE+sutZQKZM++h6sX+
	3wGR06OU4+Wwid2qKi1tNX3oqcebYIaWLgKwXfrgJLhS4oKxcsaGvAHvrCx9ocVWRepPTH9xO2FSe
	8r57CIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WA4-00000003oH0-2EI7;
	Thu, 31 Oct 2024 14:28:32 +0000
Received: from mail-dm6nam10on20615.outbound.protection.outlook.com ([2a01:111:f403:2413::615] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W3k-00000003nBF-3yGg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:22:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsGeHn9kgYQrYuoM9WNNIp8IX11Qes9gO7tEcV/WsZmvkH2yZhEp6Eb+duHXCB7KVp9mlud8ru+yyee7hQoD1kvxIYJdu329lZE/Z8z+E8Zgmouv9dwNgUpRuVo48ctgA7tUdt50XFdKO+XoCV+b/uZsYkBdLJzU7hNqXBNnEitN/pBf/pCehgh3+0xHZo7NNIfrQGG2IBtohjuSV+WAXd7j9lum/aKdkjINAEjuQc1gECD1hMhukFCAti9hXzWkzdk85+HXpBDH+pEXcENBA3F6fYh0sq0wzYsX2G/F+BqvC8ufBIlSpmQFDI6TeTZGx4aJ1Qv6gXr6w5af//44CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc0wayrCwhBP46xmuHB6xKkAAGt1sl6aBp4pTNM+u40=;
 b=yuiag9uuD9ZC3HB8rrNNCvGYsqRRsKdt2yoeHrf11AP1XUjXRx38UtQ4v6TYBIxcsWZ/cmfT+FEIPBsZar0ttsJRVVqnc2G9NvFXkk98IkB6UWigAG2l1kNsMT/TDCXBC9HOj54c6Wdp9qi3iavk9QmhjQDe7kCqRFT6fDw2GdTn+HC1JbnzibgrDAY0j2PdER2rQuBQ940ksIqmWlwMwsp82EOuF864u4ZBFIu+GzZA4NIrte6hXmgPhueRAzqeDUNJ+iQcikxjGkj5e2yS83yx6DNdMvxqtpye0VkIi8QxqRhfj07ULdqrag5JAstaN/9DajTIO4q3QPMD2sIQ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc0wayrCwhBP46xmuHB6xKkAAGt1sl6aBp4pTNM+u40=;
 b=oYE56A4c6ouySqonD2ssRyFrBeYT4I6A7TwpLizCZzUhtL2sdsH3dZlFBfTSdzMdIVKJKESSjSkATCIvoYe+lZ8kPkkGErfkdfyp8WQ/qB6wot54Nr7R2YDc0A3Kmw3Zv3Uu7tNQYqhn12r2SUZxlfK+iIQ0nayuQ+gY18f4IWUt6NYzJTWay3lBasB5M9iJSgdkhGhElTac1JgHlXzlDaaJfKcqIPW8ZLg00Fya4cw+O9+v8zVmH0XtsXaZzNPw4oetUX4dfGcyJLhjCm4vWVXCoXoveDpHb0UFGqsNP+OYQy9ebe+KlTBqt90N3x5GI8pMUaD/oLHJ/PfhHpRqVQ==
Received: from CH5PR04CA0021.namprd04.prod.outlook.com (2603:10b6:610:1f4::14)
 by CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 14:21:56 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::b0) by CH5PR04CA0021.outlook.office365.com
 (2603:10b6:610:1f4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23 via Frontend
 Transport; Thu, 31 Oct 2024 14:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 14:21:55 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:39 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:39 -0700
Received: from build-bwicaksono-20240327T112120892.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Thu, 31 Oct 2024 07:21:38 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <rknight@nvidia.com>,
	<ywan@nvidia.com>, Besar Wicaksono <bwicaksono@nvidia.com>
Subject: [PATCH v2 3/4] perf: arm_cspmu: nvidia: enable NVLINK-C2C port filtering
Date: Thu, 31 Oct 2024 14:21:17 +0000
Message-ID: <20241031142118.1865965-4-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241031142118.1865965-1-bwicaksono@nvidia.com>
References: <20241031142118.1865965-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|CY8PR12MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d90047c-8589-4397-e0ff-08dcf9b75fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GyyMkssJUU0BG8AcPFb+2p+RGFXvvG0hM0oWQoTpNPBDlvhZ7b2cEmOn7iXN?=
 =?us-ascii?Q?K+zEWbzPDWyuzyj9R8YMhLMIPpFfoj5kpI6zl2fwHCgHvfRvxqGXImKNEV0K?=
 =?us-ascii?Q?EnltL8NP+wxY0kYAbRTch+Tmb38WQB2SOGahv4JhttBrjtHd+iy29Sj/MPjW?=
 =?us-ascii?Q?cWWbATF8HoYgrPdX2RIehxtX6tFDc5hfOyEkrgw4nuP3HNRVxbJ7J+FL+jCy?=
 =?us-ascii?Q?wNtrnRBcq4BgxYDDl5LNthwKqSjxjvjJEe/cmPkpqcEP9UhUhMBvuuOhoJKC?=
 =?us-ascii?Q?l2sfNG9I4OxmswViePuP8FB9/pxMRQRB5jiBsuAbnrDyUGyfgGa2GLZj5wIX?=
 =?us-ascii?Q?vAqDMfhE5WvO6KXJBwAeBAJBJYcZfjSWi0cWOCN/RT/xwsjxbbTbNC2REy1D?=
 =?us-ascii?Q?bQs2Q9UYM8I1gy7amwCkKemcQRzNCRMRrrZWXYEE55W0VHEDmyozeaOQ6Jms?=
 =?us-ascii?Q?qX7HG+lIzECjNQOS8hLQ23THkLpA9zEcFooAxk3QgnzbjVHGEYhwD/RTIOTj?=
 =?us-ascii?Q?g5AZMPht0AWfsyuqkcLZRSN2qnBxUiDw8vHh180oOp6b7RDDJ3zCUOw46eeV?=
 =?us-ascii?Q?303xla90uAj1T84bTjyJfqKOmTTJCYvfGevcrUIg/HIzGw2KFFA43l8nd+1H?=
 =?us-ascii?Q?+RlcNCNC501EMKmEngfvJylQ/9HuPJMk3sN99KMxR2hBxfBL+kepDuDBdJRs?=
 =?us-ascii?Q?mXgPQIo1a7nyAB2v4RPCf+VgOVuLyVJZq6XO5QIQwocbBer03WBbijRQZLFf?=
 =?us-ascii?Q?kgf3SoiT9RNzO+Dih9SOVdpihyZYea7cJC0VRr4/cQEqQK/BSYGXuyovAvFB?=
 =?us-ascii?Q?c6LjxQaLT0HJe8+CBqODyQoNQCWvWe/+EsqS5aJ1aUUEIejLxaM5Fa/dGdxE?=
 =?us-ascii?Q?cN64xgjzZPG7AZjCuSJ+shw4zYACb1I3ucgOd/mmFaesRFzYU7cZzMp3bA87?=
 =?us-ascii?Q?FRwmyOeA45aHetPig1qDlyDuIVOjtx2jL5Q3h0SSDJ17cnzOeySdHD16KMY9?=
 =?us-ascii?Q?UQQ8L+vBw+lXO0AhId349DT/pHHrQqzv2fiD4l/wnMv+kHl6QNqpkPakw8Gt?=
 =?us-ascii?Q?Ye1jTkOz5IVvVAiLhap5q0Qo0W35y/3XXExgCQn0xSSsbXXvCb6UkZxQyfT6?=
 =?us-ascii?Q?1KzH2eerr+k95UUWpow5SGHU03cKfSa3YR8wT9nugsJOoghlx0dhOwcBwXkT?=
 =?us-ascii?Q?+Dq5Y//JTEkx5euE97sxUuIhEdQ8RzP3zt1fKMK3rTCppHmFlHLMY+g5/tiX?=
 =?us-ascii?Q?ZeiEmNa6t3uIr53BIUV1wWeTfqx4bMRQiphYZreH6uJH6vM6RQLzMxLf+1aW?=
 =?us-ascii?Q?pOA5PiR5XHE8tEyd+1BGjU8Wso6Wkma96IK2xyewT5tlNZxCuopoI7rSiq3V?=
 =?us-ascii?Q?BUbJ2c/w0ApVYbHEFc8H9swQmdF4LfDBeJsETEfrUNUiOABHDA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 14:21:55.8947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d90047c-8589-4397-e0ff-08dcf9b75fbf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_072201_013186_567480E5 
X-CRM114-Status: GOOD (  12.42  )
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

Enable NVLINK-C2C port filtering to distinguish traffic from
different GPUs connected to NVLINK-C2C.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 Documentation/admin-guide/perf/nvidia-pmu.rst | 30 +++++++++++++++++++
 drivers/perf/arm_cspmu/nvidia_cspmu.c         |  5 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/perf/nvidia-pmu.rst b/Documentation/admin-guide/perf/nvidia-pmu.rst
index 6e8ee0fcf471..4cfc806070d7 100644
--- a/Documentation/admin-guide/perf/nvidia-pmu.rst
+++ b/Documentation/admin-guide/perf/nvidia-pmu.rst
@@ -86,6 +86,21 @@ Example usage:
 
    perf stat -a -e nvidia_nvlink_c2c0_pmu_3/event=0x0/
 
+The NVLink-C2C has two ports that can be connected to one GPU (occupying both
+ports) or to two GPUs (one GPU per port). The user can use "port" bitmap
+parameter to select the port(s) to monitor. Each bit represents the port number,
+e.g. "port=0x1" corresponds to port 0 and "port=0x3" is for port 0 and 1.
+
+Example for port filtering:
+
+* Count event id 0x0 from the GPU connected with socket 0 on port 0::
+
+   perf stat -a -e nvidia_nvlink_c2c0_pmu_0/event=0x0,port=0x1/
+
+* Count event id 0x0 from the GPUs connected with socket 0 on port 0 and port 1::
+
+   perf stat -a -e nvidia_nvlink_c2c0_pmu_0/event=0x0,port=0x3/
+
 NVLink-C2C1 PMU
 -------------------
 
@@ -116,6 +131,21 @@ Example usage:
 
    perf stat -a -e nvidia_nvlink_c2c1_pmu_3/event=0x0/
 
+The NVLink-C2C has two ports that can be connected to one GPU (occupying both
+ports) or to two GPUs (one GPU per port). The user can use "port" bitmap
+parameter to select the port(s) to monitor. Each bit represents the port number,
+e.g. "port=0x1" corresponds to port 0 and "port=0x3" is for port 0 and 1.
+
+Example for port filtering:
+
+* Count event id 0x0 from the GPU connected with socket 0 on port 0::
+
+   perf stat -a -e nvidia_nvlink_c2c1_pmu_0/event=0x0,port=0x1/
+
+* Count event id 0x0 from the GPUs connected with socket 0 on port 0 and port 1::
+
+   perf stat -a -e nvidia_nvlink_c2c1_pmu_0/event=0x0,port=0x3/
+
 CNVLink PMU
 ---------------
 
diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index ea2d44adfa7c..7ab7d76e4ca1 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -130,6 +130,7 @@ static struct attribute *pcie_pmu_format_attrs[] = {
 
 static struct attribute *nvlink_c2c_pmu_format_attrs[] = {
 	ARM_CSPMU_FORMAT_EVENT_ATTR,
+	ARM_CSPMU_FORMAT_ATTR(port, "config1:0-1"),
 	NULL,
 };
 
@@ -210,7 +211,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	{
 	  .prodid = 0x104,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = 0x0,
+	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_nvlink_c2c1_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
@@ -220,7 +221,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	{
 	  .prodid = 0x105,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = 0x0,
+	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_nvlink_c2c0_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-- 
2.34.1


