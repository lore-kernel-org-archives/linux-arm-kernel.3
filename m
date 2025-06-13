Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3785C71156
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PE5/rsY41g/vAp/0hcg6OhOgOrChXE3RFe9mIYZZ5WM=; b=JUukOIf45HlLe0LwZ2oQcIxT4M
	a4GKEm2jbyw8OQUq9CJ0NYrBrHbHd2+E7GCKzLsIpVHaHzzUCnWKf8QO9hCwkF6gswUYVt6pxAY1C
	ltgj47vJTLj+3MuqsN97DmwhdEfx8hVyZUDY8KLkntN5f/R3K9Nj63qcLWWqf7BQFJV14coeincFG
	YVX+eCcCZwaqb1BDS1X+tBnkr1lcMYMMj5OXHWinXop6Ur21S7vn4uuW2lZ1kROaDhsYmGNcPWUxm
	s0P+UjdNjXky9O0uH8DFzum+cUDInggMhWPFOW12ahpe2/7QZ7ohbX37J0v+K4WU+ftMN94NZjfi3
	1W06rlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ37m-0000000GJcE-0cf9;
	Fri, 13 Jun 2025 12:03:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2nZ-0000000GFME-1wef
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 11:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PE5/rsY41g/vAp/0hcg6OhOgOrChXE3RFe9mIYZZ5WM=; b=TFGd/XE/EpTB6UyYQQvY5OWri7
	h2JYe9lT/dsfhWEJ4yuDVfHM8cqZfXKKrI5ydoLnv+FBiMjbW8xzLL2/hnDkGkRMhwXRGY+uqsz/I
	OkfyPbOUzFJJ5i0f1H8ZxUb0HSz7fwxA2Tahlva9c2eoidOLFesdl4BGmDX+zAPZH1TT4Zc3h/iXs
	FtJfO8Syky6fgbWGLb4tp6JNDGwNDOdO9gVZovHTiAUNN6ucPpqCAHqIWKfJXUitd6yUmpk9XMA+c
	RjrlFtQXy0drT6RREuzEjlGSD/O9pWVG++W3ne/E35SrSijPWDdOJRsac1is+bmfPQhjzP9kLBPU+
	csq9PrgA==;
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2nX-00000002z0o-2Ld0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 11:42:17 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-408e0986303so1365629b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814932; x=1750419732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE5/rsY41g/vAp/0hcg6OhOgOrChXE3RFe9mIYZZ5WM=;
        b=fMtK9BFRKP2n6AmA5FXs9cXF4dVjn5j7qT56h3+wzAaHLtLsz2E+Ig/Ihw2h8uvrq4
         aC10S/wRvJLWrkmBA82yvVoAYAuVkt1s+94JunW688Ji34h8fOr+k1di+RAtzlebWKXv
         VvRto1uRgHTuLgYwyeZoTPjLA1YoWnFrw05SiAousYhYWolJpLdBNZu/zdKRY58orSZh
         JxwBL2uSuQ1WPu3+Af4qgWGkRmi3f4zMnyMKNZ+8OrulalygWLSdJN9dOht+7jMh1DTR
         CH8imTRQvdvKOsGKFmG/7gDkZx8Zr6MCHg2OGIsVJlHv6eB2w3RRasOonSYWpeRbRhPl
         Hg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814932; x=1750419732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PE5/rsY41g/vAp/0hcg6OhOgOrChXE3RFe9mIYZZ5WM=;
        b=Us5cyBqR9pY6cTCV79X900IOPO+pjPCMfJ1J3hHTJWWm9ZpI1zkBllQkwuOcmw/z0s
         vY2agQAbbHu5pA5y7mMb0sCl2N7qlMqmGWbOV0FVUSqd8p1jdhNZAMCwbw2wrGvv2Oxe
         ZqqHabH+pEk69ggsWFIg7ZZCZzSK/H52K0gyW5EfsrUiQoGMrCotAoQ2guchYy8o4vsY
         uOFJ0lcVY5N+qM056vAMwIf+ajesuATg3u3nLXqPk3pySeeVz9PC3c++0CGYz6EW4VDm
         PSni/E+/eRyZiGl04Mn91tXOGImMACNdS0gHTgF2rGjP6f0Gqq9URpDQrj4BhvI7PzTR
         2tNA==
X-Forwarded-Encrypted: i=1; AJvYcCX81xEdI5di+P6ui6zVcF4Nj+SU9UNQwYh6IJ+c3Q+rWD3Hywjt+C8QOCv0Gw0u87NlPmFDQppUYePj0Vr5Ys5B@lists.infradead.org
X-Gm-Message-State: AOJu0YxcMujHKryUOYdErV7QD6E9DSi5nWsDU/vnbueyJAAO4EVnu3wj
	zUerXdnKObHwlbfVWDB6nsFNFyeyMVasB7BH7+e6+KaLzFHDleNl7b/bIwJajTxPbpTF4oPcJza
	2myqn
X-Gm-Gg: ASbGncuTefdUCZfucHT/HgW0Hzbpy92o4INzbq42RSUSM30mDjN6otcTka2NkULSxyu
	NbN5TtvD06y3GfsYndkHmFll8iEB7mzz+/rNsWnifj+8OALQE8ybvoVC5KJ2UT7HdYcRDh8MMKd
	uuPUwAgibDA3TyDxCxA2VXfD1YM0XhkjuXDY1STIIjii2eCUA+BId8uH9yADx2WiZYXPGr/jJT6
	dDMtlBlpfaD7H2fN2x8uergKfvU88OMh6l82jvUNsnLY2iFjR8UAUIyDIck0nqAlUrF9+o7AZpj
	mYPDz8YH4ebTJYRK3u9c5PfSKSLNDgK8orKoZ/mXX4wIg1RJB/j9qhp/+ksex4G8zNuvCI0csvy
	GrFqNgXqrIlvIjlWKzdp1iYittDH2i5nI
X-Google-Smtp-Source: AGHT+IF3wVYZI/s3wM1PNe5izmwye5C2dxIzh460VAl75DrcM6tXXLw5OFqnGApeHtjQqkaMBAsXNA==
X-Received: by 2002:ad4:5ce1:0:b0:6fa:eaf9:89f1 with SMTP id 6a1803df08f44-6fb3e685f23mr33483696d6.44.1749814921454;
        Fri, 13 Jun 2025 04:42:01 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:01 -0700 (PDT)
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
Subject: [PATCH v7 2/6] spi: atmel: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:37 +0200
Message-ID: <20250613114148.1943267-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_124215_717602_4DEDA498 
X-CRM114-Status: GOOD (  11.96  )
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

LAN969x uses the Atmel SPI, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/spi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 60eb65c927b1..3b0ee0f6cb6a 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -145,7 +145,7 @@ config SPI_ASPEED_SMC
 
 config SPI_ATMEL
 	tristate "Atmel SPI Controller"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
 	depends on OF
 	help
 	  This selects a driver for the Atmel SPI Controller, present on
-- 
2.49.0


