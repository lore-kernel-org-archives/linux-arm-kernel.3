Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CE6CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOqtWGRnguTuSIsC5EGTanl0XgtE1XRc/qnGhyYka2w=; b=ut6h+KnBN96CDHwZXycwZNcGVE
	QnuaClx6oZ+bPZpICoGaujmmkz8Yp8OelgbzFGf6kKiav+/YzEUSaIbVwnhEEuPYbmcUBL0m3FOYx
	xaPNA9XC8hYzR9HTJ+AsGIFX6bj3EYzsOyoUsm7+VfScEN9JgGi6bQw+AFC8LohRE6V8lNodFCnC5
	/bHaeCB3AXU3AsX5MG2zkqKSG3iXFsuqM8WXJUz1NOWzzS5kY3QGnjwEJLVDmmAtu+OsMUbeTcx+N
	E8P/4E72jv0rTA8IH7oy1bRmW5mOomzUBxtPoo1A2aJ16/rMiC1FqlDsMNXy211uAjlqbD78Lhq0q
	ZoRvrhmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKEk-0000000FBWp-2AYd;
	Wed, 13 Aug 2025 22:46:26 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFZh-0000000Ec2B-0SUz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:47:46 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7e87031ce70so6388185a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107264; x=1755712064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOqtWGRnguTuSIsC5EGTanl0XgtE1XRc/qnGhyYka2w=;
        b=Nqi2km94VGJ2F8IsWyZEmTjaC3ngBRl58eLq2ULCiugls+FVQtnq5e/XanRhxQzIpn
         K3z6IHTKGj8FSYgbcDwvsyo52JU/6GXv3DH1y7B2dyOnhgmClZ9xB7LHCLo/sEWpQvFX
         lw2L9RHZ1ox3PNykjiJaopIFrI+ehJkaf2BH/G5w6YpY3yLrxWmPrDDIqrPnTUAnvDEQ
         aN2H+o4X5wfTr2DlVtiuM4LfxohX2DjMFPcGioPp+7CgquftAvaUoic3ag97nGqr6zhJ
         ya/C7rQWg5tB8xGFCl5KJLvmVbEB+CicbOGU1GO+uHkPOTmbk/6McwiRvg2soyCg0oxG
         +Zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107264; x=1755712064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOqtWGRnguTuSIsC5EGTanl0XgtE1XRc/qnGhyYka2w=;
        b=dJV/xL8trsRfEK8sRdHDW9Uov5eVEaIl3g9uR+qwps9TLjY0WPKj0xNNHaPTNlPygy
         mGmR/phfAW07E3ZxoF4t6mz3A90e9ANMhgVWzVFkOrP1iySleu+8OIJLteD/uCo6+sUJ
         Ed5RE4cVD6Oun/vSCsGtl+wt9ygB7U1An+cZA5SMOY3jXzmmvL05rJBJdQ1XiXXWDsjj
         oymIMVqoqkYAESR7f1Hfkltav38QTBvSpBT1TiVO3CkFLGRnaUmONfI2J8/Se3C7K428
         kEYfqeTpLZIvCySZ/W1DuhWsxpxskJsqU4oOWtvxCqFZrisBKIAFWV3k78xUhW5t78Cj
         8XwA==
X-Forwarded-Encrypted: i=1; AJvYcCWEtPotFc7b3kyPp5u8lx57+gZ0nfZCrrSsQTO1Dc6H4h9j6WE2wpQsnJgR9VxnRlTVeuNjpmzmqUxUYdpZl9qg@lists.infradead.org
X-Gm-Message-State: AOJu0YxxJut6zijg7G+XNDYj/ONoWZ4YQW1G4QIOABg1tqloPvIfAXQI
	Gbv/FeonAGw+xubuWeZ5eU7ND0AEdZ7aoSVwauuq2Tws2pt5q61qOhSXfg1wlb+gz+M=
X-Gm-Gg: ASbGncsos9HTxqyRbjLVssfhSerNW8FndIvU75dS4rAOlfkEFdyWyab1OoX77Jl7V/J
	fAyOBTWqr8+yQy6iD3lKC4WxILUQLkeyeSvV1tfTVkm/AJeUosMwciJXr2sAb7WEv6i0l5fpYAE
	TRU492Dv8fqtQR2bwDl7b57lsDVPC/QRC5u2vEB/k8UyDXDVQlkBiuii7ITWs/5FEYc4WLRAbj4
	8DuOkgF8o1mYEIAwQL7l2XPGXICSWSJBOm+U+VdNiO27DIrQ4kyOva/smjo71bAhWI3ZKYFmkHH
	cJSik6n72fuVDOvecraKS2Yo9Yn0iYPPFkpBripKYXeFkFURfhGf4ofNuXmIgIEMgumm7GJXYW6
	V8IQpEPzW0Bv+TthykdCIBVPFiJUisG42Qb+6jPeHwQ==
X-Google-Smtp-Source: AGHT+IHM8gqvwU0dp99AsCx2aJSW6E+YiETEDgm//P8elY9qJZZswfVzec82j6i0ynh7rzsSjnHxBQ==
X-Received: by 2002:a05:620a:31a:b0:7e8:20cc:64a2 with SMTP id af79cd13be357-7e87035636bmr30883285a.26.1755107264026;
        Wed, 13 Aug 2025 10:47:44 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:43 -0700 (PDT)
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
Subject: [PATCH v9 3/9] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Wed, 13 Aug 2025 19:44:39 +0200
Message-ID: <20250813174720.540015-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_104745_146887_447F405C 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v9:
* Select ARCH_MICROCHIP when ARCH_LAN969X is selected as its now hidden

Changes in v8:
* Place LAN969x under ARCH_MICROCHIP as suggested by Arnd and drop review
tags due to this

 arch/arm64/Kconfig.platforms | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index bfea380100a6..31bddd1a17de 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -177,6 +177,21 @@ menu "Microchip SoC support"
 config ARCH_MICROCHIP
 	bool
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	select ARCH_MICROCHIP
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_SPARX5
 	bool "Microchip Sparx5 SoC family"
 	select PINCTRL
-- 
2.50.1


