Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02759CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FCcXJYZDnpgvVLsROqsXtc4JlbPCpGaTvC3fpbB/qSk=; b=34flrHruL/MkbA2di5x0Gp8MXN
	T/WW0WhAM8mB/w3aZiu9LHPrqF1V6YBxrDDFBmx6cH9o7pivEiHY9xnLGNjuG1YNIFnakUe8Rb0gh
	hTqp1JSnD0FMM4U25qLI217hECA7W3G4l/tFPNIKpEVJPFwbBlv35n8sF1IheNnx6BCZzbHSq97PH
	3TCtt/8cadJg21xBX60z9l0gl5G8Kj8rbhJcqBg3ZgnfeifLQYkW7vINUXArEle2WqMBt+gva014k
	08KnPuF3PQJt493nJGVLh4V+bpeZEtxk6TWDwJkfCtOCwebY6t+1yAA9YgMrsc4sctaYOoy0T0oqB
	B/Fa3KUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbhs-000000033yA-3kZH;
	Fri, 19 Sep 2025 14:03:24 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbhq-000000033wW-2JGb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:03:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiSNb/kh/jamuw8PV0RJNT4ASuDcV+tukRKBCFQKlQDiFJi19sJBgzj9gnS8Dk76b4Owtb5sF11oVQxD5w+0N0r+Grc6M8SzIOwEqMt09LjwYJOeqtRF7wZyF+8OtVauCQKkKwO+mpd49X3ONKV8Ph7Qh1brJcrvAlJMl4Bm9T1KB8Wa+CYY3p9gq3whcjxfI9mAX2T42F8g6pYp6p5FjO11gJe1LdYDqxnh9iKGPxOrocEBRXvZwYo7StSLTo1dxKiMvcMzItekMHpt8q5SW79ZSzQj27rEGdmNy3/9lvYYaMRvh96cJPxT9PG9Z1OeWRtc1VwYx09C/+5HYXc3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCcXJYZDnpgvVLsROqsXtc4JlbPCpGaTvC3fpbB/qSk=;
 b=QQSiWxPEvyTvxIIRj+OU+GRjVPFIcK1aub7o0DpfVcAPxu880HEm+S7LU9sq1wpKkpZCK8gppHZM9eBu948sRVdK6TA++bZQttwNTWNjXdCpmiJMB8wqQI/zsU/uzq0nGOvVplWIg2TkZsVIzv0AUmw2/E6mmdJkQ8Tezixhg4+H8EqGnW+3ardhfM0/Tp/JKkt6zg+X3+0QL7nBUtV5LWLbSEDCIfXurrHak5t8hzw6o2Jlsunan0LuNjCY2Kj7j1giwr6PpuBzokWWelEfBVAo7i0EI1J0UZYUr7DVT5+NM/k7duO/BmBM/Yec5IezPTMIh2j+BiGS6OzRhqgz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCcXJYZDnpgvVLsROqsXtc4JlbPCpGaTvC3fpbB/qSk=;
 b=FDdF6+AdlpjMMGMUVC5j2M5qFghWh8ZQsmcosAJqyJvIrCtJD9vdP8bnCR1zodpZEyZtpaCG0Kb/uKoi5pTYB/KPU0J2/P3Vro4D3ZEt8a6rfhBpkjXrN7dB6S/SOP5ng4QDc/PdU5xceIdImwh9TGchWMJIrO8KCtl7YpW7xSOonuwkoFpQTg20BWPBvVBgSApQYeofpnJrcClNEic9TRm5RmuORXgt7/lURquRYJ1tOHiiTBEF4eqCzPMuRGj8XzUP8PR8eTWc3akWiDZOEdCiybWiG24N0Hr64u6e3+qMEIDPEJt4h+xAb9fU0KuQtYXg5X+wYoBKSXeedCk5Jw==
Received: from DM6PR07CA0101.namprd07.prod.outlook.com (2603:10b6:5:337::34)
 by CH3PR12MB9431.namprd12.prod.outlook.com (2603:10b6:610:1c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 14:03:06 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::6b) by DM6PR07CA0101.outlook.office365.com
 (2603:10b6:5:337::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.17 via Frontend Transport; Fri,
 19 Sep 2025 14:03:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 14:03:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 19 Sep
 2025 07:02:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 19 Sep 2025 07:02:48 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Fri, 19 Sep 2025 07:02:48 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v6 4/4] arm64: defconfig: enable NVIDIA VRS PSEQ RTC
