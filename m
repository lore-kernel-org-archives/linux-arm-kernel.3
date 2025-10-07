Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69A8CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 13:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDj6KChHFWQ9xoewMysopWXZ687XDGNYV02CANlS518=; b=3/zy77H9xEkFiHIbgRqOAUWS0H
	nfvpiJPQ20i0nEz0VktXNjfZGhnBmloIRXMW59VMMBb2uzdMebJcxyPFWVRXXSybal86xMo37jlQ/
	fwxyIXYwsGf5WPRCoQ9q2NpATll5foldyycK8yk4S854WpJBjfBz66zPeG4EW/SVX1SLEKNONx6jU
	JJ1MtYgffImsQUQcQM/aBsZIqKAG1Rnq/D9crLYwW0E+WGKjguchvFwcii9VCpba7VwrqiqpJWIfO
	bI/sdNHOdb7aC2W+WFSJIKARaN3VxhDeBXbDWMqSLtOr1DeJyctSjc/AuGPlzn4RRKjLFTgWftyl+
	K9O+RVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68Cy-000000027AM-2mdn;
	Tue, 07 Oct 2025 13:58:28 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68Cv-0000000276Y-3sNs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 13:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyOGlp0UjLaGrSmwoIG2kVbb+82GFcMlcBc0z/GLUM/G7IMTF0Z3pD9E8N+F7zM0UUe6qg4OpzO9YNWH8dYhEmlR7OQxdL4CkPpVUtw2eLjiBWgzzH3aX1oYmDfxNRM8+xnASz80m3ee9mwcLXDU+d0vnhPRyzHs48ULTR0nK2ovbgJh4byaPiibi5SyjD/lSu4MZs1OHyMsBKTrehOLWxtvYdnYGnOLZdrp8LfHS+uUA6kWfDxC9ihz3i/1SnKOT/gqK1ZeoZtxo0t4Cd/H0wlLw1GbRKDPkBoD3aE5B+vr34lepFuP6cufyaYdxwX+3p8mURAq9gxm1c0skU4Kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDj6KChHFWQ9xoewMysopWXZ687XDGNYV02CANlS518=;
 b=o3pq38YwuXHj5N2ItL0Y4TTHfdXz30nVma0Y5H07cA1MvXmNz5wR7+EH0jvrPbj3ge62Fvxnm+oNxFAOoju0geVQbz0cFOrvhhNkq2OgEcIDE1Bf7TZQH50dFjUw94AHk75Ge6TOq3ivaaKSc848Lhi798IoGISEaQaIEJVEsEy4WgyxcKetZJNVi2bzNyctElXx5Myoi/fTlLX1Y1uDeqzXEwxE4hpFIFH5buEoxn8lu3cnW6FFzY6F7a+990jqCYpIJvgr+1MxGRHvOj0I7vlqJnU8xlCr1450r0S0kUO1ZtHYIraRmaFFsAsv4RZ22DocwUrVSVHvrBO6WBMcpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDj6KChHFWQ9xoewMysopWXZ687XDGNYV02CANlS518=;
 b=qBCFQQbvf9miYP3sjoyaWd0+GZFRP57BrRp+IHazY2qJeyJZRk2SOLcsCXMr2YAgxOPsB6gCRcCrkBM1CCqGIQv//r0taGRZpOrtpe5pdP3EaYUNO+ravAnPv5hB5RCIlbsdh1NeL6YJwsu1XhZshNLswhzKO2PoqMZ53naK/zrlevVBUbjACN7jM+gfSD29OjCokdh2BlzkMBvZJs1w82Y7JC7iyBEjFOrNG36hJFqEvC2nP7d+raIDhL5rjJJiCK5+wabMPbx6WDnyOs7LlOfM0O5yYpcNwNNDSSfkrmLe9IYLyIFpD45DBICo0sLfEexBVackWShc0MmwU0bOow==
