Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E13C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wD4QPHjT8G71M31CBThmdXAv4qoEcXYUM9xHzhJ3pQ0=; b=yz3hx72TK5in02omXThuBMhx2/
	bE9ykjtdphlGgVEmQs9nxxqYjeIjukxFnoglJXW3B37a/bvlmR+k5B/6aWDrXkTjgMN54uOx7voqH
	Ni0zhfV9XodMm5SmDuMS0d66XFoJcU/1v1HNjg2oZdCuGBZ28H5UaZw5hRrhUmmOHozhfv2HQdDOH
	wvO1MLEV2dNupXoV5ybMy3kIvmwIhkky9OCiEy/pEh30PRC4mhi/bOXMO1v4sCKb9EZ3hSY2Oda7b
	4InolobPbxcz9J3CsM44WUXyI1BeL/bQ6pzIc0DyVKcsexbhxZ6dDmutRAwNC18QKlctGEqLK/keU
	zQpWqQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2el-00000009LOE-16fj;
	Wed, 02 Jul 2025 18:58:07 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2N7-00000009IN6-3ZJV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:39:54 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23633a6ac50so90545335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481593; x=1752086393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD4QPHjT8G71M31CBThmdXAv4qoEcXYUM9xHzhJ3pQ0=;
        b=fnbCMJ+d/U/rjueVRoXFtqtB5vzI31a/TnvRxi3KFbmZx/GKB3Y16g5M+P3IJxhN84
         TNMUr5mjjAauB6GbCiPFGoVSt2GFp3OC6J06Y3ODBk9T0RCcYmqlTppuFLQkdBMAjyj8
         Q6RRxoraLzuEiu1wgNEC4mtN2TagITXXCsJGKVBPqTR9WkRYu7ziX1HMiemqHLiK3EX1
         SxNtsuAzsWf91sH8ddGO+NPZTvlm2uzauLLBFpNBLyCTsESr84lF3Cvp/XRsjo0P0Udy
         HPGACdLPHyTA3FWc1C9w741XciXwIX53ZvnsqF6G4ull2Utp9NGX3HsPMrTUq+z2cjtG
         3qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481593; x=1752086393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wD4QPHjT8G71M31CBThmdXAv4qoEcXYUM9xHzhJ3pQ0=;
        b=d9p2hjet2qLZNGsOJtXqI49C+Xd1h3w88TEq9aGtamO33Di1gMI4FOJqKoKOi4P2oh
         jtDxmPeS3rZZxiRg83dh3ip1ziqV78ngNvl7pxTPB3yQhuTjRhI/SkYpLZDcZYFkySzn
         YlhJa5ootbsVGJ+h/89cIs3IC/Zh/dINqc6lFja1/WvfaOM1nLsqSlZp6SmzrVxsPJ7k
         gkSzclmrDZ4xmCaDi7+n4FY8bNWuh0GshVs7MimW9i8bnO03wokBpgbGDH2wIM1llSoQ
         fiFM0S0Hgl4EMjdGWJ/2pjkJEK+ZQ44fgkzVBNtWuzyXPog+Td+X7lLrQ/jYOCMspeh6
         ta7A==
X-Forwarded-Encrypted: i=1; AJvYcCX7NgxBRxUfgrmbMLzqyNyKD6ShdO9ObAvOWCUlVj3ZHgIQ6CtOqrOYWv6UwDzUoLvi1I2MJjtS3P7P+fzRYzi2@lists.infradead.org
X-Gm-Message-State: AOJu0YzQCPUx1QG8yQekB/ceXIEj6jTmQli/6H6Pj45zoeSAWJUh9VL+
	xVzj50o7YBOLBYd1Kx6VJFsCLImF0izFTSr+Khb3PImU/N5NxbZLBcWmv5NwqUwQ6y8=
X-Gm-Gg: ASbGncsDxxojxvpZxGC7EXSvh7riOLsOGSldl2B7mXeKXp1hTeR9YgrvvBa6q75idAH
	2a+n0bcQ+SqePeGRZu8xTxyK6mbxtOFqQa4uQ6jtx+jzA+H6bCiCRuJxqH6R4ui8WTJ5Z7JDVMw
	ZkgUMG/KP7GqvJi9QXdNJm1cyPtjRmZiGs7z9SvtvTnSoR8ty9bL5AEJJDDYEESmT9aWCvfcVN2
	Wu4isgiH5f7IRnuYxRxcOeDa7KXONo+hi+iK8b8gSCHdt6phklZCdzKcHz70vDXMv8WbZQjTysq
	z+8jmFQvZ5V0dV0+lS4o8CgyA2Nk8l2PwVDXfyeYRdtWwyGPTpI945QDlZuvQWuSFVAaUSzVMF7
	J/L1uMjBO3Q+h0Qj6tLBpFk4=
X-Google-Smtp-Source: AGHT+IGAQ7JmlYBOBzbIQlby/TAkB16aHlqrj6A7a2pC4QxXfKmUKta4phGLGtsgT8ahWX5lEnwzqA==
X-Received: by 2002:a17:902:dace:b0:234:c549:da14 with SMTP id d9443c01a7336-23c6e592183mr58648255ad.29.1751481593085;
        Wed, 02 Jul 2025 11:39:53 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:52 -0700 (PDT)
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
Subject: [PATCH v8 06/10] spi: atmel: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:04 +0200
Message-ID: <20250702183856.1727275-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_113953_895862_5D0D0BDA 
X-CRM114-Status: GOOD (  13.08  )
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
index f2d2295a5501..a7ca7cd9648f 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -145,7 +145,7 @@ config SPI_ASPEED_SMC
 
 config SPI_ATMEL
 	tristate "Atmel SPI Controller"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF
 	help
 	  This selects a driver for the Atmel SPI Controller, present on
-- 
2.50.0


