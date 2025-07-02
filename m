Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3E2C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKtbK/2WRQ+wXXbB4rZi2px+YsVtXfxGP3mE8Odmzx4=; b=FUtOw5diVCQLSjZ9wS7UEnyk2v
	FjL9/u4V3gcF4mne1pyKha0MC6oOPmKFRIQ/I0LfWBdZ6/fY0x2zblpTBA+2px/0a2jgUGrJxjXPJ
	FTbjBFRcsIafqQue7GyiTEG9y32UMi9KXcrb6FCb+kPPV+rYQpByewZQW1ueLs8roasHh7ivDIwSl
	8EfF7ItpypaB/KQwf+KDDIHDm721hGDMtMry0sQjvfpLVTm9stDYn68K7hddp6YOKebywMPfR1nMq
	qIfxYT5PxF4C+bA3LFEgSJ0C155w5nMVsg3bBl13RCZoRnN0WrAD1hQqzjBp4XURPml//SPNq3ddE
	6tpQyVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2a8-00000009KZE-2jlM;
	Wed, 02 Jul 2025 18:53:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Mu-00000009IKy-1Btd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:39:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-234bfe37cccso87516995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481579; x=1752086379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKtbK/2WRQ+wXXbB4rZi2px+YsVtXfxGP3mE8Odmzx4=;
        b=BkOSv/7hik0KI8RDqStDgrVM8Irt785mOCl3AOeJHEYGxM1HXqT8fwVv7egTrQgNWg
         NjnZ71wnbupLQHQkVIUBhSBH7/402gq5KQzVIA7D7c4Ka2LeNOWA3IPVax3fKeV8psTd
         TCGVi5M8z+hpo/S/uzXYNQpbvxyVp3MBLRfuuDKqpO32uSsI1ewotZEuqMjDk2ICwNlE
         TWcdWnIPi0+7ZFw5I3EdP8vkOo6RPlfgoZw4867Y51qP0rrvU4BMrwrOI4NubPsRHdaq
         Ba0PaZkGgQtWg5lbz/fCk3bHMnafCY4VY0Dn1AI+hkmO6UV2oDQsqhnIJZ16tPvN6v+6
         sfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481579; x=1752086379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKtbK/2WRQ+wXXbB4rZi2px+YsVtXfxGP3mE8Odmzx4=;
        b=Lw1fnEO9jhrEjVYleBTifF2lOtxi163Obdlx8u5N3XbOmW7LokwO08HVEpKoG5WnCL
         Nirb1tzYY6AWmBL2GZ2qTCcJLHQRxBzX8N8mdqpK4LFmDn90GzM6ACljv4TW55BhvoH6
         BTCU6SOdlVqAy9CshIODVFb68YBGwubOlnKRJ3tPvSH6ouU7TxfJsCZGpU4dEuk/sAw0
         52BHhAcxlfEvL66pwQ4n7RI0AnVFBpTta3yp/muBWk7AnRV3MBIfrx8FVZ289POV8xr3
         ZoCO88c95og4soj8PMOQ7iLYSegr4hD7d4YsAff8Uq45S/u5CrX5ygd4E8sMkRwjAWnK
         uMdA==
X-Forwarded-Encrypted: i=1; AJvYcCUgHqQxfh7VIqDc6cTV69XXW22NDTe3nn1yBrLhIJmXc3cOtkiDVGMdmB4Ly+EBlabWOXRcwoepoh1FQgHP26f2@lists.infradead.org
X-Gm-Message-State: AOJu0YxxzmtRGpXf1WDM0wFWROebJ9oMku9n93IforEqX4GdTLI/miph
	vy86TnZH9U1Pr216/9N1rpKTLs7FAhwMBhO1FJKfqxeHkhfBZ//q6MrK3Ln6Zl7dcF0=
X-Gm-Gg: ASbGncsLcAX5e1kdG+y/hzH96JVkukNZRQStDYuU6FRNoKIWh2LQCZaWWsxF7VsBg2O
	dl8VTg9mOU4UJKXLDXGhAt6bAGG5wtOrSfboGK2HsBWLkNLSHd0gZbp1EYkDznlLuwzHRIDOhcr
	mHs7H2f92h1S3e64Gih6w+XnDOnKF9kL0SxmrkpAGKltyjYUK8Zpkrh16tHuZz/naNOW2aoPlls
	2slpxzYQjyJhbF0d//VqmGL0bQkbWXDNiuRMbLaftuxQscLEb4Syj08nW6Drov7vBrgiDYmg5AK
	PnojaZdG/WgyxaU1ymhDem5J+UMYvqqZ0GKJIb37ZPzUDXnZVZ3i4Q6z88ik6ids6X7tKfm/eJL
	Smp9Q4QhoG3xvpPfGUT+y+VtwdI0v3Evjbg==
X-Google-Smtp-Source: AGHT+IFMiw5zVlKSlo142PqqKAhtgqF1TVkOxw4N8sD11BQn40MJ5BTx7e9G7Jb+TWyMfU9vkgJvWA==
X-Received: by 2002:a17:902:e5c1:b0:235:91a:31 with SMTP id d9443c01a7336-23c796a1c47mr5430865ad.8.1751481579607;
        Wed, 02 Jul 2025 11:39:39 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:39 -0700 (PDT)
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
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 04/10] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:02 +0200
Message-ID: <20250702183856.1727275-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_113940_320167_49C656D1 
X-CRM114-Status: GOOD (  13.51  )
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

LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71..0ea3a97bb93d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
 config MFD_AT91_USART
 	tristate "AT91 USART Driver"
 	select MFD_CORE
-	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	help
 	  Select this to get support for AT91 USART IP. This is a wrapper
 	  over at91-usart-serial driver and usart-spi-driver. Only one function
-- 
2.50.0


