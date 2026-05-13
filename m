Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBC8CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 05:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ra8FK+IjnzcQJElh4Bz008lPaSmGodsKw8/Zi9VAbNE=; b=JQidcSMlcu6L81i3SO7XZcpyMv
	WwVxM4vFmrreKqF60gi6ve91frCxreolkMr59VWPUITAUxe6mpmyHukWMnaTZEI4poy7HOweQHNH8
	Q4CVFkcCuI+8EQKHDPvdBS+5sY7zelc3SHEgLv6jcKEMofnUoy0Lptg8AL6NQjBqhBJFywZL7n9TH
	GncNgkkZbWa/cX8fISa2oggn+pttC22ZCZLOhMcRkLNkaHnVfjyLUkZWgO9Q8dv+ZG81waBGoDzB0
	tNKF6wDOtbx1DH62sj+MlkeTrFbJmDw2M2cJxHS7+/NzfpWNqYoJaLFpREABZMAJpSOp9Ru2xReCh
	ISegv06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2aP-00000001O2Y-3dlj;
	Wed, 13 May 2026 05:56:49 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2aM-00000001O18-48vM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 05:56:48 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-367d88b9940so3002476a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 22:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778651806; x=1779256606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra8FK+IjnzcQJElh4Bz008lPaSmGodsKw8/Zi9VAbNE=;
        b=mzkEhgzgRVbgpfdR+taE3qPs+sxuPDVITl+FRslv4U17JUyqZvhoAC1TKFD0KMLNtd
         GdmCtF2PkYt3DeRwSwRQTEPmkA78Vr0QCw/s5owcCIYKX9Iu76/F/hPfTr9Rc4DFm9c5
         cNnPw8Lw5XKmv80EkVpLRSdx4pShu2H6iQkmrNerlTe46lDs5cxnwtZHYaMFDA5w8xa6
         f5OU+/cjuv4nhfSw8eXnsvwO/BDbBCN/+L9Pn95v93VVefPPo3NAMd0oAylAchCh7WC0
         KoXc5QHdGiR1usdRXV6yhhVtuzQ6qu2Xel5W2RB0qhEkSfKLHw2nW8VuDQxWq014/Mc4
         Eoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651806; x=1779256606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ra8FK+IjnzcQJElh4Bz008lPaSmGodsKw8/Zi9VAbNE=;
        b=VS73A+SVcGf8t5MiYf8ALWIBYrGDywuC1lAlZr+Z2XwnnlDQVkN+3mgxo2pjpN591/
         4n9+DAhz/m+dr5UhOVkd6NAtNUmAJY+gVyDOcdJkhpVxzVV+4C9i/aXM6ZFJClVJAXFU
         rn0VUXD5cKn1U8nLKKUaYAw/BDYrPZPdYNjmZqt4ohsrEl9ONoingXT9N362yeLEM3vO
         u/qqCJwVujPRGcKmBhOwY+Tk+wfVH1r8AkP+9U/E9qZMHB51HJUOx5hJLP40eqS67riv
         gEmeoR4N7n8zSJ+Sfysbuj1cqVCEWszkhjNDK/xNanZBn8XLaO7L/6gJ/ZXgw+kNXpbT
         qoyg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ahw1D392ND6FZHk/fskWsNHtpBzFY33HlrGReJX2Ag9QT/dFbkznVM4Y/W8h3fqoPv9vUBZV4U1Zh7qK6zRwy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+9++ziVQxPf1bsNnSUdf5qHknHPOYeRDgF42RGIDWCc1aMV2l
	HmaFB7jZLHaZZhaeFBr4cTWeaW5j4OJjO6e1V1F33YG8M5hZYd7CxgJ7
X-Gm-Gg: Acq92OGhpyexAP5EvXOr5XqTi8ugBxrYAU5OV5KfdPmxf4hG1XxfMLoaLiEEEZA0BBu
	kbKhJHFhBD1Z7Pm+uO6cIy3maFPFjChIAXU6RoPR9Jvr5cHMuj3CVV7xaP4bMDa6ae0srS58dRk
	thX9MEgWgQco+j3Mxfc8XxFvS/6M3OUUwqHWto78986DFEiHKPVPEO6kJWRC6K9FIrS0XodYM6k
	a2tf23nTNSfuTwHhyWZkYmABHSoX4izfjD9NNR/Hnz7fG1X0j0lqQRr9RsBjrK5AwRDNe9dSUd4
	2P0f+mcjaHkW79kldDv0/Z65k3w/IOp17C/xlWeIgGpWkWOn5g2kNTvmwCKT6wh6woTYQLqUekg
	Eej59Elha7njlWkE3gt6IkY9eTwpbSpjZafc4KaPB9kCHUoJKs++EdkFNY6vROHqYIsOP+SZN++
	byMkIbpQuJGAnUbwrRQhzLI7bYimflzw7QFiklKM04Yj+Z4MX1kGUwufRCR5vjtkC7CnIAhh2tC
	s24A2S+kXbI
X-Received: by 2002:a17:90b:1d4e:b0:368:2289:42cc with SMTP id 98e67ed59e1d1-368f4092542mr2283215a91.24.1778651806092;
        Tue, 12 May 2026 22:56:46 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee32822asm1785492a91.12.2026.05.12.22.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:56:45 -0700 (PDT)
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
Subject: [PATCH v2 1/3] clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
Date: Wed, 13 May 2026 13:56:24 +0800
Message-ID: <20260513055626.1070533-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513055626.1070533-1-a0987203069@gmail.com>
References: <20260513055626.1070533-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_225647_028795_E9140F5F 
X-CRM114-Status: GOOD (  12.94  )
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


