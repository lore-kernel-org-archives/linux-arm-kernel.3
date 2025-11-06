Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167DBCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl8B6nEMFNCaIMxBOpENwK7soxjPDYqVlsWMLGlYbqo=; b=XIBo4N2qpbGNwKa7QqS+dEv60i
	uMZ/pEKjw0Rvef/N8PJUCwI6DY8JvBsE5THss/u+A0oVkxTEZ9aQK5sPHbfp+OaR8CJYRwtzfztCd
	oK034dub+avQix+GVhd09HAb4p4kGMZ8WBLXa/DmkmZFFcReNNtEwrbhTtCusELP933bXKj3znyCg
	lhOcdoOodMmIsmroZpgQYx0xejBB/CAs+J0njyxsdnKGboqL57xv2KGWotvRaxlmNbV+v9oUz/63s
	iiWQIQkfoiLbYTt7tBXVlLdvyYVzUy+9eWKnUHqGJ9wxVe3oN2sGiPtyXk2hxiqn4bF9JpOp3UNwg
	hWoujCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2uB-0000000Fvt1-1RCI;
	Thu, 06 Nov 2025 16:32:11 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2u8-0000000FvpS-1MLp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:32:09 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-640fb887e26so226709a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762446726; x=1763051526; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nl8B6nEMFNCaIMxBOpENwK7soxjPDYqVlsWMLGlYbqo=;
        b=aWGckRt/VojRsPVfNdVGRW6OZ2ISGZMNNk1Zv+OTDS+mn2L91B3Ra/JDmCieD6WvzN
         yrYGETDm0cyx2S/uUVgp3oftkfA0L8AtHgLEQBEa0uyzNX+aV1TpwqH/rOLnUB0kBeAO
         g7LGG4sLsOFjmDJ+7ytT5ZWfcFGn/aHyQYZlWTcGsbMnb1k/ateNW/+PoATIhARhH5vx
         +PQcP/JHRX9amckW/D3fG/CDl7CtulbZZR71CL4h3zgCVPPvC98Nh9uZesmT6tAUFYvD
         E/cbia8fGlPQC4i46+I+5nbdogVkW49Tb2ITXnu3wt/YzXMPbU1XkQPW1/Y6LjjjUJcq
         G6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446726; x=1763051526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl8B6nEMFNCaIMxBOpENwK7soxjPDYqVlsWMLGlYbqo=;
        b=C79FqbdmJ4cxthjT6/aB8egMbfX2gVtwcKgXkfWU/n/XGwRAW29Wrb3kLhrygEwc5u
         Gq/CZRq7i3BW0Hxk2fxXoJQfRuPUcXtqGYPChI2MPyjQM9raA7YcXyc9JdDO6XM2jphQ
         E6AOoU0pF+apMO5EwRrz90ak4oSHztHngsNkMtjTbc+ueFFmLlEfYBZ/SQVvJ0HMESir
         cY1gSzfqJaxeTDvjTk5XWyozJd3YvK/usK+K8vaVvHDApO083rusz67kgmUDclkeWrTa
         BCloQ/MRnkfnJmionLDW0EwQ4k+QgCxhDBgCd/uFofxbB486ubKiq2xq7FjcmhmQpmhh
         7HDw==
X-Forwarded-Encrypted: i=1; AJvYcCU4ji0ZDpMfAwSPsjloECCxNFVonfPuJdlhQi56ofP4wiJSjbrPfxPQA5nqTaHdMQpexCdWqqWf5HLMbiHtbb30@lists.infradead.org
X-Gm-Message-State: AOJu0YzLKZh8tEuVllJp5yVC9908U7rUcyOogXQHC6WxHtFzbM9N4dCf
	WrXq+9AH99f9wUG+SuLtN1kPB6I/C8eovZ3g6aTTfZnAa7MNuG+/G8Vc+mVTR0cqKcI=
X-Gm-Gg: ASbGnctpSUQC7ex1OeoYbGQOgsh8sbb5ggE+MtKBpz9SivxPWGgh3YRs9GWGuv6sUkt
	jIiskjYjfnkTnPf7ZOnoMIeIwAFBsaWWC6QQfhP3QdOTOUTIG0MEd5sW0n/5h3I0gHEP7YQEZOK
	mq5rV34UPLgVcsbKTc6IPsXch2qTX6YoTqvuPo/eLTcuIGSLtemjOITtYzLAlSWvDVPOnPmZUCW
	ZGID5IDx3/0vrG6jqfvsg78/KakVlAIc4QvM46GhdycPKY0j/A2sj2qEYhnRjaQfJw5VsWk8ZV8
	JXGeS8x7ny8RDRRECLh/RQWF3lqD461o1QbtUYc2DVpFbAOlqjvnjrp3SYoYdyDgclW1Ofcioqx
	t5nRUvddbElSzFJF9LfhvR/jc5ZyQKq7pONKVrEkeRH3N9AWmjWw/pUHjWi0WlsJcBcD3U0ypfO
	l8UjxUxtMIp2RBNGKjwvJeGpxkrpqGydiNBbo/IA==
