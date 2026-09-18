Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C10C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yFohzMwFY5CpqXlk4lNOz4TrcxA63Dsw69mVQSK8Sk=; b=UUDLjb8x71GBXjnnisVeyoNxVS
	qla74EtHnhnqgfffCXsbzEg0S1v1nV1RATfoml22/LOIGFNwkCTsRm00gNJvADAYE1brO77EoxLa4
	l5vZe/z9p9Qguk+vb8HonLVr2zm+TOxRKKnbU2s8VYTzplno4NEY8NXRcZc3Wzxk/OY+wC8kuW7pm
	sp+9g+A/P+xC2kRStrqwAfrytqvNaACDlNu6S9/5Ff1H4HoAhvnqIBnKIMjMAFNKvBccQREPg1+g9
	2LqPBRB+btmz64WeZV96jzRNVsoKRYn4/RiadoCTtFoFeVxSei+3alpT2P6JhvUc/ULBOymuUCVMV
	gVo4iqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yow-0000000Eaal-1Nz6;
	Fri, 18 Sep 2026 13:40:06 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yos-0000000EaVN-14dq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:03 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccc02279so602944a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738801; x=1790343601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yFohzMwFY5CpqXlk4lNOz4TrcxA63Dsw69mVQSK8Sk=;
        b=HL4AEHk91KMyhWQJDz5BRIVhZJCFL9+wsJUNJYs+R1DKQv8PRfC/xBH2HwYGvc9cdL
         XXm4sZebtI2qD7mNA3UQINDhF/E8vl6pZjghUprcV4vShtCiROLEnINauowMspT5K6z3
         89jxEomQnPPIVuv5hwxBIVq4UUMaXyQ55AoTZdx0EOdigeSUwyFVGa3nMyKocopLBCX6
         G+rauXiCPO/8Med++J/gDMXEUyw7K9HgiOF+lL131lBZs8ObMYxgs3dgJl5Z0Z/af+yy
         frlkgbyxTX4StNdJ5xdUaDWmGNseXJQzc95cdJXpi2r1ODnBkkZI6VuoYvMsyTR9C31s
         GjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738801; x=1790343601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yFohzMwFY5CpqXlk4lNOz4TrcxA63Dsw69mVQSK8Sk=;
        b=y6CFcgfinsrBMWRYeI8YmSW8X9uqJ0pFQFEWQ2q1O5lmnlnfPVypjZ8mPIPqZEhAi+
         LlbUQvb/ARyDv0lI77b+sSCXp6YATc77x9sFrrr2/UVsoSBRemK9/KFDoGoBYLVhHJjv
         ARXfUqiZv2H2nxBPhTB3mqBwZe2MbJeiCX33x8qfP/OZ0RMn1bUVo7+YfSELSPVG7cK2
         qoxeleoBs5kvBCGkZNMr3k4gli7tnkaj2qs1L+Di9yuZTltTLzDWe0MGgq/IregpfEip
         H5BNaPCv4OmGhMGE83TTAQtC4kJko/1cyuzyBsSBDL1K/hMqFuOcMeAFm3G7/oAzYahA
         ceZw==
X-Forwarded-Encrypted: i=1; AKwUvByvBOIEW+X1JPU06c+EaMRVeB6iGHDsRjfsw74b0xgDbYkgM6676kU/VWH5ukX+cf7hEMbhHFCAi8TvcMlamz6I@lists.infradead.org
X-Gm-Message-State: AFuF++nI/0v+ekS5chymfnf0V/h5WaR91vBRlEuUxMd1+RETh5OoLr9c
	m/GHkxLQKfQfqVY04YDhHPA3QL+wd5Y7S/oeXaNzAfMBjise/93tOeUf
X-Gm-Gg: AYBFou0RIHptwjUyT4Ew/j2WAy60ys+OSr9pvK85RXfjOskeAfFfFROFrmWpBpCPfCh
	lGyIR+a76gaxnk298X+vBzWQzr6K1pTEEDWC+7hOPfzDFBXGGyOMIPy2YNyPaBQjIi679LK8jzj
	nSLvy6BtJgiBkIWtSKI0iSUUy43oEDzHkUG7v5v8IVWnn34hVOnRILPwAQDXoDd2HylTgGskL/x
	95mcIDu3o6llGjGPnwxt8GqD8uSEE+uXjoQ9rUbIg1N6QiUM9ygVEqj4Ql97cV9fzKUwfuRYkAj
	dvcOBztnbsZVEsEVjEfmmg2bWBOeX2jcG5QxHWrHOmNmSmo6lbYQvehXwFwffP8yzSfYh3rc1o4
	194TP1OPSZoHOcwS87u0ZtboOK6RvXfuxGIOwkXup0CldV2uej6/GJ/elrbVNtyjAfCk4OOt5ma
	3TMHqYbVTcCJ5HpGrDUu8B04HMWI9l/MCZCcs2z28wwev8o4HxE85L1KyPoFsdwaDDeXOEO0ILm
	4ZuTkDecwnluxw+SVMZgkeoFWz6T+2ScGpyIzaj6y3RxgAP1VYf9krP49bzndFCMQwcdQTOtYfF
	FMnEkc2IxFzfwA==
X-Received: by 2002:a17:90b:5545:b0:39d:e54c:8643 with SMTP id 98e67ed59e1d1-39e54d13929mr6237236a91.11.1789738801484;
        Fri, 18 Sep 2026 06:40:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/15] ASoC: mediatek: mt8192: fix MCK clock error handling
Date: Fri, 18 Sep 2026 20:39:00 +0700
Message-ID: <20260918133912.133799-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064002_319562_4F6C993E 
X-CRM114-Status: GOOD (  13.20  )
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

If an error occurs after enabling 'm_sel_id' or 'div_clk_id' in
mt8192_mck_enable(), the function returns directly without disabling
the previously enabled clocks, leading to a resource leak.

Fix this by jumping to proper cleanup labels to unwind enabled clocks on
failure paths.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 118dd4819682..77f596cab92d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -619,7 +619,7 @@ int mt8192_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto err_disable_m_sel;
 		}
 	}
 
@@ -628,17 +628,25 @@ int mt8192_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto err_disable_m_sel;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id],
 			rate, ret);
-		return ret;
+		goto err_disable_div_clk;
 	}
 
 	return 0;
+
+err_disable_div_clk:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+err_disable_m_sel:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 void mt8192_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


