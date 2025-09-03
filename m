Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A73CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SorLujCi/8VwUy2DiiZuGVeG0//OIQh6/vMrgqY4imo=; b=GGGTYwY+TcIVPkosymTaUbt3HM
	acPpQ5DzDqMp3RQZAgwkk0LU0m1qw1pl8cte7xPykDMevw789c8zG1mwZaWuynVKmuUk/pmtzTdpU
	5L21NYDO/BPhxfe5yCnwKMjHReYSg2X+zI+/ot1rYSSS1kH5kRpfzQMa/2w0KLjCRuzKQ4yPGFBfd
	Jk5UE1D96xmLy0DA2jECxGA8NRNfzb9+fTOhXG511l9T0wI6HkYQqUyQChiG8i2LglqnAoKPbL8Rj
	IdiOfZc56f4PI9h4YBx8FcY46w2jbQbZ19fvKASFCL823SDJwg458YoK6HDK7AKXzemXBl+MQYnch
	TqRVV/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqrm-000000077nB-26v3;
	Wed, 03 Sep 2025 17:01:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnOG-00000006Yvs-1OZ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:19:09 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3d1bf79d758so3498679f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756905547; x=1757510347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SorLujCi/8VwUy2DiiZuGVeG0//OIQh6/vMrgqY4imo=;
        b=kxMIOlUj8t7atEKRjmexUKfhc/UqMBJCDknvxGVIol8YTbwdW9KrFilm6GfiVoZAnR
         VDII1oHsEhxiBRZ+mTUZjH+RdSBsHY6Y/wpbXI5V1+WWxLbDzuF3nl/ZEy8/H2HT1XGE
         1zCQgw3gm7wOVmEXdxH7TTqktfQ+HtSSXWxkZN35wnpStSAZDxThAw1b5QR31JN2BMQw
         duEHGKFSlpP6P0GxDJ8uVpIue44dh7sBH+OXvA8dQgn/exkKeI7kVsxZCsgjfWuKhtnV
         bqZJwuSdUr4ikSpOl7rvakjrUfasS6PZY41cc0gUWm/dKvbp+5hsTF0FXXChZzDgSl+o
         7vAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756905547; x=1757510347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SorLujCi/8VwUy2DiiZuGVeG0//OIQh6/vMrgqY4imo=;
        b=m5JVli2baAD94PgqA9XesBwP2g8Ja58RwAk3qoi0/R26kg2M3hKFjbMeWdSzIJHGNO
         cufkZHjmieSO5io4UzYl7Kk6QJgd4skbXtpUcBN0D3GRt9MkisA2+MytsHGSLO0+OT87
         boe7c+ERQm6gD1CeLZnXCOCHtNYVNGm/MWseZBYvPBht0ug4U8MEpvqSSUOgvmXgj8PM
         yZXbwHwIpCY0AoK4TEKwPbqrOTZRhJQJz/jb/zZNbasdUHFTBsSrkwzrG1HRaOfgFPAT
         IgcAmOS8PIQl++2ORqdZ2Qa76h5SpKWBCGKaoMW5QP48AuQYWSO7s3zAbp9bXA6JSu+N
         wOvg==
X-Gm-Message-State: AOJu0Yyd+Cwgc9Jorj8g/tlBgwcZgwC+vmjiDOoUQ9/7kR8nFRopRxJy
	uYIAwmH7gjFARunnprQwDCzOS1cwmGxQ2/YTYpoO2WqkQGgvSmfAoHzkMJH9JcompGo=
X-Gm-Gg: ASbGncsQnkc0dtksQ7sXoh4Hksd3C/Rfcs0+enxUbDIq99uccPM0CtLj0OFKZgIho4a
	V+mjrdH2E+0zeSNCkvxGD9Jj18UIpOl3XXze2ZicWY7TFkpPYocdMmtQmj+t/oNn0zeGVOHQQcO
	2otHPmbscLHGE3WaOXUgr2/+5GQkt7g82AaDNHHPsy10RJs5pAuNCoDwR/XMiQOm0Ik+jJbBPkb
	d7+/ktm2MF8bxOt6Jht1unS/gK+xXUMzu1FCM8bhOvmqAyNzSVM6HN+wHhr7kYVf8Q4Wr6ClVLT
	KV6kq0CAYchTmCV+Z5ueRZ/2vr3KZ9Stxkp6Dntfjlxoq1Mh5RbmPWQylyrZP3NSZlEIy7doQcj
	QEPUHKDrh9bjVzgZ3Ear/PiTmFG6WOrVKhCE=
X-Google-Smtp-Source: AGHT+IGknUG6HgigUOQWTunTcwtIb0WJ5XnoTsT77lsG/WciW3ylo6pBLCzcVEAz8Ytw/rgRDnZgiA==
X-Received: by 2002:a05:6000:2911:b0:3ce:f0a5:d597 with SMTP id ffacd0b85a97d-3d1e04bd373mr13481486f8f.47.1756905546669;
        Wed, 03 Sep 2025 06:19:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm239486025e9.3.2025.09.03.06.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:19:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: nomadik: wrap a local variable in a necessary ifdef
Date: Wed,  3 Sep 2025 15:19:03 +0200
Message-ID: <20250903131903.95100-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_061908_381192_EBD27619 
X-CRM114-Status: GOOD (  11.14  )
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

The 'desc' local variable in nmk_gpio_dbg_show_one() is now only used
with CONFIG_PINCTRL_NOMADIK enabled so wrap its declaration with an
appropriate ifdef.

Fixes: ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509032125.nXBcPuaf-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-nomadik.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index fde4b416faa8..97c5cd33279d 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -400,7 +400,9 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 			   struct gpio_chip *chip, unsigned int offset)
 {
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
+#ifdef CONFIG_PINCTRL_NOMADIK
 	struct gpio_desc *desc;
+#endif
 	int mode;
 	bool is_out;
 	bool data_out;
-- 
2.48.1


