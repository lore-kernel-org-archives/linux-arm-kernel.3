Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB02C982D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuSdbCS6PnEOFW/yBPEagnpefQJlzkts0oUQFSt4QkQ=; b=4mYDV97+CRfyikiyl3y7I6JXlD
	/5bRy/eaKSgi8suu3DC8vtF3UQqLH+pmzi6hG16YDoNrL6Fb65o/jnvxSQZ5lXJGvFkhO6LfBrGBo
	vbDLqvu6WY3ked4bZIahDronndNeR7PcI3u2P0Utnrziq3tRHq8CKNRcRk5bOJX+OosT8UPUMwpwe
	VXVjgDfVKUBzDO0OvHZ7UQMwUh82ngBqchHVx16VJdRHAFwSmsK3wLr8UmLWMKK5JNK+mF0dwQRuK
	6jzKO9JZk9qFOoRqPFb/dp8lNY9fDK51bHS+umFuJMJFXuyEFJCXjlRfAdB6cajgVqYms/xokPgzN
	ZS5nyGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUb-0000000BRUA-2SWh;
	Thu, 17 Sep 2026 13:49:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUS-0000000BRKj-42Fr;
	Thu, 17 Sep 2026 13:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789652962;
	bh=VXjQmgPNcP6TxrE9fEJyZi07Hi5P0Q3culnMpUj9c98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L/TADqrjmFPk2K1ZX7k+LW5ZVhcd2vFs6kFuZZA6Jlhddudj5mKXh83EctWmN0tqt
	 5rMwd1BHGe+slfldSeYdjDPi0oWUZZCCdMgsNvPyofWih3Wgx7LpkvAednoRqRxPeE
	 aQ7sm3sRmykZOJG5NhjLapX/c6W22z6JVknnsw2SjFVJUD+KQVEa7u0fIcMzbIFdaG
	 qcDysICHQsCWfIZXY2loWh61qOZKX4NvI6AvXn475qG+ud4TBKhP/rxSOKm1r++m64
	 tpJYKsVTFVoafTpDDIs1FC3siumxQrosMrib23Jup1YdVziIgI6qI2P2jfwLiNyUv0
	 MmFc5c7eJuW+Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 222FB17E0D43;
	Thu, 17 Sep 2026 15:49:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 83215480038; Thu, 17 Sep 2026 15:49:21 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 17 Sep 2026 15:49:18 +0200
Subject: [PATCH 6/8] clk: rockchip: rk3588: add PCLK_DDR_MON_CH gate
 branches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rockchip-dfi-cleanup-v1-6-4f00a97a69a6@collabora.com>
References: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
In-Reply-To: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=WfqRSjYFz7+ljRQE5uaOc11qdMoKK31EtGs4gkDrNM4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqr7+FXLCthP7tD49VfVvHeEO0xRiIMMWLgb
 bnWmG28Z5g7+okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqq+/hAAoJENju1/PI
 O/qaTb0P/A/x5egj1nQnkPWKzWJD+O+aQG9ru/DmIrFaBLMjgGQrkSHhtEIZ8awBiU0V3dMMoH+
 IDh/siTsRM7qE5prdXcGNwomi4yfg2uhlfSNAKfXSXMEWfA3W2dqypLAPqoepd4Nwb125f9+tU3
 NRgBy6NZRNnXfY1cdeqLtLEcuGT5xXVzS0T3xMIGRPErATCCwG826QuCv5qV0d/8dpswZW/f6fz
 K3Df5RDIa/jLXjpA262tTj+BFgz2TI+ISm9oYvLtISL1ACHRUxDTMlbZ+euWTaoySFa6XcWcbpo
 h8bgi5d8K0YkW6t7lwgCmtK4WeAGHLthgQCQa2ndYiz9mMRlrk0p6cqV9xOJwJrTJElzrt3yAeE
 E775KVtDdK+JhhFWwnSRl0drOyZOIE5khUf1KJyn/N5RA+GTNc3lcoQ3x0JWilijOiM7dQYTR/q
 RzUe+xEWItOEDnpmtfkwHo86FzBH2DHEC/ht3ZFu1hz126rDKjvK7ZHnY1SsGwuw0uiOgb0aE51
 7LbAXuouUGATBzvyJ9Hb27Kfd3bHYjDKezCA2OiI0udmD1EyTenElgTNi3G4iF+BuIRABkCB4o7
 4DLTPUSRI+LnSIOkJBKRDowlqsr6O4u/z2UMstpgKjQW3folhlQ+QT0iEUmA1HRmV043byt8Qoi
 rBK2hfyG7aKXuLpeFftkuKA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_064929_178921_C7ACF20E 
X-CRM114-Status: GOOD (  11.72  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

On the Rockchip RK3588, each memory channel has some bandwidth
monitoring silicon (hence the "DDR_MON"), which is driven by a clock
gated by PCLK_DDR_MON_CH0/1/2/3.

These clock branches were left out of the mainline clock tree until now.

Add them, with the proper CRU reg bits, and the proper parent.  They are
given the "CLK_IGNORE_UNUSED" flag, so that older device trees with
newer kernels don't turn off the clocks because they're seen as not in
use.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 24baa0ef9bf3..0485faf27163 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -1349,6 +1349,14 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(CLK_DDR_CM0_RTC, "clk_ddr_cm0_rtc", mux_24m_32k_p, CLK_IS_CRITICAL,
 			RK3588_CLKSEL_CON(166), 5, 1, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(70), 4, GFLAGS),
+	GATE(PCLK_DDR_MON_CH0, "pclk_ddr_mon_ch0", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(20), 1, GFLAGS),
+	GATE(PCLK_DDR_MON_CH1, "pclk_ddr_mon_ch1", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(20), 14, GFLAGS),
+	GATE(PCLK_DDR_MON_CH2, "pclk_ddr_mon_ch2", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(23), 1, GFLAGS),
+	GATE(PCLK_DDR_MON_CH3, "pclk_ddr_mon_ch3", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(23), 14, GFLAGS),
 	GATE(PCLK_WDT, "pclk_wdt", "pclk_center_root", 0,
 			RK3588_CLKGATE_CON(70), 7, GFLAGS),
 	GATE(PCLK_TIMER, "pclk_timer", "pclk_center_root", 0,

-- 
2.53.0


