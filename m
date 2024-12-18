Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9742EE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vw1hITR1G9F1rVm3gpZWmkGDdDu1u0GyVrr+LvVm7wM=; b=fkQhwa0iAgcMk88xZ/V9SDtM/r
	VpDH/yb3NqpOXR+3U1AEGfy+CingiizRaK4UjzaNM51ChuAFN9GEFfodI81sNJ4QtSMmxXzHgoFMQ
	ynjxi3Fw2tOGMdO/jhjsMyV/GbgGjnJLIxYDYdQ2ihQhvZArr2ey50kc+xZZkOk9fqMJF8YLyfzji
	KpmmEvxAOXX+tRgYVyxLHydnssOvTpJ1fDqumy7nE1oAEOnyXnb+IxXf6PCE4PSqoGctpa4rWTFvN
	iGiEi3PJ67SvatZ7qlMphDzA5gbCDHFI2NyHS/+kyIG0czsbxrrjJXRHaq/nyJKNYyZy2tDiqunAK
	Dep0d2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpzl-0000000G0ln-3ehN;
	Wed, 18 Dec 2024 09:05:29 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpyf-0000000G0UO-0rKL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:04:22 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6oHm4032719;
	Wed, 18 Dec 2024 10:04:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vw1hITR1G9F1rVm3gpZWmkGDdDu1u0GyVrr+LvVm7wM=; b=2lruwlNU9Z9vXX7a
	OHARmeQ9XwCbK+7cF0s1WL3gwEUErY8vd8Ebv7A9Dh386YaEVWKvhWbgXCcmgOX8
	GHy7zby75MOVlG0vym9idrisWcLxKe9jOejrrHa7buehh/BchqP0UFZdU9Zpkis+
	+fjtHJhMGIr9x3wFio+cOM4Yk1t+qoOuaFKmYdAeZPVefl1kX8QwPbYuFwLU4yi8
	UczP7Gt4b0QWnMb2mLhzETdMCjjJKUNp80e/9Z038ooWOKJwcSwy4H1IpgE6a70j
	I6r7YmjUeNbtfT7Moi6LxYWp0xj3Rbu2G1rB8kBMaiuNe7aMkSQegsaE77V89szB
	BqWpAw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ksfrgh0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:04:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9D8D240052;
	Wed, 18 Dec 2024 10:03:04 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2193225FADC;
	Wed, 18 Dec 2024 10:02:57 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:56 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:56 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <wbg@kernel.org>, <jic23@kernel.org>, <ukleinek@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
Subject: [PATCH 3/9] iio: trigger: stm32-timer: add support for stm32mp25
Date: Wed, 18 Dec 2024 10:01:47 +0100
Message-ID: <20241218090153.742869-4-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
References: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_010421_649551_CBE3167C 
X-CRM114-Status: GOOD (  20.36  )
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

Add support for STM32MP25 SoC. Use newly introduced compatible to handle
this new HW variant. Add TIM20 trigger definitions that can be used by
the stm32 analog-to-digital converter. Use compatible data to identify
it.
As the counter framework is now superseding the deprecated IIO counter
interface (IIO_COUNT), don't support it. Only register IIO trigger
devices for ADC usage. So, make the valids_table a cfg option.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/iio/trigger/stm32-timer-trigger.c     | 21 +++++++++++++++++--
 include/linux/iio/timer/stm32-timer-trigger.h |  6 ++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index bb60b2d7b2ec..8aaf3abf044e 100644
--- a/drivers/iio/trigger/stm32-timer-trigger.c
+++ b/drivers/iio/trigger/stm32-timer-trigger.c
@@ -38,6 +38,9 @@ static const void *triggers_table[][MAX_TRIGGERS] = {
 	{ TIM15_TRGO,},
 	{ TIM16_OC1,},
 	{ TIM17_OC1,},
+	{ }, /* timer 18 */
+	{ }, /* timer 19 */
+	{ TIM20_TRGO, TIM20_TRGO2, TIM20_OC1, TIM20_OC2, TIM20_OC3, },
 };
 
 /* List the triggers accepted by each timer */
@@ -781,7 +784,7 @@ static int stm32_timer_trigger_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	/* Create an IIO device only if we have triggers to be validated */
-	if (*cfg->valids_table[index])
+	if (cfg->valids_table && *cfg->valids_table[index])
 		priv = stm32_setup_counter_device(dev);
 	else
 		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -794,7 +797,8 @@ static int stm32_timer_trigger_probe(struct platform_device *pdev)
 	priv->clk = ddata->clk;
 	priv->max_arr = ddata->max_arr;
 	priv->triggers = triggers_table[index];
-	priv->valids = cfg->valids_table[index];
+	if (cfg->valids_table && *cfg->valids_table[index])
+		priv->valids = cfg->valids_table[index];
 	stm32_timer_detect_trgo2(priv);
 	mutex_init(&priv->lock);
 
@@ -886,6 +890,16 @@ static const struct stm32_timer_trigger_cfg stm32h7_timer_trg_cfg = {
 	.num_valids_table = ARRAY_SIZE(stm32h7_valids_table),
 };
 
+static const struct stm32_timer_trigger_cfg stm32mp25_timer_trg_cfg = {
+	/*
+	 * valids_table not used: counter framework is now superseding the deprecated IIO
+	 * counter interface (IIO_COUNT), so don't support it. num_valids_table is only
+	 * kept here to register the IIO HW triggers. valids_table should be moved at some
+	 * point to the stm32-timer-cnt driver instead.
+	 */
+	.num_valids_table = ARRAY_SIZE(triggers_table),
+};
+
 static const struct of_device_id stm32_trig_of_match[] = {
 	{
 		.compatible = "st,stm32-timer-trigger",
@@ -893,6 +907,9 @@ static const struct of_device_id stm32_trig_of_match[] = {
 	}, {
 		.compatible = "st,stm32h7-timer-trigger",
 		.data = (void *)&stm32h7_timer_trg_cfg,
+	}, {
+		.compatible = "st,stm32mp25-timer-trigger",
+		.data = (void *)&stm32mp25_timer_trg_cfg,
 	},
 	{ /* end node */ },
 };
diff --git a/include/linux/iio/timer/stm32-timer-trigger.h b/include/linux/iio/timer/stm32-timer-trigger.h
index 37572e4dc73a..1ee237b56183 100644
--- a/include/linux/iio/timer/stm32-timer-trigger.h
+++ b/include/linux/iio/timer/stm32-timer-trigger.h
@@ -72,6 +72,12 @@
 
 #define TIM17_OC1	"tim17_oc1"
 
+#define TIM20_OC1	"tim20_oc1"
+#define TIM20_OC2	"tim20_oc2"
+#define TIM20_OC3	"tim20_oc3"
+#define TIM20_TRGO	"tim20_trgo"
+#define TIM20_TRGO2	"tim20_trgo2"
+
 #if IS_REACHABLE(CONFIG_IIO_STM32_TIMER_TRIGGER)
 bool is_stm32_timer_trigger(struct iio_trigger *trig);
 #else
-- 
2.25.1


