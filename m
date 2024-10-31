Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405CFD767D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZLGvHB4l24ViWSJz016Sysgpd1lLATV6dUroaywx2g=; b=NjWKF9HEHYxmvpkP/nL+OGBCZJ
	P/W1zDJBkytCXq05i3xJFb3uyLa1G1+frtw2HPiMqqV66WZfeUUY9OEB0xt1r2KcKuKmOu5n/GAZx
	nfNV0YbZRMU3WOuVwdhFbvsmX6H4korUfTIUeDetx/6pB/zZIcir6zJ3nTCqjXNJv4YxieMDv7o6W
	QrHEU+YKORyqXcinwZg0Nw0dLIj1Qw3VmucnMtC8sgCD761+yeCbkzw+r7JFO1RK7hTKDJG9C70cK
	/W0/5haUepOCRZgrKh7ow6SZA8tCXROf8OcpMiDViaA+SuHypk40B/XBKp8BuxQVRGIqHG/EYmglP
	i8wPMtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WBf-00000003oTI-2TgK;
	Thu, 31 Oct 2024 14:30:11 +0000
Received: from mail-mw2nam04on2061a.outbound.protection.outlook.com ([2a01:111:f403:240a::61a] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W3m-00000003nC5-3ozR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:22:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrIzlRVjX3keaQ/zSs8c4lKagcDhNqd0hH+NhLPkpiWJ5uzNumRdCvKKeApITotJO1MeXeBRCdxtH2c3cel99ZCLV4LwsJr/MIyTwv4zFNZap7DeQsgPGcMJstJ+kd4V2XDDKnj4FzGRnQedYJJrV52cgd0j+Vapug/u8GQSrvIe2514iPqU08509RRyrkl9Ia46+70effz5LCbJanj1b7pXW3vHXEfsvWwlOd3hRvQEWIUzMTzYh1dhPuEXfmSfk9sEr3fthdD56y+CzZ0vp0hACLC0aBhxBdO21imjolAYzXiVf7GPuPJaOVo4LvJ6N8ufHjmQfYeVfk1YfL3Gkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZLGvHB4l24ViWSJz016Sysgpd1lLATV6dUroaywx2g=;
 b=m5fJ0LS20efKuGswGYf52HzYaPbEQsUtsiqJUUTOqCh6lcWTQJ3tVj1spu5xJnzwaJQMDL5lb6M7np09gQmZtGUVz3iI3MnMiNfOGnCs3dR6E7y5E4ztvcbdndEsfco57iMhDAemu4L0JcQ/7ur/MPeuYPzhEdSNZ3cutwzO5N88FPuC7vvSh6rLJwbownkhYyTdsgskRUhc8mYTsbyT9SdK9S0YAXk99CpZIzBVhjFPQq0Uz4X3OgAH/gxFoi/eNOuKsCfLrcRQZ7asauO+ZNyneFYhLV45Bn3YJj/joSFNhCjsiuanYAjV9xYCHSdKSzyArxmXYRXWS0LIIjefjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZLGvHB4l24ViWSJz016Sysgpd1lLATV6dUroaywx2g=;
 b=LpRCCPo035RFCGhjdrWa6/CECZQwlu+wiXqG1oYCOKEu/HJ3yrGDIVYyfP4gQ03bujf7lRaCAhZFfypqku81ypk8r8AC5XQ2TzUWMYxP/9odhkMIwnCG0S1n8uci3WstDRDif1bcexuhTgb7IuapotJwNpLCA0qosMMPg2d7IMgVvzyyG7nz4+842lawwKbxngrfWfpw7Q2QsXbdB0MWXNHAalNwlzoACF1Vat5LK0pLu+dWdsTs/NocQOutAMGKiYWeblm+a377xVLKIXmU8f+Hs1ue5NIJR/qK4rPCkh8Y4FHM07hRVsfWe2VR9GUep5TB2bkBZ2mGWNBJyCT61Q==
Received: from MW4PR04CA0375.namprd04.prod.outlook.com (2603:10b6:303:81::20)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 14:21:58 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::28) by MW4PR04CA0375.outlook.office365.com
 (2603:10b6:303:81::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23 via Frontend
 Transport; Thu, 31 Oct 2024 14:21:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 14:21:58 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:35 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:35 -0700
Received: from build-bwicaksono-20240327T112120892.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Thu, 31 Oct 2024 07:21:34 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <rknight@nvidia.com>,
	<ywan@nvidia.com>, Besar Wicaksono <bwicaksono@nvidia.com>
Subject: [PATCH v2 2/4] perf: arm_cspmu: nvidia: fix sysfs path in the kernel doc
Date: Thu, 31 Oct 2024 14:21:16 +0000
Message-ID: <20241031142118.1865965-3-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241031142118.1865965-1-bwicaksono@nvidia.com>
References: <20241031142118.1865965-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|CY5PR12MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc40070-4bec-4459-1902-08dcf9b76109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KG3qXw0CXYvb4H+Fb3y1fU19ua/F3CnsX7eVcZwH1YB6BkIK0eVmF2CnzRoG?=
 =?us-ascii?Q?YDMuYGeOM8vrYZJ0gJoQtUcuul7D62JSfQmbGSqRFwtD6SunZIQhEzdG1tsx?=
 =?us-ascii?Q?8ARH+YwqTzUMhHMzp06Mv77D40gkF2yV/FfR1VUIdpJ6o1rNZPv5tYzAl5oG?=
 =?us-ascii?Q?9SVhqU0ZtFCHLeEwpLdOH/bqrSXCR9Xk7zlTSli9sS1Hjw8whq3Z6p1JgxHM?=
 =?us-ascii?Q?vyq/h+F/aTUb6X2zpIEDpaQfBYeKF5My4y8uQkA6vWCEdj7e2OefrhkabIA7?=
 =?us-ascii?Q?N2ewl+rGc4qZj9PwiOMxAgqo6sm/7LKKAUEiLNmBtBH1E88maVrWy+5/QUwJ?=
 =?us-ascii?Q?CaVFE+rHD6xPuZGxFxW5/BY7XRq8nWBsJEMrw+Zk4Eayuagb0XmJ90NfA1Ma?=
 =?us-ascii?Q?hDR0jpTDmIje0VjO/snntdDk+ke8+4fGrkZb3k4yWOO5XFAUl8Fsma4dryNt?=
 =?us-ascii?Q?toWZPJYF/kPEnIc3PVt5p4I4xkm1LabX+7OWjsWLz7NSNY5wtpuKvmabIVtT?=
 =?us-ascii?Q?VqpQiwp8JQ1V/mIR3TmtmZYd7mXtlvPWt0xRJeUjggHT1FKtIu63EFvOe5PB?=
 =?us-ascii?Q?dL6BsdFqo4L/mbltdMVvqrX3z3RJMiX23m8ekjxcDJFJoRdwb0j9clPPfkpA?=
 =?us-ascii?Q?SUdFSCqEFuJzxmw/R5doHfJdTz8iJtFzDqnLx6/4sjZxi2Oo02g3GoSXOqqy?=
 =?us-ascii?Q?HqReZX+DenJ63HHz0oFTBz6fhAeGh23ecgUnvIz49o/5QzqneQPDcnUJQzbV?=
 =?us-ascii?Q?c+DR5VMaoAPSVHMABRaO65SttlAlaRxwI5eiIOG58f14pJvkf++KatdeVOLq?=
 =?us-ascii?Q?aR7czKfDkxmsMzGCaC9aOd3VRgO76mDkKvOqgEOa0BXWoc6LgeccH/OPx7Va?=
 =?us-ascii?Q?0dcT+N1XYlVv1dIveSx6CGHqhFq1oTxBQzr+c3D/LSGpvWu0eRChx7CiKbvE?=
 =?us-ascii?Q?WZ5fasDFUy94WQPMV0SgF0wiAJXn04I8DIKnWYFEU+g0BcfN+nJWRrIW3hHQ?=
 =?us-ascii?Q?Q6Bmj7+bftfgfd7kCjCuVmR/jcxLs9wKdog253d3DEJwbe+R8b7PzJn3t64r?=
 =?us-ascii?Q?5+aLY8F1ZdwgYw7R4i3xWuiOkRPpDK6H9zbqsXw4ziJIttkbLyAe8S4MfrrC?=
 =?us-ascii?Q?YrxBK+pLDVaIqIzrNL3S7dIj4LLDurSbcA4SKhNdDCAAw7IRQyPyrAl0zH+8?=
 =?us-ascii?Q?J/pmczmUUTbwtQc5pm7wuHya0KXe9y76bTbltCgArHVaXfsJq3SAmYPyeG4V?=
 =?us-ascii?Q?cSu7K7Ot3YbJSknYXpHBt6rOfdncxqPyDzS4HKDW79XzzYk0eqMd0kZXh8E9?=
 =?us-ascii?Q?XSR+xEBWXA/R6Wz+9DdstPG8Nb5xdGZz8354nKJON0RYrM3nq0fEyPMwTyJw?=
 =?us-ascii?Q?AshYMMCoR2nCvSgrY3UKlOFAKk1kaRyJE9fRi/dGDtJ4g3j1SQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 14:21:58.0210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc40070-4bec-4459-1902-08dcf9b76109
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_072202_987932_D0FC771B 
X-CRM114-Status: GOOD (  10.60  )
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

Fix typos to the sysfs path referenced by NVIDIA
uncore pmu kernel doc.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 Documentation/admin-guide/perf/nvidia-pmu.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/perf/nvidia-pmu.rst b/Documentation/admin-guide/perf/nvidia-pmu.rst
index 2e0d47cfe7ea..6e8ee0fcf471 100644
--- a/Documentation/admin-guide/perf/nvidia-pmu.rst
+++ b/Documentation/admin-guide/perf/nvidia-pmu.rst
@@ -34,7 +34,7 @@ strongly-ordered (SO) PCIE write traffic to local/remote memory. Please see
 traffic coverage.
 
 The events and configuration options of this PMU device are described in sysfs,
-see /sys/bus/event_sources/devices/nvidia_scf_pmu_<socket-id>.
+see /sys/bus/event_source/devices/nvidia_scf_pmu_<socket-id>.
 
 Example usage:
 
@@ -66,7 +66,7 @@ Please see :ref:`NVIDIA_Uncore_PMU_Traffic_Coverage_Section` for more info about
 the PMU traffic coverage.
 
 The events and configuration options of this PMU device are described in sysfs,
-see /sys/bus/event_sources/devices/nvidia_nvlink_c2c0_pmu_<socket-id>.
+see /sys/bus/event_source/devices/nvidia_nvlink_c2c0_pmu_<socket-id>.
 
 Example usage:
 
@@ -96,7 +96,7 @@ Please see :ref:`NVIDIA_Uncore_PMU_Traffic_Coverage_Section` for more info about
 the PMU traffic coverage.
 
 The events and configuration options of this PMU device are described in sysfs,
-see /sys/bus/event_sources/devices/nvidia_nvlink_c2c1_pmu_<socket-id>.
+see /sys/bus/event_source/devices/nvidia_nvlink_c2c1_pmu_<socket-id>.
 
 Example usage:
 
@@ -125,13 +125,13 @@ to local memory. For PCIE traffic, this PMU captures read and relaxed ordered
 for more info about the PMU traffic coverage.
 
 The events and configuration options of this PMU device are described in sysfs,
-see /sys/bus/event_sources/devices/nvidia_cnvlink_pmu_<socket-id>.
+see /sys/bus/event_source/devices/nvidia_cnvlink_pmu_<socket-id>.
 
 Each SoC socket can be connected to one or more sockets via CNVLink. The user can
 use "rem_socket" bitmap parameter to select the remote socket(s) to monitor.
 Each bit represents the socket number, e.g. "rem_socket=0xE" corresponds to
 socket 1 to 3.
-/sys/bus/event_sources/devices/nvidia_cnvlink_pmu_<socket-id>/format/rem_socket
+/sys/bus/event_source/devices/nvidia_cnvlink_pmu_<socket-id>/format/rem_socket
 shows the valid bits that can be set in the "rem_socket" parameter.
 
 The PMU can not distinguish the remote traffic initiator, therefore it does not
@@ -165,12 +165,12 @@ local/remote memory. Please see :ref:`NVIDIA_Uncore_PMU_Traffic_Coverage_Section
 for more info about the PMU traffic coverage.
 
 The events and configuration options of this PMU device are described in sysfs,
-see /sys/bus/event_sources/devices/nvidia_pcie_pmu_<socket-id>.
+see /sys/bus/event_source/devices/nvidia_pcie_pmu_<socket-id>.
 
 Each SoC socket can support multiple root ports. The user can use
 "root_port" bitmap parameter to select the port(s) to monitor, i.e.
 "root_port=0xF" corresponds to root port 0 to 3.
-/sys/bus/event_sources/devices/nvidia_pcie_pmu_<socket-id>/format/root_port
+/sys/bus/event_source/devices/nvidia_pcie_pmu_<socket-id>/format/root_port
 shows the valid bits that can be set in the "root_port" parameter.
 
 Example usage:
-- 
2.34.1


