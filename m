Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B497C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXzEBs56JYF3kuyf685C5oYk8b4lm1+jJLdzMsHhq2c=; b=xcpp/KrQFEkyqTyNEOvEwA+qt1
	Jm/zI7aCdDgnUaHjvweob9H/0hBkpr2kCsi5QOMfj0UmMpR3tDUcyZmW0N3MArX4hvuxSsTYwdf99
	Qw1R2FhnsjiL3Ij35vLSUiscvlw1WegyYHDc4IW7Ec5cv/DNy1ge7KZxS/XCWnde+i3+tgXGu6rhg
	G1VZCaRZ6ne8fag7F8cQX9FBHqTjIAuNjeT1jyCZno13u4mQdIYjjvSgdxv7hWVycnbuM6LtpQRJb
	f2bhByzw1Lq5VlI4ifDEFrYNfQ+fb44+RySz3ZhKEfNenXAMXEwoZ6bN2RrVgX6rNwwiuyrkW954c
	Ff6ret+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbT-00000000CU5-0TxZ;
	Mon, 21 Jul 2025 16:43:03 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrlX-0000000HZwK-1X09
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRHpE9il0elBnPVmXu5bpAxXy+rmO5v50NjJvyKV5qbJKdpHQb/YkAn5Upjlzv8AoTiN06JMjVrkXT+6gbYcBgjgWIDrs8PHe3pm5mhfliSwgxXQKcuvviqCb6nWLJvt5eiDfRbAUAT3iHxzVW9hrZAO7pXNTHMGqixSxKKTS0OoHb1UmPi+57nsAzgiLKb0g4EUrhdAZQNXk8nwz63y4U0yV69RtXnzcIud/18EZ1dJQ5JFr/82+b+ZCczN6g3/vyf4L1SN9GXHw7pzQOIcpq6ZcgTXbzWfxU3h6sHENEV1p+bEqCGkAVYF9OCmmhOOnAQgYjTXhYwOnj5Q3lIFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXzEBs56JYF3kuyf685C5oYk8b4lm1+jJLdzMsHhq2c=;
 b=j5TvFJ6/QCp7AkPGN9qcVySmxPcFAKEALUbYv2sdfD1guxhlwp8NrXMeGDYhy/mVV+N7WbhFm5JD8sZzqIv5k9JgmWeXaqmRGA3mdQOoHFIhI6YxhRbJ7kE5N0tjK6jYM0VCOAC5PA4Bey1FjYtNXr9YS7xBsWf/YTmCBMgz4ZILR7pZNkT92+0Vn9/O82p8qteg9HdsYskBsQAxv9ad/3SeBkBhMwHH8Of0Zqvt7NUXzDbOtrZ/3hiNIpl05/ZatQU0P8f0Eq/fkjTT2vLPhEnNJrKyeoTSqDX1MiKpe/H/FVA2oTfxgNnyoVNKkOHq22gCBO0/7ISG86RymV9tKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR06CA0190.apcprd06.prod.outlook.com (2603:1096:4:1::22) by
 SEZPR06MB6569.apcprd06.prod.outlook.com (2603:1096:101:189::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 14:45:07 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:1:cafe::2c) by SG2PR06CA0190.outlook.office365.com
 (2603:1096:4:1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 14:45:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 14:45:06 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BB52D4160511;
	Mon, 21 Jul 2025 22:45:00 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@lists.linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 6/9] arm64: defconfig: Enable CIX SoC
