Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B478C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlmPKQF+2mG+ZL188MgmNIlgYEpG3hohOD8Tk6PCGxk=; b=o/+Nqvm8WzZkEgzSG4mRvpGkGc
	U2/lRFlkCKBwnskFrVTCGiC5J1yqgWbCKl2Vp2Fs/+OjS3m4aeesaDgESQUXje/BxIYUuax6knaRS
	x/kt3rDweVmwDudYqrddL1q6ORdF3WQM5MHLiBXKLWzWH1A2W8X7UAY4TL48eoPgqW1r5e+UuFJU9
	Z4Zs8WeCNYUNt2N92YFjDHkNm0HrsnHeyp6QWUSBxqVhKusrDNLKY7G0idkCf8qSEp93jhWdqDQjy
	PO91hhdlKdwG1PO1OP/qwV0GoiMxG79v+ouryCjfG2KwP/gKhPD8hXPBjfA/I0csYtYBNqsPZLLZo
	fowvCWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tplc6-00000007boB-1DFd;
	Wed, 05 Mar 2025 10:04:30 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplSH-00000007Zgb-0BTd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 09:54:22 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5258Xamf011442;
	Wed, 5 Mar 2025 10:53:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	jlmPKQF+2mG+ZL188MgmNIlgYEpG3hohOD8Tk6PCGxk=; b=Fjq5kxiQxSlriRIW
	A+MZ7h0Si2K215csBhtSZJJADLjwQNdFpTjmi9nuZ7odJtZEPjp7xJY6k5XxIAm2
	6S5wuK40wYryGQRuB1SRaZTPwvElSe+graKdJZJ9jGYICOnxPg1BcqGIh+gv2EHn
	knpOZlBu9hoq2y3u8hAf91PAsQbZcESa3W+qCMoFm+y0+LAGaPy8Rlbe50FeINzT
	fMo8Jrqpw+6ejWXVIlvVwRMbI4/ZBsi0b/eP6KD+DoZ288QSwnkkbgtx8U7xHaFr
	rn0IkPtKDoiGHf5sgqcltVLCtsGjfYavXFKZ/wtM3XGhm0PWi7ltIgnao7GTsdGR
	pgGWgg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 455wbht7y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:53:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 399D840086;
	Wed,  5 Mar 2025 10:52:46 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAF365A5D6A;
	Wed,  5 Mar 2025 10:49:53 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 10:49:53 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 10:49:53 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jic23@kernel.org>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <wbg@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v3 4/8] clocksource: stm32-lptimer: add support for stm32mp25
Date: Wed, 5 Mar 2025 10:49:31 +0100
Message-ID: <20250305094935.595667-5-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-05_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_015421_374068_D71585F1 
X-CRM114-Status: GOOD (  17.68  )
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
disabled. Read the LPTIM_VERR register to properly manage the enable
state, before accessing IER.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in V2:
- rely on fallback compatible as no specific .data is associated to the
  driver. Use version data from MFD core.
- Added interrupt enable register access update in (missed in V1)
---
 drivers/clocksource/timer-stm32-lp.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index a4c95161cb22..96d975adf7a4 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -25,6 +25,7 @@ struct stm32_lp_private {
 	struct clock_event_device clkevt;
 	unsigned long period;
 	struct device *dev;
+	bool ier_wr_enabled;	/* Enables LPTIMER before writing into IER register */
 };
 
 static struct stm32_lp_private*
@@ -37,8 +38,15 @@ static int stm32_clkevent_lp_shutdown(struct clock_event_device *clkevt)
 {
 	struct stm32_lp_private *priv = to_priv(clkevt);
 
-	regmap_write(priv->reg, STM32_LPTIM_CR, 0);
+	/* Disable LPTIMER either before or after writing IER register (else, keep it enabled) */
+	if (!priv->ier_wr_enabled)
+		regmap_write(priv->reg, STM32_LPTIM_CR, 0);
+
 	regmap_write(priv->reg, STM32_LPTIM_IER, 0);
+
+	if (priv->ier_wr_enabled)
+		regmap_write(priv->reg, STM32_LPTIM_CR, 0);
+
 	/* clear pending flags */
 	regmap_write(priv->reg, STM32_LPTIM_ICR, STM32_LPTIM_ARRMCF);
 
@@ -51,12 +59,21 @@ static int stm32_clkevent_lp_set_timer(unsigned long evt,
 {
 	struct stm32_lp_private *priv = to_priv(clkevt);
 
-	/* disable LPTIMER to be able to write into IER register*/
-	regmap_write(priv->reg, STM32_LPTIM_CR, 0);
+	if (!priv->ier_wr_enabled) {
+		/* Disable LPTIMER to be able to write into IER register */
+		regmap_write(priv->reg, STM32_LPTIM_CR, 0);
+	} else {
+		/* Enable LPTIMER to be able to write into IER register */
+		regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
+	}
+
 	/* enable ARR interrupt */
 	regmap_write(priv->reg, STM32_LPTIM_IER, STM32_LPTIM_ARRMIE);
+
 	/* enable LPTIMER to be able to write into ARR register */
-	regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
+	if (!priv->ier_wr_enabled)
+		regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
+
 	/* set next event counter */
 	regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
 
@@ -151,6 +168,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->reg = ddata->regmap;
+	priv->ier_wr_enabled = ddata->version == STM32_LPTIM_VERR_23;
 	ret = clk_prepare_enable(ddata->clk);
 	if (ret)
 		return -EINVAL;
-- 
2.25.1


