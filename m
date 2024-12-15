Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA52E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RxcCAE1xi2gLVw1ILn2TxdjTQQp8lisqh/d/8aBjPo=; b=f12eVYB5qKE8ML0E0/efHT6Pu4
	NTbY6NxxcQP0I/GsiHRCLPG45DxtJ3ar5KYUT3odHJ94jfm+3ZPKf0qLky59676H6sjTdLb49NKjN
	B48LvPrr8uHsNcCxk0Ehqf1vD8+bYgKaN6fMSoiOO2+SBZK2hm3JH08oAUZf9rzbaDweb+txjZcnF
	RwzSMiWa8Gva2tmp3yUuai/ndFZxLKLI5vveghRAVtvHJ0ONjpVxaxCIACBLS3IoHZ7E+u1FNTrfS
	aAYq2OH37w0XfD0S48FERKvlJJstlHPtqTsaLr3Lv+e29X6nVNoBb7IKOchI24AcTiCWULk7uSSTo
	Heq2eHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMwuN-00000008YQD-2obV;
	Sun, 15 Dec 2024 22:16:15 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMwsV-00000008Y4V-3OmW;
	Sun, 15 Dec 2024 22:14:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tMwsQ-000000002qn-1wDl;
	Sun, 15 Dec 2024 22:14:14 +0000
Date: Sun, 15 Dec 2024 22:14:11 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Golle <daniel@makrotopia.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	John Crispin <john@phrozen.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH 2/5] clk: mediatek: mt2701-aud: fix conversion to
 mtk_clk_simple_probe
Message-ID: <a07584d803af57b9ce4b5df5e122c09bf5a56ac9.1734300668.git.daniel@makrotopia.org>
References: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_141419_859577_48EBC26A 
X-CRM114-Status: UNSURE (   9.88  )
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

Some of the audio subsystem clocks defined in clk-mt2701.h aren't
actually used by the driver. This broke conversion to
mtk_clk_simple_probe which expects that the highest possible clk id is
defined by the ARRAY_SIZE.

Add additional dummy clocks to fill the gaps and remain compatible with
the existing DT bindings.

Fixes: 0f69a423c458 ("clk: mediatek: Switch to mtk_clk_simple_probe() where possible")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt2701-aud.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2701-aud.c b/drivers/clk/mediatek/clk-mt2701-aud.c
index 425c69cfb105..e103121cf58e 100644
--- a/drivers/clk/mediatek/clk-mt2701-aud.c
+++ b/drivers/clk/mediatek/clk-mt2701-aud.c
@@ -55,10 +55,16 @@ static const struct mtk_gate audio_clks[] = {
 	GATE_DUMMY(CLK_DUMMY, "aud_dummy"),
 	/* AUDIO0 */
 	GATE_AUDIO0(CLK_AUD_AFE, "audio_afe", "aud_intbus_sel", 2),
+	GATE_DUMMY(CLK_AUD_LRCK_DETECT, "audio_lrck_detect_dummy"),
+	GATE_DUMMY(CLK_AUD_I2S, "audio_i2c_dummy"),
+	GATE_DUMMY(CLK_AUD_APLL_TUNER, "audio_apll_tuner_dummy"),
 	GATE_AUDIO0(CLK_AUD_HDMI, "audio_hdmi", "audpll_sel", 20),
 	GATE_AUDIO0(CLK_AUD_SPDF, "audio_spdf", "audpll_sel", 21),
 	GATE_AUDIO0(CLK_AUD_SPDF2, "audio_spdf2", "audpll_sel", 22),
 	GATE_AUDIO0(CLK_AUD_APLL, "audio_apll", "audpll_sel", 23),
+	GATE_DUMMY(CLK_AUD_TML, "audio_tml_dummy"),
+	GATE_DUMMY(CLK_AUD_AHB_IDLE_EXT, "audio_ahb_idle_ext_dummy"),
+	GATE_DUMMY(CLK_AUD_AHB_IDLE_INT, "audio_ahb_idle_int_dummy"),
 	/* AUDIO1 */
 	GATE_AUDIO1(CLK_AUD_I2SIN1, "audio_i2sin1", "aud_mux1_sel", 0),
 	GATE_AUDIO1(CLK_AUD_I2SIN2, "audio_i2sin2", "aud_mux1_sel", 1),
@@ -76,10 +82,12 @@ static const struct mtk_gate audio_clks[] = {
 	GATE_AUDIO1(CLK_AUD_ASRCI2, "audio_asrci2", "asm_h_sel", 13),
 	GATE_AUDIO1(CLK_AUD_ASRCO1, "audio_asrco1", "asm_h_sel", 14),
 	GATE_AUDIO1(CLK_AUD_ASRCO2, "audio_asrco2", "asm_h_sel", 15),
+	GATE_DUMMY(CLK_AUD_HDMIRX, "audio_hdmirx_dummy"),
 	GATE_AUDIO1(CLK_AUD_INTDIR, "audio_intdir", "intdir_sel", 20),
 	GATE_AUDIO1(CLK_AUD_A1SYS, "audio_a1sys", "aud_mux1_sel", 21),
 	GATE_AUDIO1(CLK_AUD_A2SYS, "audio_a2sys", "aud_mux2_sel", 22),
 	GATE_AUDIO1(CLK_AUD_AFE_CONN, "audio_afe_conn", "aud_mux1_sel", 23),
+	GATE_DUMMY(CLK_AUD_AFE_PCMIF, "audio_afe_pcmif_dummy"),
 	GATE_AUDIO1(CLK_AUD_AFE_MRGIF, "audio_afe_mrgif", "aud_mux1_sel", 25),
 	/* AUDIO2 */
 	GATE_AUDIO2(CLK_AUD_MMIF_UL1, "audio_ul1", "aud_mux1_sel", 0),
@@ -100,6 +108,8 @@ static const struct mtk_gate audio_clks[] = {
 	GATE_AUDIO2(CLK_AUD_MMIF_AWB2, "audio_awb2", "aud_mux1_sel", 15),
 	GATE_AUDIO2(CLK_AUD_MMIF_DAI, "audio_dai", "aud_mux1_sel", 16),
 	/* AUDIO3 */
+	GATE_DUMMY(CLK_AUD_DMIC1, "audio_dmic1_dummy"),
+	GATE_DUMMY(CLK_AUD_DMIC2, "audio_dmic2_dummy"),
 	GATE_AUDIO3(CLK_AUD_ASRCI3, "audio_asrci3", "asm_h_sel", 2),
 	GATE_AUDIO3(CLK_AUD_ASRCI4, "audio_asrci4", "asm_h_sel", 3),
 	GATE_AUDIO3(CLK_AUD_ASRCI5, "audio_asrci5", "asm_h_sel", 4),
-- 
2.47.1

