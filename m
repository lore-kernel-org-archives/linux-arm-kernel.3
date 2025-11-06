Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B22DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SV8B/K9NFLtBTFXPw5h6HrR1/mkLN9jhMeuZKyIEzc=; b=1HyZrTWje9z50ec8kjjHomGGUX
	5RLi8FdS5hcc332lEAkdiunxYEOjD66vch3OXmtOfgUqhOXmlN7ghF+yPm9ERmbt9aF4bwwE9qqM9
	9EjtInmgkE9x42oBlE+JjNAD2x9x/9SiWmf3a2Z3FTE1V0mZC64q+xijdcVoAuhx801X7B7h5Nuf/
	bwmDhNNh+HkfqNOIFg2j+DTct5DW0Dpq4/jZYoGRu8oUGYB1ME9Q6oZuXqQKOvOa9bFeNoCA/6KaD
	S/9wQuEzGWNo5hpNmD4ettoaGdAmT7J1DKrmv5hUBpp2R20CMo9MMGNjntXtS88wX9hHdrMiigt2u
	qRTInbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2uD-0000000FvwI-3rpJ;
	Thu, 06 Nov 2025 16:32:13 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2uA-0000000Fvqi-19oO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:32:11 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b70acf7fa58so15164566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762446728; x=1763051528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SV8B/K9NFLtBTFXPw5h6HrR1/mkLN9jhMeuZKyIEzc=;
        b=s7kyzLJ6WO2+2z+AVliKfq0zStVjXcGkYUnxJnvoFwXmmiIe40b5TZsFNKEuK9T8Cj
         +MQcAiP5uaXks8s2gq2ucI2dr5PIaOI3roXb1PbqFQGdbBDtqu+gv3Udcu1jD4WkIDqS
         2c1SjDRiFa60jdKXME1uenQKMXQ2gUuOJ8xOUDHSSOYOccVSYMU9558uo3SSh8a/cad2
         nIbq9hQlEPG0ABkzlGyoaFziIR3C6VAUFyLt9VPx0jwVjCsn30cLrJwrRBGsOp2rI2Fa
         Dd51j2skY8unDzNBYrkrtxd5E5ExAg+XEWT3omidMA2Juo2LmYJAtQ/C+oD//S0O48iH
         +uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446728; x=1763051528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SV8B/K9NFLtBTFXPw5h6HrR1/mkLN9jhMeuZKyIEzc=;
        b=eUxqLd9dcW+JVQQwYsqbvsnTvAOnwsFVSEPrv92bDlOcMtSEw2IBwfSha+7TNWQY2Y
         pJQ1USDFT7kaqGsroKlxtlmD2g/hUqLM2//I0YCqDX3E+rARw2+CdVoQGasQfhZmQ68x
         QztjVceFmuH4LS1HL3QVv7zDNRU9MlIjqhOajt9i2PQXY5FkZTsgzQZms7GYS9fKZSCe
         xW86QV0Tgbd9YoiTuxKz7qg4Z1ArGF355VfPTcQOeVcanA0Ao0FlRHxA+MR2Zhy6ZMoQ
         bVcY6ccKc30lWePgk2+53cC3a3D4vRDUF5YHiGLi88ggAuwlvwMX9DDFLiw6A/AK+5a4
         BNLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOMEv+fuSpbcntCak+rqos5OD+eDTWurzjdtFCAvPoJG0achVeNFk+WI50Inn+xmfpxgYo6nwGQ0aZz91I5AQX@lists.infradead.org
X-Gm-Message-State: AOJu0YydstdN43KSrMWjHCDE1gId0bNOZy/GsYQ0fTXB4d1ly8ylDbJ+
	KhHW+PVRSpcSSs3d5NIUIojXA6Wd8BRReTtFC3a51EhadomVZQx2l4I3nSjDXIqlTKY=
X-Gm-Gg: ASbGncuGzKNOsdAuvHkcF11tK/6i6Nd2eBSO/EzJWSGD452V8yKPDI1nF/aIAhTebc7
	rRAR2AxE8jYZ0ukeD4jAKCVAveTvTRKSTVxroa6l7CpSEXvSaQT66nChz7fd1OdFX2yMi+CAKDS
	OIxDhcfn9QR0wuXQtJAVvsRW+RhfnD7qmV/XQNtn2GXQQd19JCc4RIAkXYub3uxZ07Wq8gTtIN1
	eFiCbSu3TU+WvyqAcAV8Dxf62qHjXORmXvTS2LgnDVHk9OAer1l60U/yYKTcY5KO1CspgzGR0br
	/DtflJ8CYU5l1Aam5VXXg0kUjjnK/hfamNSgpKFWHz2WTrlmbscVFh82FqBjpGXQopcxC84kbcK
	G6ryaouy9a+e8mNwBNMp3dr3vaIs+oIfhSpPkoPsILhJCNXGa+YMMnnDBG7BLzKMQaa9Vr6kyg3
	zyrKkcjPnJj41jMt7D
