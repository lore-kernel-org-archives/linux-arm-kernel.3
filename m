Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D603FCA0EE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89Z3Tvde06t5dQQQh9zIDgC5mMNPPytOaR1RQ792KEo=; b=B6zX1AFprpANWzvGkWeQtI0GUW
	Sgghp1LC4hiJBVtzKmSmlD3BAENco0ANGWGW+WQrfitNqYGsM7JS5XL4XLBH7sDSGuZEsGO6BkuRX
	0R8kT24utbVFwSLuyQcszWMxQZt/i/mUdfg2cGQPD3PUFt7m0GhSJRdP4L0g4mc7mtUDDDSZGpyxl
	JuDbJyMks14dgUNnvD1RVnaRw8WnvOa7IUevDulYH6T5ckNDxiY2nTv/F8rzZ+oEdaQ8+Ut8NKgoS
	BzysoB8jGCKqH1j9RfC6nLp+xf2WAaf1llEbJKAWh0u2ndBRMZQKurQJFamE1I/MLTxPYJO/2q1LS
	0FXnfhXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKEk-0000000FBXK-46XI;
	Wed, 13 Aug 2025 22:46:26 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFZl-0000000Ec2q-1MtO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:47:50 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7e8704b7a3dso7915585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107268; x=1755712068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89Z3Tvde06t5dQQQh9zIDgC5mMNPPytOaR1RQ792KEo=;
        b=FXWR50DoIsha9r+aRCKxQjOt2QAM+FHbZH0KpvV8wVlJC4j7dTXP4XGaxpDTVyQMWe
         l5fuGc3ovpxkXYpHPOO0sMx1r51I305FHp/POC3Uid+HcErNtLnpatTouVxg5Q6rdPjb
         +q17SwNNI2IxOD8ArygXUExObomGamrABjdIgjg77K5tTmQ7mhWAjIwk1SO3MC4Ay9HY
         xkU4ruOqHT6z9TFrXwzfsfMOLvmg5fzfIeR5A/cUxlyfnU0GYvHYgVhkDnuAqEzup5p6
         d+7SsngAaPgsHub5fKt/C6P6WuG4BIIIlHDOLIkMgEpnhXmR+NApMKUadxSwg6muefxF
         luoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107268; x=1755712068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89Z3Tvde06t5dQQQh9zIDgC5mMNPPytOaR1RQ792KEo=;
        b=Im/6tcijBUJQBnHcyR7qWtYgReXSJJd0ZYq6qeSrFrETh8P9NDX2Cok6eTtbdta0AU
         n7ARUHTl3Q0rjRzYS/Zxea4xPkAjc5r4LRHodwJyRNxGaBnREhWjeU4V+TkLDhYvEI18
         She+P2QkMH7+EhNLbYqbAyqtqERPlq/1UZzkH9BNOmmoU5KuOnUJjqickIVTSYBwy8xx
         gFTKtvAh0rOlTZM+Y1pS4L1R0IV+sINZNK80pvGN9TCWKvp+H41heXjeqAVGDMU3V1KV
         7QsxIeUJNgplfeFBwix5RPdBeNbIFmYX/USgS9ojdtXlNyIE9/JiFlt4rxmb32CSbuqg
         e8Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWSdUM++cnuRkFl0KZ9IkBXM3oz4cxGtHPqFl9n06HAe70m74xolLZflvR8GxSx9ThV48ivsavpOnVCTv0xwJy8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5qT/DBWGFDkxX/TekfLzZLy/FVUmXVVdetrFTpAboH0Z2QEkD
	A23i7VDAtIRKpI7ptP4U/xo6uJ+/Rs+P2CEGGwdI5EQPTPHTbmz9I94LYzy6QpQjQRU=
X-Gm-Gg: ASbGncux3X6NY5OogoL8lenqKqfSm4H4Qjo/OpBtB0LV+YovVd0dJ1WhAs91gxihdBN
	CKi6fgdaQrutR52NYgun8EI7i5GLMNTmCT5R64rbJL9KL6aprX0dcivlg3HmRVa6VjaHLkibSwI
	Hk8GAxjvL83AdyV08EquasGywBSSlrDkQXyXXbw8c+JGaIHmxbUN6mDO7P/RuE4jPLFeO4JOc2S
	8Mg+0bUoUDW24nr6d2yKzixvz27xQG+uOFNwpiY9di+cLejmd4yGI3RNZTxsxlL81OcncegfouE
	3qNzk/7E6mDyjVn4AJgLhs7PBby1wK0hBkfxUCe1uKo6Re+Bszo8cKoO9TwyrV8K04JUFqJ6NSz
	WArCw2wbxBil7u6DqMs/MrbhBqtzmL0f7pmBhCpi6AQ==
X-Google-Smtp-Source: AGHT+IGsrPLNHuA2IU7WyavWdRjRrE/0nv7LFlmwkMJjixgV0JmRbdVoxVuLJtki1CHgdv8HoJD2vg==
X-Received: by 2002:a05:620a:470e:b0:7e8:66b9:f337 with SMTP id af79cd13be357-7e87031d036mr36261785a.26.1755107268237;
        Wed, 13 Aug 2025 10:47:48 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:47 -0700 (PDT)
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
Subject: [PATCH v9 4/9] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:40 +0200
Message-ID: <20250813174720.540015-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_104749_361971_16475862 
X-CRM114-Status: GOOD (  13.10  )
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
index 425c5fba6cb1..8f11b2df1470 100644
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
2.50.1


