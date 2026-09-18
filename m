Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913B1C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IqpjYfx/a4AJRpAQpXk9jWJIkdnAOStvdzRpJSsoaA=; b=Ev4cEXn957vn+KOcR8arOeG2/3
	YYXGCCH0n9YiVs+LL5/O8oL+tNJloL5B7Sm3T/zlk59wnYbYzFxa9L97yH9uqcDv69YyWBP1jblOd
	wxx8H/MkE2FhlPw+yWDkNi7aPg3ii9xlUIXyIXko//8EO14nLth1HPrXlkKPHAporrvExcfK+/YJ+
	L8ncBBAJYXmUMQvdtGCCc3rHOJucGI8VNEc0ELPlK+kDT5biG+lyHbTiKXGKS2AYkoCfMIruwsc6L
	OItehmusOb4MDSNCcu/qJBn/3J594l/c315t4FatPxwLHPtrySyj1L26w/tFM84Rmlrjda561sSeE
	lh/sBBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ypj-0000000EbND-1zIj;
	Fri, 18 Sep 2026 13:40:55 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpL-0000000EayE-0PjU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:32 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso245426a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738830; x=1790343630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IqpjYfx/a4AJRpAQpXk9jWJIkdnAOStvdzRpJSsoaA=;
        b=H7r+VZMFfKrc0nGMZozPxAzU9lLo4n/Ld4W7WzcK34FIVc9lDQIi1I5WyA3836kNKm
         WeJcs3E4ff6p9/TNwCwr2oeZRVLbngefduantReq1TiDpZ7269GQF/kNqRDrWGI1XmTH
         pNkIRo1RTrgLW7o6yd0myxnTD/SsYoHa4+LhLdT7rwh8+Ackq9V7Etyw0J0ay/I7FhPI
         BjjGLZdxVRpCZDgnkFN0MDhmRP/uRh47XpNDKtdB+Xuw8hM10gz4yOWm+vWRWMGe7dqo
         JC2By8cDnByJWOPcTKAGFEtfAcXkfKEqrWjHKad2G5GPJcXcjkuyiJg9q+DbJW3xbX9j
         PQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738830; x=1790343630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6IqpjYfx/a4AJRpAQpXk9jWJIkdnAOStvdzRpJSsoaA=;
        b=q3Ft4VkWXVbvjb/L4ODhdRkcJVKVFtaTW5YfaE+5BSJ5Qle7aVPHV3W/7zMcDZHAmm
         i7pko8c+WyxFWAA9De314XW8eV/++zOlv0tke4JPDVnSsHdK70YfHX6HmWO/YAF7Toeb
         LTV0KLO6QWk3EYc1i+XP7iepalMLvmO8Fd1Gt1bcfrt58RcZd23C4M0txTioSWdmfhJ9
         5YTWQqEV87VBlVItEREw2I4stFHCk3pkYEXWTjgd3FzjWWAF54WLcEArIWPViIw03H+j
         2XNcTDU9VvgJS9+mNgt9b0R2jRauyetEn0WFouFKK9raDfgULc2l8u8AmJoJLKkhhNWB
         WsxA==
X-Forwarded-Encrypted: i=1; AKwUvBxG2Li0UEb4U0VrG2I/5HEIEe7h3UybK3Ejqr8txTQ6wdAGs9F16xfOicU5U5o49BWfvHyaU2UTesRNvOceaqIz@lists.infradead.org
X-Gm-Message-State: AFuF++lvRz1Y4FVYK8W9gY2jeT9yBVUg8OFhDrjKclkAsrhsW2hH03Zc
	8hcO7phg8i7R5OZruw+Lb47hJIK4fZkxvgEVRpH8MIB1Lvj9nwko6nAl
X-Gm-Gg: AYBFou1Nh82swCmKfw/lvpJsfueXXkZlEYrz9q0okmD+i96eZVQ2s53Na6TMrdliacf
	5XQkU6c8X/S/FffRbUHcTrILLawadGJI63j5jxLObSLXudwYq1sbzfMqb+V5lFHEg2hx5c81hE6
	kXrozE54fwpyr5/dZLYJPE0e6Dekox7exU39kSE94YymHkZNhe1W1DODHex1+wFTWunKlk2UCHS
	rg4ptJqoZ3E97nyqDF7iNzISIynnwC3xRwus8mHktgOVFvuO488MV9Kx7zPzrP+mYcUQRqwKQMe
	xoitF5VZwdP/Z6G8Iq0IurlQaItFCvtShW4W/RXQ/ktCHYJFNCGvR5J9JUTgI0ZCb01+F5x4sl8
	d6PLDbl2ZH0iS/Zl1IdVbbcF1LZ+3HRuFaSWLCCTpKatTpH8UPKeNwyMn9Xh1SK9eDJ1lJS01RU
	iJIvz0f9jveUm7skGrLBl9+GVaMVueH6v0hTRiC15CCANPHM/2p91joaJN3Sj5eYfCnOqtrT9JA
	jpcx94LmN3alecwNLiLs9wENPiFZkBEu+md++4lIouUdfI8dFjCpxLF5gd64hYuII2VH8wTQt4l
	YOKs5yehPqkO6A==
X-Received: by 2002:a17:90b:3e47:b0:39e:4c7e:bc7 with SMTP id 98e67ed59e1d1-39e55738568mr3739571a91.21.1789738830398;
        Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
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
Subject: [PATCH 10/15] ASoC: mediatek: mt8192: Handle regcache_sync() failure in runtime resume
Date: Fri, 18 Sep 2026 20:39:06 +0700
Message-ID: <20260918133912.133799-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064031_138301_FFB97C00 
X-CRM114-Status: GOOD (  12.51  )
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

Currently, the return value of regcache_sync() in
mt8192_afe_runtime_resume() is ignored. If regcache_sync() fails, the
function continues execution with clocks enabled and regcache out of sync.

Fix this by checking the return value of regcache_sync(). On failure,
restore regcache to cache-only mode and disable the clocks enabled
earlier in the function.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index e4ecd23df180..5aaff5bebfb6 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2104,7 +2104,11 @@ static int mt8192_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret) {
+		regcache_cache_only(afe->regmap, true);
+		mt8192_afe_disable_clock(afe);
+	}
 
 	/* enable audio sys DCM for power saving */
 	regmap_update_bits(afe_priv->infracfg,
-- 
2.43.0