X-Google-Smtp-Source: AGHT+IGhxLSDzqFDqIdMNDKH4DTk1EKeSot+LXYTt6aZhf6l98vZ6t5WCJen8f3ZR0l7jgIr+lzJcw==
X-Received: by 2002:a17:907:c10:b0:b41:873d:e215 with SMTP id a640c23a62f3a-b726515d4a8mr420650466b.1.1762446728255;
        Thu, 06 Nov 2025 08:32:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289682544sm249625566b.53.2025.11.06.08.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:32:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:31:55 +0100
Subject: [PATCH 3/6] crypto: artpec6 - Simplify with
 of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-crypto-of-match-v1-3-36b26cd35cff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qaBcxm2OdLxs0cbfnFvZZbYz3chr7m9FXFGr3KSadGE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDM19Zv267ptOjwUqI8uxjH8Nnwd/rDNI9wyrc
 WIueB+DbWaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzNfQAKCRDBN2bmhouD
 149CD/sG6/KMDXmvV2vb0OxQfgnGFVG0l4bRcysp74kh+NtHFFCHdMve+71r+c9ZlnDkDhjtQAO
 LVlTRiZz8eSYuTx9kiHXLZRFFm7NAJhleLzU9kN1tX6Eotq1fU6A6/V5J4raRma45KqsOajkzsI
 DoyqgWD0gS0j/DYtYYYskMpzi3LAtutLaqaYSZXDgGBGiIvZggh2zYqmk2nytjh/N80QHc26o0g
 3xrdxg1DRK1SOBp8o1XzhFG/kETzhg0oO/IRz002V3RvZmutjBMe6DBbwU6Gkc3AIBUOGqKEQY5
 tveA98a4EAGf/W7+l5nhR3sfBJ7KJosfa6hwXEq/GiuGh8GYedTqQ0Ep6aioMcKacrcfRAZXnfa
 YE6skmficAnkdPHOfuoH9IN07ikeMpMlAmAES9CcYLU6P1Zv5m9PrRUrXSGMiTeuYwUtSJpY4He
 vcAhowTJinhA7ngBjntyuT/EL+naNKRqgJdm3xSNMjcgIPC760vl7n38XGA6k2+ZTVMrmiWH7UH
 U7AeZyI4xsgRxoKqQLlWHuA9qITgsCx55Qu3NA3sHWGi9PPCjgxYqlgij1LXj4oyYLmLs3XzcAG
 2CYc76oTX45O4T+z4RW0zlSOGzvCgJimsKHcnHsgSzSJ0LTwLyMLF3GRptV53kgEOA/D3NvjzZl
 OqS2XJirPWNR0rw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_083210_343959_CB703C98 
X-CRM114-Status: GOOD (  15.17  )
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

Driver's probe function matches against driver's of_device_id table, so
of_match_node() can be simplified with of_device_get_match_data().

This requires changing the enum used in the driver match data entries to
non-zero, to be able to recognize error case of
of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/crypto/axis/artpec6_crypto.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/axis/artpec6_crypto.c b/drivers/crypto/axis/artpec6_crypto.c
index 75ee065da1ec..b0d45f5333ac 100644
--- a/drivers/crypto/axis/artpec6_crypto.c
+++ b/drivers/crypto/axis/artpec6_crypto.c
@@ -252,7 +252,7 @@ struct artpec6_crypto_dma_descriptors {
 };
 
 enum artpec6_crypto_variant {
-	ARTPEC6_CRYPTO,
+	ARTPEC6_CRYPTO = 1,
 	ARTPEC7_CRYPTO,
 };
 
@@ -2842,7 +2842,6 @@ MODULE_DEVICE_TABLE(of, artpec6_crypto_of_match);
 
 static int artpec6_crypto_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	enum artpec6_crypto_variant variant;
 	struct artpec6_crypto *ac;
 	struct device *dev = &pdev->dev;
@@ -2853,12 +2852,10 @@ static int artpec6_crypto_probe(struct platform_device *pdev)
 	if (artpec6_crypto_dev)
 		return -ENODEV;
 
-	match = of_match_node(artpec6_crypto_of_match, dev->of_node);
-	if (!match)
+	variant = of_device_get_match_data(dev);
+	if (!variant)
 		return -EINVAL;
 
-	variant = (enum artpec6_crypto_variant)match->data;
-
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);

-- 
2.48.1


