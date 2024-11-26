Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3E3D65553
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 20:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T7k4VHaSM1c1a7ZLNAX08qoZ4FJV292Hg710+wDAIX4=; b=NkeV1CXSQ5i4Yr3xlTG6lOle+d
	rHxuvFsv8bEkfj8ikS6EFApnnpNZxHJsNxCzheKa/TlWCQtlxPj7Cq85iVpdqTd5QA4tbKGVdtCxI
	OFyd7YPmvQpfZf/HxNa7hWgE7ITyUg7SmIecQWZsZVAJAl2QOM3cmZ7+Eb6s725zUoXhbufcvTyEE
	pNCAHgS/8GeHQOIt1OnGN9KvxJpDVGNvCSUE+Wqyfec16f8CsXrllWup2/R8BKTl+DFPReQRUYr3F
	abHON2OyunqnfelEgqJkhkkQ1zWPPM1ge3lSCB4Kt0KFcvkYaU+9zEejorw2Pijl7JuilJmBFeyD+
	GldAJK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1td-0000000Bc4Q-2pXO;
	Tue, 26 Nov 2024 20:10:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1sf-0000000Bbye-2UzT;
	Tue, 26 Nov 2024 20:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732651789;
	bh=Ft7Hps8cVn5oFfsG0zN5jTRhSDFJ4zRVat3qnNXJlmw=;
	h=From:Date:Subject:To:Cc:From;
	b=TMmFxRvJXsflouuAgDPUFIqGHGGSMonQR72pyt4rQ7Khxzp7poIjBv3M64aWSVhai
	 +QQcjDWCsHcCEbBO9iszt6Ej6eOZC4RbO5CUKPV8RVINvYzMMPx9YSSlnmetYowMDz
	 Ihf4nOcvYNxwA9pPDE+Zn91vopOjik1qRkG4Yp3TWpLMb5cBnGQgl8bzvlhSLXwUdl
	 n0gpXRZcHRWFF1XLW6apg1hEFvKjVv/wHXMIJ0VM4UubbovywvqHVKlonrsQdDbjvw
	 Zy0oDlrIB8whALsU+dtSAYrJrGiIqCeieZdL1SGQLZ9WXNS/ol532LPmjCFkpi+T+b
	 VGDHv1XCQsacQ==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65AB717E37B1;
	Tue, 26 Nov 2024 21:09:48 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 26 Nov 2024 15:09:43 -0500
Subject: [PATCH] ASoC: mediatek: Check num_codecs is not zero to avoid
 panic during probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241126-asoc-mtk-dummy-panic-v1-1-42d53e168d2e@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAYrRmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMz3cTi/GTd3JJs3ZTS3NxK3YLEvMxkXcM0c0szw7Tk1OSUJCWg1oK
 i1LTMCrCx0bG1tQBJs4MhZgAAAA==
X-Change-ID: 20241126-asoc-mtk-dummy-panic-1f7961fcecdb
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_120953_791469_198F1369 
X-CRM114-Status: GOOD (  17.09  )
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

Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
Component via COMP_DUMMY()"), COMP_DUMMY() became an array with zero
length, and only gets populated with the dummy struct after the card is
registered. Since the sound card driver's probe happens before the card
registration, accessing any of the members of a dummy component during
probe will result in undefined behavior.

This can be observed in the mt8188 and mt8195 machine sound drivers. By
omitting a dai link subnode in the sound card's node in the Devicetree,
the default uninitialized dummy codec is used, and when its dai_name
pointer gets passed to strcmp() it results in a null pointer dereference
and a kernel panic.

In addition to that, set_card_codec_info() in the generic helpers file,
mtk-soundcard-driver.c, will populate a dai link with a dummy codec when
a dai link node is present in DT but with no codec property.

The result is that at probe time, a dummy codec can either be
uninitialized with num_codecs = 0, or be an initialized dummy codec,
with num_codecs = 1 and dai_name = "snd-soc-dummy-dai". In order to
accommodate for both situations, check that num_codecs is not zero
before accessing the codecs' fields but still check for the codec's dai
name against "snd-soc-dummy-dai" as needed.

