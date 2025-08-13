Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73468CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TB7OCoBKq4sEt4VQQvcl3aOmJkQhrsxuhQkNyl7xRNw=; b=ELT/j6dxfFz4eSaAg/GxvSev6u
	hdOyVud7qGqS0/2v5uXycbPIgMJC9gquMF4v2qaIs5JlU+7KTbBNWuO1FiOMyFqpJV/Jk62NaTpIn
	Arod0v1IonQjxAuzaV6UTwFQMej80OLijh0b9TY4AtmKHemuT4Vhh4Z77cIYd5cqlX+D3ZNIfVGgP
	IvMkcMvaMdjO3wBmBHj75PagLs7dtKDKUdjiOAwV9RJnmNnZCnbhEMiMjJgRWMenpTntlRr7HETkK
	0ig0lenE6aLEng5mqZG5Gaoe0qin35TY6cnPS2fophTKDoQlKlI6EeVVrSFT+lL9nKo/kgLcSQFzJ
	bjeGmRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPG-0000000EqNr-47TX;
	Wed, 13 Aug 2025 19:45:06 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFZZ-0000000Ec07-0OR3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:47:38 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7e87036b8aeso9237985a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 10:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107256; x=1755712056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB7OCoBKq4sEt4VQQvcl3aOmJkQhrsxuhQkNyl7xRNw=;
        b=jLNestY4czRSUJzJ36cHzTM462AJ91z7M74KsR+TicXp2Y1smp8GL8htPzwCduT0vu
         PjrA9PQbQ8ZAUV0d6lSFJKLC1cudy5tku7GasPkQS3o4vkRNRIfryYngI7LGvJSkW5rR
         PMrpBwrw0XStuTFF4TdQ7AUNTzbeKz9H3U6t0f7p7GVglOSkt0lKuWOnXeZqrvq4CmiA
         6NJEbxgEuB/rC8QRyAhWCohQmm3TZ2AGha89zdsAVBi6MlQtzOAMVXHmOV6yqkMcdfDZ
         l/oWJJwlaHNY5cUHfN88f+Y/knF5CHbVozJOjb05yom+LuuLbT+XfAkZ73enbvWDt6lt
         99ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107256; x=1755712056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB7OCoBKq4sEt4VQQvcl3aOmJkQhrsxuhQkNyl7xRNw=;
        b=bfgABp5zu4f9e1bvNmkX45XjPp2YVmnFBKwvO5bilqy/BQm2OJEXlBA5C3VF0h1kol
         uGGFq7NV3NTSJVp45Dh2MTWT2RYQOXdwjDZA8R3B5bEMuzpc3LtvQwZ7muX4OEHmNWg5
         NmajpHcZPEIkHJrwa3PvqfAJwjO4Uf2FnkMosf5Z/99Tn4v3G6oUe7YgeBTR6Ww+jDas
         u0Dw68oLBP74ngxQWlxCe8gEzWLidWIvn+eDjTqHRagnxsQbfiVtB+T5MjyyDScIRkIS
         Qk9O9LgYgOihRnUuZcs1PHLjRuM5A8PpWrd7JT+XjQLbk96cUxyybDfSpmTc28oUZvo3
         MkDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWABPLbWtuYBjo4Fc1rdVSPOBamtsJ3G2xbCg1cNXOk9+zFXeiKAB7+id+9sxN7zHORVGdRYZvv6RCqOXdR3xMx@lists.infradead.org
X-Gm-Message-State: AOJu0YyatZH++rYGNVb+vQdVomwUG9jdo1Soi0yn+0QNgBdQBJefcazu
	qrYhxm0y/yEfoJEOxQoInMoCRzmSrJIniZYK6T6dMvgLH2PtAFd66MRqxnpBcVhmkAs=
X-Gm-Gg: ASbGncvE3/ML5OtWKHCXIrMwu1YSkwM00d1lWWp6ssFq4ecHDY9VjZt5IBtQzdR5RWZ
	i13Bsk5mVcTzPoTVm5WM31IY7+JOgVsB0lNhrRMKmZa9l3pP8xc/ZRi06IiGHS3oj78Ef+LYEJb
	UReZQc23YjtTw/AS8bmXDiljMJpdhPdvKCpeGDRWC/pcjMiqcxR8H3YN+pC3iDTcOY6VBO7Bclg
	mtcoci2lpLuhED/7zSKBqPYlq+H7445OShLHPRELVbVS0pABQ/ufZbeZbX2gnCjqI9sx3B47Ni7
	eSSa1MWIouPE1cICaAsZVk+peGeUc4V0l6HTD3rgSNqWHFUccViCBsDFY731rpJba2eEm4QbYBC
	uBk89eA1o54jxeg6CZuUVyOwzZ/pv5evZNeDm47f7HA==
X-Google-Smtp-Source: AGHT+IEToP13G1zvLikrKvReC+w/kXfMQkt8g35fYQ5sGrJ+PpG+DgIXPbBl9bQ7Qc9/37ctzeq7lQ==
X-Received: by 2002:a05:620a:5e14:b0:7d4:4a26:4065 with SMTP id af79cd13be357-7e870496376mr26868585a.58.1755107255712;
        Wed, 13 Aug 2025 10:47:35 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:35 -0700 (PDT)
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
Subject: [PATCH v9 1/9] arm64: Add config for Microchip SoC platforms
Date: Wed, 13 Aug 2025 19:44:37 +0200
Message-ID: <20250813174720.540015-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_104737_132022_B436631F 
X-CRM114-Status: GOOD (  10.65  )
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

Currently, Microchip SparX-5 SoC is supported and it has its own symbol.

However, this means that new Microchip platforms that share drivers need
to constantly keep updating depends on various drivers.

So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
could instead depend on.

LAN969x is being worked on and it will be added under ARCH_MICROCHIP.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v9:
* Make ARCH_MICROCHIP hidden symbol that is selected by SparX-5 directly,
this avoids breaking existing configs with ARCH_SPARX5

 arch/arm64/Kconfig.platforms | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a88f5ad9328c..bfea380100a6 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -131,20 +131,6 @@ config ARCH_EXYNOS
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
-config ARCH_SPARX5
-	bool "Microchip Sparx5 SoC family"
-	select PINCTRL
-	select DW_APB_TIMER_OF
-	help
-	  This enables support for the Microchip Sparx5 ARMv8-based
-	  SoC family of TSN-capable gigabit switches.
-
-	  The SparX-5 Ethernet switch family provides a rich set of
-	  switching features such as advanced TCAM-based VLAN and QoS
-	  processing enabling delivery of differentiated services, and
-	  security through TCAM-based frame processing using versatile
-	  content aware processor (VCAP).
-
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select SOC_TI
@@ -186,6 +172,28 @@ config ARCH_MESON
 	  This enables support for the arm64 based Amlogic SoCs
 	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
 
+menu "Microchip SoC support"
+
+config ARCH_MICROCHIP
+	bool
+
+config ARCH_SPARX5
+	bool "Microchip Sparx5 SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	select ARCH_MICROCHIP
+	help
+	  This enables support for the Microchip Sparx5 ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The SparX-5 Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
+endmenu
+
 config ARCH_MMP
 	bool "Marvell MMP SoC Family"
 	select PINCTRL
-- 
2.50.1


