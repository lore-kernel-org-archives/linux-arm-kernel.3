Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD10C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Z8QgNOGdyxdSVBJRkjlahCtXXFXCQYtK5J/GCQaRwI=; b=3atF2uQn68Hu2F4zJm3bQMmBVQ
	CdZkAw07IbLKMUoICfvEcTRy0NdNdHPFvyXwyof9zGaHNVvr6U5xcW/jfWmwtkM4QIy2pJGrvh9OU
	ax+VtNrQVbBjNuD1zKCTOurCDDbgwtRdkBMZiBkGNxsoM93mOKlvky1tsdXmVWcYR1tQO4L6ena8t
	SEdMLyTerxUDXuSlojT98NWQv3rkjO8HjU/y+ifmp1/w7W2zXnNhrmtGl05/kn9qmh4FknWd/Asw8
	AeIpR7YI4g3HStgUU8v8nK/6c8yJbZ3nRGkCV3o6I1GOYXroMr4FX2Fy2p1/T+3+YyrEv9OpMcXa/
	WQXb/fJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUXy-00000001tVS-2F08;
	Sun, 23 Mar 2025 23:16:02 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyk-00000001pAZ-0c3c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:39 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso560756166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769577; x=1743374377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Z8QgNOGdyxdSVBJRkjlahCtXXFXCQYtK5J/GCQaRwI=;
        b=kQofAuJflgUo5uy7TxaczlBGERPN3og3o0pd9nBX1wjBZFlniORqLCpqQfVGAZnXIf
         f5MtfLrl0zpXzcgag9dn84Kgyxmy/9LMs80GOYZ5Xp1IN3hPMWlkeB7kerkA8nabEyb6
         qQxY//5IZtXEi2SMXPsetxiMjdOZAsrpaUczPeijWD0lalnrMV3WdLVdxpOZ8xmHdhRy
         Voo/tQonshYAB5PiEcBRi/X7sg4prZuNipwBfe5UabxpmOtDTadGUn6eM03mmoVesNkr
         jdx++kDtcZK8vBs1qqftfTnSsJWxFNRDnbJQioa07gYHlyf3KOjoewnsmjbgfiZeRjjC
         l0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769577; x=1743374377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Z8QgNOGdyxdSVBJRkjlahCtXXFXCQYtK5J/GCQaRwI=;
        b=DtssW1GpwBXMGHgjWM5VjxkpB0du998nHwgnuwCT6n3lEvYu9DP1sYexRsMtOJG/8j
         DcwwQNzq3ctU83xBoT7YrXzxIcbf1nEW88KXcxzv4CTROsD5Hd8YNoCb0baVGEKBYVkG
         IuulkrE/Q6R/6XVZ4uHgLmgspjBbaTQJCz6kLusbcwj66SpcNca347Y+jdwLHgAy7kIj
         LQYPUf0gy3/EH+iC+XzeatZvM6OaCGsOowhpCM4ERI2xVDA9oizV7lxH2LFHMMvgX93I
         m7uZBWSOeJyyM57uW2aSxIDUu+Y5ydZS9Gv3Y44JQcNOcz6qnvFK19BkwlT26GV/ntvw
         PeZw==
X-Forwarded-Encrypted: i=1; AJvYcCVHYBXmoxdy2N5VOXs6Cqp/CB4auSo/g6GW3uP7WJZ7dJNiULmrX4lKqlBakySmVMwB2qmLCUe91J3c3vxhvUKX@lists.infradead.org
X-Gm-Message-State: AOJu0YyNTVpsp83G8R3sWTV5ob1PhnTcsvAS2m/S5epOU8bN3Yzca2wd
	KMjU0ufWXn7xJI6QGEIE4HQ5vxJmDAXfADlhjaeJXpupI+61ekWkERp+hOqoEJE=
X-Gm-Gg: ASbGncsKCRLZivPEbqgA5i8GcRFWHoVRSqge56u4QKmkwxltWydBL7sgD5ABP1wMUDX
	hwekRw113ekSzPw6BMUUtFXMcAJ7XstleJbUumk3L/Y0KG5Fdf2PsZ1NG6dZdgHNSYnsaTfPs4b
	KAUVKEXhLUZUMWIsIaO3ScNeMeYoWB15/YFWr9KPgA1OmN1o1iaCQydkyAKA0/SV/S/HsLPdEO2
	nAUdqAUvKjSF45JIvEVxQoDanKIxgJpeBEYIPAmDmq9QAVTaVzSSCM/5i7Nr2LIKGixrIAfI3wo
	U0+4faWvImn3ACOlPFoSvXoTLpufmByHuusXqDcqU3VUvsHWKfxJWS5QHCqF1fjUhuYH+buoHUo
	vlo2BTFTQiMw7upB0+mQzN03YwW2e
X-Google-Smtp-Source: AGHT+IG1+wcYan4wIw2G87vBZ9kZLmE/4EPPJ6sSCzBbDr/N/WxDb6EjTSy7GHnKX+cpVY7JCrLHPw==
X-Received: by 2002:a17:907:3f9b:b0:ac2:63a9:df0b with SMTP id a640c23a62f3a-ac3f251f206mr898500466b.35.1742769576773;
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:38 +0000
Subject: [PATCH 22/34] mfd: sec: don't compare against NULL / 0 for errors,
 use !
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-22-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153938_182558_18B33FD0 
X-CRM114-Status: GOOD (  13.42  )
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

Follow general style and use if (!arg) instead of comparing against
NULL.

While at it, drop a useless init in sec-irq.c.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 drivers/mfd/sec-irq.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 48d5c9a23230d0927b9dc610166ae3f8f1aec924..90225b683fa083d4df7a20dfaa4f47084051e250 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -140,7 +140,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index cf1add30dcd0ff1ad149b483fe40edf82c2b57e1..084a40490979058b48640263ff5cdb38765b9ff1 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -449,8 +449,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -497,7 +497,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.395.g12beb8f557-goog


