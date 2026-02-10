Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FF6EA3F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 06:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=73cSfUHtYEa22EyviomXnRDm4m11u3vtYzytNWnFcmA=; b=Zkj01oPJlwFJKgFADlUK08fEB3
	2I5sJBoe2+6/ow46bm8BZrSIbBpDbShuQSnobR6woVSyVbcAXabUmtQIKJ0W6eqeiIPoh6XkeaZdW
	DHOfG3Gt/IhEXXcQeParskDQKx9OfMSh83i4G2UjFo6xI1fILTaPWNj540xNC29l4ZDkxLqjjK6cb
	eoXZ+k8i3xZ1MagsSMAdyoG9+YW//MfXOc1hoPAFSGWYSLUOEiSQ7yGEvVhoHFnybMbe7jsW1rhbp
	3QlEq+QqY2qax7cJDvn0mEV6mDJY9MHyLMhkWiC56IXNfizWMoAs0wJoUeJX3mSGYQoVyxEvwYSWi
	8ha3AeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgvq-0000000GWAx-40dS;
	Tue, 10 Feb 2026 06:09:06 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgvn-0000000GWAU-28Jp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 06:09:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMZUPTpRSK4GeqPUQ5C8auzq0YU2kxEGEEhhT+dTlsSvZHVXWteEloZM5bn3qlYAMmSnNwfIhOw0n8WtRY1z5VwQrG4V45sh1ljKskGcu/vPvKwMmc+U8hcs9n+xeDraKoNIgU+eaV32bNIko3iui1wCNjUCtRjsC63hbAr8u333FfErQHbEnoAmA6TV5THcQvWhO5qNs1ANYgMxX4DnJ2+MyEbGwqTD2YDOm9NGmRfUMDNY2zqcA8w1pPG7ORT8d5BVHb2KYSg1NHlDe2sD8DKZznTgHqqLMRZ9xzI7ne15a7zRos5KkdJ92tm3sWesMdCNR64HuaWOmIw41xrn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73cSfUHtYEa22EyviomXnRDm4m11u3vtYzytNWnFcmA=;
 b=hk2dDThhVvybO2qRDnWOV3n6/fG25PdHGgIAzvQ0UQiUtMTYHIVZM1Yz/zYow9Y3wksTRPb1H8Hcvac6ohBKZ9lX5pEc5qmx8cWlmSYeMyhY/xvNnOJst1XyQzNMvaIVPlgxa2Gn6K18CbIUwDBgNNOpZ79qShgGDDY0XZRPXRVD/dF3slNUEqlWPmPQbvxrAi1cFl81/NOqJO6kjSRh1S61dGFo7PkiYeaEz4ivJpprT08lIJPEBuZaimtcKHuUB6FhEEnGWoCuuQ3T+mXJtodjv5m4gRVmCY08aNqbbJR6X8hT5Mig+7Uttc3s6EjGBCVIeO9vH8eZHQVjzQEk1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73cSfUHtYEa22EyviomXnRDm4m11u3vtYzytNWnFcmA=;
 b=a7qvmmtqTFV96KloShGyWzxWa7MKjFb3PcE0bfXZDfyhKYtX1HLQuVySUgC2TFXF5yMMiIkQ7B//WsUASVwr1TAgIrXfUDq7iqhnDoioKBL03DmF79M3eUXzV0wHAOf21p7j85VyOL/A1WJQ/b0AKoJYMiBfJIWN6O56kMFX9AQ=
Received: from BYAPR03CA0017.namprd03.prod.outlook.com (2603:10b6:a02:a8::30)
 by IA4PR10MB8254.namprd10.prod.outlook.com (2603:10b6:208:568::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Tue, 10 Feb
 2026 06:08:57 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::14) by BYAPR03CA0017.outlook.office365.com
 (2603:10b6:a02:a8::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 06:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 06:08:56 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 00:08:46 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 00:08:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 00:08:46 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61A68grN3382998;
	Tue, 10 Feb 2026 00:08:42 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <linux@armlinux.org.uk>, <arnd@arndb.de>, <khilman@baylibre.com>,
	<aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <rogerq@kernel.org>,
	<tony@atomide.com>
CC: <krzk@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>,
	<b-padhi@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3] arm: multi_v7_defconfig: Enable more OMAP related configs
