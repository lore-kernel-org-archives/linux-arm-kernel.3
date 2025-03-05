Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9470FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 05:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJDTS3ojO+ITkFNcFvJtFsgHn3v4KjfAcX4NMBcPAVw=; b=tTmwOfMs+3yEZNMWp3FXgbWBwX
	AmSAk7ukTJxVe0OSUT62Uvg2FSQUYs/bTBxOJbMw6BVVALNQukk86Xk0Oh+mSH+onQ/oye3bWyHbp
	igXZCFSejQTlF+TwpFmr3JHQmdDiYnKLtGvIA89zfeNo4ss8uUDK0AP+HYvF7RZClusOgu2L+WP8z
	JxHdTKeCHPObtzP9cU+S7t03mdBu8Nvebx7YwQY1JlZGyqTaXfesj7WFoWlgS+TGlQRMzB52tTqAZ
	gOoav4zzutTBtsbTB/ZZmFf7GzBci06EKcpi17IplWnZYHkvEBM2kbfqd3eubAVuMFlWaLq1zdzPJ
	n4al35Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tphc9-000000073Vt-1rBJ;
	Wed, 05 Mar 2025 05:48:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tphT0-000000072cW-3ruR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 05:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JJDTS3ojO+ITkFNcFvJtFsgHn3v4KjfAcX4NMBcPAVw=; b=jmlBQ9Jg8hwEpQ7EjbSSYRnePv
	3VksgWSOy6Zzuccw/MB/3rDEqy3v3koB0gzx9kBSNovabdTP9Qarx9Np/sZo+R+D9dnvN/1ZapM7r
	NsjvJlBHrVu51J5RC9SwMTeJINx7K3GhwxEhhPAvLaVzSw2vfkDMm8G7j5cEiQzeoaESRd4C9/rzB
	L0Qw523ggqkowLip+t72bq1CwJzOWMquueO2QgNjsKCAzLkOF3qCnSRpNmZU56Ig8o3NzU+gp0xi4
	D1XjKaO2tCXGl0Vo+euw1X6KRN4ujAv43ykJqnSdrW/SRHh7FSWgpEpq600JkOEhpg3xzxos0L3qH
	dp1ixtlQ==;
Received: from mail-psaapc01on2070c.outbound.protection.outlook.com ([2a01:111:f403:200e::70c] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tphSx-00000000N76-3jvM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 05:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKDQke5gvmUAB7VCOJMesK9V9UqD17M32KaKmuXHAL8WN8MWTwaz85Q3lzDn9KYqm3jP+zcB+74O4vKXWZJJSvU1jB9VIcGp942yWxccc9C8nOs7xPGYZUWstDee+1Uy0RxIlITPoYKAsaHu6OfBw1ObGKrC4mAs2Mw3T7/u7/JqTOXn42+YM7MXtJwK9xHtD+3YfqTm5KYPxFrToUMdqgOLFk7M1SI58JIMcDcjbM+M5q0ZbbXED1EdvubU3u6/5HPczqHx6fZ0hq3IZSljDK56pmRiFHUeEH0LDa0K7K+UaVGUdWs8aFre1mKhrMcBb5IzMf8oCvegCZarbw11gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJDTS3ojO+ITkFNcFvJtFsgHn3v4KjfAcX4NMBcPAVw=;
 b=MNnJrD3QoHvy47fuub4k/yMqzJq8lIiIg4D+o0vgy1WXRDyKjrBoE510Wwd81ibL3hvpE2C/WVN25pHYlDBm9SnwYW8mAGBUWTtnxU/je38pjVfrjGxG6x5DLTNBDEB7vzzmazZoQT34vjnhiAniOSNUBV1RZudGmC0vGsDLaJrkyJmeC5Dshhs8gJFF2TRn6CNqGcr3inbhEmWYnjSflfAHX2ab2eK6Ov9LLHYUELwiRWaVhyH340E9ugkCEHLQb2tn4cZjdyvjyq9aHqlrLEViWqS2JhTEtVeVPAQRiPyJONtNbdRXcPAg8s+3whWJelHvr7HvqiAYB/yF9lLMXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::22) by SEZPR06MB5198.apcprd06.prod.outlook.com
 (2603:1096:101:72::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 05:38:25 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::e5) by PS2PR01CA0058.outlook.office365.com
 (2603:1096:300:57::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.29 via Frontend Transport; Wed,
 5 Mar 2025 05:38:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 05:38:24 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CA5FC416050F;
	Wed,  5 Mar 2025 13:38:23 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v4 4/6] arm64: defconfig: Enable CIX SoC
