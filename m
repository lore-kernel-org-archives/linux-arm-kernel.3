Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81D3CAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5Cs1xRcXuj3YkbFgeMeQhW1EJtbYuZKXH70X0qTeJM=; b=St971q0Lg4kDjkTM5fnwCt9uQ/
	EP7NArI+Uegh9myBhPU/WMbalYBeknwDky9nkYWKQ2U+tVtNfLfB7uk+tWM//3z0TA/jFvG2vL2M8
	IWkA/G7qa2OPlme7P5N0eVtigR+5yhnByqIy2hSkROxcheXLpb1Wv1OgOCfzcFGyRGa9Oc/XOHc09
	S1L3vb/VZJ5RqWw7RI6/bgxN+ZGJ8bdcLxOpPwXNgZM9jz/TAP2ZAvt3nX9bcjqHlRXwgNBTfG/TF
	NJnNpcpyyaLBSI3ulVvpo7cIJkPvoaviz2iP+utlLMyUJ7wEiDfF1R+b2w4kfDmmPByLAA5FKbKBC
	ckEv8udA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxljT-000000016n6-1nVl;
	Sun, 14 Sep 2025 12:21:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxljP-000000016l6-2tYf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:21:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so40197755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757852482; x=1758457282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5Cs1xRcXuj3YkbFgeMeQhW1EJtbYuZKXH70X0qTeJM=;
        b=cMeIw0ssXXN2YaKmx8vtGC4i0E6Z8b+4gPTnXbcguhLyiNfHx/ZZcs/po3VtSWlIW7
         PYLtybOWnsFuq2VTC7XSA+LP0Xu9dhrM+nUI68rBANH0vAPFZQO/TaOrKq2NiIyg4YkM
         4rn8rktGD2enWCG1ygWmjC0k/9sxHV/513c6fBc0aezQWA603Z/P+kEN9Zz1clsJwo9F
         Q8AFXf28mYzynwOknB/fO+UYA90FFJfndsSxrj33Q8LbnQJXKLO5ko/Jf+RM5iVwRQbm
         sG6+9FDHd/bR/j65ys/goScbpohGLBGSRLw0GVp++sQIQyAg509YW4l8nqlZTzRkrjf+
         45Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757852482; x=1758457282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5Cs1xRcXuj3YkbFgeMeQhW1EJtbYuZKXH70X0qTeJM=;
        b=kHvxfGHzJKm514K9Fi1Gcg5AhTIK1QsZ/1SoA/lrrjIxYl6D8BZ0y2qEIKoq0n32G5
         FnCRPYyhAu6AW9bb0JW20nEYWWHro/RwKYa5dUaYqwgIBNFV5St3uJOHTR8ZSIQY0sIe
         QWmDWLhqb9AO/7m74wu0b6cr2jkGHv1lGqAQkzBQJq+j1m7RuClkBrSkzbhJ+eEvGHMH
         MhZRoSf29KKDt1klFz4dU9ipDu1pYzgCXzIBsSXFj5dqlQVsXdFExji2q5KoIU3+Ii8C
         tHjcGpn7vofJ2Y8FhGdlb3xBE9/tNANCWa03cfxeHvKKDkzmwj27fcPm2Pq8bL22nPea
         lSrw==
X-Forwarded-Encrypted: i=1; AJvYcCVdGcGxDWhRcjKc9YhS9+ij8IJV+v08cdLo3JJZFUZcCU0aTCJnpqFDLhoQ9b/Yxiacf11ScuvFOxONEfZE0S7Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxRsNJs+NijCZfkIk1WBOQLWjVkKLQzMkP7mGZDNj/uZvro+xxX
	wKEpV2ebIDPvIKnzqHi834pOujcekz1tfWnUk4vUdAMWwmOD+K2xW2UV
X-Gm-Gg: ASbGncseMFNs5aWJ/ARepQszHXhJ8NgsAZX39qAj8XsEGxBHeqlzEWeLcnUorPVvQLn
	Fd47xDfZgTDCWbZLKYC8ZYyK0/PJhVxMW2vrEdGtkCUtRmKoLphnidjecfQxnokd7uUWlUWNU6X
	KefXMVzaOBMdt3fnJieDSU3qo5MC3Jzm0VIIAq+WM8tZEpeCL1ESx/uXUdTt46K43GdyJu0Y/tq
	RwbyDONVPhDr34pOyXq3V3r8ognsBsTWWtsWsNJuiLv1ROVJnbl+nRyMGafJog1JqWjvW1qzEym
	yCqeU+qrYIFAMYWvwjXFgvQp0bi2Y15u1Z/8W3IaDpHw9QJd6wFQ255yWn2fAGe3WP3lMfpD+kM
	8lG9xo3VIsVz9XFR7drUk56NoBdjqvEyciMXHlYWgswy+KBwLaVx3g6ucA3+P7MiJyn2NYncvYg
	==
X-Google-Smtp-Source: AGHT+IEfqFGxuOfmlhhwGv7U2npP5G8hBTAO+yZ39G5pkt81csfwpQKDYYEI4//RmCbaAvablIiNmQ==
X-Received: by 2002:a05:600c:1d0c:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-45f211c9bfdmr70100835e9.7.1757852481707;
        Sun, 14 Sep 2025 05:21:21 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b4222sm136476615e9.20.2025.09.14.05.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:21:21 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] clk: samsung: clk-pll: Add support for pll_141xx
Date: Sun, 14 Sep 2025 15:21:13 +0300
Message-ID: <20250914122116.2616801-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_052123_742792_128914B4 
X-CRM114-Status: GOOD (  16.30  )
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

The PLL is similar to pll_35xx, with the exception of a different
Locktime - 150 instead of 270, as with pll_142xx.

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_141xx, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
    pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 4 +++-
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index e4faf02b6..acb366f14 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -273,7 +273,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	/* Set PLL lock time. */
-	if (pll->type == pll_142xx)
+	if (pll->type == pll_142xx || pll->type == pll_141xx)
 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
 			pll->lock_reg);
 	else
@@ -287,6 +287,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	tmp |= (rate->mdiv << PLL35XX_MDIV_SHIFT) |
 			(rate->pdiv << PLL35XX_PDIV_SHIFT) |
 			(rate->sdiv << PLL35XX_SDIV_SHIFT);
+
 	writel_relaxed(tmp, pll->con_reg);
 
 	/* Wait for PLL lock if the PLL is enabled */
@@ -1372,6 +1373,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1450x:
 	case pll_1451x:
 	case pll_1452x:
+	case pll_141xx:
 	case pll_142xx:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index e9a5f8e0e..989addfdb 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -49,6 +49,7 @@ enum samsung_pll_type {
 	pll_0718x,
 	pll_0732x,
 	pll_4311,
+	pll_141xx,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0


