Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8B0C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZSG2e6Oo70EYCNnyg2ytHClvaVnzvr6s5xKl7gP7ks=; b=YWyCmNLH/oZdTSIjqZvXnswV4t
	nDGaCeQwA3D73o//LLavasBvT6vED2f4545O9J62r6iZ3XlEudN1XTlR6P/HoCRt0MK2c/5cDwmEV
	JpGeVhABxBde91otUDFE8TxNpAWFTq2m222z/xgQAaf+TCep9pcmluq5yadjszU2w1bJwrgZvhO8x
	tkWbj4wcjJj9EH0xdqUCfIHvthMzSkFqyMkO4da5Ei8+PY4+eHn+V6s9qQy4zqZP/8XhijRPfn0rw
	4+PCfmlSWHsp6MDBbPWcvN5n5nkeTRg+kcrzUoUT6sjsCeR10/4kn10aHll7dT1LNskdgxNO6YiL/
	xNdcvF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHow-0000000GBHP-1qI9;
	Wed, 14 May 2025 19:31:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHd0-0000000G9Vq-1oXr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:18:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso1193535e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250333; x=1747855133; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZSG2e6Oo70EYCNnyg2ytHClvaVnzvr6s5xKl7gP7ks=;
        b=XcJ7EkTFAC3rhkttOAIic0ArQBpVUVegSH+1hC+5ybl2u70XxQicJZ6Q/vzBOy+T3e
         MbpUBRVqQTrZmZw7SZiBnYLFY6VjXgQYypqqfGkOqsjzBGXB0JFhz3kaMXcW6j88HCfA
         kDeTMKfRPgE+KYiLlFr7RxoDPzqR+vk7iTladWBXu3yrFUsME4vC6ALcEQonPh3SfKbi
         H/5cpdgquMAa8B2W8mcH1cGF8Gge9o/3YOvX1+Ja2P2xCCK9eqNHu2Kcg3Qz4i9GCtLp
         CAG1SMwp0bPfgaUh40/ky7L3L4AvgK/NwgTZROEGNp6hMJg8WEsjiuS63ygiRCJfHesq
         efgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250333; x=1747855133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZSG2e6Oo70EYCNnyg2ytHClvaVnzvr6s5xKl7gP7ks=;
        b=JXODS9rQ2pr68EbsoEL4Cg7Q9hEsY8sXUdxsKwK3Hlc64dpY28drjvnWKF5PhOPBMb
         6Lq+OtADB4XRAqQi82nG24zD7glJYkb2UR8ndhYJD8bWGM+cALOnoE55jpzDuvUSCUYe
         VeengZ+v4+lrsMaeXpN5DfClv2O05Nid8X5SY+CuIVTIi4nykDf4VwU+KEU+CAYM/neN
         hEDWQCrNHpEAEGEPP33YmYZV1/vKXg1nIxNUdqezXBWLRsCyLDUc/hv7/TmaCaYIwoab
         KKe7QBxK05TstvhA/ytjWXvu8xQZiWCoF/zL/L19Ke5eULz/Be343ZuPiLkWrjdOJVcP
         zfBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyETolnQi58JurUiy5BnNMHHVeVknwhr4qLon186HlvKXguLWQB9JvYm3OTVoRgsjz2pwwlP0PCJsj5NMiMeLM@lists.infradead.org
X-Gm-Message-State: AOJu0YxjgZ7ICuunRTvKxTSUTUSjbtWAGjT8XpO0dIoeDElYCOqYxaTU
	aTxyyHbpEL4isfdswoO5k71NPV+JlzPvVGxEJ2QrpwDEgQHn2jqK
X-Gm-Gg: ASbGnctt+njKjFr+QOwEJ3XQYtQVAxOPRyd+87dNzBecPlZxETGrAsGIjDOvtDlfj3n
	yd1AktoSfNCn4qfW+pldR4+BaKMu5NiFoGL17NlLy0+oYIzKWQ0jbRMvKzRxBDXwQyyJ4DSR7pE
	8iYZmy7J2sUQgQz+lQ3FRVh3KuWAIQP1TSt3GaA5T2oZ+nEFZ5waBMJI43WFXqF06qZzjzdH+z8
	Uk7lPAyDL7AnHbk43U5alq72SqL/szYYEhYqQUoL7cj60cxBsmU34UT3j4QULKG+hXyrgSuoLXE
	UtbyHBfKWO0tYPOPor9mj5puqXl3hvTnqUlqJknzBm/phhnOT8cfNWTfHF/+Zbxdm3X24o2JgO6
	Imz8Z
X-Google-Smtp-Source: AGHT+IE/FzeiZP6erIxPU2QEOlCFHyMatTZe9U11qci64whMI6XJiG749EI5iSektYWhvPKKGSJZ6g==
X-Received: by 2002:a05:600c:c059:20b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-442f285d105mr24526685e9.2.1747250332437;
        Wed, 14 May 2025 12:18:52 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:52 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:36 +0200
Subject: [PATCH v2 5/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_pmx_gpio_set_direction()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-5-07e9ac1ab737@gmail.com>
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
In-Reply-To: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_121854_473658_353F67AE 
X-CRM114-Status: GOOD (  12.55  )
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

The armada_37xx_gpio_direction_{in,out}put() functions can fail, so
propagate their error values back to the stack instead of silently
ignoring those.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - remove 'stable' and 'Fixes' tags
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 2e88a0399d1a205064b58890db6477e2202bf311..aed0069b085ced5867993e95e0244df7ccda556d 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -472,16 +472,17 @@ static int armada_37xx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 {
 	struct armada_37xx_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct gpio_chip *chip = range->gc;
+	int ret;
 
 	dev_dbg(info->dev, "gpio_direction for pin %u as %s-%d to %s\n",
 		offset, range->name, offset, input ? "input" : "output");
 
 	if (input)
-		armada_37xx_gpio_direction_input(chip, offset);
+		ret = armada_37xx_gpio_direction_input(chip, offset);
 	else
-		armada_37xx_gpio_direction_output(chip, offset, 0);
+		ret = armada_37xx_gpio_direction_output(chip, offset, 0);
 
-	return 0;
+	return ret;
 }
 
 static int armada_37xx_gpio_request_enable(struct pinctrl_dev *pctldev,

-- 
2.49.0


