Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2FDC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 00:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KtIxrf7fTzd0jdzmsRp+b8vs2Q0qGkjWrMthfnytKg=; b=HJAVoGPXRyCYMe0P43nXC+IQsF
	0vuX8onhEFTXe8dA3n4SfYPUYmx5DmmdSpDE51Bep0zBDWsCb0jHXBCeZelKG/7W4DYn1vTBiLcK9
	0EP/XMv8FhOzWbE8Sthr1irNeM2Pi7R2kmRqLSmSL5bNv4aMepoceYrLffDLL+0Ba7VqhMaNmz7zx
	PA8I6Wkw/kBw0Yub6MNso48eA77rpTpex8qrhB04rkN2KO4oftWSmhVTTOP2Iw2zJT6OX1eFb2AJG
	O3g+v7v1ve6Rj2Mir7cCQ5l1KDZVGOpLvLjuQkyXdS2yV6s+9/9Olbo9D1rxBijSgzXfuDXKgrf6L
	Ej5sUjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfUC-0000000AMkm-0pNe;
	Thu, 10 Jul 2025 00:50:04 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf26-0000000AJNY-31rD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 00:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106860; bh=qWmBsEXjof5WOQG7ffmGQJRoOEwMaSMpAylD9izQWXg=;
	l=4602; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=oPaFNhxfnEZww+BKf7+XBo/rHhX9uQl3190LEwR8k3BI6DDu46lXXlhTG0IiH32ri
	 b9xIGlmp45c0SVAwiHGOWS57eGupn5t6qd6OjqwPXmRZ9USySPEBB/0xmG9nDO83+c
	 q4EEO3EPr5l3RhOv269nXrzMG7NZHmj78Hv6h0Gw=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:21:00 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ravi.patel@samsung.com,
	ksk4725@coasia.com,
	smn1196@coasia.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev,
	v.pavani@samsung.com
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ravi Patel <ravi.patel@samsung.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev,
	Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH 10/16] clk: samsung: artpec-8: Add clock support for CMU_PERI block
Date: Thu, 10 Jul 2025 09:20:40 +0900
Message-Id: <20250710002047.1573841-11-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_172103_035104_2FD3AA1D 
X-CRM114-Status: GOOD (  11.45  )
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

From: Hakyeong Kim <hgkim05@coasia.com>

Add clock support for below CMU block in ARTPEC-8 SoC.
 - CMU_PERI

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
---
 drivers/clk/samsung/clk-artpec8.c | 90 +++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/clk/samsung/clk-artpec8.c b/drivers/clk/samsung/clk-artpec8.c
index 7ccec4ff8f70..f45bc9c113f0 100644
--- a/drivers/clk/samsung/clk-artpec8.c
+++ b/drivers/clk/samsung/clk-artpec8.c
@@ -20,6 +20,7 @@
 #define CMU_CPUCL_NR_CLK		(DOUT_CLK_CPUCL_PCLKDBG + 1)
 #define CMU_FSYS_NR_CLK			(DOUT_SCAN_CLK_FSYS_MMC + 1)
 #define CMU_IMEM_NR_CLK			(MOUT_IMEM_JPEG_USER + 1)
+#define CMU_PERI_NR_CLK			(DOUT_PERI_DSIM + 1)
 
 /* register offset definitions for cmu_cmu (0x12400000) */
 #define PLL_LOCKTIME_PLL_AUDIO			0x0000
@@ -798,3 +799,92 @@ static void __init artpec8_clk_cmu_imem_init(struct device_node *np)
 
 CLK_OF_DECLARE(artpec8_clk_cmu_imem, "axis,artpec8-cmu-imem",
 	       artpec8_clk_cmu_imem_init);
