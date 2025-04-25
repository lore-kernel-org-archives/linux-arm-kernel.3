Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D87C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=86MPQpP9DYDVUcUDU5TkbLJWYglOE/j2zaAMUX/6YP0=; b=yJqD369SpfF0qe
	xn4oobAezzgonzijONdYql93arztd7WCODHmzyJOtt+8ynP6Pds44A3PMkNP1A5z6a6Md2bMu8k8v
	+NZJ5Tn7CjsvnFZyHvrerIVEqOx7xqjmTA8OzU/QmAu590iRJKjfCztIsz2OJOicvUO+YRlI6abT9
	b3jXO8nd2FaX75XlEvjLvkCr5g8WAq2isdKI2C+tSBbntZRr2WfX8UTpwAg+kN/tD5ajDVx0Lr2qc
	kyo6ZB+A8nFBhAZ6FaRriXaDZpmgZdLbv4Khf08rJHC/6euDpEEIevI2L/wAs/Bx/Nb1AsSkYGM0X
	tZFFUA2SqvR0DLvdzrEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Foh-0000000GdZq-1HY1;
	Fri, 25 Apr 2025 09:57:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Evk-0000000GSWa-0K91
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:01:09 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1788424f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571666; x=1746176466; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86MPQpP9DYDVUcUDU5TkbLJWYglOE/j2zaAMUX/6YP0=;
        b=U/UGwCHPSSuwY1sOaj31njTptnFDrAIlNpACxG7k/ZIs9tNB8ZY3znYpDgKzmixbFj
         f2Z7kV465IRmCVT97NlGsWdVtQbgYLBVXhPxyIHtCev1LTUocliI/p1ffVKWnDGLIUvG
         /QsHjvzf4gRJ11wTirznFPf0T9ab79Z/s5QlAAkUODe3i52Zyigg9QG6YcAJgvaoAukT
         L6Q6OQu3y8cROJ7Df5fJlDIx8o6Nq716xzSnq7RC0mMRDouppu2JMlox7JNc2ag1vgVI
         dFTl9ScLClBxRfZqt8lkt0qragjjD01P62kp++2u0+x+5yrJyscvuqkvoAFhTFotcev1
         xjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571666; x=1746176466;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86MPQpP9DYDVUcUDU5TkbLJWYglOE/j2zaAMUX/6YP0=;
        b=xHx4BH5nR4NTFoX6P3AOYAJnBJCNTi2KomEOicuvZhJL8IEdjQCC2CRlMpbw4wHbYu
         vamoHfxkSS3WZQ28ANzCR6GedQlqrU+3ra1TwgAx4P1jvLlHN/gJIpae9SVa8e8FrTTY
         ZK8min9NA4RdU4aphZ8+ZjNuuH8bUKr6n4+P3tFBmttq+2Adqe1T6c08mqpyNzCDiXqH
         mKa7QODmPnBou6/9xW1742E4LG6uVsS9BesN4Hyj6KcJsu8Bdb637FutTjU4HFksGtMt
         lgmygn7CONGW2Q4eTjuq9UkO5CZuptqpafKuls3XyO3I250fZbY8gH5HVC0rj0aqzzHY
         LOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpr5k53sC7dvH467p3a3fC9UfP78QgQdcnuO85y9bwgX+eER3jAErDyoWKL8/23kiZ1FNaJsiThJSQxpqwg7c2@lists.infradead.org
X-Gm-Message-State: AOJu0YyYGKTxBnY1T9vt3Dgo+9bKwYdlqFb9qCjejJmvYQYfZI7i6rb1
	I6lrVJup9hRJEgOlDf7M2763dJ74bHddqEbWll2eBrC9F5Rbh5aK9nq5GtDKj/U=
X-Gm-Gg: ASbGncvtjO787ndk2W8gIqEt1f/KqQcvTxtdun83twSF074PZV9StXzVp4e/Gx1Cdg4
	vRhW9OMm2w7g2fD9BawIX9YVYv4eI5dAbHw3rnspqH9Ha3wZO6lCNgw05jE+9+UWJgTKwplAN6C
	2KkcH0gxJElec3x0ImTOf9I8ZHzxNdrlxKdHOYD9NPeU/MDjZKLT+56ThSyydGVxOr8RYqvCMeN
	aGE8DelZNTGe+MEzLdBRWy939h3DTjE8uVKBa9clQdT8bHDw1qVxtMWjMpoqaEri4lhApgeOJa/
	Eher71LVBRdr43SO6HpWGkwe6updRWVyfPKlPeZkkv61
