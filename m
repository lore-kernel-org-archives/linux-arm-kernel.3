Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E9ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/o/CmP3Rg70MppvTZL3UgHlhdGprRSi/0bRMfCqA7ss=; b=SKirz6+Do66z+ZipFvH+njiAnt
	4dv/lxGfb3NdMmkcNk3B22nNq0FLBXuCinkVuyejU3Y2csu4SnukwvcZPeUP4iJIVgKQEbl+l8ixd
	2xA6vOBU1wjk3a1gDq+AqsBe8n0uyCvjAvF0kpqkk2YsVhFYdh6OOzeO/pHrLc9Mg1CufEE8oLtx6
	SL18wMJgYlhgqoNizTA7bPEho67+V8GtJbDUAenHwGCmC4xb8Pb6xuYFW/c1+LOOIOqf3rJ7YJpkN
	RA3dpwiaZfNtPiV8BciAQK9LDUQF7PG80nZD8G2oCwPMZ0tuKwaVxD4k+Ip2mvtQZt7j+YCJENtD4
	1PHXqHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxljU-000000016ne-02mM;
	Sun, 14 Sep 2025 12:21:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxljQ-000000016lZ-3wda
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:21:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso2362173f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757852483; x=1758457283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/o/CmP3Rg70MppvTZL3UgHlhdGprRSi/0bRMfCqA7ss=;
        b=lMXu+G8nFuf1TfZkHsVc9e8tBVFKsVFT+flOsyRV3EI3tuLnjTUPyh++jrCO3etVMf
         Cnt6M7cijczvEIReuVP2RBknJlXPbya+KYks/aPeSEukaOQMWqp4TuAHxtjmx7ZSokm3
         WdWOLucv+CdnEOR64GwTj0IbpFs0w+oGOZVgfemrP7EjJYVb2rb2PDaHCSfxA2qRwWiZ
         nf4PDY5L4gikHsqkmxdTrKxhPVe0ee2jj0uPCd6gnJQ34kYb+fYAInlSmZIXEhZ/h0mC
         YzKLp/UGCswinVq+tc1Drqt/vd2Tp1iBAgGjHUfFz/qkBHNc/KhP8zVyxFi21Z2A80HI
         aVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757852483; x=1758457283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/o/CmP3Rg70MppvTZL3UgHlhdGprRSi/0bRMfCqA7ss=;
        b=ellZtbVqUWP5lh0NIP8AdC3J/GA6X7zpb9ly+Ryh2nwGzObn1DOnbjxQbVf2glRq3m
         bHLuMfTmEnHBJZGOo94V6zOU206Uy1iUG983Wr1LU75TwuIE4HFkE/T+THicaHX+wY8l
         YINMghvZE05JRjqD5WCrhXCPe1sRrvDR+ue6PbTev4FImZEOI3LJIWEvNtbg1MMAlzOt
         N2ynBRa0/KaffwYnBX4pcwXQ9W/r3F2YUp2iQ8XGA+7m7YF1CMj1/86w06NwarUOE8k3
         /hh71Vf2XjQGJPcv9LQs07eHGuLCtctplqv7poIlWeLdNvp7ymB1PDnUWDTXhN0c+Y8l
         uSYA==
X-Forwarded-Encrypted: i=1; AJvYcCVqcgNSlKeBvEoKm/xE8Ue6jze6HNZ3ivgYSqxITAI+8i4b5TbxUXNXtWOz04M1UNk8lQkoCxlrRQcxwJBK1PTs@lists.infradead.org
X-Gm-Message-State: AOJu0YxRJytsnWTK+Z/ekbfmUmBpKeeUTx6qsXoJT+Y7Ciw5XOVEZGI8
	JOk73tz6RjW3LKK9BQrMyu9pWbV1iygnJdIRMLI0z/V89/IivTXYNRUutqLxqQ==
