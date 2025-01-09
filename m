Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED6CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=; b=UhRpwdE7CL8nISythzMWqSGY9e
	8GMWJ1jaQHvu14JPCYobyhSLh0oB7DtjHH7D9JME2X35+QFyvnTHU1qV0II2g7SCkoiV1rsuzTZXT
	I/a0ZG4RgG/HlO87XtXG+R3A5u+exbYwLl+6NM1DLm3C7wO+UspH7Lpx1xnm8VobTV78067XusqsN
	Ey8OyIMePU2PnLwihK9GhKoQhd9JwYoyt6oD/dX+2N9l7N2jYHUyew9DwMjH4BDY3L1Z7j6Bulmrk
	ww+odM9hPZ64/mysyfOrQXpHBZTU/Rj/uOH2ettN55QywPMu+xfyq3bXX74OJhnIHCtcx986FkdJS
	zsxlcJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW00u-0000000DMBE-2rVC;
	Thu, 09 Jan 2025 21:24:24 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzw2-0000000DLR6-0vTb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 21:19:24 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so1901215a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 13:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736457560; x=1737062360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=LX+2H3LLYnu2AN0MkIxc/iqUuodj8JHi3RJImC1UgZr0HL8PWkUZ72qcQRugto/MxE
         6pI7DnGn/VltgUOep4FH00lAYgy+4T0wP/8XXxehqmLFW7sHONNWuTKDRt/807a2dYiD
         yaCw8+eXMH1NmPxeSa/n9lMNK7N9qfVQpKPM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457560; x=1737062360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=A42vvaYX4E5Ks2KkXkNFbb96h/V3yskAQb1qBhvwKE9wBKWwtFZi5yDIgvdEDunAoW
         S93E+7CaRFRqaodzBGkHbdpTaebMJXozoXCS3vomd0d2zlD/lJbCuz+gGXYykrwQCp3U
         BzE5hIpVZXaeTqNc+DJOigcjVVx/jmUi07GPcWSLnASbfl9rrE2EFzuU6A2g1rN4CwjU
         btebA8eCTsl1YzzuLADit9ousg/eE6AJgruKTDb0FmZqNRPVnon8sLIWcMBffPz5MmQu
         lu9Jj9J6DF66MAiopWgxtXNcZ2EhImBm/ZkiX1j3GY2VD1ng74hI3cD6vavEAAMtOxen
         ZuSw==
X-Forwarded-Encrypted: i=1; AJvYcCWba6//y3B0lUYv8XBPR5/ud+XqMTtsaV6DCM7n84qANZJmKjjzx7x4cfGuC7DmJJAWAYNuNmb7bY3J1GuWzBw1@lists.infradead.org
X-Gm-Message-State: AOJu0YyA6TPYJDrq/UUvDVuriHn8l9jOpVq5oCF0k5uPKGFAThT4tEG3
	hjL56cSZfA31gOxCQeGbJEmzQBIpGIDeBm/X94Hzg0mBWDPWugMTBy2EZiU2sxE=
X-Gm-Gg: ASbGncvYTNMgpUQnWV4zT1DCCwR0RETiLcj2aPIcP1xJgAbctNyvdcS2a+2iHIp21Jg
	/TRG06qU0Jh7/3D5Ai+tYqcQ8VxCFSals54evN14rtEpBzLvJ8YYcW4QAUqFF5I9veHazowf/iU
	yz5VyPNDbam8cF8t/wuXD8qaD+X7a7Jf9wi0R48HuVEEkX7VsblBxjC/SpaImLEtMsPj3RWcSeq
	CK538EFVIc+ylNUdEWSM00Y0eYa4eTzawreZNSH3vS4ZVkV0Eba7+/tQDBQT6DwDQqCFqOx80xV
	2ANQWtkj2NvL89T58WtiMxkHb8N2NbocWB2jEyUI7RObpj6JZ5YVzlmIxoe4ZkWvR6zrUDh3q8y
	6YhohN5FzHRYv0uKKWw==
X-Google-Smtp-Source: AGHT+IEJwiab5POVdxFq+KPMtd+AMk6FXjRfRzUyO6955YIp4KLeb/nmZtME/YvLjxsDXy27od+mJQ==
X-Received: by 2002:a05:6402:400a:b0:5d2:7199:ac2 with SMTP id 4fb4d7f45d1cf-5d972e00032mr18870795a12.2.1736457560441;
        Thu, 09 Jan 2025 13:19:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c4b56sm925567a12.32.2025.01.09.13.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 13:19:20 -0800 (PST)
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
Subject: [PATCH v2 3/4] clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
Date: Thu,  9 Jan 2025 22:18:30 +0100
Message-ID: <20250109211908.1553072-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_131922_260307_9F5DFE47 
X-CRM114-Status: GOOD (  12.09  )
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


