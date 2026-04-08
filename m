Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935F0FD5F87
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OejBbrri3d9kPDDrk8EcFHpWkrzAozvlowpTGFN85e8=; b=LnDne821Osnk9wCdEwx/UeHlXd
	huO1sX4i6BZZp2DAQEfGnImFj1ReBICZqhiOlx11Fsfji38g8cdH/HLTNW/0PKj62vP9xCLreE3MN
	ucr0EXTQAHylsabOtYqfoqX/74/LCk0CxWeGjeYtadEoikGbZ6P5C+e7qQpkmBN0R2iUfXSQtdIl8
	NUjkIAbxCqhdTSKdGNhGjp1NT0qvFygJmlTLdqSpRoUyrdR3BFSVnZPhtUWa6yRUGOuzUId5IYoiz
	9TOfaCHr4/kWj2WMxSr3W82EQtGnbGB0PQ2MZDv4PO0kVjO06F7DVWADe6f0z1CtuJ0NEQsqYO7GY
	wgLtdD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAO13-00000008VBY-25W7;
	Wed, 08 Apr 2026 08:12:01 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAO10-00000008VAf-33v4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 08:12:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso39278155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 01:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775635918; x=1776240718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OejBbrri3d9kPDDrk8EcFHpWkrzAozvlowpTGFN85e8=;
        b=mERs6AHicarHwjDsNrDloE0/BOoC9qJB800QWK3jX3OlCeYds9EKSzwptqVl0LTw8E
         FtgbE7tj0ZVbc9C5hfjxk3FhxiAE5MDySVKN2bya+rMLWN+jmaFkRLLRv5p5N9B6bMqD
         BNoGZ6RfRfgNSqhINiLVvSuoL/UyOuJV5YWik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775635918; x=1776240718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OejBbrri3d9kPDDrk8EcFHpWkrzAozvlowpTGFN85e8=;
        b=NVlIFNMGgfkGOVgy0exiT93OOm8CzAaG7c5007tGeGs9m6nW9FEBkLwLhjxqeWv8+B
         ZIoBJ6rIcM7Rmaxm3h8cTfawr8yX9T3zAGmSD3kydykxCAjv4dfTJwEV0Rb+FWoT9rW2
         r6x7F3iDbnXmVFuHx66MA1QZRHVCv4vfv+5WrMFdcuF8tvecLo1g+c3LXqWdyApZFS52
         e17Zg8clY3PFv+ABXokAkUTCT0zqYweVDvA2LSXOyx8iIehjEpzfAbNCOnX9A0yfhZqQ
         Dau+VnlWzECKLgIBCCUbDFdPGzKm/bhvfiYShdcA4CpqKzeCbje+HveM8jCKDtxlbj6N
         rrSA==
X-Forwarded-Encrypted: i=1; AJvYcCVSmtDbpP34MmXRGndzyumDGUANxXZwFbgWvC2GSHKK42VatQDTRqe/i6WP4LR6C6npm9cT49RqqdSoamGBg54C@lists.infradead.org
X-Gm-Message-State: AOJu0YzucX/VWfJNlZiw3rTE/pqduz12yz+R7tki1oMtETZGZbGQ4j2d
	EVpA/dm7E630mq1qyfMG/tvHSnYMzXIwSz5US1jA6Uw0j/lNGAZHbHSzVDWbHzeLxg==
X-Gm-Gg: AeBDiet0502ZjAcmCggEte99/ucZIrTCk0A3f3XS6H0DQ+BU2EbScAyMX/JvdhG+omz
	9Y44qMXOruyeuflGf8dK1lIjkZ9xAhL8a/0wsNa7z8VjEwSCD2hC6WXJHxoy03cufZSgfcK32xk
	lsud+LXnVHLqJ6WyBJl3mD+nOiI8+jZquhMEWkZi2wFlmIURjFRT2n3WTceW3O0maV27ngKw3ps
	apLFIEU7PFfdxjz1Odna4kI3tZlh1jkKIxTh7gX+DjRkXbfprHkYXHWerMu2WBgNha0GFxIgKHF
	Uttw1BR1n2iESnrYxlD5V1oCwkqB+HfXxyaIHhEzO3PfHpHIFqKVoy7EVDGTWoPAGg7J+qOqGWA
	Kg6bKQv7LCM6Cz6ttAgEPRQHu0Sfcd3XNJsnOWpnsqyn9FqAwm6UtX0oks+HdEFWGk1a76Tbjri
	H+J8abIwI8zdBf+oVnEVkpjeqS0HgoFpT0KFvK8RnThkxB2YSyhALA27BoflfzZTLW9YY6V5C2G
	GtQBvLK
X-Received: by 2002:a17:902:e78b:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2b2815b522dmr216420835ad.0.1775635917710;
        Wed, 08 Apr 2026 01:11:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f0e3:c8b2:74ff:70d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbca2sm193388975ad.73.2026.04.08.01.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:11:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: raspberrypi: Change dependency to ARCH_BCM2835 and COMPILE_TEST
Date: Wed,  8 Apr 2026 16:11:49 +0800
Message-ID: <20260408081150.1710717-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_011158_811991_2A620E28 
X-CRM114-Status: GOOD (  14.69  )
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

The Raspberry Pi firmware driver has no compile dependencies on the
BCM2835 mailbox driver. It's just a indirect runtime dependency: the
driver only works on a Raspberry Pi.

Change the dependency from BCM2835_MBOX to ARCH_BCM2835. Also allow
compile tests. This allows drivers that have build time dependencies
on this firmware driver to be compile tested as well.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/firmware/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index bbd2155d8483..f99d27c1f6a4 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -114,7 +114,7 @@ config ISCSI_IBFT
 
 config RASPBERRYPI_FIRMWARE
 	tristate "Raspberry Pi Firmware Driver"
-	depends on BCM2835_MBOX
+	depends on ARCH_BCM2835 || COMPILE_TEST
 	help
 	  This option enables support for communicating with the firmware on the
 	  Raspberry Pi.
-- 
2.53.0.1213.gd9a14994de-goog


