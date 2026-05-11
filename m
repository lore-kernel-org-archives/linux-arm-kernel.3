Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12170CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 03:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v0XH5xCs/mRDozz4cBRqJtguyW98yPx1ByNmDePPT8=; b=mCOMV40sVKxz1f9DXGpkn1Tj7S
	FUB3Omo/LviQtG5z0+cTaYIw1taDbiC/7ckPjW/TLcE6dr+L0JktskgJ1EjhegU110muVQtEBfSm9
	/E9/VG/p0SJySLaMLW0esM13Ld7nt03ajBy2bkvIfS02GxcFtszeNLi90FkrfSlP+aLNTQ5X+inXV
	RqLws0G6hXG6xiQalEE23t+Obk020ymZRmhIU6J5dsFORI8+NboD1lYTKk1nw9HwxrZCrhFg3E7rZ
	Ar5qegawMzwpLuUgjQ0iW9wavWqyIOhtPzIwy/C0UkAey0sZUcHBdeAsU8X3bRVyXm/J6dDPvQa4U
	0SKobgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMH7v-0000000C9Bh-16Mu;
	Mon, 11 May 2026 03:16:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMH7t-0000000C9BA-1UcD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 03:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0v0XH5xCs/mRDozz4cBRqJtguyW98yPx1ByNmDePPT8=; b=TWkK2PtCHLvFundU/HPsahtdFB
	FQouEnxjKnFK2j7joaukw7F+eTPSn/JxALMPuzBITrD1m0PztXAEndlsHCecgNOJnXvXE1nj6OrFv
	a22z1iKtziGwsaV9R2GgkzMXkEWYvb9k084BoITfzOVGgBBXJPahzWA/IO+u5HyZTz0VQWwPtoP4+
	i5tPT9A0o/68ptDwA6pQODymunCrl6nACdHRtBB5lnD6eO04pp3pWCIN6fYHRSp1a8PGOqQ241PYH
	2d24I/72UNHtG5DgThydjAswVoHwMccNQBtd1F8slBwoX+DIDJo0NX5my0GfHsuCjZETzsNBVha1D
	qTOwrlyg==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMH7q-0000000AWXm-1RTA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 03:16:12 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ad9f316d68so16646585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 20:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778469368; x=1779074168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0v0XH5xCs/mRDozz4cBRqJtguyW98yPx1ByNmDePPT8=;
        b=BfhDI2/Eafae1chDs4Yjuni9OvK40mIId7uc7zLS+Y4KLsvBTlWeB+RN9mTceQN1vh
         8/UyK1SNlh72oH7aT+bgw6zSdW5oZPJBsMbxepAlkWHy3EJBUJj+/girgrNK7a0r/aVr
         9VdxmCtWiQFvltbmjiIuNM5ohw4GZnY+RUyOrRdzYx5e9z27IVwVCHznd4dDS2LwiohK
         PujuKph/aS96fiBfH8wqgGQ+bjc9azfDBR8zHhu5bW22i5dNrJXdxHeDTpanoLuc5SV3
         kQusPM3hN+KQPLzb3zgqfzS+1kte58+6CDaF0+BByrGGMt5FIbHaIgmddsirYcBob/xn
         DLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469368; x=1779074168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0v0XH5xCs/mRDozz4cBRqJtguyW98yPx1ByNmDePPT8=;
        b=X3QWXjy02Mz9G4LwSF5z605Ok/OHfp5vd3ltFPPYAQNUrm/BM7HnF44LezMLlR3kyg
         /LzQwV1Dzrhj+WONcU8Dgg2HSkDex6aBr0GqddGvH6v215ii69/HlT7RV18fh06tn2Jy
         9LS004Oc23nLwOXvwcEtllYrHjk9xYZx/VRrOuVF6Li0Qvviw0Pk//kYB3ND5Mb/uS8T
         qjLrDB5Lv1uYcE23C8oF/yf+5YbBw36UOCt9ujvjZk1jWhbiiMUYVPMUzJhPd6gOsm87
         HjgeNp5Jqah97rG7QKVVBM6WJPCfRDhRuMMf+d/qcEwXn1PZ5/CTiF9sU25fbJ9NpUTd
         VrNA==
X-Forwarded-Encrypted: i=1; AFNElJ9Q03MCnNo8Q40AAx/ELsCHGcgKWESBKmn/fhhplq6xHlJdA2MhadOat8mPYWL7gwgVW1tX5DLWcBHAetU5KOL+@lists.infradead.org
X-Gm-Message-State: AOJu0YxERDHSOQxtThqYTLeTKYGdgTe16YQAUMX6vJl6obL5BSAlbTYe
	D43SqpLnbAr/zZvcI77Qkh+l4PjC6OPoIzZXE8YVYbHsABaRYCPKrFoU2YmHIw==
