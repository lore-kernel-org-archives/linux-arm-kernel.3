Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A538BCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ImRGRn+Fhpb0WqEiONhradFoxfKocbbhNboCMBAjm1U=; b=h6awjeNWS+/x9qdBM8/Wbmt/BH
	0ovA803C1F2x107yW3Yuy4cw/Fi6l8ZTDKZwn6rOXKccbQJlEvi0307NXdwYLCCFg6/5CJ92wi8cp
	6AAHMmsslDIAdn4wUsYKuab+/8bGn4c0NKrsB5lFscSAB9j8EzJJyBMTjQ4XE+pPX7aFauQpk0lt8
	pbKl7lqhZkdFSV/6eWutUSOT7jAX5MEalHjN3/86xcvo5yaPSZqVBAqMwB8wMP79Eh3zMjPDIviNb
	w33t59p/yojUqt/c/FRrDkgbDwWeuiKZp5gZp60Ff+QQf5VX9gAnAjx6xa6e5AC1Ebc4+ngSRPdBx
	YpzrfyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUXi-00000005Dpo-2RM0;
	Thu, 28 May 2026 06:48:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUXf-00000005Dp4-2opI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:48:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4908b92904fso5179705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 23:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779950910; x=1780555710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ImRGRn+Fhpb0WqEiONhradFoxfKocbbhNboCMBAjm1U=;
        b=houxzhfr2/KqR+P3d8QLC8fZV194ovuRAcziZqmanIgiEaCNvdSY64TGdoPjffGQX1
         JNgNJZT1uePmQX+YGYGVeyUyPz+0lcLDAdOHtl3GPF2BWMJazY6uoTS7FNjwBH837p3V
         9TCC5NlO2XQzqnyTWP/jxJtuuphEpDPbyXHdvA2JcD5uyibmVEJPmrbGyliQF57NPnxG
         TcWJEtpo2oJDPTyz2EgYUkyOt8EY+Hg79C2aKsxDWB38VERuggUkTfmY7be03TCYPnHC
         iaXWnKcpAiHXjz9aOdIgT/5W4SW63vyDgfwQthtrDeXWE8gWtQc/b44orO7S8EAEYF2x
         HN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950910; x=1780555710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImRGRn+Fhpb0WqEiONhradFoxfKocbbhNboCMBAjm1U=;
        b=DZXx1pCd0LLo2oLa2WoXHh7BDEsXbCCw2OY3PKwTguC1TzGajidK05Ihoj2k6pPOGi
         Yr3Ycqddr1e9gleYLk5eRS+ApPT813l0R2jQvoF0l173mIfQz0zbgO1xa9oZYoEhQ1bu
         c//VxnrZmvMVpjXF7O94zWIGyo/76QnptW67vfVM3e3uKALCRVdbFqRdpX53oYHZmTGU
         8LTuh/MTvffM9EVEh9SB7Yx4PA8l49T/sH8ki1tqtNA94eIxgJ7tCYk2zUYkqlM/fx2a
         dbrndp7R+nzD9olFUkAy8lscr+xL1QDcoWe7Efex8iMw9hlg5TFFiGt5OVO7CReodi/v
         dchQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kZgmYscxIb7k+BvU9fAwvphui4gLNUdwJw+zJULveOvA1fkZmnrk3bm3BRTG+AMqeF/CbncxcslNjVl2moleL@lists.infradead.org
X-Gm-Message-State: AOJu0YxfSOZZL1CuEexpCyc2F6x+9NFtgzdeG1WykxGAkej0IqN7bbNo
	mcpXYug4FouIYLLhaDvUERcb13aHCku6tc7Yn0Bw0K9fCqtgX0LBsqnb9AgufmtE1wE=
X-Gm-Gg: Acq92OEQrKQBwx1H297YRkkbGjvE0GxoCTvh3hRTsf0BnHLlw7Cy72EXtVs2WCV6cI0
	HVbSvbWxRy1RPy5Zu1u284eO0rcSB/S3CszpQ8IQWvBL0/wB8rvTDxqhi9IrzsrWXnCm42iej+X
	yu2zikv20cxYv6XQLGm9mMHltJnM5dn3zcW1K7NLkJGpXlTJqfA4S70aLpBJ177pUOg8JHJTgzT
	CpPDHaySjUWKdJUu8q5AT2cRGZ8bd3EYG70HZ90jUpU3YYq5GO/yNMPc4MHKjnXM48HHvlR3POK
	gukzdOjvHECiLTdaQHOHaVmm6ENZo0XP8AMDrip3m9JWa/DxR9TTUxTGlxMQgWm1NY2OsrDUiJ3
	mszpjjM/AigIGggsY066aeTzgFK3FQrUDG862yeNYFAkmNLadClIlc/5GavrTHjAlAVI4ksLsly
	Uew1O3o5J3v8GOaGrfiLrtqoLiV5M3cCEjsnbY/p46xbhcmsrje+PVYCmIUNlyoJhO1JYJsnW9q
	DYy4Wjs0+Z9a8Ibv8bEhSGtYQ==
