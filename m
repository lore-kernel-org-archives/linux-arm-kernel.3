Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82423CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUzPoQxg+4glciEf4qRr6YIkQA+Bw6YyzNcSS2ZQJ6U=; b=rNOLYLDb5nZ+l0qLgxzqyepk+o
	IGLiCD/UTeD39mj57dmXh2ocGR/i9hone+SrfC4K2jKz06EHlbzcyC1pm8rQbDirIF63qIMH6UQN5
	RdNj/nGVvM4SpObrY5qLVCKjLN8doF3XSEf8HZQXbFMtIepAJIBrRvzpFxHbB4b3V9FWo/dwZISlM
	YzjOGVGu35wN5i+bXSgNMxJFai3pPm5VSjfgG2wNjscQCGkqwFYoDxQH8GI3LXOawvTqLljbnWZBZ
	yGs+YvP7xTPRXyrol+1VF2YGC9IMhfKr92z9sbp6BZ5d4LyvXbSAcM4H66PTuG5qMrgJkgj7g09nF
	UxjsEGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgsm-0000000BQsZ-23NJ;
	Sat, 25 Oct 2025 16:12:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgsk-0000000BQrt-1h6Y;
	Sat, 25 Oct 2025 16:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04D7D43A40;
	Sat, 25 Oct 2025 16:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C15FC4CEF5;
	Sat, 25 Oct 2025 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408761;
	bh=uLvGDiPyH27dk/4Q7NdQdVZ0s446fdJmM4aDvApiQoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pgYl304phxzOibORoSg5FusvQ+mEf6y5CmOrCwPwrF01dS6T4vPNxrcHiPge7u358
	 yjvE6GqZHge724zpRZL3Xs50vnDnpQ1dUG+tgJq44kq+kM1RRrzaeF4p6fl0bDe3hD
	 G+KgAumD1qtIE9yUPiB/N/mQu/PXBBKZ2b36sdgnGXuNGY9Gc4mfRIOuN2pD0HbN+R
	 RjnsdlFrw4lsZmHCwbNq63ZXr8fXmdSJShYpcgKMBfe5B4D4se+kBcRvbs4WTeA5Et
	 WqGMVa2y42m+RhHi2sFRmCB/3lA5ADFAvHRlFbxnwBltpEW1tPaWQdpWesUCnKovdW
	 09YwdWcEmIOQw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Terry Cheong <htcheong@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	alexander.deucher@amd.com,
	alexandre.f.demers@gmail.com,
	kuninori.morimoto.gx@renesas.com,
	nfraprado@collabora.com,
	Parker.Yang@mediatek.com,
	julien.massot@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.12] ASoC: mediatek: Use SND_JACK_AVOUT for HDMI/DP jacks
Date: Sat, 25 Oct 2025 11:54:53 -0400
Message-ID: <20251025160905.3857885-62-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_091242_486167_350FF2F5 
X-CRM114-Status: GOOD (  15.49  )
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

From: Terry Cheong <htcheong@chromium.org>

[ Upstream commit 8ed2dca4df2297177e0edcb7e0c72ef87f3fd81a ]

The SND_JACK_AVOUT is a more specific jack type for HDMI and DisplayPort.
Updatae the MediaTek drivers to use such jack type, allowing system to
determine the device type based on jack event.

Signed-off-by: Terry Cheong <htcheong@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Link: https://patch.msgid.link/20250723-mtk-hdmi-v1-1-4ff945eb6136@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Explanation

- Problem fixed: MediaTek machine drivers currently create HDMI/DP jacks
  with SND_JACK_LINEOUT only, while HDMI/DP codecs report jack state
  using SND_JACK_AVOUT (LINEOUT|VIDEOOUT). This drops the VIDEOOUT part
  from input and control reporting, preventing user space from
  identifying an HDMI/DP sink based on jack events. The change aligns
  the masks so both LINEOUT and VIDEOOUT are reported, enabling correct
  device classification.

- Concrete mismatches today:
  - hdmi-codec reports via SND_JACK_AVOUT: sound/soc/codecs/hdmi-
    codec.c:946, sound/soc/codecs/hdmi-codec.c:967,
    sound/soc/codecs/hdmi-codec.c:987
  - Intel HDA HDMI does the same: sound/soc/codecs/hdac_hdmi.c:172,
    sound/soc/codecs/hdac_hdmi.c:183
  - MediaTek machines create HDMI/DP jacks as LINEOUT only:
    - sound/soc/mediatek/mt8173/mt8173-rt5650.c:162
    - sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:381
    - sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:386
    - sound/soc/mediatek/mt8186/mt8186-mt6366.c:365
    - sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:371
    - sound/soc/mediatek/mt8195/mt8195-mt6359.c:363,
      sound/soc/mediatek/mt8195/mt8195-mt6359.c:378
    - sound/soc/mediatek/mt8188/mt8188-mt6359.c:253,
      sound/soc/mediatek/mt8188/mt8188-mt6359.c:260,
      sound/soc/mediatek/mt8188/mt8188-mt6359.c:640,
      sound/soc/mediatek/mt8188/mt8188-mt6359.c:666

