Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6373EC98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=; b=oT123fuFsivIFol2+38q33aPvc
	5Uc4CFz3suUc3PEaCcY7xQMFPBwBuCk2jeCDXIwihoe3a7Dg/9l1ExKIBgNI9h5HHTYeg4srTGZEt
	hR0CDZ1ZI5fAYebMCqjAPF2Murnw82fnjGbForoWhz1Q8zdAaaiEJAgvjppnkjz7M2vd/mn+6LYKY
	6+ge4lY4hZxS5aGQs8JJxrjgQmFd+vtBT2FsRptk2959xFlWTXeyJy7Fc0SdvgzoAC2Hr/sF59kS6
	3ZfHJOM+iMrHWK2TFT/zmdj7W0GAapBQcuFxZVItPVCWU+4/exDTvU3CXFTe8AVvr/XazF3eUB7Kx
	jdTBTHzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtI-0000000Cdcd-1teW;
	Fri, 25 Sep 2026 04:50:32 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xt3-0000000CdR4-0MZ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:18 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f0b25dso2748945ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311816; x=1790916616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=SCdzMrA3hc/gwnChcBtxBenihf2HRpDJ1Vv3pnwiPcTq9EnaDVwnvrLwWer8Amivhl
         BeQnKB7DfdVEXPukMucOq5Dg1e3RorCHRmkKO8qqtwUH4VpqezU6p8kcH4gSmEY1vm5b
         jyBd9TPsm4bLGb9QQIyOBfhrqfgmPGa/UNhF5viD+63HSx2qAyWWWXmOFd/sEqxbFiGL
         KwlSuS7yGMJ9cupbNY3GD+CMxMVJZkCSlnpMCHcYs7QT/uU5bCxA3qQPMSvtaNfXZLPu
         cGY9a0IScwkHhbuIhJ3es1XONRv3RwpJ6q5kbN9TCm90ox8q5ioENnvoZc++Pr1sbNJZ
         bXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311816; x=1790916616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=Y1mWyToM2IWwzqMKmcxLSlSmgSx21ly8cpyzSg33K3W5Z/UFvShSLyP1lyAaTIdgE8
         LGWYOuHqnRUtk5xoIXlqo/o7IZrHC/vtnQM+1DSMjwxsRl7v7NRhA9oFnw1nYbU/DM0l
         /cA2PfpSPGyCO9jYc+MBniSzvf9psCkDmYvNmCh2hHBByu/w3wyM2vhNalTqu0TaYa8l
         DJmnlB2+bfJ6cCuV3GcOd6N2h9ONXng6XnKYXziJsEe4fcYQmfbxk7XKDqKz1AQw8Ykp
         rplxIcIYpBuvZhMdwjEsbF3eAgIxo7JQunj2JTjopUcT/a3eFddHaFckW9dqXupG9FTB
         spdw==
X-Forwarded-Encrypted: i=1; AKwUvBzOahrgOw/OWgiXKr9U7Yqcz1xjWibjY3RQ+0gyWKeJFazFnXsmpx1eCnkUhm/EPtSWaLtFo0cdF8a4t0Jx6Qxi@lists.infradead.org
X-Gm-Message-State: AFuF++mKpVQ8dK5JITaPbUUTBVIipF62ZWwtkL0wq1D1ckImrAOjV4oO
	/bH0i38rXhUu7vbof1hysKC/4IJcB0bdUFOE5Ez4NKQKH7CC7hNpg34o
X-Gm-Gg: AYBFou3Gi00xMu2a3jRLxTdXiWtvb5owFMBx1cn5u610aL0Hg6h6G2r8jT4Xaoqjq+o
	G9lkG/d9qHxVZIO0YefzYh1NytXuV7BKpion0SRs0/LmDCmKE/T3qePVhktDRGIoak1DK3rA37s
	sb/KN9MYXuXRyj61xkGvrRgx8O62/3Mxi2ssKhLpGHl10QP/fMr1513hy0eQ77RVdbTjzCcyWoj
	IRHqSkZYL44Fax4eskSckzEN7IFeN4da3HhCNRVVf5zMlMwP2nz1FXpCm8PEqYp1ykCgKXEb4EX
	TkTR+ZqFyOuLSkm02kYJN/9syp51JlqFj7f6kaSYkH4e5T6BdBthAdsh37GGdXrPYg4qFzLxMn4
	3VUTja6ZQHWgF6JNCXi6bqEoOrQvteMrMBsqipr2A/76+Tgqu3ioD4dz3t3negxJVOJZAsoFMxb
	YrC2iOemtn1A3x/gz6wIfy51S0v7OqSuDZW0dQHtcKtHo5iHOK3Q7/izGAnDsEVJHHS3WJziUeA
	M9ufyPHLV6Ka4UoUvtmwfRw3GLA8dS/+IwaRBYzTJe9K1ljl55c0pxqFHTRa5rvyUQg77ssWodB
	rx+TQmoZY36VyA==
X-Received: by 2002:a17:90b:164c:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3a098df465emr3862695a91.30.1790311816047;
        Thu, 24 Sep 2026 21:50:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/14] ASoC: mediatek: mt8195: Fix paired memif clock error handling
Date: Fri, 25 Sep 2026 11:48:59 +0700
Message-ID: <20260925044908.450775-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215017_125994_4492F34F 
X-CRM114-Status: GOOD (  13.29  )
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

Check and propagate errors when preparing and enabling the paired
DL8/DL10 memif clocks.

If enabling the second clock fails, undo the clock that was already
prepared or enabled to keep the clock state balanced.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 52c3381e6766..1d3e01e2c3e7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
 
 	if (enable) {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
 		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
@@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
@@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	if (enable) {
 		/* DL8_DL10_MEM */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		udelay(1);
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-- 
2.43.0


