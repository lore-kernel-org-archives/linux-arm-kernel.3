Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C591C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 19:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLgkgM2dsMzuH/fyTk3FJbcZgyqMvTqyvvSzdaeBl9c=; b=OcEx0XshEXmN+0UVEsncxY+Wo/
	SRuy+XN3TgN2RJ1CfPrvhLdhPQUXZsEVyids1ZUPEmi1eilezmsNOFRAHGA1eDLQm9XgZDxfzf7Rh
	3Rf08VmaYzSGvcKXhbuTLkFuN4CSj9nuD4cKIcpyWX3nOtKmEiFYsLJHNu89w6ZSoAZ1TpPnoUE5U
	7EUbfK+L3ALCviD80KpRRLB8sdwPAdGFvr9srL4dvwdaZOtOmzt0Xb9GjdivUYeqrzJ7YCLBgAgOY
	tbI9/WfSv/WaKNpsH925Re0e19cw13tbjh98EgVz/Nlrw7tdEk0VtG2V1PQM4qqYqJ2pfr+/WAJ9R
	V3/l+hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2lg-00000009MRz-4Ak9;
	Wed, 02 Jul 2025 19:05:16 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2NS-00000009ITK-0sZd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:40:15 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-237e6963f63so31389355ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481613; x=1752086413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLgkgM2dsMzuH/fyTk3FJbcZgyqMvTqyvvSzdaeBl9c=;
        b=b/9BNLe8d6iyqfD+CsJf5qI/X/F8aKBc/h7C+ApkgpW14WQv7uc22Z6zn/d+fswcWB
         A4kStCUYioXFMkqBIpE4AldSGQA8SxSEUhvGahB3O195bgWBeUsnUV1KKq6bibebE75w
         WKiSPAjdCLgLwntkoeYh4qjpKh48UgchJzmh8sbaJhH+4tpO+huAsHh9h7Nmfawrw5h4
         ZF86S/52ohkoZtW7hgzu2BCGz60zSYIN56a1nxkcpUBcLw7mtnh4KrqWtRlgrh2YZBf1
         GdULReWZ1ViEmu1HvkxVMRH2plYjUOMKsc8UT2a23wIcoBoMODWqh09F/dAs4zLQRXPq
         UNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481613; x=1752086413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLgkgM2dsMzuH/fyTk3FJbcZgyqMvTqyvvSzdaeBl9c=;
        b=JDKwXpLh7nRmS1IB4anTejseaQRWqnuV5Re4UP0UvjdySBlGYfhKLESu7GtU4piO2l
         P1f+krtYBWMLspij3IKXUKBv/xeXp+oXJ2qv7xGrFFtPiEUIj+xOZusQjGjIcAIjLyhw
         GYPhavKwx/ahs/fTsZkUoahDc6Ggz729vsXPvKWObYFMMTPQtbjQcGR+stJIO85PpOtN
         5v/dKJfldbH9fpA/jlOesgt+9izi8ugn4iRUykx4k54+Ikcqppf3Uwoq6nsLOlcj9gp+
         WCmsFvA8hmmYrPy7t5JzF6cxBCKakq6GG4a5V8gtYxb7MxdiZQheqoup0rbiZ9H+/gFh
         mYDA==
X-Forwarded-Encrypted: i=1; AJvYcCXXhtRHwprTQtbQt1i3Vp7gGuIYKxDir39UADD3EMaajCNXdTbK6vXcAGnyNz46YwK/fvyosFv4QFTMcSiiDn/8@lists.infradead.org
X-Gm-Message-State: AOJu0YwI+6j9emePewOBrGb2V4Vj92bla1FiiKYtB9NDJB/+VQCpDRnH
	nbCH80bJA2R7GlxWkYTSgy9s5u+geFQhNU+50VLcgaPhaDX5wIkhBoXQ8p9aSOF4ULo=
X-Gm-Gg: ASbGnctIpiUHW/wC2cgNC+NyTMm0EV6O0vA+hduExaffIEQqxoAJi1tjpYkdnaTLk3G
	gcYFiPVbhF6h5AhmnXGxgSI+XUt6TmdaTt4+x5vmaR8pLJQcssQbXuZNTTPrgTjLHeno/TCRbAM
	fXVfuNVtWH4C0UVNK4JWY2sr0AoROzljJOnDMRxEAw5U3A7xSOWiXZHTmK+K+Fbqq2c9ohG/wM0
	ttHOQi9koPmAvnZBTmw2IM1dL5Lb8sGOy2KcvFOMfNhdu64zxRAy//mJxBYpqTBnTHBHV+6i6Pb
	Y8PiR0jnJxEtCCa06TQfEcA8hzFZRRkfktt41Qpqg57/nCzUbO4TKmAaxnD/nJIeb2alrBn0RaN
	rUaeo4ysrBfc/k5bIyItQBmo=
X-Google-Smtp-Source: AGHT+IGIKE9F8Co83/dHlUj/BJjldce2wZ+yTKPm0xGwC9EdJvNItuAvUNQ8nezHwuOa2fWnkwRauw==
X-Received: by 2002:a17:902:da88:b0:235:880:cf8a with SMTP id d9443c01a7336-23c6e4ac48emr57113295ad.15.1751481613470;
        Wed, 02 Jul 2025 11:40:13 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:40:12 -0700 (PDT)
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
Subject: [PATCH v8 09/10] char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:07 +0200
Message-ID: <20250702183856.1727275-10-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_114014_255050_BFC724CE 
X-CRM114-Status: GOOD (  12.87  )
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
2.50.0


