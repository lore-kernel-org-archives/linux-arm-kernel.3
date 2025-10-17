Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F60CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+ezreZej8AwNtgLmDRvkBFDk/rnw6yuzZ412Fm/rQ0=; b=sLgtt5kO2t1TiKqlWqhE3+QZW8
	GpW4CzliGEG5nGW4OPc2GhN6hZ9F1AZSFcRVC30RREm9toTs7mecT82GCLA52P2y6ykMcKfT4kKeu
	8UFHVjoNrK9oNkVA7hro/j2RmBjHzIVTvWI6Mjcy756VXygi+ARJHPDVm9tCpKfOyNFu4Nkz12N5G
	M8cyrYQMvrSShsNgZPA5HdthHvD4y7DL1HlPPkKipIUBRjspbuHMtwkWXf4QxthknIzUdyyjWPR32
	tkXbGcFVnK4xo2OxQa/y6yXYWLxLnsGUukr3MxlMT5OcoMflRpO+FHHk2Q5GIHdVScW5TtvygXalU
	al530ydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n65-00000008OSJ-0pkW;
	Fri, 17 Oct 2025 16:14:29 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n5w-00000008OND-43Kx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:14:22 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b40f11a1027so384547766b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760717659; x=1761322459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+ezreZej8AwNtgLmDRvkBFDk/rnw6yuzZ412Fm/rQ0=;
        b=Bn7wyuvaDSV7C8t43hGx50Cm19uVbVdt51F8loPqTgsGpiPRwOOyEElSesy/fJDZFt
         WBv1v5sPZcqsJnHALjC8UKjgRFAJtf85lEhYQKb5h7Wfr+RMxF1jmbDM10IAlwhvFC0l
         JYJ0u3yhlbRSNfjGFd+TGNGqeRQzYWn+GpNIsKTuO6c22y7hCfCKdfLY4GlNQvtgrWu5
         Jcz+8Tb2OIq2XGy2RGLTI4bWZ4h/XmzNARzWPi7NdBlCBqSXqlkEJvmKAijzQKOP8ikl
         aVdWpwyoA8wg4JPWzWz3UF9UwXW0HsUOc7wMH/f+XWJwlWDra1q1JQWs7npRoq9RIT7+
         sExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717659; x=1761322459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+ezreZej8AwNtgLmDRvkBFDk/rnw6yuzZ412Fm/rQ0=;
        b=LLrDPABvKbZ7fI8sCyA1Mgi+sqt8YK9MlGhnKx3qhuVAo4S7x8tbdIG80EBysMKPkT
         SF/R9/jGs0oIgCfxwP8ngYyNZpvYHdqQFt2jdnSSOG61o61VBPG0ZyXiMi1ltF+zWUxn
         orujAI1qZv7FUjzmGU5bYfWKIQPYC3X2xgtLX4B3MxVLU4KmAdVcUDfF/jRIxE9EBjQ8
         ZXltbAkBB12G8WUnk6C9qoBpMPFwzG4/9FE0GJqr71FZHybVmvy9DPpQVOOew0ubxWV8
         9rK7I1Y+7PQo+7fIMYYE2kxI92bX9j8hb8bT2SSyTZtezHMysxG6UWHlyNleoV2iAs9c
         98rw==
X-Forwarded-Encrypted: i=1; AJvYcCWSJUP8JLRL2suS7gukibiYHgWrdMFL2Ogsnk/TArkKZH3DBAxFBrW2NiamxR46W5w08Mg3NO734XDtfo0WgjPW@lists.infradead.org
X-Gm-Message-State: AOJu0YwfbVx5PjBY4lPkQd6yrmmyOzABkz4XjcKm/cy24XhQhyxjLbx+
	hOMQ8upHrtnkfJDBl//jIdREuC/NckgPqAknwRHl3IVezd6U6lnvmzaq
X-Gm-Gg: ASbGnctDiHny6sVF5ijwC50qBB+5Rd/4x5+0V6lu3GbtaBW/7jtiRiqyCIvxrnZPrxO
	f2Yv1HC4ZSmDRCxgUPWtjQpOVb+7xMocWnMGcBtCgG2cunOIShENtVEbenBd4PKJ69gpH4ZAY3y
	M5VsLB0wW3aXd7uv8ojV+j3JWpUqrHqJqYFwnttN+ss4QPGVDNMnYi/gBRsc8XheOKB0qvi6IxM
	s3OBbLn3Meg6TYEbf5aywn9HRwtGZS3wSUbDQkVoT4p9ARitxVWn3pz1hRXelf2G/7kknLfChRX
	MjIN6K3KwYOs9Oiy5iiXYFhW21Fo4OI0pijUBMKeop6s6hV5oPeWhai7q9QwCRP4Y/7jyb6CSvy
	5n3+ibsGwliU6iI59dWhmO6KerOab+BtMHngBZ6fwAX5n2mMdbsb317nKDE28gOoa2e1atOiQTW
	5sxBmISPrWStmFIwgvQc+Xl+Gi7f0vsY5IW3UzuOBh
X-Google-Smtp-Source: AGHT+IGaVeu0oUJ1C7UDFeHqtgsEFDLC0C+6KDtBnxoCgNM6QWJpaLsxbbHRVuTXDwHGVCCCSflQPg==
X-Received: by 2002:a17:906:c144:b0:b04:48b5:6e8a with SMTP id a640c23a62f3a-b6472d5d715mr467188466b.7.1760717659090;
        Fri, 17 Oct 2025 09:14:19 -0700 (PDT)
Received: from ivaylo-T580.. (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036706sm9606466b.41.2025.10.17.09.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:14:18 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] clk: samsung: clk-pll: Add support for pll_1419x
Date: Fri, 17 Oct 2025 19:13:31 +0300
Message-ID: <20251017161334.1295955-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_091421_037296_D45CB3EC 
X-CRM114-Status: GOOD (  15.55  )
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
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
Changes from v2:
- rebase on next
- add r-b tag from Peng Fan
---
 drivers/clk/samsung/clk-pll.c |  7 ++++++-
 drivers/clk/samsung/clk-pll.h | 10 ++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 4700eadad..3c7333529 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -234,7 +234,11 @@ static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
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
@@ -1498,6 +1502,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1451x:
 	case pll_1452x:
 	case pll_142xx:
+	case pll_1419x:
 	case pll_141xx:
 	case pll_1017x:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 3c7575cde..04b3fe97f 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -52,6 +52,7 @@ enum samsung_pll_type {
 	pll_1017x,
 	pll_1031x,
 	pll_141xx,
+	pll_1419x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
@@ -68,6 +69,15 @@ enum samsung_pll_type {
 		.sdiv	=	(_s),				\
 	}
 
+#define PLL_1419X_RATE(_fin, _rate, _m, _p, _s)			\
+	{							\
+		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
+				2 * _m, _p, _s, 0, 16),		\
+		.mdiv	=	(_m),				\
+		.pdiv	=	(_p),				\
+		.sdiv	=	(_s),				\
+	}
+
 #define PLL_36XX_RATE(_fin, _rate, _m, _p, _s, _k)		\
 	{							\
 		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
-- 
2.43.0


