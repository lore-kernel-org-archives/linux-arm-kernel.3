Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917F1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNxxLoSaj80bOvxwS+x8aO/LQaPqTkbFKbIYZM/ccx0=; b=p5jlM/G1BDwUzk8CGW83dhP7UK
	ne8LUBcHEZafFeXeD6AgasTYFxSKQ0+Yoe5Dv+Xl8W9eDrsBRqaRTyvnJ8XSNUzYgQll3W7RbH7fq
	ZGdTFxGlzTLEEuzSuFpA9lm/4Nmag7aFb9cZQzQpBOD5CkHJbhgwOYCpyWPp/ILLOBDSGiTiiO/VS
	3/ax8EenZp2UEgYTjlqH+Rex01A6vhGlwnVcrLADxH+BTwFG/84ZBGZT1TgsVaMYlCMp3cDgyS1zw
	wagKiyG/D/uXOj6L7YTd1MnyMMxpTEMU0GRtELUrqCvYFnUEEOxnGGMredWcD0TLmMstJ2MlOyjYA
	Ifu1e0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2fK-0000000Fu2k-2jn9;
	Thu, 06 Nov 2025 16:16:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2fG-0000000FtzA-2mY1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:16:47 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-640fb1e568bso183135a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762445805; x=1763050605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNxxLoSaj80bOvxwS+x8aO/LQaPqTkbFKbIYZM/ccx0=;
        b=hs9K9dO+GHmkUpErKkfq29YH+71ghLeF8PvrkDIs9R8jiVyFnOjdbOAiIPGfwKzJDx
         pEF4bCVi1i+L/m7v9bF7zAptNed63iVIZqKvnUBd6FANKxzLRXgiLAqjB6QgOjzGs2C4
         mzU6kknmLz/9YTJKBUk005D7bQbwHxu/bCvFqrSj7R4wm7d5qYTFSF1nv6vS+yi6BsqJ
         T5MG4DScK9XUAFpphVkD3AouYWbC6CQptX1Vo1e7BEVAAZQzx3yOQsVMxpSbuV8+XWyX
         jtdckY3zxVXR72uOVg1qgKpTe/Ts79Wnc50kSTi2PsBhI5DO+sjptHnQiJ1+qYQ9rjIQ
         Fl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445805; x=1763050605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNxxLoSaj80bOvxwS+x8aO/LQaPqTkbFKbIYZM/ccx0=;
        b=Hap9u6S/cFGWE91M8lOw3xAFRTS6MVd8pP7CCyuZFjJCyIQgNTDmzaSBHfcdZTW9pQ
         hJ1EGPA4UXOs6EetubQuG3txDHjtW8L6EekzxpphMuiILt0z/3Jdt0eiza3+Awq0LAIg
         al7vM8iRduTpkIJOoaIcH/SzcWp/mrYqJ5NynMdJcYXtaJUlCX8gbrOwAC6XGYARBHmG
         dK/H5tSxNxiDiOIC9JPr9P1/UogOKT4L7+7p7Pc9n4aFPWMHk+NjmJZI5+f1/vDJzwFK
         bW3wKm7mceCcxqG3ymlRA5Ku3tKzg7IPzGK5SlxVlJY/kY4hEhqjZP6I7yJhSlQjnfEB
         BdlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3LrD7SPwKxBD6RFMabo/3UeMOvSGu0STqK0EX6koJlpbTytXZFijiG9zse05uBOnZtaIbvCpzGGK48oVbMtMm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7oSqWA1XgHV6Yji0ugRl+uAbI9k42+rMs79PJ9sg2tEDenmok
	vJmOiI/9hjJT2I0Vmi19akxIy/eWZXy68cBAU4CPf5yHX1RXOKCXGg/ogpVhdYSlD3Q=