X-Gm-Gg: ASbGncs2x29jNVHllvoG5WLdWIC0ul6lxW+OlrAHEgNJaJrF6LLfzOq6Jb5k8pKKxPK
	B5L1MI3GhLlmgFlWBrJ/k8HHe2PYlVOgPnGWPtuJXtbBK91qP9XU98w/reDK7s8AqYlJ/hNt+BX
	sTzq0VkI74eLAw2MIpa8BAFg/dkHGuantqZA/ksbIvSy9zXbO3GdlDem4vTH+s/YlSI6RT/Epgu
	tpFYjMYyowiq/q40rIAat0NVBiRunMnVoR/5OppvTY633fT7CAd0p5sLvGnUW7PFfonPkjCeMyq
	rrQTrXcpyH96kdmvj+DDGOqdLvR/YJYWeJzac6OWflM8C/q8k0nabr4wDObOpnPgeKsCbCf7yZ6
	Zs+OHVgf+6ouBJQL7TcbNev90o6656Rr9bqk82zMlLIe5Gsdt0gf3rgh6eisP3h6Oce/QPtcDK6
	Bdcs1NgUIf
X-Google-Smtp-Source: AGHT+IF65054uWgaEnZnjo3739WPkXpFwENVCRBSnh2RLQhMQq0qfIAS99sWpws28e4M/hCiCQUjLQ==
X-Received: by 2002:a05:6000:178c:b0:3e7:63dc:1ff6 with SMTP id ffacd0b85a97d-3e7658bc908mr6223136f8f.8.1757852482965;
        Sun, 14 Sep 2025 05:21:22 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b4222sm136476615e9.20.2025.09.14.05.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:21:22 -0700 (PDT)
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
Subject: [PATCH v1 3/5] clk: samsung: clk-pll: Add support for pll_1419x
Date: Sun, 14 Sep 2025 15:21:14 +0300
Message-ID: <20250914122116.2616801-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_052125_000861_0987B93D 
X-CRM114-Status: GOOD (  16.55  )
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

The PLL is similar to pll_35xx, with the following differences:
- different locktime - 150 instead of 270, as with pll_142xx
- different rate calculation

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_1419x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
    pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 10 ++++++++--
 drivers/clk/samsung/clk-pll.h | 10 ++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index acb366f14..6b3593445 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -229,7 +229,11 @@ static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 	pdiv = (pll_con >> PLL35XX_PDIV_SHIFT) & PLL35XX_PDIV_MASK;
 	sdiv = (pll_con >> PLL35XX_SDIV_SHIFT) & PLL35XX_SDIV_MASK;
 
-	fvco *= mdiv;
+	if (pll->type == pll_1419x)
+		fvco *= (2 * mdiv);
+	else
+		fvco *= mdiv;
+
 	do_div(fvco, (pdiv << sdiv));
 
 	return (unsigned long)fvco;
@@ -273,7 +277,8 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	/* Set PLL lock time. */
-	if (pll->type == pll_142xx || pll->type == pll_141xx)
+	if (pll->type == pll_142xx || pll->type == pll_141xx ||
+	    pll->type == pll_1419x)
 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
 			pll->lock_reg);
 	else
@@ -1373,6 +1378,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1450x:
 	case pll_1451x:
 	case pll_1452x:
+	case pll_1419x:
 	case pll_141xx:
 	case pll_142xx:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 989addfdb..c07d76121 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -50,6 +50,7 @@ enum samsung_pll_type {
 	pll_0732x,
 	pll_4311,
 	pll_141xx,
+	pll_1419x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
@@ -57,6 +58,15 @@ enum samsung_pll_type {
 #define PLL_VALID_RATE(_fin, _fout, _m, _p, _s, _k, _ks) ((_fout) + \
 	BUILD_BUG_ON_ZERO(PLL_RATE(_fin, _m, _p, _s, _k, _ks) != (_fout)))
 
+#define PLL_1419X_RATE(_fin, _rate, _m, _p, _s)			\
+	{							\
+		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
+				2 * _m, _p, _s, 0, 16),		\
+		.mdiv	=	(_m),				\
+		.pdiv	=	(_p),				\
+		.sdiv	=	(_s),				\
+	}
+
 #define PLL_35XX_RATE(_fin, _rate, _m, _p, _s)			\
 	{							\
 		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
-- 
2.43.0


