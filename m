Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EBEE77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PXiCCXsVfW/h9LtVSBuu5+pxnV9XWp/7D8xOOI/76mU=; b=WRmY9TttElbIFOrrttU3+pWW3C
	zEHsnrutxOOIiBUAiCrIKnV4J1yfuRBwyQ0cO8EwBKIL0/zopmb11+y8KFJEB1EdAJ6Y3jAvzc4cn
	Duxpwcovknm1jSADyNa6GEO3G9zrjQ0g0afZNvTnNL1p1oG6EfxDu9BugpluFnd58u56BGpD3hpqj
	ArTWpTW9KhOvs0Uyhxyru+Kdx2oKBFWuD9lObK7nyyEoa9xv24ySiUEy+LI9PpFiiMicRFo1dW5Gq
	v/u7arJCMLLYimhkr4fdJW/3CrpiflAxQhAxc3AKWpNhlaHdpoJofTZborOFPeNjHacGAsH93qcJW
	PD1DN4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPif-0000000FU7I-2lFI;
	Wed, 11 Dec 2024 16:37:49 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPhb-0000000FTuS-2CUI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:36:44 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBDm6Z1014727;
	Wed, 11 Dec 2024 17:36:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=PXiCCXsVfW/h9LtVSBuu5+
	pxnV9XWp/7D8xOOI/76mU=; b=v6qHGIBWdpcdy0A+GRWq4r6uPGDOSASWQMIovH
	qyiB9GPJiNIvORrT9nax951FzOYMFWGto99bdsY2H0tlW04RTVlEOwgMps32QSte
	TZaMEqyZ5NcQYEfwXPkdOviIVPUpPdefoUVawj/hDcDlQd5ypKMWEvz2uLTqc3CP
	ul7GtS0rhWQC8hXJoMtN7Pi/LnZBBuq76QYlLeN/ClexYXDk52n4n5Tal0hMAOb8
	J1EKXQyRn6AY8cuVcSMz5kC9TKnkocgOivVwizZLnv4hLMsTZgNPZKftoZvCZgVD
	Mki2Fq/S8yJ7v+4a4Ye38RT7mqN0yaA5jP357YP9KYrmxALA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnmc1wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 17:36:33 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2D14140044;
	Wed, 11 Dec 2024 17:35:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8996D22D462;
	Wed, 11 Dec 2024 17:35:02 +0100 (CET)
Received: from localhost (10.48.86.108) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 11 Dec
 2024 17:34:59 +0100
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
Subject: [PATCH] watchdog: stm32_iwdg: fix DT backward compatibility
Date: Wed, 11 Dec 2024 17:34:57 +0100
Message-ID: <20241211163457.301140-1-clement.legoffic@foss.st.com>
X-Mailer: git-send-email 2.34.1
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
X-CRM114-CacheID: sfid-20241211_083643_862402_AE3FD478 
X-CRM114-Status: GOOD (  12.33  )
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

The support for this interrupt is optional but the driver mandates the
interrupts property in the device-tree, breaking the compatibility with
existing device-trees.

Use the platform_get_irq_optional() API to comply with existing
device-trees.

Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---

Please consider merging this patch in the v6.13 cycle to avoid breaking
the compatibility of the existing device-tree.

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


