Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719C6C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwh/9qTX2B9aSYEX0nJr57XNF2YmYT2AWRYwuXSA6iw=; b=fLQwjKi54GSdPqOB4f+RJuQDam
	aYSkvvL8YHiBt0EMrV6RdKNkZiQKwzg4AsnZy35/qq0UwehJBRXrpa4hyPQZBzvgT8xIdHmevxinY
	ee7mnLKXgqgMbNbCqY/HsBLjwdqTX88HUrmm7iiGhrR0ZNyfo+AohnJIyt3X5GXoC2Q4Wb+k4lsG6
	he3lD32nDbrrqd6ubatgfSb8SX9nHqr88LoP2CW+YyfrAMtxWC76qOqIZLLZtqgSpeGRSc0G8M4yw
	F22dnoFR+5VvLjYrEJOJ6F1CC6PCsS5lq1bzd8JOdPfgzf6uA4igpByfCSz1wa6rCD4FFxKtRQ1lK
	q/r+onlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6185-00000002YTF-2FO0;
	Mon, 14 Sep 2026 07:29:29 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6180-00000002YNk-2Ltv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:26 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so1238809a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370964; x=1789975764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwh/9qTX2B9aSYEX0nJr57XNF2YmYT2AWRYwuXSA6iw=;
        b=AzadxXKe08ek30Usy7Fj7VWo43H2266ixSuwD65lXU2aHGsNzM+WpVJbXVEhJ9kqmP
         yX9oIS4ha5fAUWPWrXK9ZlZELrfgl4GYXk88XVNgvnp+G2ZMuXKob19rgNhT0dTw2dFQ
         d8/3/p1lDE1iMzWEzZgpEBFsCwNAYB1d+IOcKTq06o/yj1dvecWf9iOQoRumjARwIza7
         oP/AYypsOPFLdrhA8F+5CY1qcJ93EJVbO2brmx8s4175/6o8uXcLMPn+vn8bvN5sZo7l
         DTRDBxufmrPtH0qvHjEEzzlLrd6ASukPKUl1anlIHYH8NFNkOoxcpK9y1TPC+mNKHYzO
         u/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370964; x=1789975764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwh/9qTX2B9aSYEX0nJr57XNF2YmYT2AWRYwuXSA6iw=;
        b=gOQOaI39xwGaV3shmwjW4r5FRoSaKeant4uCf0qBniCSkMLvGfKX2ff9lOwZn5oOCN
         FOu6vzeLqe97sciRwDjsrqTwA/C+PqATKSd8m/hJbyCjiHxagDBJV15SnYIP+bgeC3E8
         /YKVzRONuKiH8knooqj+PEPeAN2cb4EEdgVUOIYLPjE5pL46q1X53bcBMWGFzGJhUJ8X
         4bQEof83CpSyBTN8s/Q9ZGcCVtMgKiQXC4D4xwSkhHKwLpGxLxGW+hSl9F1lIhD3WlOU
         IN2IxoDNTzbbtYbjsDMXmhDsg9bbk2JNu7U5ClPmQSpRJWZLgmx/c4g+6xgZy1lgQIXo
         TixQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBrqL689y2OzxLp5nN+vvACuOQCQgpK1lmZQDhAyxxqkvjRwtITYcyfJuM3AHsQKQTwsisz146kY7TB/ST+2EQ@lists.infradead.org
X-Gm-Message-State: AFuF++mhdJdJTBd9m6U7Qgwt7Tu9+MpGe1JoaosiUDRPdRuPGXWu3PHW
	LsQlbOCamV1cIVagDiqScD8PPfVRSuAUzXMa+Q2ZAdW5LLbmYnH3nXVu
X-Gm-Gg: AYBFou3BlV29r9pdfIWtH9H2A0uW+rLZg05toBzTt2xsUKZsXPIsS6axUoZj5uL1qed
	UlXonu/9wGCWAfCDGZRM+UCrLJxO0ABBPUJMP7MW49+AAT43hDmvbiEVH9D6gBgNJm6be3N3QXc
	8XHxqCWrKYTV5Uc6Y/AN54IoZ84RkLe0KTjPnGfBV9xO6GKHWrElKMWaUfdXrXIp6mvx++sl4z9
	1D0BWhNxpe3CRwKvFH2iJn0e3DV5Kmb7th/SYgsfpsMJBqtaKMCZScvWHmjaOLusG1eORfFQ3jR
	4acMXXTQWYBXvWEZhWtIpY/6cYYH8pqcFXC3kkWX8UX8SBXnPNleVfEJzdCBGqfXjrVk2ckGWQI
	Pq5dmMIENN61MzlfDjOxtx+K59xpBX6W2sDqC7A96B1Jw8CUXJ0dBOX/6a1td4j52aiZJ9q6Tuf
	XyVh6WqtAnpGG2VXX7G7xAfU2xRI+BAswrr1aBHd6ktgtzdvvRbx0b8fO7+sogluiA4nkC7Rh/N
	6RtG9isvNhz8/pPLef6coeo4x4jLMFy1jMswoa6OfCdKvD3O/zQN2Ef0xSbJ7nfKqM8gwqbc+iw
	hsKzUSuE8z2HNU0=
X-Received: by 2002:a17:90b:2789:b0:39d:f2a1:2a with SMTP id 98e67ed59e1d1-39df2a103d6mr728290a91.19.1789370963956;
        Mon, 14 Sep 2026 00:29:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:23 -0700 (PDT)
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
Subject: [PATCH v2 06/13] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Mon, 14 Sep 2026 14:28:35 +0700
Message-ID: <20260914072842.24420-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002925_386300_6386BB6D 
X-CRM114-Status: GOOD (  11.85  )
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 173ee0709b16..3e7465c5b277 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -793,10 +793,9 @@ int mt8189_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8189_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	ret = mt8189_afe_disable_apll(afe);
-- 
2.43.0


