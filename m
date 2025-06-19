Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19138C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxL1N5ft0SnUHfvQPT4f/IPgUL4fyU7Qn1K75LgHeEY=; b=S99GW4AeJBnt/cCdEYMbCpMq8b
	/GTOUopluNdoSg9MbgDkJbTxQ6CdPky1BjMqbWMNN+0uyvaMvrBcmU/JlHMP1UY3c3HCB5IhOVoI7
	V8pZR2/Ys0WtZVoJgZQ2+dSp8Beg8sXtZV38Rsx9Md0/zc32IYKq+/AkX0O4uSUfSYYOMQqbMtKKi
	naMM8MnxGTe/eeSIcF3HTaCsvGTJlNhU6nedCgTwMey0fG8p9LPHouetjKw0+UVkOhRLWQLcutjam
	qZAM7NjfC4Efc1XfagcoAycoZ/3NPdyXD5F0vfekFB8F2mTwGeR66HhAaQTp6CVO9TtH4EEIO3wuw
	WWvS+dwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBjX-0000000Cdfa-2set;
	Thu, 19 Jun 2025 09:38:59 +0000
Received: from mail-mw2nam12on2062c.outbound.protection.outlook.com ([2a01:111:f403:200a::62c] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAtS-0000000CTiP-1OJJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:45:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqO8XFHpKJOVk/7CtrZw+y8fqsE84Bt2OFWgDuPLUfMkGWYIWB4x6XwuWJd1ZFuGrrL69GLVz0mv5+GkI2oKGpFHVZ65OFf2vDaJhthfrHh9hf+RtTGZeLNd/To+puldrxna8DKXJdwzOP1RcoL1etcvhbPhtkMdpkO1IFuZ9KxahI8OeMLTXVvyX1iK3dLqgaSDPcDaAlvkka5LEYkiSY8Yz4iZvT3a8fotMi5zXNPkogWDwuRDa2K2e46MgPNEZ/oPI404I1m9kCSksEYHnYXxDT8LDaghtCNkeSQpzWmMm+GLSryGUW+Vs8dpg5DTKB2aqFGvXbMmyk81m9qOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxL1N5ft0SnUHfvQPT4f/IPgUL4fyU7Qn1K75LgHeEY=;
 b=pMxUvbOA6m3Zlyi1tHiqVTXWdj55vn6MxHoMIce+yErAYKGSCdShseRUxRScbS6LyHj35fwRwddpPZHWxtYcCorMrUqjhjOvlP1D7H8HInNl6iaUi1UEGPs4gm0HTEaIOf+FByHufqfT87KUfNRMUJgnOzDr0cqpn2R9PTOhgg0SPULVdBCQ+8fQWpZOeWBVZTWpA+V4UCfp0rSHkPjfPoe06h3WYxtSnMIfjvvzWPN/P3U9dZXDF7A/nmzCZ6kExN60ZSHM0ubkyK7oldnn+OOWcJqLKQGEdh2GMRXq62CFlllI/22lQbF9Ftua4smA6AwjatB/ZxUxC8zNR+JDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxL1N5ft0SnUHfvQPT4f/IPgUL4fyU7Qn1K75LgHeEY=;
 b=SivXuDyjPvhnOuK7+RFeyxfZUrJCpXUWHg2KXL8IQoYLvOGsOMDiFouICp2ynHq+Xs9iUV8mptunIVTjpgR8LvLQfdfHGwfECNwbKVub/SbN8FnXrVMvzIPZu3REbbHpUalpOPIfK/n+TYrVrkAp/luvqyRN20xNnmB3B/Yj4oXmPnGxLSzxVnK/o6g/TAp/A65JWVNl2vix+Ta3hTTzcIqirGXaPKvagQ7fQFoHZi4lfYE0jUJYf66OAq1qGLfsLw3DvyVFAFhrfg0noa4rgbK+UdHKZP2LMxuj7RU1zTdu5ob+6OVwWEUAXnzvpjDQDDcPcWQHiQY2R0SXm0JAxg==
Received: from DS7PR03CA0205.namprd03.prod.outlook.com (2603:10b6:5:3b6::30)
 by PH8PR12MB6723.namprd12.prod.outlook.com (2603:10b6:510:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 08:45:03 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::15) by DS7PR03CA0205.outlook.office365.com
 (2603:10b6:5:3b6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Thu,
 19 Jun 2025 08:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 08:45:02 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 19 Jun
 2025 01:44:47 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 19 Jun
 2025 01:44:47 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Thu, 19 Jun 2025 01:44:46 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v4 5/6] arm64: defconfig: enable NVIDIA VRS PSEQ
Date: Thu, 19 Jun 2025 08:44:26 +0000
Message-ID: <20250619084427.3559207-6-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619084427.3559207-1-shgarg@nvidia.com>
References: <20250619084427.3559207-1-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|PH8PR12MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c01295a-8456-4591-a5bb-08ddaf0d953e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p+CVpGgwzxHgcx1UJnwo7Skll1+UJgm/h6wyxtjFNtVxf5JgqvpfJ2+CQ3sd?=
 =?us-ascii?Q?O6J06n4s4VGLPbrHYuaAbgUDKlu5VrdGTbA+6ovKS1FRPMip9SsliqwV9niQ?=
 =?us-ascii?Q?DkL0XNirfTvhr7vygX6YMCcNjvb7Dj+3lskjx3oq+Iqe0aLSA26Y+Vedk4kb?=
 =?us-ascii?Q?TcG+Ek1/+bf5y85v0Pd/izFsjF1eERrgUQE8g6M2U7wTLfJNeyhiAlh/uM7h?=
 =?us-ascii?Q?EIGZ20i1abwF+VWpM/1AgKsnr4A6W8IPMD34uxXEG6V7udDjCCS/xQO7ocC8?=
 =?us-ascii?Q?jfSWvD0AJpwI7Av/gTgQyGfvnVHxtIN8WWa0gsJcV/AEgQASbafS3U+GY+4+?=
 =?us-ascii?Q?Twbi8qQhPwevKSjfKFfZngy72KshXPwhJNlZld0QsLGnq3A0dhXY/e2CAI1G?=
 =?us-ascii?Q?fQMrP09BS5CQGBJlUEUqXDpX+VRg9WEN3nS/9E46Ov/rWMdaqABFkzufaLOn?=
 =?us-ascii?Q?XC8TWohWvMut92S3rrrVRUm8qK6qi24FznDym1qECfSik7C+VypKjdm+WXNc?=
 =?us-ascii?Q?Rf79QBZtkmdXtMqGk+aZLz9+GXQz8nQAiUL2YVwYbkDsgzA4X71iAOAkrV3i?=
 =?us-ascii?Q?DeSEOmcoZbQFjjIrfFSiLmKXAA3w75Q7HICDaFWXf5ZubJYTg/GDMhdDdJYP?=
 =?us-ascii?Q?LqhoUOW0+Ea+qjHHelJiDCKn1h1CJ7WC50MmRi3MvRhhNxUNk5HLgbd7WyxV?=
 =?us-ascii?Q?KG4i7BymuUj3zBD+QiIh7x9ZfLIYVtxB+6UdI968i0FU7eh6Vu6yw1cw3EXB?=
 =?us-ascii?Q?owoakmfbfZJwmHeJHqW7tCcan+RZ43Y2Er0P+9AgzVHtglChNbWgbNcygzdO?=
 =?us-ascii?Q?VpLJvXNDIc2dozLYOlJ7oNGn7hfSS5AUF2hoiAYwijtK1f+UEC3HoI0ASTl/?=
 =?us-ascii?Q?ZM50mPJGa60eieRu5IQwgHeFG3ODKaOBW8UFbbS4aJGEwpM9lqLibyx6hLDo?=
 =?us-ascii?Q?4E5TiupV7gB2r43Y+P60H0+bR8re4M0+sJxpMxhD2pHDtB8xiRDCtmftkuQJ?=
 =?us-ascii?Q?0deZkRgI9XX4u0YmvqftRIAcLaetzGFSRS/nU86qZ+n9CvgkM4XsjCvq7Yb4?=
 =?us-ascii?Q?LL7ZXhY64sp86ducSCr5Vbk0vlU3xm7/d8ziCM8KuQgppRutH/tiotAosWKK?=
 =?us-ascii?Q?Uh4X2h5lqpJSzL+JgG7YUYN70L/JGdoU7edoh4hTHLEhDfovWoJ7ixluna2s?=
 =?us-ascii?Q?0oAm+LbI8ZHTQbDgCQYkm8SpOJdU02pduJjOuxK+gZy2e9ByIx7SHalQaXtK?=
 =?us-ascii?Q?nnVoLHIBI1ugYj6WMJSg0I88LYqrf9PQPh0wkVJCTf6YVAN6y7P4jtuSpOUt?=
 =?us-ascii?Q?FCd0IV1++W/hj9s+z6Psh/7iyvkYcOl287u/5+bYHkl674CBP9WSaoWewwLs?=
 =?us-ascii?Q?GgLjLqiFzZMXq3jwXd/sWNy5l5b03fhewFdQQKhurtq49/k6mYIKybBeOZ4e?=
 =?us-ascii?Q?gkdTr7Psz9w9D2HFidzasrpzBjiTWL3KstREwb9rV9RjopyoCwjd2qhnAzd2?=
 =?us-ascii?Q?eGXuyv/ETvBmitrQ+1cURwZYZ5fZvoDJ9Lwv?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:45:02.8375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c01295a-8456-4591-a5bb-08ddaf0d953e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_014510_372912_AC2DE45C 
X-CRM114-Status: UNSURE (   7.98  )
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

Enable NVIDIA VRS (Voltage Regulator Specification) power sequencer
device modules. NVIDIA VRS PSEQ provides 32kHz RTC support with backup
battery for system timing. It controls ON/OFF and suspend/resume
power sequencing of system power rails on below NVIDIA platforms:

- NVIDIA Jetson AGX Orin Developer Kit
- NVIDIA IGX Orin Development Kit
- NVIDIA Jetson Orin NX Developer Kit
- NVIDIA Jetson Orin Nano Developer Kit

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v4:
- no changes

v3:
- no changes

v2:
- moved VRS RTC config to correct place

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 96e21d458867..dbf40411e578 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -787,6 +787,7 @@ CONFIG_MFD_ROHM_BD718XX=y
 CONFIG_MFD_STM32_LPTIMER=m
 CONFIG_MFD_WCD934X=m
 CONFIG_MFD_KHADAS_MCU=m
+CONFIG_MFD_NVVRS_PSEQ=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
@@ -1265,6 +1266,7 @@ CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
+CONFIG_RTC_DRV_NVVRS_PSEQ=m
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.43.0


