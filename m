Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A026CD8CAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 07:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EZxhU2iD6PdOyojyjLvdXFMxCVOPuNzGVXqMgxsvNpE=; b=ZFGvtEilCnDrfN301ld9SZgM7y
	5DxzLuNFACRf9RWzLpmLsB0bM8nQxY9GYd+PGVrwTaWLPUkCKiHS6thYRQQBXTWRcQjtyr4Yw7Uyd
	FIzv/i1wvUWowMoCXHww/XIIkVRKWSGRFT2dtpCmq1r2kb5LbBxWLRHUXWJZmEu1QKVsIQUzjqpfX
	A5+CmCotTIMUdXfynnbxbkdYTuY0dqyFdw5nsuegePf7zhg7iHAfU9MoyBhUmSSyQbvgfwT1P9a6v
	TQ0kNcYLdYsfH346oih8gnlaI77EziIMof3RBnRKKdEsHKp8aUA1kkkd6PgxDv5nJ5NnqtugtaQoN
	dpNaA+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqxf-00000004yOI-0HwY;
	Tue, 09 Jun 2026 07:33:23 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqxc-00000004yNH-1dxv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 07:33:21 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84275887a3fso3856952b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 00:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780990400; x=1781595200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZxhU2iD6PdOyojyjLvdXFMxCVOPuNzGVXqMgxsvNpE=;
        b=lQ+iFMJ13J1eo9s4cKsnl/x1CNjr8mPaoecNJwz55pSiJVumug4rtFQyX6eeUNxrPi
         61EivPFr6MN/4ATlxhPoTUN2eoR1I27G99W5vQERmJuq7NM+0ODY6NQ7Wc69i3SwdQg6
         jC+CMhqn2dJAOcnGmSP87o2+VdrAgDqZFK1bW0xDIJn9qZfg6WIoNlDOHdAGi1HcgOoJ
         N/mxMmkFVKsqLJTURTWxSkwwe9B8OO15bu3yCSdeKFPA8WJSmDDLsgfwLS/xO97hAekF
         XN96wJvehoTlrItNYVFMXSZsPCdXduWSj3F7byRgh+fuPPeRA6wabUCucpSfSQO2b6Q5
         TnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780990400; x=1781595200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZxhU2iD6PdOyojyjLvdXFMxCVOPuNzGVXqMgxsvNpE=;
        b=mKrBl17mlHBqkCkbJ4Mdh0zTNZTs0gqtC3fj/ZuvJQtOCL7rjhHa53C9DZ4dG9m6Tg
         A4X6Pd5u952vald6XGLSQ63Y05hP9dIzVbHVU+P+hHWVRfd7h1Vuh+Ine6bcFvD2Y660
         7jweUgznsIm5A6v24tV4jsWwx/bzdU4BZV4k7K4pDOT6VMEbHBZtxFmquGn1NjiNox6L
         Cf7pVm/9bWvlTB6+6jWLkeNUgsjha7GQi+yWTW+4JzTGmcICmM/H4NLzYpG9opXSlF2J
         tDgvvt8qvurw6W0p96kLe3VPiC3BDStcUrZlu+kQF9SxajpWnVaQvOJg5mqfoWXsWkz+
         MB3A==
X-Forwarded-Encrypted: i=1; AFNElJ9exp5ZpBsvxPj2tToANCLYxcKZhQq6SZikcrQ/HYu1yrabyrIIxoi1B5fl10MqJO7Y6/hvd8qvx7BvDaPQLvC/@lists.infradead.org
X-Gm-Message-State: AOJu0YwLQnzAABeONLplHrZfLGyCeQh/PX0DVyGU9U1ganowIh8Xsukr
	Hal8xQyEK283wEKNMhg2pTzpswz3HmbaS6NCNYaCzbt8AwiinYPdHTgs
X-Gm-Gg: Acq92OFjMfrgQUW8Z89oZfXGOwCriS3aUXq4WWamFSo2UELvypnsu/jbYxWENG5/BKf
	UaVAFQ7orlF7tKhbVs5nelx8kr1KvLFNden9iZLr5nPBTEzBs10xCVnnQSFteDvN7XBjcqHu6/a
	WZi0l72LliJYAQcd2nEdnw2JkomNeZMm0d5Vg+U6OrYsRf1jXkJV0Xi8YMNfcyjfy86LgHqua4D
	MrhgU7A4J27T3M08dtwsDZlXs8/JYeLvPVx6VYi2aVF97sG84NQgoZ4iVqSk3+xnyMZlwwY0Ozh
	kncpuvUOYv0+lt/fYucxSURPGbhTMNa/zXdKdOtGhieeF67AUkXT0lO6bMI0ceTb1IZ4UmAZLH0
	3fAWVhdvduYQZJi3dzSGZhH+bAqfKPkmfBYbBv6pk8jpCDOmzsfGcWDGFvbLNRMWLjJ08jgarc0
	japu9+fK35g0Ggw7C80YRK8HPniZjqNvoJxGzC6Pn2E60qAYgvOsJ/5g==
X-Received: by 2002:a05:6a21:7a9b:b0:3b2:86a4:acbd with SMTP id adf61e73a8af0-3b4d39ff987mr15436890637.2.1780990399495;
        Tue, 09 Jun 2026 00:33:19 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:37c9:44fa:729b:6aaa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df034a2csm17670712a12.3.2026.06.09.00.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:33:19 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Harini Katakam <harini.katakam@xilinx.com>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] gpio: zynq: fix runtime PM leak on remove
Date: Tue,  9 Jun 2026 15:33:13 +0800
Message-ID: <20260609073313.5-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_003320_431612_088FC5D5 
X-CRM114-Status: GOOD (  11.76  )
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

pm_runtime_get_sync() increments the runtime PM usage counter even when it
returns an error. zynq_gpio_remove() uses it to keep the controller active
while removing the GPIO chip, but never drops the usage counter again.

Balance the get with pm_runtime_put_noidle() after disabling runtime PM.

Fixes: 3242ba117e9b ("gpio: Add driver for Zynq GPIO controller")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/gpio/gpio-zynq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 571e366624d2a..fafca91128b2e 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -1014,6 +1014,7 @@ static void zynq_gpio_remove(struct platform_device *pdev)
 	gpiochip_remove(&gpio->chip);
 	device_set_wakeup_capable(&pdev->dev, 0);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 static struct platform_driver zynq_gpio_driver = {
-- 
2.51.0


