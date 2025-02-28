Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A70C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=; b=AjKfnR+Q/3IjbU0BZixMrRX7u/
	F4ey40uh25b6axXQkbHl4y14jQu5B+1GttEIIt6j26chEadVgqgrixcSn1s0+94aT9y0JIc/jI3mw
	pp5wM14sxHDwOGjZEZ8wHgKUcaX5nsTZa+xf6t+aj9N3kV8K6Dw8uw1F6ByDfSDBaHZIg3+f9Pm3D
	R29oB9C3irJxQlGfyPodCHr1krJsP3atvt4rhoW9NAfFO7WcCOKWIwbmyEuKceK6DEmQ6YSzQCcxr
	nTxX60yfq9wRwuYeoISMwr+AZ8gesJ4FBoG2g8P3WHvZ4kWnsNuZPwB0IVivYBaanTAM4tBfwcTJr
	3NeUPBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Dw-0000000BEe3-34hb;
	Fri, 28 Feb 2025 14:20:20 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11U-0000000BB6V-0YCm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:29 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso3601930a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751646; x=1741356446; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=p4yVOAy3csOTsWpp6mGDNtxmnTrMNFqbdiNd2nBPu2gbRkRykRgqC1KBGPpAPkbz4m
         y17/r+/cbsmh8MzeSUWVINhjhZmzDmXPLP6dkfn5e2C0Uh9necSCION/UxbxGqkhjoqj
         rDHetFl2PR3Hcf51CaG+fmNEOVgZFaijYVDonqVybwN9zwwiIqDtwyitpKlcjM05vLNg
         QeZ7T0MB4OnYWtRAxyEJefo75iRKz6G9n3GUikY54BMUlw6zmngcZmbDhtX1Iha6+ZWF
         6n4mCOOL5XWssG0OPObszW5CNbIyuBbZFVgJqNKA2aWhge/nS98lGd0TEil2M+XlFaCu
         ENGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751646; x=1741356446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=MZN/L9dBg9qhQKKcoduKIOHUyq7x4DOxErIeH5hNyzymxpnItL0Mmw7oMhD/Gyiq9x
         30yPkARqlJCkH5KosiSEM67nFXzBEx8h+bn4pGXMackicrIA7rcuiqSyQ/bfGtHnrs9X
         j55JZzwdtXbSnURTYRIiHQtBmWVSRiPBQ6a8GQv5m8or2xg1rReeH41nzua2Noodk1eq
         dHKfNzooEbv1YLg8UcwtD4F9SY+tvSHMWv5P63K5BvydgCrPWFRrU+j+SC1E1BanNdt/
         eiGQ3LLPQWq7aWn7msfBewHFceDKZynE2U/mnLiXwoMfv4hkWbOBJTeXzzZzy/7Gs0yB
         DLxw==
X-Forwarded-Encrypted: i=1; AJvYcCU4TQOXfaMib9cvS/R+4ObBNBPKNzOfs2AdtuWjfCJkB8KLabaAnZAclsoHl4CME7mlY2jb8DcJpFmCztERAeOv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8vsbHyiyHZKm287ofkw1DSXPUrSbwd9jiA1BNOjCO26AEeIVn
	NlPI2kjmOtE9uq31IYnV76TDYtMEUn9fkMXdecI+p3T9JeVibvfvNPKhlY7uGMw=
X-Gm-Gg: ASbGncsH9mlLxf+nKgEJcyJKlFwhqy+/yc8qeFBRvhv29/GqB0A5CG5t++7dziU6CwJ
	4m9qTUxcyFRfINn8t0Ko0FjW7sn5VeHIRIlUUeAFQfLtazYVGXphEk/Z6Ovij+xuIKQNqmQekJM
	TF6IyFva73RaMse7TgoI4rV2qNarrYB8BK4lbl+eEk8G4khei7IrKeVsbSCFTCGjo1xjP9Qjk6c
	l9Ymdx5VYUQAdBkLNmUz6hNEIliyLdVmPZM27ZpA57J2YGenGHUjZsNq2rsxEOnWdseeW02RXOH
	yggupaS4C8AW0/5SIiVx+uOh6PJgzPXghSHnIBQA/Wgqer0Wmkw1aeKXO6WK/1p8eBRgvKMsdyI
	jldkRw5SokQ==
X-Google-Smtp-Source: AGHT+IGw8/Em8B8f2s0ytjmI+eWh2dyA3vFh7dmQ8lnXofAka3id8ECQEXS4gzzEIESeh9rUlyHc/w==
X-Received: by 2002:a05:6402:270d:b0:5de:5263:ae79 with SMTP id 4fb4d7f45d1cf-5e4d6adec08mr2881207a12.12.1740751646341;
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:20 +0000
Subject: [PATCH 07/18] rtc: m48t86: drop needless struct
 m48t86_rtc_info::rtc member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-7-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_060728_172342_1663F9C2 
X-CRM114-Status: GOOD (  14.29  )
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

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-m48t86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-m48t86.c b/drivers/rtc/rtc-m48t86.c
index dd4a62e2d39c73b1c8c3f50a59fd4fffc0b45105..10cd054fe86f9e6be74eb282222b2751dd91cc7e 100644
--- a/drivers/rtc/rtc-m48t86.c
+++ b/drivers/rtc/rtc-m48t86.c
@@ -41,7 +41,6 @@
 struct m48t86_rtc_info {
 	void __iomem *index_reg;
 	void __iomem *data_reg;
-	struct rtc_device *rtc;
 };
 
 static unsigned char m48t86_readb(struct device *dev, unsigned long addr)
@@ -219,6 +218,7 @@ static bool m48t86_verify_chip(struct platform_device *pdev)
 static int m48t86_rtc_probe(struct platform_device *pdev)
 {
 	struct m48t86_rtc_info *info;
+	struct rtc_device *rtc;
 	unsigned char reg;
 	int err;
 	struct nvmem_config m48t86_nvmem_cfg = {
@@ -250,17 +250,17 @@ static int m48t86_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(info->rtc))
-		return PTR_ERR(info->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	info->rtc->ops = &m48t86_rtc_ops;
+	rtc->ops = &m48t86_rtc_ops;
 
-	err = devm_rtc_register_device(info->rtc);
+	err = devm_rtc_register_device(rtc);
 	if (err)
 		return err;
 
-	devm_rtc_nvmem_register(info->rtc, &m48t86_nvmem_cfg);
+	devm_rtc_nvmem_register(rtc, &m48t86_nvmem_cfg);
 
 	/* read battery status */
 	reg = m48t86_readb(&pdev->dev, M48T86_D);

-- 
2.48.1.711.g2feabab25a-goog


