Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E3EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 18:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=; b=X7MuHcPsMBQ+cztCdzA3K8G6h4
	x9BMlmvSVUUaNpagNrt/Tp/M7RQriEqVoAL7hLXglkmEIbsHvKzJILKGOj5ncvO3Cto/+DqzEoDBC
	mEnHLxjEJhfl+lM/NvBjxjXx6jIgE6V/O1hgR8snC7B4USyFDJ2qmaxaar1KRVUyeOLY9DD0yUXGF
	vT/0GVO53NlVMr3kt8MuUf7PkG2bIjOJ5ZDXbhNQHdYOPt00hk18P8n7x3kdC6tubBDEqCYmw2vPc
	jHI2NwUspITfjC1jVXS+TI2Ju7aCFJjKO68gYUnbF84GmEkrNeY8yzXNUO5DAHcNLBgZ5MydabTXT
	M9/P6+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlc0-00000009PkT-2guK;
	Tue, 14 Jan 2025 18:26:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlWh-00000009OmO-3vRO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 18:20:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436281c8a38so42006035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 10:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736878830; x=1737483630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=qThjb53borvrNAQmBHbcBryCXUKHTTlnj/H8QXo1rYZZ/QLwWIBVaKZKKWIJVfHjXK
         T3mwJsdfiEorPGQSVAyPjS5buU8MflyrEbTgKr1xJh0jqP3mrt1Sm47aJY8RGEdnEr1D
         WzWflmKvRwzov2a+jAflXbZAEwdRWfP+2G348=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736878830; x=1737483630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PuckIz6TtMrm6FhKB7AMqxRoyDL7dpmszhuAU6edRg=;
        b=DeAe71b9vN7GKJw4wujQQWkBHS4CK6h7oM/WZsevcYyKIUHSpOC4YR/s2tmTzO6tTI
         n7aNcGOGSc7R30QlRw/kU/IWhrJo3ruaALSrST88fmFZwGuX0adfZgCJsH1wKskiDwsZ
         vElSaiUfnkEgkC7OLZHYMaN7v9Jf2uSVO5MM9bkviHKFuiJnAO8QUnq5Jzi71wuSFFYB
         i+NYJaRl5hPH/DhguJlW9EGNkZOLzw0CYcJEXd7ZwxW9ErPTe1w3ogsnpMnsHewJioW9
         KBFMFaULzzN6dfM0IgU8L418zM7EkSUxlqMkKYq0qY+8j5CGOra7WkOj5/3y7fgG21xe
         PE1A==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZpQZmqHaxTb+yHgE7QG4qsTYj/q1OgMzhVBD1skTI+47oipWUxzGrNYzZjgeYBDzty6I8e28KgPPf7aNkemj@lists.infradead.org
X-Gm-Message-State: AOJu0YxkZ+iRQN5SDHIoeZt2Ky/67QwKy6a6aezuPw51xewL4bpwLJlg
	7EQfejDIkmbtxJD89qp8O5CUf49+AUJTMmMBQ9214i5DAYFGryIABcx5ddHmcIE=
X-Gm-Gg: ASbGncsBBFLfw9qp2s1ZT+7Ajl1ziQH/fvMZcz5M8nKFeT0z3eVfYfrTzs11ivXR3Ou
	SKsEag767N6ouQ1FESU3ki/uUcYM5tBJk4EyvFnTDlJdNAUvYuBdkdPMixiP015dKmR5tegvc5O
	sf4Yc9jYbD26/NHQCZAqUh4rUnSNMEoMZ1F4mUoFCHVGC3+etCYEG8ZvQWUfkKC0jOa+almAcpL
	eyludgG+Cu9OxpHm0+bHw+gV0GtXAgd3k7B8fby+bhiTozQ0ZtEOjZxbp5z3bW/5yFuww2vloEw
	0PLLIHO8HfPdcu+GpMRxOA==
X-Google-Smtp-Source: AGHT+IGg8Flgcd5l6IUz8p8YGCesmVvDp+YPLJXbTETLgCS7syXTYsMMOkRNhniDeCoESET8hKOsHw==
X-Received: by 2002:a05:600c:4f0d:b0:434:ffe3:bc7d with SMTP id 5b1f17b1804b1-436e26ba521mr286846075e9.16.1736878830386;
        Tue, 14 Jan 2025 10:20:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38be66b01c7sm278970f8f.22.2025.01.14.10.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:20:30 -0800 (PST)
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
Subject: [PATCH v4 3/4] clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
Date: Tue, 14 Jan 2025 19:19:48 +0100
Message-ID: <20250114182021.670435-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_102031_970146_A7E7A653 
X-CRM114-Status: GOOD (  12.17  )
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


