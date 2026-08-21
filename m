Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEA2C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LEpADh7BRFyWhypphnGElkUejLABiWZIaIIaxvhaYU=; b=2pRSC0UDnoOKAgIR7cPFyvhnZW
	my9BQh0tlHJJGr6JTx7+7wocLpuJkc6pIpDRaqoKhljQPZibL39hiWnHDX4xlZSV7rN4ZuGlXSx4w
	DNMpCFbgVz9N9pNwi4h2xpTgarbwQeKQRoBhLZDi7sHoh3j+9CVJ3pdXfHjC+s1qfy8azg7bXtecJ
	76eb6EidtwuS3TLAzkoFSdn2RpmZV9xJ/c8eP0esIB0nMVBEe9+NUjp9z16Z9WBmzA3rFq5pnLRLK
	ZpcqUAqwpuCUFJ5f6dyjNI1S1br+fuyyVwH9JfeCvtIb0A/ON2J5pLbT/t7XX+Zw2wlmkpUmqac1A
	h0LLoCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONl-0000000DJYE-2qRC;
	Fri, 21 Aug 2026 12:30:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONi-0000000DJTo-0zAu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:30:00 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84faf87d19dso833356b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315397; x=1787920197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LEpADh7BRFyWhypphnGElkUejLABiWZIaIIaxvhaYU=;
        b=UgGmJfI5Gg2o/9Q0CllTwE+LTkSZLv+kvd89aWqB/86unk529eIf5MVjv36hri3T0E
         G7+3QzXYNQluTCneLhJjL4Ng5bWe4TAjuFcFHttZfdedaSHojX42M8txeXKwf8f1dWkz
         5c7oSgUUyd2nDaKaOsAsTUpNix44fHxPCU1SRagyP5m5K93X+MWL3dItXWQZF8aOhsas
         aF1nzWwOxrhaJVbBHyZh3tBDnF/RaVlZ6KhWvcN54ng0yrlNNyb4ML+EESNv+Qr+PM5x
         fsUEyxDuxanlY8Vk0zKeeys5nUliVCLssfwoTzqisu7+66VDjQ5HgZuVwwxBmx2LdWGA
         mx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315397; x=1787920197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LEpADh7BRFyWhypphnGElkUejLABiWZIaIIaxvhaYU=;
        b=aunc/Qen2gQ1baVYBGFxSN0Tlh0nmeMHA9S6RwuM3WkWEEcjAti3xi9jdv3Sc8DYfP
         eMhN3u94umBA1u+6AT/KbVj7QwDkwo8/JorPSBabPjzpBmoRXUSMUSDRs1NmO540DAb+
         WW7K/kkm03KnbPmA9LBqnUpqgcqQHaFJQb47/UwYmXsuXE3yyoXl/SMZZdYMDHnhwova
         Mt9QSPjWRluMISlGl8sxV/le3jDxVuA7lF1A941OZkwPKMtQJgoeoHlLzswAmSqBo9Na
         T5ffRGQHEgSVocSv+SEKznqN6FThtwadzMVx0UOaepNDE6Zu5fb1ieu2U3wEIaBIeQyO
         hNrA==
X-Forwarded-Encrypted: i=1; AHgh+RoXUu6mgLWVmi9O189WN2VR+9n40vlaSqEtFZpTgWm78KilfTcbekI2yxmfOA6OXkGBL9cIVksPJ2eD2ONCjb9r@lists.infradead.org
X-Gm-Message-State: AFuF++nNHU7G0AchCzK0nKNLdoI9VxMH7y9Mcj/OWBP9NGksp7mOSM46
	MzdenapoYqedzydsgn7jqIm743hAzsvPN4G8CQazHzGVd8UQbLhnjB0W
X-Gm-Gg: AR+sD12QSgX20B2psOfT/aM1h1FDeMmMfSxddhsha2BzG4vhe++nUwsbqbBdPIs0O/F
	nTLdR2FLQbS2/RTlKphzHgO1liHbcRadOALi2BwZb7STZTf27EGh59GCRV3ZPvP0g572QRsKRSk
	UrqNja702c5tbMkxVXtHY2AKMkAua8R2zmnpDqZMU5XkgQfGo1XSX1AN65cZaV5sjEN0ph+Bcrq
	DsE6ljNdkaPncvS6zjTJ4ysY6XKS3IhU/T5l5Fz1xK/nCt6cKRlP7JuHLn8BbC9RHkeiUJgWOpL
	5ReKw/ZmyXuLRF8Iy2TfyPip26UoeS920AagkfPpKYIOkrvfjXwKvkEg2/ekaBmRjMbFQz1MYgt
	fkedt+s7N2Fy+9kjJaaf4EOjHNufvOfeGttiUuLmf4Hbxh6rl/e1Gmt2NLocJ2Zd8HDFr+rRR5+
	gPeHdZs30QJAms91U3YZzuNpAo8tvTcKHidkd1Mn5sftgEwtNtBTYYzMRr/llD/o89OBBfCB66N
	qLMzbad1sYdeVAKl3q1tIdcQx5QXfl/95ioioMUidnL3MA2pndbWr6/xBd4nG6PrIRFnFnCgJgd
	AelP
X-Received: by 2002:a05:6a00:ba8e:b0:848:34ad:3d6c with SMTP id d2e1a72fcca58-851f9f4a715mr9133903b3a.15.1787315397244;
        Fri, 21 Aug 2026 05:29:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:56 -0700 (PDT)
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
Subject: [PATCH v2 3/4] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Fri, 21 Aug 2026 19:29:27 +0700
Message-ID: <20260821122928.41343-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122928.41343-1-phucduc.bui@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052958_294094_42E44DB8 
X-CRM114-Status: GOOD (  11.59  )
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 0790d8123179..46cab62220d9 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


