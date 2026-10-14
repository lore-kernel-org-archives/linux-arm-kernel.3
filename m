Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6F9CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w+VXnodruUJPl19jPfHLhxfJZGqvtsAgNI1YLQhK2Rc=; b=StmyIgGjpbtUt8SQ5nq5IkW2gu
	ot1j1mDXezh2+mqmmIUmEkByuXfiCllVt7KuKa/Ec/M1Wr6Sy3E2l0JtSVljmiEyiD9mQ5fxSuvFX
	+9E7vOTYZkkQUBcZ9LnNSYiKw4Jlu8YIu1zRokRI1z+k9LoTaGSH40d0UH1ucGaC8Vyw6ZNyg5OB2
	k7MBXqo1SahpdteB5XBrcp9wD38X/uHIE+RDfaqdKJ/bA07yzFjlQmvi7OZfpJw0sSC8h04FwEiek
	O7dkSPy0QJ1tqOu2QSnU8BbVHAoX/4VdniC9pJPH7av8z/DEeira437RysoiX2MQlhzOxzvC1cpWd
	VKGJirTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5rH-0000000GI3x-3ZZm;
	Wed, 14 Oct 2026 20:45:56 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5rC-0000000GI31-1LYo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 20:45:53 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-33fb4680717so3690565eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792010749; x=1792615549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w+VXnodruUJPl19jPfHLhxfJZGqvtsAgNI1YLQhK2Rc=;
        b=PQAlVNmDWc8nTKYLNcIiB0SAHeN+n/cjQYI1Zlxxj5OPrbttVYpcu85yfNYvokG3XB
         88U1/mnYaqf6E4rvglfaROYlom/2aDYlz4jvqP+xQJiEaEVZnImggEyeKQUnjZE8uRjF
         tZZ/13z62eaAAxKdRn69OMXcafVkFIBilFB5VcrJKQAyu8AyfT/PnGclcci34qDIm3sD
         jyBAzwbnN7gazoteDt4n1oJCMezD1GenFeTMQW8udP6oPjcKK5LLZOiyx31+jdKwn/fX
         h471UsyYM6hH4EV2uaTh07AFe69krd1yD+VypPDmHBmDrI5BNo5orqJ1kCnbhQTvumMq
         Vvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010749; x=1792615549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+VXnodruUJPl19jPfHLhxfJZGqvtsAgNI1YLQhK2Rc=;
        b=qRbaQwtrRbiWyUwpBdT0zFeyQmJ5yHlC6TJ5Lms3+iLOlNssvRU3dYX7rrgqBxC54Q
         yaDA5lSZFpp4mlZoOVpMTaXPHC3Ij9LLgT7BWHpcf3Yz68pSDDyGct8FJeYnteby18/j
         xu4bpu2z+IQv+ioYMdphpm9CyaOp887XLO/498eS/YVvCrlxc+b6A2iIn/SlkYRm440T
         aEwRG/Gj1wT0si5xpkTaoOeDSGqHwACXJfcjD5Gkbaut21cM7drziseiiJG73YwZIvuS
         LpirfxVkIGUbDU/eBu6ZqzacRNDdAHVN/dtmNqmP1lqcD37p0pj2PyjDTuLZnhUQMrKL
         IV/w==
X-Forwarded-Encrypted: i=1; AKwUvBwFs14ELrQHB/n/uACa+Xtep++1JcBd2jZVr+ochh2cCLeIe082BxqT8n+pxTChs9mgMRiVZFKAF7GYCtXTQ1zX@lists.infradead.org
X-Gm-Message-State: AFq9FYKsqADBWU7jd5EFjriioh7S+3Azx9JH+nLnZOsEUpX09ccZvetv
	4ATze1mgEf6UGuUG6bXwYeDazDqPRxuTf4BnN4i2qJbUwOC64ckBq3VR
X-Gm-Gg: AYBFou1ov8XomLs6Gv5804jVuAxCCSXXHZdSvVXNyawhvL91MggG4ebWRw0Rgp2+cJn
	53HIpdx4GNJr42bX8Stjlxus9IYXvQD9hL+c+3KWNs6h08Jse5sqpvG58YcL09mtcKIHvcBV97c
	eCMLpnA+dxpymY6louGOxK3v2Qzb1s8EPPxHBXIkUWlvhBSRugSKdt27OPgzxSjjbxSV5lB7vJC
	+BpVdkN1sgLyQORM9kKQGLN4QUOx41pxXJgLgOhh5mtkMHfTZUvmiouGQ1mmhOi/VQOAvYlVGMG
	Rmydjy2M9QzHGUJhHbKDDFSBAxWjXCLFv/JETgF6aqNvK5C7DKBY5rUXOxhTmvI+oT2EYADnMLz
	v40Ygn8blnpRlTmNN0Fc+wi8xelrhjiJ9AUjyLpXCyltxMnRX68zHBpFdKwdbKLKNrJMgPW+HaS
	9CoodxPmTxf+bPCfqsy2q6pGaPMhc/8WDqAZhCY4qAyzzPDcM/EnK1yFYIoLuTNBd6bPyA6VL3Q
	InZ1cYywYLGdbrKBxodBDmhbLjj
X-Received: by 2002:a05:693c:821a:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-35c813a23b6mr8461466eec.18.1792010748588;
        Wed, 14 Oct 2026 13:45:48 -0700 (PDT)
Received: from hp-OMEN-Laptop-15-en0xxx.. ([122.172.84.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353810403e9sm57109957eec.2.2026.10.14.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:45:48 -0700 (PDT)
From: Jayaraj Devaraj <jayarajdmit@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jayaraj Devaraj <jayarajdmit@gmail.com>
Subject: [PATCH] gpio: lpc32xx: check devm_gpiochip_add_data() return value
Date: Thu, 15 Oct 2026 02:13:31 +0530
Message-Id: <20261014204331.15383-1-jayarajdmit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_134550_393088_35989A4D 
X-CRM114-Status: GOOD (  13.39  )
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

lpc32xx_gpio_probe() registers each gpio chip with
devm_gpiochip_add_data() but ignores the return value. If registering
a chip fails, probe still returns 0, so the driver binds with a chip
missing and no error is reported.

Check the return value, print an error naming the failing chip and
return the error code. Chips registered earlier in the loop are devm
managed and are removed automatically on failure.

Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
---
 drivers/gpio/gpio-lpc32xx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 37fc54fc7385..014eb8bc70da 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -510,7 +510,7 @@ static int lpc32xx_of_xlate(struct gpio_chip *gc,
 
 static int lpc32xx_gpio_probe(struct platform_device *pdev)
 {
-	int i;
+	int i, ret;
 	void __iomem *reg_base;
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -524,8 +524,12 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
 			lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
 			lpc32xx_gpiochip[i].reg_base = reg_base;
 		}
-		devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
-				  &lpc32xx_gpiochip[i]);
+		ret = devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
+					     &lpc32xx_gpiochip[i]);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to register gpio chip %d: %d\n", i, ret);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.34.1


