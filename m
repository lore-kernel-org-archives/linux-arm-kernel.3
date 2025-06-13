Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C2EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/Jw1HzLyXz3aA6jCt0RjdVyqCzrscgvid1cM/aOBW4=; b=vNcibLk7xmelBxeIxuzCAH0s23
	t2L8mGa5skyYQCODtwxZzlyG3zk3ow2aV2+3CDFdM+dTGmhjxa/ZWUISQKuNwhJz3Jt7jWQlpwtYa
	EwQ8p+VlobE9f4BCTbBt3jM0Qq9epgSDHIgDum9q2BzryJLU/K0GKCJgyN2t5jLFiBlGXLgoC7Vs3
	GN8fPHwtck4qZZy5rCIhqTlI9SwDpg3LAYTzAzBSAK2PmM8KwHImKkKGdGuEYG8YwS6yo7GWTskgk
	u0+UaljJJgfnRQbJKkGO02GmNoP0MKSRghygIJjp3d58WkiEJyZUH2hLKVijGBdjoP2YsEVzh6gsb
	KqgmJiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9wH-0000000HQFl-0BlC;
	Fri, 13 Jun 2025 19:19:45 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9ZV-0000000HN2N-46ZK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 18:56:15 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-404a5f4cdedso670262b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 11:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749840973; x=1750445773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/Jw1HzLyXz3aA6jCt0RjdVyqCzrscgvid1cM/aOBW4=;
        b=F3pOZbarzcg6NwiIuGgzEbvMivrLKVfZB+2gCD84EdU2uxkrPUsl5mu7s4ba7OH6Fx
         O/kIDfQCyzX7qrUhcMLq72RobiFb35+UCpeaI4id9I9DPk/Cpgdt5KcBo+X5s0zMXdXB
         o/ZJ1Zgce4SCB110tyfOnQ9XzuDprYrerjBgM+V+v7+jfkdLPcARnBJCKYmMgbnsqf/2
         KSw72WAT5rZ05ZLC2nkezxJM1nnc/Rrv6qUt8eAaqcLoMfXyAoq+/J9MIhgDPI47Bf/s
         lLqnIVIu7CyiYAjbJqkxT6hESuXhoYA4JPlU9FwCo1W2F42brXju7PCC9mO8JXw7qTDM
         ql8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840973; x=1750445773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/Jw1HzLyXz3aA6jCt0RjdVyqCzrscgvid1cM/aOBW4=;
        b=a8Mv/RlBLOs45zPtJRVAJCrH3r3MDXueERVwlL+n0mgnbPEfSElE6X/Qa9BGcOL4AS
         jpvN1DR8oZoqQD7AtUOd6ywW9JC1KJHhC17JPK/THJg9/0ozsMs7hWlJ413dBsdfNTw1
         Ywl40RudXUVC3Jw3hZLRcOGwrTuFVYZNzsNFIbpjFTnLMwvY+1tVgdGJL+1GMtiSeJt7
         DR81GBzKMax1yZGz3nj6Y+jjyEsyWpe33ingpFhsiB/itExyNXHZVS4QDrVSV8Wwgiva
         7bT9DHHEDQTrl+PKjhdRm0FayXDv2RoKXXaF+ihA73IzIsDAqUsgu9AU1DQ6yNzuVJX3
         Z3qw==
X-Forwarded-Encrypted: i=1; AJvYcCUuCny+6kL/ViWZwJ3ovec49Jybb9v0Z+qpZfxrAkotPd5YFzYt6n/k5evYCNKAnVA7g8TO+kasyGctG/i7posB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2GO+qQ89UTKw1vFSqnLDsSjmcTjWJ8kcyMvHuRFRsDxfwB4iT
	N63pStthoQ2Vz6PlHWV1+/zxOImBVQDK7BLAt/SDtUOui3YBxi3AtZ7RsP+W4dyA0jY=
