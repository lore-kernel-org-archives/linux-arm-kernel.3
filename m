Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CE7C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 13:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lJQEYfDd5lCDevCn6r75/uRZma7oJzqLkyHUzsb8FjE=; b=ymlvjSMcmm8pf+mqg6vY4KMQ1/
	m5nLPvXfMC9pl952i0F5mtHNRUa9XhGcxfd6tOB5SQqEwR/zeje3DuXQnIjxaXsPrE3q0+HBiIiV3
	fzXDdGZfW3tTBnlLdrO5C2WQ1YqGWcd6PO7dowTUXH9d2/rV1or48eO7v2H0/SvOaBx2WVLUlVfeB
	vGEJPn0fXJGLx8m43dFyINzL5iPU5pBFFkEwFMIT1/YkE1RbL9Hc4WXKcbF/O7z/YVtvwyo0a5lCL
	pVmAc6/WDHdL7D+RHsC7J63Bd0J3nUNI4Pt0oLHfLRFbRopuMJij80Cxk4dtCkHzyCEN9rURa1eJk
	ONXqtgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2Pk-0000000Basi-08L6;
	Thu, 20 Aug 2026 13:02:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2Ph-0000000BasF-12bf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 13:02:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so6734295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1787230951; x=1787835751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJQEYfDd5lCDevCn6r75/uRZma7oJzqLkyHUzsb8FjE=;
        b=AYX+bwMJ6c+2VMJMNhFYb8BZegQK2083AzFHAt5ovAgCHorpIV7omAJLqx1WHb4L8m
         6O4F69VVnnByNzxIdmvCa7OyNp7XVlEqtgXwGcoovZKOkdqBW5mMenq81IxJswQcSSME
         HN1gBF3A72+x+3gKnTMInKPz6/FqJvRCtMJ96DUhVV4tzorjyCtKAczmv63aS0qL2gbt
         +N+zfeMSaH5SFCvhvdR4NpemzzUaPe6xXwE2UqvliLCqRLchDxb+Dqvgw6PBDpfMRrl3
         rtKVPZwX5c619JZaxpDb6XsDJoudofIq+fVZZoIP+HeQbbN0+2UyZQrMKcT52RTn9OFR
         eTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787230951; x=1787835751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJQEYfDd5lCDevCn6r75/uRZma7oJzqLkyHUzsb8FjE=;
        b=Og520zxyhGNIdkuodGTvp0eyHVra8ekF3XgGWiE2maL1Bj3ztR4oK+7JNbcYMjJ2ds
         DFE6kQLl7ezt3Sw8KdRZHLVrL6DA71niZKIVvV2UUw/chLXrJxZdkeJ5MSJku3at1BiW
         rIcnP8WNDNSHWHJGLW8YHpPFugXGRM8/Tza3Yz1hyFqoUGsaWXwfBfavzevbNTIEQ11a
         DCbMWa/a8f/PKoqbjEybGieLQ8qiLGMIOfsM2usqhxzRt/BdDip7+c5uadSfTaHj8l1d
         Q+wUgfqJGrFNp+omokl3z+gaeMAiOtns4NSHSNfFOlkxDDonYuZtTJbiaM/8Koh7YUhF
         8qgw==
X-Forwarded-Encrypted: i=1; AHgh+RoYXfGSdD+Zw8LEXaCpDOEmY63sLix1oA0zMEVa2uldsKIu+J5oBlb+1nZfX6MK4nMOk+FTVdfxWyFMu+uPhhQ7@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ7gv6mlYb4Qs9GpsanYrPXbskNp6riA3Uk9Va6ft0pktb6qui
	OXZkt1w0X4/JXN++hpKA+utK18tx0lVQ8cSk5Sab8rnlwG16mBNSf6FXh+UWTNkBdXyIEZ2yBFd
	fUHdzQpw=
