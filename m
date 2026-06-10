Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35426CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=; b=CakG9jQNXWGtdDWu/QXxsvElv/
	ylJO/R3pvnwgWGSLAVN9S3d336FflSE8F3t1ELI45TFxkG0hMv/CO03yf9EAmy0U7a4RdmutOlmpg
	NvSK5lTmdeyhHYYw5eZ7G8AkCPhS4mkfcLy2Ibsu0wGZ8AJWWu/kz1LODNa+xXlOE2+dLnos7CMyb
	ND0JdmqxO9tXH+S1dOj0GYLIKPAD5m3B/6GNbQuRqHXnnL8SCZjyYvQWqTa26VdK4THbuwk2KhFUu
	BRrOYpauX6mmO53ZUTXuzW+v7KzIPwuDbEKdXMgrgvH/sOw8L+BP2PiYSFEcol+eTpUedNGNlzerG
	/layfEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdu-00000008Ka3-1TUY;
	Wed, 10 Jun 2026 20:35:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdq-00000008KXs-1Gzw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:35:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490a76757e5so48267335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123712; x=1781728512; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=LdNi9XYqqU3K8MYQYvUlQgYKsftjmSDTDdPU/zGte07cNU6WF4xjC1Lpl5hhNeZmld
         zoXOUJg0iPFlKP6Sgp+HWNiaydtmwBmW5BfXiEw5grF4Tumi47NNuI3h+qhiEynQRwZX
         /FWBLqF+CLL7nmN88RWKuQlsVEAKTOC71LSxFGNJROKnChztRUKFiUY83qzNSTVt3LLu
         x3mNZ5syc7yOXs946w75hNZqqrIoHgMp1Fc6Ay4YdJH6j7MQV8yZixQ2RdvU1mglEU7L
         AtqxbKtHjkNYkB5zNnByrclwbZQZwkNL3/jpDDhncXxRhDL/itHHnuRCfwxXSfYtsNzU
         VS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123712; x=1781728512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=dmUn6WU1NEv8hfKg+V9d24nsfBmxGtimA7zaaXFHxLMbY7BkJEZ+vOLBCZ6o8UxWKU
         IlC4dWTf866ppoosUBykXXrZhNzJhd/NVuLQFpxz7pK+3wmhTwyayFfE0pwogvIFKDI6
         2sGV0UDlkq457rxmn60f23Zvhbzwpg5Ase4AhmzoK2Dv4e/FmiO7eZyGnnrHxNCmYUtJ
         xt252Z9PbnRXD5RlEf/K29jDZfyfn9KhemLK9V8ZaGMG1aQgof0kcEbAMNQl72PS7vMr
         +t83cO6g3+hVF4jw4WL48XFWADezAha86+JwW8dKQYgPxfqGFgrgrjq5aNQ4Fg0VsQKJ
         MrXA==
X-Forwarded-Encrypted: i=1; AFNElJ87kwdeIoJGBLyRpFm+eH/bFLF0q7aNukkpf7wPoy1M3oU7A9ua30SC94tWPKmhZmTB03ekJMxWzXwo/eRqLIH3@lists.infradead.org
X-Gm-Message-State: AOJu0YyAgjqVfXasT0PemBveOkYj6jKeQGdpHhkIm6xC8qUeo8sDieqA
	by+gGVQuoDsyYlTTGxhzEUdgDAXezpkWbuVFUiHDpDA5DJhtnrlmtzixH1QBO5kYOSg=
X-Gm-Gg: Acq92OF6Nv1aMJ1x9rzFjpkv0qgusRPB+3c0iJERT0tUWe0lODSnOVBQr6axjhBYcBx
	7WptVsgczawbzgJz6InegS/fGrGgZA6IyIbgEeUWeqJ8RzL/QW1N6VWkEtLqzKCSMyEE5hAjvdi
	U4yxM8n9wwv90EytadJspnWkuQzaW47MJ4G9fmi6ZpRHHbu9CkznuT8UlgVQTBX2TmoQyzfNzsi
	dEG5CBt0rGumRwAdoEgscQTytfCvI5fYCQ4L8LtrHy/aJ1i6WFXpGk/jXA/qIGpu/5SN5zbouOZ
	pYLg5NuGR7+xY3sroeMUY/cvjU0DRfIrn37U0qh9YOqTcyhTChPRYNj3baOJj9rzGFZJqdjciwn
	31DSKyxEdN6w1Ztpv4kh5LoxOy38LZ1JV1iX4wqL22tinYWC0MFx6d0jUTUszDi7iQHA65Yue/8
	VU4OrO24sIhtHZVX8UUivRyYW8UL19HkFLJS3zdWK13w==
X-Received: by 2002:a05:600c:628c:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-490c25a87f5mr431093845e9.9.1781123712367;
        Wed, 10 Jun 2026 13:35:12 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:11 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:07 +0200
Subject: [PATCH v5 02/10] m68k: mcf5441x: add clock for DAC channel 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-2-b76b83366d5c@baylibre.com>
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
X-CRM114-CacheID: sfid-20260610_133514_361879_C84E45FE 
X-CRM114-Status: GOOD (  10.56  )
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

Add missing clock for mcf5441x DAC channel 1.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/m5441x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 613b0275d9d8..5b5e09ecf487 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -44,6 +44,7 @@ DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
 DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
 DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
+DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
 DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
 DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
 DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
@@ -106,6 +107,7 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
 	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
@@ -176,6 +178,7 @@ static struct clk * const disable_clks[] __initconst = {
 	&__clk_0_35, /* pit.3 */
 	&__clk_0_37, /* adc */
 	&__clk_0_38, /* dac.0 */
+	&__clk_0_39, /* dac.1 */
 	&__clk_0_44, /* usb otg */
 	&__clk_0_45, /* usb host */
 	&__clk_0_47, /* ssi.0 */

-- 
2.54.0


