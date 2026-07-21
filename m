Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59A5C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNKmqRLcn9Q9wFj4nPUvbsCt3JMsfIzkeIOJzLyzvCI=; b=eGbC0z6kdYwkhM6f3zQZq0fVwT
	SOtx2PlZcIA1KXaPMqoOPXap2UXpPY8URdp9iU3FFq4qm3yj+m2eNcc7xiu/J2yMQiXnrKfPY3lZL
	A01whIAHIau9P17pUcBlzCRKSmf14wiP0cJe96fnPjTdfRJqrDp2xky7NUwr8L92TE4h9R9TyhEuZ
	sDNvoutshW22wcDyH2/C/NjUkeUYvhU0+z032sda+T0jxkbqMVbaTkAa4+pg0MSCRDj7eGlTxKbXj
	ePQITTG8BKugz82vEC8Y7RJIa5filBrJNvRGNH+Q1xg0JLup8QGJ+u6mFuXzUkCiKqZx3BkHT6qyQ
	0QhMkZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5J5-00000008i1K-2oFC;
	Tue, 21 Jul 2026 07:54:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Iu-00000008hqD-1qN0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:17 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso82450745ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620455; x=1785225255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNKmqRLcn9Q9wFj4nPUvbsCt3JMsfIzkeIOJzLyzvCI=;
        b=gVkFrHdkaItz/zRI1gbPsQkfyEz3MvdnOukjV779Zxj5Et1o1UVJgr6I6uCeGza8Cy
         L/21MIJUiX4hvja0yI+2I10WZJ1pUuK5Jci3YfuLMI8V3WCYxt2ZBcvhclY72Ce54CzI
         gclrPypuPgm5dwxQH6YFcu8JIFO9QvZ3x2uCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620455; x=1785225255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNKmqRLcn9Q9wFj4nPUvbsCt3JMsfIzkeIOJzLyzvCI=;
        b=OV+5CWLtlb8pynR8GuplgdWERS7wxEnv0DdIWVh8oF68YYCnK37YFH4avhBgcNet3D
         XlTerubC2ROGbhg9LWRxSr94WJsiSbtCvPvZoIQ78L2mag22IjlYEjZt1DckkYgXPE8K
         W3RzZU1WkAEQ3AQtreGqcopqb/aVUIfWNEgwVC7gUXLrOLng40IDcTovFkeR+IPAERIb
         x2lXNPMpQX25Zjms3cRLiFshQCDCp5X70dW4rIUMvEJXyUTyK4PZAtRrD9K/QSc9eTxY
         kkTkK8CO4CKMz1hHGB8gLnc+wKhZK2EO9rxdem5/Eb21CpX/Dcf3YajbNS+RZBUZBGud
         +Twg==
X-Forwarded-Encrypted: i=1; AHgh+RprifT9qFBm+/bpt2+Qvm/l4qaNS6tC7Oda09deJjxpG4wTZ+Y+cUK/Xjs0VcNSpp/cmUJJUsTuaPUIvEvaIMt3@lists.infradead.org
X-Gm-Message-State: AOJu0YwrmmzmG4tkDDlLW2DijqHiUsWDV/W4kf2NL9GLLNjpUROW0JOt
	lvy3rIXgvWdDnLJqIGjTe+XX7MaElF3eFD27Oku5Cm3OOcRaAMffJqc4cv66VbPEig==
X-Gm-Gg: AR+sD12ALdOdU0SZDbUyz8MduDuQVSjIkKNjqa5jjE8Z6RYugGBZR4+0gXsxB7fkH5T
	HIQ5lmZTSTP+6xmLuXXBPLbBRx3YcFiaFF4yw3hLhYvkeMZb4Ca0R6p3mcL/sD7myZTjsXiIU+C
	M+uxv85B6H1RkJ3DKYvXg5j0lr5aC/QdGa8rm7K6nMMqJW36U2avpUiJV50sV98RwG8ILtnb/gI
	sj1KE6fuvxBqnUlVScz9EYirF1lc0KL9oTVFCOA1lBxrTkCOJkU76bNT0S5G46aQd9SU1wvQwmZ
	Jv54uVVmOuhvctqWFbUJ89XtF01Fh9osSE3o+2rzAgWU9KEeQ+O6FwkSJWLhIyLTXdbgc5f7n/5
	zK9Z7Am2YPccKFlfttg23oYWj+uoku+uMjYe0BQZnZD3WUGqabF48CAHX0WPcIhLg7H7gtvHADI
	FZK5ld+YaY4ifUznBbMDDhcuzgJi2rRqWER5ZEUJwdlFi0Z7+La0m+iVdbjecetBOE/pN9zw==
X-Received: by 2002:a17:903:2f84:b0:2c6:a012:6241 with SMTP id d9443c01a7336-2cf34850f28mr198999395ad.6.1784620455632;
        Tue, 21 Jul 2026 00:54:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue, 21 Jul 2026 15:52:18 +0800
Message-ID: <20260721075226.2347933-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005416_848746_A31CDD3B 
X-CRM114-Status: GOOD (  19.48  )
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

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.55.0.229.g6434b31f56-goog


