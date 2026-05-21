Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A32CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 01:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBzG8ZBOhqwEqdTqOTAwTbc1kw7Fn4SE9BojLVsipUQ=; b=YLJLaz1KviawGNscBx4YFvBr+4
	FWZHfp1z4DPjmD/hSM1o+0U25rALBGPdzPTCGISfEOc7irFBmITwe5ytw7hxPrZAnKgcj+1eFeef7
	P+LXiExusAoAAokoIdYRfB9l8MkEepF321V1eIlv5F9q1639tirBG/d36X4bgtZbDr6KVjneZt3Qp
	Z2Wezi8BpNNFaY+ifQ9ruUbjfA0dSimxSZNVDfYCA+OipY/o61K/1nVgWIJTkLaJ3Lke+1sScdnyk
	4G5uKhyFY9Ce0KSaG9ZwxZ/KN89WqDNZwOEWgBCqAXsYIujy4m7Pmw1sXLCGmflvwU1SjGwLg+r3I
	yvbnNQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsQn-00000006OdK-1Zqy;
	Thu, 21 May 2026 01:42:37 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsQk-00000006OcJ-12Qw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 01:42:35 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82faf871346so4315054b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 18:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779327753; x=1779932553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBzG8ZBOhqwEqdTqOTAwTbc1kw7Fn4SE9BojLVsipUQ=;
        b=foo1yOojp9WI6FDX73kRDveWgVQ+sRl3JeCTHtlev24Y9/c5r/YSPbeyPGWV+Lt2sD
         F/43OLwPeGhLedazPY5oXys678TDWYYSVO/GOM9Ynaspf8CGfThX9e13qW4u8nZ5EQRT
         odVCDSkHI4kcSWHhslXyINqwKIkf3RQJ8C7C3iThHhhJR1Q6J/DzID2KfxfbUcf0+i4R
         cuUsdAvdhOG+BTyWhdt9F6A0oZ8IJMnUjBA/6KS82/Cx0Kp8ELUIdIWrDaE2/YE/mXzM
         bino9QsWCG895OCXsIPFpFs1huZVtIWnX8/ulGhbv64hxj9OM3QVLnpCRkuDcPO8VFmi
         kf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779327753; x=1779932553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBzG8ZBOhqwEqdTqOTAwTbc1kw7Fn4SE9BojLVsipUQ=;
        b=gC9urLXqw5sHJdA15aKqqoRZLUl971ZBbI2rU0F8hp2P6k7bYcW9udv4V1NRceFeq1
         10E4VcI0rn47XIC4LuqFP2sDxcPZyvpcYYfXbPo/3v3JUdrSzY/HB4i55zCRsQXBQ4H1
         3Bru6FqK4iI5PqO6Jgix67vfDW+t0gkYLFLgy5yQ9lY0uM7LpKamTb5mRbBCbB6i6rdr
         4Es5I7t/beGWeu8UKOz3Wk84+/EEGIGrYvAnuF8QlrkVbSIV1xrK/3JFVgPHgv4C2aVH
         qmmW3C8guLaNjKP8BJKZXRGVts3OwpeXzLNxxfI61GoYt/kRws45heIMIdTI+k5zmCOx
         icWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/JjB5A219/jVLFiR/fhccduav68+pL3spP3VdFAM/HfQYxBf+ycKxBITyOdRXAVKR6kSWyIBgawIBM6yrANC1@lists.infradead.org
X-Gm-Message-State: AOJu0YzlEALujx687ek/dIRIJ/4z6SPVaNMFDNrQlti7QQFVnUjAqzrv
	DtLnJ4jUJW2OupvxdDywYOY4DBl+dR4Q+SnkkAb0hlfz+Rw1O/nn3sGV
X-Gm-Gg: Acq92OEyjwwh3/J0F2Fo2Rn8ibF1tEdtAd8oi1Jh1g2HWC9vRaakKkTjbmdOnXTkAeN
	xtPnovqNMiWxIt1vaA/PCjeggg89vKpGyN/OcTSq4ErnoFf2jiMSPR9xEKuLP7UX0HUgUh7tjNG
	cIBE864RQ8P5MQuT7gxY2GHOkM3FxsqPVUEbc7pjwE7Ejwi19nkA+lulL63NmE0MpFFf70sTOnD
	SwR9u7uxFQhnEvJ72a18sm77iAWGNI0BFduJuW2sg5w8tUcgw5zngKhthfDKRDSWWQJCXY58bM9
	UKMKvol2yHstEGak8ATP3AzVEaFV6RMcjwr3dcKytfvGBO1/q2y64Xjf3PZGTusVzGHBeO406ir
	EpLH83Cz37OPFbEofl/RBzWjeow6R0uIr9ZCWnnlD/rb+wpuUUUirktgb/aTGWzaKLY49njI518
	0pKls66th/vn6U9BHwmm7H0KrMKqKzXhJ3RTxyn2aS5aBSUek9IxWpgpIkCzpVSpd8S4JZZIiMt
	17/P2/1XGBC
X-Received: by 2002:a05:6a00:94fe:b0:83e:d996:92fa with SMTP id d2e1a72fcca58-8414acbacc9mr918900b3a.11.1779327752983;
        Wed, 20 May 2026 18:42:32 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm26411475b3a.61.2026.05.20.18.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:42:32 -0700 (PDT)
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
Subject: [PATCH v3 3/3] clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic
Date: Thu, 21 May 2026 09:42:20 +0800
Message-ID: <20260521014220.77955-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521014220.77955-1-a0987203069@gmail.com>
References: <20260521014220.77955-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_184234_293451_19474446 
X-CRM114-Status: GOOD (  15.60  )
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

ma35d1_clk_pll_determine_rate() called ma35d1_pll_find_closest()
unconditionally before the switch statement, and then every case
branch overwrote pll_freq by reading the current hardware registers.
For CAPLL and DDRPLL this means find_closest() ran unnecessarily
(and incorrectly, since those PLLs are read-only) and its result
was silently discarded.

Fix by moving the find_closest() call inside the APLL/EPLL/VPLL
branch where it belongs.  Group CAPLL and DDRPLL together as
read-only PLLs that simply report their current rate; handle them
with an explicit if/else to keep the CAPLL (SMIC design) and DDRPLL
(standard design) paths distinct.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index eb9d69d2077b..c7c0dc91a012 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
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
2.43.0


