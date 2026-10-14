Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724C0CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=; b=lf5g9x0DSEI6UAavUVgKUWIG8N
	BlkLvAKhasYKaNNvSsiTkf+QQxC6XYuJF5XmYmoi49jMlPqzxWTXtOKd/QLvhIk3y8M7D/Fv1vf7F
	8XRAAxDf21m5UC86Dk+N4ZRn4qp1l/wbZkmIu9O1UP48ZHvdeWybzFaufqo/r7Tfg9ICYhhCjlgYL
	E5R2HZrrltR8VzVWHnrygkBlxR6986aCsNBfMtNN56kpvVoTDfW07VKRvpZcDg5MS3GqKHQ26vaRo
	4Ba+Py4jd1yY/umMpQ2AZcV3j24YbApbuYW4VQvlwXCcakMjp0T4rilctkWkKV+7e53h7vQJmiNg8
	VCUk4Q5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAI-0000000FJvv-3AxJ;
	Wed, 14 Oct 2026 11:28:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAF-0000000FJsw-1weT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=; b=T+tlzLfWB0ouIHHj64MgrdklZ7
	NZkeLbH9IOyQ2to3r9lveUdAk05GoTZDLSKJH1Mqg5ZaJC/xzVQra1/bSTIBhu+qFxxTDHeDA/iKU
	gf/oFKRy2WzNyBk2XnGW/QGRqBUON+pNLgBDP4OJNSBCkr/U0bfNB1QUNCeSMZlHjY+Q4eMkNwo2S
	fhxXrgyCcviSOyxDWY3YQfOCI4Xdg8NRN25paha6taw5jyItPMz31KvCWo9nyLO613iHgXb6Nd1/q
	FVRyWuj2n+PHfYESIo1AXMPVWAzuW3Vxa+TiZsObVAN7UKrU3QmaGwHmgJtIhBLUDTvYMaB08V8Wu
	zLY2rHQg==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAB-0000000Ggd0-1FbD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:52 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso2114988a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977329; x=1792582129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=VY9tT7p6GOFAFVGTIKz0vgT7XS6BqhJb2Z1BUkZJSieh9HyoE/4TYEIKEQJKLeDcH7
         A3EkAKLr5UWwchNTgzyeYJtFriqfcXQ/IoFyKXm5uTj8iRHueBQh5RF9PZpU6ve/Mld2
         iUKGO5J6l9YWpRwRRDdcr1MJ0vsCoIqWOoyi1Rs6KKpcG2TOsoxJshJlrgd6GBHcy3NL
         9pJS3OkO9mQ5K8qHgGL9FI7Z5CiFkcRRF6VflNC8yvz9wwxd/UQmFCsa8JzgZQTHgJxb
         B7JpglR9oKV2iA0y4+wziy7ePDlH3vUtLbc0ah2blpVi+JT8C5gWu5v1QmoJM9VQ4E25
         gsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977329; x=1792582129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=qXDNtIq7OlrwCQXbz+fWk9CglVDFgpOG98LCJ0vmjYt3kfrCWZtlsdeO5EixYJwSCe
         2YtP0IM33UY/AndWpoLjI6/HASIIXu0azuv6T7CxzJmjOAMkHPwJ10Zr9PtDH2Qi1RhQ
         DGtNwu8TzjvofT3qdDWQe+a7ctUr7j524f5KxxYtSFR32On1Flwo/YwA3VjIBDSpVnDE
         D28eeUQChWUY/Bwws5miJuFMtEuXmm/Hohy2OXcJAq5QAVTRPmf7pQ845w3D/vFP+4jO
         dAsOkPOpQdjkwTScVltvP0pA5fk3ZILMAkGo0k5Vawk3cR+5tm/VH69iClyjicjEvPz8
         b86w==
X-Forwarded-Encrypted: i=1; AKwUvBz1p9tSyCFHWMTHvtmvLAk/7HbdGnFeGFJEPrlz1FQXkcRRo+pOG8sLpENV/cMByTRkVLuF1DnoyPI4s1HI27VS@lists.infradead.org
X-Gm-Message-State: AFq9FYJ89RPHEyKpGHCA3ONVTKl1xCXofR+s2fhmzLkEzGrSMRdJdOV4
	xg8EwNq+c+IzV2vRbbjmPjGhDTr7ONCwNCbio3YvT+7BTBkfSxaG5dNb
X-Gm-Gg: AYBFou28j3pvpAyB9azw1dbeLhR+VWlytbsscsORchm11y+lgSe7WSeIvHOfukyG5Cx
	m8XjxUiyXZ24z0iL8jrln8IDk3sPLXXz1iDI6gQk65VloQ8aXVCvudhoB0jkVI+OkyJMnDwTCYO
	MgW45j9QsG071uJcG/fKjgb/8eUj7LmqeZMtMorPQXhu4Dzh8B8C8wu6Gfyum9GWbsmmWeBI/bk
	G57n2RNg5JezW5jXXbL/eMs3EUNXG8D5wG+SXSl4k3g30iZfGD79R5Gs/O8uTxGjIOvDkxgrfg5
	Q7XgrXXrhxBoJGqEoiQh9tMcsmPKZGhucc6TGX/R9scNLuN+kksQuU4x46EOy3WBXF7ju1NOY6U
	PmuPsDkhOF3wxxCB9quReAOBgiPxuqGN6+JSXt2j5GTUpYfbNGRw0xcPElYNZfiXYzmSxVlWO9I
	8TNrDUTJ3WKS0DO919nRIRPf92MSqG2IR+60RuE77ZvzbyUm1GVNG5OOHLTRKAzL4qlyI7KsOID
	2mRFWwUMBPvrCoDTD5GxGf70KRVbZrmTqw1rLK30F5NxlAVlRArRuTqCY/sZQNSrjlzh4I+pzPH
	9R+Mhtrc0ly/wSWyUai05+ZL
X-Received: by 2002:a17:90b:534e:b0:3ac:7f4c:a690 with SMTP id 98e67ed59e1d1-3ac7f4cbb76mr561876a91.35.1791977329145;
        Wed, 14 Oct 2026 04:28:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 06/16] ASoC: mediatek: mt8195: Fix paired memif clock error handling
Date: Wed, 14 Oct 2026 18:27:41 +0700
Message-ID: <20261014112752.683032-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122851_458424_7B13615F 
X-CRM114-Status: GOOD (  14.19  )
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


