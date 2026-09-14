Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7F5C88E67
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZhy1gvzxv4nnqK22Id8tWzLP/pMb4kmGE3X33hanlU=; b=nkHXp3QFhsb2BcoZWV4oOY2Ewu
	qD71W/NkjkGnxhvZleHdT47A13FuKxy2KbhIjdnTCe2NWUDjyX8K3wUDAqYFqB0SUDRUBMwlpt8nB
	7mtO8jqjM8nYq39O5sQsdWEJEAc2BxqyOEpjLyEA8o84puXnmZQruCBmBlqOnfFRSBGPwBI9/oHOJ
	5TomDTbTJXl5c9/aW+BrXyUQS+QhIJOnwbfwkoBeesO8nMPdpq6pAPIVQ5nNnXb9RbNMHs2+/7Fsy
	ezWW2t+RNIi4yZtslm/1LFlA/66N0j+W3hfx9b932Jo28ll8y6+Njie0yXwjydVZk3apIPmHMMWki
	hxh9VxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618E-00000002YdR-14op;
	Mon, 14 Sep 2026 07:29:38 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6184-00000002YRv-3OYb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:31 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so2114127a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370968; x=1789975768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZhy1gvzxv4nnqK22Id8tWzLP/pMb4kmGE3X33hanlU=;
        b=qmRk0BZ4OpJQ8eDW4zgg08MUgxDUOkaHVHYzl2PcglCSOHXvCDtTWRWiQWhbNIGncY
         lmgA9mxQjOp2P3zVBrlIow8dWeOs+UKlGZRWDBDEeU5IyZ9iOLyzhqn+NfOriQulP2aa
         M6Ik4q60vq8IqE9nOzjIvivBf7DFJVGVwgX97BzzKoi4fL233L3+priWDOezQDIlCAik
         RHS6CirEqc6DffD//g2Ct7To5rVnYcGRE3dtVgifN9kw92OvEMKz+xMHCODAfL3QgFNB
         CXKrI5ScW1mIMW5YWxQaGi/GIhXzXYejrtlq2/xQ1DdUyG5Ol3K46KrUPhVTD1K5ATui
         WnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370968; x=1789975768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZhy1gvzxv4nnqK22Id8tWzLP/pMb4kmGE3X33hanlU=;
        b=Ol+CQe3NgiHVmzG7CqHYDVfWXzfk5OQjswYgZmHpZhjelqG6gPYAWlBYA/O96mWgIT
         NCp6oExpEROgklNcJUWzHR4g3jjTrN6kytTw798MlM2ns6Kh3NZSWD++7F8M6vK5sZkB
         OrNS3r8Le3imI35BQmxbHdJeZ9k7+ZEwdzzZd0x4r2m+Uk3XDN11cv9UP3LhQHlvBejA
         tQ87BEjsgOuP3ttFQQLPmquj+D+KW+vxf8mauphyx9CcYX8+EpCDlakxxWQ+XI1Q3gni
         edYxf9BoYdXPAMkcQNOFn1veHjCvvXjdKzor9B9f5LF/er2pfNqdbpBQwf9P6TdGSEmS
         Y03w==
X-Forwarded-Encrypted: i=1; AKwUvBzujLaYCp0WcdLCWhIaLK9nucV56WcGxNihMRDZb9ci4YqFV/SzG8v2Hq304OMWQcmRzADmhU6x12RFDNpjY5xI@lists.infradead.org
X-Gm-Message-State: AFuF++kioLkLr4/6NLdEdMHJzchMmup3xpbHMxkvMyS+6tDeoWmVktYH
	ZDtGpc6hEDANaT+0AcKVjqTLqAp8R9UuvIY1Jt2y7MYAHYt85LCXqOv+
X-Gm-Gg: AYBFou1Xc8E8I/mN23fXbPOV4hat2PfwDqIKrtHS9PR3WfJPJNRpHEjWZ3nesrooAMs
	HAqOmdFcN4i8Ck60E9aNBbrP8Sc4Lm8sN0nYUMYLRnbeGKJnMZdITT37wx0dAUsYfvhzMvrowZW
	Aois5uKpXQw28EISNk3/85jxPQodvprMYYYIcmw8safdsfK+w8gm2Q4knz2KvxmnIjv/Pq3+fnI
	u8Wd0e/VXAUmnEahzW9bpRVHpELsfmEjDDw4/I+4GBFFMQ6UWLAIicLsoJDvlsBpEdHh90KlyH+
	9hQESfKqsXRGbBE17LuytAysugdgvf2H1I8qmI1JjEOPRpq4Ohmt5T1qOCF8H3d7vxs569NXTii
	MjekyYHWCs/EIADx+tatfuNGPdLGN21ndSiCqK1AMfkU6+hO6WpCbyZEIXsiOybna8Lest6uuCi
	uMPzLONeTvsEsm26Eb80JLtBrLpNjWIH5Bu20wN9WaKf9jMRn4DiTrXATd8BKFT6w8Qbec5UIUS
	E4EW3QayAtiRyOKwDC86LUv6GzI8GbhR1ao7TGqgxY2VXh5JSyXTnefbgeYMojCSSWjMtosTJn6
	5Uhhj3bHBVGItPY=
X-Received: by 2002:a17:90a:d008:b0:39d:f5b1:e35f with SMTP id 98e67ed59e1d1-39df5b1e456mr82384a91.25.1789370968111;
        Mon, 14 Sep 2026 00:29:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:27 -0700 (PDT)
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
Subject: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
Date: Mon, 14 Sep 2026 14:28:36 +0700
Message-ID: <20260914072842.24420-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002928_855814_044235CD 
X-CRM114-Status: GOOD (  12.45  )
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

mt8189_afe_runtime_resume() currently ignores errors from regmap
operations and mt8189_afe_enable_main_clock().

Propagate these errors and clean up the state before returning the
error.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 36 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..67fa40afdefa 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2328,24 +2328,46 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 
 	if (!afe->regmap) {
 		dev_warn(afe->dev, "skip regmap\n");
-		return 0;
+		ret = -EINVAL;
+		goto err_disable_reg_rw_clk;
 	}
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_set_cache_only;
 
 	/* set audio 26M request */
-	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
-	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	ret = regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
+	if (ret)
+		goto err_set_cache_only;
+
+	ret = regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	if (ret)
+		goto err_clear_26m_req;
 
 	/* force cpu use 8_24 format when writing 32bit data */
-	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
-			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
+				 CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	if (ret)
+		goto err_clear_26m_req;
 
 	/* enable AFE */
-	mt8189_afe_enable_main_clock(afe);
+	ret = mt8189_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_clear_26m_req;
 
 	return 0;
+
+err_clear_26m_req:
+	regmap_update_bits(afe->regmap,
+			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_set_cache_only:
+	regcache_cache_only(afe->regmap, true);
+err_disable_reg_rw_clk:
+	mt8189_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0


