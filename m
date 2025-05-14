Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1180FC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaL6y6eAH+cyG0BHc8g4kaknwTTJ0ODkBusGr+TVtqA=; b=oFz/Q7RDz+UsTGflbX239IXBnO
	Q+z5UV66OvzOYdshvYCrTKw0gyZkRR81m2vbID/rMoCSR5BB5oAnAvbKb36rjdlElbNM6noevQwYt
	PMRsZscvJBYYskTsZp01IHZizjzlDuHOUn642gSv7SexS+JexcIj7F4KHBizpkwtsrCOM3HcQwBKX
	DPY2mcGzZKYqFHPUc0WbxWeX6sqsoR7ZJzv208srBEJHL5kKrU3y42fpS14sC3d6Y2oX00GF1/puQ
	JiJfXDRUyqPZSGZOlrbyjjdz7lPxJLuQubJdchekb5e9DQsdHc2ad6BQ5u4rtBWfKimC8AiWnABKg
	ZHfMBk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHsv-0000000GBgR-3jxw;
	Wed, 14 May 2025 19:35:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHd2-0000000G9WU-1Eoh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:18:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so1698625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250335; x=1747855135; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaL6y6eAH+cyG0BHc8g4kaknwTTJ0ODkBusGr+TVtqA=;
        b=ecmQvKxIgVw1ODJbDQQaMD3zh2DPG8Hb9LGXmpYGCszfnF7vVdv0D3f/NFmHTo2BL1
         iEVf03+awV929vwIlAX1jG3/NjmT5EXCSgtv397W35FnEatU6HAiSl7jw8zVKhwDI3HX
         LF3yKXY5MAwjC5RyVD/LfUxDpruVWicZS9Js0MlTa3+nkiuggczkObDP4zX/bHBbT67j
         zV5lPhBL84RHSkHiUGx59jFkBLmx0ecJ5r7z72vRSSlCyEngVaaww70vHTi8HMny5viB
         s4sIWTJLjDeZae76KDRHGjfkJzNAtWqWx9BaDwVoZsIXlmfeEhzDW1Np6g3EMSywxmyR
         vtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250335; x=1747855135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaL6y6eAH+cyG0BHc8g4kaknwTTJ0ODkBusGr+TVtqA=;
        b=ddLIrueYZXVbWtBtqZbsKOOvN5RD8VCGygtW6BHY6B5F9kAdF7tElSeHiRF6fCv/um
         iWZbqXTKpEhnDnmt+uUdwfTcT+IgfGgJCbBiXdKqxxYwanNGAPwbRsfDlFvBCuLTFuYy
         erYA/1m+QmKiNb0FShf83QLX6HKt+7Zb9EEEK/dZK1GYGxz6UQm+XqyhaKDnsbwhHm3B
         cZNHOxlSPP8MdelpTpkTcUpg94kLHQ0IiWZyRjdYfzGslCaPwJulyq2trRpqFfPtFC8g
         u0aQHA136qRcKucsrmqFe3bJWMUVJbB96BcNs97xPPiG0w7vBZRbDM0x7cdldn5sAB5H
         zOGw==
X-Forwarded-Encrypted: i=1; AJvYcCUzw746bU+CJ0Z9d1bRHMBOAnhW8Pi/9nMr8n+reuxy0q0NMh9d1uNsFGO/gNz+tknR7CaH7fqaZNFGdR4uvw9O@lists.infradead.org
X-Gm-Message-State: AOJu0YxO+FoSGIAx1xUAy74aBVSVHio3m6K8xdetaQDLZu/HDP0UDwqJ
	KYX+CjA/CclZpxclaTIT4u1vnEvBoJl7kFpqT/5PgWaOFIwn4R10
X-Gm-Gg: ASbGncthW7TstcmJkVcbmAHEnGmxqU65YVLqc2Gsegj16OFjpdMhYIPYE20p3MF+CYD
	IlR7f5QyLzl643GkeG2j1iAoFoX6C0+GJF/pbTd9p2DnnETLHf4SaYUPX9vL2bBcj6tKJSJdgjg
	z1l4YyjVybmcAnlXC/CW5pi/1KReXhdeFy5eAaT9nzRtFQt5IprPLtuQcGu7WfJVJ1LxlTTVbqg
	F6O/vN+BDSl2BPguNt8KE1BGSQ4fe5qlFndtxJ4A1mDCKxXum41qeQGjqvU0rSpBuf2+EGFYa28
	v+j3zu0lLJE6N5dTjrdm4+/uGTQfdJxR4qFq4CgfN44wNZoOS+4i2nwdJxSfcq6PiryJ6WV+Lo9
	euCPTHcg/L+AWYaA=
X-Google-Smtp-Source: AGHT+IEO8Ku9a6HIDYbQtu7HYkIlwiUHOkaMZWGq1KsWHgfBv9ZWFnMh6u04RTRwJ+/8YE1l6aQXSA==
X-Received: by 2002:a05:600c:1e2a:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442f2168cefmr45995485e9.24.1747250334905;
        Wed, 14 May 2025 12:18:54 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:54 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:38 +0200
Subject: [PATCH v2 7/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_pmx_set_by_name()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-7-07e9ac1ab737@gmail.com>
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
X-CRM114-CacheID: sfid-20250514_121856_335926_EB9B3E39 
X-CRM114-Status: GOOD (  12.60  )
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

The regmap_update_bits() function can fail, so propagate its error
up to the stack instead of silently ignoring that.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - remove 'stable' and 'Fixes' tags
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 18c6c5026b26c294ee65e3deea02d2e852e10622..f35bf0cd98c97419ba0ab0291a23d4774a595d39 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -358,9 +358,7 @@ static int armada_37xx_pmx_set_by_name(struct pinctrl_dev *pctldev,
 
 	val = grp->val[func];
 
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_pmx_set(struct pinctrl_dev *pctldev,

-- 
2.49.0