X-Gm-Gg: ASbGncubTzQ0HAimB4tmgp4OUCvEtTOIv4GXUuk0FY4hwD77RWuQo/kjJSzL3fSNLBZ
	aE5wU8f8IsA6en3tRzgI7Mdcg6s8+0FefRVh9ibrNDF9sxtlaRCN49aAF6y5/IWIGV8EzJ663cf
	aw27XufnxwdddC39EiabEBTN4KpzjNdbP1Q816sizFJGK3nzvQsVuKpAvU3Il3Nky5pClQb7B8u
	RM3XlC9ma3gbrXJmIEw5qQ32Ilgra8dtH526V4VGHAdpSVRffl9Jem83W0OqiRZQFkW0D0xoLh0
	AeXJ28Au02I9/klscJcSxz9XS6df+jYDNx0lzxIz4RwOi1kaV2x6MX4pOSeSNljCqpiNlT5WKTO
	Aq6oDHy0NE/CXGsIVqVTBUzidR5e8ZTT2Oh1P4Ovjeb5fpuaqO6KQlArDM8MuyLeu07AYI+XUsD
	aoURiDzi1gGQ88niN0q8U09jQai5I=
X-Google-Smtp-Source: AGHT+IGxqQY1TKHhlv59jD9rXPj3NM3yoBtmJAbJOzQqYLTcCXhQ3w1hdyfA1R6qDfeGfCwDVofBBg==
X-Received: by 2002:a05:6402:35cb:b0:640:9b11:5d7d with SMTP id 4fb4d7f45d1cf-64105b79e3cmr4181740a12.7.1762445804550;
        Thu, 06 Nov 2025 08:16:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm2113408a12.11.2025.11.06.08.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:16:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:16:28 +0100
Subject: [PATCH 4/4] gpio: zynq: Simplify with of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-gpio-of-match-v1-4-50c7115a045e@linaro.org>
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
In-Reply-To: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KyCK4WaX8DTPr8e9FQEpVrY1lPGKIUEEeXomozdcgIk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDMnhaeYJvXX2uO3vKVe9JEZmeNPGFfrC9cmTl
 8PnkWe0SIaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzJ4QAKCRDBN2bmhouD
 14SHD/0RJ4iQBsacOdNNfDcM2yGY5n7EhMle4k1LQGwzgE8xaJZd0bNJ5SuXB7KiK8M0d+ncBIG
 Vpgc5uJxPllzlkLTWU57w6XNurghRyy10l5bLnj3zVPqE8uDm8zaYb2f2KCLUY0ZFHBwC6ZZD0S
 EywKXF8tXCNuyHqUd/d2gc/hufQSKswUKOk0awanMijo9zIoPIAvdWP/68XTrDaJrUggH0VLWDA
 DirP1LDVncWKXiLonYBU0Dzj+E6zW9e09uUsKpYlzqLp9X5b0nZqAky4VSuFbrlQOTYP5qOQYI8
 6mcG6WQJGAQizQ5aDwZqz9BVLYC5A4wUFrZEOzZITZlVateMtaA36tFKB9ykvpXKYOtZbyDNzrY
 vF5L6KKkjCRSQMKv/97axV9dFeuK62nPFn6zCzJhtfuVW2X5gl/S7p4SKcVW+XzIb9B9Fd6UgWP
 xPUerlWtE7IzxdDyf5dKH0FnDkSm6SsqecuZaHZHyj1YvZOa8P+CK9o5BudRj9cUprLWEckBgGh
 vyk+OrhUR9i6hakDiow8oUA49HjhJCl3AAtwwFm9u0lRDlNi1XKdtGXrfZWUXbgT+BcW316eDTy
 c8bwP6f+3kHFzKoVOnytycrNZ1R3CfM400ReIYFDpY5ucGP37m3DcHa3ZSoiNYwzWaMPxuK5DhU
 Mad4nYQwDNFnyyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_081646_728082_0EC8556A 
X-CRM114-Status: GOOD (  12.68  )
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

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-zynq.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 0ffd76e8951f..26071ed1bf22 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -904,18 +904,16 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	struct zynq_gpio *gpio;
 	struct gpio_chip *chip;
 	struct gpio_irq_chip *girq;
-	const struct of_device_id *match;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;
 
-	match = of_match_node(zynq_gpio_of_match, pdev->dev.of_node);
-	if (!match) {
-		dev_err(&pdev->dev, "of_match_node() failed\n");
+	gpio->p_data = of_device_get_match_data(&pdev->dev);
+	if (!gpio->p_data) {
+		dev_err(&pdev->dev, "of_device_get_match_data() failed\n");
 		return -EINVAL;
 	}
-	gpio->p_data = match->data;
 	platform_set_drvdata(pdev, gpio);
 
 	gpio->base_addr = devm_platform_ioremap_resource(pdev, 0);

-- 
2.48.1


