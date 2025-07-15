Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AC8C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMKpzUOtQQ4RnSGMZoG+pKA2TVUGTMT2Lpv20Jd2YaE=; b=BXnJkOypDSIYvf2kscQR/qMVdV
	mV0XF79K4XFBzkffHWtbTasbzVPxl/UQ/iMPD72gKZCtuZfs2T0cuow/Fga0fvh8KspwrI7sc+you
	RX7zEdv8/Szt6mNUuHnbXR9vt2G5T8h0qZlbPGuNOI1LQm8j7YYuKjUA518sMa2YJyCGVPlkCcQu8
	v8ERr+Cs2fnIYKy10kcrFm3wZUyfw8kQv5siN5lhiYucBJOwZMjhubl074z/nIIAOQx+uuFlomKEe
	w1wEVIRSZNpUAYK9U0XtCWvbtiVuaZIlpmtvcN5zv7+sRUMjlWgES+m8m3fYrHL00PnEnXE/VfJTy
	WkB1J8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublCQ-000000062wL-3fbd;
	Tue, 15 Jul 2025 19:20:22 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubkPs-00000005uBQ-2IEy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 18:30:13 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso1016469166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604211; x=1753209011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMKpzUOtQQ4RnSGMZoG+pKA2TVUGTMT2Lpv20Jd2YaE=;
        b=Yc6rEyIoxqGCUlCA7BhDfIvQqTrkZuNO21EIzOSK/ozN1PWML2bno8o7yvG7ayzNK2
         lfdyAEpRE5e2dQ+FxRYbfZpYcbSU6UdE9PDCFo5RlP7B4EWQaFF5LCj9uVC9XddipUnF
         pajw4ZmHvAVtdvVAhyegF1QinROON9rhW+1uxKDXtt+GmTdrGdK93Ali9qpGjAkJ5y9R
         +3CwyJeD6SSUaQHwEIWPW7k7FTb23JVzUmu141haGQOCyklkz+voALVeoZ7vfKGpxafb
         kH4jonVq2GbapJItyq8CZSgA3NXh4W8EwrfdApSrHGsTcz7OszyF4L7p1VRxhIETTMPg
         NWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604211; x=1753209011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMKpzUOtQQ4RnSGMZoG+pKA2TVUGTMT2Lpv20Jd2YaE=;
        b=bzDV2AVXOEiICtUxzz9H3YnrjCkYlf8obyUdBUcxPE8xQlHw7umsJelga9IUUnvuBf
         Lh3KVYcYToauWVh6diCk1ox79InB72jQHA2b4OG/ZnEyLjZEmjG3x0h1xKyrW8RTpbys
         rUNyB9J4MnXOwVmkfa69SATPdMoI8K2fm8SjgVQOfy+FPqgoWypBQzHgHWW+oP37LnLK
         3cS7wnnredrgsz234gToIxc/dxK4rB88y0026GozXCgDcKLEIEKsb+kNBT1s1UkrXkP8
         RAr2h3235EwTBaEW04nqthKH+yfUlBsV2lC3DlHJwY/yUahaUHuJMlg5BKkWETRgftGP
         DPaA==
X-Forwarded-Encrypted: i=1; AJvYcCXC3gpKD+UR45Jj/Ujp8/W6PE33sHg95GVsTYWVIIR5C3ASitYGrTTQESSexAsw1HIVmo1j6mUWjaei/iqyzrlR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7vWgzyb4jUemiDa9SuQ2fzUp7FrFnZ3DewQB3Csv9u8KPgnqz
	MqxeshLC1b4lcmRFCBPvlolfCSlrtvgUPhtDoXJWyIS7kTOgaLIya5B1kxdacQt3FD4=
X-Gm-Gg: ASbGncuTTiaoyCBdd0GR6hzINa2Qg3xtlla//jYlXS2UEy0tjl9ALl9mta/AYhBCnKz
	+Bjb6vnVw21nyq5rxXF3zPgYXum0ILHqofjJaOLIvah9Gt3MYCtI9QeGErj+oEvMkSRWb8tbZs0
	c3AcyLdWuL1c8PbgXTMd1dRQEzws6YuY1jKuCdwXdYESQivFOU9HTXe3jZ7Em14cNGJ2tIaZPvB
	ZxLXbus/PYP9n7UHVtjZ6vBotv+KiJ+OQwkXiSciriZvM6FScheEt53dxurmI/keMy0HjyS5vVt
	ozvN+HN94I88c/Ae+7noSQ1A9xp5ZQLJ0pmAJvRnObYQz0oaxqkck6uGN92kwrOd6J6SNDLHp63
	br3df5vxwCchumnMjHLdIgzdmVBCUOVlJt47tEDk82d2CpYqAXUHTGUaHAd7tQq4qdXyX
X-Google-Smtp-Source: AGHT+IFD+rL0b8mfG/XC5RLUsZeAfk82DWW6oFEzqb1ZtsiTH24r6hlO5g2/DzPIAAnRpqh2cuGFuQ==
X-Received: by 2002:a17:907:3f95:b0:ae0:6a5a:4cd4 with SMTP id a640c23a62f3a-ae9c99588f9mr46308266b.12.1752604210988;
        Tue, 15 Jul 2025 11:30:10 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee471asm1059372766b.54.2025.07.15.11.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:10 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 7/7] arm64: defconfig: Enable BCM2712 on-chip pin controller driver
Date: Tue, 15 Jul 2025 20:31:44 +0200
Message-ID: <602a968606ea6426a7fd4dbec719a002f157be48.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_113012_583549_5DFBE76B 
X-CRM114-Status: GOOD (  10.39  )
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

Select the on-chip pin controller driver for BCM2712 SoC.

On RapsberryPi 5 devices it is primarily needed to operate the
bluetooth and WiFi devices, to configure the uSD interface
and the power button.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch is based on linux-next/master

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cc82faf1371c..da5647c521b3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -590,6 +590,7 @@ CONFIG_SPI_TEGRA114=m
 CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PINCTRL_BRCMSTB=y
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_RK805=m
-- 
2.35.3


