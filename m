Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A89C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8hAv7noimuIZZQmeIe3WLO3rZ6iIEPRpuvmg5XIUhY=; b=TbEcwW21qIEJWAQIasOnSqYybF
	s2hBHmbz7fWGaU4utA0Smpv++gG2dlhmDo7Ms6Tz2oIkX0fyz9D0uBr+nz+l3U2GEERo6Y/z3xQDz
	WU6jhSSXVQD1l1NZPrN8Gk8oDb4ad48+EbH8oV34mrNAscz/5MFJQXhX+NyUXQQBAkYEVKfCXTfAo
	2Jj0lDdraOFeENF7rg1RPfshNA/5Gx+gqS+RdyLcmc4cVyc9VpomwF4qaP6/l31pYsPrTfiv2qbit
	2jCglGrkeZ8udDFWCv1K6wjY3wrJelRT8DPrPlQf6R3/PM/7HfPJ1v0c5Vu7pT9PoIm09tRUuFVwC
	9Hsq2m0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5p5-00000000unn-2at0;
	Mon, 03 Mar 2025 13:27:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5gw-00000000sWj-35IV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-439950a45daso27920595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007921; x=1741612721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8hAv7noimuIZZQmeIe3WLO3rZ6iIEPRpuvmg5XIUhY=;
        b=Tw14RpEhqm3gio+65OiRegUuRtGmDWOIvRA3QYCbwvgjyqA9aX4sK3occ4Y3/clNi+
         OYbjL1cqQKY2z6Z9JKp9niaMZSbXSvsg5X89/YEuZpcIlrOZXZyvcK48uZAduZSbD+wU
         rMbuRlXKBdm6blgwNVgLzpOur0aarZYdxI4P4Jrddv1SNR66WaucndHCxLmi8f6//EvX
         2E4ns22m9GH3xqC9UzU0tQmUNF4Oyc3lztOfxHw3MYBfbfOqKWzeKtU104jOLwB/8QVC
         ltYlWj0KW+Hi/hDVFQ2+cOTyV3QCI44TJMRfOAMftAZOGkeKJTy7jMSAFskohkeoWnhS
         xbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007921; x=1741612721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8hAv7noimuIZZQmeIe3WLO3rZ6iIEPRpuvmg5XIUhY=;
        b=D+lWsaBklvccrSRgp6bjq9Mm3JdG0LXhlpljGNDPmjOEhZarUhmY83XCW06CSZiq44
         CsERBYJMQLYNJSP/Y8aUe+UjNWYGA0t0WvbaGw04K5gVOgb2cZw1mWSxl/gOJ95a6HnY
         JQBaQxoywC2eDj6nMW3VSMB8ydPVkwsrVk4Tw56V4qkN6MjWjck7V66/RZd1BbkjgfX3
         N52f+59DZxZcXF6Cct2TZ/DA8IQ/s38iwi/j9O3XTkSU5LsXD4NTKedTywZGTK0OmSE0
         Zu4HfTeaH7wUhYNsxQkiLXHur+VLTkscgUPYryGrmPTsDRWpau4r3biq01m3J9FheJfL
         Dilg==
X-Forwarded-Encrypted: i=1; AJvYcCVrB49vDiK+jJqf29/RTRdrjVXC67xIVGYRA1GkaSOOvPaS2UxQyCeBN0mUyL168dcw6uog61hjTMbB/5JiolWH@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp4ZlZDSmb1QESUpTvhEq7GSgC+iCL4hxjVqHLEUpEy7Q0OSLL
	gT0W3u7mA1jCQ5IIPR09W0P9eAltzYD+6xLozVTfj5rWbaRZMKW/1v9P3vAf/EA=
