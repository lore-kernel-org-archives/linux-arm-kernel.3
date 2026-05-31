Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17DECD6E5E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=; b=nid+wK4FyPWTF2abcQwjFGhq+u
	rLC9sJ0/Jf+UrLhCnowOz3WrTKVwsMA5/9My5YoRFiC8E9JXFuwOcGt5UAeYlZYgpzYC0KzUxv/rM
	Dhp9gTEYAyDsInDF5muovzmwo8gpA/SldLm6i3qmrDB8dOAOfiyv/7VjWmmoC2wcbngjzB0KC5oye
	7N6gw4HFzwJeChxZms3A8JU0YK+Bhgvz2o2PKR3ODUu/EUdO6QnJODdEqkrPvjjf7aOEnyhzWeNfg
	Z9OK836ylK5tCtOK62642RUzQdLGr//aStktWNtW0uOPT2Ny3EpLfK9yjR72JUe/kqn10lTf4n7Hl
	76aKvzbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3F-00000009gfR-2vOC;
	Sun, 31 May 2026 15:26:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3C-00000009gcB-2Uzc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so2385750f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241165; x=1780845965; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=bmjC7WBXvlmRYA1r2AbnrS+QeehNEUtxmCyW6yQmuoXTe4Cr+qJZONX8UnpBfYXiuF
         4I3MfueSSgsCn4K85yycQErPkeItqi83jvKX70lCaRno9p5a/sejhquqCX42WdJinUz1
         jnrZa2zf93sr2oIzIexxLy804JbtQPQ9pETboPoT+Y6KaqKMFWICTERbXwutovA4dox6
         hpyucl67G/kWNM8fOeTkT9j8d3O0fu4wf8cmr7Fdc608fwk4PrwGOSgQanOeqQinyJbF
         XC6ONFsuxQdu2jwkl7wXQzPUBKY8/tKEBKQKzlxyi/QSrIe1eNpmTWMJOakVDtNrXLNI
         +D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241165; x=1780845965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=FCCVYu1DMbPguHgcVPxWqQqlpVrlZ2UucwSoM0eJBDA/Paw1FUw3srHPdVEM1Xru27
         vG+1etiQOKQKlTSpjpT6O4VZGfZ1t4ye6Qt1YSsAmrE3d13x+KKr2YWjISwhRaY2/vD2
         87mG0YOwqRowC5zOw+DR9JL7S2AflIJHDGl8gqYD7l+QgOOkVPogDF+qIWUDLLUzqmc6
         iHAhbvblOgVJ25/Akf21ZQ1Z8Qle25BpBm9pGt42canBwFyOSvauzR0DxqU/FsqwCX1y
         tpycZ+P5ZPYqrQ5dLhngvYUcmdYl/jr0CEjxkbpqJK/7qIWIc/zfDKcJzz6NXSDCHto+
         soBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WbyEMM89zeccaRuDU1fUJkiMyT5kQFZ1jm+WM/vo6yJaVdJgDjlyOPJe2Gfdr/wI/lCyim9SVFQ+SlE4mcUc3@lists.infradead.org
X-Gm-Message-State: AOJu0YwH3oyyhPrsEkcQdn8Gbd48WKf2N734RTVaejE3kB6hU417L6XS
	3BsC5m8k74fiAm9VW315/4OWXS88HYiC0XQ2DRkv7HILz++Ib7Pd8SZgVj4kPlPVMPA=
X-Gm-Gg: Acq92OFEZTCcNrnoXEi7nRK0UFuIW5Isy+6h/451s2z+ZZw9j9KNCDFhqwOk0mrviHG
	2xcuDHlGKlsSFG7cGR1UxQRdgYsLdsQLXFFcs3jmc3Em4N/pugKqN6xDgvs7e1cV7dSGgHH5N/T
	IidVxl6CbLSWAJQlniYzQ7RQnqnPza2NVxSVsmOcTeAE9IEFb7B/W6Vwzpv/L/2P5eJHp28i5Lh
	4KvN4d1rehPXSAB+yhaa0V/PqEC7F8FaT+8LUuxE0DNcvdv8Kay6DmiH3e3oeG7V1GLa7TyIbod
	nG4g078E6UV782pbG+hRVdygDxmpZ6afeGk0tTap6+OP2zUfz2lzHOrUOFDLxpgr1hUDOBM7hjM
	LPrEmEIGAsDPUqptSU788DupzKM5ysNpCnP2Yb1mRGMjdNiUemtApoxf7Am6Q0AlMoNw1YZdv9f
	VAnlEJeRl0kdx2ZCCEfGfD+eOoNJXGayqzjzBuS8ZYsA==
X-Received: by 2002:a05:6000:228a:b0:45e:f780:6181 with SMTP id ffacd0b85a97d-45ef7806726mr11531989f8f.23.1780241164634;
        Sun, 31 May 2026 08:26:04 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:04 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:59 +0200
Subject: [PATCH v4 06/11] m68k: mcf5441x: add CCM registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-6-7e65ab4215dd@baylibre.com>
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
X-CRM114-CacheID: sfid-20260531_082606_662313_A0E9F213 
X-CRM114-Status: UNSURE (   9.56  )
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

Add CCM module register offsets.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f5acc962bb95..9ce2cbb05316 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -125,6 +125,26 @@
 #define MCFPM_PPMHR1		0xfc040038
 #define MCFPM_PPMLR1		0xfc04003c
 #define MCFPM_LPCR		0xec090007
+
+/*
+ * Chip Configuration Module (CCM).
+ */
+#define MCF_CCM_CCR		0xec090004
+#define MCF_CCM_RCON		0xec090008
+#define MCF_CCM_CIR		0xec09000a
+#define MCF_CCM_MISCCR		0xec09000e
+#define MCF_CCM_CDRH		0xec090010
+#define MCF_CCM_CDRL		0xec090012
+#define MCF_CCM_UOCSR		0xec090014
+#define MCF_CCM_UHCSR		0xec090016
+#define MCF_CCM_MISCCR3		0xec090018
+#define MCF_CCM_MISCCR2		0xec09001a
+#define MCF_CCM_ADCTSR		0xec09001c
+#define MCF_CCM_DACTSR		0xec09001e
+#define MCF_CCM_SBFSR		0xec090020
+#define MCF_CCM_SBFCR		0xec090022
+#define MCF_CCM_FNACR		0xec090024
+
 /*
  *  UART module.
  */

-- 
2.54.0


