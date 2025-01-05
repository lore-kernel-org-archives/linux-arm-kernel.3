Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D89E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 18:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCWum8u2aSE0H9NGugk1g+nl+FSObYpFAdsp0A4AhFk=; b=QzpDS8GVueXxFWIaflL0qttyU0
	6AlDouKOeMc+gCaYeSVkRh7pUd8CweWNMCUcRZn1NP15KkFJsDn5Pj2IgjlaYTqj4cxJIlNzY3uxt
	zLqN+AiEXBKztNC6AIGsMEaq3ncO1BjhuJqyKW2J4CG4PNYUi9Vks5CI3ZSpHjwkaiMKnKzTxWYLP
	FwB0rCCMW6BtzSf/C7pSL0034HedfLLPXC5+Jie1AsbCigRht7mAzMPFtb9uCF4J2CkWWUUN233Xb
	JGx2brW+RtZ3zXiKzo4OQ/ad/5ewh9OIvbmReucpc8HzrWS902zT5aKIvuLFAJ+XNvsyQ2SPqfGTf
	/mmMRzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVGt-0000000HFjN-13pO;
	Sun, 05 Jan 2025 18:22:43 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVA7-0000000HExB-0mNW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 18:15:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so19561335a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 10:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736100941; x=1736705741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCWum8u2aSE0H9NGugk1g+nl+FSObYpFAdsp0A4AhFk=;
        b=XXjKzpUgz9Sv9bFvK2CR/nLUyBaL0UOpGpes+TWK1qcrR4iEkUMI+W78iZ2QXNM4Sp
         LdOUBxHGvZDoGHJ7DRs+Pp7Kk7Jg+8CXJQKfK/HW1NaqV/EIF5W9zyr2B3sGs2JuWuGp
         XDzPB7Gla5ldOuJ5TtbEQCTUSeYLQRL7nROcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736100941; x=1736705741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCWum8u2aSE0H9NGugk1g+nl+FSObYpFAdsp0A4AhFk=;
        b=v9SEHll7kgmOThTRyDQgg+ZkOV+KLRl4lioQpC18P1VH8WVHBJvZ/liXbe9k+m7kao
         ZOQrf5gD5Jq4MSmihCZsnvnb1el6SIJuZiM4vgFRKCvVmfdMAhhksLf059Wa4GWPTcgH
         DBWOR/r9D18cbxHIbtOkTGVS3k3Ko9IqhdjjmzhfTrAk4N/zYO/uMmTyj/5Z0DHIr88Z
         h0+AuGCl9CQvfQmH5glyFF1Fe/ZktsYp51mqPyg9p3Cy8fMLznMFEKzLj+7LaZski2m1
         T8qieN4sDQrML0n5z2GecC84DwKJHEJcuW9+QOAWVG4qoD3MQKKly2EfDMXa8gCeiBiQ
         cT2w==
X-Forwarded-Encrypted: i=1; AJvYcCXeX5AMYiIeTPPXtVGlygV8wAxyebyeEq3vxDHQu2HubX+in82+CKeOKjgb+lGEjiiTuUZ6TOU4NZjgXv34xlvx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz+1CkGfkdxp8HgaWE6IxP/nB/JjgNjOOmZWqPDMm8NWyhn0uS
	2kGjBk+7AaLV5rRU3k2GlS9FNHRg28Ly+LyY8+GWaY0EB0JbfS/oVNmEEbNNrHo=
X-Gm-Gg: ASbGncueTMiGL9L0SZwxGxjSEMrc1i0lrcRhV2HpBl+HRlxFG8kmnVO4weggKE2pGHo
	B50npT2o/jc7+vEfYk0jt8PpcVWWev6cL8RMX8xIxPrsHWMiLfp/6GU/6GD2G5QQFkayQc4lmsI
	LE/bliephkqJmmRCZIAYeqr5uBtdngvwHSgMtDQ9delkcNWaQHuRXCfQ/kJ5uhEv9mbM+vWNHOk
	XY0hlSz5pXt1w0ofNjwGlGK2RsmjpFraRWTv7gEgnJ5ZOLyYwfs1PRhx3EvJFib90rD0QaqwxBv
	6bcN8Jr7LZ409MVPeSWJaVWLOTokxjn/tUFZUxIzPyUpK6nU9SOhC38c6bWdrCr6Nw2quBQZyXM
	dK2B708XzSaZUkWypGw==
X-Google-Smtp-Source: AGHT+IFeu46e7LHQ6MyNCXFCxnHyuX7vCIGWrO/EtiZn47VacrN5DdmgWvSrKWY5flVSdhQ2UzUVwg==
X-Received: by 2002:a05:6402:540b:b0:5d6:48ef:c19f with SMTP id 4fb4d7f45d1cf-5d81de1c28fmr134000185a12.29.1736100941394;
        Sun, 05 Jan 2025 10:15:41 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 10:15:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 5/6] clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
Date: Sun,  5 Jan 2025 19:14:17 +0100
Message-ID: <20250105181525.1370822-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_101543_233702_DEE1E24B 
X-CRM114-Status: GOOD (  11.99  )
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

Use GENMASK() along with FIELD_GET() and FIELD_PREP() helpers to access
the PLLCFGR fields instead of manually masking and shifting.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/clk/clk-stm32f4.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 07c13ebe327d..db1c56c8d54f 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -5,6 +5,7 @@
  * Inspired by clk-asm9260.c .
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/io.h>
@@ -39,6 +40,8 @@
 #define STM32F4_RCC_DCKCFGR		0x8c
 #define STM32F7_RCC_DCKCFGR2		0x90
 
+#define STM32F4_RCC_PLLCFGR_N_MASK	GENMASK(14, 6)
+
 #define NONE -1
 #define NO_IDX  NONE
 #define NO_MUX  NONE
@@ -632,9 +635,11 @@ static unsigned long stm32f4_pll_recalc(struct clk_hw *hw,
 {
 	struct clk_gate *gate = to_clk_gate(hw);
 	struct stm32f4_pll *pll = to_stm32f4_pll(gate);
+	unsigned long val;
 	unsigned long n;
 
-	n = (readl(base + pll->offset) >> 6) & 0x1ff;
+	val = readl(base + pll->offset);
+	n = FIELD_GET(STM32F4_RCC_PLLCFGR_N_MASK, val);
 
 	return parent_rate * n;
 }
@@ -673,9 +678,10 @@ static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	n = rate  / parent_rate;
 
-	val = readl(base + pll->offset) & ~(0x1ff << 6);
+	val = readl(base + pll->offset) & ~STM32F4_RCC_PLLCFGR_N_MASK;
+	val |= FIELD_PREP(STM32F4_RCC_PLLCFGR_N_MASK, n);
 
-	writel(val | ((n & 0x1ff) <<  6), base + pll->offset);
+	writel(val, base + pll->offset);
 
 	if (pll_state)
 		stm32f4_pll_enable(hw);
-- 
2.43.0


