Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB0ECD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N9lSel/09AkblmaVWdGZHXaGbI2zsZxvAoh/LlPTdKw=; b=2S8oy5ibb7YfZwrwggZzpR6jIj
	ZnR66G7DKj9xWD8ZNYwvI6MG8xY6wo319y8Eixg5D+b61X1fMMFh9dMPoIpUkt2Z2QMYMR4ZbXH8G
	VpC8BYy2jxNUXOshlLDxMlATqsZiNz4WM1XK/gVtqv5j3MhcQmQIyK7ykuCUwJWNdMVMhwTtzR4e2
	bbydqhJZNXXxbOL6HUcYJ3ETwoUOu8/JVGM5b8PlKQzCsgFfRXRVxEVuO3WlYCRBKnIWuO+3ceWkm
	YTH1VoMDUeU62YGeP2vUa/93P734ozKk+CjVCkYoDE/1oIbYuDeZLJquLrjI6CsrHTweKQjmsPhEi
	30e83gVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPL9k-00000001m2x-0G9G;
	Tue, 19 May 2026 14:10:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPL9f-00000001m1Z-2ES0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:10:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so54179065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779199842; x=1779804642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N9lSel/09AkblmaVWdGZHXaGbI2zsZxvAoh/LlPTdKw=;
        b=ZpKtpUAbkTiQN878/1mS3s55YA9frS8/JHD2b9rI42J6qjlUYakXIqaAjudEMQhEdS
         EAt0VPq+Ax/sVm3B66tccnILT8mD1FNC1UlrlxxJHFQpl5f1fhvatiCzGYxQJPREuD2E
         QM7ZsgMcC+ue/YcMFLn9vss6YJrppiKp9vqImzkdDGOUEF5FRFCbxPUqWGdTJ0beuFgS
         bRUwWY1NTLXf+e+M/Kbak3fzyDqfveN++geREebiDrFIMsJ6zpF9RF6ao3rjOJJMlE6z
         nfdiBXm9Di/kHTHkLfCFKKPLy5citldXi87IHyXeeZEBTbHtB9WoWTcdTe4bjSx4DSGH
         wupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199842; x=1779804642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9lSel/09AkblmaVWdGZHXaGbI2zsZxvAoh/LlPTdKw=;
        b=iF+Tr3FPuYm0NKoQNGQ+g1mF3JhN4Wh5X4bCpgJ4R2JDfZtwzk5QEkFnKbMEuI3VNH
         Jchyjh7FbwEUQAP2crQmRId7cPgXqa8nLDoYxYTt2PoC7xG1XLEJd6+GQhxk7Znm8xO2
         25ounftcaQDrY5SJwgwDUwDFISTf+iUBwa2VjkNazsp00nSAEYvRQ1gee9eeXtVg7Uow
         /LuZcneQ9sHLb8tyFrzwQSWcBF8noaTajODkJyIukUurHGrcWCUgMDahsVErlLxaKaN9
         OqU1zfXMAnOze8CevYg/4bPGlS6GsVCe8NEWniYSResz3d8BMzDRgXfLfkBwVsZwb4Zm
         gPqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RWQWx93X6xY0mM+QfuIGyzS/avXRZWwNlTS7nZHre4RBLfZXRKko8+9QoAv3UtSeLyzCnCtuPlM0zV+jF++FC@lists.infradead.org
X-Gm-Message-State: AOJu0YwHnXWgnPQY2nYzjFRy6n4wXnhHHUHEcHdK/9xngmTUsewEzJB5
	ooblUHefYs+wKuD4bDxTDsHsF22/Y+DaI7bOjf6SzraUjkUeJD9bZsoMb8ywMQgZUUk=
