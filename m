Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC541CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJ4+9rYjXrfFLv7VufPA3HWImdvPeZRiGqcKZswgDf4=; b=tqaNSZYyfonNTWKPHlpmYWfGOu
	fylS7x1TOU4a9CfwKhQB5Tqp8h7CtzT7RP48FzhJvknXOyh1r5W0FP5wrxI81F5MGhF9J7Uh1TrlV
	kM9EbF5JoY150LR4jkY19I7tOKGgfkwHSZfvaFuixaXPEqV+6dnUMNZTlwgNg93i6epdlRvYtLKeR
	9GgZ0hvUuykxiUTELG4NDH8DplEcmltsEMhyBWyOpQSny+0aDIt5+RIj0u8iSKreXgs6wGbbaY26O
	6K68+CJjvsypH+aHFUaSBPeXeYf4rQcfFkRqur/c/VKWx+vHXnv64Tprhn2zXz8pBIGh+yo8/r5YM
	iC2I5+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv9j-00000006Han-2U43;
	Wed, 30 Sep 2026 14:19:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv9b-00000006HUO-1Sb3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HJ4+9rYjXrfFLv7VufPA3HWImdvPeZRiGqcKZswgDf4=; b=GN7VqM1HSATxwwpANnYgFUtbXx
	5K4T6lnhG4R38XWNo8PVDQg6E4292CQmis3UcJjfwKcMjQDrDMsNyod3nwqEADG1rYIuKBztf8MHr
	OkMTxDyZUnDI1SLTDyfbJPCCVVYQCHmJB3CpWutbnySknQtKOVlmREHAdjLNiZcV0kn6ACEKS40Ww
	dE4E38EXdP2bf0bIKjKX8ZXvNrR6rGReG9UMnLUuM42wB8fdGnl/EQqpAZ8/LclwNhZYyBueaedsH
	w69c1iT44exdTPaJGsNWzDf7Kt6M0P9cfOxlRw+3QSM89OeqAXBMAGpb9hKYLNXOwTbHHUMHBEQEm
	WI1Qf9PQ==;
Received: from mail-francecentralazon11013055.outbound.protection.outlook.com ([40.107.162.55] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBv9Y-00000003uaY-0Bq4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:19:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIGNcC4StYOImTpMwH9xjQSXET0u1jmy0rv2tFxt/BBnhXKN6rYLtbNrc2zqllOYQ5d5vQg2XNB8ReWvoYDt9fKheb8Erdp9qjYn6ZwA4QkBI0GnwyJGTjCn7wCbiN47MC1jVEzQE9yEP8NsDaNb2vUJ2CX4ryxw4crb56qlwjCrrtlZ3ZVclg4COI9n+eaZIWnSvoQhwMdNcmYwVdWpwuOmSl+wy5FzmJdoScGQbD6R9r3V/B3FxdgBCEViOUNzcsO14FTEdiAksXLY9bJPkBgVY0gEvOgPdFwyVk1ShTP5FvfxSeOYqFDq3v6jHLIiiN+z5vPdFl9s4zLMZMycyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJ4+9rYjXrfFLv7VufPA3HWImdvPeZRiGqcKZswgDf4=;
 b=OXRUnYL92w0dGfcaZ46ax96Pu18TO7AwuRPeCSafE/yjtoOhHeuSt5r282Eb8YhTJp+bYyXGzMFPX4ayzESTzyK/NASFzxsXJaO24W9iHl5VQOuQGrhbH/pa//AzsaeH/7zecoW1z05HSn6YHDL32L0FvoegVuWQutBWdxt249R6Q2/RHLhKCu1UQ7J42gxyWHuwoKCJIopx3db4H2Nb0Tgs1e8vP2EAE3b6aWAtgN/N1FtWnRyARvY1SOJJmWRRqrUL5AtPHmykLb4nBXAsgbmJsEzqkMG+nbuzpUZwMhEIsBOC05P1V9CemUOFC8507d+CYbfU1fMYxYuXO6CJhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=baylibre.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ4+9rYjXrfFLv7VufPA3HWImdvPeZRiGqcKZswgDf4=;
 b=OIjan57hNKzcZvqGkS0sXkkvfIoN+wSGD++jl18SgUPcd5VkXFEPkoT5W2vfLx5SdMYL6dvNrJ84HT+A/SPRR2BR0lOp7sUqwrbw0ozOZhan/OQhcXZKKgDqAJxQczT5V9wUSlTXznhI69sTURYN6cs5+uCulxPoxkb5DMwGAo3AX4yx7kaFze7bxBm9q/Na5hz5UyqmHDZfO8fHBqS/QUsLFKVAlBpXCaxOoY+GFE7Mw1aBILD42aWCcA/pzl1NqMFHYNp42/mFhd9Czlky2ZsKZeUXE5h+TS7AFZ1Oi0kRveJWgC43+qYKeCzdPuZ7JdCsPSrrC1y5pgstfiBCdw==
Received: from AS4P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::13)
 by GVXPR10MB9086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 14:19:17 +0000
