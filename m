Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B43CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUmgX2B3UJCU6551FpcKE7vie4hp0XhLCxqpMH41O7w=; b=TDFfA8+FCX4CZr0yV4melhYFIp
	7nj1YMogiMywU7RvhOsuy2xrz0Rvx9TabLwUKuF73voaxIL3bEZ5UiXLT3o+m6vHzG+lKsXlv2jeH
	6+GaWlWV/jaFNeExelB3AUhWKCwChfXV2GfvtROZy5ScUgjoZw/ciWjDzNM5rTCX76tbqLiV4PggN
	7yHu7aX4Cb9NWFRKJpFZ21Fjf4ng+G9kHIgsBhOQY7g+XPGROeeAn/av+48ZDa7qyaA8dtr5gtK6I
	8vlVrn3Keb+SbnNmUIfe+fKX2838KB8r9ZX+HfncX78N6Zp2sIWLOWjNBZ/aFEe/0v9t+60sh4vn2
	rcLMfz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEeb-0000000HX4j-40ts;
	Thu, 18 Sep 2025 13:26:29 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEeW-0000000HX28-2adw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:26:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ocm/M4MDp9iBkqv0Ayg97waG+MGapYTM+RUlW3bKrTWyM+nFJofSmk1GUMiSGlewJEjWRjXI7hPRSSwefbOdmdBaf0zNIy52Sg8F6xTP2fJelwczGZD8Xy/Cl2DLjl7v+Wv+6cmzeEDIDJV3e2Awx36Mzkno26MuXFmDYgCBp2GBsW667K47DMMl4tzgsElWZzYbnl0gSXwabtHwQgIxVroXjf6KGesx7+8JJewi7JknTBHH4XO3GyB7Ys6b7E2uwkDDTTqRFZKtOyZI89/i9MpHTQLVc0yhcNppw6c5KhCEOUzWIFtSO2Do/5Xvq1h8EVo0RJAprcdOT79b6E9RdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUmgX2B3UJCU6551FpcKE7vie4hp0XhLCxqpMH41O7w=;
 b=oQb6DSEv4advR9pyFuLWajvLmwHkxbBVYzG6fmSbGH7iKvS91BctSqzs3bfeMYTMJLyBdvZFa9H6XsU371oAFDXD8xQTO2FbmsSgX2VOQYiPZLSgZGV9ugMYJTs1nLH1Uk7TTd+84yBtqv+imlDIUCaPkgSEcbTC5fY15bu+3IjJfFGZ2sgGbgAu8GkItnk0lWixHP3wMsdjJyZFosndyIlAKFrAhy0OwDqxoJDhLfskxQxjTmqzmQ9WFPIZ+rOeWmHKr2+z2chVdQeRpiAYAOENb9vmxEaFSjHF3Pr/6CdGSsYXvTfY05HfF5toLIxKJuMrGgjhWIGpwFYYidq9cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUmgX2B3UJCU6551FpcKE7vie4hp0XhLCxqpMH41O7w=;
 b=b1cb1d8x41xA2iHr6MzHoBwA0eIMT7CZa4eWTbKpThPS9q68BH04TpbsWurUy/WJ9cH12kRo5H0q0KnwJhOET1X0zlnB7dAcjIYwkFCmqRWU1jnNn6YcRhJhfCH1Qk4eE2ZtV88m4cBd9FfmEdFxrJtBqfzi8h/zAzVt2FqXT+4Shm/fq4zW9RP7BCgOD3MOm3JX52RHsltIrbM8GpIcYNtriKmn2YDtMgXrkIJ0TwuW68cO40O3exCczzsW3l1A1yKkFTs+u/D2OfYRtM3O6J41UHv7z6DNYEaIkZpPUxNK+kQfdgYEBowTgt9yVNcpbivyUdFB5Kcg4Wym8o917Q==
