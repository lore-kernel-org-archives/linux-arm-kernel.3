Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96182CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=; b=LM3RymuwmYIs9iO7lsnB8idiKU
	3z8Id14kWVwZ25LcVU81OXHLvpjxx0bRr0oOBmxUj14AKEkguv157gBp/ZtSuW74czpU5SAb8Z4V7
	7sPwvsWNJ3dxHxC1J0ETpZ8Y8vql9QQHljoCrGKr73GmhXkhz2Ro+2LG2ebFcPHYHCQYYD01XlDF+
	USYClJpCUp2VMV5ZDcnkvE/HPHaNl/YDNvLqXFewD2q15SqpN/0Y5BzFdjHL2ezRZ8CkhEs4qNoRh
	RMj0GiijGcR3BD8xvIKMYmLuy6WIzz6Gia/YRbRDKbgm+2aIalZu+IUOe/as3YcuEFmePhjJ4xl9c
	jdJlW4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5gB-00000001rzF-2lv6;
	Wed, 13 May 2026 09:14:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g8-00000001rts-2SfO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 09:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=; b=q4h0zaN06fleKD9HNR0DsGWxVk
	xyptGEXY6Tmf4gZqR5+vWu0Zvy11z3hzBJuHpYXftMbkdxUhfOVZpececdhINmC6bcSj6hH7lxNW1
	KJ3OW/Qe0/Ghk2TZU7PWENpD9p8FXJI23M7YGm8rIl09LjjkO0imrt8Hl/Ul6+OYrMYGLirlBA66t
	78n4XYXvYF/Osh0MMy7e8Z1IxxJRl3GKFW842lWpk+/zUAKWdT7xQbqgGwfbCZ87LL1ITpawINFXJ
	t1Qu2zo3lF7DNctcH+0SOGvNCDB1KxKn6Fy5zRaF73/MGuZJjfK4dnavlqtvDnWCm7rVzx0QX5jyD
	1d67ve6Q==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5fv-0000000GxIG-0KWb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:14:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45ae6a0e523so1129808f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663681; x=1779268481; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=NBRYL9fzj3LeLSXjN1hYJS8OCHPtqzp7b3c9AUTprDESbnO+bPvVgNrM0ruBrg7yLg
         Uy38xwoTmbtcEOZks2m4aVSsNpDFQj99oLEBJkRSiUrYYDOt4kugpKL9jHY+w/g+KENP
         isnwP7Eoj7UYulK9216gJ4x4ZX5ITVYmhbYI+kTo4ikJBh5jaRzx7P+6NgsffouvyAWf
         id8WXj+ATukFiS7cl2SvoobCZ9h/TARp5LkOM4A15h7Pse1IWHfJDMDa75LOpr0PHmnT
         Tw5UEdsFpwt5EbbyQxyQhKJyKxm/ah4EwsWppxXiAVX1kIp26ZvMhKOpdcFB813YGKVd
         yrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663681; x=1779268481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=noyON527qqvuPrZsL9pP8zjJVOE4tj1/rqqgFMovQS5C5QZMFNpi3rJ4gc3c8G+2rx
         FUNpvRXZ6iXwYtCZztBBTweTrFEfT9VORzUqtFhi5FoQTcOzvReuOu1q9ZRt/6eq4YME
         g/47YMKZnHpmZENxLv8VOgH50wM4MatgHAPRmNKiZnb04GraHbySQyKC6iBVgYWv+L/t
         FRgmLj22m2m1YmjcXGt/uaU8ausSOMA5eFY2/pQi1WI/yGajB7F9iff18HJUQVuNOBX4
         JhFkZzAvdosSdigebHUrfePY6nRZ5dXT3ZrvDC9rOjhw/VRffvOT2iYBn0nXdJ8HpB+W
         yMKg==
X-Forwarded-Encrypted: i=1; AFNElJ9Wd3oKp0Fg8/k9bnYsXxRuPqkoSMaaYalJrFTexdbpklL0W/fkrTv+vFnGa1Y/JFIb/vsUioNGxeWzwGSLg8aV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/weezEUkoCv/LmblSGp8ZLec1r/gSddwzEo2WBi3UDYpObZe/
	BiRfuesk8ut12e/2oOdj4utycXB90sIz+MFw/Qu5x9TbFHosAIDx0w2g6rn49InbDRs=
X-Gm-Gg: Acq92OEzgzuxmDFycOkwN9ztjhTGCd1rZ3y0YkdKGcBpNT1fEp7EjIyNWO+FHhags8n
	EoWsccN/92ZvJEnHI+J5Ggu2mZkTGa4hVYvn/aI5/4CUeI4K7ayrQnT3kximmuPR6+wrQmkkz6B
	CiLs8rh2UPKA/74POY2lFsejxoLMne9WJl98sz6Ehxr2RX+c99x7YGTJwUKkGYiAgat8aJ3VjvJ
	RExm0lTe4wepWoqoD8BaJ9Im7LgMfdYRb8Rt1AVIA/ItQytJgK+q1uECcG8W5kqhdioArTHp8ay
	0P9iK2BvPB6e0gw2IlVdsH6O+jv/0gCnfvv44ScR9AwkjDNSnDQaSdH6zUifU9Ety522evAL5kr
	Sm5nyqRqlo7JPHozweB6vj2PfKO7i3erP9PcgOSSmTiKNqHwUNxg61pbbNP6eHY3GIuwqQ1hZpy
	yyCUkqa/5isFu2HriqT+eV60+vmb3K+gQ=
X-Received: by 2002:a5d:5f51:0:b0:453:f951:4e5b with SMTP id ffacd0b85a97d-45c584a86acmr3767577f8f.13.1778663680934;
        Wed, 13 May 2026 02:14:40 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:40 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:25 +0200
Subject: [PATCH v2 01/11] m68k: mcf5441x: fix clocks numbering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-1-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
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
X-CRM114-CacheID: sfid-20260513_101450_870249_E7061239 
X-CRM114-Status: GOOD (  11.35  )
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