Date: Tue, 10 Feb 2026 11:38:41 +0530
Message-ID: <20260210060841.2362777-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|IA4PR10MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef934bb-8d19-4fb9-58ea-08de686adfce
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R5hQpu1/q2ouh8mRO2mJR/YBt/LFjI+8aOwz1GTZnafcCBHU/DFAczNI/76j?=
 =?us-ascii?Q?XIjg54/QEsePSeEFvD2PGl5gyvzC3sXwHAv87vyiED3NcR4gjkGKk0shZMyn?=
 =?us-ascii?Q?SlOxfpRujPa4vAC4msmkKrj1Ia4A3LwYA18d4SMta8oxC92AJxzoXVEOT/Da?=
 =?us-ascii?Q?GreRvUBSeg2BWlqvfCodvjqVZ5SjDvVc9ROWvU/xxCuANnrYmjsjNIpEOuaK?=
 =?us-ascii?Q?FMuFWmrt0V80O0WVzeiSYzT7YQNwxV4+nvTUnDMgcQgIvKtARCDP79Xq8rz3?=
 =?us-ascii?Q?Mzkfv1/zGDcaziijzlEQPjya8Uje3KPe8reZW9UQFAOORKNXe6g9k2x6QUUk?=
 =?us-ascii?Q?Fpwxux8hoVD3G6XI5wgM6V7TtFn7KtpZ9t5kz87vwq6rukFmERuhpOsMFAKL?=
 =?us-ascii?Q?QVDanh4OzoKX4IONi1rYxREOkI7Fv6pPx8UdISWrucdyqHhPQg9pHLNf9qCV?=
 =?us-ascii?Q?dutB/6as8kjEKcE0lwKR0dJE0BhmyTGedjs4u1PNaalPqXOdmU/d0RVjLfs5?=
 =?us-ascii?Q?96y+9HUHKJf/ctxoUxvel7dZDX8UAa/Da6Q+nzgBW6m3vOvP/HFiOtt8dXHj?=
 =?us-ascii?Q?igmCg4upubkFSEERclJBvhYiKWWq6UqpQMOExVW2NzQ4V+FRi8gmIFdtoMFN?=
 =?us-ascii?Q?ZFZtqB4vnaYRh/RtyKG5AYNghtodHpTswgg4b2MYfDiP9t3mw/KSaG86127J?=
 =?us-ascii?Q?0FdpJCi9suKfW5bdKNgag4krNQYDr7jpOm//5NMjvvMLagNOc5uX+mK6cj2C?=
 =?us-ascii?Q?tOtMn2NFCl+Rtm5NUSy0uoQVsEsqkfmdD0n1hxzmRuBsOqVejX82gUF91//5?=
 =?us-ascii?Q?Dmh8cWVM9fG9wrZi6zdkPFwBUrf0rHR4rP+xnPT7Y1Cx+aA09bMNVGu2JCXt?=
 =?us-ascii?Q?wdl+8mve/OQ/OlUkCNDiNtI8ioUr2NcQAi5SNn8FlOa4O/nDkL0ddMXjSwuL?=
 =?us-ascii?Q?77y7BAz57wzQAMDZfc2yxvB1SXtIkPud25ohBNITTyWg+Ay0l1F5ej8EfpZN?=
 =?us-ascii?Q?e6l6+zdh9AwkkngwgM/0qsQsiB64ukxypE4iYqi4EW2/vcwDDHL2PvxrrAeV?=
 =?us-ascii?Q?0n3sTSQimTK9cVduaNAgP5F9+0KxExJ9WKqgwcbCpTZeEwYGfAmH5UtK+aRV?=
 =?us-ascii?Q?LtHoaMvijLbdyc+mfBO0I0yn2MyoxSrwdDh94O6hBdscxBUzial0FPGULuFo?=
 =?us-ascii?Q?QKnUudNCj/3rBDPG6uLfSoXHWCOFeCspl70M5OchaI7WxkdYgsN17rK2FDej?=
 =?us-ascii?Q?LgqI3Aqfvj/3O/9OEfFWtsSaaiDrn+JpJ+wDZxz/s50u2KFMLP3aJl6fzPhg?=
 =?us-ascii?Q?s2r9gEchKnmTTAZ33WqgCJHlFc42b9pDMvp9YIOgYxA/8qTC1Z/oF5PWqC7H?=
 =?us-ascii?Q?F6theYvpu3YKR3yz2/cjmdCMG8GtIliwEDFi0XE+tClDlEaucpdedhIFSVN/?=
 =?us-ascii?Q?09QkS2x0EzfavQECcfhPOsWlgLtEMPBwD2E4uZ3u94lpwJAqEhanhK4Z67rR?=
 =?us-ascii?Q?vuCxfxZ/2wrAgWm5HunO5cSdNQy1ONpDsT62Tb80pSaDU6NsP5ZUy7BAu7K/?=
 =?us-ascii?Q?2xDrHnQwiKPGOl8TFIOG/AtKY1F0j+7HFX1eQDMK5gifL7fJa8wK35X71OSU?=
 =?us-ascii?Q?HiibKBpAN/bI3IzaQBcklFNFP9Ayjh24ZorEeta3R62cXVkPK37Xu/wD8RJH?=
 =?us-ascii?Q?mhJQlHN65MisvOBkC/VeRvi7RdE=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XvjHAJMocsCRp+mYHEpkWSRb9RgJI/HY0kmHcfdNjQqzH4E10bNfR2s/hjpcgw0iTEJjj02C8QsbRZhJ20NlEuEBn5L8u2HtUyRiIRGqpH+LLhfayfNXm36oQg3LbLsL6Scz3+B1FOIYWKoYIBZnyuPQ5Jsbn3MnKxth52dncDW3Le1qxbevMGoFMhg/rgPpNBvycWbYItSeJaT++FMmyD3bfMBVyEgUXq9pxIJieFNyViAXXEMisfWzY0gWXYlHtQqtxZswi3vFV0ZEdUzw1MKLzhl3gFK7KijTKXAQdXkjJfdh77REi9bQjTwMQkyzHY4XBopSLEZHyUxd78bHhVUenzF7Y1yB0uoRy25oP1m7YfFBAUJJzOP6g+uSxYas1F+Akd78q6MFV3hHWpvR+cNTqo9QmYFj0lY8XMh2Pi1QmcR0NsBumYqyAlcg4XMV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 06:08:56.2497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef934bb-8d19-4fb9-58ea-08de686adfce
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_220903_775273_9A7C7683 
X-CRM114-Status: UNSURE (   9.66  )
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

