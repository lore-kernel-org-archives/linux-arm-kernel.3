Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AE3C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Xw8943O0WfhXyCHUf9BY5udpQGxSB0/eJ7jLp571n0=; b=hlXemF4LknjNsY2C9FsfYd/mr0
	2M1ljBOuOKKkmmYofU2rwHKLv2fNrpARUISsQJ6b74o3de3yYSVD1VkUAY81Gh6DwyjGWsA4/0c4b
	0OULzH/S0QAK+zVjk5L/GcIaBj/6pwS8aOnSnRbq3xpjb/7CXXSQvUi0RZJ4f/c75nZSCFGdrN5Sa
	lxND8KZGo/GZamgEa7OovhDAYxFQGKLwBWzbKUrT3VIJNlSI5EG7RizPxwZYWhFkIBgsHBxkmn+Gi
	dD1V6ToCp5YAP+nOycGMPl1NfOkc06bhwI9baFlQ6d8S6LnNaGvrUWZ/toHJ6ZZ6JO3+4boSd8IK8
	OkNGcUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpHS-00000000nub-1AYE;
	Fri, 17 Jan 2025 16:33:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpGB-00000000nYV-1gSa;
	Fri, 17 Jan 2025 16:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737131508;
	bh=58nCRlhim/hqdZdfV3fPYGWz0W4AInp/Qn1bfkzmZN0=;
	h=From:To:Cc:Subject:Date:From;
	b=D5vuj4lMaUyfXNIazmrsjk4WN5bgvldbkIVlIC0FA2NFtgWZRnjU1YQ8UjgIAtrcL
	 lPHpIIjwEZFNzgAyMroZSb2iydlo1J6TL0bPP5wQCz+Pl/0cvEDjip11VG/tmbgHws
	 mDiKt1SCAnkGN1GT+k0JFnM6rhtgNEgaGyn2zgEL0gDDVYDAcEBvmkv0l2GBzIlXJ2
	 tovGqeO9WUsYa2ok0y0Q9ewcYCPHw+zuxlAvXnVD+tl+x6ExH0oq/cEnLxu52W0PhU
	 RdLW/FAYiQ16qon/ZZXyvZ3L0lMDDi9GB+S1ADLr8KBQLZj7VtXHrIuaZ9d9ntcer5
	 RUKaR0N/RsklA==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E11AD17E09E9;
	Fri, 17 Jan 2025 17:31:46 +0100 (CET)
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
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback
Date: Fri, 17 Jan 2025 11:31:02 -0500
Message-ID: <20250117163102.65807-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_083151_617034_36BEAC6B 
X-CRM114-Status: GOOD (  19.36  )
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

In commit
9e2ab4b18ebd ("ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates"),
the set_sysclk callback was removed as considered unused as the mclk rate
can be set in the hw_params callback.
The difference between hw_params and set_sysclk is that the former is
called with the audio sampling rate set in the params (e.g.: 48000 Hz)
while the latter is called with a clock rate already computed with
  sampling_rate * mclk-fs (e.g.: 48000 * 256)

For HDMI audio using the Rockchip I2S TDM driver, the mclk-fs value must
be set to 128 instead of the default 256, and that value is set in the
device tree at the machine driver level (like a simple-audio-card
compatible node).
Therefore, the i2s_tdm driver has no idea that another mclk-fs value can
be configured and simply computes the mclk rate in the hw_params callback
with DEFAULT_MCLK_FS * params_rate(params), which is wrong for HDMI
audio.

Re-add the set_sysclk callback so that the mclk rate is computed by the
machine driver which has the correct mclk-fs value set in its device tree
node.

Fixes: 9e2ab4b18ebd ("ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 31 +++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index d1f28699652f..acd75e48851f 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -22,7 +22,6 @@
 
 #define DRV_NAME "rockchip-i2s-tdm"
 
-#define DEFAULT_MCLK_FS				256
 #define CH_GRP_MAX				4  /* The max channel 8 / 2 */
 #define MULTIPLEX_CH_MAX			10
 
@@ -70,6 +69,8 @@ struct rk_i2s_tdm_dev {
 	bool has_playback;
 	bool has_capture;
 	struct snd_soc_dai_driver *dai;
+	unsigned int mclk_rx_freq;
+	unsigned int mclk_tx_freq;
 };
 
 static int to_ch_num(unsigned int val)
@@ -645,6 +646,27 @@ static int rockchip_i2s_trcm_mode(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int rockchip_i2s_tdm_set_sysclk(struct snd_soc_dai *cpu_dai, int stream,
+				       unsigned int freq, int dir)
+{
+	struct rk_i2s_tdm_dev *i2s_tdm = to_info(cpu_dai);
+
+	if (i2s_tdm->clk_trcm) {
+		i2s_tdm->mclk_tx_freq = freq;
+		i2s_tdm->mclk_rx_freq = freq;
+	} else {
+		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+			i2s_tdm->mclk_tx_freq = freq;
+		else
+			i2s_tdm->mclk_rx_freq = freq;
+	}
+
+	dev_dbg(i2s_tdm->dev, "The target mclk_%s freq is: %d\n",
+		stream ? "rx" : "tx", freq);
+
+	return 0;
+}
+
 static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params,
 				      struct snd_soc_dai *dai)
@@ -659,15 +681,19 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
 
 		if (i2s_tdm->clk_trcm == TRCM_TX) {
 			mclk = i2s_tdm->mclk_tx;
+			mclk_rate = i2s_tdm->mclk_tx_freq;
 		} else if (i2s_tdm->clk_trcm == TRCM_RX) {
 			mclk = i2s_tdm->mclk_rx;
+			mclk_rate = i2s_tdm->mclk_rx_freq;
 		} else if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			mclk = i2s_tdm->mclk_tx;
+			mclk_rate = i2s_tdm->mclk_tx_freq;
 		} else {
 			mclk = i2s_tdm->mclk_rx;
+			mclk_rate = i2s_tdm->mclk_rx_freq;
 		}
 
-		err = clk_set_rate(mclk, DEFAULT_MCLK_FS * params_rate(params));
+		err = clk_set_rate(mclk, mclk_rate);
 		if (err)
 			return err;
 
@@ -827,6 +853,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
 	.hw_params = rockchip_i2s_tdm_hw_params,
 	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
 	.set_fmt = rockchip_i2s_tdm_set_fmt,
+	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
 	.set_tdm_slot = rockchip_dai_tdm_slot,
 	.trigger = rockchip_i2s_tdm_trigger,
 };
-- 
2.48.1


