Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D0CC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aM49dtU5bK9q5PUsk/o5PhDwC7TRmbnftSFkh2mjTtw=; b=Ljq/IfhaJEd0ok8Y+1im8mGBYa
	8Pn6uJyM9ZkeCRwG2ajo1yTVKn56kcctcj9qY1uY3nb9nZ25QPFvTjekZOT1b3Ur0rfEhiCx23Su0
	aGg261YKAG4CicMw9e0RvZeil+gLHGbmetB5QFEAhSzBVim0LXAklMfg1lZp4MG1OAfhyxh7UkeUh
	GmUX0ujnN8R6A8qC0K+iTpVGcy8ioWLMM5099SQFYNt8tyoFo14yAlLtJB2Zt/X+mdpo9AFrXznMC
	KVs3UeC4wMNcTa0t8+xZt5ClDmKODLczYQWO2dOxdxZdpZqcHjoVkY342O9OdrOmJmlsuIy9/IVlE
	2lP0KsBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcSN-0000000EfOm-3RSQ;
	Mon, 24 Feb 2025 17:41:27 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcL1-0000000EdsN-1xXw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:33:52 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OE6a8p019227;
	Mon, 24 Feb 2025 18:33:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=aM49dtU5bK9q5PUsk/o5Ph
	DwC7TRmbnftSFkh2mjTtw=; b=w9s1lCrwhPCUAMJgO3nO5qZZm0Yc5TstgWsUI+
	9UH+dVEKjCQV+rYFE6B/aiyj1HqHldtVYdQAtNI9UFm5pwSmDbwMPa3b9uvurhaN
	baU4pF0yCv9IC6dwug+RHYBl7eUbSlRxW4UbARHD9hgulHY0MmrANR/WZP23Um/p
	S/HtGavs4JCyQ+PgV8w9nOiLN52EXRu4Eo9XO83AuSXLDZX6QHYShwu8hP3j/HcF
	XIIlenVUTcWGwAY16ZjnSDyOsny8pgMW+nhst9zL3YLzAwAhEBbLLP+Krttpr2jI
	YKRup0tVixvo+F2dX6WbGMIEsZsBIsUg8r0fOk26aMLKYXLw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44ytdn64g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 18:33:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 52B4140059;
	Mon, 24 Feb 2025 18:32:19 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7B204F3E81;
	Mon, 24 Feb 2025 18:21:25 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 18:21:25 +0100
Received: from localhost (10.252.23.75) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 18:21:25 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <alexandre.torgue@foss.st.com>, <olivier.moysan@foss.st.com>,
        <fabrice.gasnier@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] clocksource: stm32-lptimer: add support for PM
Date: Mon, 24 Feb 2025 18:21:01 +0100
Message-ID: <20250224172101.3448398-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.23.75]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_08,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_093351_801537_07948E7F 
X-CRM114-Status: GOOD (  14.83  )
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

Add support for power management on STM32 LPTIMER clocksource driver:
- Upon clockevents_suspend(), shutdown the LPTIMER, and balance the
clk_prepare_enable() from the probe routine.
- Upon clockevents_resume(), restore the prescaler that may have been lost
during low power mode, and restore the clock.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/clocksource/timer-stm32-lp.c | 32 +++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index a4c95161cb22..9cd487dd5a3a 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -24,7 +24,9 @@ struct stm32_lp_private {
 	struct regmap *reg;
 	struct clock_event_device clkevt;
 	unsigned long period;
+	u32 psc;
 	struct device *dev;
+	struct clk *clk;
 };
 
 static struct stm32_lp_private*
@@ -120,6 +122,27 @@ static void stm32_clkevent_lp_set_prescaler(struct stm32_lp_private *priv,
 	/* Adjust rate and period given the prescaler value */
 	*rate = DIV_ROUND_CLOSEST(*rate, (1 << i));
 	priv->period = DIV_ROUND_UP(*rate, HZ);
+	priv->psc = i;
+}
+
+static void stm32_clkevent_lp_suspend(struct clock_event_device *clkevt)
+{
+	struct stm32_lp_private *priv = to_priv(clkevt);
+
+	stm32_clkevent_lp_shutdown(clkevt);
+
+	/* balance clk_prepare_enable() from the probe */
+	clk_disable_unprepare(priv->clk);
+}
+
+static void stm32_clkevent_lp_resume(struct clock_event_device *clkevt)
+{
+	struct stm32_lp_private *priv = to_priv(clkevt);
+
+	clk_prepare_enable(priv->clk);
+
+	/* restore prescaler */
+	regmap_write(priv->reg, STM32_LPTIM_CFGR, priv->psc << CFGR_PSC_OFFSET);
 }
 
 static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
@@ -134,6 +157,8 @@ static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
 	priv->clkevt.set_state_oneshot = stm32_clkevent_lp_set_oneshot;
 	priv->clkevt.set_next_event = stm32_clkevent_lp_set_next_event;
 	priv->clkevt.rating = STM32_LP_RATING;
+	priv->clkevt.suspend = stm32_clkevent_lp_suspend;
+	priv->clkevt.resume = stm32_clkevent_lp_resume;
 
 	clockevents_config_and_register(&priv->clkevt, rate, 0x1,
 					STM32_LPTIM_MAX_ARR);
@@ -151,11 +176,12 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->reg = ddata->regmap;
-	ret = clk_prepare_enable(ddata->clk);
+	priv->clk = ddata->clk;
+	ret = clk_prepare_enable(priv->clk);
 	if (ret)
 		return -EINVAL;
 
-	rate = clk_get_rate(ddata->clk);
+	rate = clk_get_rate(priv->clk);
 	if (!rate) {
 		ret = -EINVAL;
 		goto out_clk_disable;
@@ -191,7 +217,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
 	return 0;
 
 out_clk_disable:
-	clk_disable_unprepare(ddata->clk);
+	clk_disable_unprepare(priv->clk);
 	return ret;
 }
 
-- 
2.25.1


