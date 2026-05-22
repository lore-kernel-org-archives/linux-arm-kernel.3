Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391E3CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=; b=FFdJgxFRhIlgmXvefVqPBhaWk2
	XMn/r1B7/e1UsyVYrGZYNh1g9NFJrPzJx9PKcI7fXTRPDplay+7CRQsqBp0q4Cs0wB00BpFVR5Uho
	B0jdhFLwez0I1J2RjHyjL5LOW4UULSBMVla+AKE1B6QjxZZmuFtDppc8I7+ZFMjlutbya0QpV5TPR
	SVv8Mmh+eqIE66yM0d/uwvB1Ye2s72JJF3WxgDodv4r1qw31F3ZlAx9RPbh9GxYbUY/gxI3AVxuVi
	HPEpq1RODVPwvO5mJKUlIjY8g9x2kkWrAHj+HiM9vkESun0RGniZUiGTst5ro+ueh1wbcxi6g7eKI
	c6JxllRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJB-0000000Bx1b-2LZZ;
	Fri, 22 May 2026 21:21:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJ6-0000000Bwuo-0vvL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:21:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so43262375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484883; x=1780089683; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=K+MZUsASImrJoz+PL9Am3cQ4LmdNW6WFLSETCmQfuLzmtbY1B880bofwgFH5ZEbUla
         s8FemhJFYnpfCG/H8/gofBzkkv3V5936bQypjCHtoyyKYwIXCCLXFvJJpU0y0uLeERXE
         NXOIvj6KwVYHOro4CVV3+hQA8xgGX8EoMa0wF0lzcApemYehdsxJ+2UQREiFQrAuW8Hx
         rv0Oth7HX3AsMpKcd6XUBDj2gzkTlPD6ETWWNz5UhvZ50XTChUNzgEA3Mh9ARwFfDEMI
         VeTAypbgp+8tLV9eQIjnE2Es6NcQeAgK+ll9jkXmTi75Vm/wikwRD+2Uw+kWRUHeDoin
         StPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484883; x=1780089683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=m7Wxe0aR54H9a1FeHJq/x8Xv5OMfMZgFl+axCUczPBezB8oEplBZ7wewqEpaFWNumd
         EP5+f9A94GK6OysglbQ2VcWXmG5uoAoQiOqm7Q9+6k/fo0tIAWEtxEjaZEapXl9ui6w1
         tWZRcb3cvreN91UWvknORS2aEzzcxXnTeihaYICAmkjRg6N1IUWz1Ub9ZDXYefb7LezK
         vjRHERi11acv/L/jfFevY6zbYa8SmrVylwjWXTBTBYaqKOBTIE4aKQYup109Wdu5bTnf
         GDxtxTvwgxaeZR49I0j5TqKH/FQCFCM0fKQaM6eQq+bVcV1Eft23fUfLw3xLInn6Ozrl
         Lsdw==
X-Forwarded-Encrypted: i=1; AFNElJ+YPHWrsyLBmQ/I9BS4+F22DNVFywgPig8K1mzgdfMmTciDVwmCKUZJUY8gbkg+MrdlTM7/rIGsDW16oTkQ/0ic@lists.infradead.org
X-Gm-Message-State: AOJu0YzvQ+ldsb+mTOOfEhSS1KfKKr+I0MhVq2+DPg/M0u1nWMoS5bgv
	FtKWXp+sYYH8I+dHObfv7gNoH8x+Fh1wiZxuPTpGrDwczAxnAbP/ug59wNBl4pXMpeg=
X-Gm-Gg: Acq92OHR9zOoK7U4ugO6YCMfWFZDa4jSrsVvA3fuBWh3cLIrLAtVaKK647q1B65CJ7H
	goMc7yoEPeiVTgHlMrhbMz3eRpQX+/xJAZwZsu1ALel4vROjSfNv2ajDGyPHqPQeq24Ss9e3sid
	vgdoepj6ZGJJxWpmUuV24M5MEKAYimH4oL/8JdOp2nBSVfQqdbC0ORGGDFPOYkmJ8FqSLNRZvQT
	tyLuw7ivX9EEzuPBZbj3bOZq2/Wu3Ie+PdDeWTplT2n/WvaRj7IZObYSbyupRS1YWOee5FnUR9H
	ocD2eX739LYfrXWB7pHqgx7F7bmZtz8XCSwjVXqRCuHeSAHk6myLKxhaWYKuyxY/Rfff6DfYKAx
	asGAT4+mw4JmN6zE8nlRXJlLqB0cihzQCi4fJZ2INaLqLJSiKGGM1LBzG3e6qI8LSR1dWfqSW28
	oWfFlaRqLSdaBesrSL0YKIGiFoVoljNHQ=
X-Received: by 2002:a05:600c:3b07:b0:490:f7c:b19 with SMTP id 5b1f17b1804b1-490420f67f5mr63502345e9.0.1779484882631;
        Fri, 22 May 2026 14:21:22 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:22 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:34 +0200
Subject: [PATCH v3 06/11] m68k: mcf5441x: add CCM registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-6-16be0ad35a67@baylibre.com>
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
X-CRM114-CacheID: sfid-20260522_142124_297918_0AA2B07E 
X-CRM114-Status: UNSURE (   9.47  )
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


