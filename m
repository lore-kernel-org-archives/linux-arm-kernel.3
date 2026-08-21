Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9676DC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYYHob6Ydur3f5fIO7z1CwtF7crP/M+VG3L/vmLd3WI=; b=sPDNdQIa0RtljgTsJgI7XGoUQz
	Xq/YIbP28tX2RW5iSdHSDAzaVCKjGVLKYs8ijGVjRzbRuQgDMyqhOhSiB9mP9RoEGhw0imASkORWr
	zjLAHnyIgyBCjM/BVdI2BLcezcVvLANfYBPLEZOTmcuhXfSgFkCl0AqQA1KPbGabWHByiNEpYtBTo
	4ZVje4dHnkuR+TyaYrLaSbzWs1W8jMlyaXzBv9Iif/OkJrk8UjPri8jTB2UZK1TK+n4dxo2Zc/+CW
	FfxoWCB+7duEU8ajNZHO/Jxa2fCaZIVawH06+F1KrnoY7nc9f0fBJwdvlsr2E+ljPem6xzxAVk/gE
	S12cNqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOt-0000000DKFd-0SNy;
	Fri, 21 Aug 2026 12:31:11 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOW-0000000DK16-28ms
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:30:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso10222595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315447; x=1787920247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYYHob6Ydur3f5fIO7z1CwtF7crP/M+VG3L/vmLd3WI=;
        b=dJkyQiChr39aSmM5ZlDSx/r0BijNkpUQw8Iy3JJ2V2HEOtdcz0arM9PGeD6IGKT9i6
         RqAwldchlov6mZHbufdBTuZzkLKGP295pEoWcLKuDEM7sHTB5JHVvNzdjJuWdo1gfarB
         ciAuVlZHaNwCasKiM9A4sE6kgaSYxbsFjLMbquS0QlI0PwKASXPeagG2SHs/D304DkQf
         l0X139q416n4Ghs4cbEDZ0Jy9z+13HHBzBwlKVsCOJsBixXuer/4pp0TYFDrzOEhZexX
         sDWMzbdJgMlIr2D/Cg1338vTVhTLyF836jqxJAxUQdRUp3aAFvaph9Ais2vKN9sA9l7J
         pc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315447; x=1787920247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYYHob6Ydur3f5fIO7z1CwtF7crP/M+VG3L/vmLd3WI=;
        b=BQclQoejGHmgXdKDU6/1yymJUIfrzcTHsw43/ht+lKNwykw1x2eUVZNbwLXNlJaLLc
         KsfkqjXhRjkjhHvmK6RleN+6/J5tLdOzffuncmTiTRAr5u1e40FXiK0fKh18U7Y9teIP
         t1M7DHW60efvW5oTylRgHYh7NQZmfMttuDXXaW74bUASv34cTCBGWUzzmNAfH0Ehyl0E
         dpuYlRwi8zUMmO7y6UcvdjYSbHJcandLj2/OJgUTMRyYpXtwhUOXWkGZixBNnucRURqa
         Cw2jDBRaldtlLupxLninNotMrqfQdfKLqG39LfEhb7yun0FY0sxDLWPitm3wUTuGqQNp
         n7Ow==
X-Forwarded-Encrypted: i=1; AHgh+RrwgK3dGsj9vJ90S1xo3zzSnM2MblfuGEeVaYIi3p4bUqD0lJ0irBDXeF/9YJbt/MDQb7EDQetZQ6WQcxsSPSVb@lists.infradead.org
X-Gm-Message-State: AFuF++k7z19bsW65f4X+6km+5gH1gZSdSLvMJQWTWNfAIuMY2YK4Qxdn
	+YuQCOKhoICuYQIat0MMD1qa0OnX5BUH2yu+qdeQq6NTfQeaxOh+xtat
X-Gm-Gg: AR+sD11mp2+WIkpGFhn6wzU2lui7IW51EmB7UMokWD+c/+1HDWO7b+8zXaqYAfmo8Rx
	74B0W043FlmcfcdhFzvMyArgw4ed7y5pWGhTXIs2puKNdWbe/9g7FqGfJDvsSRxNX8RCocdFC7L
	O2RPlenFe+rl5duNceAzpdVrJTgQZBc9HzajUY4+5iwlOqNEb4/slDyjzTSx+TMxPNoB9B3WhGE
	CepXWLowVpNtGZ33h4L1HVA1uS/sAsrUtf1UJzUcw8/mIVsEjk5DWA76d88A+qqwiKAGvxI1nR8
	UGDWVviH0Vd4JmwGZU5cyNNQEyRGJN0RkEnbqsbXy+tYCxDriXZqQvK7U00+1yeAlBX7/2t8H1J
	7jL+jZHpJza9wlXjigZqw5yA9TDC83cRHuQ9XMG8KP07Op7WtDXxQWVy5/1uyQzGwUdAt9TtsNe
	ylj6TkdropxoAsFKIfm9fQf+lba4VtYx+q67s+e0kUigtBtSbiq44eOdG7OfY7mCamj3igOIm/5
	ppS9YhbM69U6k0Pxz+hnk5Y36bRzb3DNdtekgDxcW5kd5qU9xlcXfP+H1uJdU8O2cSTSlG68sMH
	jyvzvOgaoUJGdYo=
X-Received: by 2002:a17:903:390d:b0:2c9:fb11:1bf4 with SMTP id d9443c01a7336-2d64af4eea9mr121346745ad.7.1787315446434;
        Fri, 21 Aug 2026 05:30:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1besm18302235ad.53.2026.08.21.05.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:46 -0700 (PDT)
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
Subject: [PATCH v2 2/4] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Fri, 21 Aug 2026 19:30:19 +0700
Message-ID: <20260821123021.41390-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821123021.41390-1-phucduc.bui@gmail.com>
References: <20260821123021.41390-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053048_612668_8270F7B3 
X-CRM114-Status: GOOD (  10.46  )
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
index aa8b2eaf7b95..94bcaf92e396 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -294,7 +294,7 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto clk_mux_audio_err;
+		goto clk_mux_audio_intbus_err;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -321,24 +321,22 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
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


