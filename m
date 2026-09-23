Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB59C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7f0lJIKnJnuoBCuEnSY1AN6337cLyUeiWLbw5sVNinQ=; b=awxA6t5ahjgQV2KfSRlnrYOJfC
	GqYW8dI4wsbw+GasrN7K9dBWFMpaOumhxb0kapNory76/yxnY+8CGwtBYTqP+Hhx474tnqZoj4+1/
	oZPIMHnqtjheTB9GHW83V6/ldNDIGFvAx6WK3pLBix1XrNCy10HHJ4Vhe9YiCDL8ZXzcdHft9ehwv
	lQvIwn9TYELTbWY4HsaeC0Cx3Dr9sV2c21qjslwUvs4e92DL83p/+QIq+JmXHDGfWwC4E80ozTUSU
	QBdFgVRq5HvEhbt3jIlbFSn6Xjy4eGWOrNTIf9mXOpZIhxGIUGlxAlL8RNdqmmHV2otk6smnUZw5M
	IkAizvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P4W-00000008lSi-0Uux;
	Wed, 23 Sep 2026 15:39:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P4Q-00000008lOm-0Hy1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=CC:To:In-Reply-To:References:Message-ID
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=7f0lJIKnJnuoBCuEnSY1AN6337cLyUeiWLbw5sVNinQ=; b=MvGi2HYmLDJl5Q5amZitHrIkrD
	IK6BGV8J3Qes5atTThj4O+zloO5zLZ9/M6ZJoQlNHOSt1jo5fCoGY7O9UWEItL7yJtKjSqz/HnPYa
	mVe0+EGqU97ztpHMMVgyqDWA4YxrZB8py0InasHPQ9LDw5KkM6tdqFK+cEgb6vTx9GqTBxdmjACuV
	PO8OzW1+2sQ9SKgYMQxvVpMNLaRmS4cw5TuxUn5VS9cDxJX99WknyfLA7N/8NGyoNMc5xJwAcp1AX
	w1y3IdG9v5b4hE6XMgiQLROI9SOz/HBDeaSCyWeL60jTZej5/PWRle0T6+C0GJ94LND6jNTxy6RNq
	kxG66F+A==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P4M-0000000DduZ-2bAo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:39:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mh02r9jwu3rLx6OBBkkWjVJv7w/ShZrFEe08smgBy3JDKySz1uxOI51fokWGVxNomIRz8nsJT5N0YeahtRjUZg9J6gEhWbUy0gN8Jp3PPo6zGUpYYcGyRxDEXmI1km5f69uqADNB9Vn246JiXwOeDTo1XkhMIbQ6OkU1TrhLyglDsrNtfS9huxEegXSsqzzikH3dTUcLjjWU7PECDhsG3/bM0WPPPgdfYSbaLv+TASoeGMut6IaoLfyOW2HVI/zoplS4P0BfI1rIKtoE+oXy4JoxKBeTOmPove5sMLBcKC3DDH4Gu6CJZsdmfgI4PMJ4sJ5hq+k4qRt+9zfxJyzzbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f0lJIKnJnuoBCuEnSY1AN6337cLyUeiWLbw5sVNinQ=;
 b=rHPCzYTWvmk4mF/ylHx//0anzWCF2H4FXmVXw/vko+1G+K4rpHJra1IMOhg3Y8H1lstkla24d5eOYzVGNNuahPuKfXnHcAMtQDIz+/bvwff3KePtaBx9LrnHmKeCwOnDcXjTn5lNHU7xiUy+T53yRAc3Otj1Q7oFAodwT1qFCqATGP6NB7Pnzzzo7zMbCjy9tMSeiwpikr5nTzseR2ihADxrDx25XKfmnzTtumA9kehWSU60IdvYPS0tJYHH13yNLfEnBT20ctnKxIAU6dCebqOxngQzv4URJS0B0HWC11vKgS/0+n/M8Bo1eY6mBl7ugTO9CWHsoje0zXqD32dZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f0lJIKnJnuoBCuEnSY1AN6337cLyUeiWLbw5sVNinQ=;
 b=CrAvs+FL76xbPtt4FGIoAB/rcRFFcV5e3FPzVCohb6jWC8thIqgqY2CoPgfi7lgZcwTL+d5tvv7ZtgF1D4Ld63V7HLTWzcTVWZIysTbsnyzHOzXRtgkc/IzcN83ZCy39E3Do/xaVZGUmL/w/VRzpGj8FLpZt3GlqTzLuVQFh/7mzxDkRDNzbT5sc4IntUpDLtiXknJIP1pBKB+VdAq8A2SJ15Roo0zmqn6wc9rQQ0mZxTNQk3SbP4y/XB+d4jK7oCeh4rFxGXEY+UFBdvU35egSPAzTVNnkOoEMF5p8RebXUW3kpyeLooU5SCZjdJP+c50MLgYgTQlfAp2QHlnX9ew==
