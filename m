Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65ECCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGtfsW0w1WiZlRd5nd/Re/Px8c+YGmOHA/Ir0hFEdro=; b=ETWd5oU2Q8EryxNlGzu2ECAqBD
	7xEw50wvj/IZP2BEuXe4mH0EFO+xGEdiOQiFG7kBG72UtMLYINKxMd9tdyGG40BnjfzLUlc932SpJ
	/by2se9eewB/8EQCg9OX6w7DdPwryX4l2L8LveOpCelVI8IFeg0mk4n+vG8Eo46S3ZWR1Bp45iBqS
	2Mb0L8g4MGMxU7BU/v0CbeMqDWyYP9dHa7HPAqPUmbj1ee95OQU1KnguZgKcQ2g29PiqjsLswNIyy
	N4S31AJF4FZ07w9fl8lWl1koJ9wrksJLXZfrx5o+UM0MxNP9isHnEIuuF1ZExbFODEqkmICavTXrv
	gLKpKgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqkQ-0000000BbYM-1BQg;
	Tue, 26 Aug 2025 10:17:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5D-0000000BQyV-21Cq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45b55ed86b9so18279775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200914; x=1756805714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGtfsW0w1WiZlRd5nd/Re/Px8c+YGmOHA/Ir0hFEdro=;
        b=WlYVylbOn6J5NY14CG2VxBDzJ++uWKUc8I8Mog0Ji3InYJNjwzMTVzxAL8rb1NEyLL
         vFJRgQfHVfCky4IXw02bqFUNucxMF0yx1qAL1PqqUdrnG5O7aTSXom7TPqMbICiXCcnN
         mKjAv3Sa90KnLSJp9YtH8csKXVYtM/If+gLtdDn008fh+pJFOPLXTLDnSaSn99Yz+u+A
         lqMSEDgEwsoW/URBsCUSSte/gBx3Ragc51RxkI8K/6udrZlpA4n3H76m2FKoOH9Ir4iD
         /LMky8SnxBztzWuNMh45xERMf4Ct1mxAxJj0bYzLON+2q6aTwHk/tlMx28Nhu70KDv2+
         c8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200914; x=1756805714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGtfsW0w1WiZlRd5nd/Re/Px8c+YGmOHA/Ir0hFEdro=;
        b=r9GDloElyPSHQ8L1XXncd3EMc7eo/ksGbA7xPLTZmNGFI3UtaJReXY7+Hej+ojSXR2
         mQK1ddlQoEj2rhX2QmrQWwrdu8rlt9xdeiQAibsG9DeFA1yAM5YuYGSJm9/WTFL7pkk5
         2+XdKvON6307EUKgkntpLyDoFvgcftPqw4UvXsHIM4TNup7+VWJPoEtjowEaLSz8ANyf
         tZgR1m6UPIBIV1pfFHswZNmMez2gSX8S58U27qZfSY5Dzbn5ATlqdZoSvQZd3xs9KeD6
         wBl8hSJ4HAL0pFvObB0O5H3m4UywNRkiKZtOzXJf65b+Yc5bGOX1mjK5Vunn0Yf4+z6d
         j+og==
X-Forwarded-Encrypted: i=1; AJvYcCXd8HoKj3xVWS+a/zl98pzi4GJqwTqvziRss8KZBk3b4zSwrXPrUr2mOqUTerSagbpOWKvc9r8ekad1/AbMt7Ub@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6qeRwN7Dt3uimBBWaBIMJ2EapyTTEfrQzuEr51eCsGp83/UTf
	oYkCbZW3S5oGV/YNzyCZX++nklI1WL/sTU406V8K/BTnDmwWiA1YV3NV/9yzthKzX4U=
X-Gm-Gg: ASbGncthOyTVQljV/Ivy/TIv2Hy5/MZap25EHGAnadEDleXLIyHHK4tDXgZxmO4fhMm
	t3cAbg7ga6xa0jFktVd/IeV1sNydRpdp7vi89bo4WQF1pbWUskc8GMLLJIAXu2tMQbOyRfjjHtc
	cL5+XmwNMHRxbZXfEEK9+f/cSvkfnYaVlQJxxr4iQG/K4LlURK2NsAla12GbA2PEDAjZP4G837N
	OVk6iwzlwsjyPmjdeb2cRX36UPDcdIGUdOjatbpfKbuCvc84vZJRNjiLxGYUqgvTuaILu/pSkn1
	2REpj+7zmtBLR6VB8W+flpPDleQkGaqInmErq+HleBep9ikJV9TORx5G4a9VSJCaE1w7IcXYbr0
	B9oDwgmo5+8wr87CA
X-Google-Smtp-Source: AGHT+IFCT8K43FmYf5m1ztIgvX2Fjw+GEW6Ck53Etdpp26KgnKp00bfzhvxPN07C+xOfaCd/tjuJQA==
X-Received: by 2002:a05:6000:43cc:20b0:3c6:aa87:d959 with SMTP id ffacd0b85a97d-3c6aa87dab1mr8425016f8f.26.1756200913910;
        Tue, 26 Aug 2025 02:35:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:03 +0200
Subject: [PATCH 02/12] gpio: mxs: order includes alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-2-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/ZPycHZAJYq+cwPqjcUCTodGjlR5/fbPuBgY495SbXQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/MPuJ13oy7EJTZgd9B5mOUZ3BPJXtY/Ws7Y
 pBLB3iReFSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zAAKCRARpy6gFHHX
 cn8jEADiVhvactMnyVz0TLK/1lSYmKBQ0xCRvjBYVtCD5N/B1mqD/GKrYpGqbIw3KQrvl3LKs8A
 27a7sIyKR6tBNLoCkoHvIY3HtaZKYOs0wPuc5DMAtpCdJef3YJXOVijtKqzvIFxhcjOutGehOEv
 4hwpFsovmfK8YTOTUCr0blyP7zatckLDZsbIHo7WHlvlzAr1Pt53ZvH8Tq1HgiOmL7gVeJ/5UYN
 0GiilKgYrait3IrZKIRDqSfSpCcTOt7IYT3cEpWeKDVFfAm2pjkSpFa4/56RfzakYQ5uTbKT3xa
 jusqrQnLH5sdbPQ3DfbJizcsiy7j7bfQu+n49ak5dE3t1G4wX+BeUmUnI+d8PPm+YRdbhoXEllx
 BW1WnatXpWTjs9wUZ4ykXy6bPYjq1rXiqkoK2Rt8EEZFWcVO2TWSW7vxX0FNpJqPiLkbPX1ab/B
 dL6SxuxnPr462roWGxmp8yHz2Je8M20fwveLsi4Kth9CYuPQLdm3Wx7DLqlbwabVn4av+xuU+ip
 NPM0fLfjeUB41nXy+JOA+JXeoXkBSoJiourNZKsKLtWjKTKuW2nKHLGfGxnZo8+aqYGDXF3C346
 7yUTWG5BrVSV/lJqO7w0fretAVTMEcSorYpsFpSz2wQlii1NbmTe2MnyUgns+uG7Ja+/9ehF912
 y/G7Vqn+VCST8tA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023515_529308_BEF6052D 
X-CRM114-Status: GOOD (  11.69  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For easier maintenance: put includes in alphabetical order.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 0ea46f3d04e128bc8e70941e26c618c0378ab9ae..bf0c97f589c96a5dce37dc140babda5998d5e365 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -7,17 +7,17 @@
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
 #include <linux/err.h>
+#include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio/driver.h>
-#include <linux/module.h>
 
 #define MXS_SET		0x4
 #define MXS_CLR		0x8

-- 
2.48.1


