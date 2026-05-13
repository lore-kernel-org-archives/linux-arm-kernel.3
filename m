Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A9BCD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=; b=MJ5a6j7hqFz7q+jHOnCc5E5Kzq
	DOoHAvMo3X9YJaMwQInIruvizEMniPwZ91vYsKCYih6uKmpjm7siMIk+Tu3fxdlKFZi4/NXob3nKh
	n7dg2UH4j18hA7JrlG6SwkFRdMo5lOg7h3KPnd1gTdEExf1WrN+TdbMGGu/FFM7escU6wMjsrNSNH
	R2geMz2e66EPBt+vrAEqne4fJGuB5RxKfqIACRmgqItnioVaP7eot80JyysKAqXorPucWXPrm/S17
	yoTROO2ptJ5CoGJEDG3FETR2cs6HUEGwqXf5EksTAeMM7rqGUBehK0p/J0/wjEBN9Ld4HcPQf8n+5
	qishTasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g4-00000001rpO-09np;
	Wed, 13 May 2026 09:14:52 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g0-00000001rmI-2JHc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:14:49 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4526a8170ceso3598844f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663687; x=1779268487; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=M6B8WlAGs+35xozkwp3RKk/j+KmIAlRs3OZ95WA6vVWKhcslmPx6dWLdjdBMSRXmtk
         aUgHsBvpAy1YsbBrmkY2Rq5zOqxUHbpmCVBPA3oJWPK6cp/2T6VSmpeAlxvdc6lFE/Qk
         8qdkuanl5o9Vx/wMdrMukx50KtnqA54EweHFBTwmzZvTTEkHG8dCLrmep8D2q6ij/aWg
         izM40XfBmIb3N1KegtuIfhL5JJGPcQyI8mbo5Rcie6WdwjZXWMEaqRkBKAnzKGCIZ7Wn
         SluEs5arAsS5CPp7RSsuCFiu6KM4ujE43ESK7tJ9v7L3AlYTFnpXj850mtvkgqXJIX2u
         Xslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663687; x=1779268487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=eOLEpoLXzoLd7luch3yOPjG5hsVd+D7QnAB9aqsic33fikb8j7w8i6Bf117HFd/rnO
         sNk/92/X3/5PrtZZwHC9cYUkbeX3f/zeeuJHSqEs59CBygPGwvBqRb45dmK8jPbUhyvu
         Ci5ykC8rsxIUUn0kkLZ9KXKHwA71w0Wk0ncTeUZV1odQK1Wk5+FTdbPHiZ8RY8e8k67k
         9CcdcNZkd7qDuoCaQaqgUKK7fD86FXwJZeuuhBTJvdNJopQD31NgQVlt6ZGpveRYBbir
         u6Dp24x57z6ZcW5BF+CmbQied+bw5FcZGYXfhQ18ZKO+KNFXLzZO5QK5BlurjTtMMAjX
         4n1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8F/yBKeZkDp249J+PDVCs7cXm1gxS380TQoB4AWwyGSEcwzPEdbyZS8jVGZLIaMweUg6+QSsUvILXXWabnBLm3@lists.infradead.org
X-Gm-Message-State: AOJu0YxgfyDSzeadsIhyiMM9AoVI+n2SDnoHqNxyMKHxYlftzVBdiU1d
	X90BXbW3jYjKRoN0h8XRh9YyYKniYNImQKetTWP1+yjIar5pg7/Wk7B8a9xfZ6L6g80=
X-Gm-Gg: Acq92OFerl4kwyOC1at7MHQ5ZDtW3Ga9OP9sd2ocU3RMe7ZUtId7KI478lXWqfBXUOO
	1AQ6hdjBU1+RUWbwQYT/Qd4auLenxLK46z2HF5URxa8fyqTJLehHAIDStOjSQ8ytVpOTWskdFz4
	I9dJZ5FPqXretEJVKgwWNBltJEcs6J9Zx9W1DZ9ooWvNTWJNznOJgZZKkeetVCR7dW0+0PP6g5q
	cmgD/KrILKieGGrDHGLr+yM/RuLfwoYQ20TzxCvAqiIJagoh/QTRbYSYbBpI+AdoJ49dlaxVG3R
	PlJ+Xo1hrvNjLCz7B6jfjhm+qbDt61dEz8cGqaSqwFEnu2Px9ktIDqvZYWSpZaQZUx1FN3fSesv
	juy6Ojip7oTgX16acwFCiwje+BfsI2qQyptTDdTcWrEqlRXxNVlM8eGj/pzfEovUpREtYTWZkaR
	ccxj548V/J5h/62ORTN66Ov+jhh49Txqw=
X-Received: by 2002:a05:6000:3109:b0:43e:aa88:f1a1 with SMTP id ffacd0b85a97d-45c59702ee1mr3542834f8f.30.1778663686628;
        Wed, 13 May 2026 02:14:46 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:46 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:30 +0200
Subject: [PATCH v2 06/11] m68k: mcf5441x: add CCM registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-6-fcdae50cf51a@baylibre.com>
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
X-CRM114-CacheID: sfid-20260513_021448_618846_2FF485BF 
X-CRM114-Status: UNSURE (   9.72  )
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