X-Google-Smtp-Source: AGHT+IGNSl1Ed2xXDzHWzebcvMpuMKE0I1VybzAYLIxqfGPNLYgMk+ia6VoGdXlED1r6tZ/tH76vzg==
X-Received: by 2002:a17:907:7ea6:b0:b70:e685:5ac8 with SMTP id a640c23a62f3a-b726529e5bemr390647166b.3.1762446726359;
        Thu, 06 Nov 2025 08:32:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289682544sm249625566b.53.2025.11.06.08.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:32:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:31:54 +0100
Subject: [PATCH 2/6] hwrng: bcm2835 - Simplify with
 of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-crypto-of-match-v1-2-36b26cd35cff@linaro.org>
References: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
In-Reply-To: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
 Srujana Challa <schalla@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@axis.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OSkOsUuVlg6GLdS62ttCYUPhNKUQP/BVpUmRlzCzTaI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDM18i3ym17y8uHBLXLjTcNt6evy0G+AKTl6Gd
 KTpxitcse2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzNfAAKCRDBN2bmhouD
 11svD/9xYqmLA5ExQT3JeaxEHdcTHOHgHeupGZO8K921owhdrik9RujjUgBMCnQBrp53sjGaY4p
 KLbKsGzvIxi221UDIU3IrSgbYL7KPyXLMc9CzNt7i2GYvSm+MeOTy3sGLlDOQDC4feFji7+rd8e
 m6DlsXUqamrdzqLXQUDqslEsZKS+DMwZqT4W5lN/YiX/24PxVruUrJyf2mUvTwnySDtjp4m4l4s
 qJo5wFGyjtr2+PK5AED2MayM0EWroY4ihWedi1UhvK/wuocjHlqKEsHKwHrAvFo77KBZH7GB0PD
 c38ZqHOO6Gry0ggpbIS11Fz3PVE/Ndq6gE1K5IayVQpBj/YwN41QalHiumyUbxqthETKpyfTEuQ
 Qdb5nHA1zckfGJPGPvBQQLOByJWSFhhklmKbZHJgjioSz4FVx6lw46Xw/gEg+bGbOI8KgeuBm/d
 omVXzSxWYONHkIMnI3/TcxpJlMftG63wJWuTx8D4HFTg2QeQzI0ZPIPN/ExHreXYWGGJAVGk2Uo
 T1ImI3PJchId3h5YjzhIBuTwfmR6Yv3L79nJEydV1A6O9Ei/5elrZtuPCSlk+syaZ+WCj8zTzX5
 wrq0aLqX+ap8+UjECEMh6wF86EjoKkDHFqAK8PKoKXNu1K4UXrjdLGX/fw7cMaeYN4+XccV0gKE
 OnvLDOPHm7JkHBw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_083208_400968_05351543 
X-CRM114-Status: GOOD (  13.45  )
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
 drivers/char/hw_random/bcm2835-rng.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/char/hw_random/bcm2835-rng.c b/drivers/char/hw_random/bcm2835-rng.c
index 0b67cfd15b11..6d6ac409efcf 100644
--- a/drivers/char/hw_random/bcm2835-rng.c
+++ b/drivers/char/hw_random/bcm2835-rng.c
@@ -142,9 +142,7 @@ MODULE_DEVICE_TABLE(of, bcm2835_rng_of_match);
 
 static int bcm2835_rng_probe(struct platform_device *pdev)
 {
-	const struct bcm2835_rng_of_data *of_data;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *rng_id;
 	struct bcm2835_rng_priv *priv;
 	int err;
 
@@ -172,12 +170,10 @@ static int bcm2835_rng_probe(struct platform_device *pdev)
 	priv->rng.cleanup = bcm2835_rng_cleanup;
 
 	if (dev_of_node(dev)) {
-		rng_id = of_match_node(bcm2835_rng_of_match, dev->of_node);
-		if (!rng_id)
-			return -EINVAL;
+		const struct bcm2835_rng_of_data *of_data;
 
 		/* Check for rng init function, execute it */
-		of_data = rng_id->data;
+		of_data = of_device_get_match_data(dev);
 		if (of_data)
 			priv->mask_interrupts = of_data->mask_interrupts;
 	}

-- 
2.48.1


