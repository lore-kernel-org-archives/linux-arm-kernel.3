Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91146CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PMCZ3kwt54+wBckEugkgYH3+Oq9j8RKzLnXGdNOFnIY=; b=r63yoawA8+h6r+ryV+Rqeuyvsz
	QbHDLoy9sBeXIq5MA/iZ5t/ru3cMYt2YB7A8nfwvJ5L/553kCz8mEugvrSwsF62ek5mnz+e6YbW8e
	UfbCK/rnBEIh9TMJrOEmU18rFVlyonBZ/ptXiZof/IpcNyHzIheClq8OHKxarVTJdB1WsyAO7R9nw
	nK6XGJKWC7G8fMfglnR/yIQQJYyKaPMcdQXpL9uPSFtBaZfH9L0msR6DThFtKrmpNQHFUb18VJ3Wq
	03d6MpDrbwnMwzwZPxh1XuMVzy+EeAngaPY5r7771uiaQLISw0kjDiHorP8gLo6Lh7EjY8zBcdljy
	sIJaEjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUa5J-0000000E1OI-3tHf;
	Wed, 03 Jun 2026 01:07:53 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUa5H-0000000E1Ns-1hcV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:07:52 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-516e1525aa3so121873611cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 18:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780448870; x=1781053670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PMCZ3kwt54+wBckEugkgYH3+Oq9j8RKzLnXGdNOFnIY=;
        b=PlArxemjOAkeHiJ5bkECGndPC3Y1SMYXtNGjf0Mkm32f8Qiy39ds42z/oRBc5Q+UnV
         KnGH1xTAzcb1mTWDkjxSaeC2+wnI7fF2Ea2DLdcl6V1Go5g0siboH1QHlMicYTPGbJkU
         QTB1lvwDdTDTmV62KWUlqmSVMMIJs5xXEQAsugVF1xexKGNcxPHJlThGedd9aYkM/iqp
         mZi6bGaVJuEL8JY4izkr3K/Fdb0844VC/bcx08T3VxsfJR2205cPCLe+8Uj50c/bYoRm
         7PmADpNXc9xzXovJmQ2B5BtmQ2wgXJJiICxO24F/xni1JWO8N302soNGPvcp6qbPVdxr
         Gt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448870; x=1781053670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMCZ3kwt54+wBckEugkgYH3+Oq9j8RKzLnXGdNOFnIY=;
        b=k3R/ovsUQzdb1uiQTJbRv0fOAfDjxr8HyI1CnFLyrzRJS68bHTMtvWN0C0udGY8JOL
         +zdFTlJSEJitc78IBkSH3PXANWbcYK6GHa1QtBlOaNPoRe9zlOx4k3k6y93dqDtSb9Va
         MFfhNxezUpYru4NwSXXTf8QcKU0olwAkay9kXcD141KPTj9V3I/eKpSgq2J6nA+szHKa
         FB1pu+k2UBK17Ec2reaP7YZMW/uE4RFZCemVTL8FtEt4vK57opspeszvoK69T8N2Dkwu
         YCEC0QcYrFN0en7DMEtgYHiDBhIRhG3Srn440sArn+bUimLZKSIPgKHGWKZ83MY9cZ4B
         lxsA==
X-Forwarded-Encrypted: i=1; AFNElJ8JXH2YbDLeTDBgTt5f0IaVn04kiyawdPNyiQ17GWeqURXWFifJO7A7kxOymz6uJ4S5P0+X7rZnWYsqPCMuV3Na@lists.infradead.org
X-Gm-Message-State: AOJu0Yw32gMetzUM7pagx9hBa4SlryJgKAwBg4BU/D0tkxTqJ7xfd5eX
	0mfmd6SE1iVoE+a32F25Esb0SAjcK10zCVGmJiJMsnQskE7T1dfUhRDR
X-Gm-Gg: Acq92OE+MeUdsy+Vhl31QAnFeJdyhCLJqsJ7TNkKlMUvnbGNJzH6tPtCpigCc/n+VGQ
	Ckb+ImWpAsl+jMFMBHCqO6IWaWKpYK/brXMdbU5UKEYKq6YAOxSi7rhA320lL3xbCrhq/rLbdHq
	UJEzfBmw0f6ay+7Z+EiIWuBJqm+JWlUV6+E7LjgDg9C4jXv0oyCuPHY6Ar1GmMa8YpY8sN7H4hW
	c99JIjVSSH6cuxTnhriV75KDOJQCYer3Vt+b1GvNK+Euaj3rk/nHwBGptvIcjjndmkwP9lbn+B3
	+6Ag+EUdGsV9jBllwdaiaVGscNtZb5IybUoSvva3+7lXgRbWMruvBQBxtn9jBoE6y4NPYQpX6Sl
	NgP/EM4w8lMvtBP7olsDW1ljz6KgZ0S7jETbZIVVXUig7rOl0xWFycb3M/Mx+Bhz5BCQPb9ft+R
	dHkN4fSw0MwsymierBv/Xb7XEHYblKZvx/HfNNLpkAI9lhAb4vn0SZVddZAyWqw3lbjmsPLsycD
	y1XWR3tlYt8boRE6ppL90P39w1s5c0bb4ONTR3XKCnY71hz3VhoSq9U
X-Received: by 2002:ac8:5dd0:0:b0:517:6665:2a9a with SMTP id d75a77b69052e-517787bf3d1mr23491841cf.50.1780448869820;
        Tue, 02 Jun 2026 18:07:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b9d5sm7037416d6.44.2026.06.02.18.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:07:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] watchdog/sama5d4: set platform driver data before requesting IRQ
Date: Tue,  2 Jun 2026 18:07:31 -0700
Message-ID: <20260603010731.230581-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_180751_450627_FC9512D1 
X-CRM114-Status: GOOD (  11.15  )
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

sama5d4_wdt_probe() requests a shared IRQ before calling
platform_set_drvdata().  Because the IRQ is shared, the handler
(sama5d4_wdt_irq_handler) can fire immediately, at which point
platform_get_drvdata() returns NULL and the subsequent dereference
of wdt->sam9x60_support causes a NULL pointer crash.

Move platform_set_drvdata() to the beginning of probe, right after
watchdog_set_drvdata(), so the handler always sees valid driver data.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/watchdog/sama5d4_wdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index e82b91513fa8..024300299b57 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -267,6 +267,7 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 						: AT91_WDT_WDDIS;
 
 	watchdog_set_drvdata(wdd, wdt);
+	platform_set_drvdata(pdev, wdt);
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
@@ -315,8 +316,6 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, wdt);
-
 	dev_info(dev, "initialized (timeout = %d sec, nowayout = %d)\n",
 		 wdd->timeout, nowayout);
 
-- 
2.54.0


