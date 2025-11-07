Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DADCCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5wQ8l8yRqZt2AYZdeFxAu/RxXTrH/Y9KHqi9cP6d1Q=; b=OTB/FJjF4p+YWYTOS/8afx+ErX
	frZ+YhxdDDFVyx8Yy3viaK/DKlzBEpnLi5zsnkrwmRJajRvGnJE5v/Z3yyaGtLMS+UkIGXLxm94Gu
	4gpjR+I+AU8jDcnk6CoizWgxKDsaMSgaHh7VRSRGAXBGUXX+1ra/fhKeWKCll0Y7xuROoOH3mE5A8
	xBzPdnrqgPV9PAtu1Ug8Q0OOEDL8IMBehfWzxaF193oym9usvS1u5rgIfDm+sCjuQdUfVLtNIZ3vd
	xh7ck/HF4hejaYRHzyP32c06xAIZ2Z/H2yLDi0dokRrc6XTQHl5aQx5w2xOiJLQnnUVS8d8xKoFTv
	UIiKZ8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHdy-0000000GquS-2zd6;
	Fri, 07 Nov 2025 08:16:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHdu-0000000GqrT-3DTT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:16:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-429c8d1be2eso32893f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 00:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762503381; x=1763108181; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5wQ8l8yRqZt2AYZdeFxAu/RxXTrH/Y9KHqi9cP6d1Q=;
        b=p3xq426kRsaPHsJiVLxI48ijELgZ6ufX6ItXOML3ib+HeqaVT1HUDPe8hPp9F8pHwN
         FqUJJELZCmIPvjD6f1LAoB1yTJRL08sq0Vu//4rW4fZPHKBRzF2bnp/zwa4s1GtwHcWR
         3A8ZtIGl2LJkuVX1IyZfSFiYgq08RS3Zhox05gN3j2l00y7TdlERYbP150rbHukXQg/1
         Pc2cEaOcwoa56AXwqwsx+i/coTf0UxDnxmrgqpRO6zeQzPsP2e6ORHzjfg8MzHemd80e
         KlLM42bFmKuz+uyOnMbPP9JwTrxy0jMM+9jRCOxxsBSwdAXT7uH0t5rmQPW9RCAwOSrx
         BOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503381; x=1763108181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V5wQ8l8yRqZt2AYZdeFxAu/RxXTrH/Y9KHqi9cP6d1Q=;
        b=Sd2KVY5ghQzF5kJClrBtDwa6OercPAIBIiUQcPSdtzP8pRkmjIqG//uuSIafV1bRU4
         l4jDBYxKJtPtS3kCaW8zLr4QyWUI+KxAYp29Gb2yNZsqzuBdQSQbyfR6522n6EPf6I9b
         QN7ZkPL8kPDzXEzjIpqzkz3QJSzYsFIOgOCW3ZEt+gxNQvZXUzbhvbE/JMqceuDXprdm
         IlaWKJ119vFvfWOrCZ3wHsrT5mDPb/VlNnUpep5COBRzh0pclutXmAmODsR4atK1kdfE
         6A+5VYZPyB3j5jUUF91FsZ/+4J+XS+47wJVoelo7tQuiNXSuGJkjjv0rTi6pBGpbo0c+
         Ptqg==
X-Forwarded-Encrypted: i=1; AJvYcCVJLFi8RGX0S5NyP8q9vCvNDeyNb1jf5eT2gqaRIrTz2Cdk5kf5PexueGYyKeJdRbQrWOsyb4RK7MyErHeTzTlu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/SFelhsZqc0qTQD1tEL3a6j4qxm6gQ9aNaq3ot9GEW7gYJbxe
	zjAnLPihzv1qNGLbLxrXAj9+TYyu4gj5Rq6y0oqQauWsl8J7UnZhSwlaI/u5KSt5Djs=
X-Gm-Gg: ASbGncvTQljQgZppdKN1mQ1iuAAUGrF24gBBR9ViN7He8ASGFEQfQe8iCRJKuv+Cvwn
	eAFsoyc5gKJWnu6sEUc9ZfsyNGXl3y4JUA5QnMIhU/bnSd2/MkxP+fMQjCyoG2AcGswojIzgLR3
	xmW+rGbtYuZVce0OA3/Xcs4284kZ8Qg1a6RJPQpILMenpbriefgFVtja9Vg/zZeMM3N/DKyIqU/
	p5sA8vtTfz02LPWkUlJVhcNLI5avOgHCik8/k7IyZxzYboDEqbD6FfE5mlqyjDBq/eKzHQhL/bL
	ni8sH5kkGoELqK6YMjKfUEk9lkJjN1Y+/8GiKtguWH98K3y/NIinOBLZU5etnEoyMNmvTnMJk2b
	nQsRsyGNn+MMBo+VcIrWCf4mzW3i9mg1n+IKXnSXHniBb3+0ondsAQHJyUzY2+HyTdQ5LKeIi4y
	ECh43tXYLolRXWJ9pqTKg8MuZAYH0=
