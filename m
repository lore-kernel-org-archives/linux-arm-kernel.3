Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83624E8784E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFVl475ipS49JUII/IO8WvOtjzXRqmi7uaxUxTIu7O4=; b=Xz8u5wzEQKxauEAYjgDCeYoTFm
	De/x3lW8URQEPptCMvnz7Cb+PYFnh5MVCi/Fk8egKWwizX5bTGWa/8PLNuka6WCxhUNsSYOwrRukb
	OaQdtLj5N0mRRUwnL92jcXsT7IgYmhAu61v1NXDjuxf2bMzjKeljzoxbTdTaSUV07G/E3BhL5gbhd
	ACM2AgLGOS0Fo0U32nOf++2vy8bDjpSZPrGX94Qob5R/dqtkc2uIEH+1bwg81Ee8IneyvN03bzr59
	UFHw3dMl3tIwzXM/8doxzyrfyOFryb5lwYSroVUGU4tWWewbN9fySHsvdxg8VF7Q4M89PiawI2mL2
	mSXN/0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJY6-00000006y0N-0iin;
	Tue, 03 Feb 2026 16:46:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJY1-00000006xtX-1WhM;
	Tue, 03 Feb 2026 16:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137195;
	bh=pi4TI7H4itbep8bOjPNJrdS5hAS2gdaa+bre7RTmdIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hcBdW37AA1exy5Hk8RiwjgF6LlTMaRjAvHBG8mXHz5BuUQff+Kv8U6LoJa4c2A9dq
	 IYFDc47LIIbndj7cp+brSh4wl0CTfzHZQLLp0QGx6K5rwmFD+cGyaViIC2qRbGPwP3
	 wFfJG8RWYyJQN+zshsim19kuSW2rIwAeJm9FbQJBHC9wagCu2CzBjK/eQh7oMJ+uG4
	 Ga4Bud760RTgZX7GmhDdeGMmxkw7c4HFqlvYG0/HDMmRwMJUIoYz+XdTww54U4Xqvu
	 9X/lynHkStcWiH+kJo8hkwUeTQ/GZ/Ui09wBhi/7Wnat9JHw6sphCGqU9s3Tyh80C6
	 aut0OlbclfVOg==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5A4517E1516;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 199AB48002C; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:29 +0100
Subject: [PATCH v2 07/10] ASoC: rockchip: spdif: Add support for set mclk
 rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-7-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=JfQt8iv01h3jUyWNHVEds69H5a+SlC3Qy6aZ/D87xHQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmnlOWtXPSUXVegwfbJ81P++b3bpPfk2z
 SfDgcFZ4gt68okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qaUbcP/jgzoVaKshqu3HLYM5MxNG8+T+vHpkI5z9RB5Ad5zErTRd8/a0x9z0O5p9Sa8Q5Fs5S
 MNml+Mcym/KXzSexxpGivxNl7HOjQVisqIBALZAiGACxAyWzjMhWt9kkduXApbNFh6ekpM8b7r1
 NdGTZFvdSSCEbOUXi7o/nVJsVTN2LGj0kDut/xt2YPE+kAIf79SIu47yoB2ee5tZ8HtMS4aFskf
 b+kPgMUW3vxxlg9+J6ND7XVV088AJD/Nkd1Xv/dIvyLhdTzMdlOwIhtLagXt6H0vWnRtpchJXpz
 tGzBavpyOjufaq1uqWOLtkF0jE6dvvB9nc3ACLItZGp6USjC6yF/W6hSkOnFPdnWjuK7ODxUr8c
 FdnEm2C1+XZk3FnsvXZqSMUf4y1jS4zZOMD0Uo4d17OHIsoxQHKr5bRkfgN/8NMN6kVEcrMIYB3
 /03W5lirAghbRThjZBaPY9Fc1oDFjnN2cRJ1u9o3yb/VaOT1WW9MDxcgoJomxyVEG+BSAcEx9mO
 HxcQVwUtZm0uAp6zOWOtZnQOttgNkzHDsHQB5ImO3Qc1mH8aVnP177WSdFn6jXbOEQ4Wg6gJfhr
 GcnCUgB51JvILOYXl0hXW21DmuVY2vUngcbs4CDwAfzQt7ieZmCe0yTDElU7rpNMW/6nq4bmcMZ
 Kjuky7USlTIDm1Z91w28wbw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_084641_589279_1888C227 
X-CRM114-Status: GOOD (  16.87  )
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

From: Sugar Zhang <sugar.zhang@rock-chips.com>

Allow setting the mclk rate from the machine driver.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 34 +++++++++++++++++++++++-----------
 sound/soc/rockchip/rockchip_spdif.h |  2 +-
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index c1221ff00ed7..3b66d97f0582 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -86,12 +86,15 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
+	unsigned int mclk_rate = clk_get_rate(spdif->mclk);
 	unsigned int val = SPDIF_CFGR_HALFWORD_ENABLE;
-	int srate, mclk;
+	int bmc, div;
 	int ret;
 
-	srate = params_rate(params);
-	mclk = srate * 128;
+	/* bmc = 128fs */
+	bmc = 128 * params_rate(params);
+	div = DIV_ROUND_CLOSEST(mclk_rate, bmc);
+	val |= SPDIF_CFGR_CLK_DIV(div);
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
@@ -107,14 +110,6 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	/* Set clock and calculate divider */
-	ret = clk_set_rate(spdif->mclk, mclk);
-	if (ret != 0) {
-		dev_err(spdif->dev, "Failed to set module clock rate: %d\n",
-			ret);
-		return ret;
-	}
-
 	ret = regmap_update_bits(spdif->regmap, SPDIF_CFGR,
 				 SPDIF_CFGR_CLK_DIV_MASK |
 				 SPDIF_CFGR_HALFWORD_ENABLE |
@@ -177,7 +172,24 @@ static int rk_spdif_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static int rk_spdif_set_sysclk(struct snd_soc_dai *dai,
+			       int clk_id, unsigned int freq, int dir)
+{
+	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	if (!freq)
+		return 0;
+
+	ret = clk_set_rate(spdif->mclk, freq);
+	if (ret)
+		dev_err(spdif->dev, "Failed to set mclk: %d\n", ret);
+
+	return ret;
+}
+
 static const struct snd_soc_dai_ops rk_spdif_dai_ops = {
+	.set_sysclk = rk_spdif_set_sysclk,
 	.probe = rk_spdif_dai_probe,
 	.hw_params = rk_spdif_hw_params,
 	.trigger = rk_spdif_trigger,
diff --git a/sound/soc/rockchip/rockchip_spdif.h b/sound/soc/rockchip/rockchip_spdif.h
index d8be9aae5b19..fcc28b6c4f58 100644
--- a/sound/soc/rockchip/rockchip_spdif.h
+++ b/sound/soc/rockchip/rockchip_spdif.h
@@ -15,7 +15,7 @@
 */
 #define SPDIF_CFGR_CLK_DIV_SHIFT	(16)
 #define SPDIF_CFGR_CLK_DIV_MASK		(0xff << SPDIF_CFGR_CLK_DIV_SHIFT)
-#define SPDIF_CFGR_CLK_DIV(x)		(x << SPDIF_CFGR_CLK_DIV_SHIFT)
+#define SPDIF_CFGR_CLK_DIV(x)		((x-1) << SPDIF_CFGR_CLK_DIV_SHIFT)
 
 #define SPDIF_CFGR_HALFWORD_SHIFT	2
 #define SPDIF_CFGR_HALFWORD_DISABLE	(0 << SPDIF_CFGR_HALFWORD_SHIFT)

-- 
2.51.0


