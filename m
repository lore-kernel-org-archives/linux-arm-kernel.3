Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971B6E8783F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkxkko4ftqDaHo/izTn9QHmIISRTtfMp02w5yD7lJmA=; b=uiHXcqgRTs3Jis2/tSNVLev0ic
	92B1bJYoC9R2QwLN83dsB8riTfQb9DSpIuQ2cXYoT0H5xdDqhwyakjqVmUUji6oakm1pa+TelMaNY
	9Qr+kfUbnt/BxpjamlCI2TpyGfIrlHXAx5CR31vrJiH7QSBHjUzI5VXCYTV5m/FB0iLaA9JSh3Gu3
	iBaH/VjlWlENWMW85sekqDCLowabXdY3S2uBs6SmQxC4K39s3fF/Cvakok6qi2ZcY0FndfVzGgARm
	lKsSyKuP1C73TgENo24J0H8bBTrYzTiiN4Orzz6R+zWz1rOBVAt67N+eTWSt79UXFFh3lQWEzUrIZ
	E3Vsacng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHO5-00000006l1B-1LiF;
	Tue, 03 Feb 2026 14:28:17 +0000
Received: from mail-westeuropeazon11010071.outbound.protection.outlook.com ([52.101.69.71] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHO2-00000006l03-3LIS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 14:28:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzB+k2UXhCowv+tiPzF8BUeoDn0Twe66jecf+GE493pFeL1Zb5x8P1XfR4Zw7W++UdoHICxSSeqM8XEBxQUxTnVkaN+jyzN+yLzLlG5oeXUUuK2joi+AycJDpaoa2oqA+paKMZE93xQzL0fP1ZTfXy/5DemKJEdeXsFJR3rFub8qdxDsktk5pr18I0WkdrpWfBNMZIpmMH7LGKz2j5HJqLhY8/FgcMCLMfShmecsKKrEN5/PgTX88pk/Ei0NyJaFqDTr7BNC00FQNIJV4Koed8j2QV7aH+xCgLcOvs/waHzIsef0h/WSe9GGEJEzhmwt759EjWPAzhBjaWrw5WqADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkxkko4ftqDaHo/izTn9QHmIISRTtfMp02w5yD7lJmA=;
 b=NqTsHYka1R38KMHEYFHbH7JexU2SXxpAN+Oyk1zccxQLKKUrmjer0OilrIDu6vnBtp/SLUD+8e7SSyeF0fBdh85MEV/A7zTUYHXJ3P31C64yqVYCjkcAhMz4/33toMbGvqeGFp5iU5EoecB+hUc8so2jsAbbnghYt9eTo/exTuvsdy8iM3J14hw+h1IwPsbFz+cSGTdLv0R0CJ5qbrUYybcSaud1ja/sMT8SLQuNCDDMHTERYVPFzW6hVhmN7zCZyvokhHxjkgN5F1B1un0jGg6ocbOuGUiU9SSY8oTI4B2t/6qkXBpseHR+mS1Gft8kbVlfXxemxN2NsXPQCj944g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkxkko4ftqDaHo/izTn9QHmIISRTtfMp02w5yD7lJmA=;
 b=Oy19zeA2W7RoIEwRtaUDgLna2nBysf8oZrbUj6ahQdDnzXrg7DUdEvkkWQTBx9NSLsW5kANaJ6baatBQZF2znYDPaJlO1X585J2Rlz6AlI8uChX5KER055pDlcOYw+KA217MAXriljHvQWHVitr+jg/vC+ij+GBXu4wkiF9UcYrX1lCm5AZk73Tb+ph5lDC2c49Z4rUmxApe9Cf9L0/HP+pqnJFTMnRpXxxxrOwlSsh/tjbC/pax7df09sPb3BHWEjRmGS+v409ptD3vfMRiZI9ycazk943F+uU1Cs1xs66Og4iL5wCTpPv5QvqufwQNvF3MlxAg3XUQvHggitnc5Q==
Received: from AM8P191CA0027.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::32)
 by PA1PR10MB9102.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:446::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:28:08 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::9e) by AM8P191CA0027.outlook.office365.com
 (2603:10a6:20b:21a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 14:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 14:28:07 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:29:54 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:28:07 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 15:28:07 +0100
Subject: [PATCH v6 1/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f4 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260203-upstream_uboot_properties-v6-1-0a2280e84d31@foss.st.com>
References: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
In-Reply-To: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004C:EE_|PA1PR10MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: 6037ad68-cefe-4ebf-51bb-08de63307369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0JZZDhtTnlUMmU0T0ZYdVhMeGdsQW5JbkVWQWw5SjcxUHVxZmlzbmpvUU92?=
 =?utf-8?B?MHZGeVhxZjhSMjlIY0xSQzhQSXdvTEhXOENZVHFyMXRiNDFTM1RBZlY3MHRw?=
 =?utf-8?B?d3huZW50MFg5QXNYUUpwWllXMzhjZUM4d0tzMy8rdi9aYndZVFZuSkpFdlND?=
 =?utf-8?B?QkNCUnp5cElITUhpMTJCczdNSHdVanlqVlRzRTNwV1VxbmtnRzJobFZLN2ZI?=
 =?utf-8?B?Wm9YaVRuTFNmRDFVYlJocURhRTRqTW8yY0pUYzZvNExxdkFXYlVYN25rMGly?=
 =?utf-8?B?Mi96K2pLVFNTd1NZWEFzcjNjWFNQVG1PK20rUkxiYUVTYmFKQ1d4eFd0L2xM?=
 =?utf-8?B?cUZtL0RqWVRYQVNGQjUzRlZ4V0UzZEVJc2MwdXZrQ2NpelhVaVJaR0RweU5o?=
 =?utf-8?B?dVBuZVJSTjJmVlhNY1F3K21uUXNKc2dlL2Iybjk3b1BoN3FNaUxROGE5K2pq?=
 =?utf-8?B?R2tBMGZqdGQ3a1VONVZCRUpSQndFK1VyTExYWkN1cGFUbGVqTFpOWHFNVm9D?=
 =?utf-8?B?Y0xZYjR4UVlkckxLQXl5Tzl2eG43OXc3Sjg2R1kzN1hSQUhLTWFHVU5od01v?=
 =?utf-8?B?QzJXUjFTRGd3QSswNHBUeFJ6T1BsOXFyZWRnZkloNmkzdlpTWms2WGoyaU5Y?=
 =?utf-8?B?ZVFQQUd2bDRManh5WktyUW9nWGJpbjhDVEM3bENRU0Mrc0VncVVXbGRWU0Z4?=
 =?utf-8?B?azZ3blR4RnNGWjlkUStvazhRdGdwanVJOW1ZbzJqUG53YTcyYnYxQ0lRdUk1?=
 =?utf-8?B?TFRzRFYxeFJHZ3dBMUgwS09aRGh1dVNyaWlEdVg3dlFiOGhFdHRuSE9qay9s?=
 =?utf-8?B?bkFYanU2bUgzeHU4OUQxOW5PMjFXWUV2b1dXaW14Y2xoOUttSkY0MHg4KzB6?=
 =?utf-8?B?TE14MUM5TGkwemRQcDRXWnhmZ3RnNlozVWFLUG9vMHNBSHBvN1dCTk1EUDZ6?=
 =?utf-8?B?bEV4MHE2enNCNlNDZU4wN2dhS3NvckpPSmM5MkJEN0JpblJmVmg3ZWN6Wjl4?=
 =?utf-8?B?c1dJbmpvRFE2N2NObDJra1VtY2JpU3NOZnNza2RDT2c4dElHOHcyRW5WNXMv?=
 =?utf-8?B?V2xOa1lGUEQ5cnk3QndtdDNQQzdPeHVXUXBqRGFVbHJ6dXR2bzIrcHRHUlpF?=
 =?utf-8?B?cUVDMTdNS2I4MzJ3R1dHOTJLT2VPREEranpZb3VGb1QzWHJaV0x3dHVMWHNZ?=
 =?utf-8?B?MjBLdnBGTTFKUkFoTTlhQmxPLzN0cjhSWk85ZVUvcXFRRkVrcEQxUWlQMTc0?=
 =?utf-8?B?Zjg3WDlnTVRKcXVUdkRnckdtS0pkZkdnUnpJbWExN01HUmlCRDI1bmZOMmlI?=
 =?utf-8?B?Vjc2RFRaNThhUjV1K2podlNxYzRDNWZWUUxtUm9nYUJBYkhkWVN6THA2RnJS?=
 =?utf-8?B?VjUycVkxb2NiZlZyLzRzZVdVa3hUYXY3VGxXWml2REYxeXMwc0dMY1NDK29G?=
 =?utf-8?B?T3d3UFNPbks4bEkwZjdEU3dKZy85RHZSUHQ4OXVqcjVKbHBvQ05Sem9DeFJX?=
 =?utf-8?B?dkMzZTJYMXB5SG9TNmJXT3FCbEZ0MDFoK205SXYzeGVXdnhicGhkTUdva2xJ?=
 =?utf-8?B?bG9RMksxbGNnRElWWVJucUI3RkIxdkxKYjJGNjF1TDB6a00reWdYanhVU0xG?=
 =?utf-8?B?WUI0OU41aUd4YWVUcHhMZy9WQm5QSTlNVWxUVWNEL0tuMC9ocmtLVVh4c2dD?=
 =?utf-8?B?Nkc1QksvTHp5TU9MZkxrRkxhVFZiK0FEUGYvZFJ5cnpoRFArZlVrMzdZUVpS?=
 =?utf-8?B?M3crelJiVEl1bWQ0MXhLeU51ei95d2YwL2FIZzc0VmNQSHlQSk42QXVRNlhk?=
 =?utf-8?B?cUpYTkFsOGJIbWxjR0pPa0p1RTc3WTFxK0FLNHppYk1JVU1LNytRajNWRG54?=
 =?utf-8?B?dmMzZmFHWUlQVklPWFg3M2lGQmlkcEJtWHErY2FTT21ibmdVaVI5OG4yb0dU?=
 =?utf-8?B?REZYUUZLMVFrRlBmOUdVb1h1OCtTTVlDb2tXYzE3ZzNyNTBEK2VjaVg5dlRo?=
 =?utf-8?B?VFlSZHVJek5KdnV2TWoyTTJobEh2OTdYNXVFUTI5YXpiUXRieTRGbE96RDlC?=
 =?utf-8?B?cFU0bVBEYVN1WXJTbDZYb2JsNStHcWVMR25za0pnQ2NXLzdTTmRZL05tNEFE?=
 =?utf-8?B?VWxQdmlwZ2NRcENEWlh1Z2pkSlRHSU4zVXdVOGZ6ZjZXcEwzdUx2L3QrbGxB?=
 =?utf-8?B?S1JYZGJ6bmRkUGt4c2dldE56TkNYTy9jR04yWlhaRDlYbjdMTW1McU5WVUJJ?=
 =?utf-8?B?aEdEcTRjeGJnQkIwM1VFekZSUzl3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e8pph64XPapN+nWZAwTn/EeV4F0xE6mM61cc6Rt2jpPH09LxFIcxoVaGGa45ULdBM6MomuwBJOSJ6ILKLslXfzhitxSEs5zt3cOsyKSlo3n0k7K4axAuU1YaacwiJElMyNaM0Ik3U82isIbVcSPS4rEY4LONzMTnI7V1LMwvGPUYAJrziydrBO6AJBa3g79XqBRDMxklbjdiVe4gid/F3yDzCTTLCMi4ZOWJNlhasCwu5X2BFpt7nH9LaTE6hbq0Bs4VwAKk4gNlyEFwYj6hZXgKfU6QzDpQrZTqCLH+RgCWvAA5eRvSSZMb84pnvGUg9CN5vBs36hoKl1IQQdG95xQwZjZ8aFmtQp6eZ2wKdgj4QFei99VQweEskRHvzbak1RtFk9Qc/KD/VDezf5gDk7vU4vy0pWOKiXpTjz+MigOl1WbLA7tKpG8Ri0JYq8L2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:28:07.8232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6037ad68-cefe-4ebf-51bb-08de63307369
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_062815_372801_77AE799A 
X-CRM114-Status: UNSURE (   8.93  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32429i-eval.dts  | 80 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f429-disco.dts | 80 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f469-disco.dts | 72 ++++++++++++++++++++++++++++
 3 files changed, 232 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32429i-eval.dts b/arch/arm/boot/dts/st/stm32429i-eval.dts
index f4b1c4eb64f2..8a08b9f6b837 100644
--- a/arch/arm/boot/dts/st/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32429i-eval.dts
@@ -188,6 +188,15 @@ adc3: adc@200 {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s_ckin {
+	bootph-all;
 };
 
 &crc {
@@ -209,6 +218,50 @@ dcmi_0: endpoint {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins>;
 	pinctrl-names = "default";
@@ -278,6 +331,18 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
@@ -293,6 +358,10 @@ &sdio {
 	max-frequency = <12500000>;
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers1 {
 	status = "okay";
 
@@ -325,6 +394,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -339,6 +409,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "host";
 	phys = <&usbotg_hs_phy>;
diff --git a/arch/arm/boot/dts/st/stm32f429-disco.dts b/arch/arm/boot/dts/st/stm32f429-disco.dts
index ded369abee4f..047845ab3d5f 100644
--- a/arch/arm/boot/dts/st/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f429-disco.dts
@@ -113,12 +113,65 @@ vcc5v_otg: vcc5v-otg-regulator {
 
 &clk_hse {
 	clock-frequency = <8000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s_ckin {
+	bootph-all;
 };
 
 &crc {
 	status = "okay";
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins>;
@@ -176,6 +229,18 @@ ltdc_out_rgb: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	assigned-clocks = <&rcc 1 CLK_RTC>;
 	assigned-clock-parents = <&rcc 1 CLK_LSI>;
@@ -216,10 +281,15 @@ panel_in_rgb: endpoint {
 	};
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -234,6 +304,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	compatible = "st,stm32f4x9-fsotg";
 	dr_mode = "host";
diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
index 943afba06b5f..ecd33d6003b3 100644
--- a/arch/arm/boot/dts/st/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
@@ -181,7 +181,52 @@ dsi_panel_in: endpoint {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -191,10 +236,26 @@ ltdc_out_dsi: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers1 {
 	status = "okay";
 
@@ -238,6 +299,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -252,6 +314,16 @@ &usart3 {
 	status = "okay";
 };
 
+&usart3_pins_a	{
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_fs {
 	dr_mode = "host";
 	pinctrl-0 = <&usbotg_fs_pins_a>;

-- 
2.43.0


