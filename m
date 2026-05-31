Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D1FCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=; b=oVF38TZrn9I0AKQfIdLjTMnUiu
	XlxEc/+a95wO64W7NeJO6gyVxTsM1g5lRfdulwRGbZuD9t0hAlyoKcmzgE6WEauRlO5pizZp5EJ48
	iI2+d1kotLRsPJyATGw26HdQL2M/kEM29qNQyko9FVBbIVXPi5FdaqXO1grhCcj+1s4QowUwnS172
	rchmnasnsyX/l/O0kPJtIQBx9E9GCZHHCGO7lVllCdSFpxuSkjNo19F3Qa2uybHgzJGYIrVtVleJ3
	+dTUgQCJKaaqrDVB+E0S18dJGB4iVMYhWZTmLYhYboqwNW/Jl3+1BEYdNf1ImJjosanlkxNSt1ho3
	c3qPGQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3q-00000009h6l-2ih9;
	Sun, 31 May 2026 15:26:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3G-00000009gf0-3KaT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45fe59255beso283620f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241169; x=1780845969; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
        b=gaz3WzT73HzIERMoqHQ+uzIIlTsbhMVTt38WF5qxtk2I6FOmbDyxX2KBpFugAmQOUq
         RNmqMwojY/hI8usnTDR7Lbb8PN0YUJrBpSNo4WGO9J/R2vlLT0qvYZxZmYVG5+IJcu/f
         m2KLUBh42JjcfarMvRUGB+/X4Oz3XRZmT4iiuARiFWcAILDKFWoIjckc2yo4GEzaWYdL
         X+FgmjbzZowMbOj7kL5uCjg+pitBkU7RDfuqdhN/0gbGUQBxHAzB4Yq+XG2Xg6/gPak7
         0vMGyoR/k8c26IOP8mMrnyqUoCZ61l2nS0DRQL0ypGIoWTATSQrrb3iG8+KqaB50rsqZ
         kyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241169; x=1780845969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
        b=X2rszHougfQtAwpE2BC/x83PXUgXddt0nfVrzKnkzNO373M8HadtCdYY7YY4bM3tq3
         JZlXwhLsicpMjg1M5lgZSU5vBkOwP5YdvInvNoeTkJOqb50+aN0noRmvBd6SQ/JqkpcQ
         wtlmaYuo2oZOk/vKOxp7T6dP/6JOvsXGA8ZcfWsErdZOd6Z0vmlBYvYfhP17GTuT8rUA
         97JflVbJnGgg/oUfHMJ3dE1LmH0EqZOsVXyO+staEgu9tECtFbmMKTYTFDw+fz9+SViw
         hguSO0BaLHWSVwLed1dulWY2jfs9Uc/051ppmyxbkXYpLBPhs604pQTyYG4s5qAWhxIU
         QGMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SAfoI1B8ShbA9jzBVXwgw516S9VBNI4ZZ1gKY+YL+kTag1h1AOzg/iNWtRESxpYiHylO1IAG7Hev/4g+4UKDR@lists.infradead.org
X-Gm-Message-State: AOJu0YyEIcXQaM8X7FOB8xi2UNmPsntzit1wJS9d+u4eS4TNfkPB6XP6
	4VWMwLPtpbDNxo2svVMRjcbr1ShiKvagzb22Z76h81DL306dBgtJ1NVnwbAjIUqjtSM=
X-Gm-Gg: Acq92OF2c20UPSMqtjpR+y9dazdJbjvhuuMKZLoZbqrNF6G4ksWx5qcQGvLCoOMoofX
	nYBo+W5UK3yag6F8KNS0/x43uqz+tOP8/OLjJOHrpLM/TmECSpZ9VEgj367+9hV9iy/wjsfp5wq
	LvZf3puNnLa+LgeWKWWhQFu9gYeuHCqWEKL2h2/5hOGjO2I+g9iEf+F4af7qoOJthaER4CAeZ6s
	LZznYWqA7rAzMiewok71U9KmXvG1lgqc5hRGO2L/5pKs3IxXWZA+74S5fKvlfWvg8Ltm5sAvf3H
	9VZiV3idvg/2XEXMTn7T/0hlN6Xm2BhVWiq+tNDwcJY+eJG1G3P9P/s3riW6o3hAzqCYGTiUkLd
	ywthINiBbQMSeW6Dbn8ewvCvu73PFZ9vsB40D6vO2VPkqx4GTNpVXu/BXGam9Ha+9t4TMjYzRe1
	rqp2AAH+EQcUnC6aeGhmccuqH7QOACZv7FAMP6tiCD1Q==
X-Received: by 2002:adf:f690:0:b0:45e:ed10:8dff with SMTP id ffacd0b85a97d-45ef6b7fe7dmr10702843f8f.24.1780241168825;
        Sun, 31 May 2026 08:26:08 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:08 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:26:03 +0200
Subject: [PATCH v4 10/11] m68k: stmark2: enable DACs outputs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-10-7e65ab4215dd@baylibre.com>
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
X-CRM114-CacheID: sfid-20260531_082610_857103_BCBDB0F4 
X-CRM114-Status: GOOD (  11.05  )
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

Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- using mcf_read16/mcf_write16
- remove unuseful comment
---
 arch/m68k/coldfire/stmark2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index d3be4b2953fd..8aa9286e85d2 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -113,6 +113,8 @@ static struct platform_device *stmark2_devices[] __initdata = {
  */
 static int __init init_stmark2(void)
 {
+	u16 val;
+
 	/* DSPI0, all pins as DSPI, and using CS1 */
 	mcf_write8(0x80, MCFGPIO_PAR_DSPIOWL);
 	mcf_write8(0xfc, MCFGPIO_PAR_DSPIOWH);
@@ -125,6 +127,11 @@ static int __init init_stmark2(void)
 	/* CAN pads */
 	mcf_write8(0x50, MCFGPIO_PAR_CANI2C);
 
+	val = mcf_read16(MCF_CCM_MISCCR2);
+	val &= ~(MCF_CCM_MISCCR2_ADC3_EN | MCF_CCM_MISCCR2_ADC7_EN);
+	val |= MCF_CCM_MISCCR2_DAC0_SEL | MCF_CCM_MISCCR2_DAC1_SEL;
+	mcf_write16(val, MCF_CCM_MISCCR2);
+
 	platform_add_devices(stmark2_devices, ARRAY_SIZE(stmark2_devices));
 
 	spi_register_board_info(stmark2_board_info,

-- 
2.54.0


