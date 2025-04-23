Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7BAC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jpIbuhGqJno2oGiD2+OmhnBmP+B6R6TyA8FsjUZXAA=; b=ARHd6FC/J5xTzhxOH5g4VZQkx/
	BMCYgbArwpDQnLMl4LtajY6WoAIHuupBgd2vADh0rmk/ZG3Pb3SWtAnTYi2S9qehmnM7F34JqwuSF
	r4I72U2ZvLA0lPHOdgovSb3dqBXBCTzTVFnh4zC8VSsGr60Y1X95oAPcvaqnKXlPdTEdNruWlWUem
	mTPlF/FpVw7Ylk4gcTDZr6licNiKT7yDi82lsjOlb+KGsYaUnVijRACZVJbI6zocvQ2GORo40eROq
	nAJNsIhLVP/fGFovPJoxzwYTSR1htJugnPIe7lPUm1jtz60I9YEn71GTTOMUbNbyALG8A1iqORnNK
	7uQaeXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UUG-00000009VZ4-3m7N;
	Wed, 23 Apr 2025 07:25:40 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKF-00000009TTj-3OXi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:21 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39bf44be22fso4156599f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392518; x=1745997318; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jpIbuhGqJno2oGiD2+OmhnBmP+B6R6TyA8FsjUZXAA=;
        b=aEehY63QZKMrBKpXQry+EmRXFsPCvxcf6SXei4uC3yx0mXk80V/swXCRyVzH8JsP6A
         uhq5Gu+GwwQ7jaX8a2i68hS3hlpxQi9gNdV1W/GfmBs4+USu/6p5bA/TF0lunSN9Lloo
         +uCZVD5LOORNsXcmDkpAWIveDBNHTXcB4rV9IbZmQteBMTa8BubUfmnNUfOwodRpozCA
         zuIa37NmHlxLVj35d7bPk8FqJjXJWODzjYmy9UEtnXdSfdzPBLn+aBhPbjkeM0TSLGzH
         oEw8ZFVhebl8JU0igu/+iTeTYxkjwErn4aKKnCiFEDInUgATxJKvnqwLaPUC/gQCNV49
         xHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392518; x=1745997318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jpIbuhGqJno2oGiD2+OmhnBmP+B6R6TyA8FsjUZXAA=;
        b=cp7B5G48HY6QqNnll7O0AlXIYaf1B4yPW2A8DBqFB/D5oVDRCk7WeFpFhYb+SWAYt7
         22C8UOWsg69Nb5GudsdE/7Spk+2PABJffWEh9OuppYPtUraj7NJuCroHxflxbO1EE4aR
         VAvH6iin4ChQHvf+w4bwWZdVR+OdvW0QnkJfsxFmObWEELubs6x8lOEF6HqZFn4ZtsqZ
         s+LmPkUL63toUKvA5bq0odyFqll+uBlBJYYAkCNkYZ2VOYTaR3kNI/2ngSPN4W4HuCcL
         zNVzUuryMS4Tb6MmCLxIqLzaOOY6p/Hco/bHqlUuCreb+g/7iRBDs6C2CE9uFPG4MZoO
         T/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCW/tqKhS31PSlgmz1jaOXm/xlkWbikarisqZEfsyP2Qu8ArP5an0vshOLtSM37zaf72PuFFUXJINgw88KxypQPa@lists.infradead.org
X-Gm-Message-State: AOJu0YyQoChU5Ndap12VRUr/YBoxCLwa+ZuUEly1bvuGwfqsSA8Pyz5a
	6aq/Ui9LYBwjgNAYIjPvM6SLzP9x5uFZ/w2UE0CZ1P3Yd/nod6WoPhg0iB9yqrM=
X-Gm-Gg: ASbGncu2tHy39pYR5NpPeqD5vLkPGuTD1n4B4Asm/zzWyElw43xKkGpC73UDQ8yevs7
	iF3eU2hxEiLAhTgMXHO1iKdrQUchpSQB9PW9vouqbD19NCl6rNoE1+8DQsh28oDcDYwMMIjRhsc
	nHxn3TPAndu8MjwtlhY7BUakR7d4gGD+89HlMCQyZ5vAfeAkB1u7eR1zYbqdBqhCw2UjlT0MrAu
	WIfeEYvnnKTKhnqbR/xtSSi1/UJgmU6pJi395HZ3AODKaDhC8vv9oUcHxQj+6kjFBkir9z8Xlbr
	HGwf3IE+NhchqOMBr9fe4FwaaWrpyFurZg==
