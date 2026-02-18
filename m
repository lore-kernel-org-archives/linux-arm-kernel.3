Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E275E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SZ+4RuppPKjR3qQWfgPnGLn2XDy90FMtkHwzrPksBgw=; b=ufp3Ttr9laS8U9D7BbCQpmk8eT
	bi4dwYS0m9wOimUC2iFPLYZTub6VOxWHE14j8K2zCvfGvC8WNdWwIh7LJ3U7c1SbH04y3h/+J/i3I
	quZ3/jzIXGKJBOZwH7K8rc11uGKWUEmcA/cxX3D4TZTecVJS77IZqFvNiCa8BUwBCdPpgMLhKAhop
	2ewHxfBk/FlEv03ANK8ZtiLociOlo1g5nEO2lIcNGraHERDtaDJ/8qq0IWG3QelbmQ6BPZY5Qb6b8
	zvhejl5wc11YWuWIhdcAOddytLgKLsCRCOP65x5ghOORcZxvFy13eTuNrxU6OHon1sF2G/FyA0/II
	V3J2/dEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgP9-00000009kpf-1ltE;
	Wed, 18 Feb 2026 12:11:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgP5-00000009kpA-3B1y;
	Wed, 18 Feb 2026 12:11:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 97944C111A3;
	Wed, 18 Feb 2026 12:11:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD63F60738;
	Wed, 18 Feb 2026 12:11:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4017710368B5D;
	Wed, 18 Feb 2026 13:11:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771416693; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=SZ+4RuppPKjR3qQWfgPnGLn2XDy90FMtkHwzrPksBgw=;
	b=c1zF88olfwh1e55esZHyUrYZ+A3rMtmzliwOZXO+KyGGXeKaDqg40ijVi9lrUnuqFiEk/4
	Xi3uoRvk8S3j2gnY8aMHuHqFYJWFVN+KuYtCy1Ug9gtujt5He178rzVmmxt56zf2K4Fmzm
	1BJJStUSs22nNRBxxiBMsTOKuc7lbAxZ8N1WLNDYwBGXPJVR2wkVL3rwTcEJ7bsvKRTwhf
	L7VLCoDqloOcMw85Leht4X/Pfy0sVCiWiVaGpxk0dc0NbOBtNTMnM6F7Bs5E+JnRhITVt0
	lGE7T/Dhc6y2erlYRpYaGMOw0pd5tai0rtChvut1WSMk6GpzK5UOSlAkvsvw8A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Feb 2026 13:11:24 +0100
Subject: [PATCH] Revert "ASoC: rockchip: i2s_tdm: Re-add the set_sysclk
 callback"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-snd-rk3308-i2s-revert-set_sysclk-v1-1-79ab787f88ac@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGuslWkC/x2NwQqDMBAFf0X23IUkFtH+SimiyWtdlLTsSqmI/
 27ocQ4zs5NBBUa3aifFV0zeuYC/VBSnIb/AkgpTcKFxwbdsObHOde1almBcHOjKhrW3zeIyM5L
 rYtP5K/xIJfNRPOX3X9wfx3EC2kzycnIAAAA=
X-Change-ID: 20260218-snd-rk3308-i2s-revert-set_sysclk-ed09c6914e1b
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_041140_131932_59F557E3 
X-CRM114-Status: GOOD (  12.89  )
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

This reverts commit 5323186e2e8d33c073fad51e24f18e2d6dbae2da.

The reverted commit broke this driver for the RK3308 I2S.

The 'arecord -Vmono -d 2 -c 8 -f S16_LE -r 96000 /dev/null' command on
RK3308 now results in:

  rockchip-i2s-tdm ff320000.i2s: ASoC error (-22): at snd_soc_dai_hw_params() on ff320000.i2s
   ff320000.i2s-rk3308-hifi: ASoC error (-22): at __soc_pcm_hw_params() on ff320000.i2s-rk3308-hifi

Tested on:

 * Radxa Rock Pi S
 * Upstream Linux kernel
 * arm64 defconfig

Tested kernel versions:

 * v6.12: OK
 * 5323186e2e8d (commit being reverted): FAIL
 * 5323186e2e8d^: OK
 * 21cfbeae7d7c (commit being reverted, on stable/linux-6.12.y): FAIL
 * 21cfbeae7d7c^: OK
 * v6.19: FAIL
 * v6.19 + 'git revert 5323186e2e8d': OK
 * v6.19-11566-g254edc893f3a (current master as of today): FAIL
 * v6.19-11566-g254edc893f3a (current master as of today) + this revert: OK

Fixes: 5323186e2e8d ("ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/lkml/DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 770b9bfbb384..b056d72e61ff 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -22,6 +22,7 @@
 
 #define DRV_NAME "rockchip-i2s-tdm"
 
+#define DEFAULT_MCLK_FS				256
 #define CH_GRP_MAX				4  /* The max channel 8 / 2 */
 #define MULTIPLEX_CH_MAX			10
 
@@ -69,8 +70,6 @@ struct rk_i2s_tdm_dev {
 	bool has_playback;
 	bool has_capture;
 	struct snd_soc_dai_driver *dai;
-	unsigned int mclk_rx_freq;
-	unsigned int mclk_tx_freq;
 };
 
 static int to_ch_num(unsigned int val)
@@ -618,27 +617,6 @@ static int rockchip_i2s_trcm_mode(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int rockchip_i2s_tdm_set_sysclk(struct snd_soc_dai *cpu_dai, int stream,
-				       unsigned int freq, int dir)
-{
-	struct rk_i2s_tdm_dev *i2s_tdm = to_info(cpu_dai);
-
-	if (i2s_tdm->clk_trcm) {
-		i2s_tdm->mclk_tx_freq = freq;
-		i2s_tdm->mclk_rx_freq = freq;
-	} else {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-			i2s_tdm->mclk_tx_freq = freq;
-		else
-			i2s_tdm->mclk_rx_freq = freq;
-	}
-
-	dev_dbg(i2s_tdm->dev, "The target mclk_%s freq is: %d\n",
-		stream ? "rx" : "tx", freq);
-
-	return 0;
-}
-
 static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params,
 				      struct snd_soc_dai *dai)
@@ -653,19 +631,15 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
 
 		if (i2s_tdm->clk_trcm == TRCM_TX) {
 			mclk = i2s_tdm->mclk_tx;
-			mclk_rate = i2s_tdm->mclk_tx_freq;
 		} else if (i2s_tdm->clk_trcm == TRCM_RX) {
 			mclk = i2s_tdm->mclk_rx;
-			mclk_rate = i2s_tdm->mclk_rx_freq;
 		} else if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			mclk = i2s_tdm->mclk_tx;
-			mclk_rate = i2s_tdm->mclk_tx_freq;
 		} else {
 			mclk = i2s_tdm->mclk_rx;
-			mclk_rate = i2s_tdm->mclk_rx_freq;
 		}
 
-		err = clk_set_rate(mclk, mclk_rate);
+		err = clk_set_rate(mclk, DEFAULT_MCLK_FS * params_rate(params));
 		if (err)
 			return err;
 
@@ -825,7 +799,6 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
 	.hw_params = rockchip_i2s_tdm_hw_params,
 	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
 	.set_fmt = rockchip_i2s_tdm_set_fmt,
-	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
 	.set_tdm_slot = rockchip_dai_tdm_slot,
 	.trigger = rockchip_i2s_tdm_trigger,
 };

---
base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
change-id: 20260218-snd-rk3308-i2s-revert-set_sysclk-ed09c6914e1b

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


