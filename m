Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C477C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6u3ojM9oHoVngZ+zSXriBOwUU5fx5CwXrZHQTSmA34Q=; b=Q7Foxww+UkBpXfxNWpCyODyoKR
	5QeIdCJoRd/lzV+fLUECU4LOfy3VWErKELKtHG5Vt3w8Q4+jYXPecLmXk6u+fSf4kLlrG78P0v+S5
	NtjEDvH6pAn8pV21ziwYsd8zITiZVFrjvR+zcT6+ni18Iy+Ov84yji2MKOUNdhfqyX+raR304pqZU
	CErX4yHJk5XAd8p/x+bChWdX5xSC32sHt4+HNKzIgBY3fmu3ViyQukN9Y1G3xPlwtgKz5xlC9N8mn
	AwV1B1pFh1fTHW8X2l6yL3CObRvTBzq0sb8glJi1O5ilk+Ztl1EF0/JGA2b9gtI3Yy5fCCHhwo31t
	oxwe5KtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiu7a-0000000Eism-1p1r;
	Fri, 14 Feb 2025 11:44:38 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tito0-0000000Ef6Q-1kLV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:24:25 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab7cc0c1a37so359097666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 03:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739532262; x=1740137062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6u3ojM9oHoVngZ+zSXriBOwUU5fx5CwXrZHQTSmA34Q=;
        b=iV2WyXUHFB4RsCGMXXOvflmYzJpTiNNgzvQ1f7t64jRkItLH67cHEvhuS4eUrn9jyf
         2PxzyTxKQqy/cemC5ABEwxIW809tMZqR1ileas3me/pjjYpZbhaumJPlIf0u5iePOdCl
         CFYu0zvkpQ7dmOtAzbYuCqoLF5ZyhWcAeZRmg/8R/+Zii/RoYiYsJkSkdDdY75C2fdYX
         uvrdAeu9QnBAbJqQR7WEHK/+78fXlMmbNFd1iCD99J5xVyx4DpsSM4w++b5rt4KvVHnT
         nqEQ70VCnzhgIwZms6Pahmgl6H01UGgdPNRzlTvn4A9Bj/uJqg/+MQDeKfliAUl1rdrp
         2+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532262; x=1740137062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6u3ojM9oHoVngZ+zSXriBOwUU5fx5CwXrZHQTSmA34Q=;
        b=C3lgMyJGQ4AtOYiXSXDjRXzcFABu5BK0S3VFTlP3KwWYkBOXEZxY/rQxbO+dK5oyxN
         m8g+/upQILbQ/FuNhxQxibhNwGh+5kEc4TVd9n8sj1PY39VRwaDqDvWgvDDLYfg7fai0
         MpQOrL5hmjODbK6yVYpUqganc37b9z6Puh9c9pnYMhzHLDj8gYLUfBZUeTz2+zCfAhpT
         e64kTnd0eT3oNLGwm+8HCe70sH6MuGBgcsdR4TcCyLV7ESsLzeNSxi6Uj+Ma20gMj+ot
         Bn1ur1PUoq/H9MnziirNO3ATaS2QX7lTlvonC5x8Gtf1iDuzSZNcoSAzO9taEO4/SGGk
         n5zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm8buxenYdnCx/9rz89tEQlNjSLTTz7mJx76XIuS+n/44JTHEC2pZF0qaf71v+Da+OQNsIA8hMjGjx5y4WzrpV@lists.infradead.org
X-Gm-Message-State: AOJu0YzFhoI8jMHPoJ0sEuCeOqE5d+6bR5OweT2lOMNZ8+vps05blX1b
	6C/ecA8zHyIR0oZD0tSXrCcRJIkTsu9UVp9Zjaknc3nPUlh2xWhf
X-Gm-Gg: ASbGnctRjCMuSPB5CZxv1OnVxRUJSw84K/trw8Jfd5WZG8eFToJdFZJ/mK1Kg168mpb
	/Gqya9XTNO72Z8kBcE2A0VrSGoD3hdT15KtOwQbVSf+5EFfvKcO1cMwcEYJ9nCSMx8ff4/pHdel
	Lwun10xX9LTa2RMawisjyIIM+JP/4sCMo6AOtPQGhm4Nd2KVs5PUj+cDrof/73gSxFZGzwdJ1Ks
	YQew6oYf8DprT790Sur1d81HSMkZ8NLmKIaZF8UAkAFnvyXj41YoaRZCgDALnPiIgK93kGZyBlc
	rCvFV3Ram9Fwf2cqUpt2/YVUTLquCao9+wIyZHPNLPvvN89KYcwA
X-Google-Smtp-Source: AGHT+IFpCUYSVYlZScFUUmsS8KG3/PYr/ve7XBNh3XUSHixfrU5ppZNMRkZVtyg8SPqunh8IFSJGsg==
X-Received: by 2002:a17:906:3283:b0:aba:a81c:f972 with SMTP id a640c23a62f3a-abaa81cfcbamr61349666b.17.1739532261556;
        Fri, 14 Feb 2025 03:24:21 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532594a0sm329434266b.68.2025.02.14.03.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:24:21 -0800 (PST)
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
Subject: [PATCH v2] watchdog: sunxi_wdt: Allow watchdog to remain enabled after probe
Date: Fri, 14 Feb 2025 12:22:54 +0100
Message-Id: <20250214112255.97099-2-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214112255.97099-1-regis.dargent@gmail.com>
References: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
 <20250214112255.97099-1-regis.dargent@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_032424_463801_FDE1F9F7 
X-CRM114-Status: GOOD (  17.28  )
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
---
 drivers/watchdog/sunxi_wdt.c | 48 +++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b85354a99582..0094bcd063c5 100644
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
+	for (i = 0; ((i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] != reg)); i++)
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
@@ -192,11 +219,22 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static bool sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
+{
+	u32 reg;
+	void __iomem *wdt_base = wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = wdt->wdt_regs;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	return !!(reg & WDT_MODE_EN);
+}
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
 			  WDIOF_KEEPALIVEPING |
-			  WDIOF_MAGICCLOSE,
+			  WDIOF_MAGICCLOSE |
+			  WDIOF_SETTIMEOUT,
 };
 
 static const struct watchdog_ops sunxi_wdt_ops = {
@@ -275,8 +313,12 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
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


