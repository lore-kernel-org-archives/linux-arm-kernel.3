Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086D2C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VhqwyCXWCrR9ZsZI79xSj7TfrvM5uh6vx6A8zPKncw8=; b=bp8kXBdfBETekV9V7RXNZRJeQn
	aSzvtIFhxAl+AfDpS9FkpoScKbsLO4vE+Z1Z9sSg77YfLWx7RcoV10AmbAaX5JPE31LVd09e16m8r
	RoPsJoz03onsnJIhlcd+RGoYtivREAzZb9d6OW+zOTClsxQLNuC43Gt0w5hQaYumYBzkcWncW3W40
	hJFP06fdcDFS4WOA1hdi1IqBKcI1bdKO2JXcGkypDxVa2am2uF/8kEqowd2Uc6XEJr5pIeeWkVKAW
	iQnUnHq+GJ0opndabJr3RV2H0PkpWxZvBLI3Fpnez/HoSBvGn8sL6ujqmAkoRfbsV/xAfkE6LoKug
	TCKdOviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wgf-00000004tyC-0hVk;
	Tue, 22 Sep 2026 09:21:17 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wgc-00000004txR-3iEP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:21:16 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso3263723a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790068873; x=1790673673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhqwyCXWCrR9ZsZI79xSj7TfrvM5uh6vx6A8zPKncw8=;
        b=l6zHh/0TzevqZsyHSFMQ2TYn4A3lYlU7/bIl82DU/A8fybJvN1phv0Le2QxW1ZFocy
         LONud1WKVANXY1u6aBpyUAwTiIovD6BQ6Wax+UvT9YJ/bPMpGD4uzPOijIx5FZDZBnXM
         Df6lPkn6GrQLctWEcKJ+zAXnClhoyboy7N3wuVn0fqxdmt0NMUFY50Q0jD6/jOpTKOBs
         /LOt9Oao7jYkEr8HqwtWT0Q3wCBuMSSsYDNoDvR83ya9ecBIrstAQUkF2MMYhxIGMXj1
         dINozlOS1Za5W9862ji1024IolJ3zkWDZYpDUb1B5LgEvuE6lyuoglIa+jUdpnLdqhMd
         38mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068873; x=1790673673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhqwyCXWCrR9ZsZI79xSj7TfrvM5uh6vx6A8zPKncw8=;
        b=feidsImJGhtNjdD/QXftOKVsZDyXDHEzd9fFQX7mPyStpc+pUCT1HRVTkaH0pzvYGO
         qt7v6WAR4HiRYQiU4s335maMHswsjfel7viJ+b1pewWlY2LjRsf/XLJUqaKuVT6pn6Qk
         WjFunW14KjL3epZKkNbXYk6Z6DRqixt1LV8XyvMKq83q8N5tAw34UZPW5QW3Xr7bgn3A
         FHIEMumTfSpA2yTmcjTIcWlVOJmPhzhDahuecGyFH4ebXMWClGHzet+e+5ANv/wXg2qo
         05nALCloU1jFQDiubhI94onAA3y/JcH6geuUMX9dfBAdZo6GEKJSv9SU4DdaDcMP+DZ+
         B28w==
X-Forwarded-Encrypted: i=1; AKwUvBwOol7Hqky2Gg92arz1RT9Pcg8ejdCl0+8qPPC2wdT5H5A9RXqb3mhLXKn0Ws3xVoiNOe91Rf4mHGjAugMfDSl/@lists.infradead.org
X-Gm-Message-State: AFuF++nPcsdDFLBS6t5ucJ5/PgCSfLx+U0uwuz5tA7QduSkLD98E2CbI
	M0IIP6mMZi6lC0wny4w273MVbvkKumtCxJBKJUG2vH4SknES4LL/AB/8
X-Gm-Gg: AYBFou21y3FjHch4FsiEmlOa8AJiM8TM0eQw95sGTCwa0ILEd3FSLPjy+tceppq4lYf
	o9CMW9gZlCXl7fXyyGNFx9zQLB9EYgfLhLBI2FieRIxu7HbaLa9hk7vgbCTebFkSagiYwEBPJ1f
	x+oZHN7QC2rcs8pRa/6Ln75sAeQ7eQXMDRxs++FUUkEQsTnygXaTRWzCBh96uW3KtXzh7lYyFj2
	kyy7DiatoZx1gFnu/ORvaseIoUJOKNHudh6tVprqqZZb0OGSim4e+SKXurMMmvO+8lVFNG8m+fN
	09k8euXpA/up9EHc8oAxqVEBqXviiBfsrorncVA2zx+ZsfHUXRa6RcYLTwO6Y8ozwN+k03NzuUD
	cdCLZwny8XW1fmnHORNVD1aFCyzYgtTncHNjdRk/DNXqpNPTxTBS42oODhzPCwgJQ3rtUy8FISZ
	M8KrNZBXczFFsaWZtic42ZJuBeasqYhsFaRs1yiUhvBbmDp3919HsW1h0lf5/n0XBJ2MCALdjXt
	oUpmvv1nSN5RHSzdiE=
X-Received: by 2002:a17:90b:2686:b0:39e:4546:fb26 with SMTP id 98e67ed59e1d1-3a072e96de0mr714758a91.0.1790068873149;
        Tue, 22 Sep 2026 02:21:13 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06caf4a73sm899819a91.2.2026.09.22.02.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:21:12 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: zynq: fix runtime PM leak on request error path
Date: Tue, 22 Sep 2026 09:20:58 +0000
Message-ID: <20260922092102.1053513-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_022114_936778_5CD13CEA 
X-CRM114-Status: GOOD (  13.89  )
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

pm_runtime_get_sync() leaves the usage counter incremented even when it
fails, and zynq_gpio_request() returns the error without dropping it.

gpiolib does not call ->free() when ->request() fails, so zynq_gpio_free(),
which holds the only matching pm_runtime_put(), never runs. The reference
is leaked and the controller can no longer runtime-suspend, so its clock
stays enabled.

Switch to pm_runtime_resume_and_get(), which only increments the usage
counter on success.

Fixes: 3242ba117e9b ("gpio: Add driver for Zynq GPIO controller")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with CONFIG_GPIO_ZYNQ=m. Not tested on Zynq hardware.

 drivers/gpio/gpio-zynq.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 15a79d9a2e9e..13e4c5f0e297 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -798,15 +798,7 @@ static int zynq_gpio_runtime_resume(struct device *dev)
 
 static int zynq_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(chip->parent);
-
-	/*
-	 * If the device is already active pm_runtime_get() will return 1 on
-	 * success, but gpio_request still needs to return 0.
-	 */
-	return ret < 0 ? ret : 0;
+	return pm_runtime_resume_and_get(chip->parent);
 }
 
 static void zynq_gpio_free(struct gpio_chip *chip, unsigned int offset)
-- 
2.47.3