Date: Mon, 21 Jul 2025 22:44:57 +0800
Message-Id: <20250721144500.302202-7-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721144500.302202-1-peter.chen@cixtech.com>
References: <20250721144500.302202-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|SEZPR06MB6569:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0fd3f070-00d3-4dd6-a704-08ddc8652f40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mlZu3zKxOqlhjBV5CT/BX4QRPGRzu1YErauhvAgGfQx2emqYIkHIpruksU/F?=
 =?us-ascii?Q?dryKJP3r9xa/rbaQ8TeK+2hitZHdAG6WaF7GaoapYUwGWjP6FoT13ZOnvgRI?=
 =?us-ascii?Q?oe/xzmFL/CYyAU4BVKOX74La8dTRAQsm9cryKvAcIlLcH5ckJvx24Ys9DFrf?=
 =?us-ascii?Q?xLnt+/gZ2uHZQzy30Ht0Tes58KB6/VmgwyM2Vzbgfip6VES5W+n/8rxjmX9n?=
 =?us-ascii?Q?DhAfAekaPBYtrp8eutIi2n3L0UsDPL1lBgmDwlV0ddg6b3MKVLAmVMVim4A/?=
 =?us-ascii?Q?NUtiOlvjflbaOTvpPuKChoyfLP86NKbKu95YCcRHUeFr0padWWq7/P7SD0Sl?=
 =?us-ascii?Q?FCykJW/+gKN7q4JtIaXc+vbWT1Zc20uE+l9HHODd/CBEaGNssm+uq8fzw99P?=
 =?us-ascii?Q?QkQlurAVLCm+1YqbOwFUJ3EIcds3WldPjZIdebjB/rj2jHsKDGqd39FrS2Ga?=
 =?us-ascii?Q?Gtgmtkg7QnhO21AdtTsgzO1zX2CZB7bU8v68ct9amos51MBxA+SgAYQjoC6E?=
 =?us-ascii?Q?0eyUn2EHl+izmDB4Xo2rnPyvO3QIz8tiMrYGByrWAy1+HipoG/dQoZj5Jpdr?=
 =?us-ascii?Q?zBLXQhu7QPbxO+4CzPdbmjOKxuOr8mitrqfN5uNSPB28sKQaOy7Sgh/KZKtE?=
 =?us-ascii?Q?Jja3CYvIm0SNRDwd4dbChrd55r332i/Mcj1dem0DvKFnZlk/v22twIyo6Sw6?=
 =?us-ascii?Q?SH07RNRVn/OQ5ZL2nN1aUNkTtA0GiOyW1wCidxSM+Azts1DxB/8xKGhINo+m?=
 =?us-ascii?Q?50+0uw9oCqeHtxr9gNLApUqf6+tOsGgREtMg+vmnU9s92+3qtDToOVyVu5wq?=
 =?us-ascii?Q?Wflf/pNxJnqWHMnvdL74+VKJwqJs4ShyG0hOawP/KrATyDF9foMmjfe6rZUF?=
 =?us-ascii?Q?Ucd+pvn7Oimm0ZH/eiTCTpro1SGqx0VhuV5ZLDQjJcTTik685kpT8mVXLGtc?=
 =?us-ascii?Q?yHi3lz9qBqyDdFZaM4Bkzwk+OLmQVnXi6SDZmEbTA39HEJAHnls7/pGF1jA3?=
 =?us-ascii?Q?TtyRQI+bzgmPr7yOapHcl1zhMc1J4VJntBuXMi/TBt/I/O0yy+rtY/e9wa2S?=
 =?us-ascii?Q?fxYL8z9CMt8iUYjTW8WwPCFWJYt77+R4oZehFZo7onQxgfzCNNmMjOEZoThj?=
 =?us-ascii?Q?OaKbo8bIvSQWGOF+R13ZQZN/NwrCoB5q2gbgpMIxCKO3nWgNjAsOvxqyxYvm?=
 =?us-ascii?Q?sZ9nvQ0RDMxyIOouXgFUuwIrLkDp1gnAordAs1bHNdeNWtdqybtzncorFw5P?=
 =?us-ascii?Q?Ck8LiEz99bSTbiHxTfbfAvgFFiuzNEHcInHZMo/xlIsPSv8oSH6BL+dEXi9f?=
 =?us-ascii?Q?NHr1+uUl8hbBPxdE9K4Y6RB1blC04fxx79SUzpQiyLNt3qvrDpHKmNhDRZHB?=
 =?us-ascii?Q?UuQMGk8jwgR2Cr3mNvIWeX0tDGuZO01nNUc5PDS7+DjiKzpDuAEfetiiJhmH?=
 =?us-ascii?Q?NoVlxjZcXPtS+QHQ2oJVi88hziJVFoUesKk5TiR9jJ7hbVlBt5VIH82+kwrS?=
 =?us-ascii?Q?Y+dBSFeOvSRTCC1TUQzRxjOsYpYizJq3z2iE?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 14:45:06.4509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd3f070-00d3-4dd6-a704-08ddc8652f40
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_074519_406989_1B21A794 
X-CRM114-Status: UNSURE (   9.64  )
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

- Enable CIX SoC support at ARM64 defconfig
- Enable CIX mailbox
At CIX SoC platforms, the clock handling uses Arm SCMI protocol,
the physical clock access is at sub processor, so it needs to enable
mailbox by default.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v8:
- Add Krzysztof Kozlowski's Reviewed-by tag
Changes for v7:
- Add both CIX SoC and mailbox configuration at one patch

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..181c5f91b032 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -45,6 +45,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
@@ -1445,6 +1446,7 @@ CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_MTK_ADSP_MBOX=m
 CONFIG_QCOM_IPCC=y
+CONFIG_CIX_MBOX=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_ARM_SMMU=y
-- 
2.25.1


