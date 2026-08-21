Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50102C5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axXA4DN3AZ7lZ4uoWKWlKISmN+79vPMNk4IXFpeL8kY=; b=l6M59yA1QfY7XKNQa1brUcd+7J
	4s0keUWFBQo7315IUV6g8MUpL/2bZjSLd9RY3/Ft0Wik5h8Ho0xoa8D3gHx0DjXa4Muj9ml/ArIq9
	bBn9sLpvV9gIh1Hy5WFgIaMojXiwRB9Op/zadAMPctEihFoyxKzHwLrHN28fVJI3KKZmytn67jLKt
	+98+rR2FxUEvoa+BANRnDUPWeruGL+uQVJyKPFOhQbj2m1YjVxLpWdqZ65sIhcUB7ZrxSIF5MSL8p
	W1v0+Uk/ijmgii+HhOrPTDfPxWr+uuzac3YowdG7hpgEra8ol9cdtcPgGplM/Qdz8vMgYEhCGNJwD
	KozaPPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONc-0000000DJO2-0J7A;
	Fri, 21 Aug 2026 12:29:52 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONY-0000000DJLS-3E7q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:50 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1174177b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315388; x=1787920188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axXA4DN3AZ7lZ4uoWKWlKISmN+79vPMNk4IXFpeL8kY=;
        b=HDRf9PFrcGFrFTYiWdXtb0zf520qcXq5u86/pc2DjjaQe9ZRaLzlpJwbx5zgshQ5Np
         zUt86RqBAjkXXIOfOJobPcdsyzSi8ecF3Fyx5bND+H31yzxGtteNVUVGDrHiv9IheyXz
         fNNsdIu29RdVxuIsBf8F2/0YWWlSoYifHh0KBpA8z2JB8Ve4cjrdBZr6T+VgeuBsXoux
         6TS0+E3X8QsVoIZshEV5eHbAcIa2ptU28XADtKKudBzts2deei8NkV03ySXzWGv4DTSh
         MY9120uyg5SgZ0/zb+MHoy1ePEOKwKAJfmPs176EwHQ2dLW4YE5fmRzwz7SowGEBFczC
         Zmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315388; x=1787920188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axXA4DN3AZ7lZ4uoWKWlKISmN+79vPMNk4IXFpeL8kY=;
        b=hBhxxh1+Lx2DDuDC8mqzZ4nicaWqSeUdUqawE1THi//65+QPsQ5+otIalajOg7zAxz
         1TBbO/zXp9fHO7+7zOhGj+ozwfuSD2ZPat5oAo5DQ0oHYCWveQuJdUpuFg9d5WW62PHG
         kzLt4sk6FUqu6LwScB2D6aGgJVyput0JvYHcQERGBmWyggYHpDenxQLGqzrak6S41Zcw
         8x0aqABmuXH7XqxLkQS3OHEfXd48YVfKSi1zXEzz6iFa6YKK4Z4MkvNoAWmY9QIbM6zi
         3vNbSsFTWrIGgv2m5thRGVqLXa4SLt7nBkKOPuaniz3j538T49KWLELF39nkGg5MO4MH
         3yMA==
X-Forwarded-Encrypted: i=1; AHgh+RrewhGvOSqpg/jbLtkp/X0iBzctccKiMqd8ZUXeN+XLyiKicQfII/D0Ncl2csMRwtjBcXEwW+M0h/YlIsxKkvT6@lists.infradead.org
X-Gm-Message-State: AFuF++nlDoMFiVoDmFaUR93040XrarvId8K7/eCblOFhyKct6QbI41v4
	z4/nOKvrPeRT8CzfXzuUdtdVaFwI7sOg238HUpyyv2QfN1KCKeDGXFq6w0JXVw==
X-Gm-Gg: AR+sD11TosHTxMLzmQenJkfZKWOXEW/0nqpRLR6pd80Rnew4u35pysvp+yQWYpYUzJa
	oQUWWc8afb6mlGrqgWbAnBPSLmpipjcXXKQ5G3ieLNCOMBVO9i/HD7tBuTaI3k/Y9jKvMDDzZ4X
	P0JRpXPW4Muez8k5cz8+aPFdxeMIWzV9W1xp1HNLsNihyrMAj7g370XaafyStjWowMxkUTDdzDb
	9hf/RVD6+0qXsLhcjRKO0mfFcz8NEcloMTEpBeS+VXbqMHxRPvOe9YVxbYt6HxNaRxmC/pVVL7u
	YX9/SRtnE6AnwbuNAlVnOfBOU0/H6SxO0xJ/t4RtiedukPzsto8Rw9mNbdSf6pwfCkQhnXcyyJD
	Vz3Qr4KPKcE/WQJ2w9gTOJ/wb0Oc/feoT0a8VIW/GRVF/PriaYUt0ZzDN4cZdvmr/UM5snfhDAV
	em8B6t253zHUqUr+QQtq0jGpLWCXgmUVZ5GxwVrlRkP7WO3pxQgsREWTYiFvjY+0iwy9tfA5l9Z
	GAtPPiusUcmrbfFDYJ6NSpD7b6zBlEX5iCLNT2Nk41tCVnICoe2gdQkX6j+79/WhzGp5BKaIiPX
	KBAa
X-Received: by 2002:a05:6a00:a589:b0:851:c2a6:172f with SMTP id d2e1a72fcca58-851f9efcc14mr9394852b3a.7.1787315387771;
        Fri, 21 Aug 2026 05:29:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:47 -0700 (PDT)
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
Subject: [PATCH v2 1/4] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Fri, 21 Aug 2026 19:29:25 +0700
Message-ID: <20260821122928.41343-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122928.41343-1-phucduc.bui@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052948_817502_A12FE8E3 
X-CRM114-Status: GOOD (  12.96  )
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

In mt8183_afe_enable_clock(), when clk_set_parent() fails, the current
error path incorrectly cleans up the previously enabled clock instead of
the clock used by clk_set_parent().

Fix the error path to clean up the correct clock when clk_set_parent()
fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index cc4f8f4d3dab..6ab0734ad136 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -137,7 +137,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_MUX_AUDIO_INTBUS_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -153,7 +153,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_TOP_SYSPLL_D2_D4], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_AFE_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
-- 
2.43.0