X-Gm-Gg: ASbGncsvei6xXAoQJ8SKlBsxzuqEzBhmJ+1HmoZecHMu98H8on7KDbskOPWK6VRdYVn
	DeXoRpbHdILAmwlf2BMdGp8Rk1AiydT0k80KA5u3gUnH5H/6cPPWcBODBtN5HfOOVL91fPvwQxU
	+4lC4Wp1rIzS8Mha80GNG8cTq/FFkWH13eRVFyAT/XIqH9sAGROVIFmKdeiO2Ma22enlCUGH1mf
	uoy9hFzCw4m1nP6sMLjF3jdptebfRXixu2jPQETru8zfJkr4rmiyTfddfCB9HGYQf/wkoVUUZn2
	Q5+mBG2vNYQ69iM5MtaTh8VBQIWi938f4keReA==
X-Google-Smtp-Source: AGHT+IENjU5auSW6uBydmqpRlN4cRim5e7ftx75e07xHAIh+YvS9KyaVM39ESiF/66tXbphMfz7i4g==
X-Received: by 2002:a05:600c:3112:b0:439:99d1:d4a4 with SMTP id 5b1f17b1804b1-43ba670a870mr109103405e9.18.1741007921076;
        Mon, 03 Mar 2025 05:18:41 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:28 +0100
Subject: [PATCH 03/15] gpio: adnp: use devm_mutex_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-3-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rVvnRkyDf21RjdggCKIxDxEyQFvc1fgcMj5lcOy+gbw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawp7Yvsyrv6sI169Lp9L4rRvfe6m5SnbOO8v
 UqoONS7cQOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKQAKCRARpy6gFHHX
 ctf9EACVXYJIoLFFThB1bopDzr4Y6565Nv71gHd7ciywfLXPYQ6yTBNpZh/2RSmBQB+e+ja86PH
 CUip+9SBF9kzpxZiGkp6FhfuDN54tAmirDRWrtRODLUV3iHyzK9uH0jo1tXljQOt1NYRquUBhgN
 bGB/C2ihy4oE6qHKnMakBSbtacDEQp6fbBYxfNGH84kysXmJQV43Mv1NUjNnf/aHFKvNkgWDtin
 vHcT2e6jtYK1G5qPaEchHbyTOloRaGL4KXF+r87jQrAvoJFh5Qt7IswZ/Fmv1p+Er+tsRg1Dn4Y
 yYvnyN2mVheduT8LzO4AzsbzrjhkjYvz+vNbkfnZ450m15iY9yEiaCFyFc9WzGuR4PWA4+Vqbtb
 79F2tyV/LUQcR35Okda9wZAqhOGnH1EsdPjzfoAjV9UaqS3Dl7KloSMDvc1a5nEL4sX4JzhZgHf
 9ZF2kvH0tk3HMIpOQQR/ZbQ1CTCAxX6av1Qdbniwf08+kv/DyzDulxnlVG/qXDQ5LhC5fF3iUpM
 hdZiVTFUbzMvEXFScb9AF/4l3uK9w2PgNEZjDZ7aIzESl4APeYcOLcMK+vKAIPJUlaOYbOwMBZo
 lfhFveb81B6cBFCYG0aoXsPcfnT2rUfb4+52AfSHbC6d5HEiyQpdiT+5q5UoentxBKekBIrFEPc
 Y0M8FNdhHVNmC2g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051842_785014_F28C6B88 
X-CRM114-Status: GOOD (  11.50  )
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

The mutex initialized in probe() is never cleaned up. Use
devm_mutex_init() to do it automatically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-adnp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index dc87768276ec..d6ae9cf1eb54 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
@@ -482,7 +483,10 @@ static int adnp_i2c_probe(struct i2c_client *client)
 	if (!adnp)
 		return -ENOMEM;
 
-	mutex_init(&adnp->i2c_lock);
+	err = devm_mutex_init(&client->dev, &adnp->i2c_lock);
+	if (err)
+		return err;
+
 	adnp->client = client;
 
 	err = adnp_gpio_setup(adnp, num_gpios, device_property_read_bool(dev, "interrupt-controller"));

-- 
2.45.2


