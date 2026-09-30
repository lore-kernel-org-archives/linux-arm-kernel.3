Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D5BCA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJOSKH2kETSMyle/TW8tj2x56yxQ68Bk5LPkqQ6CaU8=; b=aOOlBI/CaXwJES1TsBZlOn+G9G
	T3WcaIQX/XvgD8x2UB8NwfFNk4Xh1hWrNYk+YhUSzIgeR7+4yR91Em8uCD/a3A2Jbou49WY8fKdkm
	1qIuBk3VoUOhY/vlhB4AtH78wR2Wv4MKY7DeyoyO467xo7hhnvudLUg++gBworLqtAPwIKJ72OBt6
	LTgGftrUSO6daKSc6IFh/lnrkjudZI7A9r1pemt07hR8auI7ThatxRK3rpGKgOl83V6w8FvLWxd42
	ZFrIyNelo/3cc8PaSIT+wybqg6Cn4ukZB19CE27GNJ5oaXOVnZkgHlugdupopiJAM8DQqCKVpl8fZ
	j6n80hQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv9e-00000006HVq-0Hd4;
	Wed, 30 Sep 2026 14:19:30 +0000
Received: from mail-westeuropeazon11011022.outbound.protection.outlook.com ([52.101.70.22] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv9T-00000006HQb-2Jj0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:19:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQPWWAcwpD7iKDwK1FvjnaRRgPfl9O+ZP3NV+KtNI2r2jJr5Y9zWr9M5OGCsrWqpHjfwKNnd1CsQbfpT0H/BT/frhBcMG41ieG97ie6+voC5ToMKSJuIgJQBc8uPdZmC0z8dO95UYPEw/kr0DcrbJMtPcGXy3IV4ENVAr+I7nTwI5QHcqmeSSYpz18KQe5SMQxYRpM6DUfBCq4OJQp4ba1LVbE5J+ohXTkBClmtYQ8lTTbDIMKZgbsE7KCBxipAca8cbMKQzrGkEhTcGPs1zqT86hHLHYFjj8bAamkbpwi0dUvfnS6iZ8AFsRpqbCBTqSUWaj1qEJF7eHePEIxVKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJOSKH2kETSMyle/TW8tj2x56yxQ68Bk5LPkqQ6CaU8=;
 b=k71XsCKkYb5jTLYXEy+gWLNmFdwz2tH17n6zuzEBGm+63Pdwx3ZeQpiyZXQQqTIun33xJMHJgn7ufCQKslmuqhsQbs5uQHkqBPDGitdLIufcncB+U9nrAsCSk8VmrEgYKtxujdlZucxL2cN/zoEfTrYwXSNgfVvrx4h/1qkso7Hyu+vML/6dbcUvkxzuAmuzeYnpVrgGj56/QKKijZcZdunyRXIDggLmyk+dOJCR59rkhFXcgwpEb9ABj4mj4vai5TwM4lfyOqXdB89B/tXaz+O45V7Uv13KptPJBgPwWG/mMtGT4bzgxCVAd2/z97wJxOZldsvrmD9p/4eOmDefJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=baylibre.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJOSKH2kETSMyle/TW8tj2x56yxQ68Bk5LPkqQ6CaU8=;
 b=LTBg6KUyMEt6r7BNBeIV33npvKcIk7s2CIv13qnxEHKohgJYCG9V8Fh2qsjZvCBjY6xpTnvqoYIq+a9TEogM3ngDLVbAXIOBPs1o/WAX6UTU47hl3FBbpiadfkjTqHE9CWyN+w+Faas/2Cpd/NNQYz6RfykVmTY9A53uPlFyWfpCVPey7Cp19N6Fx+EqSaf/SoQoUuBUPyn62zkhxul31sr8gI0Z1Qkqca1bd0Gxpfgtb3q6fsdhg1GksDG6Ha32hvuq6bWEBZsfco4Zws+NtOV5W6m250y56dGIomU3Wn9hrJkMDvubA8ejBS20ohwCzPcWcYlIy6ZQAMT33RhNvg==
Received: from DU7PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::7) by GVUPR10MB9895.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:347::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 14:19:13 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::9) by DU7PR01CA0007.outlook.office365.com
 (2603:10a6:10:50f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 14:19:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:19:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:25:44 +0200
Received: from localhost (10.252.17.140) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:19:11 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 30 Sep 2026 16:18:23 +0200
Subject: [PATCH v3 02/15] iio: adc: stm32-adc: core: manage clock prescaler
 diversity
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-adc-stm32mp25-v1-v3-2-406834430d72@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E4:EE_|GVUPR10MB9895:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7d65ec-cfd2-430f-9b78-08df1efdcd93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|23010399003|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CwfT44FfVtFVF/Cp2S4ccon2OE8C2yOt9/hHJ9JJ+mjcz4gHIuVFzUMYLzA3+TZXNxbdzSxWdcdqCmIAZE3SMx0eb9jRWPQtUfHJcXvvg5yGwC4PguvOE/6iro18Uwa4XfYVf6vkz4rnmHs/k8GnCY3DGIaZ4OgQvDvp95VsOzrzeZFsITLNb5BkWpheciMzFxN0Pwb/Hwh86X3V2Uf8BmKeyaTS15ME8HFWTyEMATjSwCyUotTBw+ie7MlJbIsG5/KrZbEJtxy2RRQCOJIglddhYfps8AlehAoyr6In8Bgqjdi1urULkeAypkHC1tjQ1kXu+GGTDb2vYyW0cFYubTeB6Lt9IQE7UgwoAn5zB1Xj9pR89XJo6U8YoeUlAPkjNaRL8OOpmQmFq/vIAgF9oeDHV+dqDyDRU/CNM4oWsmTzJlBVdpqBD/AlI+SbyP8xLZp2JciwLhSu49+JwHfwBMcFJvdwApJgDSbnUOiSjElNgdcP4lORrHucTc50aylrc0U9YfQnbdHgH9bpDmwUk172nv3oRsHVhF3go7TCk4COLvMWICU6ya+nZOxr7aiTQ97zS5/cYxJFROevzJXARVgWPuIiJ+CqyvZtOhz5Y2oQgznTaThgruhr/8ICcTHHUh4VnMQ7a9EiBkwOAmOQxyEOrkT5Fo55IryqYZKRcWksOveUjmdqdZoksyzqW34bw4fLb1bRPB1KlIDZfA7JTA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Phe3aeloEeOJqw4Eq+wbZniFPM1aaDWubz2OA1IfrUHCPxMc7LcGQ8ZIyLf4Jd096LU9ZvofJga2ozoZEtzj52i0HTnUmxENmpnqLfM3rv9+G+Eg6Abk1Wfm4Ott3+OYira0x2jaH70Hef4thPUp8Ij2viIcX5h/guX/Viv5CxsRdox1gWMSn2tdGPonj6yFGHiIMVEsRwsTQaG4zab6gGuatQri10j+fxOFnf8/CS/qka40ZbxyfjHezyGcNrXgYePwa2GTW6SDm8EUr7HJn+SEPyKgFLQr/4KJzys/AxxsvhKhQJsJaXxtytWdX8k2wOrPkMsc/xQexP98AXV82qxHKA3oDQyO5nFpbmReuUDdRbRZ8Pk+V7aIYGaYewcGPrxcuV0oqEExCv17fNJ2Znm9q0Fe8sNhLsr8COi4JSF1XMrI/NG/n4TFTrs50kWi
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:19:13.3287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7d65ec-cfd2-430f-9b78-08df1efdcd93
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR10MB9895
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_071919_600727_C05FA86B 
X-CRM114-Status: GOOD (  17.45  )
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

Make the clock prescaler selection configurable, to prepare stm32mp2
support.
Reuse existing stm32f4_adc_clk_sel(). Rename it so it's no longer
specific to stm32f4. Add configuration data to handle upcoming
differences on:
- registers and bits
- division ratio
No functional change intended.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v3:
- Adopt field_prep as advised by Jonathan, no need to store shift and mask.

Changes in v2:
- new precursor patch as advised by Andy and Jonathan
- unsigned prescaler array as advised by Andy
- cosmetic: spaces before and after braces
---
 drivers/iio/adc/stm32-adc-core.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index a42d82d61cb8..1e235f1cbc9d 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -50,6 +50,7 @@
  * @ovr_msk:    array of ovr (overrun flag) masks in csr for adc1..n
  * @ier:	interrupt enable register offset for each adc
  * @eocie_msk:	end of conversion interrupt enable mask in @ier
+ * @presc_msk:	prescaler mask in ccr
  */
 struct stm32_adc_common_regs {
 	u32 csr;
@@ -58,6 +59,7 @@ struct stm32_adc_common_regs {
 	u32 ovr_msk[STM32_ADC_MAX_ADCS];
 	u32 ier;
 	u32 eocie_msk;
+	u32 presc_msk;
 };
 
 struct stm32_adc_priv;
@@ -66,6 +68,8 @@ struct stm32_adc_priv;
  * struct stm32_adc_priv_cfg - stm32 core compatible configuration data
  * @regs:	common registers for all instances
  * @clk_sel:	clock selection routine
+ * @presc:	clock prescaler array
+ * @num_presc:	number of clock prescalers in presc array
  * @max_clk_rate_hz: maximum analog clock rate (Hz, from datasheet)
  * @ipid:	adc identification number
  * @has_syscfg: SYSCFG capability flags
@@ -75,6 +79,8 @@ struct stm32_adc_priv;
 struct stm32_adc_priv_cfg {
 	const struct stm32_adc_common_regs *regs;
 	int (*clk_sel)(struct platform_device *, struct stm32_adc_priv *);
+	unsigned int *presc;
+	unsigned int num_presc;
 	u32 max_clk_rate_hz;
 	u32 ipid;
 	unsigned int has_syscfg;
@@ -126,22 +132,22 @@ static struct stm32_adc_priv *to_stm32_adc_priv(struct stm32_adc_common *com)
 }
 
 /* STM32F4 ADC internal common clock prescaler division ratios */
-static int stm32f4_pclk_div[] = {2, 4, 6, 8};
+static unsigned int stm32f4_pclk_div[] = { 2, 4, 6, 8 };
 
 /**
- * stm32f4_adc_clk_sel() - Select stm32f4 ADC common clock prescaler
+ * stm32_adc_clk_sel() - Select stm32f4 ADC common clock prescaler
  * @pdev: platform device
  * @priv: stm32 ADC core private data
  * Select clock prescaler used for analog conversions, before using ADC.
  */
-static int stm32f4_adc_clk_sel(struct platform_device *pdev,
-			       struct stm32_adc_priv *priv)
+static int stm32_adc_clk_sel(struct platform_device *pdev,
+			     struct stm32_adc_priv *priv)
 {
 	unsigned long rate;
 	u32 val;
 	int i;
 
-	/* stm32f4 has one clk input for analog (mandatory), enforce it here */
+	/* This ADC has one clk input for analog (mandatory), enforce it here */
 	if (!priv->aclk) {
 		dev_err(&pdev->dev, "No 'adc' clock found\n");
 		return -ENOENT;
@@ -153,20 +159,20 @@ static int stm32f4_adc_clk_sel(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(stm32f4_pclk_div); i++) {
-		if ((rate / stm32f4_pclk_div[i]) <= priv->max_clk_rate)
+	for (i = 0; i < priv->cfg->num_presc; i++) {
+		if ((rate / priv->cfg->presc[i]) <= priv->max_clk_rate)
 			break;
 	}
-	if (i >= ARRAY_SIZE(stm32f4_pclk_div)) {
+	if (i >= priv->cfg->num_presc) {
 		dev_err(&pdev->dev, "adc clk selection failed\n");
 		return -EINVAL;
 	}
 
-	priv->common.rate = rate / stm32f4_pclk_div[i];
-	val = readl_relaxed(priv->common.base + STM32F4_ADC_CCR);
-	val &= ~STM32F4_ADC_ADCPRE_MASK;
-	val |= i << STM32F4_ADC_ADCPRE_SHIFT;
-	writel_relaxed(val, priv->common.base + STM32F4_ADC_CCR);
+	priv->common.rate = rate / priv->cfg->presc[i];
+	val = readl_relaxed(priv->common.base + priv->cfg->regs->ccr);
+	val &= ~priv->cfg->regs->presc_msk;
+	val |= field_prep(priv->cfg->regs->presc_msk, i);
+	writel_relaxed(val, priv->common.base + priv->cfg->regs->ccr);
 
 	dev_dbg(&pdev->dev, "Using analog clock source at %ld kHz\n",
 		priv->common.rate / 1000);
@@ -314,6 +320,7 @@ static const struct stm32_adc_common_regs stm32f4_adc_common_regs = {
 	.ovr_msk = { STM32F4_OVR1, STM32F4_OVR2, STM32F4_OVR3 },
 	.ier = STM32F4_ADC_CR1,
 	.eocie_msk = STM32F4_EOCIE,
+	.presc_msk = STM32F4_ADC_ADCPRE_MASK,
 };
 
 /* STM32H7 common registers definitions */
@@ -850,7 +857,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(stm32_adc_core_pm_ops,
 
 static const struct stm32_adc_priv_cfg stm32f4_adc_priv_cfg = {
 	.regs = &stm32f4_adc_common_regs,
-	.clk_sel = stm32f4_adc_clk_sel,
+	.clk_sel = stm32_adc_clk_sel,
+	.presc = stm32f4_pclk_div,
+	.num_presc = ARRAY_SIZE(stm32f4_pclk_div),
 	.max_clk_rate_hz = 36000000,
 	.num_irqs = 1,
 	.num_adcs = 3,

-- 
2.43.0


