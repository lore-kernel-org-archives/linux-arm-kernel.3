Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E8FCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkH/fl0oDwirECp71YLEqMq9AkaqaSB6/Kul4n+Czac=; b=u3YwcHP6wV6AvFBp52ek8xGvGD
	bZ1aNvZdJJEOudmmyHy9T1N4vtr2cvsiX2kFHCEGGChYoDo+8STyBIfFiTqkYhxfyiiAMGm39IcYd
	xxHSwPOdtv9oObTz9nKmHU1+ZH69Ui2HBDjjxDB/5YsfdEO5SmYQ/VmAkjpEh0VZvVy9Nv5smcpm1
	1Jph4VbObmZDzAryBHgk99y2GsMywMfGOkdUI49d3eDK5JNg2m78BqVr887uOfVsEYXha1i84cOHb
	e4WOY2A2ILEvaz7hMmd1tf1iVRKLpyLz9g4HWbQ/ETG5hMPJ23DtQhgZXUndCNATruOeWl5Yb0o82
	EBqZMGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJe-0000000BxPL-1BJy;
	Fri, 22 May 2026 21:21:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJ8-0000000BwwR-31Fe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:21:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49048e043e5so5875155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484885; x=1780089685; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkH/fl0oDwirECp71YLEqMq9AkaqaSB6/Kul4n+Czac=;
        b=Tob4b6kGPR24q2ATCQ0uiCXAHZ7oi22PJ71pLRXAfWUdTkMgcLlqN57Fwn+4zINnz0
         u6m9svQ2ilMVeomYfj28HbNXT/dKcuC6Pg26iur94VtzQI8t9sqOsiWl/KdAcMy/IrS5
         nzmKV7AsrUKgIjO+ja85e+eJqClH1EUjZVmp9r1iKas16YA2l7YgrQqnPRj1ZPjDAHZY
         aZYwF/wzGTr7PLRqhswU6+NyEmbPMDUn3cU72PTWRGgTWaVXr3eh5DI6EGfOHY5E4+jy
         4PHBegRbKR3yOwyY4kDSztYK9WjLxBE17gmt4P1/PDTvqdOkQO+cXUZbeBytfVhmSUgZ
         WdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484885; x=1780089685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VkH/fl0oDwirECp71YLEqMq9AkaqaSB6/Kul4n+Czac=;
        b=d7hRivLpjJQ9/9eF1eW3XenrLDu25CJxExcNmo1O3rU4R9rNgSjgmPNbU+aQ5WG7HH
         XcqLTK7e17SkEmWI9UTyCEGBPf/iIj6UKTqHmwraPF6YGTErzRwy97Hk0z2QfMLMRdlh
         U4gqL3RkVunLZy7ulslmfo9yfZIXhS25Wka1yXTIsexsZauPnpVJPY+oj9w0x0XaJFvG
         6A42gVc9Oeh5xQ/bqTcPISzzCLY3UbrQz12BIBk4bF7Z2X5USfLKGdEgThsQqk3Z/gF/
         bbSWrRmNXw081QjArZ+k73Luc3is58mz8lWfDBaYwfx3DLlitr2z72qMsy7M1UCd2H5w
         dmfA==
X-Forwarded-Encrypted: i=1; AFNElJ9lIOnr+l/CqzsS9Ft3JU9pFYTy3tsv+P714JgHKQSbtJy4OJm5/0MNNgXH533n6CtLueBaaV/Jal4J6JH5bYkq@lists.infradead.org
X-Gm-Message-State: AOJu0YxL/MvU6mmmh5+YQj6PSqSwhhYZn+ssxUddON0CGJ0vwyjFXwjt
	2wvZgtjVbF7Tde+W1S6R5tNSZ6/Qv856LgjZnqkDyUCt5VKNjbOxmB9eVYlewDpBZOA=
X-Gm-Gg: Acq92OF0cdu0P0IuSmLwcGgQVORKrLyk/xi/1fFp1X5oVNz9kGE2TEI6pEY8QXTqLLJ
	Xq9o7CAToHgmwzGzvfV2WqtNqq1icDNMY3XH3lbCxEo9ZCdZ33ockW0F5PkqtKVhP375fwgpX9l
	G20a2qJw1fr3u1G2sjMzp8AbzMEB08qB92IwPBfCb1nS/7h6RmlJCC+ohE7z0bGoSkqy1Be8f9W
	5DEJ/sIrg6SL+vvmYjxheZuEGrlYOg9YE7LrgtE7mNTFwkTayHHlaZ1tNSV4sE7sjMnzWRnju4C
	Fj1u2IAvy7zOkdHu+ZbfVbXyhpB7R8/WuZJweBIgXsHyPHX+kCPMcjH8CptUIR/2HKqJqn7TRjk
	m/Bde8PM1JZXo/Na7wIO+CUASfxsj2bLwjkSz3r+34xXdDUp50rx7M2iY0Fron0IMar7JRbZGQh
	282QuBNwSfwkvngmZILCcI09xJc7dX3f8=
X-Received: by 2002:a05:600c:1c0b:b0:490:44eb:c1dc with SMTP id 5b1f17b1804b1-49044ebc2e0mr79758455e9.20.1779484884911;
        Fri, 22 May 2026 14:21:24 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:24 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:36 +0200
Subject: [PATCH v3 08/11] m68k: stmark2: use ioport.h macros for resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-8-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
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
X-CRM114-CacheID: sfid-20260522_142126_784018_B7EA212D 
X-CRM114-Status: GOOD (  12.65  )
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


