Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F61C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yvl4l0Ok5PkRG0EWi21Y82ldA8DtM3z/BsTax0kidDk=; b=a4VQ7Otps4bZYqqoobqgfdLV7I
	gVG24I4MYU5ajveSVnbIEq08jayJw/VU3L2MhsZxwit//jOH+V2zp/T569X84VKVnX4tKGTuPw/0f
	poqh25TOAZ/fW7wJzRYu68aBmBSzzWkB+Ql2SQKyX+mV83X0xKWIi2wgsVdppFvAP9umE4ef5RJqD
	Jf8MGnJv9vKitTGKnzs+sEQjTZdfxdKA/q98kaUlzK8OFyT513fANY7p4nR9cQKzQd9kQSOk7+Wzi
	6SuEfsUsJhzQxBWjAmEYeTjvMUHx81+P3rOVtcup6IpMqyyvOwTzn03EVoG52jsh/OAcwPiGtzJ7c
	C4ImQ2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cvY-00000008Zv2-0HHJ;
	Wed, 09 Apr 2025 21:25:44 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB6-00000008ShW-0JUg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:45 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so178516a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231062; x=1744835862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yvl4l0Ok5PkRG0EWi21Y82ldA8DtM3z/BsTax0kidDk=;
        b=J0CMYV0hc0yw/R0j1IxiGbKXoZjV4zf38lArHrFVB6bDFuQ+V8lP9iQRmq1g7RgR4/
         I7G/m4h5l7azJsZ1e/u8UVjupG1buyC7P1GPM5zNti7bG0viL2r2YYyXKzYo81wahSWh
         qHP+dMg09T188Xdpl9/NkeWMcJyqwSW3LjjK6BI7QaHdtRkI91Jut3uE6hRp5EMUgUiq
         cuwN2vQz0onDb30b0TyNz1S6PgTg46u2wYEDmLMQv2gTXI2yb/s9aBwDo8FxT8zA4yPb
         xyTHgIrvLqvNY5z0Bp8RjQzehBQQk54Oc6fUKl29QjhQIqc120uBAj/XeZSRmXuzg5xX
         9i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231062; x=1744835862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yvl4l0Ok5PkRG0EWi21Y82ldA8DtM3z/BsTax0kidDk=;
        b=mvE0CIRovSvIPZgTxmXNxFRnkJVFQgCMxbjwtDlARYrXeRsKoIKwNAPG/jMfqTy2nG
         pzy5mQY5cCdt69kl+K2vnUWVGbm7eYo4SHj7lHQynPBeuMd6egMCANKX9HW+vS7PX7j4
         wLZB4oR+DW73IrWwvssK776VUHLaeoW3E79S3kR4Ev7hKW21l20HKnTFgTHH/2qSkoTV
         zzUCHQclrr79Eoa7JKAKEl0pKve3290tB4CYTf9SFbMmQS8G4y0ty4H3SA4u3ARVcoCs
         rUaotDgDQ9SH/AFMVwKYOZl45D32KERZlh7vX/c08fpBxm4k5kf0geN9BnAC8AnXATPG
         ykXA==
X-Forwarded-Encrypted: i=1; AJvYcCXM1ff722fan+IDpW477hljK+1M5GY2L05a29Xoaz8/qhgCqqB8Xnlp3lkpP/VKqnVkUh+XRwdArGRV2Dp9Pkch@lists.infradead.org
X-Gm-Message-State: AOJu0YxoA/f+SPu3XuWTUwyDKFYjhXsUo4Yv+LL5Y9XutwnlL+wOR9/7
	W6WYDKNZwGwSaXtP++bgBMt947hmyEJ7k1Akz5dUJHcITaWemKolt8+GhNSR4nk=
X-Gm-Gg: ASbGncsvsXC5qPu5l1v6xQvomidYVj1uG2316kH7c9BZeVwL0NO9hQBSTesJH4hSnPi
	4+iuomM5tSesJn1WkKgJQ+B4485iCjRbb8SyafGg/sCI5/g9lJoZ9EuONLuXCUTggIV5whCimoo
	PhVPwWjpq3HoxaGqlBYT1+lWlxDX+T1L2IeripsMo34l9lXwYAepbAE/YnD4pS4oYi9eUq7hESE
	xzro6RrKacxc1yTInRrGLz0mMWkLd6Oif6Hb4GDRrXJ/ujXslS9kN0ha9YbSfOCbnE5eHFrbmi0
	8hiYEeo/oC2E8bhgcbhUKwipYuZFk7Dqwv9aUv9RY9y8q9kt15faTCCLdZXRu7uNvC4P0V8TMnT
	pJw8fLUqI7ElOETs9+vWpH6yqRD0=
X-Google-Smtp-Source: AGHT+IHbuLfVklw/YEV595LIDXkT6NJfGZ8tsFxVvFej7hgAnnMJK0l8IFDXzmywh/fHAbSmWr9RuQ==
X-Received: by 2002:a17:906:dc89:b0:aaf:103a:e6e3 with SMTP id a640c23a62f3a-acabd3c36a7mr7622566b.43.1744231062434;
        Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:46 +0100
Subject: [PATCH v4 25/32] rtc: s5m: cache device type during probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-25-d66d5f39b6bf@linaro.org>
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
X-CRM114-CacheID: sfid-20250409_133744_111375_E6E99155 
X-CRM114-Status: GOOD (  15.50  )
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

platform_get_device_id() is called mulitple times during probe to
retrieve the device type. This makes the code harder to read than
necessary.

Just get the type once, which also trims the lengths of the lines
involved.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- cache the driver data, i.e. the enum type (Krzysztof)
---
 drivers/rtc/rtc-s5m.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index db5c9b641277213aa1371776c63e2eda3f223465..c7636738b797b8087a0ed6844df62d47427e33b8 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -637,6 +637,8 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
+	enum sec_device_type device_type =
+		platform_get_device_id(pdev)->driver_data;
 	struct s5m_rtc_info *info;
 	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
@@ -646,7 +648,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	switch (platform_get_device_id(pdev)->driver_data) {
+	switch (device_type) {
 	case S2MPS15X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
 		info->regs = &s2mps15_rtc_regs;
@@ -669,8 +671,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		break;
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "Device type %lu is not supported by RTC driver\n",
-				     platform_get_device_id(pdev)->driver_data);
+				     "Device type %d is not supported by RTC driver\n",
+				     device_type);
 	}
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
@@ -686,7 +688,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
-	info->device_type = platform_get_device_id(pdev)->driver_data;
+	info->device_type = device_type;
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);

-- 
2.49.0.604.gff1f9ca942-goog


