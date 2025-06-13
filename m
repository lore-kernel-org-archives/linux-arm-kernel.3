Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06986C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WlKCQdBK9LWxBVakFnX+t2/73xtUBtXu9i2PrxiazI=; b=k4uYNOgdfRYjcCm4q7qbsTYJu5
	t+mx/61BkswnL5JdbzxKJiYdx8EISn3fwVOKa/UGInq3hWJaoSJgLrFa9sz/iAZTmXDjB2pwcG9pa
	xIGchPOZO+Okwj6w2okQEQYPElB2IQdgcHAhPQ440BvfdCpbgCyIv62DUBbW7N7r18PiZ1lq956Dl
	zR/V8KS/LizSG9tbrihxuTME4VvAV+9eZfiMWNrJ7GOMApXzWPBX/JBvsoDf3T4xApwSw8PYSGEKd
	+vLQnjpiX3402AnJP0UtuFCtipa9jgXJQEEFdojq9z92B7Odm6nsdhSNqbZT0fH0+iGU0V3g8CGYu
	BPNI0GPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ37l-0000000GJbe-085h;
	Fri, 13 Jun 2025 12:03:09 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2nR-0000000GFKW-2nCR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 11:42:10 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4a5ae2fdf4eso34098431cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814928; x=1750419728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WlKCQdBK9LWxBVakFnX+t2/73xtUBtXu9i2PrxiazI=;
        b=fPK/XfSkbruGEfZTW/jmFPPaCVpnmczzu4m/607z9ry3fVZtaoSoVv4PSSlCeNx9x+
         nRymywojlV8BrV3mhZIPgunopaee2Rf0oJX3fGPS5asHZ+HCqTcU4ZlePjVxfRduz90g
         GzkKyD8XnI+ApUD5YM/YAaAptXy1pbGhd3Ec49uNFBXP+UgP2gfg6TF9vDaV32CQ413L
         t+ueojcZwYaRgv7d0AoTqOZ/msrTt4A//wh4Iu9YmbDFwK4ueWFZ6p8kfiRFDikLmAa4
         jAEGTPE8zgZ0hGZGTQqoSf8R7LGvCEuLkms2OsP2zb1C74lhA+coZwFmRKFFchYW0qrC
         X9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814928; x=1750419728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WlKCQdBK9LWxBVakFnX+t2/73xtUBtXu9i2PrxiazI=;
        b=lmtegnRNNhqXZWhjPJsp16Oceoj8Dtt6zT1eLVyNgkQy6vhlbtIxRlv+d3G09YJ2gZ
         98CPTtMPiNoDnkBiUdIruquOuSsr3d6g6xrO+azSladTHX9etrA5+KIZlsKXJ/4Ts0P4
         Xg1yskTY9rDhQfZA4CmrVmOQpyKJMK5lXVk4W3TA/1+h+C3WURBxorEJptd3b1wAsIXl
         cfUkQnfFw0B2TTVDsyhs52Bu4PoQ0rv1t/k3LJFQxa/WAE9WEojHAGzMZHwZUPnTrAqv
         JAJmxhjuDm+p7uxkB+CjhteqFxz1RrQXm8Q/wzPNHr46QxVvyiWg5RuYKQhwQbdX0XZX
         cKfg==
X-Forwarded-Encrypted: i=1; AJvYcCV+g8cM9gr1OvGBfLSxn+5yX1VOkkGUBuJi5zsnpAu3xFb7MsluAotn80LgT7HJWEDSQ1sWo1LsmF8Q5tA7FKLm@lists.infradead.org
X-Gm-Message-State: AOJu0YzbT3w99TJ7DNmfgwd9tjTnH4nMR1aeK6+dBHf5albsXRDPSRIq
	rskDuYbaEhwvOYe/lyugu275D7WaN5dfSea7B1YnX8SEPYXMyIzbcn55FVaKZLPgP3c=
X-Gm-Gg: ASbGncuAJnbTb94MoeNoqDHAifKxMuVp7tmqbm0RRWBESFqOxIC6Sbw95v7UukOU/oe
	3mKmfjsVwiQXYaYCabNrXzvvdPsQicMVuM1uA7+gLaBEWtJZQWhmOAnVCH7ikcxZd2TilotoVSv
	tEhvVxfTt+Jrs6VAA5XySzX5WgSV1FAJagf25KCxaD3v8wXxA/6Rrx7udjeISqCg9Cae3m0Y2nF
	NR6r7ophmBlimIwecrfJZNplEAoKpA5Um+ohuRU+sEes6K57hi9tJ2cav6dKg4447V1tzZxgIC/
	S0BzVVes5JcKTkS0tgGBZzdnXWRLcOx936jsZxYVAifLCcM/KdyKXg9kdayBkUric0pQp9GA0fT
	l2/5CJpg1n0u37mWwxEcXEA==
X-Google-Smtp-Source: AGHT+IGoxDxx9zyPnLwBJu/HgiS6b9JD+b3qfzp8/xdsORghv63P60xiRPkYDDUy+K9jds0kDneIzQ==
X-Received: by 2002:ac8:7dc2:0:b0:4a4:310b:7f0a with SMTP id d75a77b69052e-4a739328f1bmr4762501cf.10.1749814928381;
        Fri, 13 Jun 2025 04:42:08 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:08 -0700 (PDT)
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
Subject: [PATCH v7 4/6] dma: xdmac: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:39 +0200
Message-ID: <20250613114148.1943267-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_044209_702300_5BE60AC3 
X-CRM114-Status: GOOD (  12.38  )
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

LAN969x uses the Atmel XDMAC, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index db87dd2a07f7..0c3f14ab569f 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -111,7 +111,7 @@ config AT_HDMAC
 
 config AT_XDMAC
 	tristate "Atmel XDMA support"
-	depends on ARCH_AT91
+	depends on ARCH_AT91 || ARCH_LAN969X
 	select DMA_ENGINE
 	help
 	  Support the Atmel XDMA controller.
-- 
2.49.0


