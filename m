Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DC2D5B840
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 01:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F22qCHP6afNbcrGoAQJ3oBUeXfRzjwgHNZ47hyoRqrs=; b=iaSOCwkkABHgLTPlewsFVqUGpp
	KWBEZgzk+jzOjPP6u4sizrgmlQMwnKTqBd4JMeUy98wnVyxdfkDGYFt6NGlNeFIwTt/KLRmBvF0eh
	+nVmKtXPE8peDdqiomE6KZRMLq7/xFGwbCMLKnAf2OhxLeCnxiFtL1XrsCVY9Wr0iM3bO+8d5h70W
	FLU2mo5nY/SOpPbWQbu/txmrNlrOon/h9VCiSm1VU2p2ditb3Obk53pmXa6IheL0bE91kxtxTLevZ
	A5OA5XuMCa/mjy10CZAWa81FG4q6WdVL+1UYGDGjBSeD8b34AslVsQyman1VYV0zOGLnCUhDqAHLK
	8mS7fp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5b9b-0000000CsIH-3dBm;
	Tue, 29 Oct 2024 01:36:15 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5b4w-0000000CrZh-0Byk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 01:31:27 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71e49ef3bb9so3405162b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 18:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730165485; x=1730770285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F22qCHP6afNbcrGoAQJ3oBUeXfRzjwgHNZ47hyoRqrs=;
        b=l9/TCq2qqTNNdL5x6MlvaRSjApyngrsVpG4dC+BhOZMZQci3Lg0ZMfeaoCtLPDb5zK
         ETvCP0Yd0XaK8sKcU7mYs/IxW3H9mQgAe3kvDF4jqtj0dX070YdI3FJV+RexAjC1qMOZ
         BhFPMP0ljk5XLQPlqQLN7SC/uY0K4DgwpaDBiOYPE72vbrrQeXd2PFFUtTL/K8B+FI9P
         MrMXXyrb1LXqS+enoRpGdK+e4VDdZibCvH7lWRa++qCKADAmOLigBA7EKIrjj7vdskYU
         x2BLcA8X2MIXRjWuL3NW8cuheoqUHqEjJ4Ez0/ObINJgBe+wEGeUkIl9wCJroZBmfbMl
         QBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730165485; x=1730770285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F22qCHP6afNbcrGoAQJ3oBUeXfRzjwgHNZ47hyoRqrs=;
        b=Kbv1087fs9lFno9voHUyEU1CKlHuHGSE4dyphLBWzBkkWseV/X0Vy2LwEsmls0u9Gq
         Xo9DscpE87XQsL/WOv28WMNS5TYf03+woH+EgJgaUtiQvBJJYB5IlG/mj400434UmNtC
         Hb0fwEErK+m/yqYJ3qnmbE0VBteYSFxPDvtbSjuvJYRKr2mrkKD4v3GQcKzvsULtGlyq
         ODGDomsXiUKkdCxKogs+ltAuqcEdm5DuaKBfO/wMsQsd8r9fSXdmzNXosxazmLy206w/
         tTgq9oek6yypewtJ0SifHEVOb61QH315MGzYZfMQmcoEO9OFQbPWr/ni/gl+A2/Myf1x
         Cj9g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1Vb/+FEb5Nfmq+EtlspKZMR4w51rkusqmiaSyBvthGSVPNvtjHKzmsdmN1ulYiiK2KLS8jxP07VLvWYY5tYf@lists.infradead.org
X-Gm-Message-State: AOJu0YxUYv4DzxKTDLe1TVdieW86zIV2BXpw1IXSTwJ92b0JvlM/nEbh
	eJKmGjij1Z6ZfpO5SqIVY/mAmh+vWekHcFu0KU2HIWqebfaroe7j
X-Google-Smtp-Source: AGHT+IGyIb7Q8egCdWVoHzLFh6oz2bKRaVNI9AS0F5sLQSVgIeGhhVlP3LwlcUK0ZiaVTtFh86x4rw==
X-Received: by 2002:a05:6a00:741e:b0:71e:66e6:ca17 with SMTP id d2e1a72fcca58-720967cfbe7mr578632b3a.9.1730165484691;
        Mon, 28 Oct 2024 18:31:24 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7205791e564sm6686529b3a.17.2024.10.28.18.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:31:23 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 RESEND 2/2] watchdog: apple: Increase reset delay to 150ms
Date: Tue, 29 Oct 2024 09:29:18 +0800
Message-ID: <20241029013055.45538-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029013055.45538-1-towinchenmi@gmail.com>
References: <20241029013055.45538-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_183126_168455_EE72C459 
X-CRM114-Status: GOOD (  14.30  )
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

The Apple A8X SoC seems to be slowest at resetting, taking up to around
125ms to reset. Wait 150ms to be safe here.

Reviewed-by: Sven Peter <sven@svenpeter.dev>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/watchdog/apple_wdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index 62dabf223d90..95d9e37df41c 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -127,11 +127,11 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
 	/*
 	 * Flush writes and then wait for the SoC to reset. Even though the
 	 * reset is queued almost immediately experiments have shown that it
-	 * can take up to ~20-25ms until the SoC is actually reset. Just wait
-	 * 50ms here to be safe.
+	 * can take up to ~120-125ms until the SoC is actually reset. Just
+	 * wait 150ms here to be safe.
 	 */
 	(void)readl(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
-	mdelay(50);
+	mdelay(150);
 
 	return 0;
 }
-- 
2.47.0