X-Gm-Gg: Acq92OGfZpsvRwXTxzSS53qoD27bWNgJWEQt4tE/HzvfvKAd/rcsdEVTs/P4RoFrL7y
	I1WLpwvlPWQ4/g3dWMDBuqcy2Yh0j1WhSTdQ6Q1rMaE1Qp/16qPl8QWpY2KYkFZdzHEXVOi+hX9
	nvdMTEgarOj2j2Y/AtwkEka1uYR33xNmXSGDn0zrgjpyQm0Sy4V4w/VgCUp7k96d94aRu+Erf0a
	u1RFPSMub1bIa1Ul86RrB8WMAKukYjuE4g8hbwfeJjkzPD5dUhpYTtYDDvi3kRUPcMM+/JRIfGr
	75aZEBZP0SjWOAYQaMsbj/RHO1WkRlGJ4MpdPDI9ezxG3GsIImej1ygEgSpRistau67aEep/909
	Ryza3+XHRUPSIhSa40JOGF34GaeeGy1j6S7WrFtISZhaRiWf0oI7FsOT4P+Md5J/mWqwn2C0EA5
	kfStf3RtckiF7Zmb8qCWjIUDvY8OxooHktOZbqLdrLJ8vrHPo94wSGkfIP3mq7eu9Kb2LRrPx0S
	pnQ5mDGlIhH28eGu3kKNv4=
X-Received: by 2002:a17:903:1d2:b0:2b2:539b:d2b1 with SMTP id d9443c01a7336-2ba78f63e3fmr250069855ad.16.1778469368094;
        Sun, 10 May 2026 20:16:08 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d26944sm81585935ad.10.2026.05.10.20.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:16:07 -0700 (PDT)
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
Subject: [PATCH 1/1] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Mon, 11 May 2026 11:15:59 +0800
Message-ID: <20260511031600.31929-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511031600.31929-1-a0987203069@gmail.com>
References: <20260511031600.31929-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041610_780550_370340E3 
X-CRM114-Status: GOOD (  18.55  )
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

Fix four bugs in the MA35D1 PLL driver:

1. PLL_CTL1_FRAC was defined as GENMASK(31, 24) (8 bits), but the
   hardware fractional field spans bits [31:8] (24 bits). This caused
   wrong frequency calculation in fractional and spread-spectrum modes.

2. div_u64() does not modify its argument in-place; the quotient must
   be assigned from the return value. Both ma35d1_calc_smic_pll_freq()
   and ma35d1_calc_pll_freq() discarded the return value, leaving
   pll_freq undivided and orders of magnitude too high.

3. The fractional-mode calculation divided x by FIELD_MAX(PLL_CTL1_FRAC)
   to get 2 decimal digits. After correcting the mask to 24 bits, update
   the arithmetic to use 3 decimal digits with proper 24-bit fixed-point
   rounding.

4. ma35d1_clk_pll_determine_rate() called ma35d1_pll_find_closest()
   unconditionally before the switch, but then overwrote its result by
   reading the current hardware registers for every PLL type. Move the
   find_closest() call inside the configurable-PLL branch (APLL, EPLL,
   VPLL). CAPLL and DDRPLL do not support runtime rate changes and
   correctly return the current hardware rate.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 34 +++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index 4620acfe47e8..314b81e7727c 100644
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
@@ -92,7 +92,7 @@ static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
 	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
 	outdiv = 1 << p;
 	pll_freq = (u64)parent_rate * n;
-	div_u64(pll_freq, m * outdiv);
+	pll_freq = div_u64(pll_freq, m * outdiv);
 	return pll_freq;
 }
 
@@ -110,12 +110,12 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
 
 	if (mode == PLL_MODE_INT) {
 		pll_freq = (u64)parent_rate * n;
-		div_u64(pll_freq, m * p);
+		pll_freq = div_u64(pll_freq, m * p);
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
@@ -255,32 +255,32 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
 	if (req->best_parent_rate < PLL_FREF_MIN_FREQ || req->best_parent_rate > PLL_FREF_MAX_FREQ)
 		return -EINVAL;
 
-	ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
-				      reg_ctl, &pll_freq);
-	if (ret < 0)
-		return ret;
-
 	switch (pll->id) {
 	case CAPLL:
+	case DDRPLL:
+		/* Read-only PLLs: return current rate */
 		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
-		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
+		if (pll->id == CAPLL) {
+			pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
+		} else {
+			reg_ctl[1] = readl_relaxed(pll->ctl1_base);
+			pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
+		}
 		req->rate = pll_freq;
-
 		return 0;
-	case DDRPLL:
 	case APLL:
 	case EPLL:
 	case VPLL:
-		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
-		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
-		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
+		/* Configurable PLLs: find closest achievable rate */
+		ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
+					      reg_ctl, &pll_freq);
+		if (ret < 0)
+			return ret;
 		req->rate = pll_freq;
-
 		return 0;
 	}
 
 	req->rate = 0;
-
 	return 0;
 }
 
-- 
2.49.0

