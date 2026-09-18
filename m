Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF14CC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47miggGna65qNmT8xI9ufxte8NSMbuV+wMsl3roErvo=; b=FDG9zoZjx43XFid+nzdHKwZ8qL
	QS4ked6OiylB+QL9D4tKKOFytUhN2QFaKG2vGl6Tsonfcj6qPxCPFB8xz4f3I8X1pdWp+OIRJnWpe
	fsK7KysSGe1AZZOGtJIzqi3LW2kAukyUFygdYMZ4P/hsAHut7Ju15JISHYl6Mu25Scmfvio48Oy/5
	yjmsA17/A6Ui+4OtMF9nrsOtcFPMQ5o0ZNiHJEQOCeC0r5ZNO3PGRUuJJJZac2mQmevwTzKn8xp/Q
	1wlfIxuzLnMlgW/PTliPUlYD4JiYS2SdM2qFmXB7MNvRUgMSFbTgN/saCWn7ZVDoe6Z3eRB7aKKHj
	jXXq6DDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpD-0000000Eas1-07AJ;
	Fri, 18 Sep 2026 13:40:26 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yp1-0000000EafX-2zlh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:13 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so735171a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738811; x=1790343611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47miggGna65qNmT8xI9ufxte8NSMbuV+wMsl3roErvo=;
        b=PLKd/oxYNzNtpBNvcZ+Cs04Zv4ePdfe/oYNsK9NYKlLUkYJoT8ENOJJm407E9ZTCJp
         /DyQ1mFEneEPG7elop12kaSIpB6JysoWKP2EVLPMfrhFRg23PLtdtTgHSJpctZ6K6emh
         amimIRtkldVq+zi8PymyVl8hfLwR4T7V1dYA924LGUw2ofC19/3WGFBCcDUwVmD4PRUB
         CTTtO3T7fwJWyEriEGhFi+vyFwj8ID5YGYbOhapObIM0XOn4UwYiDD9lj989fU6BR9DX
         Yg+kFYuutNKOQs4uldZQGEuBke7kCItf7ibufuqtsFoo2v07j3tfS058oKz3nIU22dpN
         umnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738811; x=1790343611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47miggGna65qNmT8xI9ufxte8NSMbuV+wMsl3roErvo=;
        b=XsxqP0j01u1SWMs77+t/AXFP5WoL5brl3qm86rxwh4pRE13R4F64PRLQi1sB0nerBo
         STgICnkSQQdNvK0sCAlECRASEA3ctbrM1KjlC/zyl4ShEHDL48p+d8VK7R4h6fv0mIci
         0t492xajs4Z1xzL1AQhMqFzvBE5rLZulPeni2H+uhWjKdSTnvAdo5JUBuiUflZ78COEB
         jIuRDmjerppM7/I4oDS7pVhmhN6ZyQEmYkUkowYU4KCEjPamjRwtBAxAzANmrD/Pg9Br
         jgMPq+RfEDxKfLOz19UFlNxApsjLR5/xiShMG61LhOJCaLvlRBjDRyUqR5Awt8kyFfw3
         0Cbw==
X-Forwarded-Encrypted: i=1; AKwUvBzYOv+K7n8Hly7kaZSdGfLlJM89whsUBQcQV1keZERy7VEJiPA0yQqyKbbaPKCxWGt2b00Ss7BvymRs7I5LzGWD@lists.infradead.org
X-Gm-Message-State: AFuF++llGz0e5NbZg8WTwshdoXFwpotqQzpZUWzqu0VjDPfOTW/a2Rrq
	BTNIzdSveyZzDF892YjsXlZau+N82DtC/3kYwtuGovhqwsSr5SF5PraZ
X-Gm-Gg: AYBFou2n2J9osrnONKmxVYg6VkapzBDBXzptVDCw/x5E9rZBE2GlN14vGI3w8v7nylv
	1ycpHjFmAy+j/ASmNJQn3M760ROKfvWw0pBkxrWIFonWGjY6s0FhTHo74UtURpGP7I+Skk5SCTk
	9zf4ngQ/yNHtlQbgQ86rgMqG0o+ltGc0m01Y2jkZqm7HW3jjg20v4lh15D7Vvi9x3AW1ewDecBB
	nc8WvL2nASO5nwR5l8UmRoKAK7b9/uHj+5y3KdOfaoHa/yrgUqWquEvNen6IVRccD18dYMz/209
	x1VWYGUsGWj60xPG+A8IDaZ3UkvCcKNHDglIGdk+Q+b0zapgD5ziO8pb9RV5fGBKurkP47Jmjai
	OEA387QuOsrNFvZ5QsLZwAvezZIKooyFU0c2uaJ0P03hKOypN59juGy+gSvVr+L2gdgPHUevmpL
	6SPo+AbL6TrlzO+HOiex4WGM17G4iYHBosUbX5aaCsgyWhCRwDZo0JL0lnKcpWxNND11gRBi5pS
	FMXg4clnElCcoBhJpSjKi7W111t/7WpryAPXVho37lFFFd+T+PDmwFXC4HplrwM/6eN2hpmgksq
	P5PZbhM90BTclA==
X-Received: by 2002:a17:90b:4b86:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e54c5a1ecmr10006575a91.3.1789738811052;
        Fri, 18 Sep 2026 06:40:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:10 -0700 (PDT)
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
Subject: [PATCH 06/15] ASoC: mediatek: mt8192: Use dev_err_probe() in mt8192_init_clock()
Date: Fri, 18 Sep 2026 20:39:02 +0700
Message-ID: <20260918133912.133799-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064011_784791_E69509E3 
X-CRM114-Status: GOOD (  10.49  )
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
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 24 ++++++++--------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 9b9a3465ddb5..c6ca4fe7fb19 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -680,27 +680,21 @@ int mt8192_init_clock(struct mtk_base_afe *afe)
 
 	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
 							       "mediatek,apmixedsys");
-	if (IS_ERR(afe_priv->apmixedsys)) {
-		dev_err(afe->dev, "%s() Cannot find apmixedsys controller: %ld\n",
-			__func__, PTR_ERR(afe_priv->apmixedsys));
-		return PTR_ERR(afe_priv->apmixedsys);
-	}
+	if (IS_ERR(afe_priv->apmixedsys))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->apmixedsys),
+				     "Cannot find apmixedsys controller\n");
 
 	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(of_node,
 							     "mediatek,topckgen");
-	if (IS_ERR(afe_priv->topckgen)) {
-		dev_err(afe->dev, "%s() Cannot find topckgen controller: %ld\n",
-			__func__, PTR_ERR(afe_priv->topckgen));
-		return PTR_ERR(afe_priv->topckgen);
-	}
+	if (IS_ERR(afe_priv->topckgen))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->topckgen),
+				     "Cannot find topckgen controller\n");
 
 	afe_priv->infracfg = syscon_regmap_lookup_by_phandle(of_node,
 							     "mediatek,infracfg");
-	if (IS_ERR(afe_priv->infracfg)) {
-		dev_err(afe->dev, "%s() Cannot find infracfg: %ld\n",
-			__func__, PTR_ERR(afe_priv->infracfg));
-		return PTR_ERR(afe_priv->infracfg);
-	}
+	if (IS_ERR(afe_priv->infracfg))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->infracfg),
+				     "Cannot find infracfg\n");
 
 	return 0;
 }
-- 
2.43.0


