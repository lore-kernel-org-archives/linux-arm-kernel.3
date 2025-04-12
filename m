Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3850DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 19:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vGbdQ7HwZ6HfRq5afBeoyIwhWt20XJHmLncrgBwuDwU=; b=KW3HfTBR5V/6/dQd1oRmihgzTr
	PWMcpmak1B6hzA5fwFtPh0y4anKaAQO6+GXF7bNks3ISmT1NHa9TDZJnCdtnlrtGtgX4S+VFKLj6m
	bWNsd4OY5n0EVH1UoGpEiWasvovfs8kalSQl6A9ulTu9UyC2IG8TVKvVtgQybSVYw+6+OfU+VAgvW
	0n8eDZvXAHnn7NlIqi8o6pLbVhfduCF3EHQaLniW4kgcbp+fyQtakOLI/EzLdVvBJOLT/j1oSx5qy
	K9VPsGfTjbV7mu9BUL1WXrPEFTx+pXJAHj3FKaoZJseVR/8RFV28XU7tnn7nm53vOWg/kFj4UcGbZ
	vG6gSZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3gbu-0000000GLZF-29iv;
	Sat, 12 Apr 2025 19:33:50 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ga5-0000000GLUc-0DGm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 19:31:58 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c5f619cc01so52909585a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 12:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744486316; x=1745091116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGbdQ7HwZ6HfRq5afBeoyIwhWt20XJHmLncrgBwuDwU=;
        b=L89ENcp76EdbhipdKgyI8qk/Bi6nVZKj/q2A69aMnw2xrmIARPwDESaJk4HJvoxppO
         d4cAstUofVycTIh6KQg3g/oyqC3yBua/4egaRA7ETVRNyYs1bSq7j+FG0ruBjiiXS681
         6D37rvsdzmGEyHKhSEoMU0r3GcPexDfC/z/otqJnFXcEDY4RgBzgTs9N3nbDRvtSU8Yb
         UzuX9JYMy17JkcBAguR46cq1rwqTIdarNR1c8hW7KTVSfzvxKerqwVeVfgzRLztlB+4h
         rroqVtfwm/PA3pqTb8mUgOPuaPrpndI9lHCiaKwAKxWdonQ+DdNGWZeYBBYz3Q/aKLgQ
         Venw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744486316; x=1745091116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGbdQ7HwZ6HfRq5afBeoyIwhWt20XJHmLncrgBwuDwU=;
        b=kkKMXf5kXv2zhj3rBi+RdcYti73SxeMHjUpbEKNwLcd0X4SdTXttM0XVe6Vb9fDs/s
         gHg6IhHraQtExy/rCoZyRPJpVw6pMwkWja1Ii3ZRBRcQxM7IlHa8bdSuVsyVu2QO4y8a
         PL9Cuz50hAZBbwTyesdWsH7n7PaUJgTPsvO7BB5QWY1RSMwCxbrvLEhi6ZnTHeu6Lqxs
         BOYuz2mzc1x53pXgANU7fMk+/c17iX89tMcab8Ztl4+zceHCMlid8FDODeCoRbpGdOFu
         pYxQp0ccv3H3Ob/cYiCtBbRt3HG8qcOTtJ5lZUO2EtEoyF3fVEqGO5i+4EHbRsdrtDY7
         L76w==
X-Gm-Message-State: AOJu0Yxim2LdByqZsk7ae2D8Y6DSKoF+/hJAfE3hDwGzcCbNF62FDNd9
	WKouiC15iswRirkKInI3gFRArANSS+1YDdYqdNaocRFfABuVxgg=
X-Gm-Gg: ASbGncvFXoHJOctgPxRPRxk/C/45hRzAsw/w1BWD4djk74E3M7reSGsoHOOKp+6AVJ3
	VXgLNkVuqzjQpeFHprSQDblOR583BuDbAvJrd3tAFIcJhkSkmj2jOevply+u2J3ORaekMNuoQeF
	2pTJkVSAx6Fo3LunSfz+Dss3Tf7IcLbhivOxaFrqRLELHWF4EVMB2O8Bda5p3Lm2zeKl7+MNn9y
	rQDe49d2LrXZ0o77pJzGcjj6i0RdmK7cMrfKR5azY3Xcp4XkTtC1P5huhAynBeCDrBgznUQxofJ
	wGvpvwZ6GqtZQkKnvsQPMgOFmMKFva1FBOqx6A==
X-Google-Smtp-Source: AGHT+IFwgsYs5JKfro8N+GKqLf/zqrbnDwJzJZWtKxHFomrdJnX8s4fGcuPU5JBg+lXyqUl2hEGWJw==
X-Received: by 2002:a05:620a:29c3:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c7af1cc7aemr400679385a.10.1744486315743;
        Sat, 12 Apr 2025 12:31:55 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0dc9fsm443192485a.96.2025.04.12.12.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 12:31:55 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	theo.lebrun@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] gpio: nomadik: Add check for clk_enable()
Date: Sat, 12 Apr 2025 14:31:53 -0500
Message-Id: <20250412193153.49138-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_123157_107737_1BDDD276 
X-CRM114-Status: GOOD (  12.81  )
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

Add check for the return value of clk_enable() to catch
the potential error.

This is similar to the commit 8332e6670997
("spi: zynq-qspi: Add check for clk_enable()").

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 966942ae4936 ("gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/")
---
 drivers/gpio/gpio-nomadik.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index fa19a44943fd..dbc4cdddf4df 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -262,8 +262,11 @@ static unsigned int nmk_gpio_irq_startup(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
+	int ret;
 
-	clk_enable(nmk_chip->clk);
+	ret = clk_enable(nmk_chip->clk);
+	if (ret)
+		return ret;
 	nmk_gpio_irq_unmask(d);
 	return 0;
 }
-- 
2.34.1


