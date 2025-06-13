Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC72BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FOxOys3zo2Dw07T/mQvOuXgGCEKYh0s2Uiw4mKVmQs=; b=vehRlz6p2ATiiYO+911+e/5Q2y
	noQKA3RjwIKFIge4QLe8eXZBRDPmIXSOL5jg9q/l7i2ufiFuqOQXtgEk56b4oxiSpv2BtUpqlQEdN
	EESPMyEhSpXMCx0XaGa7nwHIoDGHJ0mZdBhxPo6sKRkg/xqS/t/1zyd1ZDsaqeH9Tl/w5kYfsS5Ic
	FtKqWq3nsmfhJJCk3r1rOzt6XkBoea8BZiUOMKtnkFH3C3Qt1hjd2tBjCul/F7m0HJe/WncKyJpWS
	tfvpku8v8hC2Axw7lyUJRmFl1u59e+G5qLc9D/aqn1t39+SipPiHG9vnNP1gsEhZ7SkPye+fFmz8X
	Q4vDEf8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ37m-0000000GJcv-3GOZ;
	Fri, 13 Jun 2025 12:03:10 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2nY-0000000GFLz-1sgX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 11:42:17 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso18194696d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 04:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814935; x=1750419735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FOxOys3zo2Dw07T/mQvOuXgGCEKYh0s2Uiw4mKVmQs=;
        b=Ckquwhg5/lwIbL+65mmkrQDgK+NhKWDda/PikpXG0qGyy70VlewCLrVW4Ic6RZvlTb
         eZPXTQNv+bVY+SOnnADwCocjwxZyLl5iRpwChOAxed+/CBZXF/6Z8v0E7eTNQSwL/SkH
         T2a50FhtsX/Ef+0mcmFb7vA+cC1AXj6zhT5O7Q2pkqmGIEtV83mRnaSsIqxtPkuJIJXe
         PTch7fyURdrqAio8syQqeLuW+W9ScA2AwMftKG1ONxhxkmmO21MC+jepTzy1Z4ewQhNX
         bQ1Vph+DxgRqXy7qeunOtHYKAtQja/vq9ui2yD4i7xQvFzgAITFoEyiTlM4hJCrMmamL
         WKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814935; x=1750419735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FOxOys3zo2Dw07T/mQvOuXgGCEKYh0s2Uiw4mKVmQs=;
        b=ZZ+UA1llVbNDVLlDgGcVmMrHzQqsaUYkiwqzYcSoOrryMJkwQT8Wm5aNDGGGlbB9KC
         I2uL/+CTCSitY+Dvzopg9LCWYazoOCBkxDe6xSQ8J+X7GkI5KLypEhIWUb47++QXMZDZ
         C66jboCOISDnw3L2Nip3lTSAliQrsNTNdYv2/KmPACiqzvUOERRqPcAHGKPUB/Lclk67
         fj9CmIJNbcCfHWV30MCOPmEOyUkvCDs1jOnSZv/CqrZyL0xBw7XoKmamCYxv90VAU9PI
         /5/w5lVqVle/6KAtdQW+sYHAFVEJD4sToQ9eG7zpjcleI3a8IPdscX/WR3PPcK1Aqjjb
         BkZw==
X-Forwarded-Encrypted: i=1; AJvYcCXJQrFiZjKs0DpjrAMJqIgkQB9CX6UecNtpwN+opKGzt5UrV+5p0PS9ce6VnA62SmG3eoDqZ1TFD5Y5c8bZdouB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc14zTxhFCRKyx50SgzIk+ml0j48GXWCZv1562ulhVza6edfFv
	6Q39acjZ2n6VtTuvR6AW410+FDofEoMTg7c60ckMgvm0Q21PA9oLT8bUtAkXl+Qbxtg=
X-Gm-Gg: ASbGnctFLW6oCJfF9xIokxae+5CbsPuTdkPKtu/SqLH9HYIzMx0Bwe86m5/1QZf4EaH
	+y6xo4StD2Gcxy7OnEjDpEvvgb5wLrSK8H45EQKu59IOvOf6gHgaEzl+gQzFDfdIIKPo7zm/jtw
	7+hNv8rBI7BibEwDVifNHSHk+Fxr+e4ep54/EcV0ssrKbRS65qaW/q5shyp+jUCZjzQpUwR0phv
	7Li+z+J/elbiXciIXUy6jv1/2cEvKvPyl0jNMIhU+yaX1LkvIlArTGeYAku4ECj4aNJ1tOCHlgE
	lSzrhbRos/nOZUFt5JIbq4cEDyGaeqTIexXA2OMkXpTcmhYb/yXzn3oaVrKk82y3vldoE0kEqsB
	38r6iLZyl+Dugud8PxwB7WA==
X-Google-Smtp-Source: AGHT+IHILIH9TTHUNXKE2SXsO/39QmE4PBt4ZlHa7MSBEM/sfhXbd9DkCQeEuqozVECdWauUoscyHw==
X-Received: by 2002:a05:6214:29c1:b0:6fa:f94e:6e79 with SMTP id 6a1803df08f44-6fb3e59a197mr39514346d6.9.1749814935402;
        Fri, 13 Jun 2025 04:42:15 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:14 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 6/6] crypto: atmel-aes: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:41 +0200
Message-ID: <20250613114148.1943267-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_044216_482870_D743FD26 
X-CRM114-Status: GOOD (  11.38  )
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

LAN969x uses the same crypto engine, make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 9f8a3a5bed7e..b82881e345b3 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -426,7 +426,7 @@ config CRYPTO_DEV_ATMEL_AUTHENC
 
 config CRYPTO_DEV_ATMEL_AES
 	tristate "Support for Atmel AES hw accelerator"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
 	select CRYPTO_AES
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
-- 
2.49.0


