Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D445BCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOc8M9GQ2VJe92KZSwyY8Mbp47Jr3fn4y/WOydvK80w=; b=LBtNjrmLDMI0eXtUFOy8Qcg0Dm
	UfsIDwS6X3YQA1QLwIf0FLueOmWyrXpmvGOq6P69i52kHpt1h4Q6TD4P5ghVwOewXGF4uE8/PXNSF
	aPLP8WzYFocwbxDmr+oxsKAX+KPkHuRyg3BcZZH3E67DJrOm1GaBncEYWBnSHPInLfp/uJznxCM1o
	rf36FuVuzZq2xRQSHCsGYO9+RVIojJM1Xsj+yyVTN7SYHVa3Do+lu7T99inPHoxaYhtyAfsv4EyEn
	OVjeGnqDSj7xyd15M2y6IF/Y4GIYp0VH3Io3/QXkPaS1MmRg4Vj1CIgRXhFaEapkSYNA8rBbTAHZt
	qo0SQ6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgIG-00000004L2O-1Z0Y;
	Mon, 08 Jun 2026 20:09:56 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgID-00000004L1e-41W9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:09:55 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-7dfe7712572so45549027b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780949393; x=1781554193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOc8M9GQ2VJe92KZSwyY8Mbp47Jr3fn4y/WOydvK80w=;
        b=GzZJL2+V2UX8u2GNKOLHhuISTQr9JVXteeexTIj1DquHlvqi1s5kNn5An/SDv+WoYX
         MgV1NFaAINXjhLCmMcOB/YZHwLdJ7xJU4o8ZAv9EKfIEjpHzujQgtCIG7CUqH7wh5JhE
         BSft505JJl0qy2bBV3PHOFoo+5Be9K1qi5alYj+dNr+C5xp5fyAmMTOsCuAgLqthq40C
         hKpyY/dCMTpESLrxJhFM1X5qU3dLb63GIJnkgIDw2gFu6Q7ZB0h0/mFDUHt+6GaU808J
         zMntFIwbmsadPAPHPzyRrwI0dDpDi+DpFA+rQzhcV2ZZLu8WXsIpgdLzgLNgCMuf6CSU
         CNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780949393; x=1781554193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aOc8M9GQ2VJe92KZSwyY8Mbp47Jr3fn4y/WOydvK80w=;
        b=Ab3CkxnXc5C4fB/06vz1WuLGwSvmt7YP6RqYNGoeqanXAa9Gw8+9k28Lz1fpsJK5QA
         9eHmJw8ScCH2S62DxU4iLejDIjFO5KSxhd3QM7bns0W9YwI5Vc0FzFrNxQ400CwlIojT
         f3iwBi0AVOdJtmG6rs5rRzLeWlF1Sdd63jNWkm4dQdki48dVkW31qDyqonoyWz9TrVii
         JsOYIfPJEZdejt7yjeW9AoXgvTf7VG3qYqpf7HWUzXfhKBMs9R0HEeTJtfEjqiwocEy1
         9X8vcLtv0LftMvOALFQ9A0mWyMvMVxj8kUDqzPUY+p/KHCpwI8jEtJULyzPZHlOmor5m
         Lyyg==
X-Forwarded-Encrypted: i=1; AFNElJ8Qfq1hZM1vvH5vthf9inSQZ5jccX7G0y3if9UTtsI0T5CvDg/CZGxa9g2hX92WBCaPd+P2Y98CJv7yvjJ3AFxY@lists.infradead.org
X-Gm-Message-State: AOJu0YwaDn6KtyXdnZzVOuQ9c4zSa9FYszBHq0F4JEfC3Ghr0UFxstvf
	TKY7e0upH0o28LeKJ456svSceZCZaliTrcmV7l2HTubRR0VJPASBcq9C
