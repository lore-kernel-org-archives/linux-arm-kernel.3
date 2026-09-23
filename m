Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E85C98311
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=za4ZTK0Ksc2dqzy2fM/TuJDfoum243RULGb6iZ3X30Q=; b=LbMf/t94xMJcvu+I9cCaG9PDSt
	JcErzN/vf3p0qgpyvZHVLUAymc9Dw3BKPW5TIxsTr8zz1QxwpYsLXHEYOmRJfTxGpysS53yQdCDKS
	c15zoevQRFnWoI/sL4+J0gg+AIUHLUJcnpRocO+cH8MjXy8oKKU8/5d3h5sym3Xhm+wDRS6u29Lox
	LhXj9I+idSuZMMmbHmmOwJCdSwqcvQkVn5s3B23sbHvY1DksGihoCJ/+6jxzVS4BJbfXcGrI/lLhC
	vx09w2nL0cVYPR8bC1KMsesCgZ8Y1NoL4wwO1i0VRAz89O0ac0UyDwbpruGreO5iqYlXlrW5moyj+
	sm4+kmVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P4V-00000008lRU-2afp;
	Wed, 23 Sep 2026 15:39:47 +0000
Received: from mail-swedencentralazon11013046.outbound.protection.outlook.com ([52.101.83.46] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P4M-00000008lLu-3ozv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:39:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvmUAOm+cjCW1hrRrj1YVHkRPEyemeC7JxD6JHYzhrNKDN/o4zPkQbd/0QbNVFhxZ2zWaiJuGJQ9qqhLjyC3RNkWZNgBwfSFq9bYt6Ms4FeRzGO+zfTTaD7uzgsntSDExo+kotZUIcEpsywcc/l/WPKYt73zC809TtvoIktZoeEeQ4pggBwX7PIENcUUHgYXYWU6QUE4hjKwmBdOsYgNvgD06ON4pw2AMYkQLiOmgWUQloN3/85st8ictuIMUjF+MOrL9fEqD7P+UFLE8betw9EC+wHyoM/nRQcento145pPoExBj4U9j0UhSMCrc2sfB5VC/Im3GwKZQiwKiDUB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za4ZTK0Ksc2dqzy2fM/TuJDfoum243RULGb6iZ3X30Q=;
 b=K5q+rB7QB7VI9mdsi7hvCiMOEr+ytpCL0S8DboN4kwndIAZjFmtYoyQ88rnYp765PQHJOwnVbsWkOtkdu/k7CjxPDg2dmeumxfxG0JMJFSHVfK7e6XUyHwELz6NMnRyY1Q5Y35PnIxjfVpNdFN+OzOe3YCsma/7Ec3I/7miQwsDFMwynAJl40Jo4sVxHAT5hebc5HkKTqpJUZ9Hq5Nx3hM5tIhQgwQOJQ/klQU62ryxxY6MmGXCACu2TQYolLU+vxCYikaFHRfmzaPf09LAfzAlZS+sja4x1zLWy2+4ZXA7MEWrdrzcI1Mi62GXQAhz/CUaRqLqRdqtnjob/6uWsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za4ZTK0Ksc2dqzy2fM/TuJDfoum243RULGb6iZ3X30Q=;
 b=PDN6Y8TF2EWyhYQLAMRuapl6r6RcRPWQH677sdxoZUOMBeA2WGnRu4m7NN6nOkAPUXa4rXKLMkwftOom9RN4BRiHiZu/7zWA1tfdJozwiET/PtlB+LlqO2WiLG7AXL8k6XiBr28voiGaLLYcSv0zsQCIfLi2gJ0WNSYhTpbFOXDlpeYtzOYrsnqKENRmgv25tmsPdU7SU6DNpxx/GQ3sYVjN34iQB9N3booGVL3iqBxcynUiCsLVbhUIk0HF66KC1evqSXcnEEbtQ2CujzDu+311VuhA6mg2cHSAxJwDHnjge+NbjztfCEp4dPrPiRdXZVDzszRWx0iVQ050/Lvsnw==
Received: from MA3P292CA0009.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:2c::10)
 by PRAPR10MB5154.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:29c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 15:39:31 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:250:2c:cafe::a6) by MA3P292CA0009.outlook.office365.com
 (2603:10a6:250:2c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 15:39:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 15:39:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 23 Sep
 2026 17:45:58 +0200
Received: from localhost (10.252.7.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 23 Sep
 2026 17:39:29 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 23 Sep 2026 17:39:07 +0200
Subject: [PATCH v2 04/14] iio: adc: stm32-adc: manage characterization
 voltage diversity
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260923-adc-stm32mp25-v1-v2-4-46bc019537c6@foss.st.com>
References: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
In-Reply-To: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Olivier Moysan
	<olivier.moysan@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.7.7]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B6:EE_|PRAPR10MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: a595aada-bd70-4cf7-bf39-08df1988dbec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: OFciNev1hzLlsIx7N9LNwhp6YdHJw9oUVQ794YUzeS/CmxvpW2Vfgdk85b88lq7uGA1IyC5cLZFsuijxqzIbvfc2zCP05udmiQIylV5iuglHDLTOVpfe1HluczGtarFQpmRD38AVGLjIFmLJEd1moPpKL4lq46xRLpkP1YXw2uffLJlOjZYNHXkVkMvwjr57i6nfYWjhKYVXvLcNM/WPoddWCeG5wY3gem0b+1Ze0Mxm7X1O/ISgW0eriI5qpf4M6yCcJ53dfPEIAz69j/ptsQKXS1cpyObjHIYxvQ+qqXKMe3t93aaUTS1WUmrbzL+Al0c8p6F8Nz45IGcq5m0AY6LKBC1PUzXsXG8JPVQ0IFBm7FkwrsOMsJbhaZAWOS7p133YOWhG1DebatMZUFJ6UlEhosf4R1kUXXNPdiXarryI5kjd/vmx/eBW3i4OSNNNOLFUQSwV3YAIKlagc2Pe5qTiiU5UGa5uuzZugw4PEh2soxpuyyWY70Yqdsp1oWvAbdfUmBKN1uMimSGDGFqpQF+TMPZdODncoE0oQAtCqaAA3LYCYKFMnYuhwYjcSBla2A6L+DFTNAI4lJE3Q+wZ4HPlcWQgcizZEbUP9SZcE/ocJKEp5OYf5GjNckkecgIKunoxKAd/tIXCcHjBnOJjgV8Y5x3SHWjTPstkdBpNHXhkVa8/QZtTkcbPsdkqXgrERuIX5xpt7zLaedL7Hh1QtA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F7FPFuX+MKx3DXg29s7F9efDnEn1LZEuafgvhhf9Zz/AylPUp2KGv3uKWt4InLoI8/UKDzc2zuhSJY2kBL1MdGsmhBltSaj5hZA0AYtHGMxOjBPqu+IBELf0GJJu9HwvQCpJSmJBIcqJLkzb3PoLk8J3spoyAH+JhANjFeJfIf8pDMIafWH2vAfVJnczjrjzZCpugfcEcONtKyyV926Z3NfkOI32gd4rS42s+V45iGFnED8xzjbR8FQC/zry05Pc30XQi7+NBiIl/wG5ATOpeDQgoHGkeG9OIA2W8830OdQFh9fMJ0KbAX/XWs1M69vvTmK/Yd8OhFGQIo8osoBIdRbQvZ7GlMeWxS4VOFxeMTceroQ1WsfE0nr6YgAfl4ZH35Ou0D5C0SEDo8WfT/YcqT1DNT9M3yyFpTJkPFeyEqTwlCnvtRTLAP2dKKlxH54n
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:39:30.4618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a595aada-bd70-4cf7-bf39-08df1988dbec
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_083938_975558_60A64365 
X-CRM114-Status: GOOD (  13.99  )
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

From: Olivier Moysan <olivier.moysan@foss.st.com>

The characterization voltage used to calibrate vrefint depends
on SoC family. Add vref_charac_mv field in stm32_adc_cfg structure
to store the characterization voltage for each SoC, and use it
in Vref computation formula.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- Andy's review comments: rename variable to vref_charac_mv (unit suffix).
  Drop the const attribute.
---
 drivers/iio/adc/stm32-adc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 90f0e257e6d1..ddf74c674da6 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -43,7 +43,6 @@
 #define STM32_ADC_TIMEOUT_US		100000
 #define STM32_ADC_TIMEOUT	(msecs_to_jiffies(STM32_ADC_TIMEOUT_US / 1000))
 #define STM32_ADC_HW_STOP_DELAY_MS	100
-#define STM32_ADC_VREFINT_VOLTAGE	3300
 
 #define STM32_DMA_BUFFER_SIZE		PAGE_SIZE
 
@@ -211,6 +210,7 @@ struct stm32_adc;
  * @set_ovs:		routine to set oversampling configuration
  * @smp_cycles:		programmable sampling time (ADC clock cycles)
  * @ts_int_ch:		pointer to array of internal channels minimum sampling time in ns
+ * @vref_charac_mv:	Vref characterization voltage used to measure vrefint calibration value
  */
 struct stm32_adc_cfg {
 	const struct stm32_adc_regspec	*regs;
@@ -230,6 +230,7 @@ struct stm32_adc_cfg {
 	void (*set_ovs)(struct iio_dev *indio_dev, u32 ovs_idx);
 	const unsigned int *smp_cycles;
 	const unsigned int *ts_int_ch;
+	int vref_charac_mv;
 };
 
 /**
@@ -1615,7 +1616,7 @@ static int stm32_adc_read_raw(struct iio_dev *indio_dev,
 		if (mask == IIO_CHAN_INFO_PROCESSED) {
 			if (*val == 0)
 				return -EINVAL;
-			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;
+			*val = adc->cfg->vref_charac_mv * adc->vrefint.vrefint_cal / *val;
 		}
 
 		return ret;
@@ -2711,6 +2712,7 @@ static const struct stm32_adc_cfg stm32f4_adc_cfg = {
 	.stop_conv = stm32f4_adc_stop_conv,
 	.smp_cycles = stm32f4_adc_smp_cycles,
 	.irq_clear = stm32f4_adc_irq_clear,
+	.vref_charac_mv = 3300,
 };
 
 static const unsigned int stm32_adc_min_ts_h7[] = { 0, 0, 0, 4300, 9000 };
@@ -2732,6 +2734,7 @@ static const struct stm32_adc_cfg stm32h7_adc_cfg = {
 	.irq_clear = stm32h7_adc_irq_clear,
 	.ts_int_ch = stm32_adc_min_ts_h7,
 	.set_ovs = stm32h7_adc_set_ovs,
+	.vref_charac_mv = 3300,
 };
 
 static const unsigned int stm32_adc_min_ts_mp1[] = { 100, 100, 100, 4300, 9800 };
@@ -2754,6 +2757,7 @@ static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
 	.irq_clear = stm32h7_adc_irq_clear,
 	.ts_int_ch = stm32_adc_min_ts_mp1,
 	.set_ovs = stm32h7_adc_set_ovs,
+	.vref_charac_mv = 3300,
 };
 
 static const unsigned int stm32_adc_min_ts_mp13[] = { 100, 0, 0, 4300, 9800 };
@@ -2772,6 +2776,7 @@ static const struct stm32_adc_cfg stm32mp13_adc_cfg = {
 	.irq_clear = stm32h7_adc_irq_clear,
 	.ts_int_ch = stm32_adc_min_ts_mp13,
 	.set_ovs = stm32mp13_adc_set_ovs,
+	.vref_charac_mv = 3300,
 };
 
 static const struct of_device_id stm32_adc_of_match[] = {

-- 
2.43.0