X-Gm-Gg: Acq92OFEj112PoWS/UsQzNTv8Xl8Lp4PZ+2apLST5ihsm24hhpK2VxTtpy7uULOKQqc
	d+jiUJGoOXh1Xq/GBWTgNINcWav9zdg0spFl2KAzBwIwqDQ1d/y6er497ynqUACKc59B1f62ZAb
	L9SBVCpFiQRfbFZViGBWqs15PfA96Vu4uX5g2xdfbivinOIBV0cs7kukZraw/87I+DrEk5Usoh+
	vOF7jFHaEgLXmSRucLfCHN3TpsSduAx2GhbnV5XW4ertkoNnJ5DBk2DvBO9I5prV00FFBtQowNF
	Nrf1o1DH2k6WcCp8gJkQYwXilWms91fqhd7PIqRCakSa2y4fXPttv+klFUcwqOEj6S8WNxDakx8
	VGC/1EX2M5UwdCI8HZIXC7izxfi1jH0tVOFBAH9MfWg6/G0SHTau5mWVbDqZ+4HO8Lb0iZDa50L
	FynHn8q0/Nwk0Io91J++MzRRiPHCwhBtJU0tCDdeJYYTD+VMvzvdCrHdMhdBQTSi8xpIwzPNfUE
	Vu7HZOciHoXYts=
X-Received: by 2002:a05:600c:34d3:b0:48e:6db3:ff3a with SMTP id 5b1f17b1804b1-48fe63270fdmr286980175e9.16.1779199841653;
        Tue, 19 May 2026 07:10:41 -0700 (PDT)
Received: from localhost (p200300f65f47db048a8dfcf61053817f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8a8d:fcf6:1053:817f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48feb029180sm162671535e9.4.2026.05.19.07.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:10:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] crypto: Use named initializers for struct i2c_device_id
Date: Tue, 19 May 2026 16:10:33 +0200
Message-ID: <20260519141033.1586036-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ElZSFnN/XM5YGAs1Zqnf8SqCzctIA5yODBWQ4Y3lhoU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqDG9aX5GbUFVaEdcDLwiZcVrqdY0sNsGs+se1b CDirz8BN/CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagxvWgAKCRCPgPtYfRL+ TnHEB/sGsKnjrOQJ/f7IYTwCz+SmY4MBiiGushJDD2o4i41S/5LBbxncRtM6MeL1WnlJk29j1Qx smEi0rHK4EZQYLhTYr8vVdsmhkT0z5gR+DKhuG/en59JQgwkvBJYmg827Nxs5AjZks4mm7GqXOZ tlqXT+Q9H5mkHCFPO3JMN9Q1GyHoV7NG2XpAgu5cqy0bdFbBGwQShyutRmU1AR4HKcJYcri0O+M OCN76C6JdlPPA7xLwTqbPuwqwvqj2d0BroGr9VuX6fL4AxZbIu46fZ40Au6Xb/7Y096ePaFP6yi hORAnaXuigGSzvjU9ABYw4Uf8AcdxWpwu683hsNkxgo8EZq4
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_071043_593261_0C697DB2 
X-CRM114-Status: GOOD (  17.19  )
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

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this patch is part of a bigger quest to use named initializers for
mainly struct i2c_device_id::driver_data to be able to modify
i2c_device_id. See e.g.
https://lore.kernel.org/all/20260518111203.639603-2-u.kleine-koenig@baylibre.com/
for the details.

This patch here isn't critical for this quest, as no driver makes use of
.driver_data, so apart from the better readability this is only about
consistency with other subsystems.

Best regards
Uwe

 drivers/crypto/atmel-ecc.c     | 2 +-
 drivers/crypto/atmel-sha204a.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 9c380351d2f9..56350454ac29 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -380,7 +380,7 @@ MODULE_DEVICE_TABLE(of, atmel_ecc_dt_ids);
 #endif
 
 static const struct i2c_device_id atmel_ecc_id[] = {
-	{ "atecc508a" },
+	{ .name = "atecc508a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, atmel_ecc_id);
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index dbb39ed0cea1..0fcb4692494f 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -210,8 +210,8 @@ static const struct of_device_id atmel_sha204a_dt_ids[] __maybe_unused = {
 MODULE_DEVICE_TABLE(of, atmel_sha204a_dt_ids);
 
 static const struct i2c_device_id atmel_sha204a_id[] = {
-	{ "atsha204" },
-	{ "atsha204a" },
+	{ .name = "atsha204" },
+	{ .name = "atsha204a" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, atmel_sha204a_id);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


