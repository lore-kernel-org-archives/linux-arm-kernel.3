Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7BCCC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=; b=W2HO4f2Cnnw/RfNtFBiSyUAnhZ
	HQc757k5ZQ3cRzIQr0hkHNkfwWwS2H/WtEoHxhzrHtGoLhedk9QC5mMW7nokIFRSeP1C14XVlYrST
	VZvTYfn/XyW5pxGWhCe2uwGV3Y4CQcDCllD1sOWuYcVt4lMjDsVT0F5niM0V0/3hDfv4E2TUy2uho
	t6sq4+hVKeeUcvFkXJS72GqMcK1e+12XAygC4vHLQxmdLbxNCJEt69GyBMsKe4AfCIQU/5Kgs5owS
	pITy2PrcXzmEfCqolCeXKHbGo/xBrSc7qfZl0d7IwGxS76VrAlzl+eqqEjLWpGJ0UgN0HSfcwQcLm
	4j6IPMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAN-0000000FK0u-3z0m;
	Wed, 14 Oct 2026 11:29:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAL-0000000FJyh-3rx5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=; b=mHEOrDdiMLBE8/5N54oEFOEDsC
	eRyTy7mo3Ii1Y0mk4Tb2FSTjGFj2EDP+oidRVdjaqCvXJzwUBQZICj/7/rA46Xq2jEi6Y1mZmexOy
	VArCmG3o8pzS7iH52DvT9P+ih9JBxlHcaHE5oRe/RCHlb5SeQpkosC2D0/o/K6K4p2ruU36/F/vLD
	0rEfPCILwSN95rCmr/HvJAkQwOc545Jp+UajXMJWAdLkJKtwaflwWTUnMkGOQP2OUZUjnC9e5X6p2
	Lqeg6aBfRBYspqk8akqunxOqBTOveM5INQ3AlPgDg6Be7C9fBMWCr1qXh4RNNJIISmeGzbBG0y/BB
	eMmESTNA==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAG-0000000Gge4-3VLl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:00 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso415086a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977335; x=1792582135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=edaFMFD8cudq8iNs5d+sbfhNO97ESR7AC8779y5xSj+bJYxkZiJsYvvXRg6qlNh5eU
         BTUuVCn0ckmRq9U+njie6CGvRNjNPnCfpdkAJ760Yz3EYLtfEOLryrvMKWytI5njVzyw
         /9wsus/WuWbl134Tkjr+rL5z20mHXbC7DMpmnBi+cijksRjH8U11TwD3P7UY1bpUNbSl
         JBHu2ON5Y+Zd4Jr7J2HD/42rNEyb1lpjK5eOf4IOt34fYkxmURBH2LbU9J2gSjbHMXif
         8LdwI62qL5ikEC1X9pZBafrh5Ck7XdQa/xlg1izcrUEQ7OsyJ23Qt1dR+Gz5ldPgrqwf
         Um3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977335; x=1792582135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=QLebEmF7yPPokO4T4ehc/PCaQHA7d2c5oOWkv+zkAZdbZSq/x35U0XGhNZ+G6JzkCz
         PAYFk9c8qmf+qKTVCkk1bULiKI+S/4yaKZ/wDrCPYbJbRUXGU7b1lY77ZvdlRpCjCdl4
         LhkiWbbJXl+SVXDhi3CuKAkYfBdTGiUTbc33iTwCj+t3cKEsTWWn2oOWqnrK0MHKmXmp
         M+9N8a1M/HyQPtSsfiz3jeBrlYnntpv2O9ZF1eeIZl1hO/oOtA3Esbt/gRN+ZYD+WF+M
         xhCYnRzNOlqtqvWUsZvdepGTSJKJ0hd+jicHD+9FynGljBvCtg/5XWHrb1HxTEFzkOlm
         YI3A==
