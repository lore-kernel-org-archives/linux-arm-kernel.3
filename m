Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DFDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imvmMoXZ9/lX7k57eRk+iPS5zu2P97QZjz1NfVU5Z6A=; b=Q5ARYk0ozhK1iDeZM3nbR2oo4F
	2LIYqo8psAf96mhwUl4UxMBrX+OyTTVzUfspNDH4EWyQ1JL410df0pHEtsa5kbv4zUpUglVOecUtl
	aZnvdEkdonj0kH/LxdDzGLTorv/4vb/tHURDhOcNwsFOoDAJtPIrh9m/+aM0xiud1+COWhKZd7YUI
	B2APSKmz0qR1eNjqYFOTl3A6fy66mllOkaYa/Xlq2iIhiJRcxXr322e5X22ahJjfMunwZ9FXCS/gQ
	qgyHOmoMQgluILyiualT1fOjpmbbKtcb9a+1pQsm6b3+PDAMn795mMVZ8cwyTyTkx47yO+qF2aTZP
	RvySc0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgMp-0000000036q-34zs;
	Thu, 12 Dec 2024 10:24:23 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgLK-000000002qy-3h5s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 10:22:52 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6PZoi025473;
	Thu, 12 Dec 2024 11:22:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	imvmMoXZ9/lX7k57eRk+iPS5zu2P97QZjz1NfVU5Z6A=; b=NMKWlrZJKJ6GxD7r
	rCaYfH803/je5mfEepO6UXg4n9wv+cfKDkcZaVRqvu6kR4e54N80P0VafKtbg4Sy
	ovDkNyw4i6c0E+A+XZr4FnI0GaV/xz9EXW20bLTeI/zHNarRXIOtQkXzoJcS6iCD
	AvcWqshiK4iFC6J5nHHetdCDG6XpamqKZkd+YniA91sYrLj+tsovoLcJPbl8kuf2
	T7ikeHdfFrzWXbWE9IonQys1rrlUxVudIHxEg6l2wiYQywMukTdkzBRG2LxMUFgF
	bcNWRLAKDfKjD5bRudV2i9aKix+9dqppc0IbwS8ah6W2G4OuQc9guIynzgSOX/sL
	rnxdYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj7131f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:22:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9B35A40044;
	Thu, 12 Dec 2024 11:21:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8C3A2698EA;
	Thu, 12 Dec 2024 11:20:55 +0100 (CET)
Received: from localhost (10.48.86.108) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 11:20:52 +0100
From: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>
CC: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
        Marek Vasut <marex@denx.de>, <linux-watchdog@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] watchdog: stm32_iwdg: fix error message during driver probe
Date: Thu, 12 Dec 2024 11:20:50 +0100
Message-ID: <20241212102050.374501-1-clement.legoffic@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211163457.301140-1-clement.legoffic@foss.st.com>
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.108]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_022251_235736_21E6A0F5 
X-CRM114-Status: GOOD (  14.47  )
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

The commit 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
introduces the support for the pre-timeout interrupt.

The support for this interrupt is optional but the driver uses the
platform_get_irq() wich produces an error message during the driver
probe if we don't have any `interrupts` property in the DT.

Use the platform_get_irq_optional() API to get rid of the error message
as this property is optional.

Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
v1 -> v2: Change the commit message because it only prints an error
message and dont break the DT backward compatibility.

drivers/watchdog/stm32_iwdg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index d700e0d49bb95..8ad06b54c5adc 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -286,7 +286,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
 	if (!wdt->data->has_early_wakeup)
 		return 0;

-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq_optional(pdev, 0);
 	if (irq <= 0)
 		return 0;


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
--
2.34.1


