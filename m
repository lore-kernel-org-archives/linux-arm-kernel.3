Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0705E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmLS4/J4xrS0+tQLKSQxmVpg/YXrIGiPvu+46sL8AkA=; b=k4B2c2pwB5yUASFGTBHkPDJJ/k
	lvMJdQI3Iw3NI4FMDMGCV9q+SWAvIBfBNdwYz7otUOmM4wrwkgolSuyI1tpGe0GcrIUq41AWOs8IX
	Mcrk1S1u/j6D+RUcYsnYogsoxNBKj7SHWQ7tM7SWCAtLNpqO6SzJlNWHw4pFSikpaqXPllYgNXTX8
	uLdWq819N8hPKIa4i7On0nz98fDPywY795F7yhdBsc/pj/Fgt1Cc1QVdzIc6dytLh3n966S9y+fC9
	p0BKYaCAt53uItvk4OYTvw7QpRzFvaYOi7g1wh1wHEa1O2uBLQABSA7U5K7+C21BVsTESFuLW64UZ
	zZa2dZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKpt-00000005JLT-0Lvr;
	Mon, 13 Jan 2025 13:50:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKik-00000005Hpr-3SAm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 13:43:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKib-0002p3-Di; Mon, 13 Jan 2025 14:43:01 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKia-000Gi0-1X;
	Mon, 13 Jan 2025 14:43:00 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKib-00GZFh-1v;
	Mon, 13 Jan 2025 14:43:00 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 14:42:56 +0100
Subject: [PATCH v3 6/6] clk: imx8mp: inform CCF of maximum frequency of
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-imx8m-clk-v3-6-0d6e9bdeaa4e@pengutronix.de>
References: <20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de>
In-Reply-To: <20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_054311_024305_706CE845 
X-CRM114-Status: GOOD (  20.81  )
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

The IMX8MPCEC datasheet lists maximum frequencies allowed for different
modules. Some of these limits are universal, but some depend on
whether the SoC is operating in nominal or in overdrive mode.

The imx8mp.dtsi currently assumes overdrive mode and configures some
clocks in accordance with this. Boards wishing to make use of nominal
mode will need to override some of the clock rates manually.

