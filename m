Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AF0CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 01:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/BQtNunbqSxrovheX7WXW6K0SrGGYRahvXKwiLXth4=; b=kzrk52IDuMFPCKozTscbGjUJAc
	kigCmKxoMGTZ9TMVvVS0aOWx0qG9ukhwHVql7FpV9By1WoP8YkN7wKzvRwMKyE1gIkeAvuKZ7dqAo
	a45PXX+iyNZJiYek3sHarx+jnwCZKiTrWS7bCEzhTzNIxLDHpXb/vWvtlmdwlt6g5G89jOwxWOy1Z
	712V9/6UJfon54xHorff2q5W84Qr3Y5XNlvwAipd6nHgGKzlBuWxjz2L992dzaLRJes3S9uS/U1s9
	2nC++TvrdYaojEhLODFL1/mW+vI87ECrCjVscwer2lRXt7DPzcPgSnDJwRnE9sVtFDIxftSLFrK76
	JxJWM8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUwX8-0000000Fz2F-1A9C;
	Thu, 04 Jun 2026 01:06:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUwX5-0000000Fz1D-0zDK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 01:06:04 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36d8b644473so112968a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 18:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780535162; x=1781139962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/BQtNunbqSxrovheX7WXW6K0SrGGYRahvXKwiLXth4=;
        b=SFDu5tpzrBZMvJCEFdwUpIE20OAjPmN7gadAllc3nGWTw1mFCUYy3TH3Wg0vOOWrws
         v3zwrEsbYF27h+gfgEJ46e9d7/jvXni0ygL531cjhi4hXXIvr7mRfe1N+6MCZ9nTjSj8
         BgnhdmWMFGr6cOVGQBa3wGjQk3Dn53osa87mdmx8Bo6ZQOCgqbzzhtp0l5PqcZ2fIDll
         nYpMGsk4js4OwMBZrohEWHxeK23z8jmSlo/Ydd3HiBDd2pl6i2mcEZGp13+3XbncCfr+
         QUjCQAa550ksWmgfQu2E5oZCOHRNhzR7kJbxaSMOzX3akhdrvP9/FeeDTkHMvhvWb+oX
         8WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780535162; x=1781139962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y/BQtNunbqSxrovheX7WXW6K0SrGGYRahvXKwiLXth4=;
        b=Kc1ZZ0LDYZo4LyQ3vnczFiCr8wSFDW5NNSIp5jd/x3LPuRjp6OgTYzW3+aqF9P++fC
         pLckFErvqGgLYrm9oybtlRgmdJO9ZElTwL4jZrE86I9qZ1E1/ao8cJnSCqwzeXQsfDTC
         LmXKXgS2YU0+1NFvXMQagHwQtfw2ttrrWmTLWpm8OrAVvpk/eL1lGMuEt+Sc5fA6z3H9
         rCNplSUTR7L5zepf7jy+6DbyzCAfAMnGbHgAvt+Wz1C9j/TXm58pBzZhLhB7KgWGP+wo
         CSt5lMXmoOibQB8b484R5w8qd4uA/wzS4l9IHCa+O07OoI7rSbmB7uX5kI4hdtWUM8HG
         gh4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6Y/u8z1mWCUQrIX5mpXXBY3TKM3wYx0vlCqojwyVx4dkU98quOMojqP0KnvjBMkqoOWH2fz9SPUg9ZjwlgMvp@lists.infradead.org
X-Gm-Message-State: AOJu0YzSpWO2f4bYW//v3eGVpzWgNYnN4/uMNzalOd8qc+8Z6HAJJ+7/
	ZI3YZ+D0HRwwF2RGrAixX76MefhJXvp0mJF9u9F8cCvrVd6I6FtJT71r
X-Gm-Gg: Acq92OHG0QFEOzdKNg90yKg9/Nv0EZFUMUqz2V+4rgKiY4FtoAkVKYHqmu4Kl7WKvqc
	mIkbJG3rnFv0Uh2a9RNyNH1LyuFQuookiQAHyA5UhzyXP+OqQXRlJRUw0MUjSJAQeDIAL9SFufD
	slgLAMDN1Q0fumNi4ZQlz8HrQhulm4sKhJsQeELtAIWLy9YZQekWFlUQRN/Tk8Pg98GH0oYAbx7
	Eo4P3BJawU8fwOsow9gnwwlx3m3wKaG4P5s3gFDLpsd+3sQRW8Ceciu1SBRPVEIef85Tio5apZ5
	veyVvlprrUta2ri2syroXUHfo1f8vv8uehGkJs1xzbs52vUIdmaT+j5bZJ0a1Z5YrIBM78Q13VB
	lc0zvXJEzR7IYfyRxvZARFb9xySsqmvudOXS8EP6GxGpkAzjA7FbuOtZN9IAuPVtu5irJ2YqVBH
	1pBqSPyZP7bzebdnO7xHljjMG5HaD8ClleI1reCZXHCRtLebo2r+I8ID9B1zhmAmKOYKx0LcTbF
	xUVdiup7Twg9G7lsJwOqdsnHYFcVUlhbp/DP94iz8ZfvQ==
X-Received: by 2002:a17:90b:4fcf:b0:36d:ae6a:22ed with SMTP id 98e67ed59e1d1-36e310ff0bdmr6115504a91.22.1780535162396;
        Wed, 03 Jun 2026 18:06:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e6d169abdsm2366747a91.0.2026.06.03.18.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:06:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] watchdog: sama5d4: fix shared IRQ and hardcoded timeout issues
Date: Wed,  3 Jun 2026 18:05:41 -0700
Message-ID: <20260604010542.23177-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604010542.23177-1-rosenp@gmail.com>
References: <20260604010542.23177-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_180603_278093_5169AD0F 
X-CRM114-Status: GOOD (  18.56  )
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
   devices.  Drop IRQF_SHARED to avoid the documented unsafe interaction
   where IRQF_NO_SUSPEND keeps the line enabled during suspend while
   other sharing devices may be powered down.

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
 drivers/watchdog/sama5d4_wdt.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index 704b786cc2ec..b7a8cfed335d 100644
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
@@ -289,8 +290,8 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 
 	if (wdt->need_irq) {
 		ret = devm_request_irq(dev, irq, sama5d4_wdt_irq_handler,
-				       IRQF_SHARED | IRQF_IRQPOLL |
-				       IRQF_NO_SUSPEND, pdev->name, pdev);
+				       IRQF_IRQPOLL | IRQF_NO_SUSPEND,
+				       pdev->name, pdev);
 		if (ret) {
 			dev_err(dev, "cannot register interrupt handler\n");
 			return ret;
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


