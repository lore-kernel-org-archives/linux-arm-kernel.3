Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B553DCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMtYakkWg6xW89eWo2V/gAFSemUpeEFr7/GQfm8tsfU=; b=pp8Yii84cGitZFEHsFU+fAIQjv
	DpaxmeOrUhsQYsxlEnM8xB0tGpqwCEwp6w3rL89HIUfAKP2eSpy0lds8KS+HdiTlRVyrqGKXL2DJf
	xZm6gUytZkdG3ls1lcFHQhMM+MbL/C3SNxYO8YMIapy7c5Arwvt+xhcIyYOaPoclisd38E5qutDNG
	8mv/LXVnFYaaVMbnIFvGi190arqDf5p1zBBLpCDlxpSsjtMZV4lsW/WN2cU1FGCcNIpdAM2VIlpyc
	nWuPJu+4HsffVhYDdeLa8nldyvA+vhgi/Y+qDUaH8GgWtwo3C3oOmVo1k2m4a3GNvSEAOTs1TySdA
	8Y9jXFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWV1-0000000CLBe-40EF;
	Sun, 17 May 2026 08:05:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWUz-0000000CL9r-2l5W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 08:05:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ba21d32776so8384725ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005121; x=1779609921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMtYakkWg6xW89eWo2V/gAFSemUpeEFr7/GQfm8tsfU=;
        b=F64EajyyA6Aq5FPVPd+Wb+n1QM5rfSKFufMxHVdPFH0DcQyuKby9utmwIxgGFNavPa
         bvh+yvTxId6p8bzQZdxMEsOr6WyAauu0An7UOF601Y6GHECRpEsRK6FC5HzZE0/hDMhN
         qUgzhn5r/OkcY1I52/Zf/1lVuIGdM0M1dCk2WW0rUj8yNIWYyGDzc2mqofawFfrNvNya
         q6pIEvz0WF7798J8G/bqAAptw3z84QYFmJFUTZlXDksx9GWf5TCmcn0kMgSlEO3CaVDR
         ch01oBExAdsv+oMEiBwHW+XbglAdIK3fgRFMcxA64veiA8lBFPA21o8kQRgFWXw2AbYM
         vrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005121; x=1779609921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yMtYakkWg6xW89eWo2V/gAFSemUpeEFr7/GQfm8tsfU=;
        b=eZkFhRXWVcF53VCTsSfj8QY/YH8Bo7FOBlIlYgJwUOpzQvAuyKY//X0NLznVGvDbaD
         zOVb8Jk/ZJdkWeEm5vZQtfC9W9qN+BWqJL6jH3UIByjt3DGik4iuDad2CvZW0eE9ggu+
         Caxys8h76Ht5WCVRHJfuU8rT8HudI7LZHwZuAfW559YOkEyUWS1URvFY60P5WNyh459a
         hXJJHfYfmXRYkKn9DqgRXDY0qHYAv7UoBUlc3WnnBgpgYb35F2JkfKAjPEh6j00OUD+/
         dFhTZQBERSvJlaHyzaN4njMhR08E1aqMrULssOLxDUZA4twjXTxcOhY/AOpSz16zOq4o
         YWGA==
X-Forwarded-Encrypted: i=1; AFNElJ/btVA3MBpxYrFQdFJfS6Oazn3wWxytVe/db6E8932Drxunw5AyX1WX1gwZUCGw4MdfDziy451k3uTU501D3FRi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxby9UuHIsHUKoBnNx/5DQ1uyxaBvO3EEh2EDF91otsxmiUQ6ib
	evOc63ZuucIq4HZkdo0MQrWk7PKBfSIBpzV7p4MDlZmKspwSyMzcjMAt
X-Gm-Gg: Acq92OELNMFMCRLK98aUejT6FowT8nbu+D+JsfyK2aOF5Y1Cudue7/sdeHZLFl74/EL
	g4q7L+LODSX0TmYfbq3mBKR3STMwmnsR8RTg7BF9a5KDRpEaHzZyOj3brYjEWFMBSLzO+RbSxqD
	Mpo+gQat+4ZuNeoE2+kIEw3KUcy6HYoUV+L3bkLw68p+kJWq79Z7IeX+GrahgQ+2z9EI1mde1fJ
	4ISCRkhGukHg/sUmJ4NaJWpALoVGvEtjcB+Pu7V/k9DkL4srW1P1Sxwf314YgB118j0IXjqqqjc
	jqHDt1Zy3BCK9CGWc6tsSv0Z25BMpgDowmfpIJaeaLbZnkVrz0aYvu5YxALvlgZfDvtm3ze96sq
	8QL7eAsSF6k8FvXE0wWGwz/15jQRk3SHdF3QNwjdpu8U6ayfJRejunDQEZ6FPzbir27+4AFpy3h
	Kw0zM0A4xhbcfqabNN092EcfIdJwaiFQGk92r9htXklj2DGCEfpZTPbWCQmTfc
X-Received: by 2002:a17:902:7d86:b0:2bc:7486:21cf with SMTP id d9443c01a7336-2bd7e9056dfmr70871815ad.36.1779005120658;
        Sun, 17 May 2026 01:05:20 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:4064:2d80:75ca:8541:272f:2bb3:5e55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm109834595ad.1.2026.05.17.01.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:05:20 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 3/3] hwmon: raspberrypi: Fix delayed-work teardown race
Date: Sun, 17 May 2026 13:34:45 +0530
Message-ID: <20260517080445.103962-4-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_010521_703478_7F8C1D58 
X-CRM114-Status: GOOD (  12.68  )
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

The delayed polling work rearms itself from the work function, so use
explicit delayed-work setup and cleanup instead of
devm_delayed_work_autocancel().

Initialize the delayed work with INIT_DELAYED_WORK() and register a
devres cleanup action that calls disable_delayed_work_sync() during
teardown.

This addresses the concern raised during review about the polling work
being able to requeue itself while the driver is being removed.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/hwmon/raspberrypi-hwmon.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index 8ce6dacc19b0..0bbc735f74a4 100644
--- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -8,7 +8,6 @@
  * Copyright (C) 2026 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
  */
 #include <linux/device.h>
-#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
@@ -96,6 +95,13 @@ static void get_values_poll(struct work_struct *work)
 	schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
 }
 
+static void rpi_hwmon_cancel_poll_work(void *res)
+{
+	struct rpi_hwmon_data *data = res;
+
+	disable_delayed_work_sync(&data->get_values_poll_work);
+}
+
 static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
 		    u32 attr, int channel, long *val)
 {
@@ -237,8 +243,8 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 	if (IS_ERR(data->hwmon_dev))
 		return PTR_ERR(data->hwmon_dev);
 
-	ret = devm_delayed_work_autocancel(dev, &data->get_values_poll_work,
-					   get_values_poll);
+	INIT_DELAYED_WORK(&data->get_values_poll_work, get_values_poll);
+	ret = devm_add_action_or_reset(dev, rpi_hwmon_cancel_poll_work, data);
 	if (ret)
 		return ret;
 	platform_set_drvdata(pdev, data);
-- 
2.54.0


