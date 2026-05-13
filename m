Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B12CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=; b=izfXiFjBJ4uJE9Y9zU5PgO/o2J
	766i0zhaPnnKBWDHTx+zG+OdUVToO38mL7cluQa3x04UnTKeJJLEjW55HLSRbLQyft1HwIJ1vy+SM
	PuojbypPaGmllrANpYpyqWm2Lrhb4S76aVB2x2wWbsYa+Vu+QxrlDCdeO5xEwlfxlA8X003TpirMA
	spHazPiAjZ1uGbWp/Pw5AXz4YGzpSIrJj3D9AHjIHw5iK75BT8Bxc6KrTlh34jIXOIURdY0o+NKj0
	lgOll667dNnR+MXaHXoMyPMB22iMEaaCLqnVh8xaXQR137Acd67G8uP4+4sYN0e40HOCVcralWsJM
	O0iaaA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5gA-00000001rwd-24vY;
	Wed, 13 May 2026 09:14:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g5-00000001rrG-3VJu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 09:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=; b=rZ1mBIFGE9mxF3vjMUnXZhSnYB
	Lz5uufDgINJa78dTtOQyTb4fNPD20CucBY7OPlYllWKzru1uKw2IeFB6o+nhsTUpiRLL5HrpN3FcF
	525HxmU/E4VoL+uGHl9BtbV59uoeBN8D6ik0Zv0Y0dK3IRBiCwPpHRsbGPnW1zmQIex4rJumS0+fq
	qo6XRJmxMzbNYfTjYkH/BhVyQMc7WJ3vXOjRr5BPhQdNi6ZkZWG4RayHFQnJa6KJgUDL41oWrDSdh
	YubOkd5zDHVSkMRIoXDgScfouEIifmqTj5JBKL+gg826deotzRfS5SgW04sIV0mLa4hUz5enFBfNn
	FLxhY07w==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g1-0000000BNp6-2JBj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:14:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so69235715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663688; x=1779268488; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=diBWPgaakCPZh3r/gwYmbxM87HZUu4GVTuA4RHXf+jP1yb07kIuDHiC71qreaxSEak
         6zzk7wpjyW3eU8qKzB3NOW8z/qgsgn39hQMl5cO9OuvZDQq/xRDfTDGaHZLvJfNz24pA
         U8g7LwGlF3GxEu1lpUT8XLpp8VbO3ugCHrV59koJ8XNRvIeKCxdJQtg85KYVQKqS0UwA
         ljXkUqNuzEQRpKlmwIsT9XI9bB+M/JL3aBNgwLq6S+fjp7jcLcyrBp5FmaTX+iQ7XGSJ
         /rkth1esukBzUbuWL9hFjE2Z6Iv1kl7vzDEPqwe/kTQhbVffwhJxXkq/9+ra1KoIW/5l
         NZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663688; x=1779268488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3Dc6zoyWnXEvMeETDcz4Z1/oT967FAbFkpJkYlcBjs=;
        b=Dgzoh8k8esIZhrKkuHCbpribjX3DK3B2rJ/Z8URJ1UGNk2Je3HkdH75QkELL25Mxsa
         7GzE+IqJlo2uyFrYx59EjAbvRfowIHgqMdey9wCNT1LijiHFMG+LHMt30E1PcSXSetPs
         GxPAlE9PBQDxIgIwXCqiQkdtQ1Rbnvfu3560EkV31r4hi1KKwnDUGWRD627pHPU4vkOn
         sPbw6geb3vWi85DfJF2rYaMA5wyC+FhlwtfNRu69ptQiRKw/Fr0SHSHHCFpC2r0FdZVW
         zAGKclv5F2j5ZGdEuofChcW0DFjfi8HeFMCcNfpnBxY77wVyWXeEVAaC8iCb4n7fTzZV
         Hyjg==
X-Forwarded-Encrypted: i=1; AFNElJ/DjkLNeJHdP9Rg8qFrhQALx007BTRsottWzUbNjCd1yixJa6JWFqXgwKHwRDrfBzbH+PwwZfeQkzallDG2Qg/k@lists.infradead.org
X-Gm-Message-State: AOJu0YzrX2Q5GqIDFkSyTbWTNceibk7JxMQhSmmBwEI6b2I7Kn860WD2
	lnKVQfNNl1bz16xBvbjbNzEXKNPptDU0Rexl+ayrUzDlhZrxX5MtF9zaidwSLV+z0gY=
X-Gm-Gg: Acq92OGGjsOdOI2lASPcjBKVTCMri6UEpgl0A/0vKeb0YHWGU6Y4y9Ok6feiRC4oq8O
	II1vbbrGlsHNW0y7Z1Em8Xhm8RyG3jF83c6laYh11MGOS3xR/6qPQtOIdxCMPMSzFKbARWMY3ge
	cAF/7nt4EveQVCRZUFb2OHll4U5oLepEfbPI7J9JnX3EGbbvJCxu9sHJnZKfPSTtkyjXfynECx0
	fcrZhpTD4GCbYN51UGdAZGxPALQWP4H0IMTCaWTcjo734KYkZ9XYQOEBD58HbDRWKMA2wcA37od
	Jv/DHHVMk0qKHikDklBFYeZ7ibTGnD/xztpDcvA9UCnTjbCor7zGBLqDTXEnb+qNWA7HAUjEmpv
	StNrZ2RPrbMYCkiUS9SA6QeqpHtnGebLbeEkHRbkHhKM0N+YVgPmsi/XnFH71CR7WP1j1Togl5L
	LORe1QSe4QEE/bQHPEW4ix9FKUhtKJmgU=
X-Received: by 2002:a05:600c:190f:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48fc9a4480emr35035905e9.22.1778663687681;
        Wed, 13 May 2026 02:14:47 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:47 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:31 +0200
Subject: [PATCH v2 07/11] m68k: mcf5441x: add CCR MISCCR2 bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-7-fcdae50cf51a@baylibre.com>
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
X-CRM114-CacheID: sfid-20260513_101449_678110_A3ACB9DE 
X-CRM114-Status: GOOD (  10.07  )
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


