Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B45FC88E48
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 06:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNbhO50GiNuaaW+LC5eoTkqY7OMQkS9uvXG8VYmr0iI=; b=vE4BUz7joTPATtIhzsQIzGNZYx
	W5WL21K1UJ8mSFUj9JoV/Szm46ATjfG1cQwm93/xBAAOTQUavBtaAkXEa3I3QU32HRHXtiuJfua/8
	gzDqoGK8Sy66ZmXQBSaDa/l/bHPSmLPU4Bk+UudwO1uQDjFpCB7+Rj/IUFms+JTrRX1GAg43pwo2v
	j6qjiBFyxWTJmvfXSMkn/6KdUaWyg9O8fOMsTVCR08hWevZe4jmx9qSBjsgvU3EpKCg+a9GzOaT2o
	8jE+vRxnT/YPRwJ3PW6QUBKOCfaEFf9YdH+6oJ2gu/NbCtLdzk7kCIEGHkt+YEjOujokPS0DtwDEf
	jMepLMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFgB-0000000BxoI-0HOp;
	Mon, 26 Jan 2026 06:02:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFfu-0000000BxdG-2UVn;
	Mon, 26 Jan 2026 06:02:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39AD344425;
	Mon, 26 Jan 2026 06:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0E76C2BCAF;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769407329;
	bh=6MtBAdybK+8cyXTFi9GhayfpSH5N+wcUKSicM9HCaJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tj2XQMmdw97pz8sC6Sr79E1EI8Q3884pBLNbfyKt5DXz4Xs7TZ1Ftcjy49LNZ9M8m
	 j2HSPNfrCCtvgv45i3ZCmd5kYlhVlpPyCiu8YiE6SH8mbacyCJsD9bwgWGyo7vFRt8
	 OLMc+XrGacIJmBWogCcwrMTrnMbRivNRz/7Ty7swB6YBB5GZdJ0E15yfdt6neOyQrC
	 b4nEf2622WcTKkCEvpjhEThOD0TmmOVlGtijxax2tJhGvPm650whM8/zDNsemHlnPt
	 VttkaEZQt/woVQg+/b5rly5K6SoVwyNMrwExe10a7RoRl4gqac3uNq4KjqpNp6MwjV
	 z13vTnWErS5Vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B31C88E48;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Mon, 26 Jan 2026 06:01:45 +0000
Subject: [PATCH v6 4/5] clk: meson: axg_audio: add S4 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-audio_drvier-v6-4-99e350855bc2@amlogic.com>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
In-Reply-To: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769407326; l=9384;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=mSlr+PYl6Kv5xTlb1MKaLQhx8bgwIvHXfLMJnftHOWU=;
 b=IQRlwbGMXYegPoWxYzkiXv67EwV1WbD7zJf8asDBo2X4ZGAmiWyDjVKSrsP+JN8TCJOxcAJ6h
 bVZeYe1N9SeAauB+1gaEsNiFSL2oki44eLUgHpomvMFLR5crQia07oj
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_220210_695293_C4B42C2E 
X-CRM114-Status: GOOD (  12.22  )
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jiebing Chen <jiebing.chen@amlogic.com>

Add S4 support the axg audio clock controllers, Compared with the
previous version, the selection of the audio's clock and data pad
will be designed in the form of pinmux control. The purpose of doing
this is to distinguish between clock control and pin control selection.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 drivers/clk/meson/axg-audio.c | 165 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index fd7eca652261..ab8c05b0509e 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1150,6 +1150,159 @@ static struct clk_hw *g12a_audio_hw_clks[] = {
 	[AUD_CLKID_TOP]			= &axg_aud_top,
 };
 
