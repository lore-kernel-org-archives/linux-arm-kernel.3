Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B44C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rG7pHVRoBOiNFfCu2MAih2uwHbyr24BqejYuAC4Ua5E=; b=qbcxBQWvnazsmiPdxlQqSptGZ8
	tJRMGp3layUKWdTPeJ9g0yoLF3REclKQpMR/jrzlrVJGDMjET1PeGndjQt0C/ywXUOMScA7kAybuk
	wLxHA/5nn6ijAMDgdsH76Zuz5GOz43KJEJqOm3VqKhGDB0yNs4THM19V9oW9ZOIMfxTTMgtudzQbT
	cqM1CriTXYeagWm8jFzLVqXAprAnENtFyOxeguNT8aTL2aTrG4pcef9nfV7BrShl9a0u/EMI7Hy21
	nlwON6DZNKQfXM0HC0tHDBA3wD1HJ9gS5ZoIHlICsywxxbElH791bvXLUbpG59F8m8Qe0A1Kug6GI
	IDxDenvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tomUP-0000000GMwv-2Pd0;
	Sun, 02 Mar 2025 16:48:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tomEN-0000000GKTc-15IP;
	Sun, 02 Mar 2025 16:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740933113;
	bh=ZWTM6SruLoU5Q7PWlGoj6r0M6P0ulz3KBlt6spoubXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WBBRgyTLjVIaCoA3VRgX6PxfM5+3BbNL7U+pKzWL+2NSo27J0Beo51S0g35mV890F
	 Yny3T+TfQT+F/WBnoJU64avxBFqnhNwviUVhvha3ZMe1VJIMqvGh8YBysw3Xgal5nD
	 1gMoBSsd5QH/5xg+NEwGj1ipQNdFZgZaDDJ0IpabUGiMh8wu5iME9gU+xmZkHKmPza
	 KkTEvOROe0g7wR6fb+3pfmDQtLSNlFSxJuUuCtQg7oDNewOBVAxYDwUbeMQoFCvnp3
	 gfGQDZPYZ7XUYyrqo3jze5xuGjRgIZMpdVvL1ZaE2PC7zpEj7fdFZ5FBtIYe2jKo6F
	 ck4XQ87dpQITg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED33C17E05EA;
	Sun,  2 Mar 2025 17:31:48 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sun, 02 Mar 2025 13:30:49 -0300
Subject: [PATCH v2 10/20] ASoC: mediatek: mt6359-accdet: Drop dead code for
 plugout-debounce
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250302-mt6359-accdet-dts-v2-10-5bd633ee0d47@collabora.com>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
In-Reply-To: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_083155_438768_13A6780B 
X-CRM114-Status: GOOD (  10.04  )
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

The mediatek,plugout-debounce property is undocumented in the binding
and unhandled by the driver. Remove it.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 5 -----
 sound/soc/codecs/mt6359-accdet.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 6b0178976d91e37c32540991693ebfd8e29c11f5..d78d7516342a5c2273b1c2962c0346646aa6390f 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -513,11 +513,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	if (ret)
 		priv->data->mic_vol = 8;
 
-	ret = of_property_read_u32(node, "mediatek,plugout-debounce",
-				   &priv->data->plugout_deb);
-	if (ret)
-		priv->data->plugout_deb = 1;
-
 	ret = of_property_read_u32(node, "mediatek,mic-mode",
 				   &priv->data->mic_mode);
 	if (ret)
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index 09e1072b61a4c929bf6b764b4fab3c4b26f7cf4a..54a33a0f0e084f80df33386b3df9bba9525fa880 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -72,7 +72,6 @@ struct pwm_deb_settings {
 struct dts_data {
 	unsigned int mic_vol;
 	unsigned int mic_mode;
-	unsigned int plugout_deb;
 	bool hp_eint_high;
 	struct pwm_deb_settings *pwm_deb;
 	unsigned int moisture_detect_enable;

-- 
2.48.1


