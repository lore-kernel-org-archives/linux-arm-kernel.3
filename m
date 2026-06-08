Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF06BCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcanDgo3AUrD75pAr7Q6B0AchjycHv4iLbSmE1inK6Q=; b=DXRsDaw0xNCXjx4yK4NYhjbd1D
	HI7LP1c6Yh8/CfOTDN7P1Y3M7jDzSLzOvvyJQsSteKmc74FV8lohJkSuyGbYMfgYlvC9K5GYjyk/Z
	f2i13xB/5lI1lR/VmiTj0D8f6j2XM22xUMDIPw9/9h8rOqld2DGGV1yR2GiNjZdir+L+BD2FA4Elw
	gP3uD1mABZ6eWVJPDftOMe52UvCDZ1OYQaNtT6VfhL9bdLF5mTk+x71CWL7AbuFZAHw9XOH7nfiix
	ybuvNYiwb7ER226cMe4sAZ4dHAPQWCKleCqYcridRqy7t5DTXSnO5Cs4W6FfxPB86I1ehyvBGdP6C
	vRfPQMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgIJ-00000004L3z-2thk;
	Mon, 08 Jun 2026 20:09:59 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgIH-00000004L2q-0sPZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:09:58 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-7dd3f176f84so55970287b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780949396; x=1781554196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcanDgo3AUrD75pAr7Q6B0AchjycHv4iLbSmE1inK6Q=;
        b=CZvHOCa+TvK11vTDoACV9rmuENnkgVXTU+MV1hUv8ImjuIZTQzT1i5kOBGz2oRApTG
         vzID52OyyeDxxH+uHQPoOnEvW7wM3+uWVUG1EIoBnZxCWnpsui+6T9+crcXRwb2cAZd0
         AyOanA1EXjkR3tvL0hwx8hbSy+a0mGlsdOyOUArCuFRk8lhqRY7lk3gXtk/4qPyiDXXZ
         M6QqaJ42dL9WgumovmBNw6pC9bYpOPGcG3/qlpzYRY/9jX6XH3O7907ufAtVSx3Pu3JA
         QcII1mUN0rdIid+wszj1zoSr2uUkw0XhJgo1i3v2Kpl4nJ9eB8Q9sypCPUfrsjb3OS9i
         wZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780949396; x=1781554196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HcanDgo3AUrD75pAr7Q6B0AchjycHv4iLbSmE1inK6Q=;
        b=qo0LDxmmrNkhmX0B7M/3+Lhj0Z2dlDaOtDy3MX3k67mQqBIZqRL853sc7OoN3wBR6+
         BtaW89ol072OLf96kNSpbS/0rCCnpj1KPuxsf0CfimeA20QKGmOswtgo3YN0633UJ6fP
         FLlHsHYBz6fFlds2Fv6Pw9vpgSxOh8ppwlgwduymtJc7acl1BdOsVX6ZbI9PuC7d44+y
         HyYsCM6803avqqa2ctWfJaDNvXAJCI+xpwmRKcDu8sjlzaEpzbVyPyUfxnjqzjVKGV5d
         XdRqsJ31w6hwJKewmozQkg08YOAUg2VbX59xwCwV4aZH8Y3OJulMr7DCkD0AUvH+r/M5
         c1qw==
X-Forwarded-Encrypted: i=1; AFNElJ+q4iCXbzgzyl9k/4J9N1NPbBNFbZpgXoXXJoEScgUfsi2ltWVXuce60jUuw3IgnPpIA+7/4FyIF6lgDdU7rdSM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+8QYmvNljHoucmUfcZO72iyk+WGRsyfVZ2UlNjTEbz94hIBBa
	tVI+hXeGcyYYGGa1K1gmXAQ+82jjLj7rZ3Dh1ermPKXMbu8N35Pu97jO
X-Gm-Gg: Acq92OGbJIrm8s6yjkitO+fg9DWmAWyfGKdEPT1zkIiaxx/oVEpPRCrkefQ6F+AkBvK
	5J3NsT4JN2sqAzgmRo9IVxkgTLP0wA76loGzzIwyYcqiYbo2tNV+EneYSX2lyEa0majEWgjZtkn
	hHvBgr6B7N6EZmhA35NwrPkxtkBQuddSsK0pPDmwoLWnv5WGAnrlQU14pIw/mPJSy2mWpCAxt5t
	YQApvRGgPKhLfHjJA8rywArbfD3A0TSxRojq540bz8bFeG9S7LPCAs46V4U7Rvsdg4mwbdeziG2
	QeGpGCV/LuQ0IMb7SCzkaRRhnW7gD5hsakeDIZkCNRBi7j0ozum7Ej40hHvqFbWT0a3p32oj8y0
	OQN+8OJ89PpFnXvL1BCmyWQCC1PQFZkRdJmzt+Jz5GIWqZL1gnRyMmcwUn25XQF5tOv7HLN9Lqb
	8cJ6B4ilT3GjrtoT47tDsXf36Y7OakBYCgqyiScYrdv1XlH5zqM69vAr4S6eSgk3KVxcrVYZu/m
	vIxfJeExUu3zQe/Lze9WPnSsEmBx1dz1ULKgGnWUXOgkw==
X-Received: by 2002:a05:690c:350a:b0:7e9:ab56:3c4e with SMTP id 00721157ae682-7ed0d5bfcf5mr147641987b3.18.1780949396178;
        Mon, 08 Jun 2026 13:09:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea986bsm88688987b3.9.2026.06.08.13.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:09:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 3/3] watchdog: sama5d4: fix NULL deref in irq handler
Date: Mon,  8 Jun 2026 13:09:33 -0700
Message-ID: <20260608200933.18669-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608200933.18669-1-rosenp@gmail.com>
References: <20260608200933.18669-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_130957_249944_9ED655FF 
X-CRM114-Status: GOOD (  11.43  )
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

Move platform_set_drvdata() before devm_request_irq() so that the
interrupt handler can safely dereference the driver data via
platform_get_drvdata().  An interrupt on the shared System IRQ line
(SAM9X60/SAM9X7) could fire between request_irq and the late
platform_set_drvdata() call, causing the handler to dereference NULL.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/watchdog/sama5d4_wdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index 2536e2f2ab32..7cd6f35c8e21 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -268,6 +268,7 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 						: AT91_WDT_WDDIS;
 
 	watchdog_set_drvdata(wdd, wdt);
+	platform_set_drvdata(pdev, wdt);
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
@@ -319,8 +320,6 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, wdt);
-
 	dev_info(dev, "initialized (timeout = %d sec, nowayout = %d)\n",
 		 wdd->timeout, nowayout);
 
-- 
2.54.0


