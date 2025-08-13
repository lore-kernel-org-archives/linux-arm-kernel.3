Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D34CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfHoKyNgBhJf0xtcpDC78WNK1W92/OSNj7SkF7mLTxc=; b=SbEPLbGPOg7GBVnSoRoS7ABrIU
	KcTmfD73uM7dHnLYQ1FS2iqZSAXkM6LYM2kaZnP928z0flSRY64sVq84bHeKq+xs9dSfb4tdl1Sbc
	TGB4jGdvrvGD4moIHaApuO+iXo+Lp0ZspoOZ+EN678SqR3f+PcbD4VSAs0yfAEFTySSX14WLeI87S
	q+IZJ0Q6jD6JdJoFn7qBkKJ6RcRqc0yqykSZDRuQIZ0mX4/UOS6vKIp8QosnHzBxD/ZNssKydmg3Z
	e+xOGPONgV/N9G2jnHPhwK44Fd7mU54EUrwssS3x8RH5KJNJ/kmDn1Aerltbuk1HStZDJ8BH9Q5Kq
	Sv4NPtSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKEm-0000000FBZQ-3BM5;
	Wed, 13 Aug 2025 22:46:28 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFa1-0000000Ec6G-0vdM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:48:06 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7e87035a7c3so10828785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 10:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107284; x=1755712084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfHoKyNgBhJf0xtcpDC78WNK1W92/OSNj7SkF7mLTxc=;
        b=bvCo1AGsLllLBi/khL9c1Y+lx5OtAiy0PlmnUNiwQZb2EdIoy6wuZZCmvfOUFddg+O
         ImOc0jmt3W99HkDEREYw6CQUDL6rsAUnGqa1Atdhgu5tWX1wAPfiXfGXOuWQoGm1xHrK
         9B90VRcbVW0+bamVJv37p5f2vBA/R84QTYnr4WoEDllPpAptfne+k+GYPZN2Rt5dKnrx
         YbYGsjJ6+/xZaVQf7NpFZbBYrRSsj4Lbg+UUemVuD8Wjg/3rxgq6thm6h9nnKCRJn95H
         85CFPRBfP5b3y7mHJVWu9A4A3YseTonCEsyVwH7NA7PTJmk37SsFbgFnDHgrNsA9MdIv
         lzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107284; x=1755712084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfHoKyNgBhJf0xtcpDC78WNK1W92/OSNj7SkF7mLTxc=;
        b=knSpplvFs6Vti+rDyb7ajIQxGfaC+4jRaSUU4pvBPwpcuDIgRWUsGwfrf/buzW0UwO
         a1uvgf3x3/hTTv72M9orIo6LLvaWcNpGOTBqkGPigiw9XZl/qRrrDStZv6tQ1Gu19wSo
         vwVv4dffQccz4izT91jaJnoWILiVSP5VJMd4ZvUST9H8POxKldcRRwP/+M7L/8L8YXIi
         F/nMXop1vd1bEDIPDV4Kxnq5b+z1BOrocaUyK2NfR3CD9OI8rd46CAKPN0T1fq1FTzDk
         GSlI7jZeGiRKZl9HPhex6LxKjtBZ2g7lS4oOqcTg4uaL9tOmMlo71fc93jZr1E4XXDxB
         TsMg==
X-Forwarded-Encrypted: i=1; AJvYcCVsB7d6b1pyKbQ9O/VPUAR2F/2miTp1n1255psiRcZUtzKzkhqmi8+NqWKowxJgJuAQUVxgqAtQwh/hvO9UXITl@lists.infradead.org
X-Gm-Message-State: AOJu0YzGB5ZR3hOVoNTAy5hpD2T2OXU4LV2cTE3I5FNIyWHGHWcjycIj
	Qm0Bzm870K5iZXdRdyNqXGoJa6yYVnnMUkZlRs9o777diqWiowMP3/FJ4p6UQFXnxJE=
X-Gm-Gg: ASbGncsBk9v4uOgFsrLppQ6+ezBoB8bdSe8DVSKJ96HeJSHTXJlKP28HAOQTBA5tBr6
	dbManHnxBUxGRqP/fabQfOgff1ImjEmxUiME8YHQQlfvIex8SQDERhkx6Sl5de8wt0+D++8JCvk
	UJFXvX5QQ4U0ktH1vzkhOSo2558BZ6E9vVT6sZFc6Zeb58z0aqaWcCL6r2T6n1roAnKzT7/BEEc
	V3kqDE2qUj5ZKJxZ6aaRUA5olzCmZh639e8HUvBVNFRipTR0Z/ctALT92Fz6YXsdlHXQ8x4Gk2U
	4fAniHQIfRLp13k9aeDbaa3g17GXeFC7f0acTCWgxIJ3FUZKbNob+akjiH/CHRfsKRHbyC/YeFL
	5KkMAtfgwwq5Bhnn9XClycQjo9I1y37wt7xaxqIN+og==
X-Google-Smtp-Source: AGHT+IHk3Ep3PYhhUjUrzxiC9a3/t8LEKcJKp9X+LDRevsQvizEm3+mPb4XnpdaTjxQtoytK8PcKqg==
X-Received: by 2002:a05:620a:1791:b0:7e7:fdd2:cc58 with SMTP id af79cd13be357-7e870473db6mr37537485a.15.1755107284284;
        Wed, 13 Aug 2025 10:48:04 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:48:03 -0700 (PDT)
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
Subject: [PATCH v9 8/9] char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:44 +0200
Message-ID: <20250813174720.540015-9-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_104805_258784_7333EC2C 
X-CRM114-Status: GOOD (  12.84  )
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

LAN969x uses the Atmel HWRNG, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/char/hw_random/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index c85827843447..e316cbc5baa9 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -77,7 +77,7 @@ config HW_RANDOM_AIROHA
 
 config HW_RANDOM_ATMEL
 	tristate "Atmel Random Number Generator support"
-	depends on (ARCH_AT91 || COMPILE_TEST)
+	depends on (ARCH_MICROCHIP || COMPILE_TEST)
 	default HW_RANDOM
 	help
 	  This driver provides kernel-side support for the Random Number
-- 
2.50.1


