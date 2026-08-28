Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E16C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 05:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=; b=riY2mczUlctF9uBUvSCxIXr5TR
	nLwB+uJ8IgmLEpssVOAAwmo3/V82SqzVRz2EYfeggGCjuMMfKTTdmSPuGnHG00EAfgSCQ756pub6y
	KVojzAb1fE/h43PJ2l/S9BX/G3Ql2rp1vOq2nVV6hTH7I4731zxcTH1itdO0KgVb9aO11x5uugzfb
	/2FFerFvx8rzbPyWFNlV9WuSzaMoXeQw/rk0yJARgUeas/rugtvKxsb/esf/L4xXCLMVnMG13dN2C
	1ybvh9N2Cw5F6XbRfMJ2ppReF3/0diJXaadwtiYEzJVg0NbLWzXDy8GgKhVqUoCu1hCgRJKaSehiu
	SzC2Qbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomt-000000057po-1CDC;
	Fri, 28 Aug 2026 05:05:59 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomq-000000057nj-0D2n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 05:05:57 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso496265a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 22:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893555; x=1788498355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=VHjg3oET/CSzWIes+4+e4tde/gbrVmTLNoNOHszY1UxfSnpHi8jp1db23PDB/mGBaz
         1lqbIpPtsRgOhBe5hUEVxKM54PpFuyF1T2/rFbDWrll6MlH1G2W6S+FtufPt1PQmfWLU
         mUf0nVHi8xF4K+tLBnNBZNvKXH2abgxE2aGoUkVKAo8CnNm3dQZxRlIwpkSAw/2u9tMu
         YoolEW29w8egOqt7YHOWxrU/KQuQQAlH4W8GiyJsZkOR7leJoU86qUxE3WlvNcjpWP/P
         BUg1s7h1SctoDurW9lKd7A0DA9JoTcX5KyqevadttGsqKrQQtuEoYFRU7iMXcyFuWEfY
         uRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893555; x=1788498355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=eoOn0xRArEuLxM2MKDPKI+qmNpfc0x4+/T7KDPs7/UFrXSvDqmPa+OUjX5/XlUhoX+
         yFToi7EMg/0d7ywh4icy1zrq6ySp363RnQiwdwx37CIfJpZqHORL3yf1ZDkw7RaiKR5l
         j0gquNr13aTBEL/I7xoJkSGbjA3b9YEMNjegAut7cEGI6uZW1O4zidP+73JO19ooeVUM
         INHxG9m1hOM2COnRIJgqZHIkujMVoY0cxCWXRNumx3rIDxzZ/aZQGU87MQXzkHvvNV1j
         bBHp2t0JtqWyMyxnZyUJ7sManL7s8cvrOFs4CN7wWN3XwzQupKpU55iGEjXVAy9BKtUJ
         iShA==
X-Forwarded-Encrypted: i=1; AHgh+Rr58SbtUEgRPYtHLmMgIZ/OQsEaLIPC+8drIdy/mWXHE704OFmOFOKWA8MO2DCfbEjzfUB1VT8wn0taBOgqFnig@lists.infradead.org
X-Gm-Message-State: AFuF++ldtZf6s6WmbirQBGR3KTRCtjS4UL32iTKjPxKH7qf4IanAlj9M
	Pac2GQPzRd8LgrkRbvpeG/lOQTJACzpD8+onvOyTRaH0/GXUtnspbeyp
X-Gm-Gg: AR+sD11c9kQ8r5xazs5I5vD6wLwB6F0PiLt0pTwiVAehX9c3gzpEBDOkVp4rg357TBI
	xvxeqjXxE5QPua+heu6ht/TQ45dB9E0CtoZlTNeLsba1qRa5R5hVr9m/JHrXZG0dJuer3JI70I/
	9i6y72bpH8f6OzT4hcfXczN2N0ChrLBlCWEuOjCFEXnFb0A9AjSa7WxPiBOblrAJafkbXg7yTpa
	oVqZSUNb5MOunjZjqzFWxcZuBt7w9tndtI7onYGqEPP+ep9Ac8JYuR8fwDhEVBHunQ349KHLUR7
	H2dKuwZdHT28pJ+UoP1nhc3P/GnymN3oE8hHJDbV0Ko5g+h77ZscZQwE2z4SzC7HOvMvnlT4Nz/
	OtQmEFX2plKgYa1EaeqVzzNp6rbfFY3WRSw0/IO7FCIPU4Pi0xWMY5bCbXXg4BD5sflvw3vXOA0
	LwkI+gggTh1Yk9K8jBmP2iVszzSCZbdiG3YD2QGmP5Vvafexi6NGVUlLP4mNNMCcg5xbhLFL52N
	iByS1Bh4kzqoK40uJAj32iGIEeZ2n/pA0ojtjS8jt6LX9NMc4CER1a1pu/XNiQmiBEcjVEtn831
	wMWg
X-Received: by 2002:a17:90b:1a8c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-396d0c0ffb5mr8090761a91.0.1787893555138;
        Thu, 27 Aug 2026 22:05:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:05:54 -0700 (PDT)
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
Subject: [PATCH v3 1/5] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Fri, 28 Aug 2026 12:05:22 +0700
Message-ID: <20260828050526.590761-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_220556_101840_7A2499AD 
X-CRM114-Status: GOOD (  13.15  )
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
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

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


