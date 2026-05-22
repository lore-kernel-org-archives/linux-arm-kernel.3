Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7959FCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=; b=BPjRjfiu38Nmq0z0jHOrapXxZu
	XZMbHveIZle9vnjPqZCb9GDcTZdPcrw2R+VGoLc2/p5qYwqfDRGcFGBzn4w0jpa//zvaINtG2Ng5j
	4Ce5VMWeTdlF2Z683TsL6F65Af7QBfKFAsxhm873ihapycudFe9SsqgDwmL3QFo+KioT+FFdyKpCd
	OeCJGIO9u0dtSyizucm+/yjFnT9A7GJcAeg60j4yu099pAqCtG32xsJZ9TmoZCBDn3/HAsGeuFtcZ
	POBQiS+zTfva96UEzKZxDgYgM1hiiNwim0KRF93s/ibYT9dTGcj/sC+6IQ+1FkQoMhI+crLR+UOCL
	wVF2C2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJ5-0000000Bwuj-0bzu;
	Fri, 22 May 2026 21:21:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJ0-0000000BwrP-2pv5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:21:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49040362e4aso18615125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484877; x=1780089677; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=d4/fkouJVUomfm7YikhAbRmDmTR7VhdXMugTN9arZyRo/ZJafxYOxQccXWyOnwf/tc
         ftEA4fmcawzX2KigFNsFRPOrDtdtiReNl+YTPIhTrnhLvGZpJDFVvt7H/Xo0ZNChvDij
         bwxXl2VjSc73jMdBjmbkqBr/rETZNlxnHrtOmqhiH91UtjEUr1ElfTBwPMcai2BKvmtA
         mEqZMW6d5GcZuUBYc5FfnRZfbrW3EivAQIYF5kqa+cCELMwx8eheiauoiBdoDCw/u8bB
         jIj7FVxqtSo5wbif91ewUzntow/ZvgQxeXJbG2Ln4IBuZdUHJ2xaSz1qNef6DNK1OKEm
         2MgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484877; x=1780089677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=rH7j83qez0c18zuGgnweOlNQ2vXUDIXhCDu+axSSWjo9Lj6RmweqDuf29bKP0OkGE9
         kC+z0EVcZZNwFALzwa9PNAwZ4+fR97/xqvie3p8PRqrHUCiDpqMqNxWnyf638ybK/z82
         ucJYtOr7KWPrS1zeZ+8i98Y7flg1gAoyYdCP8cM8YCwHfcfqmhX1FgqOfYppBNwq2zXC
         wn17/YatmXxuZq/4lTM5J8cZkFCV4sCATFxta7H3s1iV/Ij8HzrtaCU0d+vXprxO5F6L
         cCt6sXb9xEtvvsOtw8q9lBtz1oY3dJ7KGeAMBwOqB2FQZkJmqqLvFOI95RgbQVpIk3G4
         pFFA==
X-Forwarded-Encrypted: i=1; AFNElJ/UySd80aB2UJ61mYCiDBT0uP+NJdigiNjmiPN5kUWw5mpDd0WHTf+J8/Dt8Gx14DSxzEmEKX0YGxJIkvMiSv6b@lists.infradead.org
X-Gm-Message-State: AOJu0YyEbr/HvRulvgM4NCTeZGWnraQvecwVo0yBdNQGz+4Xy1IPdfnU
	Iic+0RAG50T8qFRBN9B5ZQsgBN2UgquYq0DMS1z5yYaKDHRUdS5uO83tPJnnwxyPZ64=
X-Gm-Gg: Acq92OHHx4cFQ1gWgP2a+foQY46Wbp1b6eNtzHBEAJxDvXNpUIPMZXSKuSbtwKJ6oK1
	O+83Efx1NUdA1QQ4BmirHKDp5wu6Ia5+a/U2uYfDA9K1K6GagB3v9pp+c/qHHdvMywbTyiZFxsa
	id2P3jGepQFIz9ygEkpK+pILxCnrLooPs/APsVNT6ub6pJ5CvBJiO2iSOslMVgG9mj5KKRamCNY
	vv7fDIYOGIOl/66ICIsI9/GJExFVB5Ou80BrIHV1M/PkmJ7I0UjGQB7vl6QRAsldd0Sy/B26zSS
	FHCUNl7qmlujgAX5qH1KJ+P5Ke+W9HwazNwLTVKYJkqXA0+aLCXAUSuy7J6DEG3TRzqeHLh0bFG
	Vrn7wzqMcKpSYKAHDiXRM9bYqix2P3zdwp72PPo2bittYeUaxZvaz+7BJg0K/b8IO/Ls7SxiMye
	UHH6ma5i6UiRFlGoNA7GuqjAw0/C5JwOVYvEAxG/sdsw==
X-Received: by 2002:a7b:ca57:0:b0:490:4b89:535f with SMTP id 5b1f17b1804b1-4904b8956e5mr22552095e9.8.1779484876828;
        Fri, 22 May 2026 14:21:16 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:16 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:29 +0200
Subject: [PATCH v3 01/11] m68k: mcf5441x: fix clocks numbering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-1-16be0ad35a67@baylibre.com>
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
X-CRM114-CacheID: sfid-20260522_142118_742202_F9267F44 
X-CRM114-Status: GOOD (  11.15  )
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


