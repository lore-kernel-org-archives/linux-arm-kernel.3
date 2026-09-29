Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E36C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=; b=D9W2jTKLQIPIt5t0ITljT8buiK
	O9o3G97DCu7c0KTQYWM3MIPQTQfp1SEbARVgtltWKqUf3/EtppXhFUyWiYLsoyxjOjjK/+bLegKUs
	JnLqjj4in2trr+vT7tfts8ICFShXanGgxMZpPFFzts7WtgMGDXDl3pFRLJe6Nupji5Gu80aejQkdA
	E7ZjxabG5Cmmc3pv1MH0toKquxp336Tvla9AQg+BinRRzmybPPtIAcBJupErHFy7xWN8kREHHP7+q
	qJEQeJeuv5rHRUqNaVLZ3CEhI+Zbn1XwSxubJCAD/+KkUdQBgECPzGcUMHLDVM+TrYV1Xc9Vl+1VB
	SHJ0cVPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4p-00000002PxF-0IT5;
	Tue, 29 Sep 2026 06:12:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4f-00000002Pp9-1kDA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=; b=n5pGlHh1m8xq3X8dPgBB3/zshA
	iCKPTq5zoZzUcKpCAPzqPGNEEYv8Z++LJ5wuONQiFOsSckNIxC0a5fwXgQSt3I0jkh04fAu8gxun0
	FiCZVp/rZSQwa0kPc+84PEUyXwUWW/D7Z9KooWXHq+oDVAhi9FV1QVkqj4q2vEM75E0exkeyH8eQz
	sIIF+rqlyr6ClQ7/PvTgeoRt38lwo5L9GmyHwWS1i8DyZN2Oq3OeYLddRucX0Z2nB5DLM/ijrRySB
	qgcM9kkd0tGoZoW3chO9NbM2zMoK4cWswJSmbtegHxMdTRs4nLCdYMr0Ir9udrgpRZkj85uOMl0jS
	8JregTJg==;
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4b-00000002EXD-33CH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:20 +0000
Received: by mail-pj2-x0c.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so2127440a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662335; x=1791267135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=;
        b=rutwRuZiYjniS5PJUaMBzyuK5xKbzm5MFR32f3lnQhmOusO4qqqe/IhRa/RqSFBbH6
         qXDu1DLYmv3FxLJo/uU4N6aw6CLF1uWbH0D6w5aAf9LQfmecJHh+3VhNKihJ3YXRzwBY
         Wq7PhPocUGmUqQSVvfJnRwB9mbAJ8jluAW614i16PtyvTM4og7sp9Ly8axxKeEkXEVnP
         fvxnalV+im/xDLCPgV6YisaaO81aDUb9D247wcs2LuaJ5TABNije8UfxR7QBm1PCezIb
         qEQ992zmhOf5CB06s01s0Lr4oYELAN+lP7rD/GjaGEJBqvjNQ4dyaqrqh4GUOhJvoUFj
         WV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662335; x=1791267135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=;
        b=qMOf6R8GhWxX6AcToGS/mn/XiW9Mw+3PcsQgPcQjHJRQzhKDo1htL8/+SCWQznb4S9
         zrTWVoRNZqO83zYokrQW8xvvPbVmM7cC95qzYiofi6DKktEfzmlr27E6HCTV8C/8KQKA
         ul1DHTN3uPvM6c7/7Kx9IfBOx3LvY5DXePaCZkMKmIbwPF3AIVJX+0d6f2I76Y96RZ53
         X5+/azgHa7HqUkhNgEp+dStxZTJ5eyiltUjBGrx7pXr1m10ZjzWCUcruuC/c3fyFmdWQ
         GQusFo4jjpq3ty4+0ere3Cg7lMmxpwdjToZA+peKeO2k7SRnVpXZ9cPH7vnt1Gga+bSm
         Zb8w==
X-Forwarded-Encrypted: i=1; AKwUvBwBtx6PXq0MFyos8krpA6Gq5TJfRL7MoNG5ONMWZs89IqJvKInL8x8Py70Pkz8JlkH8qObFUqgeOYHlaWpNUQa5@lists.infradead.org
X-Gm-Message-State: AFq9FYJRJ31F6Somc4v3toBM5T7GZK3aN2FxFzt/rYHIrtdJnImAZUX4
	n8YKcseYYig6zY9sYfMCf8/MAq/Vj0BfXwQ4VI3NTkp4zypb72C6d+vw
X-Gm-Gg: AYBFou208MM6vMQHwoRnJ2hOKxYKDgpVod/2NugQTBoIAH6+SCez9NMsdYJAB6GeP8d
	yakMVAAGTzfQsBau45SS4s0jeR0LtaABnQL01OVUHhpxpxrUpzlZaRomNcShdbPUFnWwalz3Ynk
	kMUUhYAKRuBnJ3nfDkCmYh8mmjuHRKst745ymUCOkNsHbcfMuynpeHUE5pO9WhKS5bHmFosHXG7
	FFSrFtJvbemThCS5x9+GfgbaMAvpbF7YRYiFMY8rTtk3rzjqR4xHaoJ+T5AQtIoKfKhvF/1sg37
	Dn0SAQfYRc36BWoFjWSgOBCcOO2vMf8rg7Wtq3XxrICfGdIGOu+1nnk/Y+XN3ODIix9eHpEbJ9w
	huv2B+qDWrk1ab+yvb3C/E+t4j8+8/gzx/56tlcWHikunfx+qx96QxGB0Vd2L7B1o8wLrcR4RJW
	mQazFBgMVpL6nRgvRY3utmFs1akARL4tciIKgmg3eVuNnkXyxBUefnQXXtblmLsFZt+3gb23OWz
	pITz9rnBVsbZCOwxw6NTlyj5EnwWoyBkcfNNvUZH0s5HL0+XfeMBB1WtQ6DRZKg7el+beFbaH/I
	v44BVIDgMczHrw==
X-Received: by 2002:a17:90b:4e86:b0:39e:4c7f:7306 with SMTP id 98e67ed59e1d1-3a098b8addcmr11959877a91.29.1790662335533;
        Mon, 28 Sep 2026 23:12:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/10] ASoC: mediatek: mt8196: fix register access clock error handling
Date: Tue, 29 Sep 2026 13:11:15 +0700
Message-ID: <20260929061121.124001-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071218_597465_74C4128D 
X-CRM114-Status: GOOD (  14.33  )
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

Propagate errors from clock operations and disable previously enabled
clocks when a later operation fails.

This ensures that the register access clocks are properly cleaned up on
the error path.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 25 +++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 1d107b85d03c..6198711e01b5 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -546,26 +546,41 @@ int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 	int ret;
 
 	/* bus clock for AFE external access, like DRAM */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	if (ret)
+		return ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	if (ret)
+		goto err_disable_adsp_sel;
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS],
 				      MT8196_AFE_26M);
 	if (ret)
-		return ret;
+		goto err_disable_audiointbus;
 
 	/* enable audio h clock */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_disable_audiointbus;
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 				      MT8196_AFE_26M);
 	if (ret)
-		return ret;
+		goto err_disable_audio_h;
 
 	/* AFE hw clock */
 	/* IPM2.0: USE HOPPING & 26M */
 	/* set in the regmap_register_patch */
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_disable_audiointbus:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+err_disable_adsp_sel:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+
+	return ret;
 }
 
 int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


