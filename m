Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C6CCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=; b=2NZHAYacg5POkfokzALrNutVqh
	EmXf4VKmuDTdhZGRfROAftqyCZW/DPMMPCBJ3x9ED+9rUMEHOZnm4D+YcVDSkGfZu3z4vpXrSGvsL
	qhZlYeVju9q2N6v2H2iLHVOUK9d4aovns9FMvto25myUmweeZYjxgFr8jrurettgUKFdPrOj+UyhO
	3b8LkBgIBktCkTV0YwU8Ku8MOVEd1nKpjc54SLnZLTKt21F2AqgFgLCYRp8dWJRZe2N/WepZqmGrx
	I7XXK1Q38Rs3x6EvUEThu1c6hjtAJ58iupfs9uB/pCixr02nv4T7E+zCuAEjiXCTjWFkxQG9Ap2kW
	WQTAVwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi38-00000009gb4-3Tnj;
	Sun, 31 May 2026 15:26:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi36-00000009gaA-36wl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso82621045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241159; x=1780845959; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=a6EivajIzE5zK3zNpDJPiNrtY+3u+2wZ58Mi63N+ESp+KRJyP0cwJwtsWOWTGoxEXp
         bvHGbgyaY3iM7Il+EWbBBQ/JnF+syGVu9Tx+ZS+uRXIlVkqXIbr8wDWTCDMLBllIPr1p
         oapEwhMfIFTLq//r2E+yYmMH7QV4dqjYqi6o3JoRHhEfmA6geB2jW7vGPRccKSB4ghls
         wwhTLbHvLCbEQbl8D9lcMUScfXqq8bmcIFEQPJhnAtSPiOoc/AOsxKyaCti/ACr0tEwp
         LYx3T/YCUPldqP7LNdKooZ2vLIzyC9UwKCh1Fj+dmjxEP0hVZ8OUhsxF384LowYZ+aG8
         bu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241159; x=1780845959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=jKoaHIIxz03pMzylngzl/WhaJm3AXwFjqWm8Dc+4aszfNMsrJ8w7HYJHtM8X77G9Hx
         8gmpQPixBk/5sgUU12pWFj9MLl4qE4M6SmNt2TMu3Fg5Id3GS5f95Z2EJR6yMHM67sZd
         VjWZXv6WEEtsxYNF7Bfd9P1HwgnzycOa/NrsO2nyEa7edlxiDc7xiQEzqE7wuWhSyqte
         LfWExzNFIk7Y3yMM+UWHAXvhgGqpOgk+Sw37+YUYXmnygAs0qv7Q/Vfzfg191uQHaTj8
         DO19twKf8qr/ktTffKiioBjJn2iKpvCg8DViJA3RMiFv1QHLYG5xUWXNLtrH5yutus2E
         KBVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NvXCAZw7Qz4e5U0c+4caRGKsJbSsMeVhqtxxEnln7e9e7BqMcawmXRLM+130RqjBcUafJywqlTFZaGvJSV34h@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx+rhGncfADZQ/tOM658LwXM/zTv/PyY/BRvC3UPf928Evmnmv
	U5iiWq3aJkGYbn/FiHxBx58WYBD0OxA0+wfDyd1/ZMB7CPPOR+iRWxe/uw4OI6AcEus=
X-Gm-Gg: Acq92OE7JKw1kD9GigUdqsiFGFmBsvu/x6+1WFE8XeESx7GfDBy6HsM6gcWL9blzoJr
	tFbowBu6hIIu2fop4joW5DPc9Q6IUoIrmEKHgRCji5Lfk1QhAdftdPtj1uQjos2Y7JgOxrvAH8U
	SSQ80NzHRmQeZywcvRr9ztGQ4lSvBdZcBtyI2qisOpq/Ep/H5YKir5JEpRJ7IIXd0HMyLWYc2GS
	jGTf4NzhG6QhiFpzUHjt7fdEg2ZT/qUrX3DChu2Hi5yliwQGLXc0zk7COdpANIQmKf4b83Gw7kz
	CfXgLbWAc7ObomzyOJTpUVdgtXQi7AWUJrvKbYRFJorTUu43Nh4J7thh9wahkBm5EBxwn4YbL6J
	NEYw5rOYJFLaIAWO3K7OCi+uWcWzh4lH2hpEWJc1RFD8W9TTXJOi1gjjz8Ok1gahhZrJhO3vWS5
	MsD6kmgs0xv+hDgNd9vVNr6flxlsuc2WtOXhFJIbI3+g==
X-Received: by 2002:a05:600c:5306:b0:490:a455:f882 with SMTP id 5b1f17b1804b1-490a455f915mr130621895e9.24.1780241158784;
        Sun, 31 May 2026 08:25:58 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:25:58 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:54 +0200
Subject: [PATCH v4 01/11] m68k: mcf5441x: fix clocks numbering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-1-7e65ab4215dd@baylibre.com>
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
X-CRM114-CacheID: sfid-20260531_082600_798907_E6848F54 
X-CRM114-Status: GOOD (  11.24  )
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

Fix clocks numbering, set correct values for eport and DAC,
as per RM Rev 5, 05/2018, table 9.5.

Fixes: bea8bcb12da09 ("m68knommu: Add support for the Coldfire m5441x.")
Fixes: 007f84ede6e3e ("m68k: coldfire: remove private clk_get/clk_put")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/m5441x.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 6ce730098ff6..613b0275d9d8 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -41,9 +41,9 @@ DEFINE_CLK(0, "mcfpit.0", 32, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfpit.1", 33, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
-DEFINE_CLK(0, "mcfeport.0", 37, MCF_CLK);
-DEFINE_CLK(0, "mcfadc.0", 38, MCF_CLK);
-DEFINE_CLK(0, "mcfdac.0", 39, MCF_CLK);
+DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
+DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
+DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
 DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
 DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
 DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
@@ -103,9 +103,9 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfpit.1", NULL, &__clk_0_33),
 	CLKDEV_INIT("mcfpit.2", NULL, &__clk_0_34),
 	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
-	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_37),
-	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_38),
-	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_39),
+	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
+	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
+	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
@@ -156,7 +156,7 @@ static struct clk * const enable_clks[] __initconst = {
 	&__clk_0_27, /* uart3 */
 
 	&__clk_0_33, /* pit.1 */
-	&__clk_0_37, /* eport */
+	&__clk_0_36, /* eport */
 	&__clk_0_48, /* pll */
 	&__clk_0_51, /* esdhc */
 
@@ -174,8 +174,8 @@ static struct clk * const disable_clks[] __initconst = {
 	&__clk_0_32, /* pit.0 */
 	&__clk_0_34, /* pit.2 */
 	&__clk_0_35, /* pit.3 */
-	&__clk_0_38, /* adc */
-	&__clk_0_39, /* dac */
+	&__clk_0_37, /* adc */
+	&__clk_0_38, /* dac.0 */
 	&__clk_0_44, /* usb otg */
 	&__clk_0_45, /* usb host */
 	&__clk_0_47, /* ssi.0 */

-- 
2.54.0


