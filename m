Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C390C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FZ2sB+aGjDu2Ign5/fbJkQ1EFpiN/+kFXshKweSgHY=; b=hJgR8Qq9pWitDvLnLPKgwnM8dY
	N4dCkVuAQsldcx8BKLlqU2Jh2OK2rmMh02I0WzQuyPMkDPSkSt9oquNytErD4TH4yA6eFSh+NbZ25
	Tg+Th5e9G6ZMkBiHH9I5DSFfyiz5zLDhG6uJrJ7gXs7W1vk1w3IscHhoEPe+BhT6LD0/wVBpOMaX1
	P3hbXl60Uosq7kDyR2yaT97AVGl9Z0/7Z9FRGqTEUhSuf86V7gXKLuvMflKrqtsSNOVgABETVmCUd
	3r5+GiH5y3utqp99voAhOGSLXkuMJHoNkHtb2ebzhanXywM0s4juxT6pl6URI2A/PkSzG29fJURvJ
	Fp39BKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HKj-00000008TA5-3aCd;
	Thu, 03 Apr 2025 09:58:01 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GQ3-00000008JtW-1lxb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:28 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so1306210a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670766; x=1744275566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FZ2sB+aGjDu2Ign5/fbJkQ1EFpiN/+kFXshKweSgHY=;
        b=NzNc/KZ30p/d/0KGMk5RuhjMP1u6xgtXVlE+rIvFtn/ojg5JDlt36OzYeH4gxgPANV
         wZcCdx8fDLrB2K4soxrgvAcVwq44/DKtLHYv3f0IVSQ+JkxF5a13WeVTxyFwVKFkjHb0
         Kdo2HhG6BANYV4m+ajmrfAqX5d88EWS4f56cuMghqp1z9T8OEoC0T18jQnrrL+9drcEZ
         xGi/ClNtpI2i9ba0KixK4qeqcsmDzTDawqug+sdFIjYM0yAXxDj7D4MmRHBGc3uLIm32
         4DU8M4wpc4isjjAa5at2xie/I16Ay4S/UnBt9/glEPtX5Ab7aW1xzLx/AsJ22MzfTR+o
         Oxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670766; x=1744275566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FZ2sB+aGjDu2Ign5/fbJkQ1EFpiN/+kFXshKweSgHY=;
        b=poOEsbQyBUO6vU26HzBQXK+ZuDbF2oNiAi38+a3KJR+JZ9Tb+Bbrn/IX/QV4P/Mns2
         sGm3QZDopLxYSUmGmIpMj7m3OKeVjc597zg1oEmlB5rqWTYORgzXfSSwP1i2taBHwS1j
         dejQtQ59C1BNlHdRHQ61bNLdd8b4TYpgcX9U5i9f3U4IRYk+ToqHxtYlpIFnxiawjzoZ
         uS58xS8dZoVMOdl5JRJosP7oHKCsdmQ06SJy/U7xTuUDUky7YclPmDrBukSGPP3gtocJ
         2Rx3KwvdnN3H4NywVeQXlmR0+AAnYAGaFe8WHo76dBAaYqPVASf+d/EAn1zke7nStGEW
         17sw==
X-Forwarded-Encrypted: i=1; AJvYcCWTBkqxWuIG+B/wHci2slV1tvo7TP844+UoVP7Jr87x+pov6oM0JE7Z/70Y64+YHsYSy1IE20v4n0AwpXH2dnfk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6wYN7J0cBJ/m19ENmpzyNurIq7JflF+XjjBxf/NOucceWK89h
	T+zQYt630SbWtgdBDQ5Pg+Gfh0k/suiZ35fv9dM34RpfSklo2Ac7GwrJF+wUjTMIjaxhQjJI0jw
	Fey0=
X-Gm-Gg: ASbGnctDV1KWn0nnMQ/vyNDe3o4f0DY3YX0wpLxMJ9i+DT3azaK6CpeOM+8VYNt1Dow
	pn/N8PjXgm3c6oWnDMKM1G0PcrZzJw5wOE7M8BuF/oHacQEoTcfxGlhCcpF2OU/fOZmlQrDKWp5
	p7B1dNWah52pR+Vr7bnt6qK27ryK/pHi+wFVvjfrHkTg1p0f2tSeNRxyIZfMjf42HZ67OnY3kcQ
	kT4+p3cL8ewBREWjRwymBKyZ8s7cvhrJkcfdrhwpO0XOhzkEpYZsIkRP1toqpUrghjSUB3bsE+a
	7hVNOgR4sT05TAUF52zpb3/EGUFAjqi+sDKRShDxa42PzmtGmMbWw2De22nUtaD/9vTu/Fa/CDn
	MXj6b8vxdz3ZgtrlswgxzX41Nqv8W
X-Google-Smtp-Source: AGHT+IGQNpVavXNQ9/frqDzO9rSosrg/aPUOlz+BV6bBkX6B3R/1cOiAuqPEN4gk8MQb14kPnJPxIg==
X-Received: by 2002:a05:6402:40c2:b0:5ee:497:d714 with SMTP id 4fb4d7f45d1cf-5f04ec3a302mr4194362a12.34.1743670755488;
        Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:17 +0100
Subject: [PATCH v3 25/32] rtc: s5m: cache value of platform_get_device_id()
 during probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-25-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015927_474127_418DE047 
X-CRM114-Status: GOOD (  14.40  )
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

platform_get_device_id() is called mulitple times during probe. This
makes the code harder to read than necessary.

Just get the ID once, which also trims the lengths of the lines
involved.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index db5c9b641277213aa1371776c63e2eda3f223465..53c76b0e4253a9ba225c3c723d35d9182d071607 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -637,6 +637,8 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
+	const struct platform_device_id	* const id =
+		platform_get_device_id(pdev);
 	struct s5m_rtc_info *info;
 	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
@@ -646,7 +648,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	switch (platform_get_device_id(pdev)->driver_data) {
+	switch (id->driver_data) {
 	case S2MPS15X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
 		info->regs = &s2mps15_rtc_regs;
@@ -670,7 +672,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Device type %lu is not supported by RTC driver\n",
-				     platform_get_device_id(pdev)->driver_data);
+				     id->driver_data);
 	}
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
@@ -686,7 +688,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
-	info->device_type = platform_get_device_id(pdev)->driver_data;
+	info->device_type = id->driver_data;
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);

-- 
2.49.0.472.ge94155a9ec-goog


