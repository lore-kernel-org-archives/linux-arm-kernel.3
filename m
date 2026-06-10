Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ECFCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=; b=ZCJ83ibtI6HdkTm5OLvHgQsg04
	0ZXUNB+dr5DY8K8yH2aIgZ2vivtUkkJxJ1KwO7eyro1q7jqV3WNJooyF0ZRvnFvmm7ARw9oBQe38F
	ZffOfY6GAADoK2Gdn72LcVvJoMLthwMwO+clw2wo/c0BySV9rl3eeGN/3ikW6sIarHHWsKMuRLTVK
	mVl6uj55YxB0AlY55JhK6XDqcRha24u7+uJoQnGalvVlQNgWLAucTcvMvwhfMvBvVkOTagyFr2RQr
	+Vwel+62sWF4g9frVbvBkimcQ1Z5CNCl6GIRbRTW7rpJAY99UDbmXinDDIPu1nvmmPHzkk3gjs4th
	+9JCRcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPe0-00000008Kf4-3IEO;
	Wed, 10 Jun 2026 20:35:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdt-00000008KYt-0Lzc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:35:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so59040335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123715; x=1781728515; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=USfwG0CHNrhHg7rBgWrj3XNzQoQIEob+gyOkL+MYcyjpXmjWdz25RhnGFkPGBGF5hy
         xGFQD4n4OHZv7fdsBwmf+J4Z3dqNaj2f5FDf2rPLPIZHAjpY2Zf6KpQ8Vr/WGTtNJbif
         77mSqybTo7zqE3SwvaBfhTL/WWWX//s2ng3FQd2rnirsEBY+VEKiOg9Rh8Kdka4bcelN
         dra5o6iJUU4Pg6ike8ZOvQ5x3hGiYj531DqsQxdKrsvSwx9TN66K/i2paQzzAG8wt8TS
         R/dMjg0sFobg3EmIu1CJvJ0wnUQEhynFZco0ZwngtY/hEg7DNnBh+jEDTBI/4+9BdTcu
         U9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123715; x=1781728515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=FKAzkI/z91CUhdJXby5WXT2/hrHH87Xjb8vy4v7vjTvNC1ELGPeNjePy2kR5u3vStr
         roT1t/uOiqX6izXcaDWu6qnV5LlidKBR6/orR5Er1gd9iD3KVHQ3c2PeZ5s5GbfNIsnG
         //isGv+qyDvNXtbLf+EMy6JLV8I+dsJliyJQVUprCUVDFEBNt3vVM50/c7CIIsQZ/qMS
         BFZmfOKL+Z0m0hDYUBl3+Jjww7yISYS2wcvK8zZhFVQZvny00Garz+IfwhkbsjCWidUT
         6LfKj56k8B/Cjt6YMVMn8sO6O4F32OS/kWUdpdQmjstyr1CwyVb1s9nqyOndkNRyakVO
         tJWg==
X-Forwarded-Encrypted: i=1; AFNElJ8YGnf4YwwPkqas4PsyXi4CvWkeCjGqxIuMOyYqSt8bgPD/mHZ4RG2JgjY9I62GO1JiFtl7laxk4i+JIK+UoXv3@lists.infradead.org
X-Gm-Message-State: AOJu0YzlcKRijQJysZthjdsS9Jpavf8eVFZ+yaiOT5cNtICEY38LOlus
	WNsfvoEsEb3Vbac5vKEg7VF7+d00h9Z6O2PM/C+bKuAz7Y/1CgEUahOL2WGA3pZKgeA=
X-Gm-Gg: Acq92OGh9LgRgJiH6GXtRNK6s8sN7fgUJ3sm8HdV7CaM9ncdcyMoLU/FM/1Qe23Epl/
	rNxgiWYtue6FVVcqUaLCLCyMer05cr1o+TJbBgm0kxH5qm9A1JKOD8dYGSaKKpfqtGQFfrAASuN
	LYbY5D/kNeRYlQhFZsQ+Z7PLprJiKH9eRh3idLFX7rBi2/fw6FocvlVDZ1qbePsXILwF921mPeN
	N6W/KDhdYBUBhG/EGgUhokAnwKWSgsCLRNWqdfb+SIZ2xFsifOU/tZZx+MlpShP5MIP3PRBTbDI
	3VS4dUfDH1ZATgfPHn8GeKUxrItjQnrFl0ToCp6vpyq84C+8H1GfV619U6z/qDalcV8fq0ya/+k
	xrwMytaevuKG3Az5TyRayX+gIBmg8gpEe82y3Xe4KOvChXWYEYCN4BPtlmXLa6yzHb3j1Zw9BVQ
	ES1hVQZ+ez3PrONqWk827TXQASX8ugQdL79YOTyuJ1qg==
X-Received: by 2002:a05:600c:3e0f:b0:490:ce99:d2ee with SMTP id 5b1f17b1804b1-490d72058b7mr116681095e9.15.1781123714768;
        Wed, 10 Jun 2026 13:35:14 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:14 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:09 +0200
Subject: [PATCH v5 04/10] m68k: mcf5441x: add CCM registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-4-b76b83366d5c@baylibre.com>
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
X-CRM114-CacheID: sfid-20260610_133517_170549_971D7563 
X-CRM114-Status: UNSURE (   9.45  )
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