X-Gm-Gg: AR+sD13qRpkjIZOT7/eaILN6JXsijJ7IwF6tQs00PyYavg70pgxpseRTS1dZAyifPSw
	VsxvnYS54HhQKuzmXbusFZi7thR0e+Dtzx6nTth9YXlVv4LkQT8PfBZVqW0skGJ+9rfh97GEAMw
	YXLZViddB46wcU3FhWSm9QnscJc73rlTIGez6YiMjQ159468wUUPnAEuPVjsj2xlKc9n4oT6iuM
	vXcitzLqH85cwqyM7TLQ/f8j75Wu+Etee/hzIM4KRmd9QNlsx87YrmaC9zK6I5peBqZNJaF7Ibx
	xs6U7I9rdyajtiFmv0nVQr5bkYTyZUzBZ3NHSR2tHrqtXYJKEgSXq5atLmwLT4V4D5wsFIu7EcS
	AiQEKce5MyZV19srmUKz/0mTSVjmOdJWaaE5Ovf+UwZJpyF3AjW42xIdS4/zyy2A9BZz6Ybp9et
	h1JVAflQWl28jJMe6S4Vx0LiBb34vlCxZCwVUrr6HE32EX4C2bcm45HnaJIR1kiapALwU4sqCuC
	v6EmpVbarlRbV052E+Rk7RE
X-Received: by 2002:a05:600c:1d15:b0:499:b2ce:e394 with SMTP id 5b1f17b1804b1-499b2cee3femr55797285e9.5.1787230951264;
        Thu, 20 Aug 2026 06:02:31 -0700 (PDT)
Received: from dev-ag.figment.co.za ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441748sm13584333f8f.8.2026.08.20.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:02:30 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-clk@vger.kernel.org
Cc: qinjian@cqplus1.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH] clk: sp7021: fix infrastructure clocks clobbering PLL provider entries
Date: Thu, 20 Aug 2026 15:02:24 +0200
Message-ID: <20260820130224.1584902-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_060233_315220_626CA14F 
X-CRM114-Status: GOOD (  18.46  )
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

The sp_clk_gates[] array previously included 9 infrastructure gate
clocks (CLK_SYSTEM, CLK_IOCTL, etc.) appended after the 64 DT-visible
gate clocks. The registration loop used the array index directly as the
hws[] index, so infrastructure clocks at positions 64-72 overwrote
hws[PLL_A] through hws[PLL_SYS].

As a result, DT lookups for <&clkc PLL_E_25> (index 67), PLL_E_2P5
(66) and PLL_E_112P5 (68) silently resolved to CLK_RBUS, CLK_IOP and
CLK_SDCTRL0 respectively. The L2SW Ethernet driver believed it was
holding the PLLE outputs, but was actually double-referencing already-
critical infrastructure clocks. The real PLLE outputs remained at
enable_count=0 and were powered down by clk_disable_unused(), causing
an Ethernet hang on boards with fixed-link MAC-to-MAC connections.

Fix by splitting infrastructure clocks into a separate sp_clk_infra[]
array and registering them with a dedicated loop that uses a local hw
variable rather than an hws[] slot. Since these clocks have no DT
consumer they do not need to appear in the of_clk provider table.

