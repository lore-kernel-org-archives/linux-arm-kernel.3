Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E689E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 20:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oDHIq/4/2fWtBJtLjLZdJuptPLqeJLsh7xhlYQ0jUvg=; b=aeIJZZvDdI5A9RR3PHfRFDR/I8
	16irObmRRAbgtu/+cgm3GIFFSYVGgt6VIPXebj8g5LhJIhLPvgpH7MohfH78DaGkOLb6dSAA/rrrS
	rPVWPkIE4oi1VJb5rEIyIQGV1MwEYF0qxxsBpDa1OzRTmw+rzI4eICv9DSVGLNMqRKyY7Sljj91cp
	Ij/gzpHc+7swZSfpRlzfDRBhGYllBkq43Z3Awqx/jiJYoqod5VEYL19CY8XAo/yxS4hOClRi/VwEI
	GnTQAMrj+lga4tT1L4tX3lxTbhLGPDZoelA/Wqhb9ZjLUMpkZNqqD3c8KYA7v+8mregqZeMfSlu0x
	0E4h31Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vso0v-0000000AMis-1700;
	Wed, 18 Feb 2026 20:19:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vso0s-0000000AMho-1Q6d;
	Wed, 18 Feb 2026 20:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771445948;
	bh=zo8tEBh7OtlzfrABsEVBwAQNqGYbVlNeoFlcaDNUlmI=;
	h=From:To:Cc:Subject:Date:From;
	b=SE7JODQlSJ/CpmNHMCle+8gp0kCVoL5KK8M7ppvM7tgbqZlyskEPxrZBMrhjEZ1gT
	 LAenXfkEKYf3NXZIeZ/VbcUoY+9kWG6KoCj5c6GvJO248hp7042yX3sVw7Emmg2zHX
	 d88TTjqskLqPGZ4vr3hWtMNIJ+OO0zObpRTPF2Dx2XQudgPudlMFE0kXjr6BO8Ol+7
	 FeYxA0otQU2QK6JFGigyKLLj2/RWsJwqTdU1uBln8RR29GBlJ6OBsP7SWb5DPQT5/P
	 tMj77wo25Ah3UoxE2QkXsHGmsLEVRciI7GwIfWwYTsnTqnjg4wUoSJ0DSjlRQDMOvJ
	 1Bt8ufM8WMcVA==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 14C6117E131B;
	Wed, 18 Feb 2026 21:19:05 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not provided by set_sysclk
Date: Wed, 18 Feb 2026 15:18:34 -0500
Message-ID: <20260218201834.924358-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_121910_526110_FC2A1CFA 
X-CRM114-Status: GOOD (  13.40  )
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

Drivers will not always call set_sysclk() for all clocks, especially when
default mclk-fs can be used.
When that is the case, use the clock rate set in the params multiplied by the
default mclk-fs.

Fixes: 5323186e2e8d ("ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 770b9bfbb384..fc52149ed6ae 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -22,6 +22,7 @@
 
 #define DRV_NAME "rockchip-i2s-tdm"
 
+#define DEFAULT_MCLK_FS				256
 #define CH_GRP_MAX				4  /* The max channel 8 / 2 */
 #define MULTIPLEX_CH_MAX			10
 
@@ -665,6 +666,15 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
 			mclk_rate = i2s_tdm->mclk_rx_freq;
 		}
 
+		/*
+		 * When the dai/component driver doesn't need to set mclk-fs for a specific
+		 * clock, it can skip the call to set_sysclk() for that clock.
+		 * In that case, simply use the clock rate from the params and multiply it by
+		 * the default mclk-fs value.
+		 */
+		if (!mclk_rate)
+			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);
+
 		err = clk_set_rate(mclk, mclk_rate);
 		if (err)
 			return err;
-- 
2.53.0


