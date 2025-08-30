Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A57BCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 16:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JB3/HRxiAmtWh+pEgNnmHQKJRpUH6uuEO8MQvS3SDQ=; b=m8XGKmICv2bryQMBWoSpbd++7Q
	b9rUGujKhWhvddEQ7IP5Vu5VwRW6F7R2w+w0FOpxzwwZr75fXQp6bH/s1F8rWh+FoQp21sKK++3IV
	Sco/pxtFMYVGhdI5CVxtgUQOJkizAsPmENbI4KvLvzucFCcfhaGH3X89C07FvkE5B4Tzv+FV4bW+n
	l/ZFsV91uX8OPHBa1qQ88SxjzhmoutXeGcakdPs/5QkKt23kpdNhpbDFO4jrGB81t8E4wQkFln4HG
	TnadjQWU8kibEp1WW3SH/B3kkOolsQ4BpTanObOWyZHa9QQeAorCeEMkV0+4QctF3EnQGzYBuCk8O
	sHh2YINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOWz-000000088xs-1389;
	Sat, 30 Aug 2025 16:34:21 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usORW-000000088Mk-3Ufx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:28:43 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7fe9eea0d21so85653685a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571322; x=1757176122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JB3/HRxiAmtWh+pEgNnmHQKJRpUH6uuEO8MQvS3SDQ=;
        b=MDi09tFOmoXEM1/HYbskQzAU3Q3MBLh3jX4X2jbMGKyD6y9yoernyIyHSZfNSsmSXK
         JSs836qjtRMlk6RGcyaA57i/dLGEeZHP389FbWEGkqPBC4lCQHCVA5PEAitUrG7dranw
         tX25rrJIVb9yMLxp5f23e2FAB6f0Hn1FmbVNkGMli7OjeJPkr7rLzJEsyMpTSK6xNhkL
         YPgYN6fRPPzbCQuI4Nc9/GCegmCqh1VqpTJ8RaWYog0aC+g6GPVEBYL+orPuzDzKIKWH
         PKeqA20T19g1WNx1Cbx9AAxeKqCkdRpRjIFdkdeddId9symUzJOzGWM/Z1e+4yMR4TnI
         wjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571322; x=1757176122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JB3/HRxiAmtWh+pEgNnmHQKJRpUH6uuEO8MQvS3SDQ=;
        b=qt8yXxaE9IHD2+oXGq6y7sqQIsc0f4xCUUmLZtn2js9cmmqkSRzcGAJaGfsXdtnn8y
         cpMGOJ01ojpzkELQ9W5oqz5phnCaBgBWrBHuyl7GZmsnVA7tczvT9TWmFy4NkpXN6lAQ
         ycXnKg5svPRLNKMzS2sChaGaOjkEoh9Bq4uh/Gq7Dfj0UY+Zx6VeCGFT6Ukjft5n0BrP
         XU/V6vLsCkyJxl84KUNSHtP9d0dyE+9jotzXuwjX56TrGMkDD2+aDUgavDtmQJ0d3zOs
         kAwiji6/gEXIKaAhDCxP9SIkeLad/TcxYJbooiXOsmhWAJvse5KwrH6R7CLNaOFPw+bT
         IAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUAJEJnc8LP9/njFHm1hYjdz1ltiYvV703YjKKPN1ATZKZjIip8N4MFHUaLLW6iesxnitNP1UZREArPc1CVVwV@lists.infradead.org
X-Gm-Message-State: AOJu0YzODBdEISXxpXKe8wnYKRXgOYH3TdFzpKZdZDFZSH1UwoiPtc+t
	aQTHDk3gQrW1/MdMC5DsMcpARlJ9WMDtrEzkEm1coZ5PXf3wIKXKi4M5
X-Gm-Gg: ASbGncvVP8dqBrda4JwS/Z4xn+3T3/S8KYxBQGfaDbcAMxVrlQnLMQfRB/MyYX2gWHW
	Wv3huHaC/1Ntb0U502wkfY62IAqBMv1ihJpl/cFjAm8C0Emo710aVi3LtEjTFM9q3jGqQU7GdrM
	R3io5Wh16KMNCmWt8olJ9e0BUivDCVip5SQYkK6zftngo9qqvhMPF0Ic6D4Zckfg23aUQePCLVu
	xQ/WjiFd85VNnRPKj5+qs4NLW+AhzfL9hdypbjAz1C7pBYxBi50zaJ5OJhy/JQNA8l8LEHS0pZT
	XnjxO8k8hM3cvbBrq4nPGZCoZjL3L4W2AZ1lQRHvtVZdQsuNnLtnCtKkfc40UKLclfOw5mnAt6h
	oeezvnB142hRfqsAHkQcUUmHzudsVstjQ4PAMrQQ=
