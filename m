Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02678C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/sg7omSvJw4OhSWVma2ygvtz/i44Mb1jIOoIOn0G+U=; b=BRMx/cBwgi5uk/ADSpDWyMK8xn
	gYz0Mt0Iqod3A5HFIK9X5pRLw0hQ2X8YCh5Z79q8oV/eSbBJAJdShrUWQ8uKi8kABfR6G9DTciOyZ
	MRHR3DNz7jtVVR9b/Xk9u0U7xuabHqXY7bE3mN8SoXd8PLgYfzECuuBVLTawK/QmNaUIk0mD2EfFL
	3TNMXB+hOcJNAQSTrW1+ILYpJdmkEysbN566Nvwse/79/BeCBldvf+ic1xPhvkT0avTS9An1hhpnD
	9lNzVXL4hFcrPnBKYNaYjOt42oU/1fEOIyMbEaAwVJKV6mmx422qrdTWwHAwhvpRUenZAl1PGVKch
	qvUnMPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzq-00000000Jth-3mKr;
	Tue, 25 Feb 2025 16:41:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw3O-0000000HY6Q-48yx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:37:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso35980435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 06:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494217; x=1741099017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/sg7omSvJw4OhSWVma2ygvtz/i44Mb1jIOoIOn0G+U=;
        b=cqm6jMRwFck1Q1e+JCenJfVMsuWEZKD5Ej6kAv0ZddsNvAqS9Fksxpn6aruHIEB8r2
         Q8oaRmRTnySQy43DP5KP0GvIs9+HgtKyCU3lw+S+aQjAYWRT0ja4B3fi6hT5rZhiFwDv
         ybt7qon3oBfEfxbXYXypvd3o8fdaW2bKmcMJN9yQfh4aXUb3kYhquLX9UmqaKeIyHXBI
         +3XUhQ3Uu8YbyyANf+wk7dyXmqUNIr7SfRjASgJrwjq1RD/1PTnTugDJKxp5Ek9SE+dF
         BuAwcT8qfClT4Lrp9Cm1vAuQ+MIPXqLC3gPSpoEPHWg/ymJocPdMUmuwnBsYsyFHEvur
         Xh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494217; x=1741099017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/sg7omSvJw4OhSWVma2ygvtz/i44Mb1jIOoIOn0G+U=;
        b=Gbl+TlpspFS3AcQ47X9A9gF6W5HlAkBpl9Fjw3MRhngv3CPwsKc02hXEp5grkIn8it
         O2+2PfXUp4CzTOFA1UcJZFWeE2q+Q7IIBGTCFYB1wHr5c1IdM+mGNf74okUKOoe97L+0
         Hk0H5ukhGtJLyZI0iIwIXs9k+HMIh2brl+by3jA5foZsn5C6CX2rQwr0yuX4O+Jk8fJ9
         B+s0ndOShLfiR7QCuyDfDQ++kX67t8VpyKv/e8d6vQl17TTJVyEo4ljUxEMUNCfHLvTb
         +Gw9okBTBgEcohGVC//J7W/23OtIy3IiJ3oWpbiqpVbI464cKouMoq5R3iPFYq9/PRy8
         Tbuw==
X-Forwarded-Encrypted: i=1; AJvYcCVOdrG0zgd6sKlALR02tGDSGhgYeiAyrhYIHPQdxR1zkV0koHLgeL3gozvhG3XZy8dPBoaOKmqqDMaCnPd9nYgY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7vCz4LYwXXF5hKBPgd1GL1KRNEWTZrsj+1/6T46aO3TVzHytW
	lkG/vQB2OXZYBq4lxfc9pZwv/x/mp09TD31rAqIqwOK2ATM4n0zD
