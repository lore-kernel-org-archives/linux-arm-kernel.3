Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF139E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=; b=Ez6bWxEkgunTtOIO53CUFpC4ag
	1efkzjkHOKJVrrGA0CJ9yx2ojpWI82VuUlQjulK9kdgd+9cNOyemJWN4Fo3sNSQTWxRt7GE8TurAi
	KDAkxWJZEx+r2LH5nqZTnC/uAh5TiXE+K5VCAdtmLcWQkuMZ5wbDHAKE4lFkBZgIfrdI4Yhjtg7XP
	U19CqEpW0OTGE2NgJlSNAiTm6nRRMy8K4cjgVnf0AjBl1QLmk486Wjgj/f3V9gOqAMXmAauDVJiFz
	yGPYb2yuYCrLVIgRK6ZAVNIKz1X4v1+UG5HN3LRdWpMAc6/gWx41rNPyrkpBHCHFE8auXV6WMf159
	K9eVuI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXd3t-00000007vrk-3I7g;
	Tue, 14 Jan 2025 09:18:13 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcxW-00000007v28-2vXf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:11:39 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaeef97ff02so853339366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 01:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736845897; x=1737450697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=TSDpWa76Ng2oxuo9Y9RewsYObYaUZE/zuAhAvtBVbmR9mVdom/3LEJfqzYReTtYlkv
         3mGxFhbR/iwOYYsgPuxggc0m7DwPnFc7mQxCbGKbDle1F6hIMAkNl6a+MPcM8sRn39Vm
         eUT9mmImnkTcw2jzq3RZE0IGZSG95tR2tyhJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845897; x=1737450697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=IAJ+f2oodFjfiJ3FNvKe3zFkwXGfrBfjCEnye4aSBrp6OenW6jhw2ldVhaYY/h3SSq
         0effamFAPziklOnxWy94NbDmc+FMESU/Q27ZwZU1IFK0CGMEAu/KXjEHnRCIZPzKCCkO
         1F73kj//SlZIDJu8tiKfl+4oJkgrxSPORdu3LtOs0oO2NyYvwUriAkgRXAQMcOXwNR9K
         4tGGNhGdzjY1ERpEMx1jkbTb4hZNQrA7nDAMrfGoUzp+bwYEuwfdWiclsNj2YF83N1D9
         6pfRFa+C8zbxXCrgHyiDQ2PcCzDWFWYWguv8NiXUW1/SVTV+iT6noe8q7/BqlBijNfLn
         UwnA==
X-Forwarded-Encrypted: i=1; AJvYcCVRYFODWGUb7jWDWFvEo9+5VwVa7/EoiGA268UCV8V8k4owpxEzkHmD+M7bA8aOlGfigPVz9B9YKjPaRcBTcNm9@lists.infradead.org
X-Gm-Message-State: AOJu0YzBD8lZYyxo+AwlWbG40gZbW47g/4DrYRKJ2YXqkpAnsmiX4VvI
	osuCDrTsr7dINXWI+4S0R68hGs1pS66WSIfrABcfPhOnQNR9Qo0X8wYNd/L3Ae4=
X-Gm-Gg: ASbGncu0WGFxVje9YFWtGUU6ejyxWlRsSPhcgRttfYEviYGRSgH3/oxyDxVYlnxiRyR
	N2Pn6tyk+KlkdL/pWH+tR9bl+F5ErpiXYH5uk7Wr1XBzBLZPTtrSY0ogN2pR/VXqO9lL0tQqeyF
	zPUryr/r2JABm7tX48bao9bcoYaG6hTPlxN+pKJyLSGamOkBfE70U8PcPhKRbxTMgD0N9PIUDKl
	GaUGm56io81RMaPTAhfZPMEamcIZgl75LKQJBGsZPgfIw2/dELCvEVgBe6s6RATkoFaKFM1Uidd
	gJC0zFmosUtAZIKeD4rBQA==
X-Google-Smtp-Source: AGHT+IFg5688v9iu2Z6jN1GBfV5nDayopSS598535VN8IIxu6UQsTzwr6yLMykzma1EPL9vJgQo+tw==
X-Received: by 2002:a17:907:7e95:b0:aaf:c19a:cc1c with SMTP id a640c23a62f3a-ab2ab6c6625mr1898191166b.22.1736845897042;
        Tue, 14 Jan 2025 01:11:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b7317sm599640766b.154.2025.01.14.01.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 01:11:36 -0800 (PST)
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
Subject: [PATCH v3 3/4] clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
Date: Tue, 14 Jan 2025 10:11:15 +0100
Message-ID: <20250114091128.528757-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_011138_733283_3733C64D 
X-CRM114-Status: GOOD (  12.45  )
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

(no changes since v1)

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


