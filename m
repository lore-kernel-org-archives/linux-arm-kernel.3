Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0BAE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LYXoEwAJCj2ohknL9orR3/jQcCX9UQUNp+RkioFs/s=; b=Fd3ukF2DlIFGI1Kt0OHZnnZDPz
	ptxJz71ve63J5Z0gkvxDCr1PdqcqdbSVpferexniSsfqXeHsnl2klIxC58LRvMX4CC5BCfn7rXEV9
	0ZevarOJGzBZEivW7p2oKnHotFnuvNejbgfLYVFOubSbwgAqB4mWhW/fCCcF0MMnOwIYeuDNxGtUP
	YC4Oi+n/p1WjtwQppdEThr7vRt/zvdVc0aNLFbYX1PrUHAo/xshY1WdZvkYXiNaKnZrXjjy7ub5G5
	k9vMJNFN/tvn8wzm4ADjke95/EuNdOcvEN9ntafPnuwa2jFMF6bCldndOuanxH9SLE7Gll2whTjnl
	0gsuKGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqMY-0000000G6MC-3pbU;
	Wed, 18 Dec 2024 09:29:02 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqIF-0000000G4me-1TlL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:24:36 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI60N1n011765;
	Wed, 18 Dec 2024 10:24:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3LYXoEwAJCj2ohknL9orR3/jQcCX9UQUNp+RkioFs/s=; b=QLQb+rNaPGsLRKCL
	vxTe1kMHFocrEpOpXo5JVXEJs3ri5oYjn6FjuM7OLs9VUHUilYrL0e9WWrV8Xt1C
	sSCxe3P95YWNdY3aXu0sFLf8jEx9iM/0VrwNFzxkB2QZcArx3LmRVr6BYhgdesLG
	Bf8tjGMMZBjR6XgxaWnfFkdqbq4w6ku2hY7FSCYyuMPFi7vkzqZd//3JYDmlOaEr
	fGB+5HCQH/hZp9cZEWxFdUpG2CIbnyCw7x1dyiGGAnZ7SRvtQlIicmN4zlEcX7Nv
	1cB8sPM7xCd0M4fWAr0ZqsCMqRoaK3ZwiXg2W3ZEG674PjtiMD0ZeAYcW4OLV6zJ
	jG6QXA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43krrcrrt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:24:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B14094004B;
	Wed, 18 Dec 2024 10:23:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63B9025F1E3;
	Wed, 18 Dec 2024 10:22:30 +0100 (CET)
Received: from localhost (10.48.86.108) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:22:30 +0100
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
Subject: [PATCH v3] watchdog: stm32_iwdg: fix error message during driver probe
Date: Wed, 18 Dec 2024 10:22:27 +0100
Message-ID: <20241218092227.771133-1-clement.legoffic@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212102050.374501-1-clement.legoffic@foss.st.com>
References: <20241212102050.374501-1-clement.legoffic@foss.st.com>
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
X-CRM114-CacheID: sfid-20241218_012435_678363_4A6E9980 
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

The commit 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
introduces the support for the pre-timeout interrupt.

The support for this interrupt is optional but the driver uses the
platform_get_irq() which produces an error message during the driver
probe if we don't have any `interrupts` property in the DT.

Use the platform_get_irq_optional() API to get rid of the error message
as this property is optional.

Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
v1 -> v2: Change the commit message because it only prints an error
message and dont break the DT backward compatibility.

v2 -> v3: Fix typo in commit message 's/wich/which/g'.

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


