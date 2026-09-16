Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABC4C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=; b=dsFwKLg6lOjMww2pAVO1lAFXMS
	c266ImvS8pj2sfGMonOI+AqkQJZrkdeLn98hFZFT+ZoEGkPBJr/cVD9NCIaOTTztWmRLWA74Jamkz
	OU1+JGAfWWc5bHXkNZ6mF2xTbieMJuJD1KgtNRiMQQvgdAhRjMEuETHEA88x3AVcTl4YHTVoT4PTO
	mzgloTHOw4iFztdSdCrhJaaEVXJu0B+S+l02lNKIfQtAgCu/H14n435Y1E07w7jI+VidyJB/SD/uQ
	PmFPY8HRNE2RYBOOuB47JC+dyPSqbaMpELwyHw3wrZpizjHRVHVOFS5C9C/4Tu6lKObbLnoPa9Ug6
	dai3d/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlV-00000008LEH-36HB;
	Wed, 16 Sep 2026 05:01:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlO-00000008LBp-1GoQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=; b=l4YLLUn0bXHFQtzhFvu7KP951B
	wyV52Mhm7ikkm440Hbg9To5b3Ptpem4qdLCAf0qnthqXcIrKVYqfbaSifRliEmtY639E0YRh3rnNz
	BvVVFnFbJHVWF7xyM/OB1MzGLxdr4rt3qUw4Ou9ClffAtV9VZoI5uqgUcse7GY3525PyZjVTCOZUI
	j/Bm54lMbM0iotUbcu/ecHtvf4b9Hkdcm2qyD3eaaBNYPw/eAuK120tN1RpOBFl31rjyyFdvqQDJS
	X78jm8oSFY4vVyRHdPEXJRb6IuF8EcQxcKhfXX57iFf1/sezv3ElSGGj18b9iOfX+tOX2QgctmA+e
	u5T5u+7Q==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hlK-00000007UHz-2cpz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:00:53 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469e25400so373761b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534848; x=1790139648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=;
        b=eJeLO3yRMuGmLyCtQsN4VVdMcZWs3rupbkAk2zKtqO6AEUsjAiT6P/m9HNYY2fvhUz
         ID7eahrA9XkQs0viKt3lDwNLShUdiNxLm8YMsZDc5/Ov8gF//iZ9jeNGoOt+5Kw+bRQp
         OhMVjHNqFaTy2XckyiaCbs0N7V5qYpcx32Nf0aQ4a6SeyLHftSLkNT/xcRbjOmHLN8hd
         6RKA5TBk/3aytU186HrL1I7wDkVnyyXhS1V83k5C6imtfgNavRYBpL1mYokJpPxha2ag
         IFJr+t31URUJkFZxtfFGDbIWLqB184l3waotXlVyE0sJ0PqYSFnrCVKbfYIA4tCvSi2t
         rEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534848; x=1790139648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=;
        b=GAYgLp2Ugue5cSyTLPi7ZynQP4L6WNILFYq6Hd39T3DdDzM1mbXCdjmUk7n0NhU4/5
         aM4DzSw8rIihEu2GMeP9JtfJaqmQeiq5b4jTGtNLcSdZvtZh+Hl6C5kKW5l5NLDSC1cz
         dhb5rauT89aWWy7XaWgMG3CKfsDWwNH/CMei963BA6pIJ/X+11/t2tBin3676CCfxTCX
         Kolk7D1MIrFUfmMG14/j2kWcMzYVcI+CCX6hnsBolY3zLjYwVAEkK/+iRmF8GnKNwl/v
         MguK4TUrohe2WU86fw4mAsXxRw7bVNVzK6802GU4T36+blkmM8PpndU7OMo9oQWI5T/Z
         RQfA==
X-Forwarded-Encrypted: i=1; AKwUvByErszR7eDBHPgyADTEJvNas4zrG7J4+2Mbax3kbG4er834rtoAiMSSsqDaBoPgM/Kc4n+e42E38GravuDWX/HK@lists.infradead.org
X-Gm-Message-State: AFuF++lYcumh5L4quGfAWO+wzLFqhSf+40a1+CSmrWGmCBOXXyygpkiM
	UNpmS1ec/zvmfYeLX+krutGT1xaCfdEFpU4zpwLOuZO6JdTk4Kfg2fh4
X-Gm-Gg: AYBFou1iFYmVf1SFoNdKdPaINoF8/z8x0YC3UZxfk90H0wQ+6QGc7QNQl5/wRRyttRe
	yn1IMD69sL5ZFmGa0SWcil1qzZ2lrSjxcErEYTl3HmyjeFEV+38FOXfRdT/+QDY1LPC41g1PGjf
	g9FDPFqMDtPmW92oRweiB4QA8IBWO/9Yj37c62RpAi6FpSjtS+KsJEWU97jJVZm06ga+Gxpl9lv
	9epe4GybewK+vuk+5ZTabp+LTBQKb40g39J2DVAKxtbBndOnBZosTiwCeab/P1yE5Y+QNljy4wU
	5djEH1x8/R3AwEmf9Jg/5d3tVVLbJUttqLgksJ9wN1MkYEqS6Y+UtUCF5wJqpLH81l4aJ+tdqcG
	OJm1DRVK10oQWLDQJASb6ikdV/OYbhkedXd6F5yXyxp29jTtB9t5aV8V364Vt96MxrfBcywrUrj
	A7uQG+5B9QA/ty1WMpqyDCT8q8rE/KWHvMp4wHDes5HqJkcuRE3GBCbSf9SpGYwEZY0kR+d4HOA
	9zLvBTCAAiyLX5ZyER/h/cpwTtdDnfBd2xbrznyDnphT/yKnzozUmbSP5WZXuaQPbgHHYW/UiE5
	wnNi6MaWRTu8ReE=
X-Received: by 2002:a05:6a00:4185:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-87236ce44a9mr2291018b3a.9.1789534848308;
        Tue, 15 Sep 2026 22:00:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 02/12] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Wed, 16 Sep 2026 12:00:09 +0700
Message-ID: <20260916050020.14575-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060051_213356_7299D3FF 
X-CRM114-Status: GOOD (  12.60  )
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

mt8189_mck_enable() currently returns without restoring the clock
state when setting the clock parent, enabling the divider, or setting
the divider rate fails.

Propagate the error and disable clocks enabled by the function.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index f088ccf80448..56362c4756c9 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_disable_m_sel_clk;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_disable_m_sel_clk;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_disable_div_clk;
 
 	return 0;
+
+err_disable_div_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_disable_m_sel_clk:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


