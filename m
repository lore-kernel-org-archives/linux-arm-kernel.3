Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF39C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=; b=3UmDwqDi9UJ0uOAX+MNOg/KvV5
	+BOWoz3aXxUD66UHEcE1WPsxQCjsETdCoR/OkPAkWiwV6t0RlimTMzQ2q92HD0DNazCGbVjC/XLuB
	bw4vn0SpXf/9rjJJ+mR2o0PsuskmjOu8AoGQsR6Z2e89aQjQu4nzPgfFejwNQRO4ESsW0Ly/pZUmx
	+PuHLoq+AfB5bc0YUbiJtr9NV2C7gekyvWri8yNyBUJ7qGIMCruGpFqlwbQg+mP/EwWel6X5wkfM9
	LGNUo2kzS/IwDJ+OCLCMeo1KCdB00MPGFEsIHPxcNWRJlRNJ2eRiVHbgQQw+j9C7q+SrqDlyYK/t1
	pZOa0Zig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdMz-00000009VQO-3OIj;
	Wed, 19 Aug 2026 10:18:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdMw-00000009VOW-1Dro
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:18:03 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso631562a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134681; x=1787739481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=;
        b=QOMz0bWqhfoBUlyVQTSzDV/VNdOcrHu8zeULU4GzEHJXGyrTxbotEhGKa0d3f6geZ8
         CtlCBHiDSoYdFAt19BlyGlw/LyEDcJNO66lxxWhXmwlIj4fJdLHkL6u7GVytWOqeKZIX
         Q7m/WR6iyAOOdJuM1RiUT+ZcXq28rFJWsK80qXtXXC85DqPNmVK64mXo1hWkR/ffBmip
         sPd27lhshb86QQBDJWVK6ef92fZpFC3HZxrHmsxqkNSZIJQD5FlmwKpiNGnvTdIxL/7j
         PpM4yt6uONfwicfFBWRjdhjrK25b6JUokuiruSKQ94LOQ0i2gCRKL2l9pd6JFPKnZjBW
         2Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134681; x=1787739481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=;
        b=dIa6dxcTC4tpo6cLjQr+1x5kd3W8J/VmF5JxDic9I5Cm9gpOVFCAQRI3EgL+1WEudv
         S//X+j6j1RqElg8Tb7rGGtN0uyE8FT6voG06ymjHLyJps25Ue2MLxyyucMELL7+t+oas
         0fjV47XxngUX/qWaBblwK0jop942LoVYdh6F1+QsdOyBwsWJ7mxoa4SgL2ayfKRj41OM
         ce9BpKoOYO25ajxn2T1PD2i5xLPXBEMhd9+z0IymoFRU0xxdyrRJCICOr+x6c9NumODd
         wo+fr+5J4eYMQtte4TIEpaCR4lAJAhNOgZd6HVfDHzkzOYbn+3UfxXpjDHdih7AgMTYt
         jQsw==
X-Forwarded-Encrypted: i=1; AHgh+RqsD5C3XFFH89YqfdWjg6eZl/GJIxe8+Sf856ESLczPCv31gy9aKbGguwjmAJdkEoEd4jlFANM8fY1GT/qA1Fuz@lists.infradead.org
X-Gm-Message-State: AFuF++l8UG0sYQqu8C3swk5WVM3bIcdLFPtz2cA3h7YGTPT/wwbeo3Yr
	//KXP8iYkshMNQyCZGHxzraZjKYtWed7ej0bMKM4ZkitwuVLUHQUJZb+
X-Gm-Gg: AR+sD12DQN4uGsGGW/ft7KogZ2TeIjydbQBWq4qme/lQJl+Vp9w5mtCFX7lMx/zt/CC
	jflm41bkewfrktrPAtxuLbZCaGFr6c91UoSx0fiF84RaP9arKblW6RqjJC/xe3XmHobXkeBdgPg
	hgMxstGrtp4OJYxQRUIVdvv5mBzsNc1BEXq7Qm7de006MeYkGzsRkZy2JXLmnUSVRhbUH1q7c97
	NrKqFR3vdMBXRmNKGEOxmvlYBZMzEW2BZMWz2O3pAR6fbrKAwJNuxwqUYcVDqPVjuwfGfgVDDAO
	nOSkVpuignwBHDqXxdzgSMbtUDFL+lF3PpFDBtDgh6oVzp4oiDdKxeuKGsU1iG0sPng6TDLT4PN
	3PStf1BmJMZykxq8a/CFiRf5Aj5Sf3I1/ChDn7sMJILiZhiXyPt0VZBfK3LXhp1B8PlI21X4ZS4
	DYrUS6xU9/fOsqMIGWa1KjzJ5vyg0QiDDlPsYOIMCBkt3JMalSR7oqpMV/CNQYsl16w9G29kTXE
	mIbpikVSkNAW43icrJSV4VB1rO1cxevp04QpwPGlRxHopA/qcn5HcbWGyaUMU6t7OYx5pEFzyUN
	5QKa
X-Received: by 2002:a17:90b:2b4f:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-39580f7aa49mr7033129a91.14.1787134681234;
        Wed, 19 Aug 2026 03:18:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm2222374a91.17.2026.08.19.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:18:00 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ASoC: mediatek: mt6797: Use dev_err_probe() for error handling
Date: Wed, 19 Aug 2026 17:17:35 +0700
Message-ID: <20260819101736.67632-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101736.67632-1-phucduc.bui@gmail.com>
References: <20260819101736.67632-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031802_563942_C4A64EBC 
X-CRM114-Status: GOOD (  12.08  )
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
 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 0ac04d73b777..2326496f8b27 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -43,12 +43,9 @@ int mt6797_init_clock(struct mtk_base_afe *afe)
 
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


