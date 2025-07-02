Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6DAC83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 19:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JBF3cwldevDNRr7SqXWBuHyX5mq5fUVy8++B9pNBuc=; b=B9cTnNQT3lOjyD3dO1zraYdHUl
	fD521Q41nzphNPZO804fPPJtpLQYIC0XBSJLsVVEJKpmK+0kXjv+RVKMh07TldKsu4o3mViSquROJ
	+BNPoy31XmxjoY8fJTh8QRQtE1wIXJZ+290AN9wCaPM5sHqGNEiNWtVRrjNiR11s8+CAgIOiNQMN2
	I6zNw+14tv46y1nveFwJeQoGdETBpDW82tOC4f9fTdko+Dzr2c6Yh+DdSQ9yC3aqX+/9M33lSbgBP
	jv5ZECsYhdySKEvxj1jDoXgRtElmn+RBMPypkn+3YHYglvw/ohZD0CfZaPHcsg8v0AziEprqndaJ0
	qf/Z83HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2h4-00000009LsU-21nJ;
	Wed, 02 Jul 2025 19:00:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2NE-00000009IQA-2FeU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:40:01 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2350b1b9129so32526635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481600; x=1752086400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JBF3cwldevDNRr7SqXWBuHyX5mq5fUVy8++B9pNBuc=;
        b=McrPcq1NjmY+WTijPyr0Mgo3N2uO2JXXK/1W8uxgpNVxrVbNzd5o4vUnkvxJTClnaq
         XCDRXQciH5gmZ+uaz/XVqiS+7+KKaYqe+mbMDnQA3AwvvuE0AK0HnIOLKDMbbuxhvRSz
         h+51Vc2H4zop32M7PTba6rQk2sczaDohigPImnH0QuDtoNXQNuUnrB6g/T82D+xSxhK7
         VSGaRhAvxxkXNVOIuhIyxxelOX69fKpsRqy57VNFzJebdJ6AYEIn9v5Hz8WcuA8l49NC
         6vYreQ+KPXECp2obiYYK0Y4ml/DH9KIo6JYYOSiccu3zucR8yCwRbDr5oTqbB04VaqH9
         mzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481600; x=1752086400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JBF3cwldevDNRr7SqXWBuHyX5mq5fUVy8++B9pNBuc=;
        b=SNJZ8M5sWucDeCXdCwWFGg5lsLJyugLZeLzVo6ZvoQBeENScEKlnQWEdc8Z6MYVKuZ
         SxbIrPM56gluiFGu6+lNQn/1rbz53d7wKMou3RFNxq61LoOn4frWezqPDmYO2ZvvpXQk
         BQjPlNK3saAu2q6gPJstQRoYNFTQC+FYWBdoBnINcnAq7CRpbXQSGuXaRctgrFxxYtOC
         Uvd07D/TRHPivHxbCT+GB/KdGMhZJeRWh4BiYougyDpDiAeF0b3aIWEDc2TJzhu7je2B
         YuVKbPTaFjc91V9tI68O3eqMoWTeaDnOahcIvO4+LH48D2Pn0loMywZY0H/bFMXbfTu4
         TvsA==
X-Forwarded-Encrypted: i=1; AJvYcCVuMZcErjYRiz4yejxjvtvvl2SW5Q2A2lPSSs1bKIegrRBRhHqU9qMa8OhaWQvJZ+zuxRi4V+3IyceKlD65F7GV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi5vBxjW/QDhQhHlQG5bU9l7WnxazhIazd4K8Vnn3l3o8LJrHj
	mjYQyYKt/+1r/Oupm++CneMEdJIkrAgLEyauob/lVTp0BViP/Hsr7YJnRTPvX+5hsgE=
X-Gm-Gg: ASbGncsK5X4RG3jpnnTXMP5+GkoG9kbsXRtUetEhVQ6F5TRDkNBDYYFKqXsAhfW1UT6
	9SmNT6GihxKjYOeKw7irEn0CE6ltAQyTqvWHN0zMkMk+EgEhUXWFWFN+UblKPZPX1+BS1QNhjxk
	DatNHEowES2U3mtiNiC2vRmx63zaZ1jhpIITEfbsmMJch9oj5EQAbG0G2PW0QUd6qugPlwcHmlv
	8cgFlJ1LTkUnIlmX/AjCF5cXPNLwXAYgHSSAhlTRanuAIVIagTTEyvq8r9im/TNuSg9iMFUnevC
	JKPn5Bmb+betqDkmwh88zklwn8SWM0YzRJJX4QrCzP7Px9ajIzubRgmrK+FPXPyW7xFF1G10IZd
	EMDA8w//D+Mkamw+QIwpU78Sexk4SIC688Q==
X-Google-Smtp-Source: AGHT+IHb5I71nz8YJIIhY789TZ8DXVSueuTS+Cp9Lta7fg4qamQr3ZvWLBc2y6VdIoWci5wbIzzqcQ==
X-Received: by 2002:a17:903:3204:b0:235:c9a7:d5fb with SMTP id d9443c01a7336-23c7965da40mr5474425ad.16.1751481599876;
        Wed, 02 Jul 2025 11:39:59 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:59 -0700 (PDT)
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
Subject: [PATCH v8 07/10] i2c: at91: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:05 +0200
Message-ID: <20250702183856.1727275-8-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_114000_574102_2174C84A 
X-CRM114-Status: GOOD (  13.01  )
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

LAN969x uses the Atmel TWI I2C, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 0a4ecccd1851..0101529c80a9 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -414,7 +414,7 @@ config I2C_ASPEED
 
 config I2C_AT91
 	tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	help
 	  This supports the use of the I2C interface on Atmel AT91
 	  processors.
-- 
2.50.0


