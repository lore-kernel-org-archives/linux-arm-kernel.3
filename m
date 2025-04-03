Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1A8C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=; b=a4FCes6Z2YhCNn2GLrOXLcSZoq
	JfBdfXtz7NQOf8kXNeoyouFUKt0b8KjhtgQa1Yfh6Rhjpro6jAsKixNUAJQ7r6j7mUKz2sLMRgXnV
	aqSOU7y9Q3WKxuwSzXxXQbhhnUiJSJctCkNn6+qvI6TFl+zCMXbY0NeSO5GlBEaJtOTDdDiLYkvBS
	/PzbVIQoPChnPqN/jrloLONQK046S137yL0yFEkRIFS2BKY/kR7Y/ttpicw4DrUhtaPh7wuV4zPIN
	klp0b39nEOHt+Ej3iuOBSbdDOJc7m7TppZR53woLLhAfkYCO2JwJsqjdJ1dHrZqPb1JdP0ayhmvtP
	a0zM6IfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0H01-00000008QOw-2dxL;
	Thu, 03 Apr 2025 09:36:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPp-00000008Jmr-48XI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:15 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso1179940a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670753; x=1744275553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=IGjXX2IrLDDLMkIDOWaPFFvRXCKOWY/pPogaWmUCaGSqg8UkYdMTh66Dyf0AL7LMSI
         15WVpHmW9e5Fo88s+mzSO1yXgTds76NizWB2yCfxAfu2Ui9LbuCzcJEej0MRtklrlSte
         oo8VCbPSjhtD2Xiuxw0wIWTomiqQeid+cBCF/ew+a9HXMRFhWl/os9sH+KWCs9gcFUOK
         JWkEUH8HpVhL4hQSgfuHqvqiKONd+z6pr2ruSA4Imrg1F/ZhzMM8M3chLk17GWjFBPd+
         EFJ7aShdcMMG0CfxH6ABeO7kkJP1b65n3sDc89/4Q9HAIR0wbXYcLxw0SVHkuI6MOMgA
         SB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670753; x=1744275553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=pyTqV6U3aCV9jyJ9oLGzQPxeyd5oEl4FlivJYjRmjokpYu4k1sm+FSeEXbXZLS0YNL
         lxxY+OR5SEQMlQr3klQ2x2qjJ+Le8QRvvRoJgq8Jy+UIgucZarH2Xa5b9oYbS9dTXjF3
         DyAQg6VozV4m4scmr1oMaft5nAJz7uH32g7HnPvObWAPhZ/qrO2h+4es9ivugqQ3gbrP
         tUU5AsJWvaPTrI9tHPc+8VXInI/216/efPVTRdYZO7HB/nsUzdYtpH4ec6bTkFXXkzDX
         4OR07EWX/g3dVg/JiqWSczCuzUc4VNGPN8UNXXYOrIm2dHhPHqa6jGmrs+fQga0Qm8F+
         QKdA==
X-Forwarded-Encrypted: i=1; AJvYcCVCE3Djun6dzwi92kdrOwzbQS3m5YluGl1MvQ32hE9LE027ML1VtWsNWnoqkMyZr0i1UjM9Mvh2UeMUiWmBquw2@lists.infradead.org
X-Gm-Message-State: AOJu0YyHXEl6jzZRspKNcWYOsH/yB5+z4beCbQHOTvDPuURab5a6A9iA
	GaYmz9N+5PG04ho032hnVhFJuPCI0/wP1sAg0aVN2tXrujG7qMtNOY4XfdjejTw=
X-Gm-Gg: ASbGncuTdejly7yi3z3DLhyx5fCxguYmetTIF7+Dv7vGJpfAbds1ONagwgS1WYusGDN
	be1min8EBzn1wr3YKkmBWEnAJ172f7PkOx1GwUPKZ5IBkN0spglAakWtfBdYQq+TWlYnkpdlyIi
	Y4v7W0prE1E+b1Amm485+ZhZe4Yy82gFhS4KmxSYNna5DzdOk9bLx0vG003KASbTfOAiFVjTprR
	oOJ6wVYh83watFbH2YCAlKCKnG+F0mpW65eykYrzmuncRNGPDMkxhEyuAez7zYCCK+48OKSmp6+
	bEtuD/0p3Ip+jBF+LhHUqUrK8AsZdI4qjWa56rjIe8ZTSKl+0VL082VWrx0oV1ph4K2sySjvUqR
	9vYySAQgyPvC4AD+LuYg/6JZHkDYK
X-Google-Smtp-Source: AGHT+IGcX+tYkvLIpCQDt/tVecCK/2rtCpUV2gBjKE/E/xLa7G15uMrlM8X/q+3JmlSAkeK9HlD3fA==
X-Received: by 2002:a17:907:9692:b0:ac3:49f0:4d10 with SMTP id a640c23a62f3a-ac7bc259458mr148490166b.38.1743670752608;
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:12 +0100
Subject: [PATCH v3 20/32] mfd: sec: use sizeof(*var), not sizeof(struct
 type_of_var)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-20-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015914_090774_564E8441 
X-CRM114-Status: GOOD (  13.18  )
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

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 55edeb0f73ff4643f23b9759b115658d3bf03e9a..e8e35f7d5f06b522a953e8f21603e6904401c983 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,7 +163,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.472.ge94155a9ec-goog


