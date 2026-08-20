Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CA8C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9ybHqnWFVYiAtnm3we5B2R9frVzEugQA8Zyjjnu3r8=; b=wsP10XfqixsjgjHyQcYX+JWFE4
	EbsHYZTFTM/AE+ocg/lExpIzwRVw0TBUerMvNyAwZ4B2zD5gLREhPfjrLCzWhXYa4deF+tq7pG51P
	HHduvloF4JRtetCLdiIuCRT1EGTNYKmuWUy8chXT84ygJ42I1Ar5qneFPMwyLwyM3JZ1psqpCEnKT
	e/eGsKbFNaNnE0naWfyzt8z6qCCWmPbKUj8q9AQ6sKfWzCmIPOAMvBKlhejswcVpk4F/95KHMYJ44
	5DUXZIt9a5/0dNcjOpXvHf5gw+nNMM1DqtGzsI/QHiZfLYC5BMjA+NQ/2wYstp8HNm278Kd9ec8wP
	PUWF1Eqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iY-0000000BQPX-3V10;
	Thu, 20 Aug 2026 11:13:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iS-0000000BQLC-3ACd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:13:49 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84a2dcede83so2380218b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224428; x=1787829228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9ybHqnWFVYiAtnm3we5B2R9frVzEugQA8Zyjjnu3r8=;
        b=G9nC6fGnk1PKOP1HS/PqLqyhzCockdVv6UQiu6K1lY0Is/3MQE3QEvZLdOBe63/6gA
         JIA8sPY6GPQ2Xt4kwE6CvimOhQuShIBYnAiACtZ9FbdQW0lRHPM19ZzlNaAvduv/KnfQ
         +RD/EHkbV5b+7RparoLhyyvV3xzd0FiZ1ZFAEVzqvN00LOWspEe9uwvGhgQnRIyYmFJ/
         2fcXg8BVM8a7/v1XJ+enbsh2VYUCQzqqMlukat5K9kARU6CyL+xhkJmYV1sbNLhuCvml
         e8OeiH4ZFRDLFyoyMEqaLIbaeHLQTb/NIg28LR7YkOUHyHrebnWv1LmMI+ESuzvWsrUD
         iyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224428; x=1787829228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9ybHqnWFVYiAtnm3we5B2R9frVzEugQA8Zyjjnu3r8=;
        b=H952j6M3AIRPaI7c+60Z7pRl1L7JFpoelbeOV1P4kqAhxCVWlh5A3kCw8MmMw6ltFG
         xMdQo1q6RebcRZBH8nLiOmW51wJ3570hA10KKTj/QaUoCd7kaWqufgBmw32jWtxaBeUG
         ApB3LoAgDBCWaV9WBTUhgphO2tiYGkLFnPqboKvAagURmI3ZvzfMzJG7MGQahnbT2Id4
         ZJQRmYafwk/GHDYDLbVHSG3aulLM6uUi7I3VFUY8TpSYPMnhxRDyDr5TiZB/+SotH7tZ
         AasmbE7Ag6BqFAv+ttbVYG5I78H9whutoOGBUalODhRlHpRasxzSkibDgXSNr41xl1hs
         OLAQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4aRKqR67FfLVBwld4BKceE9XGx3KNPXjr2FsyT9WUxSph9aOjrEMPBUr+ppHlLx+1usyI6zyfGOf5ECJD1QjJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyO9+W8twf0dPy2sK30TB7bW6VN+0aky/w6FfdqSIc4KF8D+pok
	ffQk1q9UH5Xg8N7VMUhi1rYFi/yuhM9BZQPLBwtv4lmwaDrspTgy+1PK
X-Gm-Gg: AR+sD11PGD5RTXwYHBIGQpjscM3mv73iRrAI/KpESBnCnqhZa2VzhP0OAqEaeLQIgYz
	T9w7XJNifyvA9juUcX+HQfzJMBQiatKU8ZRu2quSetkoEV93/NgL90fnsz16CTtMxv3I82pE03B
	Cy/YG2HKzZxq+IZmZ0lgEF27ikqpkvplJM50FAnMvaNqmZPzbyZZ2Aw//ir0pbMdtMdsf6lL7fm
	Ba2+cENDKLO7V/BFuyxRqdFCGSKWUAqft2mVoahlMqr+csXwNbaRfjcaAdGAOrO0WlWO47GnSP9
	7gad4zdk8Lt04x0FvqUjMWeHia2sC+5CdTaHE60Wp/QU8+bE98rZ8f8w4QBPaE5XujFJVvSZGt6
	yfDmZ6TugSgOAm+9iPc/qvwU1m14fW34srwnVn6BoVIxqYttIzqSBUKgjoXgqRxs+M9Tnia4Ffb
	J6uxgegRbBm3GRzuSnO7IR+T7YIBfRuapx5w4jMXUQxnwDMFjU+NdnAQa230+ml9nrbb6kjvRSk
	J2kILBKLAYPzvYLCLFP0n25NVv8Sc3Q9u5gcIkfkyGJkE5HgVzcazeYw2KGbfQKV1Mv1rRA/NnV
	yXO0
X-Received: by 2002:a05:6a00:9514:b0:848:6f5c:a327 with SMTP id d2e1a72fcca58-851d395a3b5mr18400958b3a.15.1787224428046;
        Thu, 20 Aug 2026 04:13:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/5] ASoC: mediatek: mt8186: Propagate clock lookup errors
Date: Thu, 20 Aug 2026 18:12:53 +0700
Message-ID: <20260820111253.97866-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041348_805570_9F541654 
X-CRM114-Status: GOOD (  14.54  )
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

The driver currently clears the clock pointer when devm_clk_get()
fails and continues initialization. The clock operations later in the
driver do not check for missing clocks before using them.

Return the error from devm_clk_get() instead of continuing with an
invalid clock state. Use dev_err_probe() to report the error while
preserving the original error code.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 8cc8eb8022b5..ddd509ca851b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -592,12 +592,9 @@ int mt8186_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s devm_clk_get %s fail, ret %ld\n",
-				__func__,
-				aud_clks[i], PTR_ERR(afe_priv->clk[i]));
-			afe_priv->clk[i] = NULL;
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
-- 
2.43.0


