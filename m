Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36D2C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wPkQ2yKZRMb3dr4gnYaeyOoBnx66i8isM9HTrrtk6Q=; b=5DjJVSPlVpWaus9tGNs0VyE6op
	7aB9yR/al9GDm2/jRQqRUjT12Quj6DhBCm/KKdXRHq2iBGP+9kVO1yCZp+hNdkI6Egj5hRxOmwhpG
	6+QgFR51MfYxOTZwGgnqwua/9EOQ91hCCm1/3j7jIGkS+3OzzYx7fVnIpLCryKvEYOVGC5Nj9iGmY
	LpZLvFq/IlNG2AXnANTJEa6HbmGPUpMMhkLAZU1SZginVg1k2rttkouAvd7aE3LaoNggNSOC23SBy
	y5u3+KNGr+iWixXhi5/bWqH5LGsveBdVZtPlvrP/IV+/o/PqV2GfdfqZvW7adbIzF0WjFxq4SfNor
	RtgFLySw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkN-0000000GMsv-1pPr;
	Thu, 03 Sep 2026 05:12:23 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkJ-0000000GMq9-3AB2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:20 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2362362a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 22:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412339; x=1789017139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wPkQ2yKZRMb3dr4gnYaeyOoBnx66i8isM9HTrrtk6Q=;
        b=W78VntMSY5k++w8h/L/kQ3+kk7oFAGgYtVwqx+ok/7NlVMmMiuQc+9Ja/ulhlLgQjy
         t/UOkXzZ54/LgVu1kLWbrYbgpF/QRvVRkOszCVzS0a/Cf/YQMT++3/0w3YAk1BqOIilS
         naL86fI1aMaGC53Zm2PyMmyN/GD2wdQryXkqCZqe+PhoIQccaMu6/MpU//AVlphpuJGq
         xU7yULeE01wo3svGDc0VnamUQ89Jd+yGem+RMLB/Xg7V/+zBwm32sCmk5EY2mVBpPLiy
         rfp4iHO6USR6tMMGPddY1NJ44DMeY0wJxOR0r7Sn07q8Wgril+pxRopMZcHknAuu5xVW
         8pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412339; x=1789017139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5wPkQ2yKZRMb3dr4gnYaeyOoBnx66i8isM9HTrrtk6Q=;
        b=kAi3hCc48809VQIik1PV5lpNBIaN1mLWbT1DWcCg9kVijz2kqpCRHWGfGVNRBlgw9r
         NjE6ApktLMDR624zVDER6d+HjMcjvlvgXtfWARqCRUT6eUftJZ2869RvJpjlgOYSv+8U
         i14KpwhuS+6VWrSZqlDqUKSb1y+ynmAXTlvC9WDECbDN4jB9bpMMmZWzXp9VQSDFtIHA
         Ws3+l3mFzCpHxDMJI+DYQOGrL9dUN8Anxv/SlkT/auF2FY8pXizW5ipb9wFy3pwfk4Pt
         BAm/S7OLq6O0fkq85spk6IQYFCIm3VmuWxMbgtyq1dyuQJCeHf4nfxZe2itrQeOzpRlt
         +1lg==
X-Forwarded-Encrypted: i=1; AKwUvBwfo+3YUi0qWMe1DXbiXcuabiNSxAXGzd5lpaDklgexYd/wLgIbGkXAvpIglAdpDxMqAoIv8uqKhxZ4yQxxDEjl@lists.infradead.org
X-Gm-Message-State: AFuF++lYuz2zPy84CK2irrEZ8NRyHEQRSh8ykXoD0+81wGeBnrBsD7DD
	Q03tznnWmXh3qNngVpkO8Zr2W6lLdYd1WoinSh+BFyqMqtlSvy2rfOCo
X-Gm-Gg: AYBFou0qWGj4ZuY/HLygDiJdoAKeGHQlb8rZYex7DvlIm7lZSWWFQ5ZgIGs74X2iuet
	sex5GEKWOLxofTuZM2F7t8xBi1KEF1wHKHuVPIJPwyO1gED2fBfGIX5bDkE9HbGTe8056K0zCIe
	fF//922sO0/maDdP4QGojbMRHdNBSZkBUrGhZFY58DZnaR+pCHtJuEjC7dzZR7JsYxw5MmB+Bo2
	C2U0JTwQXQ8jKFg2c+Rlhok/nQeHhrUX5ohkHFLCZSBTei+/6XhpmFTXff/5e3qglsO6nvXcj8N
	a5kWC/oK/KhrMe1SYXFQdJxKrH4PAd3Z8hj+K+WYnfJmG4Vp8woBMPukaDi6mrmFR+YzKAWfbZd
	7O4HGZR1eBQllX5GlT+ki58Dkmd1Fp0gH63w7FvVR11r2aSHEGOqU0aKHIEUYenz/MXmdkdIJp2
	sJgxSsyZAT7MmepDmOz8wBQ/7GRugsovLy9nQMJCgugCIX8jyQ/7TIZizjXptG8ed1qpmiXHBd/
	uLGulrFys+bdZxeNfznSCpOMWo2ZftLcWuCYg5nOE+7o0mJPkHitCle4v0o+QqFOJTXxOkmBQvv
	iJ5f8C5aW3r+a5tQ
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr15910160a91.23.1788412338925;
        Wed, 02 Sep 2026 22:12:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:18 -0700 (PDT)
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
Subject: [PATCH v4 2/8] ASoC: mediatek: mt8186: Fix clock handling in mux disable path
Date: Thu,  3 Sep 2026 12:11:44 +0700
Message-ID: <20260903051150.178057-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221219_791808_22EDB503 
X-CRM114-Status: GOOD (  10.65  )
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

In the disable path of the appl*_mux_setting() functions,
clk_disable_unprepare() is called after clk_set_parent().
If clk_set_parent() fails, clk_disable_unprepare() is skipped,
potentially leaving one of the clocks enabled.

Remove the goto exit paths so that all teardown steps are attempted
and any errors are only reported.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - In the mux disable path, remove the goto labels so that all teardown
   steps are attempted and any errors are only reported.

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index aa8b2eaf7b95..3edd0dd20eed 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -131,7 +131,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
 
@@ -141,7 +140,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 	}
@@ -158,7 +156,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_1:
-EXIT:
 	return ret;
 }
 
@@ -205,7 +202,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
 
@@ -215,7 +211,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 	}
@@ -232,7 +227,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_2:
-EXIT:
 	return ret;
 }
 
-- 
2.43.0


