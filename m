Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3467ACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jp3335aj9Yj2UDZJ9eBt4OQD1bDQLXy/33bZdHwnWV8=; b=H0GmJN2d7Bv4MXpt1xTqsvAxaG
	WrvvtEAr95t9gqAGAntICZM983EnX4lj2TVnbPpIYt7cpO+9GcDgdYdDPupmxm/LKyiXVOygCbzvg
	w4+AKx8rWR8ZsyzvUBQTR9/ax4RwEU7IXD6vDVY10WwYpUUYFg/6l1Rq4zvki6h+aSxV8He5i00sd
	5QndzzDQNieVGLcfxHAVGClNXlP21Hz8NL7zuqmni7RKfrSboyEHSr2C3ai+T3kNHHatuLrLxIEJ3
	eUm+Yx7BN4pFZGLfEvn1b0IC0EYfCrbEfV41w1eNf4UcR15Jp0S7SbA+06nDn+tZzLjq7LI7mEFRH
	ZvugTB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOcN-000000089IT-3ojH;
	Sat, 30 Aug 2025 16:39:55 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usORY-000000088NR-0UJj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:28:45 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-70dfcc589a6so27567186d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571323; x=1757176123; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jp3335aj9Yj2UDZJ9eBt4OQD1bDQLXy/33bZdHwnWV8=;
        b=SX5FhT7TJ6Q+rKFFx07BrlHcyCes5tbwWIcQH5apCWfoBQ2ZPCVEVqwB1NG9JTNnxa
         AI+4jZv5xNVj6PMG3pqwxCQHYk5+59Kzp4vv5KgRppqYQeOAVTXGt4X7vNWYOG8zNPmi
         9Cf8ErkixlWaA7F9r6E8w9SaLiORc3gC22Mhg5c1MUOcsrhTFctgJjcA7VjUkRsreKmj
         TrnkjmjnCOhlWdAkFu4j7NEL+wqj3/dHCYixFmIR00Yl3k7GQsuCidLTuF0f2UAXNwhz
         4oCnldmyk7P1Fee0a34WwMepQXskJBEWGmu+AqyS9BYauoZoSFYDmc+umFMtZD5n2V1S
         61bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571323; x=1757176123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp3335aj9Yj2UDZJ9eBt4OQD1bDQLXy/33bZdHwnWV8=;
        b=cauU68D53PYrGRSTyMYRKU9it9KyhbjAd//0kc+/jS+IBmLYqi6X84W2fHS89TiDPT
         X8hwQOkh6bqFCSe6wMCYcSdl7Z8W5nLF1sbJcayt9Kgi8OmZs3rRNhXzZMSVmmiyCf/J
         K0kaRK0bGNvd/g3+79OYzL8VYZ1/Z6Sm0QG/cAeQFHAZ7C/nLzf7TWURp9Wp+2PFWqt2
         EskftdHuru9LklkJd3Z//0ZAXfwUIvWQ74qHE1s/UbF13mu4SaH27+2ooKtvB7BKQZXT
         0X5r7vCLZ7D/f0xfbCVu6TUSdVcm6K2h24H8s/damIQtCG/D1Gg5LhDxbq4M2cXwlrwi
         GYFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv0mse5M0rWIveZ0FYM5hfLKMQ3EBNZayxFZtj+4sk9tTcf8JFTWUUbQ7MG51OYjb2Mw758k76bCRCxFaDeySg@lists.infradead.org
X-Gm-Message-State: AOJu0YxlSpIIojRrUihdmRO4KWuFIkzw10cdgE3K9tiyez2frYvHuZmK
	XXvXLyWk7Ac4tLxSpbwFGL0TDa1YZseApKTrubsrUbqt5LUXuWTIEP60
X-Gm-Gg: ASbGncuyjYvRL43Jrp5oEtpGpDwyhLjEt7QrO5dWiwiRhfAlB8hyS9zJ8pO72Jtuw71
	EONpKSxloB8PmkbVMts72/8sC9lJdBsVv6gVRCQRH+u5MXAWjrrxYicRm6cTQklYYPXmFZoo1hu
	tsnOvs0JKYvW9j6GAM4FSPajZEQQXwTq+YNx7wJIO+LSZfCoR0UonthGQc9x/nrxBHCgqjk2fkX
	fvj2AUmjO0cVWWN0ZUqCeFdXU9azY6ywxSoJH+bwB4IVtc9GofhHdMc4WDvelZ1YRtAojVvTGzP
	uj9gMGv/GC7TIVw7I8MDtJ7i681nlPoJyiUl4K0BAnBIOZJNH/5Wb1P0zDY7Orc9Bb4+fDkYkma
	Gyj8X/1B8dCpNy6JmsKmoCh/slCQe+nLZzxD0xss=
X-Google-Smtp-Source: AGHT+IHJtM2kf2fYzkUBRN/B3fRR3u9p+22MDICe9V4EbnQskhGNSNPZfIs+JlGxxe2YE1fIADbAsg==
X-Received: by 2002:a05:6214:2425:b0:70d:6df4:1b07 with SMTP id 6a1803df08f44-70fac906e41mr26867476d6.53.1756571322917;
        Sat, 30 Aug 2025 09:28:42 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:42 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 30 Aug 2025 16:28:40 +0000
