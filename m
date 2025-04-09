Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2671C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsTeSqRDsCA5+cibF5ZIdcCibqmvRgKvrsS7xjyPMNg=; b=dPmOq08R9Ga8rfZa77WIk4d86X
	VVXCHtZq+bw5AooHlHSWGRwHcuoZOXy4Yi4XWtBBUCN6qg4jpjB+HY55+T47Ii1rpsVw2IV5rIzd8
	8g7xIp1PPPWS0VGo99gnj/+8cQrQkYYiNkWxQYQuLoL6XXNc9YgYoVzyk0r14YkOHFxRXIvscmDww
	KcW7+f5RPuf4q2Jfni6SaiEJmjEwrdoM6n67hNuuVytH/un+gTLjDPJsmUTWFqApQWf/UFKS7De1A
	AnQnAPLbc9BvSYTrbVUpjYwZp5AKGaeMKd1l2a4nXHVaUyLzGxCDJpyqgF/xZ24AaFU2fmVf2ShJE
	3/U8BNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cl4-00000008YCU-2w4y;
	Wed, 09 Apr 2025 21:14:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB3-00000008SfH-0AX0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:42 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso198586a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231059; x=1744835859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsTeSqRDsCA5+cibF5ZIdcCibqmvRgKvrsS7xjyPMNg=;
        b=xTlhVqjDHsThB22iCnBJ/THaLsfU/mTQtivAg3c6kmx+0BPgF6RufFyyN6QF0cvsF1
         cHTgwUjhYVJ8PQ8kkhdY4hhjHyxVVy8HnfF9+b4z2YUe8hjQw8URu+WMs7XOUKgA+DS8
         0Fl3WHeTkuUdINJmqj1b/IgeW4llFrHc7idAfZV3nE8ZO6IHnSlNSKlgNBQgM3W5/gYj
         dhvIP1oKJDgzOJI+86/2CJkxxw6xnZUQAqRTFPV9uGVwr3ARQxtRlMxO4qUNXaoClG0c
         xqbkY/5W9thpWZ2yP0l+0oqo+2R7MsM3JCGfurnlfRh3EMw+kqFzaQgbPJhpiUxecUWC
         h7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231059; x=1744835859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsTeSqRDsCA5+cibF5ZIdcCibqmvRgKvrsS7xjyPMNg=;
        b=TpYEcm9kCN6EAdlJkTmlxaHOgnDau30js13KcDHXH00Re9XFK+2RcrdjJpGr7Wq66k
         iOiS+IroK4m0a2l+S463NnlDtAB4rqhTZRKW9rmSv8OOqGpMpaIkcV11G8UCtTwwzkUx
         4GG8d+3KmNR9/xZK20Mg72j0TYTfkZFown7R6DGhsYjCVDqE1PohbXdYkSI5mpHHeZfA
         UMcJAzjq8UCMuZ29PmPDhoNwmzhDcz5wQwCz9h6JlISswAvTnqFVfZkDtHLpwc4AoLfv
         eL6nyt6/M110ODhuLf7rrONbQz0pMH4TgPf+xexyza13SYyok7aRAvN2J+7PlkITtP8Q
         ZWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYzivpPqUs290LkcTKvl5lqxBJ55FBXZn9VEATRnPH9nDLrYexBm0Hr5YteP/Bv0lEUDVSPcLCgdKU/2MTiK7j@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz0wDiMWhhM1sISm00RQj9No+cPKmWoYkM2FU6LDJ9cInuoNv3
	5g4aXzW6lY6g7V0YVgecL8xprchTP+M5wyMizao8a3WcYFz0bE2m6egui/Z7WqQ=
X-Gm-Gg: ASbGncvl0wdp3FnsyWL4XmcOHUcq9HsgGhUpfaP/+n/SwjZjuoNN82hs550ht6G2McU
	x5Ka8SJe8vAKcqs3qT25MSLj0ackG1w3nZQX72z+LEqI3YSdELNtB8tgPXJVDCLLyM6snCCcASr
	QILVcYFLo0Tf4Yvdb3SlS0ipuqUiL3nB65HigouS2RKXDiVsnS6llMt7ZjQ1dKCGd7JtYPvDqUA
	7Eag2f3H+aL3UB9kx+t5hsZ/rUBWbXMhXKV08ikvf8wZiZNJSZzUXrS/ggoxhNA0gZE8eHcQO1P
	4uBXW3a6GRukj53nr7a1GUEOu7xpq0tVYpZUV72kBU1DX58qy3TfOvlqBDIGZpIpa7P0YBl0+iW
	mBwkix6mr68BB7qOZfive7StjthQ=
X-Google-Smtp-Source: AGHT+IFaBUkiGU7OFSd2C8+eXihngB2V9lqLexzEyqiPbNYC3ushPCaeGAspEyeXYhQ5fM5m2o3CBA==
X-Received: by 2002:a17:907:c1b:b0:ac4:5f1:a129 with SMTP id a640c23a62f3a-acabd1dda12mr11931066b.15.1744231059324;
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:40 +0100
Subject: [PATCH v4 19/32] mfd: sec: Don't compare against NULL / 0 for
 errors, use !
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-19-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
X-CRM114-CacheID: sfid-20250409_133741_075652_68A5ADEC 
X-CRM114-Status: GOOD (  13.72  )
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
index 4871492548f5efde4248b5b3db74045ec8c9d676..55edeb0f73ff4643f23b9759b115658d3bf03e9a 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -164,7 +164,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 54c674574c701eec979d8c6a94909b78dcc77065..4a6585a6acdb71d2fb368ddf38463f001e513c7c 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -448,8 +448,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -496,7 +496,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.604.gff1f9ca942-goog