As operating the clocks outside of their allowed range can lead to
difficult to debug issues, it makes sense to register the maximum rates
allowed in the driver, so the CCF can take them into account.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/clk/imx/clk-imx8mp.c | 151 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a356f293621b371b9ef9b9bec90a4..0f81058c136f8b44ffd06e2fb1f758f6e4b871dc 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/units.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -405,11 +406,151 @@ static const char * const imx8mp_clkout_sels[] = {"audio_pll1_out", "audio_pll2_
 static struct clk_hw **hws;
 static struct clk_hw_onecell_data *clk_hw_data;
 
+struct imx8mp_clock_constraints {
+	unsigned int clkid;
+	u32 maxrate;
+};
+
+/*
+ * Below tables are taken from IMX8MPCEC Rev. 2.1, 07/2023
+ * Table 13. Maximum frequency of modules.
+ * Probable typos fixed are marked with a comment.
+ */
+static const struct imx8mp_clock_constraints imx8mp_clock_common_constraints[] = {
+	{ IMX8MP_CLK_A53_DIV,             1000 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_ENET_AXI,             266666667 }, /* Datasheet claims 266MHz */
+	{ IMX8MP_CLK_NAND_USDHC_BUS,       266666667 }, /* Datasheet claims 266MHz */
+	{ IMX8MP_CLK_MEDIA_APB,            200 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_HDMI_APB,             133333333 }, /* Datasheet claims 133MHz */
+	{ IMX8MP_CLK_ML_AXI,               800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_AHB,                  133333333 },
+	{ IMX8MP_CLK_IPG_ROOT,              66666667 },
+	{ IMX8MP_CLK_AUDIO_AHB,            400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_DISP2_PIX,      170 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_DRAM_ALT,             666666667 },
+	{ IMX8MP_CLK_DRAM_APB,             200 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_CAN1,                  80 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_CAN2,                  80 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_PCIE_AUX,              10 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_I2C5,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_I2C6,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_SAI1,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_SAI2,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_SAI3,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_SAI5,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_SAI6,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_ENET_QOS,             125 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_ENET_QOS_TIMER,       200 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_ENET_REF,             125 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_ENET_TIMER,           125 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_ENET_PHY_REF,         125 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_NAND,                 500 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_QSPI,                 400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_USDHC1,               400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_USDHC2,               400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_I2C1,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_I2C2,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_I2C3,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_I2C4,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_UART1,                 80 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_UART2,                 80 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_UART3,                 80 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_UART4,                 80 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_ECSPI1,                80 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_ECSPI2,                80 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_PWM1,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_PWM2,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_PWM3,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_PWM4,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_GPT1,                 100 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPT2,                 100 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPT3,                 100 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPT4,                 100 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPT5,                 100 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPT6,                 100 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_WDOG,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_IPP_DO_CLKO1,         200 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_IPP_DO_CLKO2,         200 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_HDMI_REF_266M,        266 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_USDHC3,               400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_MIPI_PHY1_REF,  300 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_DISP1_PIX,      250 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_CAM2_PIX,       277 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_LDB,            595 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE, 200 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_ECSPI3,                80 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_PDM,                  200 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_SAI7,                  66666667 }, /* Datasheet claims 66MHz */
+	{ IMX8MP_CLK_MAIN_AXI,             400 * HZ_PER_MHZ },
+	{ /* Sentinel */ }
+};
+
+static const struct imx8mp_clock_constraints imx8mp_clock_nominal_constraints[] = {
+	{ IMX8MP_CLK_M7_CORE,           600 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_ML_CORE,           800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPU3D_CORE,        800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPU3D_SHADER_CORE, 800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPU2D_CORE,        800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_AUDIO_AXI_SRC,     600 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_HSIO_AXI,          400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_ISP,         400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_VPU_BUS,           600 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_AXI,         400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_HDMI_AXI,          400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPU_AXI,           600 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPU_AHB,           300 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_NOC,               800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_NOC_IO,            600 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_ML_AHB,            300 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_VPU_G1,            600 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_VPU_G2,            500 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_CAM1_PIX,    400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_VPU_VC8000E,       400 * HZ_PER_MHZ }, /* Datasheet claims 500MHz */
+	{ IMX8MP_CLK_DRAM_CORE,         800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GIC,               400 * HZ_PER_MHZ },
+	{ /* Sentinel */ }
+};
+
+static const struct imx8mp_clock_constraints imx8mp_clock_overdrive_constraints[] = {
+	{ IMX8MP_CLK_M7_CORE,            800 * HZ_PER_MHZ},
+	{ IMX8MP_CLK_ML_CORE,           1000 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPU3D_CORE,        1000 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPU3D_SHADER_CORE, 1000 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPU2D_CORE,        1000 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_AUDIO_AXI_SRC,      800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_HSIO_AXI,           500 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_ISP,          500 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_VPU_BUS,            800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_AXI,          500 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_HDMI_AXI,           500 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPU_AXI,            800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GPU_AHB,            400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_NOC,               1000 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_NOC_IO,             800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_ML_AHB,             400 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_VPU_G1,             800 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_VPU_G2,             700 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_MEDIA_CAM1_PIX,     500 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_VPU_VC8000E,        500 * HZ_PER_MHZ }, /* Datasheet claims 400MHz */
+	{ IMX8MP_CLK_DRAM_CORE,         1000 * HZ_PER_MHZ },
+	{ IMX8MP_CLK_GIC,                500 * HZ_PER_MHZ },
+	{ /* Sentinel */ }
+};
+
+static void imx8mp_clocks_apply_constraints(const struct imx8mp_clock_constraints constraints[])
+{
+	const struct imx8mp_clock_constraints *constr;
+
+	for (constr = constraints; constr->clkid; constr++)
+		clk_hw_set_rate_range(hws[constr->clkid], 0, constr->maxrate);
+}
+
 static int imx8mp_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	void __iomem *anatop_base, *ccm_base;
+	const char *opmode;
 	int err;
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
@@ -714,6 +855,16 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	imx_check_clk_hws(hws, IMX8MP_CLK_END);
 
+	imx8mp_clocks_apply_constraints(imx8mp_clock_common_constraints);
+
+	err = of_property_read_string(np, "fsl,operating-mode", &opmode);
+	if (!err) {
+		if (!strcmp(opmode, "nominal"))
+			imx8mp_clocks_apply_constraints(imx8mp_clock_nominal_constraints);
+		else if (!strcmp(opmode, "overdrive"))
+			imx8mp_clocks_apply_constraints(imx8mp_clock_overdrive_constraints);
+	}
+
 	err = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
 	if (err < 0) {
 		dev_err(dev, "failed to register hws for i.MX8MP\n");

-- 
2.39.5


