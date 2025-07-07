Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD36C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKIG6360x9EOzMXFyVuOt0+qxmmOCbAUWOq9FvMmdEc=; b=P89HmDbdmhWaSSeG/zbUNitlap
	5MSF2DVBWn7lIa8z5mlqckrm95P6DqpVL0junra5qmy8OISK9ogq8gdoPlOmkkDOR7TC4jyL/oyL0
	EUqgBxBxI6UEvf4S5N26OM+nkFDeMd29S6/cyTe01yeJVKLRwp80ocqjboZ3SfFcEPUPYTZW3739h
	tUZbM3hhWYTDuNTkVqKUl87Rprkpicr/KXxeiO8CLZ5/3Hg/5oTpquLJDf0Mt50dhTpk8lMJfq+yB
	JYty2ZPyKb7Ej/AEbH4QGKF4VgT55FtwGGmJYtBMkowiX2l7uo4EUcAuZCj/SxtgBi/eJlzNkAsKz
	WwOoxWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhXm-00000001tWV-1SzF;
	Mon, 07 Jul 2025 08:49:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcS-00000001kLD-2SHQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a54700a463so1407236f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874631; x=1752479431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKIG6360x9EOzMXFyVuOt0+qxmmOCbAUWOq9FvMmdEc=;
        b=0jKMD8uqW6afjoGSlrYli0SiHoarHdnrzzM7Vosl3uj/VUkAaVYXUwlDnB+4YPjAN8
         K0OjxmPoNWj218VmMBe5/dbuXsvWZ1W1PDsQBbvrwyehojWlimMZ5dFP+oj+sVXxxFxn
         Jr+CgGM+5UTMWXnfhhQSJkkktoke8OddP3BhyurUJjG10uXkg9ERUnG5bEpMxCDO8L+x
         Kfg4/l7dFui23Lfx12gAfhe7oVmETEsKShLKUEmFOn7DAeW5YYtGbvWbzBvYjUgBSCRY
         FXLxsDk+yREoatYZD/oj9LEAXYue2NfDefo2cqw5cmihEt7zktnQ0mSSp6bZadHTwX7A
         6qzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874631; x=1752479431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKIG6360x9EOzMXFyVuOt0+qxmmOCbAUWOq9FvMmdEc=;
        b=R3TBTn9U5oFfa9L/zZIWOj3GTCDMncaBmhPZ/RRwrW5IOTp0fw+SYmYiTkDS69o72V
         96erkobw2f3JHv0K9nGNwaKmOj/lGft3bV3q07oFZSQQ7MpgIapxzNfgH6yJse+gp458
         UwMnz4Gags3EH1rcjcvbK0EGsdYVlqwY1tE42xSM3KJhyh1JdCDCRVLmjtTLsThnpCF5
         7Tfjgn/gHN6GSicaGhCtcDeUJJ76Y1Ay1fGZv5fMqba+Jh00TuNWbVkAejjjTqvL2IH6
         EP4Ei+BKZRGTAbtbVdps/egI+OQPry/c6FPJ5/XVRMiZ/h04wZo6h9A1GCN2FrfZXwgH
         /hag==
X-Forwarded-Encrypted: i=1; AJvYcCXcUkZiXlzWcVrBXz9AVzFRgw0cNoAFRVpuuaRUUSg8xeMUXvsuyBlZLpq5d6ZiYa6HZ4uwg8ztZcrZmM/uKeWC@lists.infradead.org
X-Gm-Message-State: AOJu0YzD57SpmIdxZo6JHEz8lkbfi06Bumnwh7O0YDUq7k0hgX5ZoZhy
	oaIP3fC5cTXTmb6x39sh4lln9NN0IiBZ7e2Kt1NGwWJGHg/Zmr6XaZkQDw+UMR/xcQo=
X-Gm-Gg: ASbGncti9VER7B1llT/jIq6+e0bY1f9hVkibisLbBaIC/hVoefsV7l1xTj0FFJdM1+g
	b1cWKbwvvyGRjOjCJcK6myY82LFRl8+lXFG5h7YIRDvJIU1suEBdGtEXwkzaddXfUUHFm03qi6o
	JNjdOwxBuxhbl8je8P9tE7Ce/TeZujWIZqwXUztL6KhT2PMKMMc9JyLgbICXa+EHsnLz9YDvKxZ
	IboSGmX4vwiO1tG5OgWmcRjCe9dxWT4ZYeLH0LxDyy76N5J3tEi0P3+aQbIpGBrEa6O6hyv02wQ
	OAWMG0shYG58SxVfldzzJWM/P5FEYcu25Xf8/Ve49gUjQPKk2edGewzJfS7/HorGdBA=
