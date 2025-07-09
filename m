Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAFBC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPajqmnoVcOjf6GJbUpVo6oCGjF8nwoS+qUy5dwCIhQ=; b=yoipAPZXx3OPuJCh9h+7T6zb2i
	LvvNaUmFkTeDMO9pSoEInVQcoIQrya85wtog7dhBNO0+LRuif4ZhJb1a3yjYShL5sc8cbSIr3z7AW
	R4sle64it0mizTEkqCDyOrplURqu6mUAdCV9KyhTum4CuM5l8Q/TDL4kncpXHmsKqQWHrfV+1gAch
	9t2NH+ZHGYrvwMeVtH/1QeLra/6/ij2Tx7DynJGvuTQLLnNrnMjVBRvbTupWOaPH3AQ+RE99ghBCF
	x4ij16N6pcOTUYW/2OHKmZdCm7SzhjTSWjRUWfbgkg/gR+MsFlioWX9gywIDyuQpusVb7NJlp8MQp
	mlTnw60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOsX-00000007lNA-17SF;
	Wed, 09 Jul 2025 07:06:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVa-00000007h7r-1c1f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso3080389f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043341; x=1752648141; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPajqmnoVcOjf6GJbUpVo6oCGjF8nwoS+qUy5dwCIhQ=;
        b=CXzovq3ECN/YZ5tzne8gtDLpIGUP7PhAOTj+TjTPXgv507pqM4V8BM4W8JEhndZ160
         Pmw+fFSbbm89rGtEF04O6Dt0LOFupfhvZTYss6V42blcYSXZF2Sp+nj0DbnEuudv1iBw
         BQe3WtyiBlZqQV6en+Yh+6u4l6ajhnSxautwHXy4RMWp2Gp580OlZWDx0K5GAe5n66ik
         ix66BE3+F4hVpApFZ0JpQd4pAMzQV8+L/LTROJcEWFPwlNcCUyFuRuWXVL+xxSG2Ft17
         8eCyflMH57tfTBH2ijWOClaDt/tfktztqPqyCy/4h5qy/fBQ/6AwL/TkY8owjuRX/cZk
         ZU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043341; x=1752648141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPajqmnoVcOjf6GJbUpVo6oCGjF8nwoS+qUy5dwCIhQ=;
        b=FTQbRECJ34LbtjTMY6R1t/4AlblFMrhOQJmepHAVclCKBHoac2Uw6NF9Jt9DmOSv8k
         4nj4ERIL1a3XrtVLtPepek3/QU3LQ0uQANyaFwLpwTqhJloaRuUVUWKza+qNyUq0t74m
         eEyqxD06+wRFwVSH43Y9jgalYtT4+7wAbuL5G2gXg9WdmG8l9Jvw2UqAm4BpGFAe48bN
         VTIg9F84v2WX1prgcSdN0lN0yCHx0j1ndK5wOB4KRmxRMTxUvc42L4E6lyE/7BrgUP6S
         msrsBz4JdzBUlcRbd/O6xyukHx4xgapa3H9s7xVBCOrcgwvvF+alOUmhm8cA38N8prcO
         QfEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt1UtV/Qo8jNH7AlucLLnYHneHl4+eLt4HNCGsfNBwklCqXNRs152airi6AFTv01hHk5wJ++MZbw+md0IS1kxd@lists.infradead.org
X-Gm-Message-State: AOJu0YwJb+6/q58taCPH0P991ATRBa5TqaQOXmdO8ivy13hxLS6htyPz
	QNOegsa9aVuzLe22OUKOCTnwF3pVa22rVcLv6Ejjnz+N1knx6Hm5pAnAPaS+AeZPxHo=
X-Gm-Gg: ASbGncvdiXvs5fqKCYBQCNIo/KWSbGDxhyHLmpQ9hX8HdU5THOqvSW1rA8q27B+Uojl
	DsvnRbEVueqoAvVUs9zLSb72cZ3MT+/TSk7BttH+oQloJ7tvgG95Pw7OmjJIa/pb3RlOkoMnDh/
	vcezBK2pjRVjFp/4bYbG5f7PGRz1LxltZurMj17wTlPVqn6GZyNqSzCBUSXzAOhFyqNK8hHGq5X
	Qhn019rsMOFRlhfBZh0qoXB5voAhJ4PIJuzpR0e6qyBhpdw2P1eVXMpq4y1QzZdJsSS6Nlyydnn
	GdOvlTm+O56+sXtbIf03eTBEK4GZvUTHWiiQuPknZlIdisNRVZbRlpIK