X-Google-Smtp-Source: AGHT+IGnUpS9ou6nffd7s4SVUQaTSNl4pQx4m4r5Zz5uifmJEfnPn7s/u9+lgkiPgaAvunq1Xc6dfA==
X-Received: by 2002:a05:6000:4310:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39efba5b778mr13229816f8f.30.1745392518529;
        Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:04 +0200
Subject: [PATCH 02/12] gpio: imx-scu: use lock guards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-2-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MkOnT4yNUZeyHThpCK5EaJBEstX46Cy8bj/Sje8L+og=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOBKq6/ZTVbZPDWRuhYrH8TZUsVagJXdkY5i
 QrnwxvwAYeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 ckEeD/9l4SbUhQKoQaEIERaYqDCzXTHhqB5KuenMgC5r/g5sYiqxqQjudVfEJavtD4haF+6aS9o
 xBIvX9GLhKUl5ZIikmZsrdlMshgyIY28XvfD/BydQE7ZJUgLGaEW4ZjytZz1E/tb5W1O/0WR0NY
 hshNdM49zRWRWZX1Nj4xFECkTnuriQt6vmLJPjpTRc9vO6lI6hRu44vwjuC1+TrsGWo8E6drr5H
 shZ1C+A2LYp6h2edfZQsuuJb5IDheLLXrvKO4LqnN15DZFRU6Y6wTy/WreZUw6PZm7I0cUftKdc
 0ScZ/KPtiTI0XPv3J5Q/skCvJBb8trn1KYQCEEo4Mr2kmHiKvQbTocvrnd9vHZm6iiCV9DUqHgE
 tZMYBL/xY6sxHdGwez2RZp3AwIv45VDRo9qEEPgDwPAjZSPISB9pOVdqLbIcTQqz4dAWvTiPBb2
 tlYO46y6cpcw+IgSpYcXNJJR69S76gYbbfqTlXnIbrvHyPBN/aFH/dMKoKT5FPIz1PhwVILoE2Y
 6dyGGas9foRrvCR4ndO+4uzKrs8XDjvws3vVumzhIUtsJ0W7NHvpiVOHfg7OW3efAMUSP8oyphB
 byaiS/R0pIxiZ+DHEKog1C2cE0qzDut0dyfGx+V+wagrqQ3BRdYAo1aT06StAe6hSgK/ej4OGdU
 +WVTqdlbOWnq5cw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001519_856705_4F250D7F 
X-CRM114-Status: GOOD (  11.95  )
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

Simplify the code by using lock guards from cleanup.h with the driver's
mutex.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 403d03f18122..99df95e65820 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -6,8 +6,10 @@
  * to control the PIN resources on SCU domain.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/firmware/imx/svc/rm.h>
@@ -37,13 +39,11 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	int level;
 	int err;
 
-	mutex_lock(&priv->lock);
-
-	/* to read PIN state via scu api */
-	err = imx_sc_misc_get_control(priv->handle,
-			scu_rsrc_arr[offset], 0, &level);
-	mutex_unlock(&priv->lock);
-
+	scoped_guard(mutex, &priv->lock) {
+		/* to read PIN state via scu api */
+		err = imx_sc_misc_get_control(priv->handle,
+					      scu_rsrc_arr[offset], 0, &level);
+	}
 	if (err) {
 		dev_err(priv->dev, "SCU get failed: %d\n", err);
 		return err;
@@ -57,13 +57,11 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
 
-	mutex_lock(&priv->lock);
-
-	/* to set PIN output level via scu api */
-	err = imx_sc_misc_set_control(priv->handle,
-			scu_rsrc_arr[offset], 0, value);
-	mutex_unlock(&priv->lock);
-
+	scoped_guard(mutex, &priv->lock) {
+		/* to set PIN output level via scu api */
+		err = imx_sc_misc_set_control(priv->handle,
+					      scu_rsrc_arr[offset], 0, value);
+	}
 	if (err)
 		dev_err(priv->dev, "SCU set (%d) failed: %d\n",
 				scu_rsrc_arr[offset], err);

-- 
2.45.2