Date: Fri, 19 Sep 2025 14:02:47 +0000
Message-ID: <20250919140247.10567-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CH3PR12MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: f24c6000-1887-4a98-c25a-08ddf7854188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cS83mfk0e5BOzbswqX9SiBm3sNMHy/lLoH/ByS6vAFuwvkBvymEHNU6LSDqT?=
 =?us-ascii?Q?yjCdf+3QDYmxoRgGvqD0D79LKAHY0ZX7YnMjxbln9eZNPjlNq7Jock2+O3dy?=
 =?us-ascii?Q?8eQYK/txBaVH3jHXc7zZwNnRkoFnZlFgXjOOstxKrcmEOADxar8XlfEjRaTt?=
 =?us-ascii?Q?9luXh0rHLB3cvyNrmVtSQQG2SADj1r7ZBb94MdBItNhwVO8DKU5qH1ISvBAj?=
 =?us-ascii?Q?VfViJpu2LP0JeJNCx9Q1bflQACX26LBnLZKI4k6gbVa6RwXMqtY3QPfTxgc9?=
 =?us-ascii?Q?zeb/qiGUk6QuOsiPODVvtoS+At5MgAeT9Wmx2Y7ncQWoDcn7oGh05rzLbzbK?=
 =?us-ascii?Q?xE0bXo07QcqNGx6I8rd8c7DlFMV377frt1Lu5vIa+89e35Na/+heoY5q/fsi?=
 =?us-ascii?Q?AgCZZKfLLcE/+qviBbq8QCIAqXZ53E5ZVEuCp4TDzpag281YDRIz/j5TfCOO?=
 =?us-ascii?Q?E5wyq3i1fRPJHIOKHBvNwukD0j9ZfeUy6D/HQVL7xzw1WVzNdxZ/7sWYOB7/?=
 =?us-ascii?Q?3rQp7OGo2uw1qvR7hjIA223caX3jBqWj7Bggbhy5PbhCL1QYOIF3ax0Rieln?=
 =?us-ascii?Q?HelW2pGW8OASfrqJcTlKsrB8Mg0JGGtx17j9esvSlcFpJGmrklqeVLV35mpg?=
 =?us-ascii?Q?KOr5ijbvlortTQKe2h0+foMyzJwMvYVD9/kbnBKda08MVrYb+3/BNk5TbW+9?=
 =?us-ascii?Q?dTlHIvvG8+svnGd5dVj/YXaPw5tpfLU5lq3huRcq3D9AM6tesFZXqk2p3sco?=
 =?us-ascii?Q?L0u2otSHDqVf2yrYqGIFjrvwrR3vrt7gs+UurWxVpKCL+R8LrxWN9YhkwJT8?=
 =?us-ascii?Q?0cA+avcx+7NIHu7TxZTCSC3tmW4fD9XU4N4ZqT6cZSa4ynHqf+n4Iqpvsmng?=
 =?us-ascii?Q?VPUO2q4Lvvu2ZaCWslZ8tr2KOjJ12I7PcgqiNBcqbjIAVwbLR4UTyS8X3Ael?=
 =?us-ascii?Q?DQv7De/EddYZ48N8ER/3HTldfPQDBAfD0Q3ls7DwWA2S1P1R3/nQq0FdMxOq?=
 =?us-ascii?Q?Lw1ifvdCEp7CmHG3QL/eTYbfoi0NuEoTT9MVGrI536SdOXrXVVuqim3CG589?=
 =?us-ascii?Q?sI6ut9nJsXW4EkM5d1TXFmzIuwbq/NJJkhFNBvG1Hp5udYdts8P2rMwDuYQB?=
 =?us-ascii?Q?V3GsshiqaO93qOdljOL6GCwFDLFWSUOX53DUZbrbeg7V0okzGu+Op4uvMYco?=
 =?us-ascii?Q?iFFHqov6eedCECwYlOMXFznaMxfPQ1A/PATEeQQpMVbKcnF/u0mr41RhxPoW?=
 =?us-ascii?Q?4snuOxl9CZx/qey2RLz/p03/zEzy5UZSnkHvjqx64mA7QuOhvBML2k5XsCWb?=
 =?us-ascii?Q?ntiwHpzL9FBgFsynXa2WXHsq63uafOSiJm6wEherHBg/+Mz2NE5fXZKgR+qb?=
 =?us-ascii?Q?oxAU8vU39whiZqWiM3UYuy7S74N48RU+cOy7Li1YV+AYAcbezVvCnpILRoz6?=
 =?us-ascii?Q?zETpjx8M9ZoakDzwxHuQ6L0Nk6FpS/msA9VU+NnjTexa1ATANrSxpOqvkU+g?=
 =?us-ascii?Q?swyhsKLdy0xwZegcQSqeVyTQwBCkv694L6nB?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:03:05.7318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f24c6000-1887-4a98-c25a-08ddf7854188
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9431
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_070322_593016_DA80EC7D 
X-CRM114-Status: UNSURE (   7.81  )
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

Enable NVIDIA VRS (Voltage Regulator Specification) RTC device module.
It provides functionality to get/set system time, retain system time
across boot, wake system from suspend and shutdown state.

Supported platforms:
- NVIDIA Jetson AGX Orin Developer Kit
- NVIDIA IGX Orin Development Kit
- NVIDIA Jetson Orin NX Developer Kit
- NVIDIA Jetson Orin Nano Developer Kit

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v6:
- no changes

v5:
- removed VRS MFD CONFIG
- changed VRS RTC CONFIG name

v4:
- no changes

v3:
- no changes

v2:
- moved VRS RTC config to correct place

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..a7fb6aa4062c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1283,6 +1283,7 @@ CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
+CONFIG_RTC_DRV_NVIDIA_VRS10=m
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.43.0