X-Google-Smtp-Source: AGHT+IGnhEMMnBdR9lydAVMTUpQDQ/k7ZP81tvaRPU+NFS9Cml/2rz2bOOkl/9gh5lwSLSX/oq8avg==
X-Received: by 2002:a05:620a:45a3:b0:7f9:c004:42e with SMTP id af79cd13be357-7ff21cfd0demr298897985a.0.1756571321432;
        Sat, 30 Aug 2025 09:28:41 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:41 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 30 Aug 2025 16:28:38 +0000
Subject: [PATCH v5 1/5] clk: samsung: exynos990: Use PLL_CON0 for PLL
 parent muxes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-fix-cmu-top-v5-1-7c62f608309e@gmail.com>
References: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
In-Reply-To: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571319; l=2137;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=6yax87RqbvYF0ActasAJerhVa1SUTvfy73gnHEk7z9c=;
 b=BCbvIMxI7eRG7Yukaw4ERMJfQIzWK6VhM8NKMcnXh5upDYGzAtOTPVieAzFHIx6K4czcLEYoe
 JleTq1TdQLJDxq4lWQ+TFncQfCy35ey6m1XL8S3pVNDC2U2WTA4BgnJ
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_092842_876229_24B85284 
X-CRM114-Status: GOOD (  11.28  )
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

Parent select bits for shared PLLs are in PLL_CON0, not PLL_CON3.
Using the wrong register leads to incorrect parent selection and rates.

Fixes: bdd03ebf721f ("clk: samsung: Introduce Exynos990 clock controller driver")
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 8d3f193d2b4d4c2146d9b8b57d76605b88dc9bbb..12e98bf5005ae2dc32da0da684a15133d64ed305 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -239,12 +239,19 @@ static const unsigned long top_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_SHARED2,
 	PLL_LOCKTIME_PLL_SHARED3,
 	PLL_LOCKTIME_PLL_SHARED4,
+	PLL_CON0_PLL_G3D,
 	PLL_CON3_PLL_G3D,
+	PLL_CON0_PLL_MMC,
 	PLL_CON3_PLL_MMC,
+	PLL_CON0_PLL_SHARED0,
 	PLL_CON3_PLL_SHARED0,
+	PLL_CON0_PLL_SHARED1,
 	PLL_CON3_PLL_SHARED1,
+	PLL_CON0_PLL_SHARED2,
 	PLL_CON3_PLL_SHARED2,
+	PLL_CON0_PLL_SHARED3,
 	PLL_CON3_PLL_SHARED3,
+	PLL_CON0_PLL_SHARED4,
 	PLL_CON3_PLL_SHARED4,
 	CLK_CON_MUX_MUX_CLKCMU_APM_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_AUD_CPU,
@@ -689,13 +696,13 @@ PNAME(mout_cmu_vra_bus_p)		= { "dout_cmu_shared0_div3",
 
 static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PLL_SHARED0, "mout_pll_shared0", mout_pll_shared0_p,
-	    PLL_CON3_PLL_SHARED0, 4, 1),
+	    PLL_CON0_PLL_SHARED0, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED1, "mout_pll_shared1", mout_pll_shared1_p,
-	    PLL_CON3_PLL_SHARED1, 4, 1),
+	    PLL_CON0_PLL_SHARED1, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED2, "mout_pll_shared2", mout_pll_shared2_p,
-	    PLL_CON3_PLL_SHARED2, 4, 1),
+	    PLL_CON0_PLL_SHARED2, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED3, "mout_pll_shared3", mout_pll_shared3_p,
-	    PLL_CON3_PLL_SHARED3, 4, 1),
+	    PLL_CON0_PLL_SHARED3, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED4, "mout_pll_shared4", mout_pll_shared4_p,
 	    PLL_CON0_PLL_SHARED4, 4, 1),
 	MUX(CLK_MOUT_PLL_MMC, "mout_pll_mmc", mout_pll_mmc_p,

-- 
2.50.1


