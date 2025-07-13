Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAA7C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcqleVpMtucnbrU4qqD3CqHSTuUaJLwoNghGZhsgkT0=; b=B455l6KlnRLXeJ1DPicTR7GzWc
	0NEqq0FgkLHx36f2TLdD38HTiduTyrknfO9o7x26NGQ+XNA110J9tOkB7OsLqZPkyTNVcqtMEL7rH
	D89RfiSNK57eu6euZCCB0yjblJf4+t2is6FEkqrcaL0TOlwZ53UKQZWNnfk5/83SBG5p/+dzPObLH
	7dQO3U33RrSeHAGOdP7Sybfu9EAtR7/hCEka+RXLfCxrnMfdGXlRum23XSDYQIORmJ57re8FfcZoQ
	0vQ5HsmULOpE8NlcPieM8QdHswvyRefr7y6vWLX0vhvHc5eDyfZfpidujLfEIbknwNRfXjX0mr+4e
	o0dU/d+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawrn-00000000CLI-3SSL;
	Sun, 13 Jul 2025 13:35:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawkg-00000000BoA-1hsh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 13:28:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a53359dea5so1920704f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 06:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752413301; x=1753018101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcqleVpMtucnbrU4qqD3CqHSTuUaJLwoNghGZhsgkT0=;
        b=b7fpRFRPEz5onl1ulnMcq3No48RSfDSlLf4cDPSpU2dZXvYoPUlgKWjc1TRLQd89+Z
         ycow9gcga0jsAoB0QoCHhUGyHO4kb3SncLqBIJIrLWxteRTKarkHfTrY3Ssb917EhAYc
         E+nAMGby3AkVnulCbcPSjZIreP0gnJBSYjYBNFfXmwX7ZtmWEyDJmd1bukiKMoWu7iMT
         Ik/Jlkb1+TcMRHkTDgNcAMJAllrVTQm3h1nY3hFoJdmQUBzsYN9f6zniUeA9TgL95C1m
         w5Ab6Vhrsjkt2AOEZcNLeM0burVRDdtz4tRY1OaM5x6QepayHfwp6F4Dpr/ZI85Jm7AE
         LPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752413301; x=1753018101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcqleVpMtucnbrU4qqD3CqHSTuUaJLwoNghGZhsgkT0=;
        b=mv23Rqyf4FAOB4hT2mlg/XjIy80z8ZvpLmE79EBwxKUlmmn+ZWgEfxze84TWHO/8NS
         TSuIl0/raXtB/tTd+p3SyXOSPItqaXlaJZrX1Z673gRf3BGM5oq1h/2GomOInoATnrS6
         BZgJJ+KgvF3fkLJsHSMMs7SCobsBYtiOwMGp9QnY1xvtfSIS3C67rZIGvPKtRBYA0JD2
         Ef5zLWqEiH7X9461PHaG9zN3PQIx7PgOswcrVZFUGj5/3FcZGExYINpi729r4CoWh/z+
         En+CYn75uHHlDFK7L1s4bESE8+DPuzV7iq/Xl/S4NV2dgntkXJhQ8zLnx6yvV83YjJ2p
         Mj1w==
X-Forwarded-Encrypted: i=1; AJvYcCWscnea51GDQVUBr7WLaPeR77icYIUf+eY7phgtNtVXc9Q/jeiR7B+176MnCoLWJ6ZVS8Ke50i7MNVuZ7iB0J6l@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3kNQtnlsSknmk8pvKevSatLEAv6TsT51LZMKk3N14WqO0fqx5
	J2a8R3j+DeTFK/ql6zXQ37PH+noUlINaQ6AVucHBT7Cb+ouC0nHIoqwz1Wc+8g==
X-Gm-Gg: ASbGncsXIDXRlUFC3x/46xLfiLrv4RpPHa9MZ/JKQpp0uZR0fXwU+WNSeT1VKFDMaq4
	eyRn02io0HHPHdCA3xf1jenDYbe2XMJsQZgzyvznq1A5JwGfNicCLK0FXeYF3rFhVBcTcURXVUx
	9msYgAJEJ7KN6ia7AWE4F5fBvyFtShOXbYZw1wOSCPyG+unEsxhddqRt/wAETMIi/FVRfmHjnTY
	uGEaJGLvRXDQ141JErLVCOmpI6+a+fs2nCjW09OxeP5ODt+PLsE0yRrYXM2Eq+O8Yoblmz85SwA
	RbNv6Z7Vv9wL814Hi2F12F1F5kwiuOFYVJaEEhumGq4jGnLl7LUCR7mAAYV+WsQlPN/t6/JyIzT
	f/d9Kq08NXmV2hIK2EhboJQ==
X-Google-Smtp-Source: AGHT+IFa+P5Pnd48htprFin/K1VEDbtLN7VSU21rNKJuP0+pB/6JqlqgQYxRRCShQDQR7b06V4EZbg==
X-Received: by 2002:a05:6000:41c5:b0:3a4:e609:dc63 with SMTP id ffacd0b85a97d-3b5f2dc2d26mr6369458f8f.20.1752413300675;
        Sun, 13 Jul 2025 06:28:20 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd1647sm9692082f8f.1.2025.07.13.06.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 06:28:20 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 13 Jul 2025 15:27:29 +0200