Received: from OL1P279CA0053.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:14::22)
 by PAVPR10MB7281.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 15:39:30 +0000
Received: from WA1PEPF000099CF.eurprd04.prod.outlook.com
 (2603:10a6:e10:14:cafe::63) by OL1P279CA0053.outlook.office365.com
 (2603:10a6:e10:14::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 15:39:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099CF.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 15:39:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 23 Sep
 2026 17:45:18 +0200
Received: from localhost (10.252.7.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 23 Sep
 2026 17:39:28 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 23 Sep 2026 17:39:06 +0200
Subject: [PATCH v2 03/14] iio: adc: stm32-adc: core: configurable number of
 interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260923-adc-stm32mp25-v1-v2-3-46bc019537c6@foss.st.com>
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
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Cheick Traore
	<cheick.traore-ext@st.com>, Olivier Moysan <olivier.moysan@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.7.7]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CF:EE_|PAVPR10MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: b0cfdeda-8125-487c-b017-08df1988dbf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7416014|23010399003|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Uzv82G2JPB6RGcotzkRUTP3378hj4CWyIGukXhN62nZlB7jvLrkStyxrBitJlNrb7smKzt82K+QdGjuoqr+AX+HfsZuubWCUSJ/VG3xPWC9jeOxAP8jwbUDhKtjLd+PiBo1PTVRJIOkZ9POmcxGSCXFf+wI+rrIBHjenzBGyEGcUhglaMVAnQNsFezXbehXCG23aSdaTJATDmPOiCEUlGv5hrQyXdB8OIq8QzmAOMxwtsjyE6CTadIJnQ1ccHRINTG0687PBItE+KfoG0QMWGl4ndHUkHE/fjPAy/WyxCUirgOFbqepTHUYxQlYEmw2GmjG0zvuQ1deMkqfdp4RUh8VIrk+JxJadOHqYhqzZi0B++5goTM0363Rt+JqaBblMCMYjwuLngTBeCZ5ie6Dos2wEqVfHnZ0eCf/XWgU4vZuy3qKJPdVOavQsop9qg5GGlQCTW8m8jBNbtJ4bepurBp0mD9iIXPoNsQHYJ/VbJhi/4JjOs+Hu8vQUOe0si+yVMnzp2DfeI4m783z8ZUNn0PjkTQehpkjzyVF2tCGqkDAXkYv1lrncvl9yaBocQbY9RW5SVOU18hklxzP5hIcORAE4Y8gdxhb2ihpgRU9a9kFPSyLqkGsdfaYmpXs3M1tM9iRwJMWj+QBD7rnzge3P1MKLuMYe6EKy4/DCCrE3oizFlea/uk+2XJkE+eQGrFr2WfbwJF+Ugozu+TBkUECZIw==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oX8Aqe0TpUsKh0igPGONrBPo+oI91ZBMaxavzadERNceI+9/pJDEJBlbkw615f77GCepBDpBxv2VYx2wLAhqnG189ExFWlhSTQLSVDBcQ5kCsdERDIXUeOGtlqGvHQePpVvfxfEU61lKdz6d8gUMxmZlQGuomzL08mpKoxuDbPtw6BaOSLXRwr350DkDa7NOYav+VdvrYNgejHY+XwAFKe1TaERlAdohQCEuRp+xPwVZ9bK5QrTBjLtERWIlPuRo7eBjdBYcZyN7bgFIXI2GsxHFcAV+skVq1qjw/C19aP+gmwUi0G6GdpbH1N4ZYmatIKlwnfAugNiNHL5iFIsIjonALfWP4JDLfy3Qg8S9JyZCF30HRG32oQo+JEjiobwPogf+YyAtD6CcOmUQWqdT/AK3sgjR9ISbyzq6P4MyhfG6LPH1SjC2PCvVmHANIPlg
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:39:30.5577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cfdeda-8125-487c-b017-08df1988dbf8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099CF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_163938_992305_6134983E 
X-CRM114-Status: GOOD (  11.18  )
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

Make the number of interrupts configurable to prepare stm32mp2
support. Read from the SoC compatible data, and add it to
private data struct.
No functional change intended.

Co-developed-by: Cheick Traore <cheick.traore-ext@st.com>
Signed-off-by: Cheick Traore <cheick.traore-ext@st.com>
Co-developed-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- new precursor patch as advised by Andy and Jonathan to render
  num_irqs configurable
---
 drivers/iio/adc/stm32-adc-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 14ed50bb3ab5..5845173e288c 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -94,6 +94,7 @@ struct stm32_adc_priv_cfg {
  * struct stm32_adc_priv - stm32 ADC core private data
  * @irq:		irq(s) for ADC block
  * @nb_adc_max:		actual maximum number of instance per ADC block
+ * @nb_irqs:		number of IRQs in the ADC block
  * @domain:		irq domain reference
  * @aclk:		clock reference for the analog circuitry
  * @bclk:		bus clock common for all ADCs, depends on part used
@@ -112,6 +113,7 @@ struct stm32_adc_priv_cfg {
 struct stm32_adc_priv {
 	int				irq[STM32_ADC_MAX_ADCS];
 	unsigned int			nb_adc_max;
+	unsigned int			nb_irqs;
 	struct irq_domain		*domain;
 	struct clk			*aclk;
 	struct clk			*bclk;
@@ -424,7 +426,7 @@ static int stm32_adc_irq_probe(struct platform_device *pdev,
 	 * - stm32f4/h7 shares a common interrupt line.
 	 * - stm32mp1, has one line per ADC
 	 */
-	for (i = 0; i < priv->cfg->num_irqs; i++) {
+	for (i = 0; i < priv->nb_irqs; i++) {
 		priv->irq[i] = platform_get_irq(pdev, i);
 		if (priv->irq[i] < 0)
 			return priv->irq[i];
@@ -439,7 +441,7 @@ static int stm32_adc_irq_probe(struct platform_device *pdev,
 		return -ENOMEM;
 	}
 
-	for (i = 0; i < priv->cfg->num_irqs; i++)
+	for (i = 0; i < priv->nb_irqs; i++)
 		irq_set_chained_handler_and_data(priv->irq[i],
 						 stm32_adc_irq_handler, priv);
 
@@ -456,7 +458,7 @@ static void stm32_adc_irq_remove(struct platform_device *pdev,
 		irq_dispose_mapping(irq_find_mapping(priv->domain, hwirq));
 	irq_domain_remove(priv->domain);
 
-	for (i = 0; i < priv->cfg->num_irqs; i++)
+	for (i = 0; i < priv->nb_irqs; i++)
 		irq_set_chained_handler(priv->irq[i], NULL);
 }
 
@@ -730,6 +732,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
 
 	priv->cfg = device_get_match_data(dev);
 	priv->nb_adc_max = priv->cfg->num_adcs;
+	priv->nb_irqs = priv->cfg->num_irqs;
 	spin_lock_init(&priv->common.lock);
 
 	priv->common.base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);

-- 
2.43.0


