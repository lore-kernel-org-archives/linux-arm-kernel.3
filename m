Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A12CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 12:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3uSjwmL4EbTen81eC7wTPWqRW/v/A4hMDubGZKs3NF4=; b=1XNysojd47kUon6Dliy46H377h
	KBVt9GvJzcwCLPYM7AtSwsPrVrzVZDQdBXlhpvyTLromPrY5xZmjNY/zy6vwoSBujlLEiPDv0lvgt
	84Y7TmP15G+BWHLzAn4y/ml25K6mc+zE/a3YQd+5fTcaiOmdNVwWfVBvwJk/LkUzZ7DH/FD0C4n98
	B1sX0Dw0EpNh1yo0hKNryAWIccsR37fFw9QOboTzpSJzeMSv8bNLc9S29041LqCIAkTfGqGomvklO
	rNWwbpTdFL+6UBxSpkX4jZb3W2XjTlEy4mOB2KUvNPw5+yuFlcPSnsqN1WTBS6RjjvxXygDDHLQ78
	Yl1QAcoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMtg-00000007lgq-0fZU;
	Wed, 24 Jun 2026 12:40:04 +0000
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMtd-00000007lcw-1bdX;
	Wed, 24 Jun 2026 12:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3uSjwmL4EbTen81eC7wTPWqRW/v/A4hMDubGZKs3NF4=; b=hhoBPKDy31+j8iBy4QEpnYSu5A
	bQR0PlKuWEXAsFfki3nNRMmEA1bTicm+cxkoAyDqozQKKM5PvtprIBK0mSYjR2LIxTqfHvDy3AtJk
	ksMAqYguxge46wO38IuZydS4abcIvPkwjoXkx9SXP22YXYGMBqPGprc0IbnxU6sTvBrPxCyOy4hXv
	l/9xHX4l8b1zZrHBZ79m/uZOzVxFw2tdwLNuw2I1VMxhz4tnihVCFZpD8o2CGixuIhG/rdImFMxAa
	RrL6aUw4n+saFeZ67uYhioo9vb8liZpRJOxhxOSE1O/ZsXcs03oXgCk5/FfBTcjLDtxtVV0P0OLoW
	HjM5aRGw==;
Received: from [81.57.40.39] (port=37932 helo=superkali.me)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wcMsx-00000006N1g-26F0;
	Wed, 24 Jun 2026 14:39:16 +0200
From: Daniele Briguglio <hello@superkali.me>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Ricardo Pardini <ricardo@pardini.net>
Subject: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
Date: Wed, 24 Jun 2026 14:39:14 +0200
Message-ID: <20260624123914.1767374-1-hello@superkali.me>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_054001_575846_BF2A3A48 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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

No in-tree board references these gates yet. Boards drive the codec
MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
managed clocks, clk_disable_unused() turns them off at boot. On a board
that relied on firmware leaving the output enabled, that cuts the MCLK
and analog audio stops working.

Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
state firmware left. A board that wants the kernel to own the gate can
reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.

Fixes: 02b9b0bb6269 ("clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO")
Reported-by: Diederik de Haas <diederik@cknow-tech.com>
Closes: https://lore.kernel.org/linux-rockchip/DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com/
Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 drivers/clk/rockchip/clk-rk3588.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 2ba9976654c..86953f9ffee 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -895,7 +895,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	MUX(I2S2_2CH_MCLKOUT, "i2s2_2ch_mclkout", i2s2_2ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(30), 2, 1, MFLAGS),
 	GATE_GRF(I2S2_2CH_MCLKOUT_TO_IO, "i2s2_2ch_mclkout_to_io", "i2s2_2ch_mclkout",
-			0, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
+			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
 
 	COMPOSITE(CLK_I2S3_2CH_SRC, "clk_i2s3_2ch_src", gpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(30), 8, 1, MFLAGS, 3, 5, DFLAGS,
@@ -912,7 +912,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	MUX(I2S3_2CH_MCLKOUT, "i2s3_2ch_mclkout", i2s3_2ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(32), 2, 1, MFLAGS),
 	GATE_GRF(I2S3_2CH_MCLKOUT_TO_IO, "i2s3_2ch_mclkout_to_io", "i2s3_2ch_mclkout",
-			0, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
+			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
 	GATE(PCLK_ACDCDIG, "pclk_acdcdig", "pclk_audio_root", 0,
 			RK3588_CLKGATE_CON(7), 11, GFLAGS),
 	GATE(HCLK_I2S0_8CH, "hclk_i2s0_8ch", "hclk_audio_root", 0,
@@ -942,7 +942,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	MUX(I2S0_8CH_MCLKOUT, "i2s0_8ch_mclkout", i2s0_8ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(28), 2, 2, MFLAGS),
 	GATE_GRF(I2S0_8CH_MCLKOUT_TO_IO, "i2s0_8ch_mclkout_to_io", "i2s0_8ch_mclkout",
-			0, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
+			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
 
 	GATE(HCLK_PDM1, "hclk_pdm1", "hclk_audio_root", 0,
 			RK3588_CLKGATE_CON(9), 6, GFLAGS),
@@ -2229,7 +2229,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	MUX(I2S1_8CH_MCLKOUT, "i2s1_8ch_mclkout", i2s1_8ch_mclkout_p, CLK_SET_RATE_PARENT,
 			RK3588_PMU_CLKSEL_CON(9), 2, 2, MFLAGS),
 	GATE_GRF(I2S1_8CH_MCLKOUT_TO_IO, "i2s1_8ch_mclkout_to_io", "i2s1_8ch_mclkout",
-			0, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
+			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
 	GATE(PCLK_PMU1, "pclk_pmu1", "pclk_pmu0_root", CLK_IS_CRITICAL,
 			RK3588_PMU_CLKGATE_CON(1), 0, GFLAGS),
 	GATE(CLK_DDR_FAIL_SAFE, "clk_ddr_fail_safe", "clk_pmu0", CLK_IGNORE_UNUSED,

base-commit: 7edfb7fb58ee058298e18fde76a6077ef17d19d8
-- 
2.47.3


