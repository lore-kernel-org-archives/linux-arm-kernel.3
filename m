Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8755AC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 04:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QLhY24jUWuW0UFPT8wZxIclDsrKF9CvBHKSfEU+hkw=; b=2nY63uhhmM1S56EVOUiNSAedRz
	Bq10HfCIIob26DIvyH2dHydIlxCm+IlbGn/cfs8UHhR6muI76AI7A7elmAGVkICJRCpOB0o+xOlnL
	muRFPEiPuqw3xCwNhoUmZ52ZwK1qjMl6Cn5r54vxyQBoFABBAgeDVQR6+ttbwk+NRkBy91ljqyIU4
	j+29rTOO/xJUkV4bzesEMwKFXKSELQhL6FKBelJwsCgZ+A1c6XePB8c0CX7uXpH5EfRMSLCanTEY6
	kJ4czbb2SMCJlef6a55fSNDtH/Bzvt8i8UEDtsX5cWZutwHguXOpVhH7iUeMnoS3nQa0OV0SEU0t5
	BFx1oAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRa-0000000GLeD-1KaI;
	Thu, 03 Sep 2026 04:52:58 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRX-0000000GLbK-0ouA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 04:52:56 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso1800791a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411174; x=1789015974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QLhY24jUWuW0UFPT8wZxIclDsrKF9CvBHKSfEU+hkw=;
        b=JFJDDx+wVbxidF3lY87/iHmQMGtYRt5Io/AznKqXjTWIGvoqdmiKINXEAb3Pb+IAU0
         PuNf3YTfbSYGqa1a65ky2P8UdBmZd8w/KVvwuOFPi9TbDotfOEwNx0Ttk93GtBCrkgqt
         0yFv/can2BXicT3YyS5dFX6zMxleb1sJqUci9z3/htbkUSvAFXARVCMpzIwb+L4VaXLq
         Bs7+iEa3rSKuIqCo8S9Fu/Fr1ekyiinrT01j3GYfNILupz8jQtavBvBTGqp1U4GEuuY2
         DmS34Sfb0oIsM6zyS9KnAgHSMZdDv+dYJ4+N4fFLTyUoTvdxinz3WZg3xYh+9DMjb02m
         rzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411174; x=1789015974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/QLhY24jUWuW0UFPT8wZxIclDsrKF9CvBHKSfEU+hkw=;
        b=Iv1NsmVucEjS0ii9NgLh+KzX5acni0J+UMRbFS/GPPmNj219yLaxT6VDdQmvKlSPHp
         +cTgpZZAQieUL44ctijui710RZajbnsVdcQbhg2RUPnkulCpB3+UBFKy0OscOc7oMGuQ
         mGBzB2ibM5SDwMalX2KpRYP8MVcsdOixSgSjhDFxCBnLpuHpPxt4XE0JfEURUNA3uwmA
         d5AS/VFAbUfeOZ0A7GQgUam9CZTtJZIAeJEjvOgTjZe8FCBche0Dzy5k61RKnMfGvVm/
         AjQvur5pRenDiZzaOHYughAN8lx8yJVg1W5zEx2+U7GNDYGXrUTVLsPug3Gd8kk3rFtu
         Ln2g==
X-Forwarded-Encrypted: i=1; AKwUvBzXzKH+H42iqwG5Oy2Fd5tV1VhPN2jbD1mfAF2uyIgzkArggMKCHU9ToQlZWppRU4933ccX52v53v+UmqyGMJBZ@lists.infradead.org
X-Gm-Message-State: AFuF++ldE7W7FEhbJnvOJL4jPfqUZC7RblveYfG+s4ZEUaaaN8NPNX/e
	TYf8/o35snqvzwNVcWCxpPMQ3JUJNb4mwmMwtC2L+suaYEVMgFmn4Cn/
X-Gm-Gg: AYBFou3CQq1z72iIkE/i2ryrFoFM1+ostrjkKijj3HW9PqEnRl3KaXTM0R2LbtNTTjj
	gLE4O2qaLPufUpNRbkJI7UIqt5dQ7DH5r/a4MklNsv0xLJvChFRpSI40yMAlNQ49MjsfOrmt/q4
	gX8OFGuvLnKBVOsBSJuQBanxmu+Q9R4FU/PBn4Z5PZa8wLeTY3jtu48Y0AJAvaF5sFBXFPt+ECc
	7/BGps+VjN7FhqyzngLoIzxj9zQkFN1eaqSOG66blIiilsAK6bjQKzXq7T4saRMzj8Jm6ABVdXL
	QrXxdmwBU3goCFSoCvE/OwiyZ/pfjrsswqr0GdgWsyHmbWOJA9CCnv4Y7LMPxp4moUdfh+LKeHW
	a1HcjPh9t3PmXjdvUwdkFS5YKP45RtvFI1k0s/9tgldD41GQyI6667qm+ukc0mMdytLCDDv3RfB
	1oYm/R9iNHOeIV+nobp6wKNYNHnirSGOX9Ijf9P3s1jC6La77+B/XLqScq9P3MTsEDG6fUUYTur
	MhtrYpiDYe0bsdbwJdjms6+ZH8JprZFNLROPdJaW18gHgA/clcNEQrtjFLBb60NtbJPtcKTyFLH
	pohO
X-Received: by 2002:a17:90b:3ec5:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39aee172d61mr14055157a91.14.1788411174299;
        Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux disable path
Date: Thu,  3 Sep 2026 11:52:00 +0700
Message-ID: <20260903045203.175337-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_215255_243628_1304977D 
X-CRM114-Status: GOOD (  10.62  )
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

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - In the mux disable path, remove the goto labels so that all teardown
   steps are attempted and any errors are only reported.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..dd1a5925af96 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -271,7 +271,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
 
@@ -281,7 +280,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 	}
@@ -298,7 +296,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_1:
-EXIT:
 	return ret;
 }
 
@@ -345,7 +342,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
 
@@ -355,7 +351,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 	}
@@ -372,7 +367,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_2:
-EXIT:
 	return ret;
 }
 
-- 
2.43.0