Received: from BYAPR05CA0008.namprd05.prod.outlook.com (2603:10b6:a03:c0::21)
 by CH0PR12MB8549.namprd12.prod.outlook.com (2603:10b6:610:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 13:26:14 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::ad) by BYAPR05CA0008.outlook.office365.com
 (2603:10b6:a03:c0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 13:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 13:26:14 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 06:26:04 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 18 Sep 2025 06:26:04 -0700
Received: from SDONTHINENI-DESKTOP.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 18 Sep 2025 06:26:03 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Shanker Donthineni
	<sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>
Subject: [PATCH 1/2] arm64: cputype: Add NVIDIA Olympus definitions
Date: Thu, 18 Sep 2025 08:25:47 -0500
Message-ID: <20250918132548.1141306-2-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918132548.1141306-1-sdonthineni@nvidia.com>
References: <20250918132548.1141306-1-sdonthineni@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|CH0PR12MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: 2340d25a-8f37-4509-da2b-08ddf6b6f0de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JZukpyMdmMfA4LewxQokCWE5ZMjt7CXjk7Xp560zC+G8aBBNYOJlX3isIfC1?=
 =?us-ascii?Q?3S+ww0zf4eo4vP77/1vNjut7qwTPp9XnQLKJiu4gQy7+K4HL/Xfg0HZjJ+X8?=
 =?us-ascii?Q?d+gqQfCIxS4QMXLgwgWl1eJ68ZF9pKbOCvq2zSLdpbBcWq0AAi79BHdPNYyF?=
 =?us-ascii?Q?WYFPE6EUb4zz+caFoij+DG128s0+iuocZKeAonomKMx8d49Lmwejx3Hj/dYK?=
 =?us-ascii?Q?NfMgW+giFXc0DGMehQSnPbDiyqNyZH/Ji6X0faTdeVyGamFhV38LlTs8+ORk?=
 =?us-ascii?Q?Ov/W4VdeluAiouwp6R54NLuEjdBr/TNLdgrBgSXj+eiy1CUSr323yz+O2a4V?=
 =?us-ascii?Q?r3wHWHKfSAvZWsZc++cXVfzJ0bUGf8GRmbvt0kiakIyPchHGMT8xOBbrUcB3?=
 =?us-ascii?Q?rZdEy3dGwo+AZTUHEOX8dWmKyx+Mk45T/k94mb6qXfKF9m9HQIvhynkfq03T?=
 =?us-ascii?Q?gD8WstMH3TK5G8nG/IeGF+HF/Z81AACZ+Icpp1ZWJpokFMHXFzSr+WOppbvE?=
 =?us-ascii?Q?j8/LDbLLuWNLPJ346vZa3mM5Vfo26ErMd0Yj35yUFQlW3bb6fMdrUKJHxda8?=
 =?us-ascii?Q?A2ONt6h28sIMjGH8iKJoJMsgVSX3fCIqwWs7fPaTFw0ItGkHAAeerOGarCpm?=
 =?us-ascii?Q?CV9njEzF/hhkUQ4f6G/rd4KtYgmJ6jP+zoPebNhO2dzu609n4OEqNi1n8k1N?=
 =?us-ascii?Q?h39AjcHMtaa3TH2iFpvksYTFLFtydPeqa9AKuhG5MuQ1d6R50XZSh+YMmZYa?=
 =?us-ascii?Q?9V42MZUVhdlzykzlUBbZSBTdzBXxrAo2ucC7KQAym7w1HyNsZk5jCpS+PjFZ?=
 =?us-ascii?Q?h3PU95k8q+MzbZHyEDNlA5xKShCnTiPwmgZeSGWgaYKletojebeSz9GuDkQt?=
 =?us-ascii?Q?tYQ2KJ+TCg0CwycwNCPozPE1H2RPJbmkVFd5sLolPKKsKsrTnhFIoeE7+UNY?=
 =?us-ascii?Q?VuRxA4po1/jxj2OqdZkJOCFfptzKZmZf+OeWK+0JwzqgNYFsrVLGiqzhGQt2?=
 =?us-ascii?Q?EcWVbn5TjfQeqKKbCncnJd/uj6ymMvNxhWFqH7V86veoYiwhD2Qca9YoLkOn?=
 =?us-ascii?Q?OVWEEQYfyEQSP5QazKoJX3D7mkz2vXav8hHJ9aGwB4QDYPoDTfxOKUJ2p9LW?=
 =?us-ascii?Q?3W9qLv6qNGLm7dSOEaGWfhju6/y4DHm4JrNo3bBld43onBBr5ud4Dmq+5XOb?=
 =?us-ascii?Q?6SePnfsb++zZtk4X0E0jA/RDyJfthnBGoHoDQQCXEihLKXLmJh6EUAsQph5T?=
 =?us-ascii?Q?Xb6iK/GV/inzsMFaApNlKZPwcJrQCVQ+KTB+wudGn++fNawOE3FSQXzehOre?=
 =?us-ascii?Q?PgSJ4qCwxT3JihejyGHqd23sgewcjEhRtT3D5OV1QnoFwR6YTdCQEXR4oAmw?=
 =?us-ascii?Q?Jr8MpzDni/YhtHP/GLu9h45y4Srh6VoqAXq49O1ghmVJBBiye3HDQQ3MT7NQ?=
 =?us-ascii?Q?8TsYfDdsu4HtFAq9d7af62anhLvqYZGP0BmjRsmdj/HxFoDxwcJcfVaTgGOJ?=
 =?us-ascii?Q?ljpxkLsgRbZeXzCfl2e2nrdTKHA1rM6YGKfR?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 13:26:14.1847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2340d25a-8f37-4509-da2b-08ddf6b6f0de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_062624_662239_6F3BD22E 
X-CRM114-Status: UNSURE (   8.75  )
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

Add cpu part and model macro definitions for NVIDIA Olympus core.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
---
 arch/arm64/include/asm/cputype.h       | 2 ++
 tools/arch/arm64/include/asm/cputype.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index b10eba7f52476..402e6c94bec3d 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -130,6 +130,7 @@
 
 #define NVIDIA_CPU_PART_DENVER		0x003
 #define NVIDIA_CPU_PART_CARMEL		0x004
+#define NVIDIA_CPU_PART_OLYMPUS		0x010
 
 #define FUJITSU_CPU_PART_A64FX		0x001
 
@@ -222,6 +223,7 @@
 
 #define MIDR_NVIDIA_DENVER MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_DENVER)
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
+#define MIDR_NVIDIA_OLYMPUS MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_OLYMPUS)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
 #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
index 139d5e87dc959..45ec0d4fba71e 100644
--- a/tools/arch/arm64/include/asm/cputype.h
+++ b/tools/arch/arm64/include/asm/cputype.h
@@ -129,6 +129,7 @@
 
 #define NVIDIA_CPU_PART_DENVER		0x003
 #define NVIDIA_CPU_PART_CARMEL		0x004
+#define NVIDIA_CPU_PART_OLYMPUS		0x010
 
 #define FUJITSU_CPU_PART_A64FX		0x001
 
@@ -220,6 +221,7 @@
 
 #define MIDR_NVIDIA_DENVER MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_DENVER)
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
+#define MIDR_NVIDIA_OLYMPUS MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_OLYMPUS)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
 #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
-- 
2.25.1


