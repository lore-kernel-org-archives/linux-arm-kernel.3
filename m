Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B77F34C45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 02:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcsGGUCtxvEYvZgC+WIYOywWyJqk4edc24nDHXiZdcM=; b=H9Ysy6H+m0TYDxIxK1waMlyaVv
	/PxnmiofyYelqFz6aXSHpq+Bu3NBy2FC4E5U9wpwkYXEqVZUpH0tKYFfa/qjuqmWudeWdS07RlslW
	Orx9pnvCLjdlEsk0yN+Cq810Gy5JbZOzmyG3NRHh905PGD1AzLsjoC2Q72OybboZEgWX/5/EB8bwX
	Rzk2wjnPvO0kPxsVz7b2OQGm39Sz2hdW9+HrE/jz7aU/bHEloB0hC4uoxMVlgFddETQxtmL7c3IoT
	0vSHBJW03jA4JDq8epu+OPpMPoF7Bzzb5FSryGEk1PyT8EmuGraAtu8/b9UTUDtBWmGQ82IK/rkln
	CMEIUYGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6bo-0000000CWi0-1Yqd;
	Fri, 24 Apr 2026 02:49:36 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6bk-0000000CWfj-0VJD;
	Fri, 24 Apr 2026 02:49:33 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wG6be-000000002OZ-0hFp;
	Fri, 24 Apr 2026 02:49:26 +0000
Date: Fri, 24 Apr 2026 03:49:18 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 4/9] ASoC: mediatek: mt2701: add optional HDMI audio path
 clocks
Message-ID: <5e24890acf597b04485145b5056ad8b161b4cbda.1776998727.git.daniel@makrotopia.org>
References: <cover.1776998727.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776998727.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_194932_182361_DCC5A886 
X-CRM114-Status: GOOD (  13.08  )
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

The HDMI audio output path on MT2701/MT7623N is rooted in HADDS2PLL
and gated by the audio_hdmi, audio_spdf and audio_apll power gates.
Acquire these four clocks from device tree using devm_clk_get_optional
so that existing platforms which do not wire up HDMI audio keep
probing unchanged. Actual clock enable/prepare is deferred to the
upcoming HDMI DAI startup path.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3: no changes
v2: no changes

 .../mediatek/mt2701/mt2701-afe-clock-ctrl.c   | 22 +++++++++++++++++++
 sound/soc/mediatek/mt2701/mt2701-afe-common.h |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index ae620890bb3a..5a2bcf027b4f 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -95,6 +95,28 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 		afe_priv->mrgif_ck = NULL;
 	}
 
+	/*
+	 * Optional HDMI audio clocks. Platforms that do not wire up the
+	 * HDMI output (e.g. MT2701 devkits using only the I2S BE DAIs)
+	 * may omit these; in that case the HDMI BE DAI simply cannot be
+	 * enabled, but the rest of the AFE still probes.
+	 */
+	afe_priv->hadds2pll_ck = devm_clk_get_optional(afe->dev, "hadds2pll_294m");
+	if (IS_ERR(afe_priv->hadds2pll_ck))
+		return PTR_ERR(afe_priv->hadds2pll_ck);
+
+	afe_priv->audio_hdmi_ck = devm_clk_get_optional(afe->dev, "audio_hdmi_pd");
+	if (IS_ERR(afe_priv->audio_hdmi_ck))
+		return PTR_ERR(afe_priv->audio_hdmi_ck);
+
+	afe_priv->audio_spdf_ck = devm_clk_get_optional(afe->dev, "audio_spdf_pd");
+	if (IS_ERR(afe_priv->audio_spdf_ck))
+		return PTR_ERR(afe_priv->audio_spdf_ck);
+
+	afe_priv->audio_apll_ck = devm_clk_get_optional(afe->dev, "audio_apll_pd");
+	if (IS_ERR(afe_priv->audio_apll_ck))
+		return PTR_ERR(afe_priv->audio_apll_ck);
+
 	return 0;
 }
 
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-common.h b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
index 32bef5e2a56d..7b15283d6351 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-common.h
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
@@ -90,6 +90,10 @@ struct mt2701_afe_private {
 	struct mt2701_i2s_path *i2s_path;
 	struct clk *base_ck[MT2701_BASE_CLK_NUM];
 	struct clk *mrgif_ck;
+	struct clk *hadds2pll_ck;
+	struct clk *audio_hdmi_ck;
+	struct clk *audio_spdf_ck;
+	struct clk *audio_apll_ck;
 	bool mrg_enable[MTK_STREAM_NUM];
 
 	const struct mt2701_soc_variants *soc;
-- 
2.54.0