X-Google-Smtp-Source: AGHT+IGnSqLeLz4f4OlYPyWFl1B12Re+pZQxqbUbOij/xJOfJOGrlBFuuxidA355YJED2LEeFyFJGw==
X-Received: by 2002:a05:6000:200c:b0:3b3:9c56:b825 with SMTP id ffacd0b85a97d-3b4955895fbmr9795564f8f.22.1751874631294;
        Mon, 07 Jul 2025 00:50:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:21 +0200
Subject: [PATCH 08/12] gpio: twl6040: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-8-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WdoaTovljRVdfcPXoOOpPCv/dUUU3fxtmp6eCVydmWU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w7TnJ01R7z2+UX47L227yzd8aywcscqE3m4
 m+QNrchCa+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OwAKCRARpy6gFHHX
 chuuEADWLZ0PhkJxuIIyFZpFqaQyNO+F2toxso5+gZ3uWKMxU46ds+vGbE/iA7kMN9669g+9rLZ
 C/K5a6cwcsdBh/kjSJXGC2cFI3B3y2rJgdLl2BdKowgiSFuXKgE1wg9ZtDdFfiMeaGfdzTN8wSd
 1X5x1jmE2/Dq5yPn12l7WoQrILfZMgB60shK9eXFPgFp2iL73Bk/wmah6skSo0ur2g5j3hSd+rV
 wa934N/PjDweLSFnkdaHjmSwTjPEZNPCaHW268ZUda/xhgcE1tR9XjIaSkYJKhmd4ga+Mk13fyp
 IkLIcd+6osDn7hDo/noQL3p5pkJRarD4wQ0pqR8ChCqRLqJb1OURx/Tl/Q7akeXtHetpp1O7rr2
 HbjxlvJ1hewJJg4qSvUsCHcUdrN4aDxpAtIy7TFTz+p4dnVf1WW0SrcJlgxBwjQHkwllrf+FYTc
 8MEiSlKjzg1qw4AGnMIm62hECJHxHyaAU2yjM3ys8p82rajD0BfXUYQqXcGZXV0dLxv6iVbSSwz
 0yq1ZKlyjplFPa9G4x8GUP6XGsN73FRba6S7CRO2yuXeEWR1yCKnudofXyNSdltRl3tn5rAfh/A
 va4XB4TxLbdGZ74JTSeh+UCzg77MjlSMZWwOnku7Y8m5+E+6otkV2Da6/OULGTFs9otJ7Rn+wH+
 tCPE7laRozoAEJA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005032_630549_3510C1A7 
X-CRM114-Status: GOOD (  13.51  )
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
 drivers/gpio/gpio-twl6040.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index b9171bf66168f054e9eddef8417bef6d8f197f3c..b9c0d54d12f43242444f12a2bd8b6988d1511466 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -44,7 +44,8 @@ static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static void twl6040gpo_set(struct gpio_chip *chip, unsigned offset, int value)
+static int twl6040gpo_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct twl6040 *twl6040 = gpiochip_get_data(chip);
 	int ret;
@@ -52,14 +53,14 @@ static void twl6040gpo_set(struct gpio_chip *chip, unsigned offset, int value)
 
 	ret = twl6040_reg_read(twl6040, TWL6040_REG_GPOCTL);
 	if (ret < 0)
-		return;
+		return ret;
 
 	if (value)
 		gpoctl = ret | BIT(offset);
 	else
 		gpoctl = ret & ~BIT(offset);
 
-	twl6040_reg_write(twl6040, TWL6040_REG_GPOCTL, gpoctl);
+	return twl6040_reg_write(twl6040, TWL6040_REG_GPOCTL, gpoctl);
 }
 
 static struct gpio_chip twl6040gpo_chip = {
@@ -68,7 +69,7 @@ static struct gpio_chip twl6040gpo_chip = {
 	.get			= twl6040gpo_get,
 	.direction_output	= twl6040gpo_direction_out,
 	.get_direction		= twl6040gpo_get_direction,
-	.set			= twl6040gpo_set,
+	.set_rv			= twl6040gpo_set,
 	.can_sleep		= true,
 };
 

-- 
2.48.1


