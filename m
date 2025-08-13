Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA686CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtMzSO7UPmjR47X20+ZqBD1uhyLdG+1s/Zrtcgs7erg=; b=4UPLEawQmBWyf5Q5hmWUvyksrb
	OrMipbyCqxCrbh6N85j8Yr2kPfGvn1mc35BEUlrNoy5V6PZBAAtcJS4L7sZJXxLX6rCSSeOR7cGZL
	g9TN68KyEWAKZaieI6KJVthQFkNKeNC3AaNxtIh7FaPUkCVnxmsxkyRhGiVaLqdSO1a6L4ru/NpFV
	ZvesGomtYbXqKNj3m0XPG3XZ0+4BbAjQtoTm0JdwJJ34hy3tIXBwpDIY8pzPO6mGFEd7moEoaxtsp
	vmUky/Zcprasb3OhzTrtNf3kxN9H9MJRimzbAG7g9Aa6CTzDOhYsA1Xlzy31EcfFMJV6ENtisW2e2
	/byb6jsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPI-0000000EqPr-04dd;
	Wed, 13 Aug 2025 19:45:08 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFZd-0000000Ec15-0msO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:47:42 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7e87061d120so6218285a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 10:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107260; x=1755712060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtMzSO7UPmjR47X20+ZqBD1uhyLdG+1s/Zrtcgs7erg=;
        b=Qqqlwz7kvhutgHO7vrppH6aNWo7qtiCz4cZ9MRP/gaE+KAKgamyVKSJKfsYtaqrysf
         B8gG7lUVRTEpuUDkKJcRSdHAW2Og2FmoPk4Z1KeAYzvTaKDMh9YDbfe89XgHOEGqecpq
         vRiH9iAQ7ey89Rg2leFTQShp/oNBfS/wlrZevPhcifsNXZOpiqH78Biinvx/FN2poH2v
         xZOwUACGMJer2etluf+XbPaMSnPQ75xsMoL2MSZxXADu0j5WdP58CiH3n1nvQ90VehYk
         wKKZfkdM4zrzIs4BH7wHNBnH4AJb7tpvV6gcf62OA+Hc0z4qNLDxSasOJ4keniRqp4/2
         ExCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107260; x=1755712060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtMzSO7UPmjR47X20+ZqBD1uhyLdG+1s/Zrtcgs7erg=;
        b=bzXmKtxLcRxg9DABOot09rsCsLzEKXGaiARCTjRFqrsEdv2MaCq89iPvWeFdORFFvs
         k+q/2W7JdrU0RA8zOulJim1ihCeI9tICv97HHWOaBI7EZ+Bropx+jII8Rq/O7GJ91Rmz
         7b5Il8/UUZdQ3PA6PC58c1GzjiXVIG0U+kJd76W7Oi0HwxRiwARyju8AjB9/DEQ4p2fA
         3Uxyzu7llraR3zgzcJnlJiKKJYuGPG82N8IVoU6KUSqoCbD4ezf98RXBxIfhSeCUJD7f
         j7/R3+TEc+Ugbjxyfj1g+zyrNZnDKiDSh4J/vfkb8od+vIb/xDdNiHuWp4mPys3Kj9Wb
         +lgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGoe/++PjRSmib/ZbTuQu2TrlKMlKJRfMuCbrgFrD6T0gWx9tv7UsBSpvuzpj7JPeS7wV+qH35Wd5WYDWTyVer@lists.infradead.org
X-Gm-Message-State: AOJu0Ywva3/XCWLMjPgUid1PHXw1DogXchenS1JQ5Vol6Ia/qXRnaYK9
	9xPHvrbDMbUHeA6wRvWn0hJvUYR2kwR4a5A+ZeJ5gSjTEJZ+gWfgtX+gjQHLqJXR0D0=
X-Gm-Gg: ASbGnctZ6DO85izLjCW14X0jNbwV9MAaeoQSI1nIJo0dlWLekZfEYZ4rG4voJGNJuhM
	ky/ymLmADRRdoUKwagFnBTPL02VsrTJoVmWbkn0wTxJiaMXRC6Q1/HhGJGKxuKopdlpOcoXO6hV
	XNZV7LbZqBtXFKCcx39+Koz0H8urZMgp6iYYk/ekn9z0DxaSUhZis+dWkAydlhcprimj8S6MfTp
	ZfsEkSRpQNhcjlA6icKh1plawYUKzE0JnGyTRqy4xUySgFkpiZUsTwtjDUq0lF2MgoEWqn/hGch
	8lhkkVE9dI3rOk7S6sKmuH5PuGwV30/2U3DqHrGlTET4Zw8fN5/EFFSPTgNvgLh2O9dfNTcU0dO
	OYYwbSV8Qsh7/oTLMHRS+0AmtNwL81QPvMueR5OnK6jCWLtSXg98b
X-Google-Smtp-Source: AGHT+IEOA4KVOCs5eFfidLnPllBwbdP8If2rCIZC+fPOPK1dPvbgpwik/9+siLqevJw3jKgUeh5nYA==
X-Received: by 2002:a05:620a:bc3:b0:7e3:60cf:c037 with SMTP id af79cd13be357-7e870593e0amr23464085a.34.1755107260046;
        Wed, 13 Aug 2025 10:47:40 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:39 -0700 (PDT)
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
Subject: [PATCH v9 2/9] ARM: at91: select ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:38 +0200
Message-ID: <20250813174720.540015-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_104741_232841_A0B22ABC 
X-CRM114-Status: GOOD (  11.53  )
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

Like with the ARM64 Microchip platforms, lets add a generic ARCH_MICROCHIP
symbol and select it so that drivers that are reused for multiple product
generation or lines, can just depend on it instead of adding each SoC
symbol as their dependencies.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm/mach-at91/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 04bd91c72521..c5ef27e3cd8f 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config ARCH_MICROCHIP
+	bool
+
 menuconfig ARCH_AT91
 	bool "AT91/Microchip SoCs"
 	depends on (CPU_LITTLE_ENDIAN && (ARCH_MULTI_V4T || ARCH_MULTI_V5)) || \
@@ -8,6 +11,7 @@ menuconfig ARCH_AT91
 	select GPIOLIB
 	select PINCTRL
 	select SOC_BUS
+	select ARCH_MICROCHIP
 
 if ARCH_AT91
 config SOC_SAMV7
-- 
2.50.1