Date: Wed,  5 Mar 2025 13:38:21 +0800
Message-Id: <20250305053823.2048217-5-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305053823.2048217-1-peter.chen@cixtech.com>
References: <20250305053823.2048217-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|SEZPR06MB5198:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a275c12e-9178-42bf-d94c-08dd5ba7f2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?woF2l6wSBX9tBsz6nT1cV3jngQLg2UjkVx2xBmx3lcjLC4G/NCnBUoPLjxQR?=
 =?us-ascii?Q?+a/J5DVP8dn5kRjQE+ccHu+qQDkKHPjsxzTQCWvz9h/n+AAm+FpA9G+Dhok9?=
 =?us-ascii?Q?3P264qq0yW1xD7oj4pROvjU6U+DppVsz7t+0xpTzlKzgt1aIyTDWd+iB+60j?=
 =?us-ascii?Q?xOkL6Lt+6NHAZZ1iO/RMrjot9DKOriuS1LFmIRg44+L8CDBWGNk1B2P+Dl2i?=
 =?us-ascii?Q?PQAU79KCyynm3+EL/vUEUEkTxe7eNW5/9pdE88XKO4DlOoQr5eZfXr6VilN9?=
 =?us-ascii?Q?KmAcs0hrIO9PYMfJo4XPyinrdJsmMwi/KZ+zPbo4CLlaPCa9xvuLQJPtAQzJ?=
 =?us-ascii?Q?mG80ApF+qHjucGOehQOui3OwZOPgHUrnToz5WpYel/DUD54bu1oWhducAtNG?=
 =?us-ascii?Q?dbkPrs0H3GZVLnW/ZtRcm2iZkk3NsFFUneILlPHPKqogRofKeVJ2kcL8T1x1?=
 =?us-ascii?Q?NaR25zytHdITtE0yxzPsYz2tDt0TrBWePmn+DPN8xXclFKPgDp8Tql9HX2Ra?=
 =?us-ascii?Q?nuhf4IvPcBjGv80nCAbXE2h1t/ZCX4b8Ow4fCJSkVlNCwuql/v8k+mMkqHLL?=
 =?us-ascii?Q?bEzZfVB9nbY+KEePxaAa5wRf9YkrwfK8UvYRAy67VldrJGP3R3D6KVgGYTso?=
 =?us-ascii?Q?JjYajdxv/LLS1G7t6UDKaZPVIUnmhfrwCkZm20SViiJH2L9QJS3QuRzEKkjB?=
 =?us-ascii?Q?V0Ie6D2Lpvk8s0GEAR47oWReHAcDYttlXIZZ9caqaJv9+oO+PYT5LCCgrFaV?=
 =?us-ascii?Q?RarMfpSm03QfNCDMD3W3+DlWOl9I85TE0VZVyD2+UPtZDJGOkol2RplufdfP?=
 =?us-ascii?Q?qzPikjEeqjAtZESAfNr84H0TbxxUI/NLZkACh0saXfYfuQrBJ3minTMhSVIR?=
 =?us-ascii?Q?CLH0Rya+zEt3ewAOkbUYkrFVJat8aBtJlB3+xvK1DfoNNh+nWs2QSPWDSqSS?=
 =?us-ascii?Q?CMgOsHwdDarn8DBi/T3qT0V4TEMTyNmKcOwcD2tH1X/F0t5Lm1lnE5pSK4rW?=
 =?us-ascii?Q?8bDWL9sZ53Fd1tticS6p8U0nYh6HtYW54hmFCKeYJmAhuYAyagW9fuJQ3h4p?=
 =?us-ascii?Q?C1sTZMgbpFMBmPtcN/itiI6qyGXaSF0634rW/ugLURwqzdcBIc6aFZYbdAIq?=
 =?us-ascii?Q?whlRvP+2RNzgqVWtDSi5D0QDZYHKjaesEuxr7QV9z3KwouN0BNNhcYalpBeV?=
 =?us-ascii?Q?7eduo6COOu8Rn0DOv6Sbu7umu6asPw+O9AuxzUz2SP8Wo44SLa5rw2Ah2FDt?=
 =?us-ascii?Q?OPNCe4iA5oye0i1/pRPYXnwX3vOjArczzRr6UXXoLT6KxDgxdaq7LGAPwih3?=
 =?us-ascii?Q?ePZ/XRqY6a7COp4oHpKnNK9vBHP1e2h/yknueaadhPdHWYQUrbwZJ0+uUvXW?=
 =?us-ascii?Q?F2+w6Ds2h4LsLjRaTHvYnjdSUFQHhos5DYH15hiMYqVp+GszvB+PihewlwTw?=
 =?us-ascii?Q?Cmfr0S1pUiI5VrGauEcVxJ/icpQgCD3jlR8HeKw2CqJh56E1eo/d1JbAZaOR?=
 =?us-ascii?Q?4ei5P0jo+81xzKs=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 05:38:24.7081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a275c12e-9178-42bf-d94c-08dd5ba7f2e7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_053848_061960_4AA9A763 
X-CRM114-Status: UNSURE (   8.18  )
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

Enable CIX SoC support at ARM64 defconfig

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v4:
- Add Krzysztof Kozlowski's Reviewed-by Tag

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..1dd46d200401 100644
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
-- 
2.25.1


