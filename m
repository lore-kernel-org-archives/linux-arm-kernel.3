Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26BCC7114A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGXLWLYyw9ZyCRb8Qq3Tm3IRZiXBZ5znvzTh5cF4+vI=; b=qrfD4kSVWuu3WrlTqKK1W9uXSy
	8cRuVYtCtXj/Z/79tBgoSLzcy6qLNDApz6hvpaArtHLNhG7i7WBG92aFedkaMzKbsLC5k8yAu7ozc
	9f8dnYvYwRqyh6vwkL+UwjUD1zsfxb0I/PqqsfSQLaqEybplssxNe9FocvZXO+PQl0FG89ZumNs1y
	B/23caFjypR18BXiDwOUQULVG5vY57dcQlDrPqKE8JGz23U9WuTfy8tzTN4qO55rMZTJ4RwMgz3aV
	im6KdVmz+KHXP5BkQdSee2Trx1NCmXZUVfkzFR8ysVz7cL7yme7zf/0oV1JHAaPyrKv7mznMIw0gz
	zz5TiWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnB-0000000EE4J-1Ip8;
	Thu, 12 Jun 2025 19:40:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmE-0000000DLjZ-2lgd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-450dd065828so6901415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734129; x=1750338929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGXLWLYyw9ZyCRb8Qq3Tm3IRZiXBZ5znvzTh5cF4+vI=;
        b=MQMNh1cnOkmRXBqB5I7Zog5CJuYW7nE27w6oSvG4F97IE2/Pl/k3dGYwxDNskexu6G
         0k5XoLF25D+biAtE+6O7wMs61HIbyxM6oAWx4DY2cHzsKE4+B23/ySdtLNH2GqcP3JSE
         jqB6vDJbG7SDltL1XmHST8JH/li+WADEeNMG5G7rQH128i5fG+zj81dWMv196PZq6yBt
         f7I6E5NZ1D1HdjquupeWp2UpePOxWyB7DtKCvLEdtunRCxcYVTQMq+LVz4UjkCdKgQ8J
         NcOXHfHkuFNjeRK7C8QSJ1oW5Sbe7kEJdtAIjJtu7DSc3on7H6yqX1YUjd+dtFR9OwhX
         8FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734129; x=1750338929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGXLWLYyw9ZyCRb8Qq3Tm3IRZiXBZ5znvzTh5cF4+vI=;
        b=K1DDyFyqQIQCxCDE2cJtcNYc/q6wGD4S1avE/p0uz3DyzObeUIW2n6HrwmcOPOoEBh
         AuPlg6r6zV7FBlLBsN07xVTvEWHxT3Yv7L8kzO3K4NDpOzrDVz4VMUwvVOOMx9OsCxSk
         MRVYT9CxGtmnTq0XPw+XM1XJxUidspzdQBz07ZrwZ0D4hhIrMtGydY4KcCidRW0p4ssf
         r05E5nL3XYDxi2cYejyyrGvVO7DDXntRs8awYEod4MCkShAX5LBc5HrB1lw3rJW2TP0p
         Rkoy1av3XjuxJBAn89eOM4hHv8xMUg4LufV+4HSo59gz+1PxRttvevil9p60VeCTbMT3
         mSig==
X-Gm-Message-State: AOJu0Yy2bFpvt3v2ua6V3w7m0Lb/w2X5s0B+ysl51XBvJpGdAWYstK8r
	/CRIETfUddl9lf0djYZCJNzSTKaSfQZYZ5KU1qlvGAanK2DZbSzXJ/Bv5YU/IqQ+qfY=
