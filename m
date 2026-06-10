Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576A8CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqvGT8nRbToe2huAj1fjYmy1gzrEv650bTAoZQ7pGZY=; b=SwmhwGamd8OUKxi3unMF/HDuDd
	SwkyWAnemJuuaHfT5GEpzgxDCT07p6HTpJ05kj9RldqYQifgIjAjUs1wm1OjoJoUNCpQjFHdPvBub
	3dtKtxXt0u3xWtmiSfazuGSYuSmfAFnPNYBp4pNTBkiwc3uO+yRMOgMlP64cKvVkEwwNMYApqAM3m
	BMX35mpZIyaEw+Pgj+rS4NSXWO7lsdma3ZuYsmo3DlY344qExBORq1BUbMUly/GEQZeXCZOCg9jfu
	CI/oxEpZV2GNBG9/s1wSTTjaWaNSMFy9MLdCvBHMxs48NBDt4r+SSPa6eoM/nm/fs0gO80yT5ho/y
	HSwxh2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPe1-00000008Kff-08wX;
	Wed, 10 Jun 2026 20:35:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdv-00000008KZo-1bt3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:35:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490ac357c55so76132685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123717; x=1781728517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqvGT8nRbToe2huAj1fjYmy1gzrEv650bTAoZQ7pGZY=;
        b=DG5yOdlvcHBDpfa0P7FyL/V5kBbT63zt04X8PpihD4HalCZSmh38jDNcnibGl3x13V
         O9nR9ZVzZAMcfMmZrMk3RuTbkNfxawxXapcLxFiDshwNvr4Fy+3ymcIEanzq06OomzBG
         CkZ3i8Prxr22jhxNYG/HTtCbuj6uug9mcSZUmx9a/Hr00E0wtEy0jlbf/gx8gq6hvPka
         60HezUVVhM4nKvJGoWzxczpIMOdHypLGcJz9ITzT1bB96qiE+oQltOHdUhgORc4uKdl+
         jYedw5kdoP/gJ2YZWGVz/XILSymN62gFVl9b0U8CG3ulw/ExJuFJJsb61VxwfoQZ62fI
         yeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123717; x=1781728517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fqvGT8nRbToe2huAj1fjYmy1gzrEv650bTAoZQ7pGZY=;
        b=HJjZKYCNqlQmDGl/77gqVPT6t1VG6K7+6u7iZ4xH2kK9OLmElzGlRx4UCDz/1Kv0o9
         cYmEKyxN0N53NJNqn7eqLBTLmucC7d0NQfNB+2nOtSaQJYvQcBS55jaAtCNAG5lwLhiA
         vvDO8koeuGklhzgxnASkPk+ahuNMPnsnf9gi2JmYJjW/Ax+8/4AK4v2dkzmq/A9njAVa
         1MtMtiemsQDcuk4X/WmedUA7j7kV6rMygNczxRpAoHo58rnpXqfma2niHT42KBflA6XR
         OqLLSlCvopcy0pV8NCj7kP/4wbdtk50B/XTS4eszkbBDeLWihDM/WmIyWXdPdk7ZvA6R
         dmGw==
X-Forwarded-Encrypted: i=1; AFNElJ8ON+8ditBBEbWpb8xqzgvVVWtEFTdiI445R+rCsIe2DnqL+4WsEBwoKfQiGKCq2a/fXq9yCuTrZH3kYLJszUVR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6EdlXhFmQYgDU+6sg2CSbEDVInU8iz/aOtYvI25fnUGGIsjfL
	sUQtOyVo4SgJPoRCwg1pDa8UArc6kG8ffNjqE74cIzjQWS6Nj392RlPQeahsGURnf4E=
X-Gm-Gg: Acq92OHeQ3o/DoFWqRuGQbeU4b8VKyytYQT6IRAe1QU86yh2WrmEbU35btCEkPPWl7r
	M04t4u61CRMQoTiVpXv3rQldkJ6wN0DoueNbg5wAEzvg22By5MHMVAr1G8yZBQ2l1kM14gz6YqJ
	zKTMWAyBaxKPXB6CAdBuG2Wsx/GyB93zwzHI+XqIC3rGgz8Xq/xm28cydLpEh4O4XTJs5GoIb2F
	k0zbQtkja2EDH5IDwocpNPuVg9AwUlS5Z7IUzfMlBKckldHi0d82Bb6wyjPce386u4cdOV2WHsO
	PB5/aTkqkxG6qqT7+rsTKKfX6v3jGWMTx3d7Yq3LbLKC4dPiWblmml+CW2W5QN++BFPLm05C/5s
	XZ2cJIuGdghfW7FZ9Z1lhrZ2K6NmNcKM2CxD5vr2ZCFAyvf+rTKZ0uwZA/XQkR+JPgxLjTfg6xx
	BxrNpFNyrcQLiewFXZUH9Y82fLPImcSP84z/muXDguUQ==
X-Received: by 2002:a05:600c:35d4:b0:490:b8d3:5dcc with SMTP id 5b1f17b1804b1-490c25e4634mr451218185e9.19.1781123717535;
        Wed, 10 Jun 2026 13:35:17 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:17 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:11 +0200
Subject: [PATCH v5 06/10] m68k: stmark2: use ioport.h macros for resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-6-b76b83366d5c@baylibre.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
In-Reply-To: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
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
X-CRM114-CacheID: sfid-20260610_133519_454409_78372218 
X-CRM114-Status: GOOD (  13.34  )
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
Changes in v5:
- add linux/ioport.h include here
---
 arch/m68k/coldfire/stmark2.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 9263b77bd09a..7eed6097f501 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -8,6 +8,7 @@
  * for more details.
  */
 
+#include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
 #include <linux/spi/spi.h>
@@ -62,21 +63,10 @@ static struct fsl_dspi_platform_data dspi_spi0_info = {
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


