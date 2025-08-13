Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3436CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aikCCzA4JV8uW58QUohJldBg0J+53SfENsyjedVm5m4=; b=O8o1T1k5UuX/z7z1vNlIyBGg1A
	/nqGmbQJk4bmz+9sM/k7UhUYjtZG4RCZ4NZhX/ryqjve2Slxsa4IpS/wqZfGePCGnYzdXayWMDhtT
	siEdOH6it+GLUBNoPKGZynZvgB9nplkb83C0D29P5ywpRW62kaQH91KeFEwm3dvWo9wIjEVhEAy7w
	n7CQvPLU6NB25o7NQrgeH+IBHGbco3IMnyiA/zEDcTrN+gkpl9uusCgV2P1p6HSUwPFA1JokeQCbg
	2VG6Azb3KOyctoR11J3+nJC6i1j5FWbSU0B32kQzj8+x4qARY4f7i17l90F1bSOta+8FfSalAuJ3g
	TZcoK9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKEm-0000000FBYW-0fsS;
	Wed, 13 Aug 2025 22:46:28 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFZt-0000000Ec3z-1qA8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:47:58 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7e8706ac44eso8378985a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 10:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107276; x=1755712076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aikCCzA4JV8uW58QUohJldBg0J+53SfENsyjedVm5m4=;
        b=lUQ559l7hD9ZroEwPo+wOxmEf8yZ4pQxG27FTMU8cIeRcj8PDcBMGUJ30HcWTg0m0D
         Lcr/RsEoKr7p7pdHQgiUIvWlb3RUibKnWVn4oSKqvuqJufcK3OYnOOH+D9TSMWWIXIfV
         WZU0uDk03HI9vhfCPq5JkBV/yOITK1oUYr5/m5pYiNXXLyhtvmGpwOkiaVQQPOqJBGPK
         Y6kQ33Ig4LZWoV0kAQvIkHsUDsic3S5DNuuJvBplDVw8kFVtFkVgBgqPRr5D11RWQwyH
         VX0KVeuzCu6jpbhNYP5KYOLuPel0V2sLocG1twq2FH3DAqjze3tcgPx7Kzc0bgpOjJwX
         Il8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107276; x=1755712076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aikCCzA4JV8uW58QUohJldBg0J+53SfENsyjedVm5m4=;
        b=xQRmELBmcnAKhWTs7O9COGZa+6PWA4YZh4JDMlCoj8vDzdvlRLF93cqtAABksYZxDF
         EfSXPnhxYONGrEvZbUq94YrOsJzokpVZ7IVX1FPXk1RGc3GIbmb1oGIOo8z1eQ8nj9WG
         Tm6VlZsL+82EzIl/MlmVCdNjVB3vaw4vVZyuHi4nh7TdKHpkHgIFKLyEwb3hravgz9CB
         xwwLgOi0QVqBkAVh3eO+nC4PMkmkS3RPsE9tPh6fiLnG6yxblRYULg/FviIMHdsPntKs
         w2mV3sKDTCrnIvDonO6De9fCw5W18Dw/LiV3yUIM45WjXa+2KNlYAm45SEwLMTHKsp/O
         Zwbw==
X-Forwarded-Encrypted: i=1; AJvYcCWXFJqjuUxRDew51sqCNb45D7l1yQWauwm3j+2huz1DA2tnHy7EbLzJw0mlUVb7ocMFzZ6zqb9ArYcxNkRZUOyd@lists.infradead.org
X-Gm-Message-State: AOJu0YywRzterP3eRnbtyeIOQ0wy83gsc+av3818D1XXXZE4/v/7bYkr
	uXEf60G645qE5tF2yUHs0L6v2BUp90SK7Ph+OpL5WrGR6BlCETUcvM6+B6fwmmLsUBA=
X-Gm-Gg: ASbGncstoj1xUO7s11ck4e+91WEl/UgzdPsNc27dTl8jS+lXiB0Iw2uQFUw3vIw3Z8m
	f7RZZp2q+LPa6/pvQAZVSlsCgrW0QLJKvBiXn2ECUHqYhOhJooZbFTtoHSp5yruiTLH3KFA7auQ
	m3S4uyHVh8Ls1hZKOQw5U2Gu9O1kJooY/s4Q5pga4yUdR0LqSTNOw3qh0Wc7+DinYyyT+lizM6F
	hWFBn+/RvjbY/G12R8sJs5pXlctyfYguiVL7hsIN8ibtqrZk9Nu/JCU8FWSxrlxINjFjkkUIH3o
	CcKG8gf1V7cVlqUXTRw7fKxrAjpS9JCIzOhSP+0Lt7o2t/Ss3mutij2bJkAOvQnsi98hpwqlr0C
	X3s2oWe2A1KrZx4aGt0JLRWNhRf6EApC6XVnOADwZIoh+qDh7qHf9
X-Google-Smtp-Source: AGHT+IEg3SSFyFBuMzj7VtB0BXbM4b6FpFJkYNn6QJWw/Ig9p6dazfZbmEC4UpkoJX3lIwDtCnuVhw==
X-Received: by 2002:a05:620a:201d:b0:7e8:6a84:e82e with SMTP id af79cd13be357-7e8705753c2mr21068085a.32.1755107276240;
        Wed, 13 Aug 2025 10:47:56 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:55 -0700 (PDT)
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
Subject: [PATCH v9 6/9] spi: atmel: make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:42 +0200
Message-ID: <20250813174720.540015-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_104757_474393_8E5C1537 
X-CRM114-Status: GOOD (  12.67  )
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

LAN969x uses the Atmel SPI, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/spi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 891729c9c564..320b23e92cbd 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -154,7 +154,7 @@ config SPI_ASPEED_SMC
 
 config SPI_ATMEL
 	tristate "Atmel SPI Controller"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF
 	help
 	  This selects a driver for the Atmel SPI Controller, present on
-- 
2.50.1


