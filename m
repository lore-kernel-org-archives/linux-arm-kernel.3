Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9232BC44520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 02:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6qD1eCX8UZOQGibHra7bJn3ga0Dq+Abt2SRuAhtEeA=; b=K+LOA5P90Gv7JQ2pjYNXBGr9fO
	K/UhEEDLcetDwm/HzIFvSxCfSTYEl++WIVDbHntWcVfpLB1rThCE7iMRdE1lL44Lh0vAxS2ynoLUN
	GIATwnJKYNfBhBZLJtJcaqGv2rHBN24VgAxRY6V/esAv+tDnE6pkzcQRUqHVg9WS4ND18z/uwW0/8
	UqtPgwTX8ms+Htg2eczEQFXPTMZPfMu4w3ZeRgiC5kHs/F97Lc3Mks8wnSqphcsbCjTXPC1DAlr1H
	EEFx0qlgMxV6SQBLMDSYTCekvtxPHf54OjCkVbrkHUalB+M+VRydGyWiR0oNRzkTvHxxKrKVsGtov
	LZmx++lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm00b-00000008EBJ-0i7R;
	Tue, 21 Jul 2026 02:15:01 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm00U-00000008E8b-27XL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 02:14:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-384c94c9414so6259248a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 19:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784600093; x=1785204893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6qD1eCX8UZOQGibHra7bJn3ga0Dq+Abt2SRuAhtEeA=;
        b=BSUxqtpo36XJDy3NjaLRMsneu2ricO9FvKnXwrLV9FbUtZZ+U5lrg4bUOpP7vmQxW1
         OhLVFK+4VyaKygbmYI+Fn3W8dCqvY1XhC1bGl8PjE0jTs9yF0Qxa3TFQY6fSzbgpYLp+
         4P4keCuWUPXtNhCs2u2ejAdmMWhSoeeHbn7iL9R/h2i35CF2O4haLlHYAm/rsFg5ilfw
         RGOtrMHSHuPdad2YmTQtYeLar+WffNwiZV5SCz4BKYuQf4gZ32GT+UumqHXRLIgU2X/i
         eWzNMzMhivgxGOFS7RYJS2GcAXiY2UObgfhHNfAPPpdCtcGOZwlAEsNvYFANghiUemzj
         G1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600093; x=1785204893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z6qD1eCX8UZOQGibHra7bJn3ga0Dq+Abt2SRuAhtEeA=;
        b=PfLOR8dIr0pwdFWTzLThU0GRA0h4Rckfp2JWF5jjGQ0/d2xpBnJj6GSYW9v6NCLFNG
         sdFAXAzTbaUfH7gsSZMJ5/C4j3KH7JYHXmw0Z10NQOemL1Z6ek2ZgnqvbzTiHRkEN1/T
         adWXIwyqpoOn4P1GzWh8kEEwch89uU5ZZvGmgqkqfvX6BYXS032K+56TLiizdgYmeM7r
         aBOMAgwjLV4rSJvxsnIEwbgFtW8IyAetgdLipc2Q5ZkwJuA7q/wDhtDXcHDwd0Zj3Y0X
         6Gm3MSh4gs4pBkuTFZhXhDU7AG9hzGmE84oDpBpYgmZiZ9ZPK2nKaEc66wDQBrcBy4ji
         Px5g==
X-Forwarded-Encrypted: i=1; AHgh+RppSJq5513bC36NH6NG0p7Klh7M9/knlR8p6lr/+mw1gG0qaZQHcOnRDqTZB0jfLBHf+O3SebhY0AwiAQDP0mGn@lists.infradead.org
X-Gm-Message-State: AOJu0YzfCoFPI2xsWggWiEPtavOr2N0BvyixK/qG8mmyv8J2BeGVQvo8
	1qJ5jF3cuHn+k7UbQRYO05O3/Earl0Iw9whht0SoJrfX9qk8Xiwb4FyG
X-Gm-Gg: AR+sD10GW0cVBoL3q/sakPozZR2Ve0QP+UbiuzQXORJ1bPiqThaZiNjxtEIrIbocrZN
	RGNLkL8AKNTVixpxLSRz8XuOd0mdXatgkK0MBUui1vQtEZesWd8Qx6aYE9ZQDbR6JjUNt8OmSXT
	b1NUyhpXa8vuNpZaZLTC+gSZo/79SpWNVGTXYeeBwSpAd+OnQBy/5Rw1df5zMm+8I+zPEZDErz/
	oJl+dt4uuIOKN318V1aHkxoEkge7F4lmEVc4QFx6O9PPcMV5/ZQr+vmXHe5cvykasMy0deHY2qD
	mUXSPNk33LVU6a/S5fg+WfMT1KiFaRzBt4QUQ6pyO1yhWIE4fGbdg5PkqQnLdT8AQnd+Xxmp5xV
	UD/3tGwPaccRR3d0JmQ9N0fS6tXPHuZdsEF+pJZiGWTz+cqbvIF7fHlalYDPGd9rxj53LfRZKky
	VWbMgXKQCqBb9LeE6/cLOiWpwwGXUlx4zf34wMCuv85lzqOwSWuSWGsZBOugT4VEE=
X-Received: by 2002:a17:90b:3ec7:b0:38e:cb1:8ec9 with SMTP id 98e67ed59e1d1-38e4b585bfcmr17200761a91.42.1784600093473;
        Mon, 20 Jul 2026 19:14:53 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9235a4dcsm586241a91.12.2026.07.20.19.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:14:53 -0700 (PDT)
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
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v4 1/3] clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
Date: Tue, 21 Jul 2026 10:13:54 +0800
Message-ID: <20260721021356.288506-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721021356.288506-1-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_191454_543001_8D8F4F33 
X-CRM114-Status: GOOD (  12.70  )
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


