Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88340D6D233
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 20:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7iRGowmY09x6NtLH9Lb1/0sWvfPDP0DN1AXCvHkKcIk=; b=NCz1p4ssrou0WE98sfpRGHkTwy
	tVKCaolu6s+fz6zYyX5mbzFDxxhu7+xH7/IqVAJWTT/4dkXC+bwOXR2pThBn1Dz3qDlXMTtEsm0el
	ETmh0iHfIidaSIB10ksDhooNKxorIRvzPPDESST2e7SBzKx3XwrI17jsPD3NauOThJaJp6k6ksMrI
	bmwmqapkM63/FrMDrLpwZByh/G5hRJPlHAedtdN0XK6C2FbiV/Tq6rnb0WhPqMpK4obqg8e2pQy/u
	4PJSaypXPxtXPSMFGDUskKK/74xuwWuuNH23BT89ubb0imKrXSvxu2ci+zuoNIqhmFvmayb0lgnza
	oHTfDFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGOXs-0000000E2g8-2vsJ;
	Wed, 27 Nov 2024 20:21:56 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNMk-0000000Dtvr-3ekB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 19:06:24 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-724f1ce1732so105214b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 11:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732734382; x=1733339182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7iRGowmY09x6NtLH9Lb1/0sWvfPDP0DN1AXCvHkKcIk=;
        b=LM81EK3zem3tOb7OLA5VjWpjceOvuT0ogjPsYIVfq0OYyNJ1n/dZfTb7kYeqq/HJSg
         gFbJ7aIJG0Owz7mt8qic3T2QcgyBD5iX36dqbZDIIxwe3Vd2haTX7fG7VGjYo/KWW8Ov
         UFqb1+K9WA7mazCwJyP9VaCLwNP0TH0LAffnSBE3ZugEo7MH69GgCw5tgBOUf2iEkZUJ
         qxn7nYymwFhA/y+BmpVhOg/aBT53YvoEFP8gvlZIklDYGNawi/L+y48OkvksRXiIa9LF
         r+0tEhEz9L0RvBuhUCS7jz0OMlYZuYeDCNqb7iFgOy2Vo9yojGfdbq5Zc/fd2OmUQHuA
         E9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732734382; x=1733339182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iRGowmY09x6NtLH9Lb1/0sWvfPDP0DN1AXCvHkKcIk=;
        b=tlfWQVjDjo2p/9pc1vIQKiLeZj+LlbAWGsPakAK0f+bZtBWIxjizwA7MxUswVe6Jst
         Q+QK+bv90Dk5FsAuh74Zov7lGHxivvO4Yf56Y3g1NI99MAlJx3QPC/++KVycqYQYOelt
         VeIIza2DicO/QFTY5+33ARSFTYX5/3Vow1gno1ehBCrgo5AiMjt6OzJfsx3Fq/6W7Jxf
         VGulT93vYqTO6CWWQOnrjYDHZRgVafF/x4XqGO4BB9QCg20LUpviR9d5eWfiFRw32ZOO
         xwCDSqYB3lSh+I/KdRdABCpc687SHsOr0WQqL3lfzC95/ranhUfFvM6jd2VOp7wwOn21
         wW0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9KrC4Q6JfkDMorVabGxacobK3eUivJbCJUmgtU8iV+5UPZ0qGNW45wTP7/l+xiTJNkgcmknUDa0ibp4e3Vsg/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu4PF1bnhL/BqOG0r1uKBTwvFMM3Zte2YWiBpTJ9K1a3wqAAlk
	jyM6VgTH7Ssll+LgeSBB+TrL0NcA2Y+ASpso7mx5N7dFMvuFxzMqbhJAkA==
X-Gm-Gg: ASbGncuVZiWU4eKmaGNyY4TQ6qUFBTZ8WO5LANGApmuE44QzZgWhgtZicJppTCpbZ9n
	nFcDkLaxetzXdX73SKQLBxBiI1hq+nPu6YgKzVAVqD516ZGbInV77LV9HJb+TocpWHoRugmfp9S
	PcZk8HlLOZVEsfUOiIlXh5bVdLbSxAIpfh42b26pPrJKezV0YroTqfkmU1QQssNGpGRK+8unSXv
	E0DovpZs/0UFvyZwfURWWQ/BBBgndtOu4ragqbD/M3p5Ni+Sb59GNJBrfiRIoI=
X-Google-Smtp-Source: AGHT+IHRWI7ciDiEU560CDl4hwoigQDwlqav9MEDJA2PtR7FPWVN5aMtjqTpiIgHPEe1PoP0+IF+Yg==
X-Received: by 2002:a05:6a00:1492:b0:71e:59d2:9c99 with SMTP id d2e1a72fcca58-7252ff9f26emr5723057b3a.4.1732734381744;
        Wed, 27 Nov 2024 11:06:21 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:4986:34c:3f75:d990])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de554fd6sm10550036b3a.139.2024.11.27.11.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 11:06:21 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: linux@armlinux.org.uk,
	s.hauer@pengutronix.de,
	linus.walleij@linaro.org,
	esben@geanix.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux@roeck-us.net,
	arnd@arndb.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
Date: Wed, 27 Nov 2024 16:06:05 -0300
Message-Id: <20241127190605.1367157-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_110622_911481_70456FDF 
X-CRM114-Status: GOOD (  12.24  )
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

From: Fabio Estevam <festevam@denx.de>

Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
the CONFIG_PINCTRL option is no longer implicitly selected, causing
several i.MX SoC pinctrl drivers no longer getting selected by default.

This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
i.MX SoCs.

Fix it by selecting CONFIG_PINCTRL as before.

This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
pinctrl"), but it is the less invasive fix for the boot regressions.

The attempt to build Layerscape without pinctrl can still be explored
later as suggested by Arnd:

"Overall, my best advice here is still to not change the way
i.MX pinctrl works at all, but just fix Layerscape to not depend
on i.MX. The reason for the 'select' here is clearly that the
i.MX machines would fail to boot without pinctrl, and changing
that because of Layerscape seems backwards."

Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Reintroduce "select PINCTRL" as a minimal fix for 6.13-rc.

 arch/arm/mach-imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index e4fe059cd861..dc47b2312127 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -6,6 +6,7 @@ menuconfig ARCH_MXC
 	select CLKSRC_IMX_GPT
 	select GENERIC_IRQ_CHIP
 	select GPIOLIB
+	select PINCTRL
 	select PM_OPP if PM
 	select SOC_BUS
 	select SRAM
-- 
2.34.1


