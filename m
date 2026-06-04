Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDB7CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 03:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqiGW/dz4YSeZ3jaBcWBt4ocDaFmKXFEK9JnLN8NHsw=; b=O1ZxSHOJn4S/SzGvDr+bOi31aC
	5317WJzyWAvijEboTHxSZfsdMgXX5sD9D5iyg57zXFV0H84QZcDN+3bVa3/wp1VZ9sf0FP+PwXaCL
	xANsL6gocKW+nXVyh9fSt9JLTrubSxxzpHwQnwuZJ6KsPJC6QNb8X4J7OvGq7BTbLeUR9i4P0UMkc
	Xb4y4g7VYn0bY0q4zfwTo3Bj8nq6V+QSUoPruMsk+C2Lmynd5PzyIQoy2igQhVaje9KSRuVbXoQW0
	3TLF+yURMaZAQwgJCVHIbJmQQK1qIJLRcbwbvKORsVC5H/zvVqV4mHNvAWAlrUolvIjoKStGY87dC
	MqkWF3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUysX-0000000G72b-01lc;
	Thu, 04 Jun 2026 03:36:21 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUysT-0000000G70A-2MBL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 03:36:19 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8423f626a65so87324b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 20:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780544177; x=1781148977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqiGW/dz4YSeZ3jaBcWBt4ocDaFmKXFEK9JnLN8NHsw=;
        b=fvMOCxprIGQ0wDZXjvS2h8Imc7cNziD3ELmP6WN7i1ewQqNzD7knUUYlZTAbrn8ywg
         BqvgXNukS+U/VZvAhTWwyyzDxCS7MpBtVMavxNUvSwwRu+h9/isaPreG/fWtJgnAtDIj
         lyZVEIQJ1q0yajpo36dFKPSFeIyI1fdulAQ9O9ioF6Aari5jXtEVkYOmy+TNOXUVw7hu
         J4IL8F2Bt4IzJhMYz9qcEeLdmjKvE8OYbL3P9h7wGDsLcvX4Ke0vPoTetc/unVz0LWqu
         4GcwRdBdHsFozEUH1Mx3bx0JOpzp3+GzAx1z0g5kLuyOfo/3SJgrGEAQxnUzqiaXTVU2
         x7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780544177; x=1781148977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QqiGW/dz4YSeZ3jaBcWBt4ocDaFmKXFEK9JnLN8NHsw=;
        b=aAHAAjCzpJ0YiRXTztN5PxY/g3VqU7qcukHukW7fbipvroxiWkESn6umZlxB6XLOWl
         2KfOobHo8mja8r9nky0raSKGLrxPfFzncERKvDb2NpJkNmaoA11+7g0gItQ+HzJkCuLD
         N+TD52+KCBiRSJf05QRP+pvegkxQCUJvQxA/NOMK5dEJdGhGzHssOFUdZ70vJsvou+mi
         A3HAqSFYyfUVe+VnmcpsxbT24JQZ0LPa3dcxm0lz0LyvGT3w1KF2B+Xbcwxds71KF+wX
         XBGKY5P+ex672R3CfbcqvTc3/uPxh5mjXtv0sgngnSHIukWbwMmWD5XLw09+LHnnWxcQ
         htmg==
X-Forwarded-Encrypted: i=1; AFNElJ9rLzmWqj8C9kwAQPbDEctZ9o5SsVTlTu8Zxgmalflz393rvepH/DlXQpGhgdwBA5G1AUMNeySInImJfPlLa+dS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp+gNIKoA1hHpeQtekcmFKUn7XCed/HP34hLmJuvA5yndFZkXH
	ixLBVJ2BssKfoGUaEbN6KoONlk4JVe2zQpK9AfJUBNYqDP4KTPGxXUCk
X-Gm-Gg: Acq92OEg2v4R5xwuQru2pB+eCoDaUIEhgj6yX0qHYSp6ZpHnXRHbr5+4BV+0WUDtPpN
	0SMkQIzgPCHrBva5ak1/U9WRUh1bgS8UnfTaTi0dK+DUY/r/eKo1tjydLN2MTyI+Dl8/mcGY/Xk
	+2VeIZK5QaLBYg741/KeR4CDGdVot8BxB6jef+f1bt0Q3dc45mzECOm0UClRZuMvlggbegilZR4
	tuqL+om6JfXnC0RSkrH/eofst4ONcJv/+S/oXI8rtnjCssdSWV2SObaQHw9Vdzskfmc4HssLwBd
	5JFHJcobz/CcoIL/70k3WkoM4ohsKpdpfCC6hhgzaAab1YM8XqC67tFE2yASWds14j9kl+EtDs/
	R5QPHdf9RXYO37sd7JiRiTktri3oG0to7SNqAytn8/RmKkE1xvydtN2sYwBNJj/Wh+tdHBeE/zF
	6VpcGzQvmSq6mJH1gOO0HyR7UFgpS5Hlv347JNxLWEklXLqb01n9ixE3W4hwxW6UatSfjOugJMF
	MTWzMg=
X-Received: by 2002:a05:6a00:1302:b0:837:80a:5abe with SMTP id d2e1a72fcca58-84284fd0951mr6418129b3a.37.1780544176738;
        Wed, 03 Jun 2026 20:36:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm5539745b3a.11.2026.06.03.20.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:36:16 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ASoC: rockchip: i2s-tdm: Use guard() for spin locks
Date: Thu,  4 Jun 2026 10:35:52 +0700
Message-ID: <20260604033554.96996-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604033554.96996-1-phucduc.bui@gmail.com>
References: <20260604033554.96996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_203617_603006_22E664A2 
X-CRM114-Status: GOOD (  12.23  )
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


