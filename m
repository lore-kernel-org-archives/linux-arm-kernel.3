Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE04C44515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 02:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBzG8ZBOhqwEqdTqOTAwTbc1kw7Fn4SE9BojLVsipUQ=; b=pd8jEQ+nrwJ8PTw9w19xL5elVO
	IgJlmyp0yCVZwTisQYFm17Ak1bLtysqCkQxsDeQ+YTO2NqXxQ55UOXbye/Q2V1DvopxKVn3W7TqbM
	7diTv41nRQQc4j7K2wRTSFXD1Olh8P587JVxg4FAob5uPqH36Sn47RcVJP9ctd0/dJ/qCw96m4wCq
	wCCkVOhPOslpYlxVkh9t1lDn+DXafCvLvXcQT2R/4TmHAnnZpKiLHWfH9BAR/s07AVyafYgqqY6ke
	LGfwOuMMU4T18n5K9xUB5HJRdDu6zlelBRS072GMU2aEU+EMbkYl1Y1wOV1ZIBLHK/10e7o2Gqpez
	KmFaW9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm00b-00000008EBs-1biE;
	Tue, 21 Jul 2026 02:15:01 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm00Z-00000008E9z-1KyY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 02:15:00 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso7563949a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 19:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784600098; x=1785204898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBzG8ZBOhqwEqdTqOTAwTbc1kw7Fn4SE9BojLVsipUQ=;
        b=iHCu0PO6cZo8FfpdUm/UEWnlBBgUBjCeYdrk33Bn4HVjXm/mUn5bIAlH8rDsrb1lDp
         Lw5O6xcfYMZ6A47Ejdk1TDJGmJXVlXJzzh+yfigADM416Jq+pwSXk0rI0Y4omTk5L3+i
         j7wCrFcltEJ7qYMDthFXxdg79vJ8f3tBTTHZRrp87dKTYiNu66WL2OvWeH55l/Ra1EuP
         k1iZgEeul0gRN8i/SVyqWvDbyABSGKOycnnoxQbG747N31wCUKletsUruCfY2RXo32Xf
         CRqXnUjLoeugUHCLcLGpvKUE5R2IJuYdcrrtxtYkeIAQuhiAvN6P3UYwPlJG3YsI1GA+
         itTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600098; x=1785204898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBzG8ZBOhqwEqdTqOTAwTbc1kw7Fn4SE9BojLVsipUQ=;
        b=qzmYXD8z+DzqLJxKCZVFu+QU8xcGw7C8tZ4cbKtbTlDJE4pveNzwfkkhnc9X/DV361
         SkO3LHdaYIE6xqrLuKZT5YEdh+rIN+H9759Fdze8Bn7j4A5I/JK2jdm7UXRP3EiHPjsv
         7johD06n77BUmkG3UQjvufcdxCygb7D4thsx0jnrO0tbx+t/OBpb66m8QfMOhLwXR13T
         z37jdBFtrto9dVOkvudcTai3DeDgQcy3jYMIVljas/ELsek5KSzUHnoJgJbMf1R9X9ZL
         WaQrTA+LhM99SEUoZ+A9T0nMsAmDkhInqsoPZg255Aw2FN3KvXyIJf1H8FJdQvLYBT4s
         pXCw==
X-Forwarded-Encrypted: i=1; AHgh+RpJ7wMkWu3ZdTVg7JC9lUXs9DKsk13gycr3jpzb9MIMPPpid9W7YpMFhUFZEaOFZTjYk2/Z8dAdwt9q9gdtSJM/@lists.infradead.org
X-Gm-Message-State: AOJu0YzD2pW5iAonY39SfTTv1FEFaLtgTpd8/huRtr9R+7HvOISkcwTQ
	lerPPWrREdJXjGgfPjlKY/kxqBdX+8Wfw7oZvPYDlCf6x93V2tdcx7zm
X-Gm-Gg: AR+sD12ZXlUChaKT/bq1kK3vHdJ9YOL8aB4F/w1w62/hOy7JA2BncuhFPQGo7SPz/Wf
	B+DtIH70X6n9ZfC68/ePlY8Sy/l0JtwYxcmWi1VNUbtjWQugb1rohr7b8ZJ9zSLpDqdm6JqPdUT
	VDcadA/sY3VyKs9FC+Brtb9V+GMMLE9Sj0SsQ9Dh7bd5QuRFKfYXJwsbdQuLAorTxb6Hx8swlnw
	qbj3aqmasq+dJRuUbUyaHHz/y/1KuIiML49586v+3gJLEIsPlFiIOVrGYxlWFRg/fRVxigrTSkB
	U5VleFziMhsAaNl0/s0rUFTPHu4Os3BNOLsMyHUXp+WYI0g8pNf3ohuLQy852GcxXSaFpeVeyFe
	QwdW6cl31KdW0TL7oVBZVTpjT6LzhbLREtzT7ARtabvCmoe0Ip6RWL+pZ3N6n9InQl7GFNJash+
	8TVlKIOIC1aVS/u5Xd3G1aO1Bv+dOVkY6gPcWlmm22NzGcEJ/i818TEsqQX/VWd64=
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38e679f4dc9mr7825253a91.30.1784600098282;
        Mon, 20 Jul 2026 19:14:58 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9235a4dcsm586241a91.12.2026.07.20.19.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:14:57 -0700 (PDT)
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
Subject: [PATCH v4 3/3] clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic
Date: Tue, 21 Jul 2026 10:13:56 +0800
Message-ID: <20260721021356.288506-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721021356.288506-1-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_191459_381210_5FF72B8B 
X-CRM114-Status: GOOD (  15.37  )
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


