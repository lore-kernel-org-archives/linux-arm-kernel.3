Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690C9C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnErFkFW00l/PAG6MwIj1HiufEnT+BpJAjKHZo9C8hw=; b=b60yg4aB3HnsLq2Y8owzy0GvHO
	REq8RLqUgcxUdWYKqVqJwR3Sdf92K7YKdFrS0405tgVs5teaNXdrpprMjJHzHqXd26LRH5Z3UAE1Y
	3D0qTSx//UKEHaCt7phnfigWYZFLyxkw77tBb7uw9nOge+aJwGQIAkol+rmu6n2tjUoX+e/SB9mU4
	fVBhdPm2e33SpFVFZyrYBXGCsqJfGbi3Hym+aCeays8g8AtuBTxyhI3RdCN63GI/iVI3pdmyX9bLi
	0W6vPOs8mcyweOD6ZZS0GVN4/f6wD42JGfRIu600zbA6UAFMwbYT0PF2wQS/4I/fl+GuUuQtvLcmr
	Bp+q0F8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFB0-0000000BVgJ-3KVD;
	Tue, 06 May 2025 10:05:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBi-0000000BFzo-2dl6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:02:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43d0618746bso36696655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522125; x=1747126925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnErFkFW00l/PAG6MwIj1HiufEnT+BpJAjKHZo9C8hw=;
        b=Jy1VSDQUZv94ZJsvE9CJHO42wferK2hNDvHo7EJ9HtUPUb0gJobxFJL2jaPASD7Z3u
         zkEIll6qbnZ0L6a2UUENv2v8qeJRDrcpqwwcvVNr0bNLyi0YrIj7kMWejcxeF+w3QIGu
         C72tUJrugzq9QKqK5yQbljP4quPz9/2zwdHfqtJk8g3qxG7gDjqfkr0JqtgtNJqZaJu6
         uGhNH7wTSqxHX2nwUSHFzUKjsGcqTddbonZT+kcAvJO7fTdWjiZSsxkiJxQkALsOPDCj
         KqxZULoKBb3qflxVXseAMI0WPv8vD+r+UqY0HzWCAXPFQNbcPLuikv5QUwiJLa/H6Fh7
         kZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522125; x=1747126925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnErFkFW00l/PAG6MwIj1HiufEnT+BpJAjKHZo9C8hw=;
        b=MuWB9J1+W/+4DoT9Gog4Xf7kS6RYXvb5A1I+vpql0LKI7JAucTEk62v8GzbBjU37+x
         hnEbjzGISvk+ks3fOeoaJlW+5yHUvDug5qH7kbr4P00RJvcb0rRlGgrrTAn7TyhV0HFU
         CCfwlc4Fct7V4OyLN2VIi5Oq5SZ2rEZwAUUzrYlKCZF3HSABA4ZTvdqx2hCX7eKWHAsu
         +i4BwSkyAzEeXxfTyg+7XVJFdMwZWLY+DQPXLczKS9k11BbtAt9XSF/8ixK36kjCq5os
         Fzk/6wUDBz4xkK7qthun4AFaUmfm1xsFQFoKt0T98szAStZPumquFPyVe7rJ8gwlD5zq
         43QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPD/s50zRp4H0Jr+wjErOOrluowO5DaXrhUmx6XM4vI1poWiapa8ll7ltpGgjuJwPSgdlOOQZubY9xYPBDytLi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxotz0QoUVjMy/0Xt+YStBrt8EQ543BS3ZtbPtlmxX6KZAw1+3H
	DnX4G5Xyb5iBY1Ltqdiwt1/BuXZ58qZnz98mkeBm257KwyUbe24kB5003BF0pS8=
X-Gm-Gg: ASbGncvsiBZmHSwVrpamYXTkgoRAq0xw2Vu+kFuTDcf1VQvfMB9nY+1FIJThsKRdriQ
	Q8P+Xxr+m7a+/3riPYbHtxCnrVyqyEBmkUvZfs4rKfEDsKsabXwTeiRecRtwhb7n7iYUJnLOx0C
	L0dFZdbqNKE8xMmmGRYvq49Q0dSFFppQCoAS9YlB4kivCa/xzhYcbSvizZY4TAyqSUsl6aK63Ec
	wEQfd1aPeR3GMUoXvrKA/ajJ925CcrvY/lpZospcrtfFQIcopTUVog9orr/DWRTHArU5WJDpSIC
	k7mn1shvmut7Jk8j8moXJwwze5BZY+HRQME=
