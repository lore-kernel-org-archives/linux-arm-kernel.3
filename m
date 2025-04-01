Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C70C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=da95LwKsEKhn5X9Yib2ftWvbSxtT4UgZuzjrOIRyx4c=; b=SQCgmCh0sc1USLVECBo/F2qsPA
	FYml7diikmb/Am6ySFXS1xGwOM48dRxZRPUdvT8BLHZ3wTmmf+VX/rPlne5IuGLp//lfJHSa85SAW
	x2voInqrZ1y8lN/OSM+UwDcVQNGkoWKu/fm5ckRab8Jl8k5aoaYRSOfmU9sHcQo3UMbv5bwHgJPuE
	ErnWtZiK87KBb+Nlc//iutTlI3PgLARkMgUlNIqAN2zpG3NYwZh0j2Uf8bJYHxnDI2Xf2U1UGDL0v
	lcUZRNwk95wC4G4E7gAH+CEXByH6xHmdwAYGe4FRCUyjImgdFhXjvS/qifFsBM4/jVB9wmOdD4Wy4
	fYYjQFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXep-00000002QTY-2Mw5;
	Tue, 01 Apr 2025 09:11:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXVU-00000002OvL-0clz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:02:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so32076665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 02:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743498122; x=1744102922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da95LwKsEKhn5X9Yib2ftWvbSxtT4UgZuzjrOIRyx4c=;
        b=bzXYE8hnAWTBubDkgk+rylkFpJWh7rSO+1a82kyzKVXDiJg23+yTfZg1itTVsBO6B/
         F+fFzAEK7/cyYmSGr4CXS0HXg5QIVvLRu3Xy6FJUKxE5s15HQU+9d8ue2Tg8CGK7K9tn
         gU84/oyyIi86pyrz4CtSvrh+Yi0IEbS4ljK6SOad7SOAGeJE/3Du+1iOzFe3tSsFcm2u
         hy9OfrHcFBmVj3QLP0bkgdG6b94BneWMS1Zm0KaYdVHgHWNwCuCrMimyWyx7TqkriGl4
         99m/nsceG1LfCOpHJJfNh0eXsIw/lYc9fi6kN8/nd3m6ArzF4aRZG3T76AopqzyHWdWS
         jotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498122; x=1744102922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=da95LwKsEKhn5X9Yib2ftWvbSxtT4UgZuzjrOIRyx4c=;
        b=GJxcKZUJCsxSaTfx1KJt5BQWBohuz0zULkc31swrZqN4ToWFieRObrqpEpZw6fBGbS
         mT3d6Wl/i8AFVK3XYxvrDTLjUXR2ma0ylKscYeDd6TVEXosmjoL9TxKwTQ3YtmxYJ6tQ
         +bonqioo//+vMx8sX4ku8DvKjCoTr/2cC+BdLV3EC/mBAcCAJsDpRgtSaYJQGF6Y3AkE
         RV7QHayO+fwTJ4qc+7dv5cRKd1s5cAaSCJ7A1W4uMMlQj8sMq0dUzwt/szFojIOfmjYI
         yfIq6LOtRZqJIbVHDdUXkNfoIEb4NO6SSVHYjyyjcbccM1XidKeymtvbk9UT2mDzbJeV
         e/UA==
X-Gm-Message-State: AOJu0Yzh47iidnswJHmx6Yl0RrZkHMY0am52JNJobyb0oeDwkyaSlh28
	PQojudSjEg1gECS6NoEHD3bZGK6OeW50VhJi3A8gVHjdROcEAQnk
X-Gm-Gg: ASbGncvTmbe/HCnNnwOLmpLiVuYaMo8Fa2DMh21MMQRTBQZ1dgT75eipGupDjpL+Rxg
	RaS9L37ep8iPXu0A5+e5XfqVOZ4ZbQD++fafQZC5boIW2GLoGXGOiWC1wK6kFTD9xU9enMcbp2u
	fE1DryaOWtSd2D4JReveJl0yXW5ulglZjOSoBeqjE2Io9GOv6b7uJfl3jTzGo+ROI0FlwFvXMKU
	t21gi2hraW6UKCpwLsNCJ0oTXKSz0aLe4zIQOiS45Lq07PDAW8pAQyut9GgeaJL89kNyylTEMeY
	0E3//TidRl0quATC297Jnaw6WK+uWK5zCqM7MdtIs9OWdeCSiafv5fyrc9CKiY9ej06yFg==
X-Google-Smtp-Source: AGHT+IHREbNY6slwOUJkrE/DJtsWTRfTWlTBvTnWDGtVse0ltw6lWAIOsVjh6nsKIzkZpRWe8cc8Vg==
X-Received: by 2002:a05:600c:6c4f:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43d9105c99fmr131948585e9.9.1743498122382;
        Tue, 01 Apr 2025 02:02:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:cd7b:4630:9a98:b82a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd0738sm148391545e9.19.2025.04.01.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:02:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Russell King <linux@armlinux.org.uk>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
