Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B606CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 05:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LoS/AHTeCtpWKc6PkMtF6EkZQfXCl5pc+5m7F4o70U=; b=2k2GES/FIpRCbPv0WCinG6i/CN
	AqnC/LrhPzq33GvNMa8BenEWlJBlMNYynXQMRl6iZiwQtP/1LfcnP15Y17KiHpBU9sQpWQ3YwReSN
	KtvPa09R+oRuRZyb5h9Kr6XH0Bs7i1rlTCCpKfk6Rrys1OxEjuJH5pGJO7ljetzKxNSXzQUot+HZH
	X6DzO5fTEGtT1c3ASYa+Be5TgbiRkE5jVjPJj5b1fC3e5U40qmQgZtrFlDH1AeYNWBzVpygQ3mgi5
	nDTBn/BURCCuWtz96s9NwihJl17OHJSgWRt0qDporAHsGsykyeh+JK7487Y05d1yo1VtT6jMOTPIl
	bL12Wo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2aT-00000001O53-0EX7;
	Wed, 13 May 2026 05:56:53 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2aP-00000001O24-0Wk7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 05:56:50 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c80167f56cdso2570403a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 22:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778651808; x=1779256608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LoS/AHTeCtpWKc6PkMtF6EkZQfXCl5pc+5m7F4o70U=;
        b=KEtKaW9xocH0AbKoiimdqdQRcS/cHC5A3d+usXpZ6jbzqAihYZbY5L4sSxfXrt+b62
         Xl8YY8Oak+Jdz2hV3F6Z2RAXNTHJoz+I3hoZWyvjJeswdCeHUhHiKXUublcd8XB4LCNc
         6i0vYpItF32F6msrWGbAKmkQaZTwzXJOgHb7GzFqJ3WYcJFTXHQfj2ovTTv+6HyLqaaW
         +ydsxfL91WZnorQi6/e3OLG5Q2vHKGzA/jBPLAnhrhEV0zUflGujIlVnstv6aCys8O5Z
         5N2jlg/qXkdUTfz5uBenYsskh+gXWV6MMOrLmxRhFWrdUIyMYyu8D3GcRxUPVxj49GeZ
         R/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651808; x=1779256608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/LoS/AHTeCtpWKc6PkMtF6EkZQfXCl5pc+5m7F4o70U=;
        b=sloseCJZZx6fldjBDlWGRd05okFoBdWMH/Td55WCUNC/lw1u9GRv7MGXgkkSVvcfxN
         mlaCLRaKgD9RunA4BHHyYZ06VjFnv7Oe1FuhmyFhzxpV/g5gAeMg0s/w+IUJMu4PPcIO
         Hw9LJI7awRv/P8I4yVs9AoE4UmYVC7OAn6sNCDX7fxwkHEYsalfJuzK3fpmtSVv8C7VH
         +2ugqX5O9U669hcK1UjdVnRN3SsGTVXoHKTF33OCehWd5Xnyq+/Eal0GJuC1M0PbjCXe
         PzLXwVH+6wowGfwwrqgVO3DfnjswymtvEGZK/t3s154DmX0bemcsY2LToIM4LbEw0FFE
         M1LQ==
X-Forwarded-Encrypted: i=1; AFNElJ90k1DcbHuBGZ7frjZUTYpC9vsAMgza+x5pEWuqLkuJ02Nv1AqhjSvIrwIchVy6HI3Q+3TX0BHuw26JcOWGxpHi@lists.infradead.org
X-Gm-Message-State: AOJu0YwOerw9EErzDPeRkO1INirs9gJX2p0r7928Uz5of782q3QcVqtJ
	/qu4cTiYtW77SWDLNyZTPNy0peuM4P47N2UaaPRBmzFaO+c3uQ7/ngYw
X-Gm-Gg: Acq92OGBOUdMeVAkUJnK4rMmqJjgG47xrz/PFyhywzwDdDtunD+/6vSmvUeFm+unNEl
	B4k42QTp40YvpYUAH6HasNo6CSmt1nQLrH12Gw15otI6M5+YQLVFqB/fCRMVEugFr05quUVdkSw
	5QvyTsWaZpSqK+JyjdeYB2QM9OYZsX/wC1ipX6W9sWiaNDq9iEHkTXWjB+N4g1JfkVT6z3BhoWI
	FVkP2M0svfhOlirK0jlp067pOkyqQkSxCW9v0xpPFIgSyiOX+0xINV3rMOGW+MhfuHyYzhpkyMk
	mBZ7jRCg71cpEblnkdNCqtPT7np7dL6VO+23IHP7jUznZifYug9kRLcFKMr1dObNasyjJFEy+M2
	Wk1oBX+SnpkXFt/tKL0aDPsrUNGq18hwNbi56GoPbXzIZkMOeo86DQQUF7mS69j9x5DU8dBNOWT
	kFobKsTeknfpikc37iarAXKUfyGi9fOVKvtUBk1BXrgiGsgGAm+8BI0BD+ZgCfHYjPy8sBN8BG0
	LtBYKH4F+BAYi0odbl9/3M=
X-Received: by 2002:a17:90b:5688:b0:356:22ef:57ba with SMTP id 98e67ed59e1d1-368f781c7b9mr1480053a91.7.1778651808190;
        Tue, 12 May 2026 22:56:48 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee32822asm1785492a91.12.2026.05.12.22.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:56:47 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
Date: Wed, 13 May 2026 13:56:25 +0800
Message-ID: <20260513055626.1070533-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513055626.1070533-1-a0987203069@gmail.com>
References: <20260513055626.1070533-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_225649_167658_A7132101 
X-CRM114-Status: GOOD (  13.86  )
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

PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
The hardware fractional field occupies bits [31:8] (24 bits), so the
mask must be GENMASK(31, 8).

The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
as the denominator to obtain 2 decimal places.  With the corrected 24-bit
mask the old divisor is wrong; replace the arithmetic with a proper
24-bit fixed-point rounding to 3 decimal places:

  n_frac = n * 1000 + (x * 1000 + 500) >> 24

The +500 term provides round-to-nearest before the right shift.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index bfedd45bd04b..7e6b30d20c01 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -48,7 +48,7 @@
 #define PLL_CTL1_PD		BIT(0)
 #define PLL_CTL1_BP		BIT(1)
 #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
-#define PLL_CTL1_FRAC		GENMASK(31, 24)
+#define PLL_CTL1_FRAC		GENMASK(31, 8)
 #define PLL_CTL2_SLOPE		GENMASK(23, 0)
 
 #define INDIV_MIN		1
@@ -113,9 +113,9 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
 		pll_freq = div_u64(pll_freq, m * p);
 	} else {
 		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
-		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
-		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
-		pll_freq = div_u64(parent_rate * n, 100 * m * p);
+		/* x is 24-bit fractional part, convert to 3 decimal digits */
+		n = n * 1000 + (u32)(((u64)x * 1000 + 500) >> 24);
+		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
 	}
 	return pll_freq;
 }
-- 
2.43.0


