Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CE9C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tc+Ls8QmoJKRDueuGnjX5gVNyRNj3VbsSLtu8GhBELw=; b=gJj11BRZJeQVL1/ewQ95K2Ov+7
	70aoSYxE6XmTjs4m9OhAFw6F7TXGh2iFMEW0XiJZGDwprEzjHWRyZ/JcDy3QhIMHuyIgnVUozgJ7T
	Q2jAjs7w1yrPKEY92p1pqgTQPlohWTql77QOfnwrQp2L28a0dZWhFNLosDihxBA4WuHjBResYlpUG
	acK+lBGAXjhrp9r3rOpUAjVKBu2lKL66dT8jeHEuTsgx6Ly3KD27MTpq7pxnK5X/AakGizUXnQaXy
	J18RULqEQeaX/09hIwR6dJ/ClXhFeQmTSSbOVeK+G3V3YAy/w5ZJecGS2Jx94hmLi/3aXtdZUe/S6
	R+OteLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4H1d-00000001WgF-1WoO;
	Mon, 14 Apr 2025 10:26:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GoD-00000001Rl9-0WIR;
	Mon, 14 Apr 2025 10:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A67D5C5420;
	Mon, 14 Apr 2025 10:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E566FC4CEEB;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744625576;
	bh=53W1bNK9W7QQYZ6q3O5F0QS6Wr0aZL8OTvR5FfS4m5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WtNfq9DZaUJZBTjgwNHG1uk0idTsHZZh+OkaKxmr6V08euXlkfT3Wi2hItvPn3eLu
	 t25Bitpm9+Vk8umrDmpKak5ZU6OmWAF8oapIXnIGRGrs1h3ZMz+4laYzzga1hgI0Th
	 a/lpuRt3KPvAtvxf7cvIWLKQhSH0L2ulpoyV6qSLduj2NiuONQWCfFQ40xpyuv++E0
	 QvdmSYP14SIkQ9tBu7U1zvIYlxuWC2+6OoZFdP1w0+7FRK3cqn2LQUVK7AucsrT0/j
	 0/Wb4qpAzqzAPYU9wD21489zqHMDkH4Fc9GkfyK3NC6I7d+27P4yVnEaxwjOXwV9WE
	 iBREDYDsjfXGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB044C369BA;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 14 Apr 2025 18:12:32 +0800
