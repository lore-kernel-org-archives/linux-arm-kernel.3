Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F19CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=; b=15kJR/f2c3CJRacFsieBPlSOtC
	sBSQp+EBWtmfh7kS+gy0ScI8fivOhfNX8GLlWshnULkBg0lFlKnTrDkz1StJozajhle1j9xoq0NIj
	2ZDvT7EbgJnlfdBwkf3h6PvvlWCED0OtkkEyC/LOvzqeNSLScSyAS1hYcm+uloC+rqkfifDVKaruV
	GHLL5XhQ08rJDG0uYgvxmp/ol9DNUjWTHnhNneFdfU0/5FAw+IFjfMpUbT8/YKVTO1YARX8HY6vQt
	cXcb6sxwEnGqQ0ftFd/zS5BNfm11rH3VpqaSa8/XVXU5csJzfjVTese9aDu/cyjKPQn2PcAVzf6zR
	EtC/IGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJJ1-00000009drs-1Abb;
	Thu, 01 Oct 2026 16:06:47 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIv-00000009dlp-2qfV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:06:43 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so31370975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870800; x=1791475600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=MK7LpCuISTY5fbirjHepBI0V56Ais4Y22FGbqJr9mv9WJZR8e9XPPOLLoeYIUamuaS
         HuvVORcriW8N21AuNrKzNHoXeao/YtZGFMFQmYN90yoEdHcHeVezGMrYEIkZMWqh6U7V
         Ys+cGioB4neNPT8z82H3ZFtB0tlny0opMlb+QzECP4pBQ65RteB7ltmNFpGesmn0n26j
         iFXS85gBW5l2VCjN5DTlBOI620LMD3C5r85uBthUiC+0c3n74YesV9NGTp74nsr8GBw4
         vDG89ClbTpy9UK9goONxHK46rGyu0CiOmE0qVZRDLsxxwLu48+JLKDObH+0HJ7GEv1aa
         rDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870800; x=1791475600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=iCF0rfFM24oaeA8839O8Tdw8i1a7ME83b4aYaijVWA81JcDcWtjb/tgNs2AUKa96IK
         Duc0Zl0Kbqoa68ItIjJzfoaTprjagm0ZwLr6xgAb4A1b8qa8i47dhdUU1wcVO0118YEn
         4ERpUGrdkfkBYq0iT+LG7QMDwrbgqeERHUXpUDsflmNOOmjW9e8D4u/gLjDrd1GFmoqC
         SiwDbw6R4gmalckviL+GIlPPLdV+mTFkozSO0u9+OjGetx+yCI7xU7Q8AJx15pFoMyNA
         16KtbdfJu4GwsKwW7KSjMfhGOdZmXUZPT93ve2m1hLyXnLgJlMZTgGvAMcgyDXDsX/LC
         DkFg==
X-Forwarded-Encrypted: i=1; AKwUvBy1O0Pi6RiP5ZIg6aec64eYyBJseLeXbOtbKAIykNXpfFksJ9AQEXxOeJ2HaZP9ACwzKBgMoYTwietdUmUQnhwR@lists.infradead.org
X-Gm-Message-State: AFuF++lMeLRlkDwaEe09fuNmEY0QWefkgmkcVTdD90lKruz0FmGqOZjt
	gnCIUEVdD7u5r0eOXZEvGP5YEbo5yzs3/plL3TgdhpxlDTseRAd4zi6ImIVM5wAv7g+Pdt+768b
	Bry7ZItA=
X-Gm-Gg: AYBFou0D0e5UvWg+o8nNh6CzgPAi8Xi0oIQxRYJED1WW/3zYd/nEkGfcI2JPa5dZ3Iv
	9/lU32ZE4fb5oMnlmVE5IYWy+NVWWmQI+MNG5xcqTOKBvDV1BlDZsQZ7+Mc1qdMITWJkQCWPCAq
	szJpzdPg+kBShfxX27Pnlm1NLwtx4kvihsiont2Uv0FTVpD1OvZz25ZSBIuIGbTXnO8H+4oNNGM
	T6pRsMroxNmTFmElTWJuHO0jFLc6oKlVnf1H619RQh4Ah57+xHWDNJzJy4Xz9GJTQF0DOGcR3rA
	Zvpmbs05VuiOYVA0Be6YDPucO6vpUouzVRvHmz3XakSsWxGFyctae2eESN0sT3t2/Z3wK4Pl3T4
	Lm5ZuDCw2sSHCAQGO0mRxX7JgmWc/GSx1p6FKcMY1XQvDxeIfvsYxBuI4ItXqw2ReCQK69+sudy
	zX51xn+w/v9gQOoml+JJew6tkq8A4kQnoO1a9ii9KSjqC0SXe54Dpitz08gFtON/Pe
X-Received: by 2002:a05:600c:470d:b0:4a0:276e:9efb with SMTP id 5b1f17b1804b1-4a0276e9f23mr1133685e9.4.1790870800021;
        Thu, 01 Oct 2026 09:06:40 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:39 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:28 +0200
Subject: [PATCH v4 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-3-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=USKlfavDbggOjZS2/SFDHhmHPla3alh2Tu6lzPN+798=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrl71S8qlvn0bxGeEN9lfjP73UHdr75XPB8q9PeJP
 Vb/M/NXRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACbSqMPwP3Zr7cr4t3OXGOnE
 /GjefIf1tdJuvt731pMSJVp2XKiZksPwv/CLslLal9xVD8qXetZzrpPXXSg+1ydibuup3vY2vkm
 SrAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090641_761121_DCC620E0 
X-CRM114-Status: GOOD (  19.09  )
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

A recent Sashiko review [1] on this code revealed the following problem:

  If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
  and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
  snd_soc_dai_active(dai) remains 2. This skips disabling the clock
  divider.
  When the streams are subsequently closed, the ALSA core skips invoking
  hw_free again because the state was already changed to
  SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
  enabled, potentially draining battery or blocking system suspend.

This commit resolves this problem by using the 'clk_enabled' field of
'struct gx_stream'. In particular when 'hw_free()' is called on a stream
the code check what is the status of the other stream and then only if
both are off the clock divider is disabled.

[1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.org/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 58dce9f08c9d..70ea39c77b32 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -219,16 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_stream *other = snd_soc_dai_dma_data_get(dai, !substream->stream);
 	struct snd_soc_component *component = dai->component;
 
-	/*
-	 * If this is the last substream being closed then disable the i2s
-	 * clock divider.
-	 */
-	if (snd_soc_dai_active(dai) <= 1)
-		aiu_encoder_i2s_divider_enable(component, 0);
-
 	if (ts->clk_enabled) {
+		/* Disable the clk divider only if also the other stream is not using it */
+		if (!other || !other->clk_enabled)
+			aiu_encoder_i2s_divider_enable(component, false);
+
 		clk_disable_unprepare(ts->iface->mclk);
 		ts->clk_enabled = false;
 	}

-- 
2.47.3


