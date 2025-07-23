Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA8DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C5ohlcswCHUarwQMsmPE06bAiOj6zoZwHyM9beSDSD8=; b=eeGoln9GWxyfvdgxvd9hwYf0HL
	VI1yPkfy1nhZXXCVfzVGbbWhlMowUiICtwf2EO5KP2zKgG70DB3gCGc44ADWYs+y11g6fnycbmSrD
	uhvop3jigsdDsZ/yakD1E06nmCatDbZseoPEoB68xoqAbWr/tkbPQfKdXfOHV5/+ic3kfMMHG7mjg
	Rj8iimpAVMf/6KkKUQg3JAyvnFkWcQJsnnj4vB7moWzkesey1RMl8RG2Z7zGzf9//QaLQlFPYDG59
	E1VS/J485RCZ/AQ3JzqJuwfAQeS7T6Eh5rAz241wAP7xADa0SO1TfOjW/8k4MX0I+u4AIlcdjhDzt
	ZQJaFGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueW4H-00000004Z7Z-1DN7;
	Wed, 23 Jul 2025 09:47:21 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVe8-00000004UHp-1kvu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 09:20:22 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-75001b1bd76so4039284b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 02:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753262419; x=1753867219; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5ohlcswCHUarwQMsmPE06bAiOj6zoZwHyM9beSDSD8=;
        b=UuRvcZu+xL23rY1mbwPgr6ahQEmN9xIQvpaLNIwXuEin8+A8TbSN9tYUNBRTQCOGb8
         lqyHyg1rPsaSSxS8kLXjBRWjGrAgmD+ksjYe+C4KFhlzCEGuYLgaRFdHk6r7NR3BZvXA
         RXe0KVKAg/idd2APcVn4szI+Z2aqIDzo59sjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753262419; x=1753867219;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5ohlcswCHUarwQMsmPE06bAiOj6zoZwHyM9beSDSD8=;
        b=rEr/xj7UPMp30/ZVCc5yMsD2HaJjYYojppqBaZ8t8mAW1SCPqXxuy3Iu3WHahzWln6
         KaybJNDAqJswQPK6c/kzX5YEe0bnlg5/clEjrUnRmufCnwBaT1S0/2okgQpyazPiayjr
         Wdp+/B89lWVGDSnOPJWhQKlgJ68Pkl+c6vqKeyvHteRSSSrpnNchjU1O/zxJfasrbLBY
         eMNcBBketXSGAzDhIPVbqTNa2oMXg/XhunjAo4GVeWtDnG8CSRys4EQziU+PV8GisBCO
         H1+/vLcpoFl3GwCL+nLtIR/1kmutVaaPpKkamPxYQ40foX3kuIvR5rkAWw7s4p9LYkzy
         V1DA==
X-Forwarded-Encrypted: i=1; AJvYcCUIX5rPpsiy085wdJrM1k0kyitSix0Djq8iSpuPsllj56dGVTwiSXWhXpUxeQtfMXIcOMQHEMUeEIcqydNG1F+H@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2oEtCe37qclNViuu1NjRiwsA4CTcAE/jYywBcNttDJ+pDhZZ0
	ID+3BP0LJ4PUlMI0aakXYzwfDY9jvEd6zzmXIbBcb/CciE344bjAk4olFxRx7ii0uw==
X-Gm-Gg: ASbGncufVHxkCDGekmimRYZoUc9b2Yk6i//6o9SGT15xS/gRfBo/lrxtRgf1cIrl6MA
	5InFO7uemjpGovc+Wr8oQsh2cj+EvyV6Py2wkYbemx64btXkwdwlSMg6RHEf+t8OZzivxEuSeF8
	Ta3FEKDffi7xLgbsIAuYeMkRRtDlutKhU09ROtSdL0w2xnIc0BSwhDe1ObcKjhvn9H6njC9bMhB
	TOOwqK+ihydXKxyhYt2+PLquwXIJACkaotX3VxNssPSwmXrBSrcmwi1h4BBJkTCdIO5uGrfKejm
	tgstdQE04IasCTuxObOGyauFKVdUBRpowGDzgDjxEUkKpzG2R6nJQui2guFQ22qG8NEpBoL5k4B
	HVniAFJvRXswSGkzlMPhKzClOUNrWdIGuUOan8wouy6bHyqnhUehao6jepft+
X-Google-Smtp-Source: AGHT+IG7/nlgACJp+VfqCvvLKN8+mhu1LidQEOhNCH9PEZufUuMCmSN6xu9KROi8r7za7e9D6ENl4Q==
X-Received: by 2002:a05:6a00:a0b:b0:74c:efae:fd8f with SMTP id d2e1a72fcca58-76035df4f41mr2885545b3a.15.1753262419160;
        Wed, 23 Jul 2025 02:20:19 -0700 (PDT)
Received: from htcheong-p620.tpe.corp.google.com ([2401:fa00:1:17:5a52:716c:aaf0:9c18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbb71f6bsm9297359b3a.124.2025.07.23.02.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:20:18 -0700 (PDT)
From: Terry Cheong <htcheong@chromium.org>
Date: Wed, 23 Jul 2025 17:20:11 +0800
Subject: [PATCH] ASoC: mediatek: Use SND_JACK_AVOUT for HDMI/DP jacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-mtk-hdmi-v1-1-4ff945eb6136@chromium.org>
X-B4-Tracking: v=1; b=H4sIAEqpgGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyNj3dySbN2MlNxM3WSLNNO0FKM0U3MTAyWg8oKi1LTMCrBR0bG1tQC
 Bxi+xWgAAAA==
X-Change-ID: 20250723-mtk-hdmi-c8f5fd2f5740
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Baili Deng <bailideng@google.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Terry Cheong <htcheong@chromium.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_022020_485404_4A5184BC 
X-CRM114-Status: GOOD (  14.59  )
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

The SND_JACK_AVOUT is a more specific jack type for HDMI and DisplayPort.
Updatae the MediaTek drivers to use such jack type, allowing system to
determine the device type based on jack event.

Signed-off-by: Terry Cheong <htcheong@chromium.org>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c                  | 2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c         | 2 +-
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c                  | 2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c                  | 8 ++++----
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c                  | 4 ++--
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 7d6a3586cdd55734358f66428467466ae756da38..3d6d7bc05b8721a27483d5d7e51ba87fe7363b8b 100644
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
index 3388e076ccc9ee4d372713571f459cff81dec1e5..983f3b91119a9253796c6017bad155161c747904 100644
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
index 497a9043be7bb62405b9ec3b0b4a9e09e0153be7..0bc1f11e17aa7a40688d706966dd0bb1ed414751 100644
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
index 43546012cf61341ad87d9084465af4a430c96230..45df69809cbabf7af571576d230bd44dd9d89f1e 100644
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
index a2a76b6df63118a016ca414c39943f7a30f27a71..e12537c400e5fdd7565f8322470997f30947ee26 100644
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
index bf483a8fb34a482a76b1c8d799b9e9c8472d0f57..91c57765ab57b2d556d82629b98a36f837b3c995 100644
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
index e57391c213e7d2bea375cb6006927af3abf503da..7b96c843a14a5b461b9e9a7e7026252e8a1ce19c 100644
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
 

---
base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
change-id: 20250723-mtk-hdmi-c8f5fd2f5740

Best regards,
-- 
Terry Cheong <htcheong@chromium.org>