X-Gm-Gg: ASbGncuJfZ1QttOLk3nlF41Wf4wKI5raGF8u5uzHNimr9QaZz7M5/+7jyiuIAXNwWw6
	k1fpx9oM5H7OP0TDuX4pAxDsV/tqalvrsbY1zOR5DuS6nYPmYmFrCYCVcuh6EuVrmWEqPlRrJBo
	tU+rcV7L65PWnQtVg8fC5sfbA5pvOE8xrSrDcnp59mvGWK4igT+zvnuGkMc2zC6kJvmDTmqvaDA
	Blk7KDSSNRlT1D3A9v9XgB9/0QtyM97t8+NIlDKA00MR5pCWJlLNVsANAqjQK3FF23MlkaZQGGH
	FX+mY3j6neLMLnHVFoVH8Tra/QMmTm5awSzK2o3MuJ1sc8OwKQzUx1Hc7DkMd/Z8i9Q=
X-Google-Smtp-Source: AGHT+IF46sUC7fpnm70pdQWqZs7Gy/g+8A9DyCLSCMcbG6MfejW4kWoNwjo5H4XZGjACXLhKZ/slUw==
X-Received: by 2002:a05:6808:2224:b0:403:3973:23c4 with SMTP id 5614622812f47-40a7c119d5dmr395805b6e.9.1749840973013;
        Fri, 13 Jun 2025 11:56:13 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f07e08sm256244eaf.27.2025.06.13.11.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:56:11 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 13 Jun 2025 13:55:30 -0500
Subject: [PATCH v5 3/3] bus: ts-nbus: use bitmap_set_value8()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-gpio-set-array-helper-v5-3-273fab50cc8e@baylibre.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
In-Reply-To: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=CAL7obHrndJnr3rxcS12mN4GTY+FeLhfpJLw2svY0Jw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoTHQ7wb/Wqd5uM0itH561zbuzBZLhf8SMVLJOo
 +RXFtT1YgmJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEx0OwAKCRDCzCAB/wGP
 wPGUB/9sOLa34ENc9yrrXBypfPUlomEv0iV2hsaVnJZ7RH8Sat74YHznsdIkYCNfuDpNPMux7Px
 qwv0u/hJtQSgKwdbZkssK8MMoTgQ16JXlUiovxbdDzyM/HqGmvA64mNvfNOvTN8ZDO7nlTG2ojo
 OeZ+7yGMbprFMal41StzydFs9R7FcCDVt8TQI1XvIYRFyQgrjfWqQMY/AEE+l2jDJeFywjM1qtj
 USF53Wt1ke3qkG3Cew8U48WrOPHIhpKgc0r8m69ZbqT2oehrZqy9cP3q3E/64OrKuvuPocmGIny
 wum0JT1pzp68jmyLwG6V9nlIm0RDYuvUFTUFGdT30gnshHMK
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_115614_019218_30C881DA 
X-CRM114-Status: GOOD (  15.13  )
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

Use bitmap_set_value8() instead of accessing the bitmap directly.

Accessing the bitmap directly is not considered good practice. We now
have a helper function that can be used instead, so let's use it.

The bitmap has to be zero-initialized now to avoid a compiler warning
since bitmap_set_value8() does read/modify/write rather than just the
write that this is replacing. In ts_nbus_reset_bus(), this zero-
initialization is enough and we don't need to replace the array
access with bitmap_clear().

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
v5 changes:
- Fix undeclared variable in ts_nbus_reset_bus()
v4 changes:
- Fix typo s/get/set/ in commit message
- Zero-initialize the bitmap to avoid compiler warning
---
 drivers/bus/ts-nbus.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index b4c9308caf0647a3261071d9527fffce77784af2..371fa83ad0db424ea48cd7c23e3070f56162d7ad 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -10,6 +10,7 @@
  * TS-4600 SoM.
  */
 
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
@@ -105,9 +106,7 @@ static void ts_nbus_set_direction(struct ts_nbus *ts_nbus, int direction)
  */
 static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 {
-	DECLARE_BITMAP(values, 8);
-
-	values[0] = 0;
+	DECLARE_BITMAP(values, 8) = { };
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
@@ -149,9 +148,9 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
  */
 static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
-	DECLARE_BITMAP(values, 8);
+	DECLARE_BITMAP(values, 8) = { };
 
-	values[0] = byte;
+	bitmap_set_value8(values, byte, 8);
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }

-- 
2.43.0