Subject: [PATCH 2/3] ARM: sti: removal of stih415/stih416 related entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sti-rework-v1-2-6716a09e538d@gmail.com>
References: <20250713-sti-rework-v1-0-6716a09e538d@gmail.com>
In-Reply-To: <20250713-sti-rework-v1-0-6716a09e538d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=ipzPiez7hh5J1Pn5le5PfVDV0631DokeqQWJXnEH7lw=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoc7RxAHTTiL4oOQbkR5YCQlqiVoGzRMbVn4UP6
 zLL8Zm9SaWJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHO0cQAKCRDnIYpo1BLC
 tf1gD/9zR1mmR2OfZ5qGcpfIqeTsbUr5AKRXQUqYS0jq40S0q08RJUTCEDIw6v1a4BaJ59xhSKk
 VvdTmW9z7AZEfuK5vmjtFY7iSnTr8QM0c3DokwqsPc4D9HHgtmvMB62k4WJn5I4gzomrJaRq4f4
 puF8zFKa3FSMBMAKC5nM3W8Gxq7rKIV0L0B98qfQJJv+YdsXdz2AZ3Tp0uhxqr3+R4xvtg6Kqxm
 YCEwVjRYyjuP4LFpNtCb3qtHeEZoZyBPp7eGC29POkKGz1/uKx9zwmWLZmLamGGmnJ2FUU6pUE6
 kCURhOwL5EQbmjllWz14+28fekF6PmYu02LjFVWtXkJ0Jk24hTEaCexoqEVNa+KzoH1NPqFEo1Y
 jI9ARswi0W9Tzeg7RYXwEdqcpsgjWuUUl4Tup/CjZw+pisEMFCcb7rgK2hvEs1f9EaotlMkRWYV
 Hp2IW+l5LAsaf494KTGyJqp3WZjtERvX2zU0BBPSiX76ClBnYqtYzy28TQPRJLxqXQHvJEIRFZo
 dtO/+KZtgqhZCp6GpQJUQUUZTEdgHIxrr74fHEQGOWHrpuy76Tj7jX5H3sRwN7S/g+26p1WDVPu
 9zE56trGwArdEpoCwEd3uihkMKyVPI4OeCkHd9dBC16EX8FD05vH61/QkUsSpUT6KNzyp4wnP5t
 Lqzuk7484yPn4Aw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_062822_454229_4CAEFFF0 
X-CRM114-Status: GOOD (  11.33  )
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

From: Alain Volmat <avolmat@me.com>

ST's STiH415 and STiH416 platforms have already been removed since
a while.  Remove some remaining bits within the mach-sti.

Signed-off-by: Alain Volmat <avolmat@me.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 arch/arm/mach-sti/Kconfig    | 20 +-------------------
 arch/arm/mach-sti/board-dt.c |  2 --
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index b3842c971d31b80edaf88ab907f4377bea0a2af5..e58699e13e1a55ce46e68908c7ef51e18b040dc9 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -19,31 +19,13 @@ menuconfig ARCH_STI
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select RESET_CONTROLLER
 	help
-	  Include support for STMicroelectronics' STiH415/416, STiH407/10 and
+	  Include support for STMicroelectronics' STiH407/10 and
 	  STiH418 family SoCs using the Device Tree for discovery.  More
 	  information can be found in Documentation/arch/arm/sti/ and
 	  Documentation/devicetree.
 
 if ARCH_STI
 
-config SOC_STIH415
-	bool "STiH415 STMicroelectronics Consumer Electronics family"
-	default y
-	help
-	  This enables support for STMicroelectronics Digital Consumer
-	  Electronics family StiH415 parts, primarily targeted at set-top-box
-	  and other digital audio/video applications using Flattned Device
-	  Trees.
-
-config SOC_STIH416
-	bool "STiH416 STMicroelectronics Consumer Electronics family"
-	default y
-	help
-	  This enables support for STMicroelectronics Digital Consumer
-	  Electronics family StiH416 parts, primarily targeted at set-top-box
-	  and other digital audio/video applications using Flattened Device
-	  Trees.
-
 config SOC_STIH407
 	bool "STiH407 STMicroelectronics Consumer Electronics family"
 	default y
diff --git a/arch/arm/mach-sti/board-dt.c b/arch/arm/mach-sti/board-dt.c
index 488084b61b4acafb569ee9c51f5769393d55a9ce..1aaf61184685d754de57b487aef9a6b45a759b23 100644
--- a/arch/arm/mach-sti/board-dt.c
+++ b/arch/arm/mach-sti/board-dt.c
@@ -10,8 +10,6 @@
 #include "smp.h"
 
 static const char *const stih41x_dt_match[] __initconst = {
-	"st,stih415",
-	"st,stih416",
 	"st,stih407",
 	"st,stih410",
 	"st,stih418",

-- 
2.50.1