X-Forwarded-Encrypted: i=1; AKwUvByDpO239zLO/2py5NcerhHHzIY2J6DLpZcIXXyO5MkqiEdJwomPthVnxZSf1KO4QBrxEecExYY/actidAtk3lSM@lists.infradead.org
X-Gm-Message-State: AFq9FYLSjhTmMqCF7lBT8JqCNPKHQPEINiVjMI2AlKJ6gs0PeTEWuYV+
	AYZkc/mRpaCnYvwPGJox9dJrjQpFRP+venDHi5iyM8XEJSaG2T60JZQd
X-Gm-Gg: AYBFou0ZMWjxZX9fPaBiOMyjEFK0WsYWbg903lFETGmBng1lJYqdCjCVM2D6D9g4iZx
	lzSXAHFBVZViNaYKx3FtifRuhpA0MfW7qDpOM9WzwEcFArOYv0DIrOYep9ngbtCsPkK/Cv8cuJo
	qTHIXXHFGyo1/97X2TC5Qq+/a9E+ZjDnBhQFGgkW5cmbFVKba76xP81eO/hhdM9MXc+4K194QzN
	+KgLlNslqZiNqcAw70dnfPFvX3PaPiRxcbwEEl+OaRdINFqmlqW3vI0NxR/LarBXxkkPR1kCS9w
	dmUM3jBxAsj+Mo8SnVIhJ3k5Vb1ilMa5BMBpZ9Zd6ZY4RUAazj9bJxmsd90zsnDQ8UHimQbf5ZK
	L0iOc6H3Lv9cAU2LVOK+vc2xlm+TyapRkJJ4sE11NQAUwo+5CK9tgi5jQDrE5xJwh/BiFqf+FZA
	DoCT7ZRSz8JEcC306M07w1xFGDVQ0B8VvReg+BgydZUL6hZovrVoiscxPftSyS+BMAmPhS0O6cH
	ngLRoy9pdOrghc8I/Wjl1rqVSVVPZhOLrZltsDYZmXWA3os5qns6/mo7j58UZeX4FDKXRJ6LZJ7
	xtvN2QsZMgdQvgNW01AY1xGn
X-Received: by 2002:a17:90b:4ace:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ab3a97a06bmr15236496a91.57.1791977334611;
        Wed, 14 Oct 2026 04:28:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:54 -0700 (PDT)
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
Subject: [PATCH v3 07/16] ASoC: mediatek: mt8195: Fix FE startup error handling
Date: Wed, 14 Oct 2026 18:27:42 +0700
Message-ID: <20261014112752.683032-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122856_935152_0C9CB7B9 
X-CRM114-Status: GOOD (  15.57  )
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

Check and propagate errors from paired memif clock preparation and
PCM hardware constraints during FE startup.

Unprepare the paired memif clocks and shut down the FE when a later
startup step fails to avoid leaving resources enabled on error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 44 ++++++++++++++--------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1d3e01e2c3e7..02736949ae6a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -364,24 +364,38 @@ static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret = 0;
 
-	mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	ret = mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	if (ret)
+		return ret;
 
 	ret = mtk_afe_fe_startup(substream, dai);
-
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				   MT8195_MEMIF_BUFFER_BYTES_ALIGN);
-
-	if (id != MT8195_AFE_MEMIF_DL7)
-		goto out;
-
-	ret = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					   1,
-					   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
 	if (ret < 0)
-		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
-out:
+		goto err_clk_unprepare;
+
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	if (ret)
+		goto err_fe_shutdow;
+
+	if (id == MT8195_AFE_MEMIF_DL7) {
+		ret = snd_pcm_hw_constraint_minmax(runtime,
+						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+						   1,
+						   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
+		if (ret < 0) {
+			dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+			goto err_fe_shutdow;
+		}
+	}
+
+	return 0;
+
+err_fe_shutdow:
+	mtk_afe_fe_shutdown(substream, dai);
+err_clk_unprepare:
+	mt8195_afe_paired_memif_clk_prepare(substream, dai, 0);
+
 	return ret;
 }
 
-- 
2.43.0