X-Google-Smtp-Source: AGHT+IGMHhoztNYKIZ5oHKCKAHb3C+v1doyNHaPZOSvkM7RRVSuWIdbNbZkjhphe7LL0RVfSh//MsA==
X-Received: by 2002:a05:6000:2906:b0:3a6:cfca:efee with SMTP id ffacd0b85a97d-3b5e44e9d0dmr818341f8f.17.1752043340903;
        Tue, 08 Jul 2025 23:42:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:43 +0200
Subject: [PATCH 06/19] gpio: wm831x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-6-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZvYcaTtEfjxQ69P8FnA0QAOdbNIxX/hy83mA73NmJoY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9BQ4M2+iQs3KKvACwXJ3ypQyhfL+QAdze1C
 OUY6jjRdlqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQQAKCRARpy6gFHHX
 ctrtEACDMUdvvc4i3fLYnwLbi9aSVX8DAfUufWN3epdDbOyN3oJBjVCOFFmYAuUfLpbpxZnBmgH
 OzJRRerQHoPAIEuZgohfWhTndH/+jyGBldsQCOvVHpYSFIG9g367VsnuNaumo1h6lyqRkpq8K1G
 TgGYPYZbb6N8u8pgTFG+kXDg7GejCYx4N4cUDRSLENYQOy/MUykMbCZEpHWq5xczZQklKbz5c2L
 1XBpYDbqHhAUBv694Hlq2F1Zaky+1d7+cc/9rYCiDUrV/02v08stEA35DtLzpTF94v+2IqsRKKo
 vhgdwycPLz5j1CabjFpVFoNgearY05QBAeqFXQGKPfMOEwazIM+8cdrTrb7YE3XBCV3lMIdnMhi
 T88CHyHnIRkjDINYqdxa6eJkejvmr83WHJZZYzuAMJbShclP2oSwVmg8tpCT2DK6DLiZEq5dfTm
 RQBGiCXbIcPkrP3HvRL1Rwo8W8CAZ6AXbs1pSR9Ha4yhqQETfBIauKv0OkPuS2ZNlw0LkEzQpkv
 y7l1ug0x2lBGfCnFlMg29c0OqlKBNpuIOWWAdBfBPk55WirlxQlMtibE2q7ROqOjHaObYBwvVvb
 40gdgZi7r994zj/UXGV8XbLhkalavuRfwoWEU+PJcNQD4lxCQJsusBPDSdFUJPWw9Jd5TJALc7o
 PRcAM5yVfcH0hsw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234222_427267_EE5B6198 
X-CRM114-Status: GOOD (  13.07  )
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
 drivers/gpio/gpio-wm831x.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 61bb83a1e8ae4de29c57066944ce25beacdb454c..ab58aa7c0b9965ff13ea82efa22dbf6fa5d06c92 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -58,13 +58,14 @@ static int wm831x_gpio_get(struct gpio_chip *chip, unsigned offset)
 		return 0;
 }
 
-static void wm831x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int wm831x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
 
-	wm831x_set_bits(wm831x, WM831X_GPIO_LEVEL, 1 << offset,
-			value << offset);
+	return wm831x_set_bits(wm831x, WM831X_GPIO_LEVEL, 1 << offset,
+			       value << offset);
 }
 
 static int wm831x_gpio_direction_out(struct gpio_chip *chip,
@@ -85,9 +86,7 @@ static int wm831x_gpio_direction_out(struct gpio_chip *chip,
 		return ret;
 
 	/* Can only set GPIO state once it's in output mode */
-	wm831x_gpio_set(chip, offset, value);
-
-	return 0;
+	return wm831x_gpio_set(chip, offset, value);
 }
 
 static int wm831x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
@@ -254,7 +253,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= wm831x_gpio_direction_in,
 	.get			= wm831x_gpio_get,
 	.direction_output	= wm831x_gpio_direction_out,
-	.set			= wm831x_gpio_set,
+	.set_rv			= wm831x_gpio_set,
 	.to_irq			= wm831x_gpio_to_irq,
 	.set_config		= wm831x_set_config,
 	.dbg_show		= wm831x_gpio_dbg_show,

-- 
2.48.1


