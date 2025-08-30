Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85EBCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BcyZ5Cw0uBkTku0BAxgJDrjdWKucoWJcYDqBud/89tA=; b=EJCogWLzy7GjuSmBYV+5HC1+IJ
	JQxFgbxjSbK2DCJe8rfVWYVPG6z09sw4c7mSlo3qt90U8fAOVznJaSbNf5D9167UoTLc144dUs1zu
	seAkLwncv+a993nW7N5npHNVFLYcihXchF0Suww5TywVvaMht/DLppVW527d2qSdEnxhTVOLEc1Mj
	p9hV0uLBRpwyW0FofAXob6vBgqAhJrN7w46QpBf15xSYEC+8mif71Xtj2yiQLW+hSlvTRfaqYlIiQ
	kafG5wMs2eisoJfMqJpxmQd2jkhjMK0iwVVohHlvt+VOgzUx4vcHZ5GFrbyRkyvLu6svYcz3G9gnf
	O67/0HFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRIF-00000008MU4-3crJ;
	Sat, 30 Aug 2025 19:31:19 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRFU-00000008MHO-1uYR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 19:28:29 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-70fa294211dso16209446d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 12:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756582107; x=1757186907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcyZ5Cw0uBkTku0BAxgJDrjdWKucoWJcYDqBud/89tA=;
        b=KPCNpHT8BjuV6DnbPiyiCAA+WgyvEPO6T59QfGgUVp/ux0rgZsrdSys7qdzN4Haz5+
         Ozc3nddx0dupBUKPrr1XzTkd/3LeBsUwTdZwLoi2K6/HZJK1QGRgOtAuNaevg2mcUy8G
         qdSpKSMAwQbSeMm31qq+AJmd/27pDOMRgrsfIco7+xfN9OP4EwhPkei8LgoAw6DD5f39
         trzJErTX19zR9B57BxeAkCueSsLuGt/uAwjW/N8l5mC+mjFe1bN5anmbJpYvIZz4WRZo
         q1pgrnGVXWhw2IOy+eWDATwm88NoS0YxKaYGuj5/0acCAguCIi6VQiOrwNR5efod6gKF
         dbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756582107; x=1757186907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcyZ5Cw0uBkTku0BAxgJDrjdWKucoWJcYDqBud/89tA=;
        b=pH5Pmp76PaIG+mi4RbfzGI9hPHXg7uftiqKEHHayVt3X4jpd+BgxXWN3Aa0V85FXY9
         3bl7FFWG6x99fN8vNUMQlH1wFJxyREbBRMGeH9ndaqMwPnSqBgboxqi9yCkRAoFz3vOQ
         pS3kiFW6GuDtsP7Q2Oa6TmQYsKtokvKYakWjpwEqI/zAWF3SG8d4jyKXYoDt478DneDW
         GmLfzuWcrRizlnoS8NYu68dLDQmfhY8BjP7Ub+dkstmoZgMeOxP+P2yJlBUvjY9P/z96
         GUGA9S6dQfNmp4toIbr3v4eQKnDiVBOIh6Vk4JK4SmTK+xNnjqAr0gxugjHgQFn/8JD5
         4MQw==
X-Forwarded-Encrypted: i=1; AJvYcCVTRJRLrG0vWj+bE39/tV/+yANhrRFYQCOP+hr59Ev3JdWA//Nmg/tctWNxs3orfilUhxLGb1Z4lNsPgUYeoyRH@lists.infradead.org
X-Gm-Message-State: AOJu0YyPoRe4N+DKLsAwaPdODBUVNJqBtDrMp6E4I78XySGoAh+6GdUM
	kVi3hER6g1Jt65whzjiSK6npOzAo3DtOljZuuH/+LBjtTqJkdl7UQ/5Zi0m/gUk=
X-Gm-Gg: ASbGnctZcwYYlWmHX0eXXPlEFbp3hqSa5reUN9z9mgObKmRfzbFq4UT/GSNlscb+eiL
	TlVeKwfyxUlUf033JXLWGR1X09VHGN1Es5v8OFnVXsHwntXCjjD41+dFqo79yjOr/9n8l9kSaV2
	uq7r8W4UTBkxMfbZHNARnHV9WtpYzSJIy5WB7zjKs6FbnIVygI7eqc5jEsFK+fEIRDBrpxInj2k
	ZneUekS8nViMez9NMZxeklecWZH4E8o70hTMZwj7RkO66/ZIGHqs/r3AHj2w3FhZnW90PMMwNtN
	g8lD/JnweiysbRTygkeaqUZcvejfP7WyAYcX+Wg7KuIH6NabRIG0IGB6ejvBYDDMqJ/hQQrsLuq
	uHx3xDAbGNFb3xdY4PNyGHn/d5GhxJLf4ofPmYv7eT/icsw==
X-Google-Smtp-Source: AGHT+IET4GpYNiH2XSNfnZvQw6H7+IwVhdbLOphp0vRWo+P6A+YSOpnvah9xcSkQU/IODYTPxAijrg==
X-Received: by 2002:a05:6214:2686:b0:70d:ef96:b38c with SMTP id 6a1803df08f44-70fac964655mr35601036d6.67.1756582107180;
        Sat, 30 Aug 2025 12:28:27 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:68e:c28d:1818:9595:da56:53b9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb26016cfsm10216166d6.17.2025.08.30.12.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 12:28:26 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: linux@armlinux.org.uk
Cc: ebiggers@kernel.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shuah@kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ARM: defconfig: pxa: Remove duplicate CONFIG_USB_GPIO_VBUS entry
Date: Sat, 30 Aug 2025 21:27:45 +0200
Message-Id: <20250830192745.206491-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_122828_494608_DE508BE6 
X-CRM114-Status: GOOD (  10.86  )
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

The pxa_defconfig file defines CONFIG_USB_GPIO_VBUS twice, first as
built-in ('y') and then as a module ('m'). The kconfig system correctly
uses the last definition, but the duplication is confusing.

Remove the obsolete configuration to resolve the ambiguity and clean
up the configuration.

Fixes: 2002f3968714 ("ARM: refresh defconfig files")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/configs/pxa_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 1a80602c1..70489f355 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -498,7 +498,6 @@ CONFIG_USB_LEGOTOWER=m
 CONFIG_USB_LCD=m
 CONFIG_USB_CYTHERM=m
 CONFIG_USB_IDMOUSE=m
-CONFIG_USB_GPIO_VBUS=y
 CONFIG_USB_GPIO_VBUS=m
 CONFIG_USB_ISP1301=m
 CONFIG_USB_GADGET=m
-- 
2.39.5


