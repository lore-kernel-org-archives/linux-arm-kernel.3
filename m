Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD7BC83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q31LeQoPU5Tg6LIkWzfs/F/Xva89TsnkgnR1vxDISxQ=; b=vgGj9x4dKNQSamhSll3gQP1T6a
	QgCBVwkJOfRDdVA6STVIDFFOx2qb366S38tNKu09QymkTuWTm0hzL+k5MMZriTahyooqMjaPAAMwv
	gPgDp+lGa9hhFzEuvy0IHkYKqfDHaFggV/XuiTtNVrcB0tRbMRzfin3gI0PiMOqiKx9rAv15u8uCp
	DyN5V0pCc+cVRI58ygPBtrHelH90lLKF7GtiBGB4D0pInz5x4OD6a0Tm5MoGCN8t3PVqLvQsna2Hf
	6xctHdYych1reFxM38ei3KuDD60vHOGkkda1Q1zBqrIxJ1UtyUF55EjJGZHQlmCXLuNpCv9lJU20r
	rf6XWwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2TC-00000009Jcw-26ma;
	Wed, 02 Jul 2025 18:46:10 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2MZ-00000009IFG-49QA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:39:21 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7481600130eso6181238b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481559; x=1752086359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q31LeQoPU5Tg6LIkWzfs/F/Xva89TsnkgnR1vxDISxQ=;
        b=R75EEJAf6pDccHH0TremlUOww2QkjunWTvLj3/QYSEesxTF/gqpowxRvNvIGRV3mxx
         BpEOpS83/EJWbdbz+UOPD5w7g06myZaz4NwiQIkwiNZ3bswD77RiaJBRVpJtjqRu4osG
         AoV02bV3Plg8NBu42owgxrv91uYB1d0flAGtNo8gThRS+dXbJPL9geNyyfLalOoHDKu7
         ayAEfJDjFsmRh5Hw48Y941mRCcz96hyin1+MEuOaTLK3t1nsmUUm8sntH8UlPK33ltgq
         ZViPpJZqrkn8CrLdH9ZhkaXUgMajgyAzT1j6O7zQSCBkZkTxWAg1Oy2AQZqeOHL+TuNp
         HmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481559; x=1752086359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q31LeQoPU5Tg6LIkWzfs/F/Xva89TsnkgnR1vxDISxQ=;
        b=dvsOqwG9IgmYD9Ko0QBFVAjPEWPDFytva6cgKscdKZs2dwELFzbg0aHOjPGfPNWtUF
         vUY4vLSRIMtpNFMC9U+O3EkULsenNlz6Jm+kmx6bIqeTvCzh97uUhe1k6/n/fFUnQfSu
         7WSnK4ftM7yFNCJOtkVgCxEGCvQsIKMIEGhb3E5b4t6jZkB5az86dnY97MD6etyIJdzv
         AC+ty0+l7onnD4KLPS4t3HMYMVd8YVlYMUknqXxjE0Ts28pUeayAjXm2OF8yPWzEcrVD
         lGOM7Bkxle7Ee2xQQbSuUboGJ2itdeOWnnP7UEuJb7fFPGgdX3r22DqP19FQjJVAd/cw
         MCKw==
X-Forwarded-Encrypted: i=1; AJvYcCXyBA+W2lqD7JyXGDwjaVVfLphbZxw4SbH+fQX+EsJK86H+doY6LLmgd3NbgB6VQOuvM+lcouhUA+JS2BZ44Hhp@lists.infradead.org
X-Gm-Message-State: AOJu0YyM82+JTQOo1WzTqDk4njv/fr+78SVNjfWf7f8nLyE5HflqlQ0O
	84VI5u6CQS29SPGrp5o5XvcOyqKEJbZtOJORHPaX5Dh95kd+ERhWoBTnYTVPFc2pE5w=
X-Gm-Gg: ASbGncs/l5Y7P4Bnvpc1kliDmNWrsNhiZJb+Qr8hpMt5OIrcZ+aXUtxQJ/37tiZQYDC
	2mGNqPj+R7r2yJwmrzYLcO+QRlqSWwQJV6T/oqYYqqKCn4XPyZq5PVvhbz/knKdnWMhJ+JUvJWM
	z8SBWF1w8DpN0J46atGkCNyuFMHih3rS2M2KchwFhhNa0rNsbFn6G/gnGlwIYpF1Vg6SSWErCYa
	P5mUzFAse3t1Nd4LJXH5I59giTfW4/RhUyyx06P5t7i4pDIMxD1ZvW/fFKOMfTdotdeZuKdGMCY
	AGtQ2kfM9DxutxqNuvpq8vPdakUnkWAERTRsQnZ36EUuuWvgkgp8KyRPMGl/naC09cPXFI8FAvV
	abEG9Oev6P7LvNKtGwvzHugk=
X-Google-Smtp-Source: AGHT+IG8v0jcBzSkhpF+tlpiIqvrqXtsy8Ix2HiJIAVnZ48c1CRxrkpXzqoHja1AlwcLL8cW97LJSQ==
X-Received: by 2002:a17:903:f90:b0:235:ea29:28da with SMTP id d9443c01a7336-23c7963ede5mr5982695ad.17.1751481559247;
        Wed, 02 Jul 2025 11:39:19 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:18 -0700 (PDT)
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
Subject: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
Date: Wed,  2 Jul 2025 20:35:59 +0200
Message-ID: <20250702183856.1727275-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_113920_027997_91A99309 
X-CRM114-Status: GOOD (  11.10  )
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
 arch/arm64/Kconfig.platforms | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index fc353dab2cf6..f2d5d7af89bf 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -119,20 +119,6 @@ config ARCH_EXYNOS
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
@@ -174,6 +160,27 @@ config ARCH_MESON
 	  This enables support for the arm64 based Amlogic SoCs
 	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
 
+menuconfig ARCH_MICROCHIP
+	bool "Microchip SoC support"
+
+if ARCH_MICROCHIP
+
+config ARCH_SPARX5
+	bool "Microchip Sparx5 SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
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
+endif
+
 config ARCH_MVEBU
 	bool "Marvell EBU SoC Family"
 	select ARMADA_AP806_SYSCON
-- 
2.50.0


