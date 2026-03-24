Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680F3F532C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 01:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRL37xd9wtmmL9LmO6hkhJ+rDg1HbnpPEFTOE5j6uAw=; b=exDLgJQXSuH1Oni+uSo3Qcmtl3
	OkrghwKhMQZSyaL+i1sz4TZsGjEQ9mdeE3IBcGpSCA7Lx1gsq4EnkrpDGT59Xc25kzn7m2qC/unpM
	bQuIEd2XHG1R+hD04sL32pjNXW8u3EhZtXneGMIra4inRIkjmwS3MCLYc/T0oeiXXFECxKGuO0vSN
	lX335TwIpBaqUyKNhJsdBT5k88EgR0vokQEDkptJcHUctzucjzK0Ogwy/suMx/AXY1k7+/KoZpvb/
	oZjQx1cIBIV90o+mWnlw7UtcWLWqztZWMZwRgmGoacJmxA6lJ6fdYlXkDfdPA7Ta/wfRlY49JWEdo
	bdHlM/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qbB-00000000IxK-2zvn;
	Tue, 24 Mar 2026 01:30:25 +0000
Received: from mail-westusazon11012013.outbound.protection.outlook.com ([52.101.43.13] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qb8-00000000IwU-2b5K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 01:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPGrW2KPHTKk+PcZspDD+rBFbyHIkJxupU0J5Xcu5XBL2QUGSuv+77B/R/M8b62bB6Xy8Dce1YQwz3GodmQ2hRXVQjHGf45nzcMrGnPJHyH21kzK9qS/DD6rqMOiXty48jmQeFEipIXmDaGTgC+BAUBrtShvKPE/3uP7+5BCYbM5z4ppsFWuk4wJ3XgseEELIBjB6rb8HsfGyaM87Q49uPmoIiq6oYUlN1yFthFkV14oou/PoCf2ZM7FPZzQ+Fw6IKOLvC+dmTFAbcGf7desSzIxlvCOZJpTbvVp+oOEukPjAA71hHTGSMplYxiy7Mj2eCwYe+hssZhfCiWRaa54DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRL37xd9wtmmL9LmO6hkhJ+rDg1HbnpPEFTOE5j6uAw=;
 b=PWeSsSZCT1a9QFophjdPEGoKm7z0cKZDExU/ztl3qItO3XyQ0W09TvtutAd6Mfo7yq3OUMc9vAsDGz0wxn+9wePw0K2FYRU1uY6czQjF9JNHJarW6e7/u8EMYxouixamZi6a685OhUUiRGYzG1ix1fz9yDuMbJlQ/QbLI0ry8XfcYd3HNzPDUFqfIkf+0MPdq+5FcxrfJ2SsbZuLKJCpe5YCmPfZeCSBwX6N+9kcS/GctcpMRiVT7BEy6kxbBKlaqV9vBn6PZXYUE5MMhbxpQWQ4EOETvMoF1vuub3/FSG4CjHgh/3vXx+/714akncXGl+utk819XRbowHdtspsP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRL37xd9wtmmL9LmO6hkhJ+rDg1HbnpPEFTOE5j6uAw=;
 b=aA4VTyPs0/XrVH+cu8Z3v2MmeZ5ilxKcFIeL4PEuKib16u3gBS56tZmuG8oIdY7oQpikxNfT8uyodYVioSJeckBcwqeA2eHg7C6Yl/7dcsYTnW+iPVh7g/EYPb0vJ3Nb1aC4kAl/Zf0661oY1FnFAfH9A8A76K/p68oHH7KOaJNU9B5TaaJHWc91l+T0UZDckBaYYFEx6eGGvVJxccEYJPwC3MIy/fe08AkLl7IdaJeeCPfjfO4vHHeAEvZ+MixFN5BtMCNOFmitGqrpB/10MGZh8z6QJii9pgvk6SQp+KkodhcaJNLa6kLrLBltLYyfK9dedCtEa8D0dwWBY+Il7A==
Received: from MN2PR16CA0059.namprd16.prod.outlook.com (2603:10b6:208:234::28)
 by SJ1PR12MB6316.namprd12.prod.outlook.com (2603:10b6:a03:455::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 01:30:15 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::f2) by MN2PR16CA0059.outlook.office365.com
 (2603:10b6:208:234::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 01:29:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 01:30:15 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 18:30:04 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 23 Mar 2026 18:30:03 -0700
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 23 Mar 2026 18:30:02 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>, <jonathan.cameron@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <mochs@nvidia.com>,
	<nirmoyd@nvidia.com>, <bhelgaas@google.com>, <wangyushan12@huawei.com>,
	<shiju.jose@huawei.com>, <linux-pci@vger.kernel.org>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v3 1/8] perf/arm_cspmu: nvidia: Rename doc to Tegra241
Date: Tue, 24 Mar 2026 01:29:45 +0000
Message-ID: <20260324012952.1923296-2-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324012952.1923296-1-bwicaksono@nvidia.com>
References: <20260324012952.1923296-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|SJ1PR12MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: e74d8de0-9e9c-4536-53f3-08de8944e6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wPxXc56bA6/bLFU8G+FT/BpwnmQM8aI5tJpUiRToZeWbcYp5M+luLEQ7oG++SlYJT8Cr+/r7hKWxt1kYxvfYYT3IVAscGaXPkO+p4MRKRtcTgKIrQ2QeCeugC5acJu/5cquTM0dwOzGWqE9ruxyhB9I+ostJoJJkQI1q0YJZxRHQXCXJsarzIm/tX+PNmQrHFJev3VhcdFRffhAD/gJcSpwC+1N6339JxGiM6aQay7wCB4q32ZsnBZH7dFqFY+cCuVNPTgiTfACscLa1/wrwoSS6eQ9GeAYKfHecJSvCRzoXmLisrgx4A8byhkD3E7w78i4ka7eRHjmnnrnrrYthOvjJkUiktvmY7Pz4cyxrcyJEf0UyeUuboIqGnnDWABwB1ltLikRmRqrX9hHxHRV9Zaa9HV+OAV/C9Zo7qy58dK3B2mibv6+X9Za1JaYPRwz/EU2hWwNkSDfd2VvPBEiEOggDl6EAGoei5jRSzvBudM0sHCdZB+ncYesR9/LpPPbzrLp2ROI8Ge0LSP/m793hAmIQEgE9FBYdvr03hzl5uu1PP60ywE6OvQZc0+UbYJVqzhajHDmBanJMKP3U224XnFb8C0yY11IGUixkuV/CA5lSLNVMQcix+Md7f5Izt+dR/BL+CciHv9JpceXwm8lk9ArmrfH23UGMj4suVhHifIvc5XgdS6MaJztPvLPZ6Kv57a/+StIXL/s0YqXtXsDmyqqj2lKYL0gMB4eKQd2Vd9wRL8UK+aH4JEEm8wxMczkSqviBoHSW4eLVuUX6KMniCg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uqStbu8oS9IXF2uYSSsbEZb7CeBrymuw8u9n3dp/79K+zLdSinFLeNe0oiU1HiYj8ZCDeB/5911sPtqYaKbCUOGG9XdazMPAbgu4Gtf0rUPiBOLo1NiMCn664qYlqzDVOb97c+b2QFfoBpi5eGUdmAwN719iSck8WpieVJP3ZNHVvfocb2a9v3vnuFGBrnN3taPDziBeaQWPShtUBvCfoyyyoNEnB6YaBbicKaUCDMGSOYL0PmqrQL0Miga1djAEBsTV51wfEfG8KkU4Ca9yY7fj6EcMAh+Jm+86GbN280zca6ndsm7dHKToNqBt8NfNm7FD0ZxQOnZLSDXjwiACCtkWD42PGTSzOwv5cOUviMuL3XoUpAU+53jmosUjqtueexeW3ZUtmkP6mr2ckr0BFzgCIqY2YI0kQWIArGiI4nnCxTn7Iidxgo7uuN8N8tq7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 01:30:15.2169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e74d8de0-9e9c-4536-53f3-08de8944e6ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_183022_673136_B2C5B113 
X-CRM114-Status: UNSURE (   8.64  )
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

The documentation in nvidia-pmu.rst contains PMUs specific
to NVIDIA Tegra241 SoC. Rename the file for this specific
SoC to have better distinction with other NVIDIA SoC.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 Documentation/admin-guide/perf/index.rst                  | 2 +-
 .../perf/{nvidia-pmu.rst => nvidia-tegra241-pmu.rst}      | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/admin-guide/perf/{nvidia-pmu.rst => nvidia-tegra241-pmu.rst} (98%)

diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index 47d9a3df6329..c407bb44b08e 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -24,7 +24,7 @@ Performance monitor support
    thunderx2-pmu
    alibaba_pmu
    dwc_pcie_pmu
-   nvidia-pmu
+   nvidia-tegra241-pmu
    meson-ddr-pmu
    cxl
    ampere_cspmu
diff --git a/Documentation/admin-guide/perf/nvidia-pmu.rst b/Documentation/admin-guide/perf/nvidia-tegra241-pmu.rst
similarity index 98%
rename from Documentation/admin-guide/perf/nvidia-pmu.rst
rename to Documentation/admin-guide/perf/nvidia-tegra241-pmu.rst
index f538ef67e0e8..fad5bc4cee6c 100644
--- a/Documentation/admin-guide/perf/nvidia-pmu.rst
+++ b/Documentation/admin-guide/perf/nvidia-tegra241-pmu.rst
@@ -1,8 +1,8 @@
-=========================================================
-NVIDIA Tegra SoC Uncore Performance Monitoring Unit (PMU)
-=========================================================
+============================================================
+NVIDIA Tegra241 SoC Uncore Performance Monitoring Unit (PMU)
+============================================================
 
-The NVIDIA Tegra SoC includes various system PMUs to measure key performance
+The NVIDIA Tegra241 SoC includes various system PMUs to measure key performance
 metrics like memory bandwidth, latency, and utilization:
 
 * Scalable Coherency Fabric (SCF)
-- 
2.43.0


