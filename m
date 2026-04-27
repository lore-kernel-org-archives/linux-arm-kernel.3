Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5B7FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 02:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eNGha38KYXK7mTaNFdD1kyRzSrZGKEbgGIpx5vaJrTA=; b=pUCmgL2Ynu1QKkvQQjfRYTIqpg
	IddqwYvY+LnDbbpqjEdKbNheEllmmvbjPyx2RiKxfLjw1byaxMrIY1p9Old/wkKXu8+4fbtzREJuR
	HkF9HfVdWNJK4g0x1bdnlI7ECo9h7hmCYJy0Muz+x6utw7Bjq7hbKjrCXXxiWQYT51+gV8+lCADUY
	iiC3UQwQD+04la9R6NKep24Qb3EFrUi3MSE4JaSG9rOCFh2egydQZ5ZCepnaPBNy5hxkHmkDrQcDJ
	Guccqnio8hnebkS6uTRrnc9f+rXsjy5giMLm1CezazRikya60tJzbcOiymxUIqmaNMCQuhnGwVlyw
	Og6Cn4Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBQq-0000000G2Ns-1vEr;
	Mon, 27 Apr 2026 02:10:44 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBQn-0000000G2Mw-05jx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 02:10:42 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so3275431a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 19:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777255839; x=1777860639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNGha38KYXK7mTaNFdD1kyRzSrZGKEbgGIpx5vaJrTA=;
        b=Fp9/9x9TKS81sfpXuE9RoPIiCGnoKZSFv4Td9affMoZhZ4+73KtNHM9XvDEABw8m3f
         MFTMBFICBMzfbMylb1DMsoM9U6RhckEvBVpolsuJ7lUVuF2m5e1gzVyXoFVuVIB9VQU8
         quQ3oUFgowgWuMcsG3sIFRy4yuP0XMf3SwoHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777255839; x=1777860639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNGha38KYXK7mTaNFdD1kyRzSrZGKEbgGIpx5vaJrTA=;
        b=Q2UD8rdfm6lhOuYGVC+sp6X3kyR+m9zT+p0Cmulxwi1wp/ihTzu6kYnAVNudXWTOGT
         diDzJOzRzUcqnBwyfs44R4fO/kkkh5ovGqZybFCIW4J2UGTGXk7vicSLkn6+gJOyaTrt
         ztgFf9u47dxul4iKSIsIg/4LmuR3+50yJLHg0ZUcz6MFcS1H8zIi03YhVyQKwyTcvYV+
         BIBUnIV1fxVu07M9wLhQqpk7YlP7u8DLhuaz6Qax8EnXk4SomWDkDF3eGjPd8D4GQclq
         YW52SN3Hl0AwC1eixJIRBrPHjwUqO4/FCRsxlmeG6+rEQ4S6toQv2g6JIgyIqluLM48R
         hjPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/47kjNx+fMkRkUugPqt4SUsY86d79eEHtoV8BShfayXzEetVZm9fhceQ+uZigFZ8+QJ7hLuRMM23GUZm0ndXMK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy10dHN5RmLGBwUlCdtwtDA8XFPbWot9v9aDJ+pFbmmf9Yhf0eW
	4punseEor+B5a90xSC3IBWvk4Ora18NvnJcbhV9zhTDDrun895TYTaqNt2F6fcmOyyX+97hPqqK
	/Pm8Abw==
X-Gm-Gg: AeBDies+tRgw9pwCX73SYPPdwzWi5NAASRN58UTt8eBPqMbxxAnf7tJmqkKrCYv1Tav
	op4G2T7OvWA/Tm7bsLP4LK7luSCC//c2SQal+bw83LjXcKeb1Qwk3kEIjMhwcdGhFe32o5ZLEBs
	eOsC5Al5EBpZfs5+ZJUD+ed9oeP02uPQvarFDkF81Nw0KhN/MZ4apgsmiBSmwORzeRXPhb6BiPY
	CeyyFf3C3QK3RnGVBe7NBQTvTDPERGOb+xAuTxiNSv1ovu8RxWPQe4tN6YIPi7VR/ivgKlpFK8c
	BPz10cV+IehJlFpQZL9jDEIeBqCyt18p5XgRpgqOQq4VyBDa0R7lqT3MPh6wEXDXpWEcSO1i4f9
	ZUkI7tEeN+TtCH9e7CY6eQGo0lstVI796QOl7vPtvUDW4RPH2QN6uW4MeYIkw0MIicGnK563G6p
	XIqcZMWvBdZUjGctqTwP3wUz3ufVRhGLEHeL1CuskbNAKpZqBTy/ZPW+CbGIpZB1Zz0IZWWNPYZ
	6r/eRge83vScJg9z4trHAiur0muWg==
X-Received: by 2002:a05:6a00:c81:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-82f8c908083mr40534324b3a.43.1777255839376;
        Sun, 26 Apr 2026 19:10:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:8f3b:cb24:e20a:84bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe41cfsm33097883b3a.43.2026.04.26.19.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:10:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: paris: Directly modify registers to set GPIO direction
Date: Mon, 27 Apr 2026 10:10:19 +0800
Message-ID: <20260427021021.2049015-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_191041_104901_FEBE5B85 
X-CRM114-Status: GOOD (  14.00  )
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

pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
the pinctrl mutex. This causes a gpiochip operations to need to sleep.
Worse yet, the .can_sleep field in the gpiochip is not set. This causes
the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
whether it can use a spinlock or needs a mutex. In this case, it ends
up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
takes a mutex. This causes a huge warning.

While this class of Mediatek hardware does not have separate clear/set
registers, the pinctrl context has a spinlock that is taken whenever
a register read-modify-write is done.

Switch to directly setting the GPIO direction register bits to avoid
the mutex.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 6bf37d8085fa..e4c0bc27d984 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -886,19 +886,24 @@ static int mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	return pinctrl_gpio_direction_input(chip, gpio);
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+	const struct mtk_pin_desc *desc = &hw->soc->pins[gpio];
+
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, 0);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+	const struct mtk_pin_desc *desc = &hw->soc->pins[gpio];
 	int ret;
 
 	ret = mtk_gpio_set(chip, gpio, value);
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(chip, gpio);
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, 1);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


