Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47395CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 14:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCToqKFCbrUX7FSNvgPMJdWqTINioLrARjrzWOT0nyY=; b=z4M02WWqUH2fYbAMCFHq2cQL7a
	wdg+7+5sre0L72PS5zdZ4Uk1FdGClqEX98n+sWCmfsGnK+Lr5e7uCVI3Nca3er67XkGPCgehb2FT0
	5rBQaEti5VYJh+XCvBn98HcWyXPpboAk8/MdZpmIgPrUF94ohJwBp5xKcpxZb3EF69cAF5zNQA0dH
	+0CpvbZmRsBp2frp7ExmB6v5hOeyaUgYFiioUBYVM8bX7HfFHyFABzjxALbXr8u7bxEI/sdQYLsXO
	LGp4If1A1C2RpAgxK8uosB+ndJ2RZRdlbwazUY+f2EptvLwSoH6UM1FooMpYcvg5XSrjnBQTUvAfR
	HytX7o+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWad-0000000HRdT-0TtQ;
	Mon, 25 May 2026 14:47:35 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWab-0000000HRc8-0uqH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 14:47:34 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36900945df5so4814674a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720452; x=1780325252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCToqKFCbrUX7FSNvgPMJdWqTINioLrARjrzWOT0nyY=;
        b=Vkd2tw8e8235hR2GtuXk2aEJZwR+tVEqKo/YnBQ2B3E1j6Cig0reudXArLDdeNqfNl
         GA1QZMrzTPJUmO+JFc5QB/AWLd+I9RqhD9AMmWDGwp66agDFfUh5n8fkz41Gv4sLkzda
         +v9crJp0xC0Qp0upw4Y/sslucnCa04d2VcCkIeXFtrhIgPvCY9Cp44G7Yxms0SomCB9g
         YRapufwdIL7QRlW321j5MbTmNl5jkIro7728JzNuWRkvb1sgtUdTWbM/EM4BEWYVIM/X
         uLNnZsnSw5cc+pI8sFZIjuShmHDmRACHhEKOxOuBeEY6HcG1AKw5h6fLBcdBE51VSslh
         N80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720452; x=1780325252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCToqKFCbrUX7FSNvgPMJdWqTINioLrARjrzWOT0nyY=;
        b=tWsL0WrESjDcBFgeaoTqOFNOD7OnkdeELIMMZ0frR5Q1/6+CFU/5wXrK9nj/m4rY3P
         vyNvF/My/kLo0Meln5hCjCzr7anqtCyc34O2PzuYhkZCaDrqefXTHKjqUcUOfgFSu7cG
         ZEIygweRz1d9dQCBmNO6NnQJ7QOy4pNPRbTfluCAON4AaZB+DKVzJUfuCuB2kWgLV6hq
         vmnvhw0txCrUJogNlEqvHTOsb00hUmCPfA9auoDedQ6plKw0ArBdDGVeDNGQfJXqASb1
         jvdskxzHNs9ws/e0QUNnwQfemLZC5UkE34227jhKsSPV5/we4FtDo83mJsiy2dPytgpq
         5H2A==
X-Forwarded-Encrypted: i=1; AFNElJ+GN5w3hCKmnmi3lXlNV3L25XXNsAr9ynpWriefJxJZDQG8GZHQiJMC8QNQmLWJzcDGbQv1qZFRkwcX0MBn3TSv@lists.infradead.org
X-Gm-Message-State: AOJu0YxroiN9grliPJ9/8jXpPgTHtC7ld45mARmvPdrx09/11JRu21wT
	JiuLJrcHzQAwOynJ0hH4Q8sDo9UoDeMtAfg16gtjSlSz5gtBaEgckwz7
X-Gm-Gg: Acq92OFlupWIwUZxcPl09agWqSRtMomt8xd1jnzUTfXT9sVrK7C2MIgE5XZBZw4QCP0
	1hTEOHPdBr/sxB7sM6aVFuG9cf6nBRQdRVpW+4RK5+OeyyeqfG9AdjyATQ4SSsp7QQRkCmfP8b6
	gdhpPsqDOA5FMh1HrOVx8Ps+DRNweSUXozaNOYpOO+NU/gK+K6TLl8MT0zoz0n8Wzu10WYrU82a
	0vrPm9YwtQp552PrgHLh2bd3YDzZog+9L6PMX5yhJ/W6Y48/+ODD/yBMXqAoSemHNSNxRXJIJsS
	x6/e/9cH3vpdeyHulManCZV4xRj6J/Ww/7Kof8RqN1ZAs5u1NUC0b1DnHvEJ7ITz+q+Uffkwxa6
	fTN/GV1A3WJ36eeN9ZBuqlbIfzvdKvL4MAmVdMqTd/haRebI/REgdctedyiDOrUUeKc/7bCgEKi
	KXes4vKiPI7BkvIy+mydMsa0EFRIP5OFf76WeOPW8=
X-Received: by 2002:a17:90b:2f88:b0:369:a962:8cd7 with SMTP id 98e67ed59e1d1-36a6749afa1mr15044923a91.12.1779720452269;
        Mon, 25 May 2026 07:47:32 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:31 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/6] leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant startup pulse
Date: Mon, 25 May 2026 22:46:08 +0800
Message-ID: <20260525144629.498630-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_074733_262673_E8E394FD 
X-CRM114-Status: GOOD (  14.51  )
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

1. Per IS31FL319x datasheet [1], the hardware shutdown pin (SDB) is
active-low.

Fix incorrect initial GPIO level to properly release the chip from shutdown
state.

2. According to datasheet [1] definition:
  Shutdown mode can either be used as a means of
  reducing power consumption or generating a flashing
  display (repeatedly entering and leaving shutdown
  mode). During shutdown mode all registers retain their
  data.
shutdown mode does NOT perform chip reset.A dedicated software reset is
already implemented in driver by writing 0 to reset chip.

Remove redundant unnecessary toggling of the shutdown GPIO.

[1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

Fixes: dddb4e38c6ba ("leds: is31fl319x: Add shutdown pin and generate a 5ms low pulse when startup")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl319x.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index e411cee06dab..41087ed262cb 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -396,7 +396,10 @@ static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 	int count;
 	int ret;
 
-	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	/* Driving this GPIO line low (in fact high) takes the chip out of shutdown,
+	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
+	 */
+	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(is31->shutdown_gpio))
 		return dev_err_probe(dev, PTR_ERR(is31->shutdown_gpio),
 				     "Failed to get shutdown gpio\n");
@@ -506,12 +509,6 @@ static int is31fl319x_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	if (is31->shutdown_gpio) {
-		gpiod_direction_output(is31->shutdown_gpio, 0);
-		mdelay(5);
-		gpiod_direction_output(is31->shutdown_gpio, 1);
-	}
-
 	is31->client = client;
 	is31->regmap = devm_regmap_init_i2c(client, is31->cdef->is31fl319x_regmap_config);
 	if (IS_ERR(is31->regmap))
-- 
2.54.0