With the provider table correct, the L2SW driver's devm_clk_get_enabled()
calls now hold the actual PLLE outputs, making CLK_IS_CRITICAL on plle
and its sub-outputs unnecessary. Remove it.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/clk/clk-sp7021.c | 42 +++++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
index 1d067b0af8a7..50c667cbb3dc 100644
--- a/drivers/clk/clk-sp7021.c
+++ b/drivers/clk/clk-sp7021.c
@@ -124,9 +124,14 @@ static const struct sp_clk_gate_info sp_clk_gates[] = {
 	{ 0x97 },
 	{ 0x98 },		/* CLK_ICM: Input Capture Module */
 	{ 0x99, 0, true },	/* CLK_AXI_GLOBAL: AXI interconnect, no driver consumer */
-	/* Infrastructure clocks: all default to enabled in hardware but
-	 * have no driver consumer, so marked critical to prevent gating.
-	 */
+};
+
+/*
+ * Infrastructure clocks have no DT consumer so are not exposed
+ * through the of_clk provider. They are registered separately and
+ * marked CLK_IS_CRITICAL so clk_disable_unused() never gates them.
+ */
+static const struct sp_clk_gate_info sp_clk_infra[] = {
 	{ 0x00, 0, true },	/* CLK_SYSTEM:  SYSTEM CLKEN    mo_clken0 bit 0  */
 	{ 0x03, 0, true },	/* CLK_IOCTL:   IOCTL CLKEN     mo_clken0 bit 3  */
 	{ 0x04, 0, true },	/* CLK_IOP:     IOP CLKEN       mo_clken0 bit 4  */
@@ -644,25 +649,23 @@ static int sp7021_clk_probe(struct platform_device *pdev)
 	/*
 	 * PLLE and all its sub-outputs are used by the L2SW Ethernet switch
 	 * (50MHz RMII, 25MHz MII/100M, 2.5MHz MII/10M, 112.5MHz MAC fabric).
-	 * The L2SW driver explicitly claims these via clock-names in DTS, but
-	 * CLK_IS_CRITICAL is kept as a belt-and-suspenders guard in case the
-	 * driver consumer reference isn't sufficient on all board configurations.
+	 * The L2SW driver explicitly claims these via clock-names in DTS.
 	 */
 	hws[PLL_E] = sp_pll_register(dev, "plle", &pd_ext, PLLE_CTL,
-				     6, 2, 50000000, 0, 0, CLK_IS_CRITICAL);
+				     6, 2, 50000000, 0, 0, 0);
 	if (IS_ERR(hws[PLL_E]))
 		return PTR_ERR(hws[PLL_E]);
 	pd_e.hw = hws[PLL_E];
 	hws[PLL_E_2P5] = sp_pll_register(dev, "plle_2p5", &pd_e, PLLE_CTL,
-					 13, -1, 2500000, 0, 0, CLK_IS_CRITICAL);
+					 13, -1, 2500000, 0, 0, 0);
 	if (IS_ERR(hws[PLL_E_2P5]))
 		return PTR_ERR(hws[PLL_E_2P5]);
 	hws[PLL_E_25] = sp_pll_register(dev, "plle_25", &pd_e, PLLE_CTL,
-					12, -1, 25000000, 0, 0, CLK_IS_CRITICAL);
+					12, -1, 25000000, 0, 0, 0);
 	if (IS_ERR(hws[PLL_E_25]))
 		return PTR_ERR(hws[PLL_E_25]);
 	hws[PLL_E_112P5] = sp_pll_register(dev, "plle_112p5", &pd_e, PLLE_CTL,
-					   11, -1, 112500000, 0, 0, CLK_IS_CRITICAL);
+					   11, -1, 112500000, 0, 0, 0);
 	if (IS_ERR(hws[PLL_E_112P5]))
 		return PTR_ERR(hws[PLL_E_112P5]);
 
@@ -689,7 +692,7 @@ static int sp7021_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hws[PLL_SYS]);
 	pd_sys.hw = hws[PLL_SYS];
 
-	/* gates */
+	/* gates, directly mapped into hws[] for DT lookup */
 	for (i = 0; i < ARRAY_SIZE(sp_clk_gates); i++) {
 		char name[10];
 		u32 j = sp_clk_gates[i].reg;
@@ -706,6 +709,23 @@ static int sp7021_clk_probe(struct platform_device *pdev)
 			return PTR_ERR(hws[i]);
 	}
 
+	/* infrastructure gates, not in hws[] */
+	for (i = 0; i < ARRAY_SIZE(sp_clk_infra); i++) {
+		char name[14];
+		u32 j = sp_clk_infra[i].reg;
+		struct clk_hw *hw;
+
+		sprintf(name, "infra_0x%02x", j);
+		hw = devm_clk_hw_register_gate_parent_data(dev, name, &pd_sys,
+							   CLK_IS_CRITICAL,
+							   clk_base + (j >> 4) * 4,
+							   j & 0x0f,
+							   CLK_GATE_HIWORD_MASK,
+							   NULL);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+	}
+
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 }
 
-- 
2.53.0


