Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A5CC98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=; b=lkZDGzwtyU3GeBZ1dPkL8OWpq3
	O0nIWx7kIz89KkdXfhXJ9VVrsZKQa8k9ua6DICRIM3BygpavHMw3cMEmxvHTlqg61yi6LZ6mA9O8/
	azGK8Z6gvPmD9gFgN4Kc8H3786416/mjm881tUhDDJvANqPQqstMXSzqhtHVINq/A3ff5iYh8c2JU
	A+iNDNTrUPJib/PQvirMOkLPecCmTkQ+yAa/HCzrwPMvCg5Al3tSKCqXjnPm3RPgHq4/ixN2hBwXZ
	6Vg5oyaPN4P1mnN2MR9CQiMJdT1XksZ0McBGQihevDRybcrnr9aZ3PtaR315v3zTya+znqwr4h49M
	5rJMvYcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xt0-0000000CdPF-3m17;
	Fri, 25 Sep 2026 04:50:14 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xst-0000000CdKP-3m9D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:09 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so253663a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311807; x=1790916607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=Ef21Tgbsi/T4sSIegWiCYQ/xH9Ug8HmqqRKSDnqrDwl7ltW0W5rQp8Wx+YqBHBueNp
         MK8i2CWDI6Uy4c8/DKYypXLDD0xzGBTUvmLcGgd19eyX9Uc5/wLMCOLeTEhdRY5D9e+T
         Im+ajjo82l+ma/Bytzoo578I3HEvcdEhURzNL8aF2qsN4a1Bdtgmz+MpFu1i4zVjbJMM
         Pb+VmQQkpL4tM1YReeWtj3LL+Of3P/WKxYaKxJP1r7Bl95goiW/KcbAfRJ+0b6zqukzm
         NhrZOKGJhPCUICdGaF6qh0gcprbL0BZNPPnWAnoelCLFHR2dE5RXtqBq9SqdRbeGiPr9
         wOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311807; x=1790916607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=2kmGRcoTNsoEBxu+O0zIoOB/Ch5yxy82qN0+8fDXVAmycv0rBsCg1AfjfMSvAwz+5A
         tO5FRl+i6PAk9Gqfd2ICNcbOmnSoow9pZfObX2MwRk6TnQydOCKmqBWJRbUNB5sFJjyU
         nW7AHxvJg1vYLGTbeVZnP6uxly7ml89nWUFsRs2VcQlJ70BnmyAYRayJGZsd8Px9uu/Z
         UT94bk1GBMqk/47wKpYhQqZged8p9tSfECdfx/tJeKg3gTPSTLga/J2rKcCWquyzB3//
         33EAMUQ0WUZVn519/YDVv2ee14aKMYMDwFxrST4RisUuvkNQ9kIjdF0BVUxyk19p+evU
         B4SQ==
X-Forwarded-Encrypted: i=1; AKwUvByW0KaiWnvwrTvrMRs0pdT5S8IgmXVRYK/h+ROpZpb+g8Ha3TF3tWocr8zzLYiuJj+SaBlqx2Xii7yCVWS9mLUF@lists.infradead.org
X-Gm-Message-State: AFuF++naNLOuhq+5RosTlyiq+B/sMl5nwLWvEAjfCMYb/qfAjiAhsGLH
	5c6H0dPzrRxtlTOFD2PxNMB4mfiZPyA3M/XbG4OC9tfyTllnC0dbgUMM
X-Gm-Gg: AYBFou0NCry/W5Ie7h9AUKDiR42HdjVgWVDevUXx3Qe2RFeJozgQPuAGGS92ZTFlyM/
	GzGY8yrtvwOZeQpEqm2AMUxsuciuuQeduez9u53lluwtDILkns0KpaPZNKN/F6lpVth4zDMsJzh
	8SE31Cs3QiVUQvVvZS/OR3JO0GjTIoP52HS7P5eNZjISyV93G1PnOojOyR7ZbCWKMY0c/dthA8u
	u6RCdklwPhkcL+tCw0+oE2KVURyDgr0RBf33SU5CCC7bLHwXqmEVUZ6JdHS++9Ra9Rk1QjZ2z9L
	ppSLU8juJl9x7/MPgJGL+OPjhsBfYG2G9PWk+H0sb+UO0EbPxAqq7rDsjfvWS+Zb3tQAnGg0M9M
	4tb4ezwW6Oa9peWa5GfeEpvwfPjbluo1n+A1zEmb+rF8lSsB9sYyaRNDgcsVWZf1Qe7ZKTVIzTl
	I39WOlMZGy82NS+qTDVh7Fu2Ypxdc1Wo3gG2uOTILnzRQa6TrvpMo2wYEf5QKMEtATrBRpmqYc3
	00bb7C+bN0mS/S0gQv1U02//zS8azXOWUBcKveajxmblfTxBgdJc3v0eWWHZgzpDG90H1DWnq6N
	IQqjbxIXGjX8JA==
X-Received: by 2002:a17:90b:1b06:b0:3a0:8133:69a0 with SMTP id 98e67ed59e1d1-3a098b93cb8mr4058209a91.14.1790311807298;
        Thu, 24 Sep 2026 21:50:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:07 -0700 (PDT)
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
Subject: [PATCH 03/14] ASoC: mediatek: mt8195: Fix register access clock error handling
Date: Fri, 25 Sep 2026 11:48:57 +0700
Message-ID: <20260925044908.450775-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215007_994982_130B8354 
X-CRM114-Status: GOOD (  15.45  )
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

Check the return value of mt8195_afe_enable_clk() when enabling the
register access clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 12d8159338be..34c828fdea29 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
@@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


