Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3962C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlmPKQF+2mG+ZL188MgmNIlgYEpG3hohOD8Tk6PCGxk=; b=4tOBxOg6wfEDLDzbDpUzFN8cvc
	fX1PBPgZLoFVW2BWroUgMCFHl/wxqQuP33tv1xMVHF7ZhwTH80oWEYJ0CthvEv4Qfuq7wVtI6fH3G
	TDzUR70KTOwtVri5gqvQgsfv+4FaiS6ctQ2TkiYa6nVe/UjUmidrWJhc672QG4UBUbC7S48YOGzU4
	3nXdpOmu5S44Iq16mE9+moUg4qxVIIlri+t8iwG8Ls6eNLQdexWl7tl6uMK+VAhMAHYatVOPK8Xm8
	yNlUofiBq87jQzfNXMVTadk8lQMJlMay4rhM5y46E0wbyhLYeL+NvNoWuVUaCGmRwlAfxUwhHHhdD
	lYz1uyAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXie-00000005yYa-2oOA;
	Tue, 04 Mar 2025 19:14:20 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWFl-00000005g0a-1nKL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:40:26 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524FVO27015326;
	Tue, 4 Mar 2025 18:39:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	jlmPKQF+2mG+ZL188MgmNIlgYEpG3hohOD8Tk6PCGxk=; b=vhe7W4PzPmnsL2LH
	FJlme5NRroDCHIm11j/ACFzPxPDPrmO4nxBLu8alit93+RL0w6qRAAL0+DUir9N3
	g8zFzRudwdH84zqP9/kzMYIw6d1qKXYCu9sm9Dl+tWJm3rY/OMWUF65thXUEddtI
	AhNaoORmckZtLn9lIefjl3npl8KghXjUPreqiXAFpyIpfxgfUd8VK0svEQCSlp1z
	ZeXK6pmdcI4Ri05nWo5YaTRFQcDSiW+n3Q4QjmVjyms8DDBAaz3h+i+ylqE/CKlz
	7mf2iuC/MBtCdaS66nQZxoh4YUACD3zHTLSAW86DyCqHH3GWm1yBWbePiQjhboow
	rvr0Lw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 453tf5nsfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 18:39:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 276F4400A3;
	Tue,  4 Mar 2025 18:38:40 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60349594855;
	Tue,  4 Mar 2025 18:32:49 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:49 +0100
Received: from localhost (10.252.16.143) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:49 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jic23@kernel.org>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <wbg@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>
Subject: [PATCH v2 4/8] clocksource: stm32-lptimer: add support for stm32mp25
Date: Tue, 4 Mar 2025 18:32:25 +0100
Message-ID: <20250304173229.3215445-5-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
References: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.16.143]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_094025_770216_B86E0A96 
X-CRM114-Status: GOOD (  17.77  )
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