X-Gm-Gg: ASbGncsYpGb/9X7+OA/0RgnzapIrjdN7ZlNGax8OhQqKiLh5C+XxEMJ7DKHsKS2P8Ck
	AuMMsY+QozPIfB02u8ZOn00SqW/+KtPilwEd6n02zfbvWKKpue6Sf3+pp/T8kD+kZ3oTW3xwcuM
	18T6zcrVcMgGmVy5iKWDxVXz/cmgf45qC+PviUphyPAixbO6vsgwJ/lVy6JAjseQ1OsvOjiRnnx
	YzOXUlZuC/d8b6Ty+lhuRq3O6TeW+zIwwn8afYyRGFX+pTXKz765znvxcN3wWlvxxZnGXSns+W6
	6Dgfzt0hIxBi35rNsi2jtj6HG8p2yhAq6VkiwDISXl4KJPaV23uXOP/Xy3ztRUg=
X-Google-Smtp-Source: AGHT+IFPeiOcFGyA9KgALMCP8R9zH2itjkDt9MTElBJ+IdcbxwJLf0w1wOrioUPVxCe8w88V34Lxxg==
X-Received: by 2002:a05:600c:3b1e:b0:439:9698:d703 with SMTP id 5b1f17b1804b1-439ae212960mr145877145e9.23.1740494217035;
        Tue, 25 Feb 2025 06:36:57 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8829cesm2474493f8f.49.2025.02.25.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:36:56 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: 
Cc: Regis Dargent <regis.dargent@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] watchdog: sunxi_wdt: Allow watchdog to remain enabled after probe
Date: Tue, 25 Feb 2025 15:36:38 +0100
Message-Id: <20250225143638.1989755-2-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250225143638.1989755-1-regis.dargent@gmail.com>
References: <20250225143638.1989755-1-regis.dargent@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063659_028399_0CDACFAD 
X-CRM114-Status: GOOD (  17.58  )
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

If the watchdog is already running during probe, let it run on, read its
configured timeout, and set its status so that it is correctly handled by the
kernel.

Signed-off-by: Regis Dargent <regis.dargent@gmail.com>

--

Changelog v1..v2:
- add sunxi_wdt_read_timeout function
- add signed-off-by tag

Changelog v2..v3:
- WDIOF_SETTIMEOUT was set twice, and other code cleanup
---
 drivers/watchdog/sunxi_wdt.c | 45 ++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b85354a99582..d509dbcb77ce 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -140,6 +140,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
 		timeout++;
 
 	sunxi_wdt->wdt_dev.timeout = timeout;
+	sunxi_wdt->wdt_dev.max_hw_heartbeat_ms = 0;
 
 	reg = readl(wdt_base + regs->wdt_mode);
 	reg &= ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
@@ -152,6 +153,32 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	return 0;
 }
 
+static int sunxi_wdt_read_timeout(struct watchdog_device *wdt_dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
+	void __iomem *wdt_base = sunxi_wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
+	int i;
+	u32 reg;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	reg >>= regs->wdt_timeout_shift;
+	reg &= WDT_TIMEOUT_MASK;
+
+	/* Start at 0 which actually means 0.5s */
+	for (i = 0; (i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] != reg); i++)
+		;
+	if (i == 0) {
+		wdt_dev->timeout = 1;
+		wdt_dev->max_hw_heartbeat_ms = 500;
+	} else {
+		wdt_dev->timeout = i;
+		wdt_dev->max_hw_heartbeat_ms = 0;
+	}
+
+	return 0;
+}
+
 static int sunxi_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
@@ -192,6 +219,16 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static bool sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
+{
+	void __iomem *wdt_base = wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = wdt->wdt_regs;
+	u32 reg;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	return !!(reg & WDT_MODE_EN);
+}
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -275,8 +312,12 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
 
-	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
-
+	if (sunxi_wdt_enabled(sunxi_wdt)) {
+		sunxi_wdt_read_timeout(&sunxi_wdt->wdt_dev);
+		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	} else {
+		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+	}
 	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
 	if (unlikely(err))
-- 
2.25.1


