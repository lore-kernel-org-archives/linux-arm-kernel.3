Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F408C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkJ39B1HLIjudCYGC3Enm23IBUt9PIrUzK1D2BnlrWM=; b=N6lPDNNORAOAgPHsATGHWMepQL
	4LvVH0oKzxqzrt4Lmkyd//N0PI3eiDfXYvAS4vEQ5JZkfcdpWI9ZWFxHDv5dQPSiyPjizJ7EJBOBS
	ltx6Xqnj4Zk1P4UqJYDrTVL3MAOZlJyE3siktNJb4Oxa1fIq8Y4JtfkOSllyscCMAcMUEeO7QrjQJ
	hJLh5foYsEbz2XGO17sv3MrwJIJsbNB1K3nJW+swlTu1A97qfjJr9Onck8TiWVU0/KMJxXHy/0L0c
	Pi5t1+lPEvm+T7gTCYwXBmubaPsg5RtSRDno8U+HF5CPsoOd5fPwY2GCtdI/B6t1AL0+tVpxQwvqN
	lFsW5lCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkQ-0000000GMwS-2d0x;
	Thu, 03 Sep 2026 05:12:26 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkO-0000000GMtu-1VgC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-39682983a0fso2512005a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412343; x=1789017143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkJ39B1HLIjudCYGC3Enm23IBUt9PIrUzK1D2BnlrWM=;
        b=RMC9hE6IwOd4cm6E/pE5cXx/gGBxg22TBE5zhHpo92DZrak1nBmrV3Q460Ig7yAogF
         OpkcBN9SG9JAnLZtyGJB07SiDzidhrCN+9M+K6dQ8TX6Cj0V3WmN9D+/Fofc7MUF+UC0
         2uTgrabZGOBfnkAGTegLHjZSKi5o0xQdjwUbvzvrkAsWtCYgPzQ9+t+XjABvhaMbkotM
         9AJwVJYHGdiSpwwzn7j5z5HBUoBU7SZtAMccHd2jIGUYSUxYz3JYyotLSVelbaaaAvKP
         hNUBOmFytDedRixdFilCacN/lMCUc5scvMdf7ga1McFQFpMkX8MbDvjDNGyaC6+aZZZN
         QYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412343; x=1789017143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkJ39B1HLIjudCYGC3Enm23IBUt9PIrUzK1D2BnlrWM=;
        b=K8Ep+yNO0NwbeQkBEhYuonVFRwaJulQZCiXaLdEtunC89cSNAbfIbYV2qNU3C3c5m8
         lUlO+8tR5i1Aws5V11wcuLLYMRjZzOTrkC6OdZTi5EZkPcJGmFa7py21wmxutRshfRt2
         VO2UQ6/jOQWTJ68ScwCDBmvSDCfDUTFoicuBX6f9vBXUuhM4Hz7VjyMSfMRRFR3R6HE0
         G/n2Pa8IfKoZzghGxgYd8io2SH/Z3Yip7AYuuu5WBZBwBg74kWe5eZHW2dzHTJicxjlJ
         /M1iMV3G1staIYDuTtwCr7zQsO1OavdzVMZMOGxBs/KI/uqTKz+82RhyQtXl9mwY7QNz
         9+pQ==
X-Forwarded-Encrypted: i=1; AKwUvByO0CvpbfXoPdnTUhwT7c4yrhBNUuFvIjIGDB0lCbH4Z4Sx4Q2IsZa9MmSlIWlyvtznNoGucNQ5NESq5aUWuqab@lists.infradead.org
X-Gm-Message-State: AFuF++m9v80BYFuC7oKFZFF1XK2MVZxMRVCGmg5Uj9uifsWcDh7Ml99S
	pEFWHRk3yqTysOGD5rPjl4kHyQnqueINxY0hp167OJU6KbgYdWHbrQnxF5jagQ==
X-Gm-Gg: AYBFou1VWWDPv9VK1Wpr30sECwyhWnIrIJcAKxNBxQmmjlFDwhoLJzyXPMzkaHi3M+q
	RivJgtArMcvHEPOrp3wT6CE8ylFzdyr+FhwYFdqbbOEpAWGZC+pu0Fb6QeuRsI/KaFyiMVLdEE1
	F64CwwiXvPgry5Ds4TH57v73CmJyIpqEP8DvEKSO0/1Dwf5gOuhZwS2EVaKx29Ai9eze7YtPwdo
	MMC4LfwpyJKswiMLR96mrNQT/TUseYM1EpL7e/LxM+04xi70znhUUgTKnpwrmFRkEv/mMhkAXlH
	HICTf8mu04mZ9bI8C/XBxN2ZX9yXTyXwiR9U1hahNSNUZB9TYDGe2mWJXClCjhqxArnm5eS+h11
	zhaFVCDJnUGF0WPYbygqXPW+qKwKGEjj0uRVdzDH+vq9vEs0njWZ49RXFUGr1e6wMliV9WeqYxe
	iA1YaImoNHnd4bebIUm+xejI0YBZJQ8o3ftoVgsv2E650MadkGZJxOhYL4pNLbak9Q6I77EJ4qD
	4SLoWv8+NFVWJfwAq+vkWGTNzKhz9j1Ow6gG8MU7a7f3dRJo3s3Zih7irLnIhxY2AuvuN71tyrw
	ZaQ/o4AQZbdNeoNk
X-Received: by 2002:a17:90b:1c8b:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39aee0ab6f2mr12102665a91.17.1788412343352;
        Wed, 02 Sep 2026 22:12:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 3/8] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Thu,  3 Sep 2026 12:11:45 +0700
Message-ID: <20260903051150.178057-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221224_400319_C2A4F5AA 
X-CRM114-Status: GOOD (  10.71  )
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

The error paths in mt8186_afe_enable_clock() do not consistently
undo the clock operations performed before an error.

Fix the goto targets and cleanup order so that the audio internal
bus parent is restored to CLK26M and all previously enabled clocks
are disabled before returning the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 3edd0dd20eed..685dc27c7780 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -288,7 +288,7 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto clk_mux_audio_err;
+		goto clk_mux_audio_intbus_err;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -315,24 +315,22 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_AFE], ret);
-		goto clk_afe_err;
+		goto clk_mux_audio_h_parent_err;
 	}
 
 	return 0;
 
-clk_afe_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_AFE]);
 clk_mux_audio_h_parent_err:
+	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
 clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
 clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
 clk_mux_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
-clk_infra_sys_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
 clk_infra_audio_26m_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+clk_infra_sys_audio_err:
 
 	return ret;
 }
-- 
2.43.0