+/*
+ * Array of all S4 clocks provided by this provider
+ * The input clocks of the controller will be populated at runtime
+ */
+static struct clk_hw *s4_audio_hw_clks[] = {
+	[AUD_CLKID_DDR_ARB]		= &ddr_arb.hw,
+	[AUD_CLKID_PDM]			= &pdm.hw,
+	[AUD_CLKID_TDMIN_A]		= &tdmin_a.hw,
+	[AUD_CLKID_TDMIN_B]		= &tdmin_b.hw,
+	[AUD_CLKID_TDMIN_C]		= &tdmin_c.hw,
+	[AUD_CLKID_TDMIN_LB]		= &tdmin_lb.hw,
+	[AUD_CLKID_TDMOUT_A]		= &tdmout_a.hw,
+	[AUD_CLKID_TDMOUT_B]		= &tdmout_b.hw,
+	[AUD_CLKID_TDMOUT_C]		= &tdmout_c.hw,
+	[AUD_CLKID_FRDDR_A]		= &frddr_a.hw,
+	[AUD_CLKID_FRDDR_B]		= &frddr_b.hw,
+	[AUD_CLKID_FRDDR_C]		= &frddr_c.hw,
+	[AUD_CLKID_TODDR_A]		= &toddr_a.hw,
+	[AUD_CLKID_TODDR_B]		= &toddr_b.hw,
+	[AUD_CLKID_TODDR_C]		= &toddr_c.hw,
+	[AUD_CLKID_LOOPBACK]		= &loopback.hw,
+	[AUD_CLKID_SPDIFIN]		= &spdifin.hw,
+	[AUD_CLKID_SPDIFOUT]		= &spdifout.hw,
+	[AUD_CLKID_RESAMPLE]		= &resample.hw,
+	[AUD_CLKID_SPDIFOUT_B]		= &spdifout_b.hw,
+	[AUD_CLKID_MST_A_MCLK_SEL]	= &sm1_mst_a_mclk_sel.hw,
+	[AUD_CLKID_MST_B_MCLK_SEL]	= &sm1_mst_b_mclk_sel.hw,
+	[AUD_CLKID_MST_C_MCLK_SEL]	= &sm1_mst_c_mclk_sel.hw,
+	[AUD_CLKID_MST_D_MCLK_SEL]	= &sm1_mst_d_mclk_sel.hw,
+	[AUD_CLKID_MST_E_MCLK_SEL]	= &sm1_mst_e_mclk_sel.hw,
+	[AUD_CLKID_MST_F_MCLK_SEL]	= &sm1_mst_f_mclk_sel.hw,
+	[AUD_CLKID_MST_A_MCLK_DIV]	= &sm1_mst_a_mclk_div.hw,
+	[AUD_CLKID_MST_B_MCLK_DIV]	= &sm1_mst_b_mclk_div.hw,
+	[AUD_CLKID_MST_C_MCLK_DIV]	= &sm1_mst_c_mclk_div.hw,
+	[AUD_CLKID_MST_D_MCLK_DIV]	= &sm1_mst_d_mclk_div.hw,
+	[AUD_CLKID_MST_E_MCLK_DIV]	= &sm1_mst_e_mclk_div.hw,
+	[AUD_CLKID_MST_F_MCLK_DIV]	= &sm1_mst_f_mclk_div.hw,
+	[AUD_CLKID_MST_A_MCLK]		= &sm1_mst_a_mclk.hw,
+	[AUD_CLKID_MST_B_MCLK]		= &sm1_mst_b_mclk.hw,
+	[AUD_CLKID_MST_C_MCLK]		= &sm1_mst_c_mclk.hw,
+	[AUD_CLKID_MST_D_MCLK]		= &sm1_mst_d_mclk.hw,
+	[AUD_CLKID_MST_E_MCLK]		= &sm1_mst_e_mclk.hw,
+	[AUD_CLKID_MST_F_MCLK]		= &sm1_mst_f_mclk.hw,
+	[AUD_CLKID_SPDIFOUT_CLK_SEL]	= &spdifout_clk_sel.hw,
+	[AUD_CLKID_SPDIFOUT_CLK_DIV]	= &spdifout_clk_div.hw,
+	[AUD_CLKID_SPDIFOUT_CLK]	= &spdifout_clk.hw,
+	[AUD_CLKID_SPDIFOUT_B_CLK_SEL]	= &spdifout_b_clk_sel.hw,
+	[AUD_CLKID_SPDIFOUT_B_CLK_DIV]	= &spdifout_b_clk_div.hw,
+	[AUD_CLKID_SPDIFOUT_B_CLK]	= &spdifout_b_clk.hw,
+	[AUD_CLKID_SPDIFIN_CLK_SEL]	= &spdifin_clk_sel.hw,
+	[AUD_CLKID_SPDIFIN_CLK_DIV]	= &spdifin_clk_div.hw,
+	[AUD_CLKID_SPDIFIN_CLK]		= &spdifin_clk.hw,
+	[AUD_CLKID_PDM_DCLK_SEL]	= &pdm_dclk_sel.hw,
+	[AUD_CLKID_PDM_DCLK_DIV]	= &pdm_dclk_div.hw,
+	[AUD_CLKID_PDM_DCLK]		= &pdm_dclk.hw,
+	[AUD_CLKID_PDM_SYSCLK_SEL]	= &pdm_sysclk_sel.hw,
+	[AUD_CLKID_PDM_SYSCLK_DIV]	= &pdm_sysclk_div.hw,
+	[AUD_CLKID_PDM_SYSCLK]		= &pdm_sysclk.hw,
+	[AUD_CLKID_MST_A_SCLK_PRE_EN]	= &mst_a_sclk_pre_en.hw,
+	[AUD_CLKID_MST_B_SCLK_PRE_EN]	= &mst_b_sclk_pre_en.hw,
+	[AUD_CLKID_MST_C_SCLK_PRE_EN]	= &mst_c_sclk_pre_en.hw,
+	[AUD_CLKID_MST_D_SCLK_PRE_EN]	= &mst_d_sclk_pre_en.hw,
+	[AUD_CLKID_MST_E_SCLK_PRE_EN]	= &mst_e_sclk_pre_en.hw,
+	[AUD_CLKID_MST_F_SCLK_PRE_EN]	= &mst_f_sclk_pre_en.hw,
+	[AUD_CLKID_MST_A_SCLK_DIV]	= &mst_a_sclk_div.hw,
+	[AUD_CLKID_MST_B_SCLK_DIV]	= &mst_b_sclk_div.hw,
+	[AUD_CLKID_MST_C_SCLK_DIV]	= &mst_c_sclk_div.hw,
+	[AUD_CLKID_MST_D_SCLK_DIV]	= &mst_d_sclk_div.hw,
+	[AUD_CLKID_MST_E_SCLK_DIV]	= &mst_e_sclk_div.hw,
+	[AUD_CLKID_MST_F_SCLK_DIV]	= &mst_f_sclk_div.hw,
+	[AUD_CLKID_MST_A_SCLK_POST_EN]	= &mst_a_sclk_post_en.hw,
+	[AUD_CLKID_MST_B_SCLK_POST_EN]	= &mst_b_sclk_post_en.hw,
+	[AUD_CLKID_MST_C_SCLK_POST_EN]	= &mst_c_sclk_post_en.hw,
+	[AUD_CLKID_MST_D_SCLK_POST_EN]	= &mst_d_sclk_post_en.hw,
+	[AUD_CLKID_MST_E_SCLK_POST_EN]	= &mst_e_sclk_post_en.hw,
+	[AUD_CLKID_MST_F_SCLK_POST_EN]	= &mst_f_sclk_post_en.hw,
+	[AUD_CLKID_MST_A_SCLK]		= &mst_a_sclk.hw,
+	[AUD_CLKID_MST_B_SCLK]		= &mst_b_sclk.hw,
+	[AUD_CLKID_MST_C_SCLK]		= &mst_c_sclk.hw,
+	[AUD_CLKID_MST_D_SCLK]		= &mst_d_sclk.hw,
+	[AUD_CLKID_MST_E_SCLK]		= &mst_e_sclk.hw,
+	[AUD_CLKID_MST_F_SCLK]		= &mst_f_sclk.hw,
+	[AUD_CLKID_MST_A_LRCLK_DIV]	= &mst_a_lrclk_div.hw,
+	[AUD_CLKID_MST_B_LRCLK_DIV]	= &mst_b_lrclk_div.hw,
+	[AUD_CLKID_MST_C_LRCLK_DIV]	= &mst_c_lrclk_div.hw,
+	[AUD_CLKID_MST_D_LRCLK_DIV]	= &mst_d_lrclk_div.hw,
+	[AUD_CLKID_MST_E_LRCLK_DIV]	= &mst_e_lrclk_div.hw,
+	[AUD_CLKID_MST_F_LRCLK_DIV]	= &mst_f_lrclk_div.hw,
+	[AUD_CLKID_MST_A_LRCLK]		= &mst_a_lrclk.hw,
+	[AUD_CLKID_MST_B_LRCLK]		= &mst_b_lrclk.hw,
+	[AUD_CLKID_MST_C_LRCLK]		= &mst_c_lrclk.hw,
+	[AUD_CLKID_MST_D_LRCLK]		= &mst_d_lrclk.hw,
+	[AUD_CLKID_MST_E_LRCLK]		= &mst_e_lrclk.hw,
+	[AUD_CLKID_MST_F_LRCLK]		= &mst_f_lrclk.hw,
+	[AUD_CLKID_TDMIN_A_SCLK_SEL]	= &tdmin_a_sclk_sel.hw,
+	[AUD_CLKID_TDMIN_B_SCLK_SEL]	= &tdmin_b_sclk_sel.hw,
+	[AUD_CLKID_TDMIN_C_SCLK_SEL]	= &tdmin_c_sclk_sel.hw,
+	[AUD_CLKID_TDMIN_LB_SCLK_SEL]	= &tdmin_lb_sclk_sel.hw,
+	[AUD_CLKID_TDMOUT_A_SCLK_SEL]	= &tdmout_a_sclk_sel.hw,
+	[AUD_CLKID_TDMOUT_B_SCLK_SEL]	= &tdmout_b_sclk_sel.hw,
+	[AUD_CLKID_TDMOUT_C_SCLK_SEL]	= &tdmout_c_sclk_sel.hw,
+	[AUD_CLKID_TDMIN_A_SCLK_PRE_EN]	= &tdmin_a_sclk_pre_en.hw,
+	[AUD_CLKID_TDMIN_B_SCLK_PRE_EN]	= &tdmin_b_sclk_pre_en.hw,
+	[AUD_CLKID_TDMIN_C_SCLK_PRE_EN]	= &tdmin_c_sclk_pre_en.hw,
+	[AUD_CLKID_TDMIN_LB_SCLK_PRE_EN] = &tdmin_lb_sclk_pre_en.hw,
+	[AUD_CLKID_TDMOUT_A_SCLK_PRE_EN] = &tdmout_a_sclk_pre_en.hw,
+	[AUD_CLKID_TDMOUT_B_SCLK_PRE_EN] = &tdmout_b_sclk_pre_en.hw,
+	[AUD_CLKID_TDMOUT_C_SCLK_PRE_EN] = &tdmout_c_sclk_pre_en.hw,
+	[AUD_CLKID_TDMIN_A_SCLK_POST_EN] = &tdmin_a_sclk_post_en.hw,
+	[AUD_CLKID_TDMIN_B_SCLK_POST_EN] = &tdmin_b_sclk_post_en.hw,
+	[AUD_CLKID_TDMIN_C_SCLK_POST_EN] = &tdmin_c_sclk_post_en.hw,
+	[AUD_CLKID_TDMIN_LB_SCLK_POST_EN] = &tdmin_lb_sclk_post_en.hw,
+	[AUD_CLKID_TDMOUT_A_SCLK_POST_EN] = &tdmout_a_sclk_post_en.hw,
+	[AUD_CLKID_TDMOUT_B_SCLK_POST_EN] = &tdmout_b_sclk_post_en.hw,
+	[AUD_CLKID_TDMOUT_C_SCLK_POST_EN] = &tdmout_c_sclk_post_en.hw,
+	[AUD_CLKID_TDMIN_A_SCLK]	= &tdmin_a_sclk.hw,
+	[AUD_CLKID_TDMIN_B_SCLK]	= &tdmin_b_sclk.hw,
+	[AUD_CLKID_TDMIN_C_SCLK]	= &tdmin_c_sclk.hw,
+	[AUD_CLKID_TDMIN_LB_SCLK]	= &tdmin_lb_sclk.hw,
+	[AUD_CLKID_TDMOUT_A_SCLK]	= &g12a_tdmout_a_sclk.hw,
+	[AUD_CLKID_TDMOUT_B_SCLK]	= &g12a_tdmout_b_sclk.hw,
+	[AUD_CLKID_TDMOUT_C_SCLK]	= &g12a_tdmout_c_sclk.hw,
+	[AUD_CLKID_TDMIN_A_LRCLK]	= &tdmin_a_lrclk.hw,
+	[AUD_CLKID_TDMIN_B_LRCLK]	= &tdmin_b_lrclk.hw,
+	[AUD_CLKID_TDMIN_C_LRCLK]	= &tdmin_c_lrclk.hw,
+	[AUD_CLKID_TDMIN_LB_LRCLK]	= &tdmin_lb_lrclk.hw,
+	[AUD_CLKID_TDMOUT_A_LRCLK]	= &tdmout_a_lrclk.hw,
+	[AUD_CLKID_TDMOUT_B_LRCLK]	= &tdmout_b_lrclk.hw,
+	[AUD_CLKID_TDMOUT_C_LRCLK]	= &tdmout_c_lrclk.hw,
+	[AUD_CLKID_TOP]			= &sm1_aud_top.hw,
+	[AUD_CLKID_TORAM]		= &toram.hw,
+	[AUD_CLKID_EQDRC]		= &eqdrc.hw,
+	[AUD_CLKID_RESAMPLE_B]		= &resample_b.hw,
+	[AUD_CLKID_TOVAD]		= &tovad.hw,
+	[AUD_CLKID_LOCKER]		= &locker.hw,
+	[AUD_CLKID_SPDIFIN_LB]		= &spdifin_lb.hw,
+	[AUD_CLKID_FRDDR_D]		= &frddr_d.hw,
+	[AUD_CLKID_TODDR_D]		= &toddr_d.hw,
+	[AUD_CLKID_LOOPBACK_B]		= &loopback_b.hw,
+	[AUD_CLKID_CLK81_EN]		= &sm1_clk81_en.hw,
+	[AUD_CLKID_SYSCLK_A_DIV]	= &sm1_sysclk_a_div.hw,
+	[AUD_CLKID_SYSCLK_A_EN]		= &sm1_sysclk_a_en.hw,
+	[AUD_CLKID_SYSCLK_B_DIV]	= &sm1_sysclk_b_div.hw,
+	[AUD_CLKID_SYSCLK_B_EN]		= &sm1_sysclk_b_en.hw,
+	[AUD_CLKID_EARCRX]		= &earcrx.hw,
+	[AUD_CLKID_EARCRX_CMDC_SEL]	= &sm1_earcrx_cmdc_clk_sel.hw,
+	[AUD_CLKID_EARCRX_CMDC_DIV]	= &sm1_earcrx_cmdc_clk_div.hw,
+	[AUD_CLKID_EARCRX_CMDC]		= &sm1_earcrx_cmdc_clk.hw,
+	[AUD_CLKID_EARCRX_DMAC_SEL]	= &sm1_earcrx_dmac_clk_sel.hw,
+	[AUD_CLKID_EARCRX_DMAC_DIV]	= &sm1_earcrx_dmac_clk_div.hw,
+	[AUD_CLKID_EARCRX_DMAC]		= &sm1_earcrx_dmac_clk.hw,
+};
+
 /*
  * Array of all SM1 clocks provided by this provider
  * The input clocks of the controller will be populated at runtime
@@ -1410,6 +1563,15 @@ static const struct audioclk_data g12a_audioclk_data = {
 	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
+static const struct audioclk_data s4_audioclk_data = {
+	.hw_clks = {
+		.hws = s4_audio_hw_clks,
+		.num = ARRAY_SIZE(s4_audio_hw_clks),
+	},
+	.rst_drvname = "rst-sm1",
+	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
+};
+
 static const struct audioclk_data sm1_audioclk_data = {
 	.hw_clks = {
 		.hws = sm1_audio_hw_clks,
@@ -1426,6 +1588,9 @@ static const struct of_device_id clkc_match_table[] = {
 	}, {
 		.compatible = "amlogic,g12a-audio-clkc",
 		.data = &g12a_audioclk_data
+	}, {
+		.compatible = "amlogic,s4-audio-clkc",
+		.data = &s4_audioclk_data
 	}, {
 		.compatible = "amlogic,sm1-audio-clkc",
 		.data = &sm1_audioclk_data

-- 
2.52.0