X-Gm-Gg: ASbGncvYqm4XOymuu9WtADVct3reJXk09jYxCaho3k8mT8eP+pW6S8dCA9XKATlqxgU
	AgC2MEh56sj28zuyeC3xabsgzEuF7N5DazufzL6qYgWiYLPF6m9va34tMluk9DrYtejKSzwKTjG
	THcuxT8SepRjekUSNitPcrWtxf6V0eZ2QBjTGtRdFmMuCd9bWq+m6G5CZBR+XA/e6J967Vc/oOW
	/Id7RcY3jC0C+r4SB39WWcy+PjtxUV/4iqWe84UUVqJT9Jd94pNL+hJ8nLpwIacfo6l7usRfiU+
	qiLBWNqeX4/ddgsCCkdG3ltxdJIZEl5gdj29X7BfEywxwGTLMZQQd5k=
X-Google-Smtp-Source: AGHT+IF9IZN2MS+sYW2ouGCv5DMbUlGfHcNRSDur1nJMOJwR6mhtfhHbo2K0m63hGJZ7Lzm9t37Sjw==
X-Received: by 2002:a05:600c:3586:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-4532b8c2c9amr37528825e9.15.1749734129300;
        Thu, 12 Jun 2025 06:15:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:16 +0200
Subject: [PATCH 07/16] pinctrl: xway: statify xway_pinconf_group_set()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-7-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9Q3bm/CeNxC+8oeWa7fm99HCVraMx1u7Zl7EzaVQzgw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLlNqDuphL86C99UAAzPjSE0SJSMbsWkwcvS
 zysyjdjnZKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5QAKCRARpy6gFHHX
 cim+D/9Yvh9pdH0HyHsSxQ03GvnN1C9sg0macmAjL6e0GEFn8NRgOxEnXwKbStGp95OJYoTJ66D
 jGvdoiWzR8UqF6TssAx9xGFIRvMWV6PZ5DknaE1I8c6T74vJmoJhu93H/sDuwVLrTn+/DU2mCFA
 jnPNftQI2C9KH4WKcwsW6p88+VkRHVVojR71vHqEly1CvfsUDt1YHdfD0b/i7sD4U6wKsdF5Je8
 dfcENemlDbwdAwAgiGY5Fh8LbLSRWPLeMG7zzrMuVwW4epppnpeSJLV6UKgrCgz/czoIVYNPyDs
 Rf87bKBsOdzu2II2sLqjC0FpkgsgGpfEK4Y0cgLsAHYSnu+AzsTWVPKtM7UVYZ05GRHLuxcKgXU
 PjLnEUr3bR07xBoubOEXOjQKtoV2wcZ5/dLlfo+MaNMT3ub0nw+qNhQMbGGSdNBqsTZcCLcG81u
 qxqW/N41epJAzbgUyQziedQdsAi6pZtSYrCG/HNuuBhbMSTwQTKr9mA5lODj6UwJC1c6owybPjp
 cPVB2E90EJN97TqqmSlpCm5As6SPt63bD+uj0RihsW/Y63BWIS9e33rzwyS8251w5U21iErEzoU
 pk8qWDKqMb8tuCs1JuJf5+bZ69qI1UzCzDmGyaad1Ncn318qefMNQozIPqs0Jk07IWgHAFzqn7Z
 KLFaSAY7+IyRMHQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061530_715567_BC213A59 
X-CRM114-Status: GOOD (  11.30  )
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

This function is not exported and is only used locally. Make it static.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-xway.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index 48f8aabf3bfa3ae18f3eca8ea00c6e796faf4500..02e65d25e72911b812446ad4b90bfd611c9c1714 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1228,10 +1228,10 @@ static int xway_pinconf_set(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-int xway_pinconf_group_set(struct pinctrl_dev *pctldev,
-			unsigned selector,
-			unsigned long *configs,
-			unsigned num_configs)
+static int xway_pinconf_group_set(struct pinctrl_dev *pctldev,
+				  unsigned int selector,
+				  unsigned long *configs,
+				  unsigned int num_configs)
 {
 	struct ltq_pinmux_info *info = pinctrl_dev_get_drvdata(pctldev);
 	int i, ret = 0;

-- 
2.48.1


