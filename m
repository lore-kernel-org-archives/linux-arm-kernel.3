Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBD8C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Oni6Z/lHvJDm4dC2qfnAqvwTkcCLV7N0fQ4hIhJQyc=; b=Yy93ZMsxi4/RaEQVksmU9vzUmg
	GX1llHjSD3dVcb+/b8hsOwL6O49P7vzDLTUJA/jjGcEXmIbrLrWkQ+Qt1fUIspmoTv0FR1I6Tjv/u
	wO4PgeyFD1GCho9zFcN3V5BOPJnn8usqsdycyF4VeBq9j1GKOzqKnsOQUn12T9TsFaSqF3fl7FkZC
	WpBw1li3/EBJJFzrGly67aE+QQrcDERAEuDQp1MAwe8asnNSr7PPyIE3gsE8c/KxKWGdc3cv2rKZD
	VWsdyIzI3UhHqsg+azd3sKqlrw1BTxQpcmAtZlYUOUsHroEik3eAlSCMdObvdxIjQ6NurTnYJDYAj
	TRwO3ovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Wm0-0000000Fn2k-20n6;
	Sun, 06 Apr 2025 20:39:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WiR-0000000FmiZ-2KD3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 20:35:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso3853985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 13:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743971738; x=1744576538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Oni6Z/lHvJDm4dC2qfnAqvwTkcCLV7N0fQ4hIhJQyc=;
        b=CzPVbSoKV7eGP/pr2T9OkS7LhVAR4slDhz3UkSPQKto9zNrWJzZJy000K5T/szCmny
         vvpOWlT6De8iXMUbuhf0TKo8LHkSUJQt/gGkRfzQUIA8+VsvxoDxDT8iYZ/zEBwOkfQO
         ZVFZ/4x+hKrlUIDqJq1kZaY3A+0Jp+o3nUz+uE4KyUYTe5oKhNoqGRSlXtXKldAcdX4d
         xJfnLb2oBi0PrIQw/lp2FAQpoU4bLd8gKrCJIe8QxVbXqeSsd5eFCzv+m9IL8kmgQGwr
         RhPdcRNTwURWBzJaacoXopjtXxwCRbdchpqLWjB6bPqkmTmf/Mi9RxPoCetbV7RARZUg
         kWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971738; x=1744576538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Oni6Z/lHvJDm4dC2qfnAqvwTkcCLV7N0fQ4hIhJQyc=;
        b=GdZlB6gurhf+AxdqIVPt7TPeFCdOz/apc8eA29WfnLi1Rm1jZvux5W/JhWRv4yA1SF
         /qJLWGWrBe2W2RhJbDHqheiMGMNhlnr7jGEfg7COKh8pNHVQWNahiwPvC5V7Ydd/QPkI
         aBrB/aIF3PiySn1A3VlJBaV1zyCLveLPDETjbFaUoOQsobTb5fIhSuHbgmk04UbOiLij
         nKPJl/rAVNvqtKknGFVyYu/WNrHGK9oWI1hCAAwns7RhUKAlTtbKgKZfzs0zKk+cTSlR
         1/gUbIm1W5TFqH/7JUltuCvqeoF/iq1Q46fjFitLhmUi7Mrn84p7a2+OeWR1dpJRjqAZ
         GxGg==
X-Forwarded-Encrypted: i=1; AJvYcCXsGJ8rJjHLmJ9weMreUOLH3aoiDz1blJuE8FB7JGtS0WX9s+aXS/xjLNlInzCMQPdHANKtUflXKZ8pcj6FMm4a@lists.infradead.org
X-Gm-Message-State: AOJu0YymkEqV+jQqWxL3ouZjVig0hlD0WBXEpXyQBbplh6kS6lB58i7+
	oqhEHZnGg6fFHEHrl8pEb6Hvo9cMUWorF00f8MarzkHa7CqkxNmd5GA5jVHjGyM=
X-Gm-Gg: ASbGncsTQ2S/w/XC5b5kNG7zSpFxkB+Zwy2Lt8OG7wWX+ONGzLc0n561d/MY9sMsAzA
	wmC+vKfA62fRTTbBnIDzkHq+M+a8Z9h6cLchNNBorgYJv0rZXC3eWvJ1bhKmDg2tlk5A825uEvj
	bcJbnH8ALFT4pwyF9A1ccObcvyqC15+OYY1FQW97BZecFv4OEsIgQaAzCsJ4pt16t16CDZmNF8U
	3XCmWxxTKwn91gxgQBQcVkCoiCmH5m6RUM2N80XwfbWjDcP79ZmAgbIq1Cl9UOjFHhaAPtOUare
	O409ZQWQhsMiPcZKXGPI7wyAsy6O+OnYSrmXuBTb2RlWUdvBw338hQ==