From: Sinthu Raja <sinthu.raja@ti.com>

This allows us to enable various peripherals in the TI OMAP family
platforms like AM571X-IDK, AM572X-IDK, AM574X-IDK, AM57XX-BEAGLE-X15,
AM57XX-EVM using the multi_v7_defconfig, instead of only with the
OMAP specific defconfigs.

IWLWIFI:
Intel Wireless Next-Gen WiFi adapters for AM57XX platforms.

SND_SOC_OMAP_HDMI:
Enable HDMI audio to work with OMAPDSS HDMI for AM57XX platforms.

RTC_DRV_OMAP:
Enable Real Time Clock support, needed by AMX3_PM config for Power
Management.

WKUP_M3_{RPROC/IPC}:
Enable Remoteproc/IPC support on AM335X platform. Needed by AMX3_PM
config.

TI_EMIF_SRAM:
Enable EMIF module needed by AMX3_PM config for Power Management.

AMX3_PM:
Enable Power Management for AM335X platform.

EXTCON_PALMAS:
Enable support for USB peripheral detection by external connector palmas
USB on AM57XX platforms.

CRYPTO_XCBC:
Enable XCBC-MAC (Extended Cipher Block Chaining MAC) mode
to provide authentication mechanisms for IPsec Encapsulating
Security Payload (ESP) and the Authentication Header (AH)
protocols.