Subject: [PATCH v2 5/7] soc: amlogic: clk-measure: Add support for S4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-clk-measure-v2-5-65077690053a@amlogic.com>
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
In-Reply-To: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744625573; l=6928;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=B+ImmzcSg0MnVcqeFPpwfyQB4KHRlMlguio/y8LkwZU=;
 b=tkfMcPfGE93Dh4PX41BJ/zc7JCsxxnVtg7yhCqo2w2OXsKiJKNdHloJ/VHZcYRxn7HhJ7Iwy/
 aRJ0SlWgooeCMEfO6JriOE4LC/rCs99RVF054ta24l4EyckYC2XgIsQ
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_031257_280955_7D19D55D 
X-CRM114-Status: UNSURE (   9.24  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measurer clocks IDs for the Amlogic S4 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 163 ++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 810454ac4119..f2fca59a6fc4 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -634,6 +634,159 @@ static const struct meson_msr_id clk_msr_c3[] = {
 
 };
 
+static const struct meson_msr_id clk_msr_s4[] = {
+	CLK_MSR_ID(0, "sys_clk"),
+	CLK_MSR_ID(1, "axi_clk"),
+	CLK_MSR_ID(2, "rtc_clk"),
+	CLK_MSR_ID(5, "mali"),
+	CLK_MSR_ID(6, "cpu_clk_div16"),
+	CLK_MSR_ID(7, "ceca_clk"),
+	CLK_MSR_ID(8, "cecb_clk"),
+	CLK_MSR_ID(10, "fclk_div5"),
+	CLK_MSR_ID(11, "mpll0"),
+	CLK_MSR_ID(12, "mpll1"),
+	CLK_MSR_ID(13, "mpll2"),
+	CLK_MSR_ID(14, "mpll3"),
+	CLK_MSR_ID(15, "fclk_50m"),
+	CLK_MSR_ID(16, "pcie_clk_inp"),
+	CLK_MSR_ID(17, "pcie_clk_inn"),
+	CLK_MSR_ID(18, "mpll_clk_test_out"),
+	CLK_MSR_ID(19, "hifi_pll"),
+	CLK_MSR_ID(20, "gp0_pll"),
+	CLK_MSR_ID(21, "gp1_pll"),
+	CLK_MSR_ID(22, "eth_mppll_50m_ckout"),
+	CLK_MSR_ID(23, "sys_pll_div16"),
+	CLK_MSR_ID(24, "ddr_dpll_pt_clk"),
+	CLK_MSR_ID(30, "mod_eth_phy_ref_clk"),
+	CLK_MSR_ID(31, "mod_eth_tx_clk"),
+	CLK_MSR_ID(32, "eth_125m"),
+	CLK_MSR_ID(33, "eth_rmii"),
+	CLK_MSR_ID(34, "co_clkin_to_mac"),
+	CLK_MSR_ID(35, "mod_eth_rx_clk_rmii"),
+	CLK_MSR_ID(36, "co_rx_clk"),
+	CLK_MSR_ID(37, "co_tx_clk"),
+	CLK_MSR_ID(38, "eth_phy_rxclk"),
+	CLK_MSR_ID(39, "eth_phy_plltxclk"),
+	CLK_MSR_ID(40, "ephy_test_clk"),
+	CLK_MSR_ID(50, "vid_pll_div_clk_out"),
+	CLK_MSR_ID(51, "enci"),
+	CLK_MSR_ID(52, "encp"),
+	CLK_MSR_ID(53, "encl"),
+	CLK_MSR_ID(54, "vdac"),
+	CLK_MSR_ID(55, "cdac_clk_c"),
+	CLK_MSR_ID(56, "mod_tcon_clko"),
+	CLK_MSR_ID(57, "lcd_an_clk_ph2"),
+	CLK_MSR_ID(58, "lcd_an_clk_ph3"),
+	CLK_MSR_ID(59, "hdmitx_pixel"),
+	CLK_MSR_ID(60, "vdin_meas"),
+	CLK_MSR_ID(61, "vpu"),
+	CLK_MSR_ID(62, "vpu_clkb"),
+	CLK_MSR_ID(63, "vpu_clkb_tmp"),
+	CLK_MSR_ID(64, "vpu_clkc"),
+	CLK_MSR_ID(65, "vid_lock"),
+	CLK_MSR_ID(66, "vapb"),
+	CLK_MSR_ID(67, "ge2d"),
+	CLK_MSR_ID(68, "cts_hdcp22_esmclk"),
+	CLK_MSR_ID(69, "cts_hdcp22_skpclk"),
+	CLK_MSR_ID(76, "hdmitx_tmds"),
+	CLK_MSR_ID(77, "hdmitx_sys_clk"),
+	CLK_MSR_ID(78, "hdmitx_fe_clk"),
+	CLK_MSR_ID(79, "rama"),
+	CLK_MSR_ID(93, "vdec"),
+	CLK_MSR_ID(99, "hevcf"),
+	CLK_MSR_ID(100, "demod_core"),
+	CLK_MSR_ID(101, "adc_extclk_in"),
+	CLK_MSR_ID(102, "cts_demod_core_t2_clk"),
+	CLK_MSR_ID(103, "adc_dpll_intclk"),
+	CLK_MSR_ID(104, "adc_dpll_clk_b3"),
+	CLK_MSR_ID(105, "s2_adc_clk"),
+	CLK_MSR_ID(106, "deskew_pll_clk_div32_out"),
+	CLK_MSR_ID(110, "sc"),
+	CLK_MSR_ID(111, "sar_adc"),
+	CLK_MSR_ID(113, "sd_emmc_c"),
+	CLK_MSR_ID(114, "sd_emmc_b"),
+	CLK_MSR_ID(115, "sd_emmc_a"),
+	CLK_MSR_ID(116, "gpio_msr_clk"),
+	CLK_MSR_ID(118, "spicc0"),
+	CLK_MSR_ID(121, "ts"),
+	CLK_MSR_ID(130, "audio_vad_clk"),
+	CLK_MSR_ID(131, "acodec_dac_clk_x128"),
+	CLK_MSR_ID(132, "audio_locker_in_clk"),
+	CLK_MSR_ID(133, "audio_locker_out_clk"),
+	CLK_MSR_ID(134, "audio_tdmout_c_sclk"),
+	CLK_MSR_ID(135, "audio_tdmout_b_sclk"),
+	CLK_MSR_ID(136, "audio_tdmout_a_sclk"),
+	CLK_MSR_ID(137, "audio_tdmin_lb_sclk"),
+	CLK_MSR_ID(138, "audio_tdmin_c_sclk"),
+	CLK_MSR_ID(139, "audio_tdmin_b_sclk"),
+	CLK_MSR_ID(140, "audio_tdmin_a_sclk"),
+	CLK_MSR_ID(141, "audio_resamplea_clk"),
+	CLK_MSR_ID(142, "audio_pdm_sysclk"),
+	CLK_MSR_ID(143, "audio_spdifout_b_mst_clk"),
+	CLK_MSR_ID(144, "audio_spdifout_mst_clk"),
+	CLK_MSR_ID(145, "audio_spdifin_mst_clk"),
+	CLK_MSR_ID(146, "audio_pdm_dclk"),
+	CLK_MSR_ID(147, "audio_resampleb_clk"),
+	CLK_MSR_ID(160, "pwm_j"),
+	CLK_MSR_ID(161, "pwm_i"),
+	CLK_MSR_ID(162, "pwm_h"),
+	CLK_MSR_ID(163, "pwm_g"),
+	CLK_MSR_ID(164, "pwm_f"),
+	CLK_MSR_ID(165, "pwm_e"),
+	CLK_MSR_ID(166, "pwm_d"),
+	CLK_MSR_ID(167, "pwm_c"),
+	CLK_MSR_ID(168, "pwm_b"),
+	CLK_MSR_ID(169, "pwm_a"),
+	CLK_MSR_ID(176, "rng_ring_0"),
+	CLK_MSR_ID(177, "rng_ring_1"),
+	CLK_MSR_ID(178, "rng_ring_2"),
+	CLK_MSR_ID(179, "rng_ring_3"),
+	CLK_MSR_ID(180, "dmc_osc_ring(LVT16)"),
+	CLK_MSR_ID(181, "gpu_osc_ring0(LVT16)"),
+	CLK_MSR_ID(182, "gpu_osc_ring1(ULVT16)"),
+	CLK_MSR_ID(183, "gpu_osc_ring2(SLVT16)"),
+	CLK_MSR_ID(184, "vpu_osc_ring0(SVT24)"),
+	CLK_MSR_ID(185, "vpu_osc_ring1(LVT20)"),
+	CLK_MSR_ID(186, "vpu_osc_ring2(LVT16)"),
+	CLK_MSR_ID(187, "dos_osc_ring0(SVT24)"),
+	CLK_MSR_ID(188, "dos_osc_ring1(SVT16)"),
+	CLK_MSR_ID(189, "dos_osc_ring2(LVT16)"),
+	CLK_MSR_ID(190, "dos_osc_ring3(ULVT20)"),
+	CLK_MSR_ID(192, "axi_sram_osc_ring(SVT16)"),
+	CLK_MSR_ID(193, "demod_osc_ring0"),
+	CLK_MSR_ID(194, "demod_osc_ring1"),
+	CLK_MSR_ID(195, "sar_osc_ring"),
+	CLK_MSR_ID(196, "sys_cpu_osc_ring0"),
+	CLK_MSR_ID(197, "sys_cpu_osc_ring1"),
+	CLK_MSR_ID(198, "sys_cpu_osc_ring2"),
+	CLK_MSR_ID(199, "sys_cpu_osc_ring3"),
+	CLK_MSR_ID(200, "sys_cpu_osc_ring4"),
+	CLK_MSR_ID(201, "sys_cpu_osc_ring5"),
+	CLK_MSR_ID(202, "sys_cpu_osc_ring6"),
+	CLK_MSR_ID(203, "sys_cpu_osc_ring7"),
+	CLK_MSR_ID(204, "sys_cpu_osc_ring8"),
+	CLK_MSR_ID(205, "sys_cpu_osc_ring9"),
+	CLK_MSR_ID(206, "sys_cpu_osc_ring10"),
+	CLK_MSR_ID(207, "sys_cpu_osc_ring11"),
+	CLK_MSR_ID(208, "sys_cpu_osc_ring12"),
+	CLK_MSR_ID(209, "sys_cpu_osc_ring13"),
+	CLK_MSR_ID(210, "sys_cpu_osc_ring14"),
+	CLK_MSR_ID(211, "sys_cpu_osc_ring15"),
+	CLK_MSR_ID(212, "sys_cpu_osc_ring16"),
+	CLK_MSR_ID(213, "sys_cpu_osc_ring17"),
+	CLK_MSR_ID(214, "sys_cpu_osc_ring18"),
+	CLK_MSR_ID(215, "sys_cpu_osc_ring19"),
+	CLK_MSR_ID(216, "sys_cpu_osc_ring20"),
+	CLK_MSR_ID(217, "sys_cpu_osc_ring21"),
+	CLK_MSR_ID(218, "sys_cpu_osc_ring22"),
+	CLK_MSR_ID(219, "sys_cpu_osc_ring23"),
+	CLK_MSR_ID(220, "sys_cpu_osc_ring24"),
+	CLK_MSR_ID(221, "sys_cpu_osc_ring25"),
+	CLK_MSR_ID(222, "sys_cpu_osc_ring26"),
+	CLK_MSR_ID(223, "sys_cpu_osc_ring27"),
+
+};
+
 static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 			    unsigned int duration)
 {
@@ -866,6 +1019,12 @@ static const struct meson_msr_data clk_msr_c3_data = {
 	.reg = &msr_reg_offset_v2,
 };
 
+static const struct meson_msr_data clk_msr_s4_data = {
+	.msr_table = (void *)clk_msr_s4,
+	.msr_count = ARRAY_SIZE(clk_msr_s4),
+	.reg = &msr_reg_offset_v2,
+};
+
 static const struct of_device_id meson_msr_match_table[] = {
 	{
 		.compatible = "amlogic,meson-gx-clk-measure",
@@ -895,6 +1054,10 @@ static const struct of_device_id meson_msr_match_table[] = {
 		.compatible = "amlogic,c3-clk-measure",
 		.data = &clk_msr_c3_data,
 	},
+	{
+		.compatible = "amlogic,s4-clk-measure",
+		.data = &clk_msr_s4_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, meson_msr_match_table);

-- 
2.42.0