While at it, also drop the check that dai_name is not null in the mt8192
driver, introduced in commit 4d4e1b6319e5 ("ASoC: mediatek: mt8192:
Check existence of dai_name before dereferencing"), as it is actually
redundant given the preceding num_codecs != 0 check.

Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c               | 9 +++++++--
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 4 ++--
 sound/soc/mediatek/mt8195/mt8195-mt6359.c               | 9 +++++++--
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 08ae962afeb92965109b303439419bc6e7c2a896..4eed90d13a53262f0df99384494c6992b0341471 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1279,10 +1279,12 @@ static int mt8188_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 
 	for_each_card_prelinks(card, i, dai_link) {
 		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
-			if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
+			if (dai_link->num_codecs &&
+			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
 				dai_link->init = mt8188_dptx_codec_init;
 		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
-			if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
+			if (dai_link->num_codecs &&
+			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
 				dai_link->init = mt8188_hdmi_codec_init;
 		} else if (strcmp(dai_link->name, "DL_SRC_BE") == 0 ||
 			   strcmp(dai_link->name, "UL_SRC_BE") == 0) {
@@ -1294,6 +1296,9 @@ static int mt8188_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 			   strcmp(dai_link->name, "ETDM2_OUT_BE") == 0 ||
 			   strcmp(dai_link->name, "ETDM1_IN_BE") == 0 ||
 			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
+			if (!dai_link->num_codecs)
+				continue;
+
 			if (!strcmp(dai_link->codecs->dai_name, MAX98390_CODEC_DAI)) {
 				/*
 				 * The TDM protocol settings with fixed 4 slots are defined in
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index db00704e206d6d3f500a5c8533e0159f16cf77b4..943f8116840373a563f5f10a7bd0f5870c331b67 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -1099,7 +1099,7 @@ static int mt8192_mt6359_legacy_probe(struct mtk_soc_card_data *soc_card_data)
 			dai_link->ignore = 0;
 		}
 
-		if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
+		if (dai_link->num_codecs &&
 		    strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
 			dai_link->ops = &mt8192_rt1015_i2s_ops;
 	}
@@ -1127,7 +1127,7 @@ static int mt8192_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 		int i;
 
 		for_each_card_prelinks(card, i, dai_link)
-			if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
+			if (dai_link->num_codecs &&
 			    strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
 				dai_link->ops = &mt8192_rt1015_i2s_ops;
 	}
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 2832ef78eaed7283eaad822931ce0b515fa44d0a..8ebf6c7502aa3dedd213471b8968e2958f28c4a3 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1380,10 +1380,12 @@ static int mt8195_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 
 	for_each_card_prelinks(card, i, dai_link) {
 		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
-			if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
+			if (dai_link->num_codecs &&
+			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
 				dai_link->init = mt8195_dptx_codec_init;
 		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
-			if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
+			if (dai_link->num_codecs &&
+			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
 				dai_link->init = mt8195_hdmi_codec_init;
 		} else if (strcmp(dai_link->name, "DL_SRC_BE") == 0 ||
 			   strcmp(dai_link->name, "UL_SRC1_BE") == 0 ||
@@ -1396,6 +1398,9 @@ static int mt8195_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 			   strcmp(dai_link->name, "ETDM2_OUT_BE") == 0 ||
 			   strcmp(dai_link->name, "ETDM1_IN_BE") == 0 ||
 			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
+			if (!dai_link->num_codecs)
+				continue;
+
 			if (!strcmp(dai_link->codecs->dai_name, MAX98390_CODEC_DAI)) {
 				if (!(codec_init & MAX98390_CODEC_INIT)) {
 					dai_link->init = mt8195_max98390_init;

---
base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
change-id: 20241126-asoc-mtk-dummy-panic-1f7961fcecdb

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


