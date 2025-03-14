Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6E5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 17:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTo8HJ3Jishlo1S9oATLW3zJolVjTmMMSnoy0RwwYIU=; b=sUbcFDGOrYKA78ptoqaoVodVHZ
	av/k3aSsZpbCUuSseUK/RY6IT8ec/RUZKQkFpAeX+IUeL4bPT2c9BZgYpaVsTkdb5LAnU4vJj88VZ
	koQ1O0Cg7AmaQzlYKMHSRxmpoF9u4bI3rJ8M9V64ktih2V/kF+QNXocHiQPjHqQCLQtjpuI7xqS/4
	DsVetx6eoLNuLBOUoj3dcBFyGs+pE5GX55fKJRJDelvi0SlEGg6IqOXTAmmUZZECQerS/URNZzLOy
	Ymg9VUL7izWbaNV4v3e+gMggKHjNR/pFeb0oEkOj6Mex+G2B82BduIo2E8mnCR3s5RjXMWmgelkMy
	rn2ecy0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9Aj-0000000Ew9i-444l;
	Fri, 14 Mar 2025 17:50:13 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8vf-0000000Et8S-2vjX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:34:41 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EEoeYB025496;
	Fri, 14 Mar 2025 18:34:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	RTo8HJ3Jishlo1S9oATLW3zJolVjTmMMSnoy0RwwYIU=; b=GY40LxxPYbGPavRV
	gW4g8aAj06IFl8YPN3lJIT8W3PaRPNU2jN5KXxYswKvXwg/xNrv/1Q3dR7HjJ1Jl
	pe5+usUZChpeVqQeP8GIklPlSTsb0n3BtQe9x/JOfBurdf4hZkrV8exT9eZYG4l5
	9ZI6CTq3CLmkS5bKPkY+mHe8j5K97jVCBp45AiXBHJXdyNzZDqs2kX2abUleFzhu
	U0Q6Hh2yFSIrxw7a9mBZeGth5KgtrvQks9Xx289BvP4NjjuiN4uSLHodJYQXoZ2s
	Uv89Y8DaT5o1qnqGi5LobChrYdfR8vRzHX+qVy6hcMle7xx85A9vblZ7uF+gcR9Z
	eblMmA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45c2p7wewr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 18:34:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 46DD340066;
	Fri, 14 Mar 2025 18:33:05 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3DE886D8E8B;
	Fri, 14 Mar 2025 18:15:07 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Mar
 2025 18:15:07 +0100
Received: from localhost (10.252.1.141) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Mar
 2025 18:15:06 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jic23@kernel.org>,
        <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <robh@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v4 4/8] clocksource: stm32-lptimer: add support for stm32mp25
Date: Fri, 14 Mar 2025 18:14:47 +0100
Message-ID: <20250314171451.3497789-5-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.1.141]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_103440_038167_A162AAF2 
X-CRM114-Status: GOOD (  21.09  )
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

On stm32mp25, DIER (former IER) must only be modified when the lptimer
is enabled. On earlier SoCs, it must be only be modified when it is
disabled. There's also a new DIEROK flag, to ensure register access
has completed.
Add a new "set_evt" routine to be used on stm32mp25, called depending
on the version register, read by the MFD core (LPTIM_VERR).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in V4:
- Daniel suggests to encapsulate IER write into a separate function
  that manages the enabling/disabling of the LP timer. In addition,
  DIEROK and ARROK flags checks have been added. So adopt a new routine
  to set the event into ARR register and enable the interrupt.
Changes in V2:
- rely on fallback compatible as no specific .data is associated to the
  driver. Use version data from MFD core.
- Added interrupt enable register access update in (missed in V1)
---
 drivers/clocksource/timer-stm32-lp.c | 51 +++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index 928da2f6de69..e58932300fb4 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -27,6 +27,7 @@ struct stm32_lp_private {
 	u32 psc;
 	struct device *dev;
 	struct clk *clk;
+	u32 version;
 };
 
 static struct stm32_lp_private*
@@ -47,12 +48,37 @@ static int stm32_clkevent_lp_shutdown(struct clock_event_device *clkevt)
 	return 0;
 }
 
-static int stm32_clkevent_lp_set_timer(unsigned long evt,
-				       struct clock_event_device *clkevt,
-				       int is_periodic)
+static int stm32mp25_clkevent_lp_set_evt(struct stm32_lp_private *priv, unsigned long evt)
 {
-	struct stm32_lp_private *priv = to_priv(clkevt);
+	int ret;
+	u32 val;
+
+	/* Enable LPTIMER to be able to write into IER and ARR registers */
+	regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
+	/* set next event counter */
+	regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
+	/* enable ARR interrupt */
+	regmap_write(priv->reg, STM32_LPTIM_IER, STM32_LPTIM_ARRMIE);
+
+	/* Poll DIEROK and ARROK to ensure register access has completed */
+	ret = regmap_read_poll_timeout_atomic(priv->reg, STM32_LPTIM_ISR, val,
+					      (val & STM32_LPTIM_DIEROK_ARROK) ==
+					      STM32_LPTIM_DIEROK_ARROK,
+					      10, 500);
+	if (ret) {
+		dev_err(priv->dev, "access to LPTIM timed out\n");
+		/* Disable LPTIMER */
+		regmap_write(priv->reg, STM32_LPTIM_CR, 0);
+		return ret;
+	}
+	/* Clear DIEROK and ARROK flags */
+	regmap_write(priv->reg, STM32_LPTIM_ICR, STM32_LPTIM_DIEROKCF_ARROKCF);
+
+	return 0;
+}
 
+static void stm32_clkevent_lp_set_evt(struct stm32_lp_private *priv, unsigned long evt)
+{
 	/* disable LPTIMER to be able to write into IER register*/
 	regmap_write(priv->reg, STM32_LPTIM_CR, 0);
 	/* enable ARR interrupt */
@@ -61,6 +87,22 @@ static int stm32_clkevent_lp_set_timer(unsigned long evt,
 	regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
 	/* set next event counter */
 	regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
+}
+
+static int stm32_clkevent_lp_set_timer(unsigned long evt,
+				       struct clock_event_device *clkevt,
+				       int is_periodic)
+{
+	struct stm32_lp_private *priv = to_priv(clkevt);
+	int ret;
+
+	if (priv->version == STM32_LPTIM_VERR_23) {
+		ret = stm32mp25_clkevent_lp_set_evt(priv, evt);
+		if (ret)
+			return ret;
+	} else {
+		stm32_clkevent_lp_set_evt(priv, evt);
+	}
 
 	/* start counter */
 	if (is_periodic)
@@ -176,6 +218,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->reg = ddata->regmap;
+	priv->version = ddata->version;
 	priv->clk = ddata->clk;
 	ret = clk_prepare_enable(priv->clk);
 	if (ret)
-- 
2.25.1