Received: from AMS1EPF0000008D.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::46) by AS4P192CA0028.outlook.office365.com
 (2603:10a6:20b:5e1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 14:19:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008D.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:19:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:25:08 +0200
Received: from localhost (10.252.17.140) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:19:14 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 30 Sep 2026 16:18:26 +0200
Subject: [PATCH v3 05/15] iio: adc: stm32-adc: rework internal channels
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-adc-stm32mp25-v1-v3-5-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.17.140]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008D:EE_|GVXPR10MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: f42f6d17-b20c-4c9d-5f59-08df1efdce81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|1800799024|376014|82310400026|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 8rqLcE0ChbfZPEYiaHbVGF3i1Oz9fPG8m0E3Hd+1qdsGa1VLOiS/yQ9HxM+v4w4KnRsyIYQ5841Om6kEsYnsA53TI9WzCQJFF4PR0vcU4+AbtNWf4lBZsXFmJQL+6ELLCfop8HaS5QOLwp6V2ieEk282HICIzKkPxzGkNjQgVFbTdQFtrrsAbwddKKR6enayivhQzXTDQBp79Vfl1OY41190qoV8YpeMW2AFP6tIbJDGAetFuQR3nW9kHzCqIzK3p5u2kr141xtJHCB7TzEYd+J1cDZrJ2q2NK47vnvWY05x6CGor77IeQ7RRx5+RoxyGQwBmutMTifUB7ArNChT/EmELwVHgvSt43/+XNZbo8DTRc6CV4hI5RvXXWH9FRcZCnCD3JPisr9o17rps+RwIrzrMLNy0LjrpBqQwGsIidzQeApgHsTUd2WjKGgP/KdtvzCYPtkqegfVEaQwceB6GOB5VlvvzcD5zcokOJPtSPlX/523/gDKOcw3Sq+RfhdL+4QAmoMExfaf6P1FqAtPeR7mtrCIMJ6tS2WLhxeQELWRbiTf08GESTCdd9eG18Y9lzC6VbA+yvkN01lGezXwJxdw+Pu9jVZJlP0AmnITX6GevmL8G0eTZecJoD9oJqYpKJ05bF8bzGJgrMBofDbNOKuD2yQ2zIpQzI6vjUHwP0V+gWGOqA7hVoPYClBLlIc0DDrmF1oFXBqNTomLJXrJmA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LCr7nRUJzOa1bT7/HFKznUm9oSfpXXyRLab4vBb4/Ll5R1F5KRIH2M1dezr4QGeS5xLM/f5K0jZtA/dSsEF8OQtiI4IXirD5j5ZJ+vb3yUd4RtGP1qIJd0LcnoRPp9eP3v3d83Wazjho4WTy9JoEq+xcpT2U47gSsNTk0+DcfOsKNgg5lsWAqQL5cngxv0Op++hLmTFoQTzH/9OiixlWHKgZGGyY4M+UdVTc+yVXmKfidtdktw4TVVE+7TMNFu/o3hapiniYpV38UrTOHTBd4EQzkmWgx3AVXsYrBg/wHxyDrAoaHFPV2hNQ9s8Rct25NQG1Qf5LvJOQf0OqQnXhxdXuI6xl13AILuZLWVcGcYoor0EDlOQkNVKqUsenRsRZ54zEadbAUvhHjoV0GbyU2yM3BQwwCaoaAabg+At4wA0lacgdwCNscsxggD/LfVuX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:19:14.9138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f42f6d17-b20c-4c9d-5f59-08df1efdce81
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_151924_683907_B44AEA41 
X-CRM114-Status: GOOD (  18.09  )
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

Diversity in internal channels data array lead to have zeroed data.
To facilitate addition of new internal channels, without touching
all array initializers, only focus on exiting channels on each
supported ADC variant (e.g. each SoC).

This also allows to get rid of static_assert() checks.

No functional change intended.
Cosmetic update: remove comma on STM32_ADC_INT_CH_NB as it should
always be the last element.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v3:
- style: add commas to non-terminating entries
- Rebased on top of "iio: adc: stm32: fix minimum sampling time values",
  that has been already applied.
Changes in v2:
- new precursor patch as suggested by Jonathan
---
 drivers/iio/adc/stm32-adc.c | 51 +++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index fa46803d54be..75b1f17f664b 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -86,25 +86,16 @@ enum stm32_adc_int_ch {
 	STM32_ADC_INT_CH_VDDQ_DDR,
 	STM32_ADC_INT_CH_VREFINT,
 	STM32_ADC_INT_CH_VBAT,
-	STM32_ADC_INT_CH_NB,
+	STM32_ADC_INT_CH_NB
 };
 