+
+/* Register Offset definitions for CMU_PERI (0x16410000) */
+#define PLL_CON0_MUX_CLK_PERI_AUDIO_USER		0x0100
+#define PLL_CON0_MUX_CLK_PERI_DISP_USER			0x0120
+#define PLL_CON0_MUX_CLK_PERI_IP_USER			0x0140
+#define MUX_CLK_PERI_I2S0				0x1000
+#define MUX_CLK_PERI_I2S1				0x1004
+#define DIV_CLK_PERI_DSIM				0x1800
+#define DIV_CLK_PERI_I2S0				0x1804
+#define DIV_CLK_PERI_I2S1				0x1808
+#define DIV_CLK_PERI_PCLK				0x180c
+#define DIV_CLK_PERI_SPI				0x1810
+#define DIV_CLK_PERI_UART1				0x1814
+#define DIV_CLK_PERI_UART2				0x1818
+
+static const unsigned long cmu_peri_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLK_PERI_AUDIO_USER,
+	PLL_CON0_MUX_CLK_PERI_DISP_USER,
+	PLL_CON0_MUX_CLK_PERI_IP_USER,
+	MUX_CLK_PERI_I2S0,
+	MUX_CLK_PERI_I2S1,
+	DIV_CLK_PERI_DSIM,
+	DIV_CLK_PERI_I2S0,
+	DIV_CLK_PERI_I2S1,
+	DIV_CLK_PERI_PCLK,
+	DIV_CLK_PERI_SPI,
+	DIV_CLK_PERI_UART1,
+	DIV_CLK_PERI_UART2,
+};
+
+static const struct samsung_fixed_rate_clock peri_fixed_clks[] __initconst = {
+	FRATE(0, "clk_peri_audio", NULL, 0, 100000000),
+};
+
+PNAME(mout_peri_ip_user_p) = { "fin_pll", "dout_clkcmu_peri_ip" };
+PNAME(mout_peri_audio_user_p) = { "fin_pll", "dout_clkcmu_peri_audio" };
+PNAME(mout_peri_disp_user_p) = { "fin_pll", "dout_clkcmu_peri_disp" };
+PNAME(mout_peri_i2s0_p) = { "dout_peri_i2s0", "clk_peri_audio" };
+PNAME(mout_peri_i2s1_p) = { "dout_peri_i2s1", "clk_peri_audio" };
+
+static const struct samsung_mux_clock cmu_peri_mux_clks[] __initconst = {
+	MUX(MOUT_PERI_IP_USER, "mout_peri_ip_user", mout_peri_ip_user_p,
+	    PLL_CON0_MUX_CLK_PERI_IP_USER, 4, 1),
+	MUX(MOUT_PERI_AUDIO_USER, "mout_peri_audio_user",
+	    mout_peri_audio_user_p, PLL_CON0_MUX_CLK_PERI_AUDIO_USER, 4, 1),
+	MUX(MOUT_PERI_DISP_USER, "mout_peri_disp_user", mout_peri_disp_user_p,
+	    PLL_CON0_MUX_CLK_PERI_DISP_USER, 4, 1),
+	MUX(MOUT_PERI_I2S0, "mout_peri_i2s0", mout_peri_i2s0_p,
+	    MUX_CLK_PERI_I2S0, 0, 1),
+	MUX(MOUT_PERI_I2S1, "mout_peri_i2s1", mout_peri_i2s1_p,
+	    MUX_CLK_PERI_I2S1, 0, 1),
+};
+
+static const struct samsung_div_clock cmu_peri_div_clks[] __initconst = {
+	DIV(DOUT_PERI_SPI, "dout_peri_spi", "mout_peri_ip_user",
+	    DIV_CLK_PERI_SPI, 0, 10),
+	DIV(DOUT_PERI_UART1, "dout_peri_uart1", "mout_peri_ip_user",
+	    DIV_CLK_PERI_UART1, 0, 10),
+	DIV(DOUT_PERI_UART2, "dout_peri_uart2", "mout_peri_ip_user",
+	    DIV_CLK_PERI_UART2, 0, 10),
+	DIV(DOUT_PERI_PCLK, "dout_peri_pclk", "mout_peri_ip_user",
+	    DIV_CLK_PERI_PCLK, 0, 4),
+	DIV(DOUT_PERI_I2S0, "dout_peri_i2s0", "mout_peri_audio_user",
+	    DIV_CLK_PERI_I2S0, 0, 4),
+	DIV(DOUT_PERI_I2S1, "dout_peri_i2s1", "mout_peri_audio_user",
+	    DIV_CLK_PERI_I2S1, 0, 4),
+	DIV(DOUT_PERI_DSIM, "dout_peri_dsim", "mout_peri_disp_user",
+	    DIV_CLK_PERI_DSIM, 0, 4),
+};
+
+static const struct samsung_cmu_info cmu_peri_info __initconst = {
+	.mux_clks		= cmu_peri_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cmu_peri_mux_clks),
+	.div_clks		= cmu_peri_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cmu_peri_div_clks),
+	.fixed_clks		= peri_fixed_clks,
+	.nr_fixed_clks		= ARRAY_SIZE(peri_fixed_clks),
+	.nr_clk_ids		= CMU_PERI_NR_CLK,
+	.clk_regs		= cmu_peri_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cmu_peri_clk_regs),
+};
+
+static void __init artpec8_clk_cmu_peri_init(struct device_node *np)
+{
+	samsung_cmu_register_one(np, &cmu_peri_info);
+}
+
+CLK_OF_DECLARE(artpec8_clk_cmu_peri, "axis,artpec8-cmu-peri",
+	       artpec8_clk_cmu_peri_init);
-- 
2.34.1