X-Google-Smtp-Source: AGHT+IFdkV0qo7M6MnBRCoiFVbhYiS1XD9xft1NUY735rauYmXbOkSn8HVSEp3wFfmum1Z3fJ/qIqQ==
X-Received: by 2002:a5d:59ac:0:b0:391:2a9a:47a6 with SMTP id ffacd0b85a97d-39cb3595265mr3095383f8f.4.1743971737746;
        Sun, 06 Apr 2025 13:35:37 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d7c6d838bsm38022f8f.69.2025.04.06.13.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:35:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] watchdog: Correct kerneldoc warnings
Date: Sun,  6 Apr 2025 22:35:31 +0200
Message-ID: <20250406203531.61322-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
References: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_133539_595813_7F33766A 
X-CRM114-Status: GOOD (  14.81  )
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

Correct kerneldoc syntax or drop kerneldoc entirely for function
comments not being kerneldoc to fix warnings like:

  pretimeout_noop.c:19: warning: Function parameter or struct member 'wdd' not described in 'pretimeout_noop'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/watchdog/pcwd_usb.c         | 6 +++---
 drivers/watchdog/pretimeout_noop.c  | 2 +-
 drivers/watchdog/pretimeout_panic.c | 2 +-
 drivers/watchdog/wdt_pci.c          | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
index 132699e2f247..b636650b714b 100644
--- a/drivers/watchdog/pcwd_usb.c
+++ b/drivers/watchdog/pcwd_usb.c
@@ -579,7 +579,7 @@ static struct notifier_block usb_pcwd_notifier = {
 	.notifier_call =	usb_pcwd_notify_sys,
 };
 
-/**
+/*
  *	usb_pcwd_delete
  */
 static inline void usb_pcwd_delete(struct usb_pcwd_private *usb_pcwd)
@@ -590,7 +590,7 @@ static inline void usb_pcwd_delete(struct usb_pcwd_private *usb_pcwd)
 	kfree(usb_pcwd);
 }
 
-/**
+/*
  *	usb_pcwd_probe
  *
  *	Called by the usb core when a new device is connected that it thinks
@@ -758,7 +758,7 @@ static int usb_pcwd_probe(struct usb_interface *interface,
 }
 
 
-/**
+/*
  *	usb_pcwd_disconnect
  *
  *	Called by the usb core when the device is removed from the system.
diff --git a/drivers/watchdog/pretimeout_noop.c b/drivers/watchdog/pretimeout_noop.c
index 4799551dd784..74ec02b9ffca 100644
--- a/drivers/watchdog/pretimeout_noop.c
+++ b/drivers/watchdog/pretimeout_noop.c
@@ -11,7 +11,7 @@
 
 /**
  * pretimeout_noop - No operation on watchdog pretimeout event
- * @wdd - watchdog_device
+ * @wdd: watchdog_device
  *
  * This function prints a message about pretimeout to kernel log.
  */
diff --git a/drivers/watchdog/pretimeout_panic.c b/drivers/watchdog/pretimeout_panic.c
index 2cc3c41d2be5..8c3ac674dc45 100644
--- a/drivers/watchdog/pretimeout_panic.c
+++ b/drivers/watchdog/pretimeout_panic.c
@@ -11,7 +11,7 @@
 
 /**
  * pretimeout_panic - Panic on watchdog pretimeout event
- * @wdd - watchdog_device
+ * @wdd: watchdog_device
  *
  * Panic, watchdog has not been fed till pretimeout event.
  */
diff --git a/drivers/watchdog/wdt_pci.c b/drivers/watchdog/wdt_pci.c
index dc5f29560e9b..3918a600f2a0 100644
--- a/drivers/watchdog/wdt_pci.c
+++ b/drivers/watchdog/wdt_pci.c
@@ -264,7 +264,7 @@ static int wdtpci_get_status(int *status)
 	return 0;
 }
 
-/**
+/*
  *	wdtpci_get_temperature:
  *
  *	Reports the temperature in degrees Fahrenheit. The API is in
-- 
2.45.2


