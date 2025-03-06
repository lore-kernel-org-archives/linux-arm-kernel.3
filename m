Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65967C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i25B/fkLHK1RU/fdbGdLWBTmc+3G1OzFRZKpzvCLdcA=; b=b9eN8WggxZyU7Qm67Cf4Oa2VwE
	DZbEhEHrKDiv5sFR3vQ3Oh5WrxhWIcJr/mzEHVtAhtEBI1fhuMmPl37rdYdWWfWjdDH/Sbn4UB87g
	pif7wAcrm37WqO0v5xUm7pHNmlZ4xsyYMuCVgxZTsmILfH36dI6jdZwzg2e8ofLuzJ5jCDRxejKN7
	zLpKr9e1XhUrpFKUTQRb2TLRm0URIjfJkX45my020hfebqrKbB6yoie0Yd0wUK2etNOPg7k1lyW8Q
	EcYkiGjZcMlUO1kcUU93CKES/zFfnMfToQyOsm7/55AOd9NIpcK56RzLxzLKrhETF0lAuzYQCn6ky
	0+JDI8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Tx-0000000AeTu-1QuK;
	Thu, 06 Mar 2025 10:29:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8SM-0000000AeKn-3F6x
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 10:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=i25B/fkLHK1RU/fdbGdLWBTmc+3G1OzFRZKpzvCLdcA=; b=kebWJ1DeaynRsNwib+vt4ARCJv
	H7AHMefxpoWhGzrRDg2sW3BEkGPiQN7JxSQHiNWZrTzwP8/92TBSM6HEJRpvwAgw9JKgqVTPNXY+S
	xzXxVa3vtLW16r4T0NsN6PZKBbZce+uAz0Rid4/9cQ00w3mGTgvH5CO985CUrp4yJ6VeD8COGu243
	6Aw9keHcWab9cPsxXM1w+2MHhf/fxaAspcTHO53nrnTGlGG/gBZ/pTCDRer0K4Hjen2OnnvqNNAkQ
	CnCeYePAZvA3Vz+NpEhHq+NgKg3DmZhu/KimkOuvFgYcJKk3TjNCunupOZP7/ZH0d5r1tXgC99X65
	lwbpWX+A==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8SJ-00000007F54-2Ke5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 10:27:57 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5269eKPN004190;
	Thu, 6 Mar 2025 11:27:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=i25B/fkLHK1RU/fdbGdLWB
	Tmc+3G1OzFRZKpzvCLdcA=; b=6yEaehPbAGe8dSomZdSHXcohOXUVft84bzsuF0
	zETvDRTOJJwstQ0rx+kmm664rnn7Z7YWjHf1OB9eYhqxP9f7zSAXb+4kPeq6gmen
	fLgEiKkuAE7PUhni5xVZdQRqW+LBfup4t9VjHI3tEDsJoE5ULCXuoX6xY4Z+b2Wc
	C9t1ZQcGw1a14B/zmTdFSIHXw//obKPgNtGnMWJKtPaTamkbuPVsfZajqcnzM2rm
	8tsC68rerQdn6bI3nZNb4avp6JuPv+tpl7GtZHn2ypQ9dxy9dn4Ds31GMYRqfma+
	Q//axTsua7QIAcAOW3+yXpxyktM5C9QOPYyi6N0SnB8jMvzg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 454e2sxkf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 11:27:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 20D0C4009D;
	Thu,  6 Mar 2025 11:26:21 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8AD8151DA64;
	Thu,  6 Mar 2025 11:25:22 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 11:25:22 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 11:25:22 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <stable@vger.kernel.org>, <alexandre.torgue@foss.st.com>,
        <olivier.moysan@foss.st.com>, <fabrice.gasnier@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v3] clocksource: stm32-lptimer: use wakeup capable instead of init wakeup
Date: Thu, 6 Mar 2025 11:25:01 +0100
Message-ID: <20250306102501.2980153-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_102755_919252_F2A52FCE 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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
Cc: stable@vger.kernel.org
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


