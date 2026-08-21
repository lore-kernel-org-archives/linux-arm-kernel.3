Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6A2C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EdEJgY9D5VmAtVYQAvmQy6QO5FD2ftLDiJehs4hR10=; b=cDciXJW1GiMt6C4NxAv5RodoJ/
	8vq2GjwUIAgqFIBIhVFkWJOtgElqu/tZrl50uN7tvBs4jiOZImSPX7f1qRhSiY4YNpO8AWYl23D2M
	jbnu2wyrqx5lTw0OegQ1OGs7g4LyEFkMvoUKmK8T5MAGzd64z72UsTo9jmirbA88BWBQyN7O/v1jj
	XjvvvJZltSHS9AWLd2kfsvzYJLUa7n6JRRh9quPkiUMPpA0kobLoszBUuB3DN/WjTSCBltMQozBkz
	hv6V36RaHcKSuP1/x2q0BcAuke2WT50I5Fm57kHti1iO2p9Ktyhs2H4WFRqAr4lRFpGepbtar6FTG
	sgLTA3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMo-0000000DIxg-212W;
	Fri, 21 Aug 2026 12:29:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMl-0000000DIv8-2SwK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2caced6038eso8647165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315338; x=1787920138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EdEJgY9D5VmAtVYQAvmQy6QO5FD2ftLDiJehs4hR10=;
        b=s4vN0j7go171nqRrIieJkxmrcIO5tLHOEdbGeG7YyaDr3QY+j+hEw3CXwZ/4t0VjPW
         paCV9YGfSHwL+D977FrL7v8uBpcDZB6eX+xjKujCHgTOwmytj+5tmsV9VCd4cJPbdR9w
         07MJ+4KkoQ1HTMujiuu259h+TfEfGy8Cp+py45q5IJsUJwbxHLGv8xRvZZ4/aZi1fDZN
         UBoAf/XuaEU+uL4TZ3dul8MjjrHI6zbWQWs4sUip3h73OnEfHRfwu2Oyiei+2/5H696M
         8NsUbzPIUwptwfVLV1T9we2PYG4HjyJq+8+c/MuvZ/TiYWuwLG52l2W7znaTtR1+JKoI
         +AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315338; x=1787920138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7EdEJgY9D5VmAtVYQAvmQy6QO5FD2ftLDiJehs4hR10=;
        b=rZFhqGeIq2F12URS1daKeol4K16jtBjW/iguL2hHlsZqtBeG4HdbX0HsRxMCWwHKeE
         MKmEScPS2gcrmvy2Hn/+PD68Bcy7s/KIO9ltm4TNoFgnY2C75oPcADB4e1R1l3Nu1rMC
         ifagx/JWUnn7/rt7MMFz/fL4vYBwphDga7ZDQNuvDtOfy4pExF6Q79SJpE2VZBeZ5BqW
         +k6QsaC75ZAODLVXh2JyFp4bIwg3baXvwtSlowCWIo5YH19PqDLM6q8z8L92ONwqXrW4
         xUyhryXz+dcRwujr/+4+0rUXcP4cv7UiYNHk6Co73Atld1vnHzDsn9eGwPHoFS0n41lk
         7ySg==
X-Forwarded-Encrypted: i=1; AHgh+RoSBFdl2XGpm1dQG/FLgstOkxlsgfhbOICDYsEM64hI3FTqMs5mvi2DukbqPkf3M1QQ1n7FvqKRYuWWQh0Vo7tC@lists.infradead.org
X-Gm-Message-State: AOJu0YziNTXHZ6qKCcGKP9o0XI7rqdfp4zW+POKdNWyK+ft2va0xGNc4
	5HywUU9YL3nk9JDJOR8RzfBred6NmxwPfwuiBBdlv7jEjiPuiKPXOvhf
X-Gm-Gg: AR+sD13isLHKb+ioXLt9cmM0XTCd4dtqNLSiAcRC58+sundOgo8VA1qq1/Tyj/vmatW
	95W9DK1v9JS2GgDmLEUcbiESCkmS+CNfWB2zvl28Oo+GfDxWf8YgzB9iE/kkF3df5BR4m8WlsXC
	Fu1vI2w4fChqF9nstknZsonxteYWpqriUFmYNLpSVbsjuA3SVq3JKbmrb2YM45SH6wacOmSs8On
	HcL14Pq8Cd13pjjjFp2dio2im9AiE/gszOhaNb2tbGxIA9mafDr0ekwgfUG3CnZGxW6EtSuQQ3e
	b92mIzrDS79UEr5Wfzd6Xjj96s/1jfwGtsampQOdpVdU+QUJC5OvgmaKGWeZwY3piTY+iImJDMQ
	jkPa1fKyWZpiCGB9s1AC34X7cON5KlqhDDgbwrDh/SNb0fq+fkJW4pSCPy3FPtwsM+gr944YCMF
	jI3a1twzYxos1bj1zVseJwgQgN+dw+vHf9Yhm+AtD+njA5aSfj42vEmwf8oz0oOtKXmZn4PbCdw
	CrnarhN2zPHmFCuPwod+eKNaYbMuXJoTZH8IibEbt0TtJMRuF3KAK7ddKmstK3xRv2D8i67z2ds
	Su2yakP4BGa51Ps=
X-Received: by 2002:a17:903:1aac:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d61a15e594mr181843635ad.10.1787315338494;
        Fri, 21 Aug 2026 05:28:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:58 -0700 (PDT)
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
Subject: [PATCH v3 1/3] ASoC: mediatek: mt6797: fix wrong unwind order and error code in enable_clock
Date: Fri, 21 Aug 2026 19:28:38 +0700
Message-ID: <20260821122840.41266-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122840.41266-1-phucduc.bui@gmail.com>
References: <20260821122840.41266-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052859_659104_B8E0B978 
X-CRM114-Status: GOOD (  13.10  )
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

The error paths in mt6797_afe_enable_clock() use incorrect goto labels,
causing clocks that failed to enable to be disabled during cleanup.

Fix the goto labels to only unwind clocks that were successfully
enabled, and return the actual error code.

Fixes: c5e7fca928d3 ("ASoC: mt6797: add structure define and clock control function for 6797")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.
Changes in v3:
 - Add Fixes tags.
 - Add Reviewed-by tags.

 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 6f3e6acfcfab..0ac04d73b777 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -63,21 +63,21 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD], ret);
-		goto CLK_INFRA_SYS_AUDIO_ERR;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_SYS_AUD_26M]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD_26M], ret);
-		goto CLK_INFRA_SYS_AUD_26M_ERR;
+		goto CLK_INFRA_SYS_AUDIO_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_INFRA_SYS_AUD_26M_ERR;
 	}
 
 	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD],
@@ -93,13 +93,11 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD_BUS], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_MUX_AUDIO_ERR;
 	}
 
-	return ret;
+	return 0;
 
-CLK_MUX_AUDIO_INTBUS_ERR:
-	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_BUS]);
 CLK_MUX_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD]);
 CLK_INFRA_SYS_AUD_26M_ERR:
@@ -107,7 +105,7 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 CLK_INFRA_SYS_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUD]);
 
-	return 0;
+	return ret;
 }
 
 int mt6797_afe_disable_clock(struct mtk_base_afe *afe)
-- 
2.43.0


