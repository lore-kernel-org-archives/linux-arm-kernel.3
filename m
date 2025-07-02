Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D462AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 19:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbnTNMFdG2kGnp4zBFs5MgPMup5zL0Zfe8VUfuWUBv8=; b=1pqGD2C+UXdSpm5aVV/0Rbs4NA
	Qq6Igfeai/oEHwLmZ+i2SiWP9I7Nivraq00HWM+eEFkb30wjnEHyTBKBLi8S0fBTP5Zz3k0Tb2a85
	z0CHEmDmn3gEi8RIqWklAA8Y4cBzUQOuPP16zcFTfSfd3aEXxvhUlB0RSkqBJY6MprmdW/yLu2kO2
	+qV7EZTs4C13FWLou8yBRLa9BD00VLfUBjrMYJof+dXIHeLGmj8vUiCIDAIvKJV28vriWfNIiQv+l
	UtLMYpKiBWsBbsfI4QM67sgsrGTZgzguAbNteFSNxI20GmNvXI6in/6vhrdb0Q8hAB6Rhty2SC1wf
	dZe/oqrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2nz-00000009MkJ-39Bv;
	Wed, 02 Jul 2025 19:07:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2NY-00000009IUy-3TQX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:40:21 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2350b1b9129so32529065ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481620; x=1752086420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbnTNMFdG2kGnp4zBFs5MgPMup5zL0Zfe8VUfuWUBv8=;
        b=ynkl5VyF/5HiB37AgEfP+TWLK9HzfoQsqLy9rTuCUf6U7VqP8OLDzUA+94FveZDzOS
         GEmxhsZiJOAj/y002Ag2/Uwx03KVw3HdC+JJGnTHCvOKzKr0fyZR6wYh0bH4QJGQPQ77
         57IvW/LLadGZ25w4nCKBcthzNzu1GZGB29DdE3zt/etMMfENo0ba7Ny5YcGy3d5hKkQN
         7moro6jw4prumdagLsh3NlPkdhvMBTGpPA9XfaEmZ50/LIFdhpJqmaPcnVQtDn84r7/u
         t6148X2A0OmeVtepWtBdbDhSHlusPKRtUMNvqj7PoaM7XgQqqZnc2HbiyDe+oC6FRp10
         8uIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481620; x=1752086420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbnTNMFdG2kGnp4zBFs5MgPMup5zL0Zfe8VUfuWUBv8=;
        b=LrBlZfiRnlNsjGDZYjAOnRJ0iFM76SX71LFP0uaknqapcIFJ8Q9fQKiCGnyRnXxrkz
         s68PuYZxulZWC+uoB1Hku4W3LA5KyVncwGNyX074M7fDKcZ8nmjdAfeltrSDKIu8uss0
         oUsVt1VolKNGJSwii6Ce2ITqI2Id2xbe0gkl+76tVz6vO6NKeqbZ6r7YUOT3QlFThn6b
         T7GCmQrO59ZmIOD8I2xy6iasw0eSP/DKku5l+oCXFq521vyCiUqXBqInU2o0ZKgWQ/dl
         BEEXEVxpeqEMDdFej2/g87c0h7scY55paQBJ/8tq/EXJW6kb//EHx42Vw/YPBgCsA0lP
         FYKw==
X-Forwarded-Encrypted: i=1; AJvYcCWP24GKk4QgYp9ainq8slEvTB+HvXjTx7uIHmq97kilVChoIOqgXQvKd4EzPf3pcqHITOWbm/4QY9fUsZ5O3H3X@lists.infradead.org
X-Gm-Message-State: AOJu0YwoaRYauGlCgE0mbU5Tcta/36OEx7XbklLrqYIEcmXBh2+VE8TO
	tQIEZ1DCc/DKKgEDW1uEvukUEIR4ageqbQxP4vwTrFIG8VGJkb7ORijJ1xLxqN+d3Vo=
X-Gm-Gg: ASbGnctWRTp7yUATuAP7i8bks1LVVAZrPWVMTwFUS5yiOAJS14PDO8RumMHGVSaYYMr
	FvkRw2PnvDjLj2YJ1WHzExGGkFDpz58Dz+hyRaTpoe8zwJPhLTaYCkSxFyUe+JQPAqfmtS7T9MA
	mPOyshJQ8/WIC4SepN/216Lr5QpNN1z4oSDn1NHr/aA30YQ3UU9/LdLMiHJTWD5KHVwMPcrqID/
	gA/ykXkBMYEDzMo8EPbThqGESD7FN0fvTYJ3w7jBl/b21D0oMqF6JKx22lyFh/y8UvzIKdCDTA7
	MQJDflxzGHhKvvzBKEeUFmmVGSzvkyIbTxvLexTTB8yytW0j6v3YRlkhWqEtVJAQjQ3AAK5Es7e
	Ht0e/6s5ZX8SJgwLI/PcZzq8=
X-Google-Smtp-Source: AGHT+IG4Ha6X6nXWuDRiiAtD/IybzMavhr6X2melJ3MACMJlG77wfbwOcD6VvpmvkGPoSxTpUxzwhg==
X-Received: by 2002:a17:902:e751:b0:235:2403:77c7 with SMTP id d9443c01a7336-23c797b92e4mr4443315ad.37.1751481620268;
        Wed, 02 Jul 2025 11:40:20 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:40:19 -0700 (PDT)
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
Subject: [PATCH v8 10/10] crypto: atmel-aes: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:08 +0200
Message-ID: <20250702183856.1727275-11-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_114020_864578_948C8D7E 
X-CRM114-Status: GOOD (  12.56  )
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

LAN969x uses the Atmel crypto, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 04b4c43b6bae..7c1717c35b76 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -439,7 +439,7 @@ config CRYPTO_DEV_ATMEL_AUTHENC
 
 config CRYPTO_DEV_ATMEL_AES
 	tristate "Support for Atmel AES hw accelerator"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	select CRYPTO_AES
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
-- 
2.50.0


