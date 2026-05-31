Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF89CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkH/fl0oDwirECp71YLEqMq9AkaqaSB6/Kul4n+Czac=; b=RP2r4khw5IZ+oKpLVgTd5YDy2J
	m/vyYnZ0lCivl7HGYSOnkuptRwR6G+NEywRpG57V0SPKEP8CuERgbIVNoE2oIxwLCj077WN3oOb0z
	hpUmL1xIRwjJYWBdkIY56iEt/xxRTUpyExUkKEk/FMeqH1useEvk1lRh6sEM1y5dUjKiP4cXAPY/5
	B/j+32vu1gUvf4urjZzDh7N0IjfBtZdYa/NRKEMT83gdXzZVFJJwIX0SQEJ0zAV81MaYM2zOFTTQ/
	X/eFOpB/1kIQm1aJqo+BnOTSc19ks9gF55FSi73xLGp2z1glme3HDZ/VDT1+OaJ4tdFB+vaAzeIPo
	HoCYKjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi4A-00000009hK1-3eLz;
	Sun, 31 May 2026 15:27:06 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3E-00000009gdB-2seP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45ef42dfb26so477794f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241167; x=1780845967; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkH/fl0oDwirECp71YLEqMq9AkaqaSB6/Kul4n+Czac=;
        b=LnGxonvF6j8SN0LI7EW9ejWim0VvFy/PidGmxA5HxI4tGr0fPa5CJW8ht3VTlDb0oX
         ujYpJ7/GVB8asdIivwj22bzqS9RKJLQhkcD/1OoYzmmnZBWRRgPBsg5Qem0Dq1Zeab1+
         jcRdCX+v47LX0cHaVVGux1q0cyc9qu353SRoteu5k0TSGIbylQHu59Athuy4PHVtMZWI
         NZmpzFJAQm2V8FFXDj3qpPw1AGjJkNvS7+lAw2UJ69K2wMhttOmkWKgEkVCsqJADQs3Y
         SHZvbG33maOHrdWly2PGTsonZWoRKlwu3m5X10UmpmzxLHUDS0TgZqdE5c2t2ALf2Q8Q
         UvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241167; x=1780845967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VkH/fl0oDwirECp71YLEqMq9AkaqaSB6/Kul4n+Czac=;
        b=Q9aNs2T75YlAOHwSqHUPpVN/rP7VWXD3PVDH0ety06fW7LUiUX0TK22iHpGBLzo/kf
         1ada0TEGNsTwiKvfQGgbWDYAdHB3vQRN9B96HIhlAR99ljD4u9cmixlLJuO3/tzLBVZU
         DEImyd2bbJxNH+NBg1FUS9cO5d/KeO/2NPkB9zn8fxyyLp457LzFFtbyoPpWL8PtO3wl
         D47zrQQF9+DxE3R94NO+c+kZ1uQPsb7PJPl9vB7B+zJ7SVjYE/9rBRduQLidJ8urxg0G
         RgUw6YES/YavS0obM9hqOEtiS8p7YNfPPjZ2J09ZEbhT5qlio+6HvT2w2UKtAkmr5XYR
         tPRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6Zfhjl0tB1arJG9Cg8Quj+AHSnfW2ePicOn+0mHJ1cw3zpLoWXBOzi3AAtzkJJ/10fIstafKuVdre/nC1idLV@lists.infradead.org
X-Gm-Message-State: AOJu0YyGGc7ZD57Jdt0yPz9sbuJeyAx9G2sjYM0XHJdqPusZ0Xea/0AW
	pVE76xoU3K2oOKh7mTK3q4YtEFPV0Z9hPx8whXu3L/IIs+e4U9xnvt+ldWz4rYtJszY=
X-Gm-Gg: Acq92OEwKbrJ4rAfPN59wDnwW1XZizKERm7OhxuCC3YVgOPXm8sHOUbw+0shkfg9Dpq
	i6FLnEBoOxPx72uDVo7UcZZc4D1jSsY6eAJCyKHtYDaTTM+vwRE5kQCfcgao5iiRP8Y9BAOcmxo
	6pzxbiuXrWfUWO4uiE5mHTWhPv/xDsK32VELVTjZdKFtytaGVVJQkQ8BkG7FIhUs0TwSqSjOPgS
	aIcDoglbMlDpyvWctcVmoTRKqn2aZ3HQryO4YRU20IsVlrhhD/FFi9D7fELKrdBp25o4vXpaWjZ
	ZwO2ecSscXRqG4L3LVWfK3GnwVB7FUBmVg803Myli0IqzYBOMcZ1I6IHczxjE3WUVdzj4NiGF+/
	i4BzEg9sXctoqj26Y/QYftW02FxkNuvS6qHp6VD0hDI6LzROX2XFYV9OzHNHDJQQ0eCikfqglVj
	iMfM10qGMxUT1/C+DOa48pJRVbWzQJuzEGNUitKOFAmA==
X-Received: by 2002:a05:6000:4284:b0:45f:f142:d56c with SMTP id ffacd0b85a97d-45ff142d715mr7307074f8f.16.1780241166806;
        Sun, 31 May 2026 08:26:06 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:06 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:26:01 +0200
Subject: [PATCH v4 08/11] m68k: stmark2: use ioport.h macros for resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-8-7e65ab4215dd@baylibre.com>
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
X-CRM114-CacheID: sfid-20260531_082608_745334_02A0C508 
X-CRM114-Status: GOOD (  12.73  )
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

Change resource declaration using DEFINE_RES_*() macros.
DEFINE_DMA_RES() is for a single dma channel, not a range, so used twice.

Also, some drivers assume IRQ resources are from index 1, so just to stay
uniform, moved IRQ resource at index 1.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- none
Changes in v3:
- moved this patch (cleanup) before adding new resources
- moved IRQ resource to index pos 1
---
 arch/m68k/coldfire/stmark2.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 9263b77bd09a..536252ccb87e 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -62,21 +62,10 @@ static struct fsl_dspi_platform_data dspi_spi0_info = {
 };
 
 static struct resource dspi_spi0_resource[] = {
-	[0] = {
-		.start = MCFDSPI_BASE0,
-		.end   = MCFDSPI_BASE0 + 0xFF,
-		.flags = IORESOURCE_MEM,
-		},
-	[1] = {
-		.start = 12,
-		.end   = 13,
-		.flags = IORESOURCE_DMA,
-	},
-	[2] = {
-		.start = MCF_IRQ_DSPI0,
-		.end   = MCF_IRQ_DSPI0,
-		.flags = IORESOURCE_IRQ,
-	},
+	DEFINE_RES_MEM(MCFDSPI_BASE0, 0x100),
+	DEFINE_RES_IRQ(MCF_IRQ_DSPI0),
+	DEFINE_RES_DMA(12),
+	DEFINE_RES_DMA(13),
 };
 
 static u64 stmark2_dspi_mask = DMA_BIT_MASK(32);

-- 
2.54.0


