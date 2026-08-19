Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22742C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5JyEyakg047/qVI/dgdygc+uAR+XzDJBCS95evddBW4=; b=ko13G7b4EYbvBBgTl0Rq1aHlng
	Edeec2RqVHbPQAZcLONggMB5zSMrzqf61MVnnCQLCudMKOlyU+jHh7vuLDdK+bH9hjsQx7IVzUqOk
	pqslhFGyNy6tFNKvZc18RctvnaimnZC8JxYgodxR8wTwHUOLUTJ0Uh2AEavRAg2eD0tj/14DszvBa
	GnZciLyE91B2bh5YQopzBZsYrX1eVkQxSAEHG/Uf/g6c/oqxapPzgK6ppGltMQoDU6bgYVa7ZM26H
	nRGwa06XaYOAB2ZS/JgCezUqEXr8bMG696icHMa5Cx4aj1LFtw5QWYGTLjex1sgMAV/SvSwl11pVI
	u9itYBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdNw-00000009ViR-20jx;
	Wed, 19 Aug 2026 10:19:04 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdNu-00000009Vhe-222D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:03 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38e08baf860so984013a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134742; x=1787739542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5JyEyakg047/qVI/dgdygc+uAR+XzDJBCS95evddBW4=;
        b=puYXl4RcHg5yXOhRqtucBMhw4gJr/N9EdSg88Ury2rFkGM0WXFab64eEZ3Tqt4i1ND
         6BRXVS0o+mzNRnpiO0AxQQWHsDc+DhjbfNFGeJQTn7+GhV52aBKZs50pu/EPB34OoGm0
         Ia4VzBXJBC0gFEcDS5WnjyugK+ICfgibJrZAYt7oVXvxrgTrDpYcDSVgSGKak2y6gMbq
         GKsAeHeXarc6YwHTYHoYb1XYDURNWLVQgmymG4juroFyD80y+/WIzcfx2RnmEwvWzXiD
         C6H3hFSa1mUkIbsx3OGlTH4cIIxw5ulanYj4MFr3hdf0+dOW7aVTn+DaBQ36ShseCJqF
         /5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134742; x=1787739542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JyEyakg047/qVI/dgdygc+uAR+XzDJBCS95evddBW4=;
        b=nQIwrrbW+NEajW8tWXr2GqnU8W4fKOKOLMW5XrOQ6dRAHvpWmVTQANz0z6ftOfinMj
         ezOPXGbgHEUQijlGySjDXA8KzbsVwHallJU/c2rmlUVWIc9gCsYA41Zf31Z9GEO359Pi
         /QPUnKqkEnMzq1/VePYy5FnsXkUN6E4pwgHID2dnP19nzq1jTT044Wy/ciZQZ4uL/Dtn
         +oMuzCsXRsXuEAOafdLvjYLxQEsSqdo/acGZk+lm3gk5L1tHK2REn+KuSX/myy8+3Kgl
         D8Ybb2AcW7icyAHJggxhEOg/X8nR/YJLg5FKu9WnmMdc+Z9fDdTaowJbMD0O+0FvHuBE
         sy6w==
X-Forwarded-Encrypted: i=1; AHgh+Rqj/E1lroGje6zLajGBQXBHhTQvKcf/H9elgq1OUozz2SYcEtpMiwUEbRhjp5Mpv6me57yAsCqUf2Xa4U+/y4D+@lists.infradead.org
X-Gm-Message-State: AFuF++n9yp2+iLbEg91/7sUVslcLITbk78HL/3mZEJbK+8cyCWH7N/sE
	MTsNjN7oO7HX5h1jLKNCR6vvjg5ivUqvoANPE1SxAHXbefkGOtG0k+6Yxp9e9g==
X-Gm-Gg: AR+sD11uKRW4la03IwGm+FWTusutqLAIKB5YbkopGApo+SXOSOgZ11p2qqNzwmlGVDq
	Nq9a7zB/SsATVCWqwmOfN+XIUKhzJXE+VQ+zUOzD3/64S5r/YK9TfzQfHtbbWZHmX3dKxJJXXGq
	NczDCaRjLHtVqJTdr5TGQRc4Ej7P5Qq7+cdKF4SuezPokh0kCDWAe7tr1BsXpslPI5PdhEL5PYw
	eRNftRtgtS5YG8WvRMNM5pjZ5o10K9TpSld/He1ar+UHRVE3FfrAw56U+EJYlODmkRdog0EiAQI
	+M7xOQFnbX2L83lF02EpqU7XE5/+WJiuF95yIPrGFO/ioeL5RiFAKV+lL7WgWKFJy4LVyFjtMBg
	8Yx0qSlW5JN2/MCEGvfAJbdt251gQzIB61QshWa98X98OwC54e8nUTIJjsgbfTmisbQ9hDgzUdC
	p6wRexRti5nHZxgzf1QvFxf4nDLa3H1EzwVK5B76QZ6pnDBEFsN/G3DHxo2TXCifY52HxSHecbq
	gHNsbMnuYu5yTe2Irx6DKJM1b84eN47n0CeqaKF09Gr125z+e23oOKrRg0ABDRviipU4HgsL5sP
	6M57NxGjivKuSNg=
X-Received: by 2002:a17:90b:2b4f:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39580f0d585mr7158158a91.6.1787134741640;
        Wed, 19 Aug 2026 03:19:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:01 -0700 (PDT)
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
Subject: [PATCH 1/4] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Wed, 19 Aug 2026 17:18:46 +0700
Message-ID: <20260819101849.68010-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031902_557786_2AF433DF 
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


