Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00292CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 05:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6lsTS2bThXFNqKtA/Z8FkqMfRb5iPzxNdnamFjvzQg=; b=JqkbAHE/HGh1234HXgXYN8fkJ0
	jP0aN81m5qJHsXELgYOenCwZiYiXZyAfdNCHc3RoufVrJfs04w0nrVaBOndNRSzKyGsYOjq4ELrWq
	qfn0WD6FhycCXfBR7FKxQxhrcIcY/AzcIEDWkR9p403Yv8LQjJ7ym67d4ksgmP9NLWRjPl8PvXkST
	eRTorbunFAsc7NznEmMBQSPufJ/7qTCWbYYmwoocC5/yu0UDPFoaM1UaAMmlyaIN1Om4ljSVCrtJW
	9D8PS6A+B+0iU+fLzXD7gbNYJiOMl/HHpo5HjwC0NHbpiOJWOSzRddkDBIf8u+eHUUDz8o5HvoHNW
	iGeFUgtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2aT-00000001O5J-0agx;
	Wed, 13 May 2026 05:56:53 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2aR-00000001O3W-0x8R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 05:56:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so4128306a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 22:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778651810; x=1779256610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6lsTS2bThXFNqKtA/Z8FkqMfRb5iPzxNdnamFjvzQg=;
        b=UTzqrglYmtBkQ31RMpMMOlDBu6Ghl4qMXjjdSWTCL8ssYfCGYTCHEL55r3RyOMHze6
         ktZcHPQMpn7YW2LMMsrVwtQuHxqP6jBF+RyEp+G5mOyaVf81B2HY3+AxFq9M9jpJ6EA4
         /PpX70GIYcZ4GN8bMJo3YOalqgmcwBlUyxVldihGlWtViVgpLVFLKqqcdIM6q7gdw4A6
         +kRW3QDbWrm2O120V/fKRdIlZBBdRATaNnaZvQ/lU4Dk7Kiz+ev+HsMgNWrm8r14gtVm
         UapCqkKl+v4tkT7YEbyJ+RVx5gPJXzMHPSrlatNqpqffDZocm7kFK49F5wOT4xAQyfN+
         jOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651810; x=1779256610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6lsTS2bThXFNqKtA/Z8FkqMfRb5iPzxNdnamFjvzQg=;
        b=dOsL6DPrf9Jos8KeQzBgeBRvaZtZ5H92HRa8F518rTRlKxDrW7Eyz3G3FZGxwPAq4w
         38JfH5+Ut1YQ01PZZutKefDq/RjbjnC9eiDPFExDetjsTotj2r4D8oGdr518spwndjlX
         UhLYaclcoSQkDjjj7d/GoiT7deVRvcOKZCxY0rgFdpWhyQPdCub6Hw9WcEwQjYv42cT5
         lo27X5d9j5cQWmnMhzeSbNp+26yOLXxXOtykd+mIoUYQuDueckK+mzGeuqlXudr9+h38
         OvXN3kfW93ooxhfrEJ8SQego2p4a/Dblu+SC4i9mKUm5F/SROue0TZfqGzPbI+nZFZ5I
         uSqw==
X-Forwarded-Encrypted: i=1; AFNElJ8PtwFdLI3mCKwaKEZNdWV4i3r/7mKqQus80IEmDci6Q/XFHfZwDIbVc95kPfsXc5xrc7ZNlZE0JLQfLRBezZgS@lists.infradead.org
X-Gm-Message-State: AOJu0YwETLUXgPaJC4c/Rvz0Lk7H1ybEUc95j/iXniB9uUVok93z46jg
	KDv3c43LqYR6BheK96BQzJXCdf08eqXPZ5cl7rsXtZLi46EH4o2/T25q
X-Gm-Gg: Acq92OGDLLEctRYLNlpC9y3/JspPthkztgCUnzisfMf4YsSSVni1NRqWHf4Xk1cIOBL
	NA+CzIMbx95fhQmp4CjgN2tjmXRzauz2lZYvD6p32BYZDKYEaOn9kpW9b5Neu2adLhYOXiIsZgs
	z/25LWM5SUw18rlq9bCoWrQsZ3m4eDUkkiSbM6XzMyYB4oEuyCqMeHfLFupa9VKT+6ONJ9zP0f4
	tzbEQvW1cbPyMgrhb0gSeEOMEbvX/+MECLq9VFtFbcNYPGrb9PvEDlZ9axGF3ybRQfvAorb4XCN
	XwZTAHprUAzuaIi+WLUR68uruIxCwQdE2s5DFaez+hf316vS4jFILKjGpUtS+vb/F7OxJeNtjxK
	DR1XrWiLjO0BG5msxRqTHdM37p7UfyhfGHMKP7iChaqi0mjKCpdTygakaf4byCzD1oOZqMy5BYU
	crn6i+sCx5cplOTpNm3G+lMsZNpiUdl2oLCbe6iAiZRcBG8dWoi+rtbpbeXPtjCnpmNmLkcRjCp
	9wzuZ/djaaJ
X-Received: by 2002:a17:90b:524f:b0:366:469d:98ec with SMTP id 98e67ed59e1d1-368f799454bmr1558490a91.13.1778651810384;
        Tue, 12 May 2026 22:56:50 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee32822asm1785492a91.12.2026.05.12.22.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:56:50 -0700 (PDT)
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
Subject: [PATCH v2 3/3] clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic
Date: Wed, 13 May 2026 13:56:26 +0800
Message-ID: <20260513055626.1070533-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513055626.1070533-1-a0987203069@gmail.com>
References: <20260513055626.1070533-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_225651_271631_590E2B0B 
X-CRM114-Status: GOOD (  15.71  )
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
index 7e6b30d20c01..314b81e7727c 100644
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