-/**
- * struct stm32_adc_ic - ADC internal channels
- * @name:	name of the internal channel
- * @idx:	internal channel enum index
- */
-struct stm32_adc_ic {
-	const char *name;
-	u32 idx;
-};
-
-static const struct stm32_adc_ic stm32_adc_ic[STM32_ADC_INT_CH_NB] = {
-	{ "vddcore", STM32_ADC_INT_CH_VDDCORE },
-	{ "vddcpu", STM32_ADC_INT_CH_VDDCPU },
-	{ "vddq_ddr", STM32_ADC_INT_CH_VDDQ_DDR },
-	{ "vrefint", STM32_ADC_INT_CH_VREFINT },
-	{ "vbat", STM32_ADC_INT_CH_VBAT },
+/* STM32 ADC internal channel names */
+static const char stm32_adc_ic[STM32_ADC_INT_CH_NB][STM32_ADC_CH_SZ] = {
+	[STM32_ADC_INT_CH_VDDCORE] = "vddcore",
+	[STM32_ADC_INT_CH_VDDCPU] = "vddcpu",
+	[STM32_ADC_INT_CH_VDDQ_DDR] = "vddq_ddr",
+	[STM32_ADC_INT_CH_VREFINT] = "vrefint",
+	[STM32_ADC_INT_CH_VBAT] = "vbat",
 };
 
 /**
@@ -2268,7 +2259,7 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
 	int i, ret;
 
 	for (i = 0; i < STM32_ADC_INT_CH_NB; i++) {
-		if (!strncmp(stm32_adc_ic[i].name, ch_name, STM32_ADC_CH_SZ)) {
+		if (!strncmp(stm32_adc_ic[i], ch_name, STM32_ADC_CH_SZ)) {
 			bool na;
 
 			/* Check internal channel availability */
@@ -2302,7 +2293,7 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
 				return 0;
 			}
 
-			if (stm32_adc_ic[i].idx != STM32_ADC_INT_CH_VREFINT) {
+			if (i != STM32_ADC_INT_CH_VREFINT) {
 				adc->int_ch[i] = chan;
 				break;
 			}
@@ -2717,8 +2708,10 @@ static const struct stm32_adc_cfg stm32f4_adc_cfg = {
 	.vref_charac_mv = 3300,
 };
 
-static const unsigned int stm32_adc_min_ts_h7[] = { 0, 0, 0, 4300, 9000 };
-static_assert(ARRAY_SIZE(stm32_adc_min_ts_h7) == STM32_ADC_INT_CH_NB);
+static const unsigned int stm32_adc_min_ts_h7[STM32_ADC_INT_CH_NB] = {
+	[STM32_ADC_INT_CH_VREFINT] = 4300,
+	[STM32_ADC_INT_CH_VBAT] = 9000,
+};
 
 static const struct stm32_adc_cfg stm32h7_adc_cfg = {
 	.regs = &stm32h7_adc_regspec,
@@ -2739,8 +2732,11 @@ static const struct stm32_adc_cfg stm32h7_adc_cfg = {
 	.vref_charac_mv = 3300,
 };
 
-static const unsigned int stm32_adc_min_ts_mp1[] = { 100, 0, 0, 4300, 9800 };
-static_assert(ARRAY_SIZE(stm32_adc_min_ts_mp1) == STM32_ADC_INT_CH_NB);
+static const unsigned int stm32_adc_min_ts_mp1[STM32_ADC_INT_CH_NB] = {
+	[STM32_ADC_INT_CH_VDDCORE] = 100,
+	[STM32_ADC_INT_CH_VREFINT] = 4300,
+	[STM32_ADC_INT_CH_VBAT] = 9800,
+};
 
 static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
 	.regs = &stm32mp1_adc_regspec,
@@ -2762,8 +2758,13 @@ static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
 	.vref_charac_mv = 3300,
 };
 
-static const unsigned int stm32_adc_min_ts_mp13[] = { 1000, 1000, 1000, 4300, 9800 };
-static_assert(ARRAY_SIZE(stm32_adc_min_ts_mp13) == STM32_ADC_INT_CH_NB);
+static const unsigned int stm32_adc_min_ts_mp13[STM32_ADC_INT_CH_NB] = {
+	[STM32_ADC_INT_CH_VDDCORE] = 1000,
+	[STM32_ADC_INT_CH_VDDCPU] = 1000,
+	[STM32_ADC_INT_CH_VDDQ_DDR] = 1000,
+	[STM32_ADC_INT_CH_VREFINT] = 4300,
+	[STM32_ADC_INT_CH_VBAT] = 9800,
+};
 
 static const struct stm32_adc_cfg stm32mp13_adc_cfg = {
 	.regs = &stm32mp13_adc_regspec,

-- 
2.43.0


