Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F149C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l/jkdfrZ08jX6WcmWMCx0fLw09dF088mHQgwhu4b5Bw=; b=jgoapZWUlsQySbSbCtaK2j7209
	Z1EkDmcSuKgZmq5MjjgMOvYYZOYDTlXHI3CY39enY1lh4l2BPZrCpgEbcy1SvXugUD+5L61JGGyRu
	L6RPmjP50I+WN5vlFYGdoLDAywirHJvSRz2rojMHqPsQ+wW6U1Iq6/0xCaiMU0dRSv/M7LJ3uWN/f
	pdHb39C2OT2rYK5LH2MKgHvgOO4t84Eg0icNfxmf4WDeLfdj0Pl/FG/0ol2YR2W/SZZ5TMs+L+aev
	WOP2rFH8rIahSJsNTpjKLy3qtCsalFssu1nUQzVd3B+e127BsLw0yMRnq3mL4A/7ZhZvN7papBp7x
	F0KjrcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyOm-00000005sQo-1g27;
	Thu, 06 Feb 2025 09:42:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyMa-00000005s2z-0vVW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:40:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4362f61757fso6409225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 01:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738834798; x=1739439598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/jkdfrZ08jX6WcmWMCx0fLw09dF088mHQgwhu4b5Bw=;
        b=nQPmH7A/7403usez8fq/gdidFXXvx7V5KrVPs7bc3fYNRtd3tw3Wj8irfmxyM0vzus
         Xqcru9mcMet2DU+XB1itQgY7vybc3fkhzXqW6yEe3dWLsmkY0UesEvOXRONCDOJMKBqX
         Nzs6pFr4SBZum7hio1RXs85Ib/fYdsSbjUTf0jaQpJ/Z6nTKw1kZojWx4LshP4iDksy4
         5tIqAx+w+8+ceheMbj1Q+h7F+57VFfAE8iOjtyHSL5j3Pz04SUFDKFjP4nUhcvEbyqHh
         pqlKbVgV4m9rXao+22bEXsgIvXf+VoJUhM4XUx4Nw+kXrmdC2ZaMbCJZnoaa6X1xsDt8
         8ZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834798; x=1739439598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/jkdfrZ08jX6WcmWMCx0fLw09dF088mHQgwhu4b5Bw=;
        b=fzW0jszmStFY6Nuqym51JCKrq0s60aphlDAMy4YiYKZBUaGJQo5j00BqxOnSPf1Ggc
         IeWk2OXTOoqiUF9zPyU1KKchiUphJier5NVwYIB96MtCp8JRKSh+0585A9Fs1X9blW9f
         Mq4RyUgmSh0Pg0sLnmrFaNz3QdDnBbrLGELoPeI2Tn+Ftmie7Pw7/U7JOhPCfmp3J4vT
         w5gZ9NELZMBvZ608G5MigKELEt5UoemDXEYi79EDjdmtevYCAHxZHvmCUbCH0KesLsKZ
         wueSgi/AImfY8qDg0b411u8Ra0U+uKulGZBFOv5Fk1BUmVxcDfmW2Sd2/FSKfVPXA62/
         lDvg==
X-Gm-Message-State: AOJu0YyCNxYIg78t7mNknrrd1TcJGr3gxDB8vh047ocby2wkuy19LucC
	b+G1T3iUJsvFRhTUUQF4eIQASMmC20gCxd45RdID76wLBU7TvujDpVvZhfxS
X-Gm-Gg: ASbGncvQ+yP3a6Qujj8NDDQjCuAPMHetxwwaV0TUsMvR/46Pgh9jDykxntgH1K0r/iW
	c8g6FBMwAArvpvY7MY86B2NObx+CZ+1izpMt01ew5lEimvLtlEdbFSvCdkJjMb3Q2qprVdJqu5k
	5X3Lnqs3aGdY4WyKG74NOPJKMfV0RuZwRgWfgulNhiBUMZzkPRUGmsIQHFfij4e8W8N/QzjaziU
	lp3KywpURHH3eAAo8Pw+q00NEqKj4NBeDDw+bwmLxZTzVBGUiA4pdk3ALNDz9sQiur4m8sv3Ai5
	UuzBJZKFfKGwt+2cYTwf2SFLNbUqjQv0rhELugK10JPDlFd8QaCZ
X-Google-Smtp-Source: AGHT+IGBzVXmnW+V09JM5cj0lj1ejZ6PtsqYBnWfyMAP4lVzXR/2TmoEhoDdYt7Jw/te+/+0sWsibw==
X-Received: by 2002:a05:600c:4754:b0:435:1a2:2633 with SMTP id 5b1f17b1804b1-4390d43da3fmr53984655e9.15.1738834797789;
        Thu, 06 Feb 2025 01:39:57 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db10b17sm48170475e9.34.2025.02.06.01.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:39:57 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH]: watchdog: Allow watchdog to remain enabled after probe
Date: Thu,  6 Feb 2025 10:39:56 +0100
Message-Id: <20250206093956.46593-1-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_014000_258888_F0C3BD5D 
X-CRM114-Status: GOOD (  21.06  )
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

---
The sunxi_wdt watchdog unconditionally stops the watchdog during probe (on my Allwinner H616).

What I want to achieve with this patch is to start the watchdog in the bootloader (either manually or automatically), then boot Linux.
The watchdog is about 16sec timeout maximum, while the full boot to userland lasts about 90sec, and I want the board to reset if, eg.
the rootfs cannot be mounted. So I need the watchdog to be handled by the kernel during boot (which it can do pretty well).

The thing is, the current driver stops the watchdog during probe, so it does not run during boot, and it also does not manages the "status"
field, so the kernel would know that it must handle the HW watchdog.
This avoids automatic reboot in case a problem occurs during boot (and for example handling in the bootloader).

The driver should detect if the HW watchdog is already running during probe and set its appropriate status bit to allow the kernel to handle the watchdog pings itself.
The call to sunxi_wdt_start/stop allows for proper driver and device configuration.
By default, the kernel will then ping the HW watchdog at apropriate frequency, but the user can have it stop after a time with open_timeout parameter.

 drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b85354a99582..20fe7da445ea 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -192,6 +192,16 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static int sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
+{
+	u32 reg;
+	void __iomem *wdt_base = wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = wdt->wdt_regs;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	return (reg & WDT_MODE_EN);
+}
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -268,6 +278,11 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 	sunxi_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;
 	sunxi_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
 	sunxi_wdt->wdt_dev.parent = dev;
+	if (sunxi_wdt_enabled(sunxi_wdt)) {
+		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	} else {
+		clear_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	}
 
 	watchdog_init_timeout(&sunxi_wdt->wdt_dev, timeout, dev);
 	watchdog_set_nowayout(&sunxi_wdt->wdt_dev, nowayout);
@@ -275,7 +290,10 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
 
-	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+	if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
+		sunxi_wdt_start(&sunxi_wdt->wdt_dev);
+	else
+		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
 
 	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
-- 
2.25.1