X-Gm-Gg: Acq92OEvszQgSqDrKS/52aF9m2ahrlfQQMWxW/xAitwKbRnn2t4z8nDC3bD5dpQX/f4
	UtvGih8r+fb1zyiQY9YVE4qdBCfmHJR9z/ozS5SfwqFoWQfYEIyaeaNiVbHSA9eroV22/OZiqgy
	t+gpd6WCJNJ6rERuryJXlnhPf2aeoY2hIdFyxItser8EJaa8TGjAn5Zam9cW1Rr5CYms7R/Nze9
	ITaHhu50H6ZCv3qNdiSdUHvABNkQsoCu8SSHLNx1RxfohzLPJRr5E8Y/gueWIuwEm/38qx99dPo
	4A9T3qBGGFPCJ02y/Qi/VLth/FnQLZEtMZiX16K0IKo9s+xVnvIfmDc9PrXWLZLgID1efOvac2N
	A0WbXJFPtbrAz4JfacMmMzNDBAZ8g2nQ8C/tTjhjeSGIGEZF7+d7ducSIek6FMzogwTBucfRBgq
	bS1oL9erMY0r9LBJzqmxKnCP070bjw402A64bintrwufqyut4421DxRA2R/Rldq2aIKV+QCljv1
	JVOBdqUhPSY3ZeMsg4tT4OZOHut0yXOXa1xyKYIB0YhAw==
X-Received: by 2002:a05:690c:3583:b0:7b3:b0a6:2c4a with SMTP id 00721157ae682-7ed0d1da632mr167209037b3.23.1780949392565;
        Mon, 08 Jun 2026 13:09:52 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea986bsm88688987b3.9.2026.06.08.13.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:09:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 1/3] watchdog: sama5d4: fix shared IRQ and hardcoded timeout issues
Date: Mon,  8 Jun 2026 13:09:31 -0700
Message-ID: <20260608200933.18669-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608200933.18669-1-rosenp@gmail.com>
References: <20260608200933.18669-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_130954_321396_5C7D9FE8 
X-CRM114-Status: GOOD (  17.25  )
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

Fix three pre-existing issues in the sama5d4 watchdog driver:

1. Unsafe IRQF_SHARED | IRQF_NO_SUSPEND combination: The watchdog
   interrupt is a dedicated peripheral line, not shared with other
   devices.

2. Unconditional IRQ_HANDLED on shared line: The handler returned
   IRQ_HANDLED even when the status register indicated no watchdog
   interrupt was pending.  Return IRQ_NONE in that case so the kernel
   can properly detect spurious interrupts on the line.

3. Hardcoded 16-second timeout: sama5d4_wdt_init() unconditionally
   used WDT_DEFAULT_TIMEOUT (16s) for the hardware timeout, ignoring
   any timeout configured via device tree (watchdog_init_timeout) or
   userspace.  Pass wdd->timeout to sama5d4_wdt_init() so the
   configured timeout is honored during probe and resume.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/watchdog/sama5d4_wdt.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index 704b786cc2ec..f74f1e8956b5 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -169,11 +169,12 @@ static irqreturn_t sama5d4_wdt_irq_handler(int irq, void *dev_id)
 	else
 		reg = wdt_read(wdt, AT91_WDT_SR);
 
-	if (reg) {
-		pr_crit("Atmel Watchdog Software Reset\n");
-		emergency_restart();
-		pr_crit("Reboot didn't succeed\n");
-	}
+	if (!reg)
+		return IRQ_NONE;
+
+	pr_crit("Atmel Watchdog Software Reset\n");
+	emergency_restart();
+	pr_crit("Reboot didn't succeed\n");
 
 	return IRQ_HANDLED;
 }
@@ -197,11 +198,11 @@ static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
 	return 0;
 }
 
-static int sama5d4_wdt_init(struct sama5d4_wdt *wdt)
+static int sama5d4_wdt_init(struct sama5d4_wdt *wdt, unsigned int timeout)
 {
 	u32 reg, val;
 
-	val = WDT_SEC2TICKS(WDT_DEFAULT_TIMEOUT);
+	val = WDT_SEC2TICKS(timeout);
 	/*
 	 * When booting and resuming, the bootloader may have changed the
 	 * watchdog configuration.
@@ -305,7 +306,7 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdd->status);
 	}
 
-	ret = sama5d4_wdt_init(wdt);
+	ret = sama5d4_wdt_init(wdt, wdd->timeout);
 	if (ret)
 		return ret;
 
@@ -358,7 +359,7 @@ static int sama5d4_wdt_resume_early(struct device *dev)
 	 * This should only be done when the registers are lost on suspend but
 	 * there is no way to get this information right now.
 	 */
-	sama5d4_wdt_init(wdt);
+	sama5d4_wdt_init(wdt, wdt->wdd.timeout);
 
 	if (watchdog_active(&wdt->wdd))
 		sama5d4_wdt_start(&wdt->wdd);
-- 
2.54.0


