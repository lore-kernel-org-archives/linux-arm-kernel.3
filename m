Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C040CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AjdIaR6MdC1bXj1PgBl4op30U/Eb3YmtVX8LVQkTc3s=; b=mSAkiUMXIY8OAlQnjHOlRJTvDk
	3vigRaVbpbAb46jLhcrI8YFREk0cnCl1+1DbvpMIbYH8ibTMjjeAVVonCxCDiOkJpeWXwtCU+NKIT
	4T6Q4nSHGmNnE8l6GhkdHnCjzia91YFzkMSFF/uSiPyG/7WGvjK/5U/lRFvD3N3jgx4XutHA+Bt/Y
	AhWoPyp58Yj4wE0klcFxQ2k3fGWeqlQPswBqzMZ8PUVbXHbE7BunIhAPB2kSXcqYgSjy5w7xc20i8
	czqQtCdR3hpyP9CAyHu2D23GEJak3RiBzdxJgXiTyTCVPm9FW3CA1zQj1ygPrHyE5tRgtnNlfyM+k
	PcdWlmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6kq-0000000AMRE-0upe;
	Thu, 06 Mar 2025 08:38:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6jD-0000000AMGY-4AQE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 08:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AjdIaR6MdC1bXj1PgBl4op30U/Eb3YmtVX8LVQkTc3s=; b=prR0bhfcCsskekAAC1nfrjY9a3
	T8EiE8rKwbSz/Hx0fUbejk+G17IU+a8v5vjkPvySMwe7rCnOZFKaTFO/OpZJ46jbqYREot57X75k0
	rPoMRhnGT598SkqX6tfGlT55vAb8m96ZwiyrlAq+iWk+e+ToKPBO/F6zNTFtsP/M7q0N5HxulQ5Ss
	e95JCiwkAduMyKN6uGF8zKVNCM+RSaJd5huye8cCmVQzfs6HT1xhzs56u2Og1myMYU1JQlvGfiC7B
	6N/AuwhFXnTxzro3HXqJKuHUsHGQEyh4U9170EqYXkpoocsPhC8U/1UrentBYurGkZuNJ7LyYy6IE
	PnwwiB5w==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6jB-00000000yB0-0Cm6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:37:14 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267Sk4P015077;
	Thu, 6 Mar 2025 09:36:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=AjdIaR6MdC1bXj1PgBl4op
	30U/Eb3YmtVX8LVQkTc3s=; b=sGUVnCB9AsP9lVcBc94H0iRsI1bvs/7vqYrEJW
	SOJgG+zfq/xn1Wj2Lp0GSUOJUpDOPtJdZh20m879FLpDq69j+QZh3yOCjFD7b0VL
	EJrCSaIcaB0oHwJTRs8T/UGlypyqr3Audz+1lrymJFgCrUBzImKLz+D0WVv0NTfl
	HXf4g8xMLVrO73+jSMnP3i6xFnOdOB1nZwY5QAzbWjjZZ+T3vTEfLvIt8S4Wnbh2
	r7uMAA+3CzAbCFoVihzekdEhgqkdCpbDMLd0hJ4+iBby4aoDHR46Zo4K/FO6dQH9
	19Ogdgk4+KDlFbOvTWLnbNVh2vypX7OmsgOkMqZC8wOYLSbw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 456krth3ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 09:36:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A68EF40072;
	Thu,  6 Mar 2025 09:35:14 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA4CB374AFA;
	Thu,  6 Mar 2025 09:34:19 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 09:34:19 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 09:34:19 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <stable@vger.kernel.org>, <alexandre.torgue@foss.st.com>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2] clocksource: stm32-lptimer: use wakeup capable instead of init wakeup
Date: Thu, 6 Mar 2025 09:34:07 +0100
Message-ID: <20250306083407.2374894-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_083713_196659_496A2F0A 
X-CRM114-Status: GOOD (  10.36  )
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

From: Alexandre Torgue <alexandre.torgue@foss.st.com>

"wakeup-source" property describes a device which has wakeup capability
but should not force this device as a wakeup source.

Fixes: 48b41c5e2de6 ("clocksource: Add Low Power STM32 timers driver")
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/clocksource/timer-stm32-lp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index a4c95161cb22..193e4f643358 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -168,9 +168,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
 	}
 
 	if (of_property_read_bool(pdev->dev.parent->of_node, "wakeup-source")) {
-		ret = device_init_wakeup(&pdev->dev, true);
-		if (ret)
-			goto out_clk_disable;
+		device_set_wakeup_capable(&pdev->dev, true);
 
 		ret = dev_pm_set_wake_irq(&pdev->dev, irq);
 		if (ret)
-- 
2.25.1