Received: from BN0PR10CA0011.namprd10.prod.outlook.com (2603:10b6:408:143::13)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:58:02 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::d5) by BN0PR10CA0011.outlook.office365.com
 (2603:10b6:408:143::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 13:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 13:58:00 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 7 Oct
 2025 06:57:51 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 7 Oct 2025 06:57:50 -0700
Received: from build-shgarg-noble-20250919.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 7 Oct 2025 06:57:50 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v7 4/4] arm64: defconfig: enable NVIDIA VRS PSEQ RTC
Date: Tue, 7 Oct 2025 13:57:38 +0000
Message-ID: <20251007135738.487694-5-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007135738.487694-1-shgarg@nvidia.com>
References: <20251007135738.487694-1-shgarg@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|SN7PR12MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: d8aef6b6-f24e-4dec-fc8d-08de05a98772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NYvr6g3m9/CCdPHuWSfbAi9njbb0A650bHt2t0/b1oYXjIvhXioxeQqxEdml?=
 =?us-ascii?Q?emfF8VBxbqS8oNW1eTdr7I0abki8Doc4euH1AYYfDV+zVgrfZtRKYLPbrE1i?=
 =?us-ascii?Q?BZYdh3az1C3hEUz6NMtnc4t8D04n+qthXEqMtkymBh+hLrQH7oChrkuMKHXb?=
 =?us-ascii?Q?EpcmWFAQgCHWrLP6SXuLF7nZzSv0Le8Uy+4y+wINeNSZfS2kPn3/PyxjEPJv?=
 =?us-ascii?Q?g4LWFvKNJItBSiZJr/c3JaxE+nA39WUz59k0XAkgMmMJNhOGanKhfvccZ/NW?=
 =?us-ascii?Q?5ip1Cfwzgqt+hxtRIO/chyqNkmbqSx/U/+slugqLjZSE1ZjjRpsLLwm+Tl1J?=
 =?us-ascii?Q?Q2yHmGHRyIHLm8CGEt23OVjFEPqx6HpURqyNO2nqfkv81LweWoPqo/LzFSTJ?=
 =?us-ascii?Q?JUwDgjEM24CcJO51qusPID0P+IF0G9VYQgmN7W/Rc0C0DQPLNNrV7HAH2FNJ?=
 =?us-ascii?Q?cfoqSKfXKyguH8j9xRTt4C1Bu8PoIxfc3fq48YuqVWKV0v0eUwNC4lbsUA0/?=
 =?us-ascii?Q?ySk6Tc4+PSTTF0xb6vbPcE0zEIT/8TkqJFxMkWqTNfh2X1bHg1MFcH6svk6x?=
 =?us-ascii?Q?DwumNkg+hjR0ATCq6u6qY7L36CJcHFZ+k6U+YuCIMWlofjQNamDbFZ7EMugz?=
 =?us-ascii?Q?EawqPeR+cOmtwAcxsY6RD22S/tR3UgriXpYQBhGNJhl56kv8lhA478vZmuGW?=
 =?us-ascii?Q?dRGC1LIxc+fvUjvWPKTD43Xhpa0m83uFtd+q+KaA7IDCgo6wusv/C+HII4Gm?=
 =?us-ascii?Q?Kz1yI1t2hAJz8P8TdMGW5ZQBIgQr0bqF+mLLK7azGNqxJuwzitsdh0rqdsMX?=
 =?us-ascii?Q?p3lJWKmlPYb4/NXS6ZXRROVUOSn5AkEieNMdADKy5Gj+H5JXpe4zvMo12fUQ?=
 =?us-ascii?Q?F9HS5mc0lSOYyiENc4NbCAFueq58OP+pZtYNmCkZYdm3yZzu79+d0DSvrtr5?=
 =?us-ascii?Q?DMMqtqFj+3q5KJFTEmKWrFmikaZ8Tv33DzTNTzhoJg+Mpo0aXhe9BYCgM1yo?=
 =?us-ascii?Q?uFL4qfvsOZP11X3BTMk+hsDzqNaXAYRe6WGLPigbTBtMN3nY6YftnlYpEkrC?=
 =?us-ascii?Q?Dm6XHznetNZTPtc54Jmw7u7ws4I9PgeViZAAMNNpZoZXfd5p+Nh66OMe3BHx?=
 =?us-ascii?Q?Ht0qOFkRIVci1rBeU3eKEuQHiAblyC2z1LGsZbyr7zqK0iUyI6xjIuzzddWL?=
 =?us-ascii?Q?85ISNchnj1CKjHMTjl71pD28E/sZseXXK2cdYdObqau05fwVaqmcWHRGs3kI?=
 =?us-ascii?Q?8JtITm4/0/FlJfF4YB8xsng0BDNnXn81WBFycjS916JwMDGm+rsBcD6NTXQD?=
 =?us-ascii?Q?2+4LslCXtUeMI4f9Vv8gBbfx9z+JsARwuvub/rufeT7kna0BeeS/1dOgaisD?=
 =?us-ascii?Q?hP1mKuYCK+00lcVdGcX2lMvtqDjo7QmuGOAe4lltj3lzzmCywPtpTQqi6jDk?=
 =?us-ascii?Q?sqeUw8ZAaMBfNr/p3auPoNofb9FFN1D8TU/3B96ZVJhMcXET9rsq3a+vftOp?=
 =?us-ascii?Q?xcVyn7KSOvV3Bp8ngVIHN2UuMc/UMNb/e48A7dgzctqY+WJjDVpZe+uFolEx?=
 =?us-ascii?Q?Q4dYpu6QS6pojEIDt2E=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:58:00.9997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8aef6b6-f24e-4dec-fc8d-08de05a98772
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_065825_969357_39BD8330 
X-CRM114-Status: UNSURE (   7.80  )
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

v7:
- no changes

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