X-Google-Smtp-Source: AGHT+IFO1hQZjV4t7yl1TN8fzggwDVqxrNbuwXVatO2B4+xlJe0tbSOvXbGoPbT3JNs0BKBgDLCecg==
X-Received: by 2002:a05:600c:3e09:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-441c491fce2mr77521325e9.20.1746522124947;
        Tue, 06 May 2025 02:02:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:54 +0200
Subject: [PATCH 11/12] gpio: mc33880: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-11-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9Aw2t8H6c4f+KPi58wqKHwRBhg3G3TO2LIpCTfvznKY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc//cXPCtvlIjGZ1ft1cmtsktDk5hauqLZ6Y7
 3Y2mIFq9N+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/wAKCRARpy6gFHHX
 cjLVD/9YUlG7AuOZS97Og0sK8FN+tAo62VFK/rgAzGiJNFZSbqlvlN1wPCOJQDyskKi66mM+q6N
 mjJlED+ljPXgxPZ/4ciL8jENmyBCCpVBrUsMbg0LV1LKsBKWVCH8d4PDzOu+G5aB8WxVtsKFoBl
 KYMcS2lkNNAqVA1xOi6dMBvv4mA2zTXG+MGHvY2lRMc47WNRbGwoCj/Bveo8Knyexm9kW3HAITm
 lzbBU8uxOtTstsOQl4Q0FruUVkqCIhyeUmKflEp3QsKxKg3w0CevbvIXHy8YNYoM50mXdPGsrv0
 4+k0bOz23bo/em2m7GxmaR6jLbMmgFmTC3Ooc19a0/8SkTjzNVIAEx1thJTZ2SAPxtZ5hjdCWe4
 j56/zlckvNcAr2+4RtsC98mry3xnETRdeCYqek20zpECJc6o5ctYVL1lhFvS3E2RRZH6S6I1Pel
 Nwe6hcAPJwMB+NRU153wiKSa8xGaOgch+5O7RgmxCU/lfXy6UShkzHjVWYQCJ57+q87/KVKHWXC
 8GVLJ2SgL8V7PnLR5ZfP0t2p/AV0VDDfJl5jcqjjJNSyR5EyRxqkmoGfu2K+5OwCMB8nKpDXZeF
 wLOo+wMHweQCnw+eSaiqeiCKWO+wEB4lU1b2vmo90SDtlnNAsDwCHfG1U7dsaNqUxA9uKWZaqrx
 KhUwh/jd72TxWhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020206_672037_D85423CC 
X-CRM114-Status: GOOD (  11.99  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mc33880.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
index 5fb357d7b78aa..e689561041616 100644
--- a/drivers/gpio/gpio-mc33880.c
+++ b/drivers/gpio/gpio-mc33880.c
@@ -57,15 +57,18 @@ static int __mc33880_set(struct mc33880 *mc, unsigned offset, int value)
 }
 
 
-static void mc33880_set(struct gpio_chip *chip, unsigned offset, int value)
+static int mc33880_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct mc33880 *mc = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&mc->lock);
 
-	__mc33880_set(mc, offset, value);
+	ret = __mc33880_set(mc, offset, value);
 
 	mutex_unlock(&mc->lock);
+
+	return ret;
 }
 
 static int mc33880_probe(struct spi_device *spi)
@@ -100,7 +103,7 @@ static int mc33880_probe(struct spi_device *spi)
 	mc->spi = spi;
 
 	mc->chip.label = DRIVER_NAME;
-	mc->chip.set = mc33880_set;
+	mc->chip.set_rv = mc33880_set;
 	mc->chip.base = pdata->base;
 	mc->chip.ngpio = PIN_NUMBER;
 	mc->chip.can_sleep = true;

-- 
2.45.2


