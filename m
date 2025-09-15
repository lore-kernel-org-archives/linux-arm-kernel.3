Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B68CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4gC48CuIPVAUpIaPPbdHqCEynXZPl0UGj9pzUZ/ahgw=; b=R3X5GvBv0ssK3X3dKKRdcmkJqz
	gg5gOl7rMpK09Za4emTSgP05f/Rb0h88Cu82ooP4hmYKqht7hELEoxrwL6p+NHOHT7KVbU+ixOYKE
	ylU1g5ShdeKZ2T1RrnkEoFCJlbtO6UFayIFyBsS7xjkwl5OH2zuUXQfni2fhOSMEKOa48ikq5P3Ry
	wsTZy6itXJkk9ZI0NEa/tfTS89QqNQDyAAYR2+Wl3lZcXDmJ5neuO5FZn/7Fripf9mO+drDihs9AP
	HjSv42aUGqqzYhjqO0KN7OfJupDjFYrfrl0cf8AygKNFhzeYVgqxDcpAbnPmfTpOSk+PH1qoCWc3j
	VNbPHExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5E2-00000003NhP-1M7r;
	Mon, 15 Sep 2025 09:10:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5Dz-00000003Nh3-3Rjd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:10:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3ea7af25f42so533453f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757927413; x=1758532213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gC48CuIPVAUpIaPPbdHqCEynXZPl0UGj9pzUZ/ahgw=;
        b=cQfF54tYU0twRyHy4fWd7rXL9aIV5xnEKJf4CGjw3xdQQ1czJq6O0TN55HZ4bOgWul
         MJ8ymxkNqcgrL7SA+a4L+wXZDg4sLRc47I4yQ4hNCZmsdffYEvhBKHGn/naoOyOSM9ka
         nAWp7m4Du/sTvK7nEV4jNFMs0RfmnImlaBz3PuTdxCpOp9pRbUmvqdISsIkGYWhQSAAv
         PRoi9KjYwUwJFW/3kYpSADca+SyOBQmxhm/8ENLiw+3H9wMfOaAwOPy8rS6ZDM7T/UTA
         WYRuxrat0HaTL5zDoYniwlN2DEh3Xcc8g5h6dW0R05oHxef5hacNSZieWoMZWKm0IegJ
         UR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757927413; x=1758532213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gC48CuIPVAUpIaPPbdHqCEynXZPl0UGj9pzUZ/ahgw=;
        b=c5NuehuyP8B3M4mpgwpJHImiDxYs9OKlTToZd5tYUYKJHy76Jg9g4rsLI3m+wNFlb/
         lm/VYTuEOCV3+sVQQ/NuPFnYruH/UjeJ1JiP5n/Si/D3KTPYSYqnVKAr0OMrPIfxJxcD
         98vhetpc8e3Ja9yVWJQkVq4IoroYGzdJvvB47PvBB6B2qBuvdJBpphjYQ6OZzejT79Aw
         QtIwlqg5cAW2JM/VKd5yFfvXAKqdtFuKB+St0/lh2lPL9zSRIrvOpfHtqoeX4ArsNJyK
         q3BynMg4F5pTFkDJB42+j8zRt4SBgwHTdCmx92yx/9UfJLe37mLSxB2fbX4wzKIb2+he
         1ClQ==
X-Gm-Message-State: AOJu0YzbQlCCgULnsvE4MDa3OIgoNU1fZOZcZexWshrgLmzOnpr2i+w6
	i/gDUiyQjZsTMg8sqfnV/37HSVBAYhOrGw/KFNGgx5FOIwZ2l5h0dkazPRBKEA5Q6Ts=
X-Gm-Gg: ASbGncu1kTvTyCBI73vR5o/me7g+RGdlT4O4fEeShG30EO5Vg5vUC+UHjyhizpRr3O/
	q+4xYWXRzCYl1TNYD+nHtUhwMkleTUJWRn8+CohEa8fSrVCbmcb5gxMOAhkg3fy6nu8clIeV2TW
	i4WxZwlJ39RaiSGIA0sqEmM/a/VIn3W8LpT0DkuMoZItnQ3F7PYAUY7VZZx86kx1BNVw+QNeOyS
	6zhnB21qj3yJAcvwS/10/0wyz2Ricly+Rdl3cIPwqk3f1KmPSaiGuMaRXsXaTrgHIpUNG8puFcD
	uRL1oaRXTqIzCjFTJf4dc0JZyWu7l8vzSoqQGxB7XHXb809HG/aZCoDozFUWKB0QHIYb6wDB+Aw
	R/gTULSWIrwfB+JbA8KlrbUc=
X-Google-Smtp-Source: AGHT+IF8U9aFuvgybHAns+BSiaqZ/+CjA5sBe4WvlLdR4faa+ocFyZhcYRT82b5ZorzzOtUHEBT2UQ==
X-Received: by 2002:a05:6000:430c:b0:3e9:d34c:17a0 with SMTP id ffacd0b85a97d-3e9d34c1a24mr3494142f8f.34.1757927413116;
        Mon, 15 Sep 2025 02:10:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7ea7:8025:6711:b617])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e04cf2870sm90201145e9.1.2025.09.15.02.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:10:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: nomadik: fix the debugfs helper stub
Date: Mon, 15 Sep 2025 11:10:07 +0200
Message-ID: <20250915091007.28438-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_021016_101524_412101DC 
X-CRM114-Status: GOOD (  12.43  )
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

Commit ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers
in debugfs callbacks") failed to also update the stub of the debugfs
helper for !CONFIG_DEBUG_FS. Fix the resulting build failure.

Fixes: ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509132232.12viPUPB-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/gpio-nomadik.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/gpio/gpio-nomadik.h b/include/linux/gpio/gpio-nomadik.h
index 7ba53b499e16..592a774a53cd 100644
--- a/include/linux/gpio/gpio-nomadik.h
+++ b/include/linux/gpio/gpio-nomadik.h
@@ -268,8 +268,7 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 static inline void nmk_gpio_dbg_show_one(struct seq_file *s,
 					 struct pinctrl_dev *pctldev,
 					 struct gpio_chip *chip,
-					 unsigned int offset,
-					 unsigned int gpio)
+					 unsigned int offset)
 {
 }
 
-- 
2.48.1


