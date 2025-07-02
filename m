Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016F1C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuxtJxy63LOFr6I+EVcVxkshFZijc4sL8n+d8Zo9F1M=; b=wN9Lg2SI4AULOhEMzokelovcP9
	1ucu/JuL6o3+53QSz7U2Wo0fOIRV2POILbmbwTA9aZAchDM2z34IwsGv7r57lKLLOj0IMVlUFQHVe
	cu5+Wu+WgWtCY+7vkR1vDJ5kgPVscw8QC8hH4X6ACX0Uh16bEoRVSfqVHju8PCCbbef0ZQ3HlYGeu
	X67Frrh3SOdo3rWiyjWjV8mTqAhjtyiu2c1HBCoiRl92yGPPPxA81Vnc3miVDl8a5iliY1XCqgXxf
	bAaNbx+r2qrWPBVQOCJ05OYL7hKr7dEFTo3R20HUxFg+NC2X5oWF58wexVgnH/O41YQ8eO11rXrPW
	WYIxKmiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2cR-00000009L1L-1gUr;
	Wed, 02 Jul 2025 18:55:43 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2N1-00000009ILx-0Exi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:39:48 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23602481460so74875295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481586; x=1752086386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuxtJxy63LOFr6I+EVcVxkshFZijc4sL8n+d8Zo9F1M=;
        b=CConz+vpd13JUNukJ8IDmkj5H/oADpu0lAOodQEuAoR5o9Fwh5vC45/owyknqPx0oE
         DtUzhC3sxxNzt/aj6L2XJWe339to5hrdWhFNR1Xpbv6r/d2GeQF5T31qTBAMGClTdVVC
         2hxGBf1hKAcl1Di/d83NP+xgHM6D4ZBH/SfiCXulfjAemujz+3EqBW8WwjVgUp986nkU
         c0Uw2EhpdYqbFj+IFcUtXso73cZbzWBh1+O4SRph4bPIC5ow6hl8Fq9BOOSecIoN2zKh
         kMFD38UDg+X8FOmEVCxNfaZHXkePZnCxi+DmgtL2+jqbouKOKwjEiDCLtVlraNhD1F17
         RgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481586; x=1752086386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuxtJxy63LOFr6I+EVcVxkshFZijc4sL8n+d8Zo9F1M=;
        b=eHPuSluIAZtazfOT8RQBaDEGHNai7y8Axl+1HIVPV1+ykvw+SzV8ixE0H8Qe1MEp0p
         sRSKdj0qrjRQogj2CZLE93f10h4++H+7tfH7DY/0gbDBIjH+nVuFhp2OY4mH0Q0+M3k/
         QGT/hvYvPdcmhCzXhIbgIBxDQfPP/4wpaj9v0WYFSOtEEfFsxM5175lP4M2aNXUiUeMR
         ZtZzfamWtyc6sdKtmVN7Lp9CHdvFlFk1+UtrJ4vpa4t0CljleG5qvutMoq8idAroBp7V
         n8T1XNDxxGQ49aoDwZTQMKdLcfQDCJeM+B9XcHte/H7aWuq4b6f4C23h9jLZi6vKcneH
         gHcw==
X-Forwarded-Encrypted: i=1; AJvYcCVjtU8NbS2C3WnnCLt9UYp2pTbBG2D2KvqrYgKV7lBVhCLG4xqqyRbE71wDRiQas/YTJ74PAuYFfuDvw6cby3qB@lists.infradead.org
X-Gm-Message-State: AOJu0YyLCTz4QGoPIUZoNnHgrbHqjV0fqnROYA7j/XWH43bu4MblidkH
	t1JLXqVkFQggPI231oOYzFiwV651TEZRBv9zfMW3WFfWXuMxXX1pxfhWl9xesF/FhFA=
X-Gm-Gg: ASbGnctWzsMuVXFIgEOd6dyQalaNTMapWaLjn09zYmZkefAdxcZdWqiHqhZXHXiFOdS
	R4a5om53pbcAEBWmXa95j12nj2FWcPKoDoNsyan9As5JEKfEnf/U17tvwdO/Ytit9kPTDm8EXDZ
	eu70vhmL4np0dZhbXI96wL7f/3Dt6G1Co3Tu0QWAOOb03Xa4IixE44grzxziX64YksBSQWesClU
	AjWUsJDpwYhR8qxzRXeyKoGhePHLBrxwwe+UQwd8tMP7aIo2w2VJyZ1hrpusmrTjvt+aPXpNesw
	P1hBSuVmOng5JN6nL96m6YOZCYJBoNWzYxUNDT+fkYZnxdMobIqfe8T9wPclITO0ju2EnRacfqO
	ZD38Hg203Y/bozm+8+DwasSI=
X-Google-Smtp-Source: AGHT+IFtjc9wQbx0mnTEIHCa/COpi03QJubyVPHdKqzZsjHI9di0hrmvji1zsNLaFfpKOtfqcICExA==
X-Received: by 2002:a17:903:40d1:b0:234:9375:e07c with SMTP id d9443c01a7336-23c6e558b2fmr47599345ad.46.1751481586359;
        Wed, 02 Jul 2025 11:39:46 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:45 -0700 (PDT)
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
Subject: [PATCH v8 05/10] tty: serial: atmel: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:03 +0200
Message-ID: <20250702183856.1727275-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_113947_093539_38D7D9BF 
X-CRM114-Status: GOOD (  13.20  )
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

LAN969x uses the Atmel USART serial, so make it selectable for
ARCH_MICROCHIP to avoid needing to update depends in future if other
Microchip SoC-s use it as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/tty/serial/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 79a8186d3361..c33fc6f16d31 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
 config SERIAL_ATMEL
 	bool "AT91 on-chip serial port support"
 	depends on COMMON_CLK
-	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	select SERIAL_CORE
 	select SERIAL_MCTRL_GPIO if GPIOLIB
 	select MFD_AT91_USART
-- 
2.50.0


