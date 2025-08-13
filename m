Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F9DC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLNf+0ZsNl67A+boQNElFMCPPvbgNyj3cPEZ0b5ZYx0=; b=rUXHRC7QJg/NkHioX8twWYq319
	qAVtvjNqRzJu3XlyPuy/EqvFMSG7+V+MC2TqxV5yxnh3J2xM8249OyeWohOPNS0Oy2X9HvD+keZD1
	hHhWOtjrkg/dGWbBcQkVfR0Ze+WwzNmUfuzmpEwYb9UaOHfi5AwdzyvU/h46biqgbuXYZGV2tVoSP
	02rKklpt/v0OaXRfJ2FfNwIx2NzDkVzG7NrfS/S4rpMaACGSOrpcFS/VHFC7/Y2/YHceaeb7i+zgf
	AfUDa9ky19N7L9PTJ0G/h3264n2yIpD9GcU+Wy+D/chWuHZ0GJ43n+ZCxhm4q3ul88PNkxl9oOHLB
	GQG5jBAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPL-0000000EqVl-2rtO;
	Wed, 13 Aug 2025 19:45:11 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFZz-0000000Ec5c-12lA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:48:04 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7e8706a6863so6868285a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 10:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107282; x=1755712082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLNf+0ZsNl67A+boQNElFMCPPvbgNyj3cPEZ0b5ZYx0=;
        b=Whslsie9LoPba4dTHRcEL9YlmBHkZXkxzPUgQ1fcC6FaV0g0hqtsriPOXg0opNdXIH
         sS7XLWhAE//4NejsY5sK9Nf70+uQxXfcwGP6nGjKTtEhFqL4RBcyZfFazy5Myf+v7G2b
         rb4nPZDrq4XcNL7oQrmggbhPZv1jenw3pBpbGRVue+mfBlGzTk2zqpQcIrGL/297YycI
         1l82anqjQ9UZHw7N521a0ipP/z+FxX3WXdUkjNEEpp14P2ia1pCSIWf4EkTBa40ylFqd
         TlsXiSeGSILQu8WaGxqu4CkmrLfX8Ix+XPbu91FH/BNl+pGYVIpoWtwBSwHrvyR2y/y6
         CxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107282; x=1755712082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLNf+0ZsNl67A+boQNElFMCPPvbgNyj3cPEZ0b5ZYx0=;
        b=rLFDzZKl0pLqoXnseX6j9pVamvXJH24fCSCQ0EhOzjhzXH9sAVAD4TxCKOo+zROFy7
         usWFsXl0UAPHUctyIVszJWjrVnXHCivjWxq6eAzBHts/azFrCK5FnShEIox9JW32eITJ
         9/e9Y0RrKjnqDneQ7FeBTY6RIPTUReUlyRH40807WCissyQ2yosVTCT9QA8xtD8T8OCg
         826SEoyP8GmjRE+0hKYYHPqw7C+nDFt+rbQStuuIhYvbw2M83Hsew4aswP7J7F0RN26l
         IEZHOKuqJIs9TP00NBPGDQy7uDRmET9BNWDdY7UTICyCtygQ7ZJIo/qNXy/cqSiyWty3
         QwuA==
X-Forwarded-Encrypted: i=1; AJvYcCWg4pKuyxRwbE58UkffGQBSqvGhucGkKsGtgaxUC8ECdepcZDkiVraI+rvNSuzN2xoS68p7rj6SNSbfWVT+6gwR@lists.infradead.org
X-Gm-Message-State: AOJu0YwUQN61cmfn4VN45avyGmzvncdIAQxHZQceQUXp565RSBNMUkNc
	CQPs0NfHWZ9kqtjqrU0E/IIBiuCnxVgLJxBbseCUSTlG+lhsuHPSr+0HzVoSp5NRnjw=
X-Gm-Gg: ASbGnctDeW8ax5qGUlEyhJwPhQ06SP0qpmQVILf6FVLIdMK5i6L+cLp0KnEN15X4TbM
	vktMK4DFB8taG5KJ/dy8sLUd8goqZ8/dyQvq6L2yu+Xmw/KWE5PDVpvmJmazYiVK3mN4jwaTG3v
	16F10ydvyuW3LW9zBQheTrTxedL2r/M+6vKl7NR1cnfXhc47zLYHb3I+40JF23j6i4ozHgpVCm9
	voSIW6SR1LKuyMpkh49XcS5f43W6HqBXBMF4Vz5VsP6WOFhSWSm33q8Y6+NYPzGXmmVIejeD97q
	iqV6u4ndRBbwKAGEFweCY2kAs++Ldag57t1iS7Zna50GZk0Pg0CRyibylLy7jYCR7fOFpRZDfKH
	mxk1Pu2m5N9+yVZ5WkoQu6sGsoUte2y34Tgr7w6CbqQ==
X-Google-Smtp-Source: AGHT+IG/snJ5W/RG0E/erOkIvUu/WH4PIM7qXx4xAitymXiD3NRL3HZn1ijMkWxa/MDJZoHs07TE8A==
X-Received: by 2002:a05:620a:270b:b0:7e6:9a4f:a299 with SMTP id af79cd13be357-7e87041fe25mr33631785a.16.1755107280240;
        Wed, 13 Aug 2025 10:48:00 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:59 -0700 (PDT)
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
Subject: [PATCH v9 7/9] i2c: at91: make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:43 +0200
Message-ID: <20250813174720.540015-8-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_104803_285324_6B094A63 
X-CRM114-Status: GOOD (  12.59  )
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
index 070d014fdc5d..c0aea0920f61 100644
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
2.50.1


