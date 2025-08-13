Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53E1C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NR9O5hej1zVdBrSrvTEY2n8cN8r/rUR8l5graqaiob8=; b=tOXEOJk2a/fcytLc5HVxyqagLe
	tAI8mAjJpCLUNaXTE6BmADII+iW2xvDSGsEYzlDY1xIFnNIa/8ws7Yl4NgCpAmWH/NTLM5VFZ30kA
	NNU4hj3a8DeD/3Noj0hGfyR5MCCi9bP2MJIKJGfF7bIgL1Oe18l9OvSwnbrILPfmRERSY0Al26Bdb
	IqHBG0pjYXW4yAMvGW/WfzgCNIozWJHsrCkGa2yLr4K0Z0+3V2dfBp68nc4Sh/CvUhe+KfEJpzAMs
	DpjJa+OIkuJeLYJ2axx294rgeyW0dUibSNWQ6bfTDKdSGckwb/hNEvYGaCbfLlV770tuMIu4XIAQA
	q5Poz4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPP-0000000EqbI-0wS6;
	Wed, 13 Aug 2025 19:45:15 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFa5-0000000Ec6l-1Bfn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:48:10 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7e87068760bso6729285a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 10:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107288; x=1755712088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NR9O5hej1zVdBrSrvTEY2n8cN8r/rUR8l5graqaiob8=;
        b=UHUjH/9WVxcsxUGEROTBg9X7lF9US4tr3GmODTHKl/Eqw3EIUSiQ8Osh1hqPDrYTQA
         t9tFJYytWGTahyiTKnoVexoLd3Q84ZtBldGCsN7zFzZMgCReDS+HelmcyVCFVmVSyUFK
         D5I0s3ruHoECQ6MAu5sSArlou2yETjM3nUK/I41+o79l4R9eZhZH8MHQgw2x0fSJAPj1
         ropUOyOp/EJRQYHVhgXA1mfNbo7ctCA06nJNIOgUQWuNz16q6bErZnE4Yq/OBlatFgpi
         TSlgc47AgBac+Owd9YhPbWzB68JlGGmXrPt1waBhfb11LJdp4ReTED1w+pv0wAo3uADu
         7H3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107288; x=1755712088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NR9O5hej1zVdBrSrvTEY2n8cN8r/rUR8l5graqaiob8=;
        b=o9OJ0e6cOJrFjVO4ux0oA9qU5qL0vqcgAUI2bY2LcSswowAo6iy0KWbsaC4UJ5caMS
         o3dQpiAusi3EDQJlBk///w5kICIeNjQhXVYN3+ErOQvDPoRpXNpXq3xw9MMCiwF4Ld+l
         l10+Yug4QtmTmNdrPDIHgztwaGHxlJnTGmVIPq+U9AIgGcsaCsDfvTI4QU16gMR1NSD/
         6H/Ki6YIpT1rckozem3Unju935UbCCmxLlm+em61kj4qUmgZELUAyT6JvSDRJrX8dRnL
         egCfdEa7Kw7d0u2nGou2L0F9B6DpWKo/NpjX9CmRzW31fpKNFDgo8mNjbQRMkgHuRMg3
         xKTA==
X-Forwarded-Encrypted: i=1; AJvYcCUOmlfkSnDQbumY7A97/eD6TLu9AJOvVykxzCNAAJCztm8wEdn9O29FeX4vXt5K7ejlumMoJdD7FrHoxuCthmlV@lists.infradead.org
X-Gm-Message-State: AOJu0YzOGQmnY0/B9aMljE0kfuHHnvb6rapna+D4Ap4PXYF78JbI6myH
	kinfc7PD1QNKex7Q7SbNhb4R5hAF9jKUvowzvvIZg8WXG0wFz6LdDB+kXulzXjqZpRk=
X-Gm-Gg: ASbGnctuC5wwmWKE2p6i4S9cCcVwqhykd7i7H7l2YPFRg0aSPLYIfGEMsDZgMo3LIq9
	t5F5d29SxtqS11r+V8Y9mtJ373Uqd3dKAlRLjCBR0ZI4TNtr9mrB0fLFJ0pKX3owvXC3fWGiXDu
	+D17UUCfVEvHk1GOkIwwrNwz+UF4JRz0/XCvzAOIDMMCFU8f+cDFMCtp63A4ONZTurQvlBf7VIr
	GGt5ULKMNGzWBTUt+LZzn6g4tnNwsaonICW2Bjgz3uiUrdt3/Bh4ERwcAnXWGdAF5KgW3E+7R7k
	nsEl0Dqh3yPUX12CHDzsFovzuSgGy84PVRPXLLvCkqChOUZl/kWmCZVIJ/QhQeP7qPPuDJdtN92
	ZbM6fysFAh+7XvSx9Q8d0SsH9bzLOmI1+XuRkq0RgYQ==
X-Google-Smtp-Source: AGHT+IFRs83sDqTRyEN7DfReHLOYn68Vpzc0LCiQZFoDgh8bJ2M9bgboNPmgbUyMB+oLX7FeYNZzXA==
X-Received: by 2002:a05:620a:1724:b0:7e7:12c1:8f93 with SMTP id af79cd13be357-7e870600b91mr33016285a.63.1755107288221;
        Wed, 13 Aug 2025 10:48:08 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:48:07 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@armlinux.org.uk,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 9/9] crypto: atmel-aes: make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:45 +0200
Message-ID: <20250813174720.540015-10-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_104809_319218_A5DCD026 
X-CRM114-Status: GOOD (  12.14  )
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

LAN969x uses the Atmel crypto, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 04b4c43b6bae..7c1717c35b76 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -439,7 +439,7 @@ config CRYPTO_DEV_ATMEL_AUTHENC
 
 config CRYPTO_DEV_ATMEL_AES
 	tristate "Support for Atmel AES hw accelerator"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	select CRYPTO_AES
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
-- 
2.50.1


