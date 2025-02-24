Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B490C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GTr3MiF+X8E++5/d1k9zNiwhyWX8NQucbTgDgyPXgzM=; b=1+nd6ev50oYBv9pSszbKvqkAkD
	msa7L8RHTNTXjIdGb6qNASuasLo9swLHgf6+5t8E/JnXEVp3kMc/Fk2Pi8+wxNuI+OpGr5yAD/zjH
	EL6xfW+8s4vfxSEcEruMDmKZG/l7SRcVK3IhMWty9lGlj4Q0VYhfOM/wxv4XG9YWbNh0vD1tZaazX
	4OAq7mpUM370wGLZS0kfyRy0zOSyMvDGIidLnd7sRsEqlV/IykMRWoKj6dfr9a49M1vSUfRsizJGM
	dvxrHzZBSHtzKGDvlpFjBxIOR/er7MYpT26SMCejNTtmMlPWsZpFbMjXy3xcZONjgUdDv9xAARDd2
	iJXtLqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmc8e-0000000EbMO-1Ml7;
	Mon, 24 Feb 2025 17:21:04 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmc74-0000000Eb2G-40BK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:19:28 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OCixFa013141;
	Mon, 24 Feb 2025 18:18:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=GTr3MiF+X8E++5/d1k9zNi
	whyWX8NQucbTgDgyPXgzM=; b=FUDrhTvWnYasctYRtyGBXE9jaB4Bb2fd9efqkz
	U0icqpJMn4T+2PKvta5rvS3Ovu1JM0cXFy/eTYjh9gqTWmAyR6fyvovwYnJgbFWM
	bg2RG0PdeEvQs4Cn/iABWV+uMzcoJLfYZ6ovLb9eJcVs8nKsW0ksVFFeYn0Qz1x6
	pHGP5gRfJLlC4sVthXChcXruHPGgvIT5xI/q4+xDG8jTA5vYzPYDTJf2si1s2Yug
	GoQuKbknH2VNCz5CJwmkqQPyAJzlR2KFA34H0LMECIX9l5XGM8KE/dHZO4NiJF9a
	GGtSSqKkrJazdZsg9JOgyjN8h7BhRHZtORuRJIxQ985ml4Tg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44y6t20jjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 18:18:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3B60640044;
	Mon, 24 Feb 2025 18:17:49 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC8145387F7;
	Mon, 24 Feb 2025 18:07:40 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 18:07:40 +0100
Received: from localhost (10.252.23.75) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 18:07:40 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <wbg@kernel.org>
CC: <alexandre.torgue@foss.st.com>, <olivier.moysan@foss.st.com>,
        <fabrice.gasnier@foss.st.com>, <linux-iio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] counter: stm32-lptimer-cnt: fix error handling when enabling
Date: Mon, 24 Feb 2025 18:06:57 +0100
Message-ID: <20250224170657.3368236-1-fabrice.gasnier@foss.st.com>
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
X-CRM114-CacheID: sfid-20250224_091927_542417_1D18E83A 
X-CRM114-Status: GOOD (  14.64  )
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

In case the stm32_lptim_set_enable_state() fails to update CMP and ARR,
a timeout error is raised, by regmap_read_poll_timeout. It may happen,
when the lptimer runs on a slow clock, and the clock is gated only
few times during the polling.

Badly, when this happen, STM32_LPTIM_ENABLE in CR register has been set.
So the 'enable' state in sysfs wrongly lies on the counter being
correctly enabled, due to CR is read as one in stm32_lptim_is_enabled().

To fix both issues:
- enable the clock before writing CMP, ARR and polling ISR bits. It will
avoid the possible timeout error.
- clear the ENABLE bit in CR and disable the clock in the error path.

Fixes: d8958824cf07 ("iio: counter: Add support for STM32 LPTimer")
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/counter/stm32-lptimer-cnt.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index cf73f65baf60..b249c8647639 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -58,37 +58,43 @@ static int stm32_lptim_set_enable_state(struct stm32_lptim_cnt *priv,
 		return 0;
 	}
 
+	ret = clk_enable(priv->clk);
+	if (ret)
+		goto disable_cnt;
+
 	/* LP timer must be enabled before writing CMP & ARR */
 	ret = regmap_write(priv->regmap, STM32_LPTIM_ARR, priv->ceiling);
 	if (ret)
-		return ret;
+		goto disable_clk;
 
 	ret = regmap_write(priv->regmap, STM32_LPTIM_CMP, 0);
 	if (ret)
-		return ret;
+		goto disable_clk;
 
 	/* ensure CMP & ARR registers are properly written */
 	ret = regmap_read_poll_timeout(priv->regmap, STM32_LPTIM_ISR, val,
 				       (val & STM32_LPTIM_CMPOK_ARROK) == STM32_LPTIM_CMPOK_ARROK,
 				       100, 1000);
 	if (ret)
-		return ret;
+		goto disable_clk;
 
 	ret = regmap_write(priv->regmap, STM32_LPTIM_ICR,
 			   STM32_LPTIM_CMPOKCF_ARROKCF);
 	if (ret)
-		return ret;
+		goto disable_clk;
 
-	ret = clk_enable(priv->clk);
-	if (ret) {
-		regmap_write(priv->regmap, STM32_LPTIM_CR, 0);
-		return ret;
-	}
 	priv->enabled = true;
 
 	/* Start LP timer in continuous mode */
 	return regmap_update_bits(priv->regmap, STM32_LPTIM_CR,
 				  STM32_LPTIM_CNTSTRT, STM32_LPTIM_CNTSTRT);
+
+disable_clk:
+	clk_disable(priv->clk);
+disable_cnt:
+	regmap_write(priv->regmap, STM32_LPTIM_CR, 0);
+
+	return ret;
 }
 
 static int stm32_lptim_setup(struct stm32_lptim_cnt *priv, int enable)
-- 
2.25.1


