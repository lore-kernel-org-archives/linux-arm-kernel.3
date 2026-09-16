Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D512EC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6bmQtp3Ds5+ZJWXFpufINVse/crG8NXJOilyMFAbqM=; b=0oCsY+04wV+fz8OBiAXezakgeT
	fum4ggs4ydNX1cjN21O2+iLsTsPziO36o9hCSNkoPaUTinXjDQuMtZV3YchJE2cKCbf3mwYJT3eCp
	5R9aiF16G8alxcUNssiWdxsKIqfreZxbDUAMfUlxUpI93+VkQtuirxKW8sPamE6mOT3Sf0vZwBZz4
	m4GQJ+sVaSrO8xksb/vbvT0zHJDp4pDAcYRIxjMTSDOYVFyK7/ZWeQlBcOO4nb8QibRPSfOLJxys3
	DrUclbrNJDErXU1pzVyIp7CdBbZUU+GP/E7/S5cXNLnxSfrbDxxXBVhidzuJ+i5pvGEhmlIHmLgDW
	PYBsoigg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hmP-00000008LtI-3t65;
	Wed, 16 Sep 2026 05:01:57 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlz-00000008LbK-0eUy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:32 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469b35611so309038b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534890; x=1790139690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6bmQtp3Ds5+ZJWXFpufINVse/crG8NXJOilyMFAbqM=;
        b=R0YcLpTjXvXrfofytorsHVcqQGKE113aKeOgjDslAlE61QiRHh3D5KPQU8QibC0oiE
         L4UkuZ9i1861x85S6qpKoYR3Yo+lDqHNnHg8ObeVbF040sBUpebz8nlmkAKm9leJryAT
         Viu+EukEX//mP4uPHSRlRH2kycF2CoAlu2xrdDivd9t1evN4Jhr8F6s4agqaB5/LcxsY
         Z+whIiol47pj36YqvfVHOvax40gNpLKR/dTrvI02BDjtncnr8sKNzrlRbXEACDdIeMGu
         L6wm0e8sAZqOQsUHJOpKpRnCKshbdIPkfJ57g/UY3vefkiIgAyx29U1RtqP2bakJ0wfg
         5Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534890; x=1790139690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w6bmQtp3Ds5+ZJWXFpufINVse/crG8NXJOilyMFAbqM=;
        b=kv3YzwiwepvPB/mBVp4Zr3MoVzhhCxUtKMS9aBVa/25rI1Qewga9OlTKCQOkYct98E
         BYrRanJbY22vo//uDhFk09hehjwx83jKMViaFvfPpz963OC+xhDaPPLbk7vnvP9rnmzZ
         UYrdj1lPTCYfcd1cXIit2Dox40VQMbMkJuW9WIXWv2pOSFytaL+smGfeavba2Ku2F3tt
         pYhIulTrGMvP1XINlOlOsQRdKfGXAtJFEVzfH51WXhXEHlBkLOYqFonMvlFTDhNuhluJ
         bev85yIWZBeq62o1yf3E3g1QWK7FX2GheBLf+wo5BIcdJLeTOyTGf46RfsqdnBBAJ08b
         6Vcg==
X-Forwarded-Encrypted: i=1; AKwUvByaP1NLTZt87YzXUtWv5Gp5F9RnXs9NQZ8wL7E2I5hYZFqRp83pIIe40qwEHWPitEjJaFWZyETGrApZnShzxUdI@lists.infradead.org
X-Gm-Message-State: AFuF++mC9WPPV0zq22GLTok0QmRkqEb1/Hu334MExWo369sLfdvlSpuo
	EHgn4jUgRIHRPL5tHyTz+F99fVEDTAwcUQwtrNBZL/jUOhmrCag7mtpf
X-Gm-Gg: AYBFou18IusKmcIOZFhmiJkbPYRndkWi7OIDuCKTC6vtYuZLxcLFlKu9sHFQZWHKDOA
	pSv2rN7FZnknc2LYD/qUtIzNhLeRCyVSmwtikSGZPSrAcGht88n0u79ycA+43cWQ6Yxu5WHbYul
	8uvvKdWQ/mRfmiemjtRlJFvGnAxfuv5cWKCbWCsm6N0QO8yat6UDVlcx3lwMLCexB4nau0pEpQ5
	HYds26RW/JfFtx7v4BWW86UlvEfcHs4uXZY0/hYMlCWfMSZ6Z/fZI5+2hgZ/rnraz7JKnJJLzJp
	sJw6qjTZu8nY7AALQK67ECDHkVp2aj6lhwzV6pmJAcar2yPmJc+s8z6Ufyai3RDwtQY6j91ZTDu
	/lmx6LIEibpqGZG6G1vGgZxS2F7TB01f/iMg5yhr3H8IURNDTl2eGgdihshCv6u4HrSqcEiWkyo
	ElKoxDI67Ys5N6PkQEGbr4Tv1bXgofwae8OvnDmJjscR3aOC3e8eax1BMfD9gYWHakooh4n5tPn
	CgmM4Fptf+rcMZgeRtAQph9TOm2eAK5Crg4rAKQBQqwAWyFMbrR9Y9Xcu/xsonpeJRQpxjELfnp
	5HrDclmgvHgZa0Y=
X-Received: by 2002:a05:6a20:7288:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3dd5f3f9548mr2947733637.2.1789534890268;
        Tue, 15 Sep 2026 22:01:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:29 -0700 (PDT)
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
Subject: [PATCH v3 10/12] ASoC: mediatek: mt8189: Validate sysclk frequency
Date: Wed, 16 Sep 2026 12:00:17 +0700
Message-ID: <20260916050020.14575-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220131_227117_484F51E7 
X-CRM114-Status: GOOD (  11.72  )
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

A zero frequency causes a modulo-by-zero error when validating the
I2S clock frequency. Reject it before performing the validation.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for zero frequency since freq is unsigned. 
Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 8cd5ddf62d46..c9e80ef42f60 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -1287,6 +1287,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 	    dir != SND_SOC_CLOCK_OUT)
 		return -EINVAL;
 
+	if (!freq)
+		return -EINVAL;
+
 	i2s_priv = afe_priv->dai_priv[dai->id];
 	if (!i2s_priv)
 		return -EINVAL;
-- 
2.43.0


