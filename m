Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB25CCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=; b=3zLLnu0dzJXh2yfffvAq6XyG4G
	Tyyjh/AwiIYEfsUNpXPQAbpOgB3b/oCBP3zpGiLpvPUAyTSmSFldVHzvvw6bK48OrWT0/IDXQ6KtS
	xEP1FWIlQ5NQQ87wZ59UqGWtVY4KMddh5e9vTb2wqE0ISYZkMqaYGhqCqbnlzgSKv44GXpMRqDnYm
	OdFP05iZapDHQbTP4Dfm+1q6T7VSxStkDzyxHHJaJ9Vv0+RoGozJZHELWh98woOaVcxN/FcH7U3GM
	1u+34MFRkQq/fjd0Rfjw0E5XPBHWl4lkl16CZGXvhR5PB70YudhqrOSP6zDL1a1nf84hjUbkxsfdb
	oJRCXLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJB-0000000Bx2G-3VDf;
	Fri, 22 May 2026 21:21:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJ7-0000000Bwvp-3Aog
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:21:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso41001305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484884; x=1780089684; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=LwOjRbSMNJ7Qo6jPPtAY935qBBsbr7PZEHQZEpJuGdxir9cUBT495FGOgRIq9OEVMq
         qAkmFezTLR7lUnNvtijirW4Qj608KUhyOM0wuCjdya38GJvUVfWqkit2gsagGzBMc32b
         6N4NhWdsqj0dX6LQsW0iqC9mA7KAlm1/c9R9sRntXqVDNY+BY++7WLaWO8mBJjH088bC
         pwGp7ww9jfXyN+sfIV+b1spMt1zo4VuwdBZPA9hJW0lUhJbuaGxDQSOHDPKdLqlzn3iv
         qOurCTdwaIC6rLeFsob0d7jrQGtMXmJFP7Sm2g/mUtYMEusFZ/s/MycZK2PjGM30Wg+C
         v4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484884; x=1780089684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=Uf/XceOffzKXicMF6IloaSUfD02TWVdVqua0zktxZls8v1VahPKaS/9WzA5eLnvhok
         pJlXXXwXrrpHpwSdPrG+CBLqsNzYIpc0tzRyyDEhpFFp/PfEyKCzxTCe/G9z76N3KHVv
         4Tn9UXprVDX3p5jts3eA5r/V3Z9aephtD84WZ/OOdwu83RfLbv0afW5Bawwe9uzF0ocF
         Z6iZ/EY80oobqnwQnS8r5it5Wbzw7/uZ0iAaftUB4yPoGwdA1j+DUbpJMrbaEuK2c7k0
         w0h3U5LL9/alXGFEXz2KXkz0dD9QQfmqviGWTFiUXArTwUtbNk+D8H+Wasgn5H1IJ+E1
         J+tA==
X-Forwarded-Encrypted: i=1; AFNElJ/Xc9N67Qvq06hifN8WUohQum1F2Hm2wRrVmhIN7gPl3+wDcraIZN9uwgQIfFhMgWhVQYlFMKAlnsiCTT6Wb7ST@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtv0w71uG4utP3vr+CplYZwrgeFe9ryE7hWm/VYW52jdqKYe+V
	ltrJ9slOaF7GMwkQwtx1988u/PF6WfG7I7IAwIbCyfXOKJYDu2MYK3OrPBcNU/6FU5o=
X-Gm-Gg: Acq92OGWWtgjvnO8TCvK2KGrk6N7FE777IYfL5eDDswsMqsUlumYYWWEbkWKTWbOoB9
	Id1IX1o+n8wGJI93dVs+yknObz1yuYnMPiBjvjwyMVk+q0ivwPf7o8Kohv7tmheXQrLolKq/mVr
	SoP7fEmn5JmiGYFtPkmDG4rNHfz3O/V7IsYIZX93KMCSrzyOO45xVquplELgAoJbWYHaJHyxkeT
	Sr0bUkA//9g9+zstlaMar6H1M57O2bONExPOyg8OUtSaVbZVLg1H7uZKtBZH6hopOU4elQhZQB+
	obzccIpoCxkShCzR86T+9Sv8uqQOepJm8NVIzYIt4uSqyvLuF+i64x/6HnShchJRdusIuWdMX1j
	Tz9vI7Jis5nQg7eFMDj/yorE3W6a3YkRT6uNMOQFINjkI4UkiVH3dYI3SHflc+qKzeCfVqYYSta
	8kej2v4/Vlw/gfLL8tHIGWonhbTb7mcVk=
X-Received: by 2002:a05:600c:a402:b0:490:4033:d3df with SMTP id 5b1f17b1804b1-490426d7223mr56354025e9.23.1779484883834;
        Fri, 22 May 2026 14:21:23 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:23 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:35 +0200
Subject: [PATCH v3 07/11] m68k: mcf5441x: add CCR MISCCR2 bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-7-16be0ad35a67@baylibre.com>
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
X-CRM114-CacheID: sfid-20260522_142125_902942_6A24D0AE 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

Add CCR MISCCR2 register bitfields.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- add "iwyu" include for BIT and GENMASK
- fix MCF_CCM_MISCCR2_PLL_MODE bitfield
---
 arch/m68k/include/asm/m5441xsim.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index 9ce2cbb05316..ea01c7753b7b 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -8,6 +8,8 @@
 #ifndef m5441xsim_h
 #define m5441xsim_h
 
+#include <linux/bits.h>
+
 #define CPU_NAME		"COLDFIRE(m5441x)"
 #define CPU_INSTR_PER_JIFFY	2
 #define MCF_BUSCLK		(MCF_CLK / 2)
@@ -145,6 +147,21 @@
 #define MCF_CCM_SBFCR		0xec090022
 #define MCF_CCM_FNACR		0xec090024
 
+/* Bit definitions and macros for MCF_CCM_MISCCR2 */
+#define MCF_CCM_MISCCR2_ULPI		BIT(0)
+#define MCF_CCM_MISCCR2_FB_HALF		BIT(1)
+#define MCF_CCM_MISCCR2_ADC3_EN		BIT(2)
+#define MCF_CCM_MISCCR2_ADC7_EN		BIT(3)
+#define MCF_CCM_MISCCR2_ADC_EN		BIT(4)
+#define MCF_CCM_MISCCR2_DAC0_SEL	BIT(5)
+#define MCF_CCM_MISCCR2_DAC1_SEL	BIT(6)
+#define MCF_CCM_MISCCR2_DCC_BYP		BIT(7)
+#define MCF_CCM_MISCCR2_PLL_MODE	GENMASK(10, 8)
+#define MCF_CCM_MISCCR2_SWT_SCR		BIT(12)
+#define MCF_CCM_MISCCR2_RGPIO_HALF	BIT(13)
+#define MCF_CCM_MISCCR2_DDR2_CLK	BIT(14)
+#define MCF_CCM_MISCCR2_EXTCLK_BYP	BIT(15)
+
 /*
  *  UART module.
  */

-- 
2.54.0