X-Google-Smtp-Source: AGHT+IH3OnIubuFCBwHvzDU6+k3f9N9mzQaSt1HB4QUYIlDhLHCrYidDLJkaQB3hjNSR8q+IxbksRA==
X-Received: by 2002:a05:6000:402c:b0:39e:f51d:9cf9 with SMTP id ffacd0b85a97d-3a074f42e7amr1207472f8f.48.1745571665602;
        Fri, 25 Apr 2025 02:01:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] pinctrl: mediatek: convert GPIO chips to using new
 value setters
Date: Fri, 25 Apr 2025 11:00:56 +0200
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEhPC2gC/x3NwQqDMAyA4VeRnA2YTnH4KuKhNFHDtlrSIgPx3
 Vd2/C7/f0EWU8kwNReYnJr1iBXUNhB2HzdB5WpwnRu63g24JT3CrgmzFLQTk8ZQ7I0fYfVFXkj
 Mzwf5nmkkqJlksur3v5iX+/4BviB2NHIAAAA=
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gcgSAGCf9S1xTbI3gVnPSPqXssP4QvQGlqxWgMXBtSY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09LShA4FFFs7FxYzWMo/1MzGZYVAv/t/XsCr
 XI6PnVu6PeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPSwAKCRARpy6gFHHX
 ci3cD/9iJ/xVDYLFM7DCh189mq6iSH435TREA5mvwF1xWjo5k+b1ttZTjFnkyQHXyQCVmygSLBq
 Z9xZ3BHypbpwD8ykxvnDZ2IOP5QkvXArTwYU7SsqEAOzsLQ1woH8qCK06dOj0fXfjuBxyjY0PGw
 w2iSbbza3dIiabeuu7ed8uAJmgBuf+qrUQon1gGImTXwyYRKJSIfMZ8GwIhD5sdVbj7IF+NqVv8
 DzQMC2pOQ8/uyaoz7DDypiT8QZ4VqNyIS0YCU0qAFOsud0U3LesVVNIr7x6SViXRDaeAvF5C0vN
 xK3cd28bek61r1sYczNp5XAWFZZbZE1JanSfO/Ra1m3UFNWhxrbsPuccrAvlUHcBd+fhP6AwVwz
 7ODzLYWquoOtJDLDMeGfZTaNmenKqsQZKEfw+5aryPpWSCrESUbP9AnejrJ2gpDGpdXaya6s84i
 YLIEB+KusN8gNbzPOy5+x2MF40OlbYfdA2479FscfDcvG3OIpn0AQox+enlI+1jVX1kX996qELm
 3kpMjMSqIMO5RaCKGxkyiWzmkBocfOG6W6iGco1FeARqFlZB7dOn8TNzQT/X2tlgOz91ag6PvPD
 3qfrDaI1aDWXGHlQWAT66D2q+8ZxvUHrB/4Qk0w/B/D7JwV+XE6BYhnDA9bR34WHbb9R7fzDspS
 GBnZdlnyiNYYxjg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020108_403952_B367A1EE 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the mediatek pinctrl GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pinctrl: mediatek: airoha: use new GPIO line value setter callbacks
      pinctrl: mediatek: paris: don't double-check the GPIO number
      pinctrl: mediatek: paris: use new GPIO line value setter callbacks
      pinctrl: mediatek: moore: use new GPIO line value setter callbacks
      pinctrl: mediatek: common: use new GPIO line value setter callbacks

 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 19 ++++++++----------
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 18 +++++++++--------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 13 ++++++++----
 drivers/pinctrl/mediatek/pinctrl-paris.c      | 29 +++++++--------------------
 4 files changed, 34 insertions(+), 45 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-gpiochip-set-rv-pinctrl-mediatek-1dd831a4d171

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