Date: Tue,  1 Apr 2025 10:01:30 +0100
Message-ID: <20250401090133.68146-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_020204_191487_AF1835A6 
X-CRM114-Status: GOOD (  12.11  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable various Renesas SoCs by default when ARCH_RENESAS is selected.
Adding default y if ARCH_RENESAS to the relevant configurations removes
the need to manually enable individual SoCs in defconfig files.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 49648cf28bd2..4990b85d7df7 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -65,17 +65,20 @@ if ARM && ARCH_RENESAS
 
 config ARCH_EMEV2
 	bool "ARM32 Platform support for Emma Mobile EV2"
+	default ARCH_RENESAS
 	select HAVE_ARM_SCU if SMP
 	select SYS_SUPPORTS_EM_STI
 
 config ARCH_R8A7794
 	bool "ARM32 Platform support for R-Car E2"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_814220
 	select SYSC_R8A7794
 
 config ARCH_R8A7779
 	bool "ARM32 Platform support for R-Car H1"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN1
 	select ARM_ERRATA_754322
 	select ARM_GLOBAL_TIMER
@@ -85,6 +88,7 @@ config ARCH_R8A7779
 
 config ARCH_R8A7790
 	bool "ARM32 Platform support for R-Car H2"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
@@ -93,11 +97,13 @@ config ARCH_R8A7790
 
 config ARCH_R8A7778
 	bool "ARM32 Platform support for R-Car M1A"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN1
 	select ARM_ERRATA_754322
 
 config ARCH_R8A7793
 	bool "ARM32 Platform support for R-Car M2-N"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select I2C
@@ -105,6 +111,7 @@ config ARCH_R8A7793
 
 config ARCH_R8A7791
 	bool "ARM32 Platform support for R-Car M2-W"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select I2C
@@ -112,18 +119,21 @@ config ARCH_R8A7791
 
 config ARCH_R8A7792
 	bool "ARM32 Platform support for R-Car V2H"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select SYSC_R8A7792
 
 config ARCH_R8A7740
 	bool "ARM32 Platform support for R-Mobile A1"
+	default ARCH_RENESAS
 	select ARCH_RMOBILE
 	select ARM_ERRATA_754322
 	select RENESAS_INTC_IRQPIN
 
 config ARCH_R8A73A4
 	bool "ARM32 Platform support for R-Mobile APE6"
+	default ARCH_RENESAS
 	select ARCH_RMOBILE
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
@@ -132,6 +142,7 @@ config ARCH_R8A73A4
 
 config ARCH_R7S72100
 	bool "ARM32 Platform support for RZ/A1H"
+	default ARCH_RENESAS
 	select ARM_ERRATA_754322
 	select PM
 	select PM_GENERIC_DOMAINS
@@ -141,6 +152,7 @@ config ARCH_R7S72100
 
 config ARCH_R7S9210
 	bool "ARM32 Platform support for RZ/A2"
+	default ARCH_RENESAS
 	select PM
 	select PM_GENERIC_DOMAINS
 	select RENESAS_OSTM
@@ -148,18 +160,21 @@ config ARCH_R7S9210
 
 config ARCH_R8A77470
 	bool "ARM32 Platform support for RZ/G1C"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_814220
 	select SYSC_R8A77470
 
 config ARCH_R8A7745
 	bool "ARM32 Platform support for RZ/G1E"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_814220
 	select SYSC_R8A7745
 
 config ARCH_R8A7742
 	bool "ARM32 Platform support for RZ/G1H"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
@@ -167,23 +182,27 @@ config ARCH_R8A7742
 
 config ARCH_R8A7743
 	bool "ARM32 Platform support for RZ/G1M"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select SYSC_R8A7743
 
 config ARCH_R8A7744
 	bool "ARM32 Platform support for RZ/G1N"
+	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select SYSC_R8A7743
 
 config ARCH_R9A06G032
 	bool "ARM32 Platform support for RZ/N1D"
+	default ARCH_RENESAS
 	select ARCH_RZN1
 	select ARM_ERRATA_814220
 
 config ARCH_SH73A0
 	bool "ARM32 Platform support for SH-Mobile AG5"
+	default ARCH_RENESAS
 	select ARCH_RMOBILE
 	select ARM_ERRATA_754322
 	select ARM_GLOBAL_TIMER
@@ -197,6 +216,7 @@ if ARM64
 
 config ARCH_R8A77995
 	bool "ARM64 Platform support for R-Car D3"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77995
 	help
@@ -205,6 +225,7 @@ config ARCH_R8A77995
 
 config ARCH_R8A77990
 	bool "ARM64 Platform support for R-Car E3"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77990
 	help
@@ -213,6 +234,7 @@ config ARCH_R8A77990
 
 config ARCH_R8A77951
 	bool "ARM64 Platform support for R-Car H3 ES2.0+"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A7795
 	help
@@ -222,6 +244,7 @@ config ARCH_R8A77951
 
 config ARCH_R8A77965
 	bool "ARM64 Platform support for R-Car M3-N"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77965
 	help
@@ -230,6 +253,7 @@ config ARCH_R8A77965
 
 config ARCH_R8A77960
 	bool "ARM64 Platform support for R-Car M3-W"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77960
 	help
@@ -237,6 +261,7 @@ config ARCH_R8A77960
 
 config ARCH_R8A77961
 	bool "ARM64 Platform support for R-Car M3-W+"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77961
 	help
@@ -245,6 +270,7 @@ config ARCH_R8A77961
 
 config ARCH_R8A779F0
 	bool "ARM64 Platform support for R-Car S4-8"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN4
 	select SYSC_R8A779F0
 	help
@@ -252,6 +278,7 @@ config ARCH_R8A779F0
 
 config ARCH_R8A77980
 	bool "ARM64 Platform support for R-Car V3H"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77980
 	help
@@ -259,6 +286,7 @@ config ARCH_R8A77980
 
 config ARCH_R8A77970
 	bool "ARM64 Platform support for R-Car V3M"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77970
 	help
@@ -266,6 +294,7 @@ config ARCH_R8A77970
 
 config ARCH_R8A779A0
 	bool "ARM64 Platform support for R-Car V3U"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN4
 	select SYSC_R8A779A0
 	help
@@ -273,6 +302,7 @@ config ARCH_R8A779A0
 
 config ARCH_R8A779G0
 	bool "ARM64 Platform support for R-Car V4H"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN4
 	select SYSC_R8A779G0
 	help
@@ -280,6 +310,7 @@ config ARCH_R8A779G0
 
 config ARCH_R8A779H0
 	bool "ARM64 Platform support for R-Car V4M"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN4
 	select SYSC_R8A779H0
 	help
@@ -287,6 +318,7 @@ config ARCH_R8A779H0
 
 config ARCH_R8A774C0
 	bool "ARM64 Platform support for RZ/G2E"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A774C0
 	help
@@ -294,6 +326,7 @@ config ARCH_R8A774C0
 
 config ARCH_R8A774E1
 	bool "ARM64 Platform support for RZ/G2H"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A774E1
 	help
@@ -301,6 +334,7 @@ config ARCH_R8A774E1
 
 config ARCH_R8A774A1
 	bool "ARM64 Platform support for RZ/G2M"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A774A1
 	help
@@ -308,6 +342,7 @@ config ARCH_R8A774A1
 
 config ARCH_R8A774B1
 	bool "ARM64 Platform support for RZ/G2N"
+	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A774B1
 	help
@@ -315,24 +350,28 @@ config ARCH_R8A774B1
 
 config ARCH_R9A07G043
 	bool "ARM64 Platform support for RZ/G2UL"
+	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	help
 	  This enables support for the Renesas RZ/G2UL SoC variants.
 
 config ARCH_R9A07G044
 	bool "ARM64 Platform support for RZ/G2L"
+	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	help
 	  This enables support for the Renesas RZ/G2L SoC variants.
 
 config ARCH_R9A07G054
 	bool "ARM64 Platform support for RZ/V2L"
+	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	help
 	  This enables support for the Renesas RZ/V2L SoC variants.
 
 config ARCH_R9A08G045
 	bool "ARM64 Platform support for RZ/G3S"
+	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	select SYSC_R9A08G045
 	help
@@ -340,6 +379,7 @@ config ARCH_R9A08G045
 
 config ARCH_R9A09G011
 	bool "ARM64 Platform support for RZ/V2M"
+	default y if ARCH_RENESAS
 	select PM
 	select PM_GENERIC_DOMAINS
 	select PWC_RZV2M
@@ -348,12 +388,14 @@ config ARCH_R9A09G011
 
 config ARCH_R9A09G047
 	bool "ARM64 Platform support for RZ/G3E"
+	default y if ARCH_RENESAS
 	select SYS_R9A09G047
 	help
 	  This enables support for the Renesas RZ/G3E SoC variants.
 
 config ARCH_R9A09G057
 	bool "ARM64 Platform support for RZ/V2H(P)"
+	default y if ARCH_RENESAS
 	select RENESAS_RZV2H_ICU
 	select SYS_R9A09G057
 	help
-- 
2.49.0


