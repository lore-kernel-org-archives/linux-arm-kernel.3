Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39433E9E30D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i2a0yu6RlT+zETdd3iQNLEBogdpR7mh/Nc5hRgZU3iE=; b=M5BaQpZE5vXu8XzkR0FeAYKe93
	1ZahpLspHSkpDqv+qlS49WgU8KJf5Q0vovncdTndsIFoedabxSTKr9Uj+DnWb1OWJbDcQyAOR3iAM
	yukggrHsgPZbz1zT0D6GE21afhu69b9++pLbHMDEGN5iZ69bxQw72T4tS3msiZ8CvIr4AxxW4bL5d
	VWUmbrA3OKpW201OT/l5R6H65nmO3Dy/iumbhynqCRKKO0q3XZZg07+6jaNqZggruO8dRhU1rFZKy
	t97s8syJjYkc8Rrz6LyXCMuUWD1aUe5NNJhOYroS49c9BuL1Nio1k51FcVETzLVyMWwrQBFB88LeF
	G1bppHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqB7A-00000000j1m-10kT;
	Wed, 11 Feb 2026 14:22:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqB77-00000000j1F-2Uun
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 14:22:46 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2aaf43014d0so22304715ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 06:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770819764; x=1771424564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i2a0yu6RlT+zETdd3iQNLEBogdpR7mh/Nc5hRgZU3iE=;
        b=AGgj8Stqn+a/PVI4FzvvMpxaFEWJmXbyq2AtWQ+RHy864gQhm6RrVWN1tcPZnhIJPS
         xLREUWCaoQHD+faGEOWas4Q6rg9Sj+9fYi1DGzaWLF+p8Pon9Iphl2J7+HsnpTf+RZjY
         mR7Kit9DyoPYPnVXWr6RIjsl9kcIUE4Mf7XcP03XKQIH8o23uC+0Iolz09yiDSQBr8oQ
         dy86Evkcxozpre9H1axczFf/Ck1UTmU86DSX6JxlZ2DS+Z6CMxsNyB5PNsE3wnHLGcrU
         w0AOBte1L1riY2rSpLwGJ0gAntQ4qe4WS6xyLCw0bsx38ahqiLdeVfIahmkY4duLzu7f
         EqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770819764; x=1771424564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2a0yu6RlT+zETdd3iQNLEBogdpR7mh/Nc5hRgZU3iE=;
        b=wjPemS2UAzOQlHHKhSh4SaMfRULLrHrZySgP4QAuFc+NdNQ6C51BA3TS2EbkVslkk/
         EEACVF5oMbhWuvBEeY/DnLNxmgeEmdyJeumejDJznN6dt/dcsITgW3tidkAD8PuIPSmg
         3vIcRG11jJkSerYU4+VdO16HSqUODAL10b/EloOW3spPd9b6v98qcIgvfZRtcnK8pAIU
         IEQUYtkxhR0G81G7EDcFSktrXyG0VjohZmml62r95n5r8IVEa8dFggX7OC81k3anuvA3
         Bb1ZYePPZp2s3HkYmqzCkzoQt0jKnCcWdx72RAtCrTjHaYwtxuIejNaHaxmGAHEXQ4dQ
         SpHg==
X-Forwarded-Encrypted: i=1; AJvYcCXdW0/HEZB+ZRsJoM9lB43cbzTG4jusfP11b3NbxoT4p84PnqwyIyUn15CEzzE/u3DI//7+GXAgBJfJWYAWXitq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6AYNdlPtSAge9mVXkW2d6mT4iKV0jFmCy+IhbFt8/m8v9f4uV
	UipjOkVWEWJVOymqGNtnP3LfITkA7gLcFCFewzt0Dyfy4vCJE1pTxvsM
X-Gm-Gg: AZuq6aIyFaioedJYxarf4ENZLRlRhiqKWpLesa8F4v2rzuRGgZ955umzxg7Itf2LOYC
	9/gEgJ60Z3QfdnQBUIs+JFiVeIO0XK43ilZyKG+myFbg7QlPfdYL/dSOtz/b0aVyWAJyCBY1Zin
	rXj2gzL0HrLGFUsxZ0gUKLW5hAKwPJ7BcdMfDwzyOzY1T3zOSuo0ch/spIdg03vxtUMEWgNqRqf
	3vgmnI7+5Xl2Fj7E6k+9xkDW/3WZFyZzLIH//i5OBQB41lQ0UwcyjULrDN0ijykshLMwcQdE1iQ
	s3jXGrLEk/hbc93QOjV0TBIX4TAToeNP9UvgXtQxZBdVhRGeAsRjwmzVkKo9DczSkV68EIteH9V
	8FkLbbqP5SIkHpBdnn7q5H2Azop7pn9oOh5611eTqpM/uQdZ3yLs128rI72z+KRFUUXRUhzKMYV
	4oFfeTe1P/9KLp44I2iJxt3tV7VIglKbICOaVxFg==
X-Received: by 2002:a17:903:198e:b0:2aa:e238:e219 with SMTP id d9443c01a7336-2ab2ad2b696mr23330115ad.58.1770819764167;
        Wed, 11 Feb 2026 06:22:44 -0800 (PST)
Received: from fedora ([2409:40c1:201e:40f6:5d2e:7e5f:8687:4ec9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29998cd3sm23540505ad.85.2026.02.11.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 06:22:43 -0800 (PST)
From: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	mchehab@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org
Cc: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Subject: [PATCH] staging: media: imx: remove unused header includes
Date: Wed, 11 Feb 2026 19:52:08 +0530
Message-ID: <20260211142208.112033-1-rajveer.chaudhari.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_062245_659734_70088734 
X-CRM114-Status: GOOD (  11.20  )
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

Remove unused header includes from
imx-ic-prp.c
imx-ic-prpencvf.c
imx-media-capture.c
imx-media-csc-scaler.c
imx-media-dev.c
to reduce unnecessary dependencies and improve compilation time.

Signed-off-by: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
---
 drivers/staging/media/imx/imx-ic-prp.c           | 1 -
 drivers/staging/media/imx/imx-ic-prpencvf.c      | 3 +--
 drivers/staging/media/imx/imx-media-capture.c    | 1 -
 drivers/staging/media/imx/imx-media-csc-scaler.c | 2 --
 drivers/staging/media/imx/imx-media-dev.c        | 1 -
 5 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 2b80d54006b3..bba125234769 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -11,7 +11,6 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..1b9dc5d86926 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -9,9 +9,8 @@
  * Copyright (c) 2012-2017 Mentor Graphics Inc.
  */
 #include <linux/delay.h>
-#include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/sched.h>
+#include <linux/interrupt.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index e9cef7af000a..860f93272bbf 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -5,7 +5,6 @@
  * Copyright (c) 2012-2016 Mentor Graphics Inc.
  */
 #include <linux/delay.h>
-#include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 0a27330f9790..d42652c51358 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -7,8 +7,6 @@
  */
 #include <linux/module.h>
 #include <linux/delay.h>
-#include <linux/fs.h>
-#include <linux/sched.h>
 #include <linux/slab.h>
 #include <video/imx-ipu-v3.h>
 #include <video/imx-ipu-image-convert.h>
diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index a08389b99d14..a8f39319bd8a 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -4,7 +4,6 @@
  *
  * Copyright (c) 2016-2019 Mentor Graphics Inc.
  */
-#include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <media/v4l2-async.h>
-- 
2.53.0


