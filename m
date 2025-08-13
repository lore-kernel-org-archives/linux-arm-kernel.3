Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF92CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHeBX+bcrAsO9afYXWyPr7+HVV+gOxB4ZyOYt9ZHb8s=; b=qcrAg8KMP0PnnRPksFfcm8hswF
	nyrXqRaBAoiq9SDcWwn35TBvy4o54obB0GJsLm1zLQca9G1OCkj8BWa4lzx2+JKtfmWnvT6hfh0eb
	jdeuaZ40YKz3v4hyMk7q1loWpLaI2GiPTvEK3RGNjq8YhCfBSmUqRRRSdDpTRfmWbyvx/a6/jd61l
	978UJKvNEwXXBbzqAO42aKpZpSAbOAXDkuGT8+/kQje4qb4MI/hlBtOJjDhq//4LNRHzC6Lovn+sM
	oiQsg8cQBPijIHJe3MRaeTEBdQTUPDcIFtByGD9ICCDFwNl0K7yBmUmm3o0Yws0FGjfBUhKe/7D0F
	abWWK5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKEl-0000000FBXe-2ECW;
	Wed, 13 Aug 2025 22:46:27 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFZp-0000000Ec3X-1afl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:47:54 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7e87050b077so8359385a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 10:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107272; x=1755712072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHeBX+bcrAsO9afYXWyPr7+HVV+gOxB4ZyOYt9ZHb8s=;
        b=JsL8wQv1WYOPY6jTzrRQMGxnqAgo/Naj+e7OMa9Xb608eK5Qjlirlv7d90023aDJFs
         zRnSIoERkhSwEKhpTi03RGBVWx3wGVZVHH/4kvVh8xrgEfjUnKqS4A1vEuXBn4LcC2Y5
         JqueGoOYy0OIlnNegNCAzpKbcbodNmO8AhDL9D4VUMqhCOwosZDeKbWHajK/rcX+1j6S
         IYEdQULpr6WUbNBVIMfQvw3pGljGAnrrq0ZKHff0QSSkSGYZDq/oLzPzj32JLFgH3Ffi
         yE9PJMtpr/4kx3eSKFEua97gDLNSqJ4h/M4mXn0MS2M3JesFfRI30b7xT/fR2o2N9XmH
         RbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107272; x=1755712072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHeBX+bcrAsO9afYXWyPr7+HVV+gOxB4ZyOYt9ZHb8s=;
        b=I6SyAiyAsx4tFFbgYvv72UxfI+YnvV82xASmQlyVyJHpppKPTc2tbVPaAyy2FR2ph3
         7yeYFrBULSU4L+bs9WhvTdDkTjWlx5Uln/+Lyc8SKqJrtQ33hi15/Eb0HzuXJ4OsaO/f
         Wqt0Ti0jLjwrGMeGEjr6a/hVM0M64tW5IOSfZzcnlPfSKzUeZQfuQM73Pp11k6CeQsN2
         2zESMoaxsRBU3SQeJ/5MxaGsvlvaNqxkueNWZbbJ8OD9wX2ushtI71NTKaElp5PLYkg+
         9UzJrNSKiSnm8IQgvhTfM1Ogqj3G5VLNf8zfFEi6sPZxOvg4Y47PvCZqQNGUJhC/bqXb
         yPWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqr41Kiy2bgwIxXtroOF5qedqEtCejqW/PHsSE/Hv97Qz9r9c1WqS0NG0hVHS9qWgYDOAToYfnkCyELbKNCbys@lists.infradead.org
X-Gm-Message-State: AOJu0YwolyhEp/zpnx9yXV45xdFDKqln/9KfK0eUIbMtJjhAGZczqcxc
	jcPRMtw5Fr2S5Rr5oVqcO7n3LCi1vP5B0I3kr5cHtZTKSYCbTWf6MLTJpDn3KNrjC7g=
X-Gm-Gg: ASbGncuOqMPRE4d9b6cAdwSSwv4A/tPPWLtz9YV4u2OCOlKP2msz+io+pGxd+jNEKNO
	6HZ0+Sc3cMFDpTjOZTPnkqhSg8nGhHyQx5iP2cc/pZdoaHCN+vj5KDIvzvh+WNTPXxGVyOssppk
	E5oFFGut1u3HqfuxeW+yuPGWYm+6bMWHg8AztCohB8R5woUjtDZVUT8pjvs+xfnVt9fxBNBGyNg
	GTa/vpLgwVXuRrZAZStw3efNi+/yT2vvFYuLsRqe1jZVR1WME4pFOstee8pCDnD8t3Q7TsdGohq
	o+V2ex3BDkQyyXeG7C36EuHIk2g5Yk2ilkc9EM5n0wTI0Ua/A1HfZwlIQTtekqeiFnWET2tRqos
	4SYSxh9yIzAnM3/1Z6KG84Ir/Dh+TNF24qgZz+DSm7EVgwgk91Z11/wQFv38u52E=
X-Google-Smtp-Source: AGHT+IFBbRD05COD+4uOC97ucvpHyx0jBQqfnQDIsz8+GmCzNdE1TPU770o9CrOuegUdmCbSDq2ITA==
X-Received: by 2002:a37:f50d:0:b0:7e6:5ef5:c7e4 with SMTP id af79cd13be357-7e8705d2e04mr26126585a.64.1755107272247;
        Wed, 13 Aug 2025 10:47:52 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:51 -0700 (PDT)
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
Subject: [PATCH v9 5/9] tty: serial: atmel: make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:41 +0200
Message-ID: <20250813174720.540015-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_104753_414611_FA3906E1 
X-CRM114-Status: GOOD (  12.60  )
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
index 44427415a80d..724ad4f3cbee 100644
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
2.50.1


