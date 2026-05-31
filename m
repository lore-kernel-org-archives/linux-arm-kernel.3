Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08390CD6E5F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=; b=27mAjSw8ydMClHh4JFvvtHLQrC
	EZuF1n6iYYRgZMHlBkYXhOij1MdOxEDazzvNkL3ctxTbMnPT653K100XqdtiQZgKwHPERJC7AYIz/
	K4mLNToXAkNmxhcKG+9/kUxe5eIYZrXbEAxdMI2WaTzTQ8XcLfQOxbTZxPfzob3H7RkCoeSxjri/J
	w3Kx1/ufoBvbjJwmNiR2ia6OHTLvmqIMl84/3BX18lLwPgDYNWkH8ZtsYW4zX8KjZP0miKzmpwVDD
	wB7nK1TPfgGcQ+Vwlh3iAaNJE3S0FvM5un603oeaRSmdDg0ArvXZWcusU+Drq155dn4x4pJbbWHte
	yiGwjL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3F-00000009geN-0ebY;
	Sun, 31 May 2026 15:26:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi39-00000009gay-3b9y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45ef616daf6so1847119f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241162; x=1780845962; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
        b=fbPMiT5ZGUM6aRTQaSQo2Y1B0YZDkBMY83OkMVAGGWYunUEXts3VZHFJpzABz+36cE
         fKQE3lvG1GgyEtpt3TmCb7nWN17DEjMfqz9TguZShN4EhIh3erOeULjK4YHrjcYWq70v
         bVoNnpa6aTUap2i27OUI5bcWohstJPC1lMZdj/Res/1CbnICxEqG8zHBb8uLeXDmHXC2
         C17NvrVD6iAgFxj7Zh39vcmYEw87/7B4inQqcM4iGYIzk6Y7St265NJ3UvSLcgO8SWGM
         FEIufXSxhvXz1Mrh/MZv1cYs8eSMaHb8FxIprzZtUAA2R6DKUvyxAb60D/n5Y1uc1rxS
         f8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241162; x=1780845962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
        b=WnOOnxBWiy0LB9pQCkNIP65msTloq5aST8ZZFZnGFa76aSGCwJhaXGDZXiGOuNs/rf
         iolh7Mfxn6YmDIxd4oIy9e4qgOkb7kdEZlgDXUJYcN0JdOmXdv/f/6IyqV6GSW1Zp0fo
         GOS6cWIaTDzZQtgBqMK37LsJL0q2XznH8oIHAKDdoNKf/4UrY7LbD5tg/1wHE5IPxGoJ
         Bxi6EWlrCctGplJLg6tpqWtxo4gJjm7xVNFlC/twODZR9RRZIcvQxSwqn6lqAw/K2Oa8
         dOS9zw9F63JB4s/vhLKZ3NBU1tfT6o5WHwEZI9iFN7gt6k/zdPgVmIvYuiFUcIaDSw8t
         /TYg==
X-Forwarded-Encrypted: i=1; AFNElJ/q4mB4T/e6gzKPhDKtSfco3XM3xUtkG/wTM0F0esqt/Bzt51gZ8t67a1/ZDRSffux8EbybhFYdJk4X8RpYuxNY@lists.infradead.org
X-Gm-Message-State: AOJu0YyA0Ys6iH9sm3jR1DHCPnHjpQ1SGSzSLxNyGuxkmrHAr1lcWhnN
	WH7XOGJIysBWwbllgl5rYMv39cmZqkjbJUOfzIU14274OLYCHhAhV4KhWvQhSqzraRo=
X-Gm-Gg: Acq92OEXuwFVFv1xVRNKtJsb4z1aY2bvLhzkPjpbfF7sYsNU6a3AmZUukErmRkWNopG
	2UtxttyLbhkv12KJFyMtRSOwu0e0lwMJc/O+/JSSZRdAXlCdSBBYt9jBMvsICRRufMQK9NBAr2M
	wK8+WK4GxjmXFQE+cP1i6LFe6raKUQB4oYe9sEWL6+rnl0inTGFvc88CVFkkmznQ1Kf2hssYmA7
	ns0bC5Sp4ATTLIOWl2QHycf2PAPH413VdRVNMEMcD4FT5RXk2lCbZyk+i8UqD8bOjSyIeO+o08q
	jyYhkuzgFTjo65LKNtzEtbVU78bZPStLCPd25sDzg2vDO/WzWQNsBKa+4WotCz018DBhovsjKVE
	Yz6kA3OQkntvruIPiELKreN0iQ81wxy9zSe421x748gWP9eMDay4+UX+SBbvDQZThs/u87eoSW+
	WnlqdrdcbBfvAyQs4+Aa6POYtcwFtBOeeh409xol+pUw==
X-Received: by 2002:adf:f089:0:b0:43d:77c6:be78 with SMTP id ffacd0b85a97d-45ef6ba1425mr10029801f8f.39.1780241161503;
        Sun, 31 May 2026 08:26:01 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:01 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:56 +0200
Subject: [PATCH v4 03/11] m68k: mcf5441x: initialize DAC clocks by iio DAC
 driver name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-3-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
In-Reply-To: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_082603_917339_BED7EFAA 
X-CRM114-Status: GOOD (  12.57  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Later in this patchset, the mcf54415 DAC driver is added.
Considering some other different ColdFire cpu DACs exists, the DAC driver
is named as "mcf54415_dac", related to the mcf5441x family SoCs with
DACs (mcf54415/6/7/8).

So updating DAC CLKDEDV_INIT with proper driver name.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- none
Changes in v3
- roll back clock names as they was originally
---
 arch/m68k/coldfire/m5441x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 5b5e09ecf487..b02ca2eb55a4 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
-	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
-	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
+	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),

-- 
2.54.0


