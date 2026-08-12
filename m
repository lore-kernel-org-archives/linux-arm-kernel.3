Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4F1C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 20:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yss421pOFQ9jL8McJw1jGVeZX3JUo3yrK+bhiRFPy4=; b=kGM0ZY7V1et+OgDCe1tOL7EH05
	KhNmYo02YlM1MnU55D8XU6R6fjEbXA154s35o7IYB/bn42Dcgmlhh4GyU31/zPnIsvBAcZMrhifEM
	kgvjFjc4mBWSKM1os2QhBLUP8YKEvtY3T+y8dwkfchNYYS5o5T/fGVXiKUR7ALuw8op8d9Ozt9Nhp
	B/KiZPssbzde9n1kjG2zSkcrqZyTMV9UFinXrFmUOeEQrE9a82wIvZ2GwGy1wwW/QYjDTkpbGCDOh
	NN7CtcrnCH5NsotoVYxCYcfpRK2iTkcV3Z6MiST5Ub5WLFNy7sv/XDCe+9WA1/6hrykljgVGIQsPi
	yZgxdzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFM3-0000000GyZq-3Zuv;
	Wed, 12 Aug 2026 20:15:15 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFLy-0000000GyXm-3G3m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 20:15:13 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7e9f1f24cbcso281184a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 13:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786565709; x=1787170509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2yss421pOFQ9jL8McJw1jGVeZX3JUo3yrK+bhiRFPy4=;
        b=sVXeR3Ejn1xYuVxQqbtrPYtqNRV8gesibOyWreL8dA51uPCI2NgY3pqGJnLpt+CNbJ
         LyXdHl6O9d50ypzf8kB/zzitrqYZvAatNG3gCU6GQlq51TBe5sff3vbr9pa5jKcvFMOB
         MXKk6oyY0VFo1IUt9nNaEFlFNQRVM36ILi2sifPcvHQbKvMo3meUDc4pu7mZmAdIA7c3
         4VroQPh16Pq7AdJB/xOCYqyxO3X9Zh7CeFt9fxKm3cmgGo2RJPxO9UPujeuZlw3fzLQT
         fub9UR0u9Gvp543FQrdndreDAf6FqEqhzeu3aM8tk2vslvuELID5NNUQ7HWILRaZtM1x
         fenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786565709; x=1787170509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2yss421pOFQ9jL8McJw1jGVeZX3JUo3yrK+bhiRFPy4=;
        b=cEpxf2IrPgWDSOM4oCYy0+TJuZX3pvamp8Rlh7Fl7/nCn6DoUFmO8/QjSqyjqABdc+
         Pg1TYUkCbERydQrOJc81yyprOV99oUsN1wnQ9DIIsvMQBd8hPIyiVY5OrMDjZXNmd1Cf
         fD6bsyBJVZwBbeX3L/sbiVJcPCVLNW5uNMij68w0j4oUwepvo+uH3nUNHESa54vVduy4
         c0tCV6Cpir1R1k2auZFxB5r8rCZmchxn27rMGZBI44dc24le52Rwqax3+hw6o+yRctld
         3HNOys1EpdKB93FAoxbEVg6wg+HpSt1r43CKnvWFqti6wXYGln3+bj0xL190OcoE6Tet
         /7Mw==
X-Forwarded-Encrypted: i=1; AHgh+RqdUe4JSIJ1VLy+S87tUrBjFtEjhmcp6w+e5nYnhka4cPNSsv5CTiBfYdrFQVRVsZRyV+MGlQwY3ViPnzvlLeaJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5zX5FJ5BprksU90kI1CgBkWv4zGjVAe7Qen4duCfA2fDRqiJs
	OYIbYaSlq9ZcucaE06+GwI+l6L4eJjr5BCu5CD80jzFNQWAQsMwSFCVw
X-Gm-Gg: AR+sD11PfzOmx1F7ouATuqkCKspiFR+HcrF5gYGRI0iY+sNIU2q+0GyyWIQZjUvg66e
	0JmMQenpUIUTh1Far+4ysYwYW78A57Qh1PF1vMxOk1MIZ8oqzju2xW3ygKYZUjJLIFZ6HDQ2k1M
	rFfX4wANBwyWCNFpTCLPyqJB9a9ujY/dw2yLuJqVMk3Jl0mMrnP6GA+Fvtpg6CsejescqzHYw/j
	JVwIZ5EZOFmgMG1yzR364B0OphuwzXielt4+7JkFfwdlQUot9QQkoVCIfU8Z5UtHixw/vJDJGh9
	xsb8hC7NANEYtkJvdW3wtJcM0IcythsVRCEHd+dJh7Goq26njBHTr0Wkzp4EfrfKQeXoaik1geb
	u8gcG7gT9UqJ5XVJPSgQ/t3TX9bKFcoIDc6TC5M6UfgP8LX/xCe0qWU/TiCJ/3vgPBGOwte0OLM
	xKyTK4RAqp49jOenSybC2g6OkBUg7RUiTDSdjnAPupvEy4ERk2MoEVEObOceXGzETl9u4lX9w5x
	roJ0PCqTBPY3ICumwMT7v8hb9q4YjepLYzmhk1n
X-Received: by 2002:a05:6830:82f9:b0:7f3:9729:a9e3 with SMTP id 46e09a7af769-7f3cad7c2f8mr70427a34.7.1786565709452;
        Wed, 12 Aug 2026 13:15:09 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3c9cf3b0csm256006a34.21.2026.08.12.13.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:15:08 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH RFT 2/2] clk: sunxi-ng: a523: use single-divider clock helpers