CRYPTO_DEV_OMAP*:
Add support to enable the OMAP AES, DES, SHAM hardware engine for AM57XX
platforms.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. Rebase with next-20260209 tag.
2. CC OMAP maintainers.

Link to v2:
https://lore.kernel.org/all/20250616082038.3241346-1-b-padhi@ti.com/

v2: Changelog:
Krzysztof:
1. Updated commit message to call out which (and why) upstream boards
need these configs to be enabled.
2. Used savedefconfig to correct the order of configs in the defconfig.

Link to v1:
https://lore.kernel.org/all/20250611074925.1155547-1-b-padhi@ti.com/

 arch/arm/configs/multi_v7_defconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f75d75cf91c88..1564722b8f665 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -306,6 +306,7 @@ CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
 CONFIG_WCN36XX=m
 CONFIG_BRCMFMAC=m
+CONFIG_IWLWIFI=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_RT2X00=m
@@ -845,6 +846,7 @@ CONFIG_SND_SOC_TEGRA_TRIMSLICE=m
 CONFIG_SND_SOC_TEGRA_ALC5632=m
 CONFIG_SND_SOC_TEGRA_MAX98090=m
 CONFIG_SND_SOC_DAVINCI_MCASP=m
+CONFIG_SND_SOC_OMAP_HDMI=m
 CONFIG_SND_SOC_AC97_CODEC=m
 CONFIG_SND_SOC_AK4642=m
 CONFIG_SND_SOC_CPCAP=m
@@ -1029,6 +1031,7 @@ CONFIG_RTC_DRV_PCF85063=m
 CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=m
 CONFIG_RTC_DRV_DIGICOLOR=m
+CONFIG_RTC_DRV_OMAP=m
 CONFIG_RTC_DRV_S3C=m
 CONFIG_RTC_DRV_SA1100=m
 CONFIG_RTC_DRV_SH=m
@@ -1117,6 +1120,7 @@ CONFIG_EXYNOS_IOMMU=y
 CONFIG_REMOTEPROC=y
 CONFIG_OMAP_REMOTEPROC=m
 CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
+CONFIG_WKUP_M3_RPROC=m
 CONFIG_KEYSTONE_REMOTEPROC=m
 CONFIG_QCOM_Q6V5_MSS=m
 CONFIG_QCOM_SYSMON=m
@@ -1150,6 +1154,8 @@ CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
 CONFIG_KEYSTONE_NAVIGATOR_DMA=y
 CONFIG_TI_PRUSS=m
+CONFIG_AMX3_PM=m
+CONFIG_WKUP_M3_IPC=m
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_QCOM_CPR=y
 CONFIG_QCOM_RPMHPD=y
@@ -1162,8 +1168,10 @@ CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=m
 CONFIG_EXTCON_MAX14577=m
 CONFIG_EXTCON_MAX77693=m
 CONFIG_EXTCON_MAX8997=m
+CONFIG_EXTCON_PALMAS=m
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_TI_AEMIF=y
+CONFIG_TI_EMIF_SRAM=m
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_EXYNOS5422_DMC=m
 CONFIG_IIO=y
@@ -1296,6 +1304,7 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_CRYPTO_USER=m
+CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
@@ -1306,6 +1315,10 @@ CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_AES_ARM_CE=m
 CONFIG_CRYPTO_DEV_SUN4I_SS=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
+CONFIG_CRYPTO_DEV_OMAP=m
+CONFIG_CRYPTO_DEV_OMAP_SHAM=m
+CONFIG_CRYPTO_DEV_OMAP_AES=m
+CONFIG_CRYPTO_DEV_OMAP_DES=m
 CONFIG_CRYPTO_DEV_EXYNOS_RNG=m
 CONFIG_CRYPTO_DEV_S5P=m
 CONFIG_CRYPTO_DEV_ATMEL_AES=m
-- 
2.34.1


