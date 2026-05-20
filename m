Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01111CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qmEE7iNYWBNham++FnbyMc6zEayeEgsCBZ4p5g6XN5M=; b=0knD3+we59B50GCJgrXgNILfyn
	WEadZx0DUrSKsW6ruCjCJKomSz6Rd5jf/5aRGlnqdmg8lDLgaVD8q8Twc7i8aL9SuWad8KZfXgaEv
	OnP28sb6MVjTvwiJTaM7WivVZXr1514+JBC4R6KA3UoeFZoaEHH770mrE7OBW6SqNMblGaD8j6AoZ
	4jyYA6gWCwpTjgaojA/kIghMfCmJ6jr70K8mA2YeHO34k27vBTrRGJT1jNSq2jvvMqP9tErZuXBJD
	1awucaIALq5+8Og4Y2nf6VRIym8Vd7XlG7W827MeWC7I/eskOv3naOqErZ1cezJoiZAqoTQfEDoR5
	JfGbbn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoRK-00000005qRV-0Xm3;
	Wed, 20 May 2026 21:26:54 +0000
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoRI-00000005qQd-1A8Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 21:26:53 +0000
Received: by mail-dy1-x1344.google.com with SMTP id 5a478bee46e88-2f3c623322bso4130783eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 14:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779312411; x=1779917211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmEE7iNYWBNham++FnbyMc6zEayeEgsCBZ4p5g6XN5M=;
        b=sL3VqIDEsFu64yWzKA88E9ivNFjZtltMOsgZXYC8Z54UvqfAFWfPNrZLoeJiRs4f+P
         W4bEM1aAmnl+E414jk9g4Ct6n1iZN/3SfIKeTlnchYjPKWMtBX+Gd6X+kU73d1+8ww3r
         GmwHmiYERTNitwawXqSJKWh5XhZtJybTNgI0YNsfdBbweGoHBG4vIs0oVb8J3xYi7XMU
         cA8XWqTgWO3+3F1o8KoWi9DAhA9wRtzO4KvYgiiXHZjt0X9xnwHadMr2jWqpYpTlJatG
         fvvKzPgUBG7I7vvAP5T8nkUCfznFvdU4oUUL40t+FrgzdTGtH5xG6MCDs5v6RpFcw00R
         B/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779312411; x=1779917211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmEE7iNYWBNham++FnbyMc6zEayeEgsCBZ4p5g6XN5M=;
        b=ak2+R0L3mOB2/TuKtp8+nDogLHflYfg8qD3izdm3bI0J69s+O9hWMAC8FR1h3X7TLX
         AVZYAXa1azuJtgT/MpsEMrhNRe7ekTalwST6yMGVfhg2xvzXWVkXorPT0+35kS4w6iZo
         lwD143iPaITnb0t7nuKH0MWD6cEXP3V9Jgiq5yLGXMEPcwD5ePpEKqqJyGjbI1Mfy2aY
         B2aLbFSEio1CB5yP8n/ogaIpMSgmGSfWu4SVE8niH08W5aOb4TkZzzLpl0EW1WZ/BkO1
         bFeZ7Z/2/4lrwsibmBm3qbROHtCW1LQYJykgJxEeRxxs4fF+ntPrcLQ3RyP7FuT7jlJO
         kqUw==
X-Gm-Message-State: AOJu0YzlPgK/sJrb4dBhyrtxgiFi1K6UiEJJuyoQihTfgXTk1Cv/nXJ0
	SkC6PSwG6qiVB5oetdknIAziP7XJUT7qldfv4crQ1gpT2GJqeYg8bN1qiSNDWNmo06Y=
X-Gm-Gg: Acq92OEhb1hCEf6aTehBCqzcVRF4fiLS1YpyIJdaigxDuwUwdMjAHA3Mn2arh9giPWN
	tcYcMFKXYAfzETBX9K0OUVghz976TWe4T2gZOGLOYX3P2J4MHJYVhWsROKb5om6bZJPXqkBwZhw
	olhB8Qr/9CWTfFJUX/LCcfIeCbZP0oOtz/R1rHw+qYykcWJ+egW6G8SpB/E9KjvRdIOnBI9+oJ5
	UWuI2Kzy3D7uSlJqCYBPyUDOPwMZ0aPoKHBRct70Os6hxcFVwxfol7VefMcj5tLlquPaEjubVEh
	CGVHLSFK4+o1+rhoTFgG8XWlNDNlU+3brewzmLZZLSupy+hZf9y7I1x22tCqkWkaZwpgtgm5wsH
	TeTNpRSju8iFeloAQvC9BMhRExv7pByu/MAeyhYene+7q0sGUIRX/K9fTmVnZSx9sVtPVzVOSHH
	n+rqsS1JOpiQ7ufG1hhaSqPLOb9oA3hhBR7rzFTawbi43y6EcYrw2ilVSyy6QAmplMnae1TGYcM
	2gxOb7MS8BeLIi4NZRPDvej1MEdPAg2kOBA739JKswz0JTz4wnRNJOBpGvSkAIiyjtoeZMjUPEK
	5qC6XK3uvVlwlLYhfSFMV1VdhDB1
X-Received: by 2002:a05:7300:2316:b0:2ea:ed3e:13b7 with SMTP id 5a478bee46e88-3042f5c8adbmr207252eec.7.1779312411351;
        Wed, 20 May 2026 14:26:51 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30428d4ede2sm1024485eec.6.2026.05.20.14.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 14:26:51 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: footbridge: remove redundant checks for CONFIG_NEW_LEDS
Date: Wed, 20 May 2026 14:26:06 -0700
Message-ID: <20260520212607.21216-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_142652_315919_35503EC9 
X-CRM114-Status: GOOD (  13.33  )
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

Code in mach-footbridge checks for both CONFIG_NEW_LEDS and
CONFIG_LEDS_CLASS. CONFIG_LEDS_CLASS depends on CONFIG_NEW_LEDS, and
therefore checking for both is unnecessary. Remove the checks for
CONFIG_NEW_LEDS.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/mach-footbridge/ebsa285.c      | 2 +-
 arch/arm/mach-footbridge/netwinder-hw.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-footbridge/ebsa285.c b/arch/arm/mach-footbridge/ebsa285.c
index a65554b1c1d8..2e23c35a4f28 100644
--- a/arch/arm/mach-footbridge/ebsa285.c
+++ b/arch/arm/mach-footbridge/ebsa285.c
@@ -19,7 +19,7 @@
 #include "common.h"
 
 /* LEDs */
-#if defined(CONFIG_NEW_LEDS) && defined(CONFIG_LEDS_CLASS)
+#ifdef CONFIG_LEDS_CLASS
 #define XBUS_AMBER_L	BIT(0)
 #define XBUS_GREEN_L	BIT(1)
 #define XBUS_RED_L	BIT(2)
diff --git a/arch/arm/mach-footbridge/netwinder-hw.c b/arch/arm/mach-footbridge/netwinder-hw.c
index a33f4c3b9505..14989d557ebf 100644
--- a/arch/arm/mach-footbridge/netwinder-hw.c
+++ b/arch/arm/mach-footbridge/netwinder-hw.c
@@ -701,7 +701,7 @@ static void netwinder_restart(enum reboot_mode mode, const char *cmd)
 }
 
 /* LEDs */
-#if defined(CONFIG_NEW_LEDS) && defined(CONFIG_LEDS_CLASS)
+#ifdef CONFIG_LEDS_CLASS
 struct netwinder_led {
 	struct led_classdev     cdev;
 	u8                      mask;
-- 
2.43.0