- Why AVOUT is correct and safe:
  - AVOUT is defined as a combination of LINEOUT and VIDEOOUT, not a new
    bit: include/sound/jack.h:45; it’s documented at
    include/sound/jack.h:23 and has existed since 2009.
  - Using AVOUT causes the input device to advertise both
    SW_LINEOUT_INSERT and SW_VIDEOOUT_INSERT (additive capability) and
    makes the jack control reflect AV presence as the codecs intend,
    with no removal of existing behavior.
  - The generic jack control name (“HDMI Jack”) is unchanged; only the
    internal mask expands, so existing controls remain and an additional
    VIDEOOUT switch becomes visible to input consumers.
  - Other platforms already use AVOUT for HDMI/DP jacks (e.g.,
    Qualcomm): sound/soc/qcom/common.c:261

- Scope of change:
  - Small, contained swaps of SND_JACK_LINEOUT → SND_JACK_AVOUT and pin
    masks for HDMI/DP in MediaTek machine drivers only; no architectural
    changes, no API changes, no risk to other subsystems.

- User impact:
  - Fixes real user-visible misclassification (HDMI/DP appearing as
    generic “line out” only), enabling correct policy/routing. No known
    regressions; change is additive.

- Stable criteria:
  - Important correctness fix, minimal risk, confined to ASoC machine
    drivers, no feature additions or interfaces changes. No Cc: stable
    tag, but the fix aligns masks with existing codec behavior and long-
    standing definitions.

Conclusion: This is a low-risk, correctness-alignment change that
improves HDMI/DP jack reporting and should be backported to stable.

 sound/soc/mediatek/mt8173/mt8173-rt5650.c                 | 2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c        | 2 +-
 .../soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c  | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c                 | 2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c                 | 8 ++++----
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c   | 2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c                 | 4 ++--
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 7d6a3586cdd55..3d6d7bc05b872 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -159,7 +159,7 @@ static int mt8173_rt5650_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT,
 				    &mt8173_rt5650_hdmi_jack);
 	if (ret)
 		return ret;
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 3388e076ccc9e..983f3b91119a9 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -378,7 +378,7 @@ static int mt8183_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_card_get_drvdata(rtd->card);
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT,
 				    &priv->hdmi_jack);
 	if (ret)
 		return ret;
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 497a9043be7bb..0bc1f11e17aa7 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -383,7 +383,7 @@ mt8183_mt6358_ts3a227_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_card_get_drvdata(rtd->card);
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT,
 				    &priv->hdmi_jack);
 	if (ret)
 		return ret;
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index 43546012cf613..45df69809cbab 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -362,7 +362,7 @@ static int mt8186_mt6366_rt1019_rt5682s_hdmi_init(struct snd_soc_pcm_runtime *rt
 		return ret;
 	}
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, jack);
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT, jack);
 	if (ret) {
 		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index ea814a0f726d6..c6e7461e8f764 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -250,14 +250,14 @@ enum mt8188_jacks {
 static struct snd_soc_jack_pin mt8188_hdmi_jack_pins[] = {
 	{
 		.pin = "HDMI",
-		.mask = SND_JACK_LINEOUT,
+		.mask = SND_JACK_AVOUT,
 	},
 };
 
 static struct snd_soc_jack_pin mt8188_dp_jack_pins[] = {
 	{
 		.pin = "DP",
-		.mask = SND_JACK_LINEOUT,
+		.mask = SND_JACK_AVOUT,
 	},
 };
 
@@ -638,7 +638,7 @@ static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 	int ret = 0;
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "HDMI Jack",
-					 SND_JACK_LINEOUT, jack,
+					 SND_JACK_AVOUT, jack,
 					 mt8188_hdmi_jack_pins,
 					 ARRAY_SIZE(mt8188_hdmi_jack_pins));
 	if (ret) {
@@ -663,7 +663,7 @@ static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
-	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_AVOUT,
 					 jack, mt8188_dp_jack_pins,
 					 ARRAY_SIZE(mt8188_dp_jack_pins));
 	if (ret) {
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index bf483a8fb34a4..91c57765ab57b 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -368,7 +368,7 @@ static int mt8192_mt6359_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, jack);
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT, jack);
 	if (ret) {
 		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index e57391c213e7d..7b96c843a14a5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -360,7 +360,7 @@ static int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT, jack);
+	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_AVOUT, jack);
 	if (ret)
 		return ret;
 
@@ -375,7 +375,7 @@ static int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, jack);
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT, jack);
 	if (ret)
 		return ret;
 
-- 
2.51.0


