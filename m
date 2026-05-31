Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706FCCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=; b=PgTGvxxI41xx/7as6e8VtSHLW+
	8gb5Rqlia1SisVLTYJC3vmi8kOCbVkcoz/BfhLMwbtE5/qkagK0SkSqgQASafe8RndskApFKWVVQS
	SwE/bOxv/bjfVk0f/iBhv/m+IK+AF6KemX8T/cUqkUFaVn+ZsZboCaBLdYW4DBXSp73d8N9vXCSyE
	i6OnTatufOH/X9JwACxJjoKa2UvTl4gY09hXSQ+37jylxOcucuzCWC+DVjkxreCOvQ38FfhoWo+Ah
	2cWiubIyv262f+aY0xiCvr8hvrk14c6oSqD0WDx0EJqDZai510TnE2xwNFhQ9HjZZKRZ3FIVeBPxc
	RUmGx/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3q-00000009h65-0o7Q;
	Sun, 31 May 2026 15:26:46 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3D-00000009gco-2jY0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso2169486f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241166; x=1780845966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=HMqWpr+olspIyD2LI8ALK+9NoNm8KlRG+5SLeNjtUAe+rJfuCycnfZDhXqn0bILK/4
         podDQjh1/h7gm0u7Yx6gkIp1R2aFBLUWkHRInbVKOvG4BMYmo/K5LQvwljrWZJGrIPi+
         0J+K0zNex7I6MKq0LGqcCFo98ru9fss1Z/lv+7agTNsayYH8yi/1pSN7waiKYFI+LeDS
         Z+trfxrAS2YYnufSNPC8J2rV/FRuy/rUFzlQo432BGqXXiNx/cUsr1M72iJsGVz/OT68
         /Bx9cnwKXJLpdT+TLMk9lSQL9kJZEXAk4WKJbhPOvjqXOIQw7ShqeAfvnvQsjHb8r7fe
         FXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241166; x=1780845966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=iXUKsHnAa/WnjzZ8CRKKQUtackkrus/mQPl89vpHAsGHgw7u5mcx0q9mPm7uN8Ce3G
         ZUCFBxaziTmUp9f/GQ8W/lyrjN5fKupS9B3Xupvot4xptwF8aPSxhH5ntdVF1LbV/ld4
         P5S8GXkgd8/8jbFxNuccHfS4PbCLO/bNzurrwyZPHmtR2oHhS4fXmJwyivnBFS3mRm4i
         RJhcnPiWMVVbqI3jikX0tBRdmgxvBvQULD/UU3W7HLTPWJvYJGd1jUfJ2izZe0OxYUcn
         0pOw9yoOqFL/eNsLKVlmclQ6eNdishK5SpKDeejlOddO97cdLQCO9IOS/YlAxg7t/coA
         a2Bw==
X-Forwarded-Encrypted: i=1; AFNElJ9TM8Dhucwi+XJ5C0F2M1hPLPKkrUkHdj/MUoeyiyJpsoZlZCreA5pGbdAc8chnu9oX7VTIHtb4Q48zXwoT45Py@lists.infradead.org
X-Gm-Message-State: AOJu0YzOM7l/BRVPUaPbfs4hL1cVb586IU76CBFIbOB0oXBelp14fpvC
	Wb2KjlQ2hgWBNGxcRaMYf6EJb2c/B27NwaiPBD8zzZdTJVehadFNebERh+8FGv4HIqk=
X-Gm-Gg: Acq92OFVdzl/xexiTRrx2Awfs92NjnEHqZM3h2E8cYpzmmOpwGdr7KLMxlNrHJVF4yC
	lWC0JoPFwBji3hSboBuVEapLF9Ap9dPQYYGjaFpwg3R2210zN+xPfj+ytMD1rGI2rn7u0OMczjr
	m1Zu31XAopx0AS8M5qrYkvzN68pkXpY3Lg5qX+vu1dyeAJTxlXTlwCsukxlrf6AJ6+y0AuWgUAW
	0H04tJLNWME9UMOxmEW7AbiSlz4BBHtRJ8TubhJjeNorPdKy+J2fs/NpNkeOFXalMK5wN/IrOlc
	B7eQ+1R5ISGuGEciwI54ZOsXC7Fvhw+g+oL7d95ReTD1TwrHIzIRkV5EQb/AoPOdjEd3DZVw6mE
	HIazp3smS2w2HYmDy+TmCHnk+Ov6/SvIvGSF6awB1bxyES32DCRYZdsEtW+sL4MqFfsZYvSXmtx
	HLn8qJ9gTutEcXZFqjf8/6Ukh1ikvbIGJJInNdwWd0Sw==
X-Received: by 2002:a05:6000:4b08:b0:45e:fa17:a1d5 with SMTP id ffacd0b85a97d-45efa17a416mr12030094f8f.33.1780241165693;
        Sun, 31 May 2026 08:26:05 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:05 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:26:00 +0200
Subject: [PATCH v4 07/11] m68k: mcf5441x: add CCR MISCCR2 bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-7-7e65ab4215dd@baylibre.com>
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
X-CRM114-CacheID: sfid-20260531_082607_733929_E8F4EAAE 
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


