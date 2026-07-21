Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4597DC44524
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 02:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUEMfFXXEJWfpYYV6BprYH6yq5tTMFc+tIMi7bPpkS8=; b=i2/zeasKiPIX6YGMm/z6+IstWA
	Erd7Nmjnqg3shzBbUDKMEz3Y2U6xKkdsNcnqmeo0ZsRlb0QIhzABzH2qLn2IpY6GwZf/8LiIE5xNf
	6nRQ8vlr/3EEmh5h5/vysvsxsEFn7E4SuAfznn0VP6m0tDvrBy9m/H2nvTToVyET/GQ6REcrQ9CPg
	+0X+/53nZXaLH4gkLxQ1BL0agkbrMDuQpLYVPL9qH2m9Eu/m/qrw07Uc1gP0qbOO7tN9aJglBpFH7
	tXjC5uzC0DeDIA/k8Grmqw987MXBo5y4g+5f/ePoEZqwZtXWaHa49XMLiTbrpFd76Q/KJb8yCiIRT
	TESg9qfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm00b-00000008EBe-18PZ;
	Tue, 21 Jul 2026 02:15:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm00W-00000008E9D-3PbR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 02:14:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ceaf8a1265so106334795ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 19:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784600096; x=1785204896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUEMfFXXEJWfpYYV6BprYH6yq5tTMFc+tIMi7bPpkS8=;
        b=BJoChv1WxGpIi7NnQWxr5e68Xk8cRqJPA3MCo8C5Vcr7I9AjoYm9JHO4VKvEblNe3b
         qzxWBZwlrpvqUSkO0miPMu/HSKxOdRdCbosSjIUoAjgrB+d5A+IyQgmhrIq2I4WBytQC
         kTLmAC6WfQ2+2GUx0DZyOoYSB7qYgWNNaoGfu532oNGpdioHL86GxJBa8gjVP/I+vLVG
         bjg2Efz7u0vEzUcfoHElidDoyfWLnUO0vc+BGwfsgydkcK5S9tRAiiE+55N6Jxi8DJDo
         8xrSEQv5Bt3Zr6E+fvzt8tIHY1SdC03Dxd/kBrmkrQEh22WVKpDu+j9RpS4gnE3PyHG9
         XkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600096; x=1785204896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUEMfFXXEJWfpYYV6BprYH6yq5tTMFc+tIMi7bPpkS8=;
        b=ANsb5lSrhf9dL+QcJiwXQv7sJO0MgMnQUyGxtWaNy6jg7uKMQEPDedBZ/awIFGu/dv
         E1ZDTanpbTK5dA3Fn0sc4/N3jW9sARssmid/QcRcZIexE6W2HBGjjxqzhfiMKTrTXDZ0
         Npfl7Iizc79+W8/9DwebACzlc3DUMeGosJ4lbFYel4hT2oTLMrhuyxaPn9d4phrWht2l
         u477UBvInA1bXSeD34Pq3c/FxhT9JiJdvWAj+ZUW/HBBpnnxLlw34yfYEJmax3/Fo4pm
         vxa4wAdfQaZ96x2LnIB0TnqnS1Sm2UEUfFqU/Z0dIzhS3qNBj/At9YBefe0onaPHyVMX
         vzEQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3TeYz4TSitzxkexeE4kD7QOcjf/vxRU5y+twyt/gnbzrVpIozhh5aUG+ZUFFLH7v9eJkiiW7IlKUDRW8JZXZT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu0CPCtZCGpCQiEccTAUBZWtIjybpXmBc3VDmRwj8b28tE4rax
	HpQ61q09FfKPFBJIZAjmT+J00yvRna6Our+nte5K1ny8NlrG+0Ep/fnD
X-Gm-Gg: AR+sD10TL0sajQtTE0QHpgnmmHIULIy9kIRW7ptLo1ayHfOJss1zXBk3ktsnOfZdldz
	N+ref2chO5Oq18PwySN2KIwdhnp41KYTb3E0n7YHPTze7gu8vNkFnQDs0hp418sMaeSBsxC7+Cu
	omKC/7Jl7AUYTx6x7+FZJ9ZYPNYKco7wCXkTAzOR96VnRr2VXphUVjvvS+go3QC0d/lblYTmi53
	kCM3EYsDlD0p/nazFAA6xoQxP768BUoeqoBDTNN0eUDeTKFWjaO/f02Jh4mt60Cz7nzPgRvB8ro
	NM5R8ks8fFZ9PEniz6zvaK+ZbY6beDEiNRvSoPrJ41ZsNrVXIomQqGPFUduLfJdbi9/QOR75IQc
	SJcCFmGN8Fru5MF/0ZflHHRYyJQXpvXzSWBQPwKB8p/8e3fZgqdarRzNbtqUcD+Yyl7P46xVtqi
	lr/XvtKKshN+CpZ1nYKTuC72F5T1TytSMpUCPza5NyGaGlZokKg97bx/PLdj0Ulac=
X-Received: by 2002:a17:90b:56d0:b0:38e:e0b:320d with SMTP id 98e67ed59e1d1-38e4b594707mr17316465a91.41.1784600095935;
        Mon, 20 Jul 2026 19:14:55 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9235a4dcsm586241a91.12.2026.07.20.19.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:14:55 -0700 (PDT)
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
Subject: [PATCH v4 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
Date: Tue, 21 Jul 2026 10:13:55 +0800
Message-ID: <20260721021356.288506-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721021356.288506-1-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_191456_854573_10CEE3F1 
X-CRM114-Status: GOOD (  12.73  )
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
24-bit fixed-point rounding to 3 decimal places using the kernel's
DIV_ROUND_CLOSEST_ULL helper:

  n_frac = n * 1000 + DIV_ROUND_CLOSEST_ULL(x * 1000, 1 << 24)

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index bfedd45bd04b..eb9d69d2077b 100644
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
+		/* convert 24-bit fraction to 3 decimal digits, rounding to closest */
+		n = n * 1000 + DIV_ROUND_CLOSEST_ULL((u64)x * 1000, 1ULL << 24);
+		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
 	}
 	return pll_freq;
 }
-- 
2.43.0


