Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5473ECD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=; b=rJdWQMNpvFX4/rOKeOAK4mhJFs
	5CU5yqA+AUV8gM9o/5HMGO6Su1wGHi7xTKpVHbybCa59MbHyDLVZ68YkwdK8dzE1lkA2N4bheoNZh
	JH8yWRjLNJBVCVV1j+S+9QZRgx9fRP0XYdNN2I9/KTumYKaxG688buSYuYuvy95RS8Okm2tkFx0Zt
	C/mPPw+q0Zieka0Pan0Fb/mspMmU9UTq8lqigiTnlZKJtPNhQZwJT1c7ZhhViQek5Ih9NLADeAACx
	nCF+E3oNubMp6BbQsZjW/ZIsdCBTo7IueKn0yDH/EzCUopFqJA7scNmyUfh/3snZXfHOUMGpeD83O
	pPbliRRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPe0-00000008KfP-3rX6;
	Wed, 10 Jun 2026 20:35:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdu-00000008KZC-09iU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:35:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso60513865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123716; x=1781728516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=AN2wrhl8aBeB7MkJrRHBipbiHpa0v4+1NvyIUV8va4g2M5giUujjddyhOFTRL3sTBd
         3LfmBaUCgDjBzS0kroybOuXE2vhtaIz+5xhqw2kI0AHOkB44gZ/UkAPvPUVCaZwxFCQB
         F82uDWFMylF9o2I1AGO27SmhVTnjbnF/HJPGPCERuf5kTMNSN4eKcC/7Hs947yZYPgkE
         dvuOsDWox0aeN1SFBvw7S8vEAkSdMzxguFMqJJIpX/mEZUKUASuCkGzHXc/ZFlIBt5w6
         hk8HDo25yNvwHiOS5nM+3InTwI3tYWPH7iN19q72HpGbSGHcSjpPRDCd9d5xSTgFBmFZ
         wU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123716; x=1781728516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=WtPIvxu5pVMA817NhSnYSlBx3fcLH/+NQ0FbvZwhIk3qSnkfSZqzGiu0ss4mtI/nJU
         ebUHGnfhB6ss1hGUetaG4IFTWoKuBivQJaRSQ0l1LCTSjsGQPed8MDborPFthqav1hkT
         kcR8nMFBk9/K17bIAQXc62JZEEX21+lkdKtfADyWxZzBn8Urt7PPQk6ok8FymEZHQm4X
         Mr9iuD3RYz1jSyu7ZtpLLfxz7sgWrM62XdswvsC6CLh39jP/ekT1bS+yQStxAUIKY3+p
         XCwbFS3VTDcTv8XXYEf9qiJvOrsxfJLw+VMkiAGusR+NTZ6hnBjlGqmlDivjr/2s21tM
         A0ZA==
X-Forwarded-Encrypted: i=1; AFNElJ89MiVbVddd8Ixdhrkql335Mi0lUEjNFUXHlnKiQg4S0+Q8Rb9GjIjdjCWPGq/ohp/nvMaVbqRD+Hcg5r9zog7b@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/u1LlDEXxOwP3pv91JKsbbO2XQn/HgsqgTdmeTgUWtyIPMMNN
	RFlLDhn5DNjGvvsBAAQiZhOwqfCKQFCqyuv6ISjw/8uaI8Ts0TpRAR0ctxKrQ4ueC0E=
X-Gm-Gg: Acq92OFnGLUHIcL6lMM3VYKXy94wBRI24Pksmhn9lW6a0DD8WyBonFBO9Icb0PnxrVE
	rUHxIo+F5uPCzFNU9Ma0AaUANNaS5nKYZil08tyZKKHvwSdjlZFYbm/BAv+HvzG8vMWhZ8XeKAF
	6EiqqAlbhb9nSPYsMBmrsp9hgIgnhVStbrsG2zIu1M6S43/C3sLlge2rcdVFQKiTiv6j6awX6S9
	gMkzqi88NDHkdVPUDUM+gyRXd9i7GcoktpCZF2EMXUvMO8Cgz0vlFXQXox/NGqY9E4XktLFZ3L2
	iZJzMfxa/8S35re3TZQArHQMFSsQz8RmCKoX1v9POmA3COJPS5+zrzHpHcDSUjEmpI4VsW1DXx+
	XCizK6QpxbpdcX7aElhShw2RnUrctH0RuBrAmni5Oi4AC3Zd+ly9DHsRgoaubV6MLgc7/79aB5o
	5sVvGgDfGgh23n+uFZ4HGFYAj4mvKiQU8mLzsi3xslLg==
X-Received: by 2002:a05:600c:620b:b0:490:b9c3:6c48 with SMTP id 5b1f17b1804b1-490d7234fffmr107606225e9.29.1781123716245;
        Wed, 10 Jun 2026 13:35:16 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:15 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:10 +0200
Subject: [PATCH v5 05/10] m68k: mcf5441x: add CCR MISCCR2 bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-5-b76b83366d5c@baylibre.com>
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
X-CRM114-CacheID: sfid-20260610_133518_103190_64BFE4A8 
X-CRM114-Status: UNSURE (   9.95  )
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


