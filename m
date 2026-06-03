Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA431CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 03:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqiGW/dz4YSeZ3jaBcWBt4ocDaFmKXFEK9JnLN8NHsw=; b=NsVaM2h7G8Amd4MNuI9nudc9Uh
	uhpZOSijCGwI1V6LTtb4CiHjOn/iKxpVGprBXUdyqMB7z4vYegdqMRAfQ3bLR1xfy1eb9tCymcI4K
	t9aJLn1km5jurcjAoCy9wCSw3VqzYDG5LZJX0Il0QCEJ7mEI9bdqRBJc4A1+8sCKAgs02vBzDCuxI
	1n7X18mNCXl8fnaxm53FoLPbX6d5CDKGcEe/WEWHtGhQKQcweIQMPncZw5zAvThXRF3ifVqpV+WTT
	QtbnZtjV0vF14AWKu8o94dN2U+59pUyRtcBTwDYSbmdfvniS8s349SXeU7gDNPTJTFdsnwDy56bEX
	KUJ45h6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUckh-0000000EDoh-1n5n;
	Wed, 03 Jun 2026 03:58:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUckf-0000000EDmf-0A4T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 03:58:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bf125989f2so39976275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 20:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780459124; x=1781063924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqiGW/dz4YSeZ3jaBcWBt4ocDaFmKXFEK9JnLN8NHsw=;
        b=TWuJpkwxaD7Q+5JyhbvFvYduN+CTjnpLBGIZ9RFKcKFFSV6tYDanTo+jDdxskfUPaE
         IU2bNIirmw3wQ/3zteIhhzmTjpLJB+iIbtE2sGBYYIT9LatWXEUHXbaihzKVYYTgQ1eC
         YCr0T/LmBDQTZWz0675vFHgCPomFzWH+XjE/NJauppA6YLTdWLRBBB5YrP2CAEbQ4wXi
         1Bmz0GOp5l3PPitTH7PemjqMnTP3z6QzUPgoXeMjG1EqpUq1pCDCwEjO9sRINJqXmD6Y
         75hrB/QoBnEEdFyYMETaTnCa2dixvfLoc/vXdjgdHDAznnTKf5c4yzVn7qEGgcFdzPSj
         yvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780459124; x=1781063924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QqiGW/dz4YSeZ3jaBcWBt4ocDaFmKXFEK9JnLN8NHsw=;
        b=K63EXupPBxJF3c6DovpLxivTQqtMNkwb8cdWsQyKtxF4Jvq3G+TvLDsI/tuUYXGTTq
         N6eQqu+/Kw240L5NHtT7n1VlyHk+2Dc5aTOKnNCPGekYeTRn4D++E0YjC017hUTXN6f4
         zTnS1u/q8mqIv8/wBcS5PC5Oq6v5Yk7YG73mekQpWiZ6Pcqp6fcbQiHCJhM4Uihx2rNn
         MDOyPoKbjHM1JDmlj1usDddUczursJv9In8IHT+E/cf3u7VcO1goTv03X+Gl6rQEnw84
         Fxu8MvSvIuyDfVJLb3/ch9/iaaY4az+OdOXgEuiGKpZ1C+yLRpg2a60RylLwnXTUngvJ
         C+cA==
X-Forwarded-Encrypted: i=1; AFNElJ+tBq84muwUs6iiVe/h1LbP6afAUtVSpvRR6Uyqn3RAmDh6pNMUDA0eGVZOuUPOUBjXMKF/il/664fil6lm5ytx@lists.infradead.org
X-Gm-Message-State: AOJu0YyIb4UV6UTa2tpoYVG9PprMcX/fwuuU9ZorUQFIfJlNrV6i8HmR
	FYe0YXYdUSMEi7OpQAsglqSOb4kr9XY8UZW3KCzjuWc6tc2zSZ0iEkBP
X-Gm-Gg: Acq92OGWUPQA/j58zTXUIuHH9N7d+BtonhKzf+Mds7V9i/NcTLO49c3XMUHgj4qyB3T
	wS7QshthWQyq55XzbDofjZ/XhBmONzQ9ZWm7wmGvttM8PnoJovkiTxsCs7/NB3RGKflpWX24hZm
	K9YkuevS475c/4n3mJHjR8OfVqH5bSfCUossCNINj53kF9NDDXoufoqRle8SPO75BDBs3S+yYJJ
	5LN3xlM3LVTfVqpz2yzJFNl5K0+9VVMkF9R+ADalYeWgAbcNbTzhgDMDtomzXwr/ut1oe6LvCmf
	29bhZkAeA+Mye0xT/oRiWH+F4yFLOxhZ/f8T2vsNv6G3zMmRpec+SNYCXEc7A6+ojrkHN0PTMRZ
	1QgHHYNI/oqVH0f8wmeHXNZ4AhUvi/4CrnOG3KUJmGD1HoxfnSdqp5c1PASEK2ETHtja9ZrXBG7
	LEUhS+XHbKP6mN5+VPKql00eWUSM8f2GT3d85RtnAx9Ka366cE70TZkSeFMXYgS9yeUVDK
X-Received: by 2002:a17:902:e5c6:b0:2c0:cb90:1e07 with SMTP id d9443c01a7336-2c163a12aedmr16797215ad.11.1780459124031;
        Tue, 02 Jun 2026 20:58:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e294sm8461085ad.6.2026.06.02.20.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:58:43 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: rockchip: i2s-tdm: Use guard() for spin locks
Date: Wed,  3 Jun 2026 10:57:40 +0700
Message-ID: <20260603035741.68893-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603035741.68893-1-phucduc.bui@gmail.com>
References: <20260603035741.68893-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_205845_077068_F5FF2CCB 
X-CRM114-Status: GOOD (  12.48  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/rockchip/rockchip_i2s_tdm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index fc52149ed6ae..3f3db28b8940 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -285,9 +285,8 @@ static void rockchip_snd_txrxctrl(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai, int on)
 {
 	struct rk_i2s_tdm_dev *i2s_tdm = to_info(dai);
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2s_tdm->lock, flags);
+	guard(spinlock_irqsave)(&i2s_tdm->lock);
 	if (on) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			rockchip_enable_tde(i2s_tdm->regmap);
@@ -313,7 +312,6 @@ static void rockchip_snd_txrxctrl(struct snd_pcm_substream *substream,
 						I2S_CLR_TXC | I2S_CLR_RXC);
 		}
 	}
-	spin_unlock_irqrestore(&i2s_tdm->lock, flags);
 }
 
 static void rockchip_snd_txctrl(struct rk_i2s_tdm_dev *i2s_tdm, int on)
@@ -587,12 +585,11 @@ static int rockchip_i2s_trcm_mode(struct snd_pcm_substream *substream,
 				  unsigned int fmt)
 {
 	struct rk_i2s_tdm_dev *i2s_tdm = to_info(dai);
-	unsigned long flags;
 
 	if (!i2s_tdm->clk_trcm)
 		return 0;
 
-	spin_lock_irqsave(&i2s_tdm->lock, flags);
+	guard(spinlock_irqsave)(&i2s_tdm->lock);
 	if (i2s_tdm->refcount)
 		rockchip_i2s_tdm_xfer_pause(substream, i2s_tdm);
 
@@ -614,7 +611,6 @@ static int rockchip_i2s_trcm_mode(struct snd_pcm_substream *substream,
 
 	if (i2s_tdm->refcount)
 		rockchip_i2s_tdm_xfer_resume(substream, i2s_tdm);
-	spin_unlock_irqrestore(&i2s_tdm->lock, flags);
 
 	return 0;
 }
-- 
2.43.0


