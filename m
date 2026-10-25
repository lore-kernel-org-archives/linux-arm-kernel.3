Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF8C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R1NlL5OE;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Qv88TDI5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zOCj2mogUbOf0IoA4StRbJGw4rc7fp8BlZqrA2WTSy4=; b=R1NlL5OE/w7ZW/
	NL64DIuzqnZp/aXju0RusYd+5D9O9QZa68czsipsouFQPOaVEfj8qi+qVv8QA9d2cHn/K1mkHmYnc
	Z5r9ZWZo8Uab3S8FMZr+UNnSIJSu/tT6y8D007Ij9H/mUfceDyhLOmuP31H/H+1OM77+qBEuEJwWb
	OCb6TCnPfni7LVTFoZ92fKuYCtpfstyYLzdopsazAljDMp+GaUQpuRj0E0ABqFkDknh4rYxenkTfp
	BC2HhNJ5abTuByUZwJWxaV01ZbXS44wcbfElZIgSN9BOTh5UiRNE9sSjjMdDphlGMLNvnPWQo1yC9
	ANXnx8QUlGzaHUmvMwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pd-00000001Mru-1Ut8;
	Sun, 25 Oct 2026 19:24:37 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pW-00000001MjY-3GXb;
	Sun, 25 Oct 2026 19:24:32 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5Id518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:16 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5Id518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956257;
	bh=zOCj2mogUbOf0IoA4StRbJGw4rc7fp8BlZqrA2WTSy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qv88TDI5/fudxyNU7sSdJ1AieXXkoEIHkpA2QJvvWLktrx55Su3rXV5bM81oejvn1
	 XqrG0ZDHzruUgHBe0ZtYpfnEWe2vFuSS8AwOHn5MbZQcyPNOlUPTXEycvJwLNO/vJU
	 LtPHvHIYEfYGrKqHphOOL7r/sh2xxKnif15nWOC8=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jiebing Chen <jiebing.chen@amlogic.com>,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 4/7] clk: meson: axg_audio: add S4 support
Date: Sun, 25 Oct 2026 20:24:01 +0100
Message-ID: <20261025192404.209695-5-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122431_153685_DA54088B 
X-CRM114-Status: GOOD (  10.53  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jiebing Chen <jiebing.chen@amlogic.com>

Add S4 support the axg audio clock controllers, Compared with the
previous version, the selection of the audio's clock and data pad
will be designed in the form of pinmux control. The purpose of doing
this is to distinguish between clock control and pin control selection.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/clk/meson/axg-audio.c | 165 ++++++++++++++++++++++++++++++++++
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
2.56.0


