Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AA7C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 01:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PshXx6UhghPZU9ZufEEpQoWo1ibLdgLZX+tS27SichE=; b=VDJJVP06kuK+LXioMvdQZIhjjE
	0zDCoBpjsfHY2SYhT77qSvDFvV6RfNwoAXzGXIVMY5RVrVfulailTT8T9EJk+1k+ypFAQPxlVwHI2
	jOB0dk/5prHU190rt6LhleZkuMg7vnPzetolt8BZPmuTGcrddBWk3aSJItFqMGPTGIveWgiVfX/df
	n01NEYa3oLKP69O4WQzkJsLb2uYg+Z1HK8ncvADuza04dzC1dhDvmnQysrUxZHo5kTKKNC9+xrX+y
	LRpKPA9WQRySmulA0vYL6KHAN3dj9GoPw90qqBco+rnhthOOflmIj0ymKsCoAN5R683BzuEOKVZbg
	swsH9m0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4v8-0000000FLvP-2buv;
	Fri, 24 Jul 2026 01:41:50 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4v0-0000000FLtV-3j7I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 01:41:44 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1336233a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 18:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784857302; x=1785462102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PshXx6UhghPZU9ZufEEpQoWo1ibLdgLZX+tS27SichE=;
        b=NAd+sfhizFiA14xVtEtoFPUp1QxkO6PN4zvmbkzOdvdEd8MuFgOMLUMA3yZ5RDAoSF
         nDj7Zk1S5vfX2GLWWC6R1NmhXQUmUXG2d9ZcYhkyTvbLzDKtIEUWCn8NLw0W0v14ZGTf
         mTT0lk6Jzr+PcFe1PDkli6Gry3UyzRDLF1IWFHF+GWpvNiWHH/kFedh9N2NRFK2VAEAQ
         69hT+UuWFbXaODzaJ2zSqv0ljnHtRy9aiPskENd9qRuBOcKX0Vgf4IgJaLRobDVJXF8m
         sb81vmoSnTmgk0cvkg6XF2DdiVlO8nqwN4ECwSpxv8dxhnUeYdKIy1Z+bbFrE9yv48u1
         emiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784857302; x=1785462102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PshXx6UhghPZU9ZufEEpQoWo1ibLdgLZX+tS27SichE=;
        b=HNTMk9fhe3Y5MRQLraNJdVf90PyGMe0OPejcFuRg1w84hu7LKTrV/Lii416bPL8odL
         uQPRu1BfIlzKawz873TLg/zYqHxE/QzseNmt55yuRUvwvp04NIhjghlM5K4tiMYvLL2F
         u7vRYtJHACDd5iad5RnL6iSplwzeOjOTOYwWK/tnP3Q9gL+bWiFS0dtOs6BqOz3Dr7Vp
         RGtX4xWDRCBup5DlycRumfOBMLffsBWluFkHAcPD922pJayTSa9SOVzCJtJgF61lLafZ
         /Laiq+qbcmI+yBnbNYIQpBLKkt1uioVx3FukgFyFywcimVNTNegcdtR5z8fkiwAgGMPZ
         vw9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrASzVVqICOv5U8wb+MKhpal8j+4StjLBpwEHIeg84dL2Ujvp1Hyh0h08hp7jhAmgeFZLxW8a6GIShgTnDXr1wi@lists.infradead.org
X-Gm-Message-State: AOJu0YwnbGMRO2Nm3WhOla0YPPsNZ4Ab29i7NWx4SCtHRGaLD40EjxV+
	RatLRQb4vddhGQcZKZw2e4Rk1WpOvSqCByVAe3GCgnDY14jCqHg7bZKE
X-Gm-Gg: AR+sD116czpsXMPgFJGF6QirWRM8fmyyBNfNtPal5sQGN70a+x/ih19Vfx2EGjNpope
	b/Xht/fRXGqTl+kt8vqyL8jLkLUZRPa1lSDdEGxefQRQF5Zd07dkSWO1en/vhm9Ji/4Isf4GV9A
	jIeeDhtQeyZT/aEkr50i2nIayhOd9NbUSO0BxAjSga2POquVoIFLITXrezgg6j8n8phRypKzLxh
	5B0/xEYWlbYM0xgGIGBqkxNN0ca86tjQnesTm+nS2Qz5bBdRzgrJ2hjdBochG3+ycm5SyjetaZN
	dj6qJwrShwEss7LrZRIXVIOy+l0rJKVN6+oHlgSOVV9hI1oPwWCpRtLXjiyxYQFk5bBxOqL8RBI
	ckWA4s9chyBGGmWqvtZoaDv8IWPqYgyJc8RwqCp/SBypyastguA1sajhMWAtjMP54rDk7txNGCY
	YIjZ8InaEiRuwk8rDYg9TuC8Eaa4cENgJ3ERkTCX3hdCCwORbZLu75eQH2uW1fAjA=
X-Received: by 2002:a17:90b:2d46:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-38ec6453ea7mr5581001a91.7.1784857301888;
        Thu, 23 Jul 2026 18:41:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm647015a91.5.2026.07.23.18.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:41:41 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Brian Masney <bmasney@redhat.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 1/3] clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
Date: Fri, 24 Jul 2026 09:40:37 +0800
Message-ID: <20260724014039.1239552-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724014039.1239552-1-a0987203069@gmail.com>
References: <20260724014039.1239552-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_184142_929138_F173DC1B 
X-CRM114-Status: GOOD (  12.01  )
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

div_u64() does not modify its argument in place; the return value must
be assigned.  Both ma35d1_calc_smic_pll_freq() and ma35d1_calc_pll_freq()
called div_u64() and discarded the result, leaving pll_freq holding the
undivided product and thus returning a frequency orders of magnitude too
high.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index 4620acfe47e8..bfedd45bd04b 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -92,7 +92,7 @@ static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
 	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
 	outdiv = 1 << p;
 	pll_freq = (u64)parent_rate * n;
-	div_u64(pll_freq, m * outdiv);
+	pll_freq = div_u64(pll_freq, m * outdiv);
 	return pll_freq;
 }
 
@@ -110,7 +110,7 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
 
 	if (mode == PLL_MODE_INT) {
 		pll_freq = (u64)parent_rate * n;
-		div_u64(pll_freq, m * p);
+		pll_freq = div_u64(pll_freq, m * p);
 	} else {
 		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
 		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
-- 
2.43.0


