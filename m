Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DACC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 00:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DOrpwON/AERKprjE/4+Jk4YcZiTXIHVN603xYrGoq0=; b=083PTxzDBeQqZbfHkvcNE7SJPh
	UCUGh/pSGCJbFEcSqZ4rhRUzegM1VxXjc4CK09+VZ9f3hk1vx+OzZlUHW+hrxaJPv5WiIo5tSFos0
	HyR8w49pOfpssolHH5txxLmNoroF05TqC/Wtzkl8AiE8LCZutMoIW7whA/cyXvkhQBnyWcv+DvkRb
	fMVeFEedEzI0zq7VFazKxT3YSvz0iHFUWvwt+rTDCPtO+czLNaSwFxKk/yMCHF3k4RalqY5uQriQ3
	sQuYQ8cPreDaIbTvH/9wYaiDaIknlzXSyJ5WKR+D7WIN6izOA+UAZ2W4439AsJ7x/cZ86XQ2rKL3J
	+zRDnapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfKw-0000000ALxF-1IHK;
	Thu, 10 Jul 2025 00:40:30 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf23-0000000AJMB-169D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 00:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106856; bh=DPuahl419ZI8H8sIxt4+AyDZsbJtqz9HQjp9C1Tkzek=;
	l=2845; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=uMMMoSJ2Jnq0N9tjsiml/673AJH3xj8Azva0xHCbjtgJ/p3fhDBy7Or71nZSAYiEG
	 Zp0jA5ly/65J3Uy5Kv1Y7V2IAMO7RPlVqTCPyKD7bYMskiAWmjsWN6oUkTgxhkwxEc
	 sGqCAl6RAtvwWPLGmZMIRd096rYwQmrHXyvs+jjs=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:56 +0900
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
Subject: [PATCH 06/16] clk: samsung: artpec-8: Add clock support for CMU_BUS block
Date: Thu, 10 Jul 2025 09:20:36 +0900
Message-Id: <20250710002047.1573841-7-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_172059_575161_2FDD7D34 
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

From: Hakyeong Kim <hgkim05@coasia.com>

Add clock support for below CMU block in ARTPEC-8 SoC.
 - CMU_BUS

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
---
 drivers/clk/samsung/clk-artpec8.c | 45 +++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/clk/samsung/clk-artpec8.c b/drivers/clk/samsung/clk-artpec8.c
index 1ef9e52ad24b..648abdd2f510 100644
--- a/drivers/clk/samsung/clk-artpec8.c
+++ b/drivers/clk/samsung/clk-artpec8.c
@@ -15,6 +15,7 @@
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CMU_CMU_NR_CLK			(DOUT_CLKCMU_VPP_CORE + 1)
+#define CMU_BUS_NR_CLK			(DOUT_CLK_BUS_PCLK + 1)
 #define CMU_IMEM_NR_CLK			(MOUT_IMEM_JPEG_USER + 1)
 
 /* register offset definitions for cmu_cmu (0x12400000) */
@@ -431,6 +432,50 @@ static void __init artpec8_clk_cmu_cmu_init(struct device_node *np)
 CLK_OF_DECLARE(artpec8_clk_cmu_cmu, "axis,artpec8-cmu-cmu",
 	       artpec8_clk_cmu_cmu_init);
 
+/* Register Offset definitions for CMU_BUS (0x12c10000) */
+#define PLL_CON0_MUX_CLK_BUS_ACLK_USER			0x0100
+#define PLL_CON0_MUX_CLK_BUS_DLP_USER			0x0120
+#define DIV_CLK_BUS_PCLK				0x1800
+
+static const unsigned long cmu_bus_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLK_BUS_ACLK_USER,
+	PLL_CON0_MUX_CLK_BUS_DLP_USER,
+	DIV_CLK_BUS_PCLK,
+};
+
+PNAME(mout_clk_bus_aclk_user_p) = { "fin_pll", "dout_clkcmu_bus_bus" };
+PNAME(mout_clk_bus_dlp_user_p) = { "fin_pll", "dout_clkcmu_bus_dlp" };
+
+static const struct samsung_mux_clock cmu_bus_mux_clks[] __initconst = {
+	MUX(MOUT_CLK_BUS_ACLK_USER, "mout_clk_bus_aclk_user",
+	    mout_clk_bus_aclk_user_p, PLL_CON0_MUX_CLK_BUS_ACLK_USER, 4, 1),
+	MUX(MOUT_CLK_BUS_DLP_USER, "mout_clk_bus_dlp_user",
+	    mout_clk_bus_dlp_user_p, PLL_CON0_MUX_CLK_BUS_DLP_USER, 4, 1),
+};
+
+static const struct samsung_div_clock cmu_bus_div_clks[] __initconst = {
+	DIV(DOUT_CLK_BUS_PCLK, "dout_clk_bus_pclk", "mout_clk_bus_aclk_user",
+	    DIV_CLK_BUS_PCLK, 0, 4),
+};
+
+static const struct samsung_cmu_info cmu_bus_info __initconst = {
+	.mux_clks		= cmu_bus_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cmu_bus_mux_clks),
+	.div_clks		= cmu_bus_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cmu_bus_div_clks),
+	.nr_clk_ids		= CMU_BUS_NR_CLK,
+	.clk_regs		= cmu_bus_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cmu_bus_clk_regs),
+};
+
+static void __init artpec8_clk_cmu_bus_init(struct device_node *np)
+{
+	samsung_cmu_register_one(np, &cmu_bus_info);
+}
+
+CLK_OF_DECLARE(artpec8_clk_cmu_bus, "axis,artpec8-cmu-bus",
+	       artpec8_clk_cmu_bus_init);
+
 /* Register Offset definitions for CMU_IMEM (0x10010000) */
 #define PLL_CON0_MUX_CLK_IMEM_ACLK_USER			0x0100
 #define PLL_CON0_MUX_CLK_IMEM_JPEG_USER			0x0120
-- 
2.34.1


