Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70562CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=; b=0GiVHPIU6yoXjKATFi83RNRUfN
	NFAydVUStwUaLQ5lVAuqkvbyQxI8PNLQHU8Wa4+wfbFvunPaum/6BvtlnhrT2GRdFnojfPBpD9JlD
	AA0ed20xErYfsyN/LhA+J7jgnVDVvBwJSRJgIydPd4NgJ9a+PaUfC2u5qk7PA+YWvQ9NmN0pcSgW5
	7h6krKakfH2jEGZmkZjn32q9FTHZNm0MFwADMZ/g02kQh7bJbLeT55tZ7MXOwTByoR18VFegc31eE
	lYMH6UPg+KtfKPVQ1L3CtdMCykC2dRCU0zh+K1sDqr8wDime1ctQ3WkLcTF0FljARRGspRM6z7jwF
	NI3WdM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHP44-00000000xis-2bN5;
	Thu, 15 Oct 2026 17:16:24 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHP42-00000000xi1-21Ii
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 17:16:23 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-157fe9d771bso2672028c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084581; x=1792689381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=;
        b=SOlSz6IMpq7Ii6SdPxHjxVikpwXZWR6rBdhxwDjNbtxTU0Nnrh/a1GTkH2g7t2VlPa
         Pn4733WdoeN9TbsqZIzRvI3W9wOjanxg3cK5NrvELwFJGos9kvUwWBBiJQf0ZceQOnLp
         D1mssFkZ9LVpAcy7OIczeBvtdnCR6JmoXaTE28XNrKHPBA2eZbQ1u2vn0D8O5WtdZb0V
         mXVBEgYaXSxnVigk193faD2ZF/Pv7Qhso8EGaevVxlR9mW4W/B71j4sIfVyMmgFRWJbx
         ppAB4AAJjafF4qWa6r+WrYGXmhEa3/0xaxFgPxE7amPouxZL+bwDoOZAwkmHPIbqUBd3
         HjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084581; x=1792689381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=;
        b=XM5aPQfkOmOiIEawlEszLhv/oWi2F9QiPNI96cKRTCs5bC2NpE2sjyTVyHyEH4aI5A
         3xoMkjGIUlmrrQvuTRTMTGItoNiiFv8fimnW2jwi0gk5wjokrMKilu3XNIMhl1/CEkip
         7ErOdW/FZp6NimirII/fL/gXmDTDkopxUPIiwdak55iziqGK68dGaCDKDDhSTaEaxTLd
         Chwg1UWE0xYVxG5yC1KBdknb9YU5ZrPg9ZNqs3WRsYixuLo4c4H5qpzHqPce/94yzGWU
         28UwiHGxt+shh77Oj3hFEUJ/ZCTDwshD/RY7Gq1agCMepOGy7+Uu8O3J7OFOENaV9x1W
         +xvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLSVS3Z2slJyVu+D6vkYkm9/cstiph5QPy8dxF+EMQ3KXSvXIBbzKn5fGyUgcGfNRgNi8SyBHSwJ/FNHuizXlJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIPV72+S+O+DBDxemcuKHrtaLN/f9Eh+RCOI6d1O5xSk9hIs7sS
	O/fsaWmwxgErqHQ47r4rJ/0hRsxdC5K6Zbq224CUfKPUA47NmWpmaoL7
X-Gm-Gg: AYBFou3hQOGacz5fONHCoQScwvNCnvBl6rfgnl4e3Q6lSj8siX2odScqpFUSAGA/6pr
	ifMT488fqYVxetk9P/UvmhxpsZ0Xxlafbnh0VoU6d7fqFcDT7TSnW/bqb/06ctPOs2+Rbcxpizq
	TeASwDaOb9TE7J6fxEW818g5HVG2j+bJ+Pu104Nmkjt00BUrPk6wnFDuob90bhVTtfL4nRzW5ER
	dlWWdKZitirAoV8yopinPrmZTNnVDpzglKocBJRKhVUdqpknRfld9dis85y+gl2wU8LQcstdAfB
	6fPSFG4PSJPs+80XbhlF4gHK/lbTsO22zdrQ4NSsZ3+kVOno353bNwg1PYRf2ayrpMhu5anZgd+
	73uEaNfh+fz5HQP0YY//jYm2+X+daRdHpFw0bbICLJTGG1GsY1EukhHTDTw7J0WlVTYmjbcpUj8
	hG2v8cu9SFIBl/mtL8rLJS1AcrwFHKnMKtJiEWifjeHV4oBiO7gaAho77FICeVTVDdWYfn/sb8I
	7GWNzhObhxZBMvl4ZQ=
X-Received: by 2002:a05:7022:1608:b0:143:3da5:cada with SMTP id a92af1059eb24-16a610ca97amr21923438c88.37.1792084581384;
        Thu, 15 Oct 2026 10:16:21 -0700 (PDT)
Received: from hp-OMEN-Laptop-15-en0xxx.. ([122.172.84.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a66aea30sm318532c88.9.2026.10.15.10.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:16:20 -0700 (PDT)
From: Jayaraj Devaraj <jayarajdmit@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jayaraj Devaraj <jayarajdmit@gmail.com>
Subject: [PATCH v2] gpio: lpc32xx: check devm_gpiochip_add_data() return value
Date: Thu, 15 Oct 2026 22:45:57 +0530
Message-Id: <20261015171557.21243-1-jayarajdmit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014204331.15383-1-jayarajdmit@gmail.com>
References: <20261014204331.15383-1-jayarajdmit@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_101622_524417_888FD776 
X-CRM114-Status: GOOD (  13.62  )
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
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
---
v2: use dev_err_probe() as suggested by Bartosz

 drivers/gpio/gpio-lpc32xx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 37fc54fc7385..7fb46262e18c 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -510,7 +510,7 @@ static int lpc32xx_of_xlate(struct gpio_chip *gc,
 
 static int lpc32xx_gpio_probe(struct platform_device *pdev)
 {
-	int i;
+	int i, ret;
 	void __iomem *reg_base;
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -524,8 +524,11 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
 			lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
 			lpc32xx_gpiochip[i].reg_base = reg_base;
 		}
-		devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
-				  &lpc32xx_gpiochip[i]);
+		ret = devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
+					     &lpc32xx_gpiochip[i]);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					"failed to register gpio chip %d\n", i);
 	}
 
 	return 0;
-- 
2.34.1