X-Google-Smtp-Source: AGHT+IGiFUrINL/leIojlLr7ytWK4S+6B3l6Xe10W7uJ5w++tU15SiQgprIswsFrF6XRbpkzN7rY/A==
X-Received: by 2002:a05:6000:2886:b0:429:b4ce:c692 with SMTP id ffacd0b85a97d-42ae5aeae4fmr919422f8f.7.1762503380867;
        Fri, 07 Nov 2025 00:16:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm4058381f8f.46.2025.11.07.00.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:16:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 07 Nov 2025 09:15:48 +0100
Subject: [PATCH v2 1/6] hwrng: bcm2835 - Move MODULE_DEVICE_TABLE() to
 table definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-crypto-of-match-v2-1-a0ea93e24d2a@linaro.org>
References: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
In-Reply-To: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mwupmXstNf8xEWIA2tRou1u+HCCZBqAzg8Ar7CQRwTQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDarMNQIEm7jkhc6p5V4t84APz0kMHwWQbHoPN
 T6F+7S44veJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQ2qzAAKCRDBN2bmhouD
 10TND/wMoqicvebUpoVcbR1jTLD/jtqocL/+JgZIAAmze31Z0LQKSRT4Q1CF+zbBQSHqj5JeLKg
 Ic1EiE7D45QLDkW7P0NqLKpUu9aOvL9yR2l61QOJHjYwQcWN3rkSm1AL0XsskMpvfjL86947cAL
 K4wnFPuYC2EJ3Z1QZRlLohYdj3kbwLQlUwkKe1BUHowK6xDLkhh1FQwl/lpJF3A8pCnVFYWoquV
 9cBX6M5iDQzNS8kjLfehHPeBSLELEHOLv4Aa1Yu3glnUqw86Vj1z80RXG8l9QrozkZ5baBor+t5
 jmIM2FSe1SDsryYOIY4+Z9c69COZ3KC0vNeo5jtxYCQmnuQ6Vg7xHFooOY7uNT0LqFVR2ccNDDb
 g3Ifga+yKoycnjifcaYo0Xa3qTkincp6NpsNCLDA0mJqkFGoXlP3obFbOoi9OTo3TwvVyIw4R/O
 TlDK7Kx2mBRiePZPpvG7RNeGBAdhPkhZqbvNsEjdArJ23DGNJq63oscVhaJxBVfrcP82iQ58V5L
 Jem3bCHqb8h1/treM0vEkuXFpvD5seukFp3QZ9DYRKyLIgLLp1dDmDWKaMhmxE4N2HC1cWOGvFW
 OH6YJIl9Umg9PxPe/Qa+V63YDRjFyb2V6dokZRU0z0liBszqXCu040y58hXSoD82sqxnmNTqjye
 of4ZE2UIcI56IRg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_001622_836473_3E7390FC 
X-CRM114-Status: GOOD (  13.15  )
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

Convention is to place MODULE_DEVICE_TABLE() immediately after
definition of the affected table, so one can easily spot missing such.
There is on the other hand no benefits of putting MODULE_DEVICE_TABLE()
far away.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/char/hw_random/bcm2835-rng.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/bcm2835-rng.c b/drivers/char/hw_random/bcm2835-rng.c
index aa2b135e3ee2..0b67cfd15b11 100644
--- a/drivers/char/hw_random/bcm2835-rng.c
+++ b/drivers/char/hw_random/bcm2835-rng.c
@@ -138,6 +138,7 @@ static const struct of_device_id bcm2835_rng_of_match[] = {
 	{ .compatible = "brcm,bcm6368-rng"},
 	{},
 };
+MODULE_DEVICE_TABLE(of, bcm2835_rng_of_match);
 
 static int bcm2835_rng_probe(struct platform_device *pdev)
 {
@@ -191,8 +192,6 @@ static int bcm2835_rng_probe(struct platform_device *pdev)
 	return err;
 }
 
-MODULE_DEVICE_TABLE(of, bcm2835_rng_of_match);
-
 static const struct platform_device_id bcm2835_rng_devtype[] = {
 	{ .name = "bcm2835-rng" },
 	{ .name = "bcm63xx-rng" },

-- 
2.48.1


