Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E9ACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xEk7uZCFAnf2fCrMP41kRvRzNCAghPwQmRf+38mmwD0=; b=AHhGgrH0TdHxglYsIrohjZoK7H
	4JOE/HNx9PXdO2WmmJfAA7XAD11kpkrUN8SwTdirPogFjy+xz2l2WG3LMrnSPYKMQ2xneRLutpAok
	tVc1QSVEwD9yZDOns/vGFoBOF4L/qbaTZgRNuUD+dB+NEftD2zEJUwL7ORo8Qm0VllaLNXl0LkdWa
	pdKJLi0LmPMkxwX32u/9XDxoGGaBECfcbPzOekcLkXrl96SAeBnn33RPdL4WrsU0DR5Myl7Fs2awE
	gHMyCFcNDYPfsh1PuMKcxyAsHA/GRFAQrMBI4b4PcjafeqwsBP+DcTalNpBNjpV8jNKzN+lvGkUdv
	OM38CxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2Dp-00000007Yom-30bs;
	Thu, 23 Oct 2025 20:47:45 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2Dn-00000007YoQ-1aEE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 20:47:44 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-586883eb9fbso1502912e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761252461; x=1761857261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xEk7uZCFAnf2fCrMP41kRvRzNCAghPwQmRf+38mmwD0=;
        b=jMX2KCKArnQK96PfM7IXZQDvrte1fQRimiTEiKpu+MmjEIKuPQaq1zdEEyGq/vG8Eu
         xb2cOtx4O1IyVyo7apBAhQ/wtASPQH+ZDisFF/rH8z+JAiOd9XLPyabQfRJHFwtaaNdb
         n4wCi+yYLEOXWfJG1yyivhskyEL/nu2ph1Hodfjl2Z9g1+cIaRlUhDcI4oyjDfrYvjUj
         rSE73vxi+lmYSo419c+IWYGeY7Yb1yOwdBK8DOkGiI+0bFbCmyflrsnDg5+H72GBNcY/
         mbawYcC8gTIFIdYJjg7lAb5XktEqUWbFEgZzeCgOmRzH7siiriD31AtCV5l4KkS6LTmz
         160Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252461; x=1761857261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEk7uZCFAnf2fCrMP41kRvRzNCAghPwQmRf+38mmwD0=;
        b=aPrfmRaZbBQsvggaZaHfXfpE2zYUUkeao15Bn2qkFceTahjmFD/z/jlc9k6+TZAEnP
         Iw6ydzlCtdS3GiMZudF1Tyberpo6uwhSx2+yw2kHPEcY14ZuUx7wA0Ri6UujHVj7PKhP
         Knpcci+SSXJq9UHDof4xcUYbr4/KkdLamOhtK9srX+r66OuTUeNyYLQwQvAiv8dMdnez
         9tgE0C+4pV2/JQTwhKcy0w6Q8S9wBXXTMxQzxv6BqHA8AakIoa+RON0co2MwMDF3Irod
         L4kbTJn+0IIoFJstd88okWCYD+jj02tZOVPSyExpXswenu/IxALRUN8eL/Ppd7WUQt2T
         0iGQ==
X-Gm-Message-State: AOJu0Yy3Bc9ULoSEK8BqwaYAis0NJM3ieXYJjOh6Lbmwn76Z+ksr87cx
	yWlUKldCH2Lm1+7bIHFwwvwsFquYzuPXFrH4WNGaA8hZwk+Vbmv+AKVF2dl8C03PlDE=
X-Gm-Gg: ASbGncvLi0R6ewckwRs1AAkKFuR6SR6FejV3PZhQKq8qg3DS/zJEqqcGcHK3zG1HmBG
	WIjOUE9Ndn1qnYWneWXNW14qSjwVfcOzKDl/1p8DsgA+YI5h+tV889p5u+m92kJJ5X+XaCZPEOO
	QJaURzhO1Y/qiEuQuPLBjx1UeV6LNWxPu1t0UBa87RnyMI2/qZ6faUWtMOTypQgSVQDIoMR6MXQ
	POAVlerjLemA5mdcjuDx1CpoT8uEQv2Os8DlmRPQHNIvgAW3DmGosfXP0bAvu9Z/Pd7xM0K44CX
	Zh91GpUpYr7aRGfC5pKSF9fbeBHg9LU5WUg3TypIK/tUohK2GThLkLfnmHN8djbnx/k5ntEgA4J
	+3Za3+NvCJyg99B5zMOTW5Z40qLFUpfaLt8xPybCdgEVJY8KZTGGMR7Tbop8yAFJ2XrDf9iF9/s
	tGDt1ghwDUI8yp00Syio4ENnrDWmJKoBefIR9gj1iQRfHDFBT1A74z
X-Google-Smtp-Source: AGHT+IGwMXfXE5hsO4xGJFgsfpmTmf3rqNSdzlSbMAQn2rllgBG9um9BMBNyoSRoIN9+Fl8DD+8JTw==
X-Received: by 2002:a05:651c:988:b0:36d:1f0e:1be7 with SMTP id 38308e7fff4ca-37797958af5mr76613181fa.22.1761252461080;
        Thu, 23 Oct 2025 13:47:41 -0700 (PDT)
Received: from Fecusia.lan (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67dc34bsm6575461fa.42.2025.10.23.13.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 13:47:40 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: gemini: fix typos in comments
Date: Thu, 23 Oct 2025 22:47:37 +0200
Message-ID: <20251023204737.2716443-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_134743_614919_7E61E024 
X-CRM114-Status: GOOD (  14.31  )
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

From: Julia Lawall <Julia.Lawall@inria.fr>

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC folks, please apply this patch directly for
non-urgent fixes.
---
 arch/arm/mach-gemini/board-dt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-gemini/board-dt.c b/arch/arm/mach-gemini/board-dt.c
index fbafe7475c02..2bba617e4d54 100644
--- a/arch/arm/mach-gemini/board-dt.c
+++ b/arch/arm/mach-gemini/board-dt.c
@@ -34,7 +34,7 @@ static void gemini_idle(void)
 {
 	/*
 	 * Because of broken hardware we have to enable interrupts or the CPU
-	 * will never wakeup... Acctualy it is not very good to enable
+	 * will never wakeup... Actually it is not very good to enable
 	 * interrupts first since scheduler can miss a tick, but there is
 	 * no other way around this. Platforms that needs it for power saving
 	 * should enable it in init code, since by default it is
-- 
2.51.0