X-Received: by 2002:a05:600c:6995:b0:490:482c:4384 with SMTP id 5b1f17b1804b1-490482c44ddmr429872215e9.24.1779950909709;
        Wed, 27 May 2026 23:48:29 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4908d80952asm13777795e9.1.2026.05.27.23.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:48:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Karel Balej <balejk@matfyz.cz>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v1 0/3] rtc: Use named initializers for platform_device_id arrays
Date: Thu, 28 May 2026 08:48:09 +0200
Message-ID: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2956; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ctSZqEB1mlU+XvYe9FpEXZw3i6PMNlg9mOrPLqs/9M4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqF+Up8pYbtZoUCw3r8+fOJGekG5PZPwptdY0eL tFdqigjF+OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahflKQAKCRCPgPtYfRL+ TjgYCAChrHD2kpobkQDS/kOb03ZK4sw2ENh4cFJRBLYOasAIuMF3//D2JUL2ZbhP6+lWhluNIn0 ezNtZga4/I3VHz4htYqJ88jImRuMyg8IiWCGrVoEESkPCftK4VlmnStBfSm5b5mBjSdOz9YTcqm ucxuQ548hWFvNdEw9T2W/1NND6t3KJbrRntNSQMDvkOM6Z2kpas4+wLMBWN0xK6IX1mkWUV1zNP wucjVeqV3zSbA1ROQEw1dSTomgIW6qg6vXbkKx66Yl9O+Ew6aBOPnYbET8HgyuX7pRy6s57sbjC WUAPAlIvVPAhOrsmeSO8svYa2NisfNk0lzzlqth0+Tm4g7Iz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_234831_736630_E804A64D 
X-CRM114-Status: GOOD (  17.94  )
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

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. A possible follow-up change is the following example:

	diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
	index 375565a3bddf..31b641bd8962 100644
	--- a/drivers/rtc/rtc-max77686.c
	+++ b/drivers/rtc/rtc-max77686.c
	@@ -760,8 +760,7 @@ static int max77686_rtc_probe(struct platform_device *pdev)
	 
		mutex_init(&info->lock);
		info->dev = &pdev->dev;
	-	info->drv_data = (const struct max77686_rtc_driver_data *)
	-		id->driver_data;
	+	info->drv_data = id->driver_data_ptr;
	 
		ret = max77686_init_rtc_regmap(info);
		if (ret < 0)
	@@ -866,10 +865,10 @@ static SIMPLE_DEV_PM_OPS(max77686_rtc_pm_ops,
				 max77686_rtc_suspend, max77686_rtc_resume);
	 
	 static const struct platform_device_id rtc_id[] = {
	-	{ .name = "max77686-rtc", .driver_data = (kernel_ulong_t)&max77686_drv_data },
	-	{ .name = "max77802-rtc", .driver_data = (kernel_ulong_t)&max77802_drv_data },
	-	{ .name = "max77620-rtc", .driver_data = (kernel_ulong_t)&max77620_drv_data },
	-	{ .name = "max77714-rtc", .driver_data = (kernel_ulong_t)&max77714_drv_data },
	+	{ .name = "max77686-rtc", .driver_data_ptr = &max77686_drv_data },
	+	{ .name = "max77802-rtc", .driver_data_ptr = &max77802_drv_data },
	+	{ .name = "max77620-rtc", .driver_data_ptr = &max77620_drv_data },
	+	{ .name = "max77714-rtc", .driver_data_ptr = &max77714_drv_data },
		{ }
	 };
	 MODULE_DEVICE_TABLE(platform, rtc_id);

increasing readability due to less casting which also improves type safety.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  rtc: Drop unused assignment of platform_device_id driver data
  rtc: ab8500: Simplify driver_data handling
  rtc: Use named initializers for platform_device_id arrays

 drivers/rtc/rtc-88pm886.c  |  2 +-
 drivers/rtc/rtc-ab8500.c   |  5 ++---
 drivers/rtc/rtc-bd70528.c  |  8 ++++----
 drivers/rtc/rtc-cros-ec.c  |  4 ++--
 drivers/rtc/rtc-max77686.c | 10 +++++-----
 drivers/rtc/rtc-max8997.c  |  4 ++--
 drivers/rtc/rtc-max8998.c  |  4 ++--
 drivers/rtc/rtc-s5m.c      | 12 ++++++------
 drivers/rtc/rtc-tps6594.c  |  4 ++--
 9 files changed, 26 insertions(+), 27 deletions(-)


base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
-- 
2.47.3