Date: Wed, 12 Aug 2026 16:15:02 -0400
Message-ID: <20260812201502.264919-3-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
References: <20260723004856.55158e84@ryzen.lan>
 <20260812201502.264919-1-enzo.adriano.code@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_131511_940255_BA740030 
X-CRM114-Status: GOOD (  13.33  )
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

The A523 MBUS, IOMMU, and DRAM clocks have an M divider but no P
divider, while HSTIMER0-5 and R-TIMER0-2 have a P divider but no M
divider. They currently use the two-divider ccu_mp class by declaring
the missing field with width zero.

ccu_mp_set_rate() unconditionally masks both divider fields, so a zero
width forms an invalid GENMASK() range and can clear unrelated register
bits. The M-only clocks also require the hardware update bit, which
ccu_mp operations do not handle.

Use the single-divider M helper for MBUS, IOMMU, and DRAM, and the
power-of-two P helper for the timer clocks. Preserve the parents,
registers, real divider fields, muxes, gates, clock flags, and
update-bit features.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260722010926.0A8B01F000E9@smtp.kernel.org
Link: https://lore.kernel.org/r/20260712081341.9D1431F00A3D@smtp.kernel.org
Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
Fixes: 74b0443a0d0a ("clk: sunxi-ng: a523: add system mod clocks")
Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Link: https://lore.kernel.org/r/CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com
Link: https://lore.kernel.org/r/20260723004856.55158e84@ryzen.lan
Assisted-by: Codex:gpt-5
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
not tested on A523/T527 hardware; testing on actual hardware is needed.

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c |  37 +++---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 136 +++++++++++------------
 2 files changed, 82 insertions(+), 91 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index db0e36d8838e74..349230e28c1c3a 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -43,27 +43,24 @@ static SUNXI_CCU_M_DATA_WITH_MUX(r_apb1_clk, "r-apb1",
 				 24, 3,	/* mux */
 				 0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0",
-				       r_ahb_apb_parents, 0x100,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0",
+				      r_ahb_apb_parents, 0x100,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
+				      0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1",
+				      r_ahb_apb_parents, 0x104,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
+				      0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2",
+				      r_ahb_apb_parents, 0x108,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
 				      0);
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1",
-				       r_ahb_apb_parents, 0x104,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
-				       0);
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2",
-				       r_ahb_apb_parents, 0x108,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
-				       0);
 
 static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer", &r_ahb_clk.common.hw,
 			 0x11c, BIT(0), 0);
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 20dad06b37ca31..5c632e475aaa04 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -380,14 +380,14 @@ static const struct clk_parent_data mbus_parents[] = {
 	{ .hw = &pll_periph1_150M_clk.hw },
 	{ .fw_name = "hosc" },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
-					    0x540,
-					    0, 5,		/* M */
-					    0, 0,		/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
+					   0x540,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_IS_CRITICAL,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static const struct clk_hw *mbus_hws[] = { &mbus_clk.common.hw };
 
@@ -513,58 +513,53 @@ static const struct clk_parent_data hstimer_parents[] = {
 	{ .fw_name = "losc" },
 	{ .hw = &pll_periph0_200M_clk.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
-				       hstimer_parents, 0x730,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer1_clk, "hstimer1",
-				       hstimer_parents,
-				       0x734,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
+				      hstimer_parents, 0x730,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer2_clk, "hstimer2",
-				       hstimer_parents,
-				       0x738,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer1_clk, "hstimer1",
+				      hstimer_parents,
+				      0x734,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer3_clk, "hstimer3",
-				       hstimer_parents,
-				       0x73c,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer2_clk, "hstimer2",
+				      hstimer_parents,
+				      0x738,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer4_clk, "hstimer4",
-				       hstimer_parents,
-				       0x740,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer3_clk, "hstimer3",
+				      hstimer_parents,
+				      0x73c,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer5_clk, "hstimer5",
-				       hstimer_parents,
-				       0x744,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer4_clk, "hstimer4",
+				      hstimer_parents,
+				      0x740,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer5_clk, "hstimer5",
+				      hstimer_parents,
+				      0x744,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
 static SUNXI_CCU_GATE_HWS(bus_hstimer_clk, "bus-hstimer", ahb_hws, 0x74c,
 			  BIT(0), 0);
@@ -584,14 +579,13 @@ static const struct clk_parent_data iommu_parents[] = {
 	{ .fw_name = "hosc" },
 };
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(iommu_clk, "iommu", iommu_parents,
-					    0x7b0,
-					    0, 5,	/* M */
-					    0, 0,	/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_SET_RATE_PARENT,
-					    CCU_FEATURE_UPDATE_BIT);
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(iommu_clk, "iommu", iommu_parents,
+					   0x7b0,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_SET_RATE_PARENT,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static SUNXI_CCU_GATE_HWS(bus_iommu_clk, "bus-iommu", apb0_hws, 0x7bc,
 			  BIT(0), 0);
@@ -603,14 +597,14 @@ static const struct clk_parent_data dram_parents[] = {
 	{ .hw = &pll_periph0_400M_clk.hw },
 	{ .hw = &pll_periph0_150M_clk.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(dram_clk, "dram", dram_parents,
-					    0x800,
-					    0, 5,	/* M */
-					    0, 0,	/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(dram_clk, "dram", dram_parents,
+					   0x800,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_IS_CRITICAL,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static SUNXI_CCU_GATE_HWS(mbus_dma_clk, "mbus-dma", mbus_hws,
 			  0x804, BIT(0), 0);
-- 
2.53.0