Subject: [PATCH v5 3/5] clk: samsung: exynos990: Replace bogus divs with
 fixed-factor clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-fix-cmu-top-v5-3-7c62f608309e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571319; l=3403;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=l3sVrdnJv1dCoe2zTIV4QQOQgosblDanMaN6/DUrxNk=;
 b=bWMZV72hCHH8WTWopB+8nMN/ZoLxLeornlqLEOU4HlDU74gAsMkfzBr1KtoTAEUavVR3m27N0
 O068adzet0EBjyq3Y9B/1dU1Q72rC7iHtzDEUHXbNaxrP+Cpov3S/C2
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_092844_161747_E72B0222 
X-CRM114-Status: GOOD (  10.65  )
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

HSI1/2 PCIe and HSI0 USBDP debug outputs are fixed divide-by-8.
OTP also uses 1/8 from oscclk. Replace incorrect div clocks with
fixed-factor clocks to reflect hardware.

Fixes: bdd03ebf721f ("clk: samsung: Introduce Exynos990 clock controller driver")
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 385f1d9726675b37a901e1bb6172dc839afbb209..8571c225d09074cfd1c299879c1e6b4a7322520a 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -931,16 +931,11 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_HSI0_DPGTC, 0, 3),
 	DIV(CLK_DOUT_CMU_HSI0_USB31DRD, "dout_cmu_hsi0_usb31drd",
 	    "gout_cmu_hsi0_usb31drd", CLK_CON_DIV_CLKCMU_HSI0_USB31DRD, 0, 4),
-	DIV(CLK_DOUT_CMU_HSI0_USBDP_DEBUG, "dout_cmu_hsi0_usbdp_debug",
-	    "gout_cmu_hsi0_usbdp_debug", CLK_CON_DIV_CLKCMU_HSI0_USBDP_DEBUG,
-	    0, 4),
 	DIV(CLK_DOUT_CMU_HSI1_BUS, "dout_cmu_hsi1_bus", "gout_cmu_hsi1_bus",
 	    CLK_CON_DIV_CLKCMU_HSI1_BUS, 0, 3),
 	DIV(CLK_DOUT_CMU_HSI1_MMC_CARD, "dout_cmu_hsi1_mmc_card",
 	    "gout_cmu_hsi1_mmc_card", CLK_CON_DIV_CLKCMU_HSI1_MMC_CARD,
 	    0, 9),
-	DIV(CLK_DOUT_CMU_HSI1_PCIE, "dout_cmu_hsi1_pcie", "gout_cmu_hsi1_pcie",
-	    CLK_CON_DIV_CLKCMU_HSI1_PCIE, 0, 7),
 	DIV(CLK_DOUT_CMU_HSI1_UFS_CARD, "dout_cmu_hsi1_ufs_card",
 	    "gout_cmu_hsi1_ufs_card", CLK_CON_DIV_CLKCMU_HSI1_UFS_CARD,
 	    0, 3),
@@ -949,8 +944,6 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    0, 3),
 	DIV(CLK_DOUT_CMU_HSI2_BUS, "dout_cmu_hsi2_bus", "gout_cmu_hsi2_bus",
 	    CLK_CON_DIV_CLKCMU_HSI2_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_HSI2_PCIE, "dout_cmu_hsi2_pcie", "gout_cmu_hsi2_pcie",
-	    CLK_CON_DIV_CLKCMU_HSI2_PCIE, 0, 7),
 	DIV(CLK_DOUT_CMU_IPP_BUS, "dout_cmu_ipp_bus", "gout_cmu_ipp_bus",
 	    CLK_CON_DIV_CLKCMU_IPP_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_ITP_BUS, "dout_cmu_itp_bus", "gout_cmu_itp_bus",
@@ -990,6 +983,16 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
 };
 
+static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {
+	FFACTOR(CLK_DOUT_CMU_HSI1_PCIE, "dout_cmu_hsi1_pcie",
+		"gout_cmu_hsi1_pcie", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_OTP, "dout_cmu_otp", "oscclk", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_HSI0_USBDP_DEBUG, "dout_cmu_hsi0_usbdp_debug",
+		"gout_cmu_hsi0_usbdp_debug", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_HSI2_PCIE, "dout_cmu_hsi2_pcie",
+		"gout_cmu_hsi2_pcie", 1, 8, 0),
+};
+
 static const struct samsung_gate_clock top_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_CMU_APM_BUS, "gout_cmu_apm_bus", "mout_cmu_apm_bus",
 	     CLK_CON_GAT_GATE_CLKCMU_APM_BUS, 21, CLK_IGNORE_UNUSED, 0),
@@ -1133,6 +1136,8 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_mux_clks = ARRAY_SIZE(top_mux_clks),
 	.div_clks = top_div_clks,
 	.nr_div_clks = ARRAY_SIZE(top_div_clks),
+	.fixed_factor_clks = cmu_top_ffactor,
+	.nr_fixed_factor_clks = ARRAY_SIZE(cmu_top_ffactor),
 	.gate_clks = top_gate_clks,
 	.nr_gate_clks = ARRAY_SIZE(top_gate_clks),
 	.nr_clk_ids = CLKS_NR_TOP,

-- 
2.50.1


