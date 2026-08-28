Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBF6C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1BDXxXSUCLeZPbuvphrpbuZ7FoRllZXIG8FCJIUlfc=; b=hXlEs3o9a3n6XP8geRWqYgKt7L
	nYcg/ZjCdVQaoLJyX65uVXVYAISIGlO2JEXeqQlCrkrrGY7ISXDWVRggNHLqSHWmrRvQzcxvCenou
	vJRQJ9WP+tocP5lUgXTK7LWrBUteIOv/XbLH03Yh5mrp9PBC83LFDeKrg/I2vrilUgo+ljnrjgnbp
	TTGu9rvOBlVuA+1CJjleRhj3yw+PUj3kkn4jTeHlyToG2qn1n1yt9QYXSWcBvKlHUMp2vAn66VYkg
	t7/HbJ6HJ9DLDIMr6NMwAVS1ddk9GPeAxl4XOfXh2Q7EK/mkzW/Tc3xnp3D9r7My+X6KYE05yxNZy
	1Ea7ZSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshA-00000005QQP-0TPF;
	Fri, 28 Aug 2026 09:16:20 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsh3-00000005QKS-06qE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:15 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8534d507f59so743691b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908572; x=1788513372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1BDXxXSUCLeZPbuvphrpbuZ7FoRllZXIG8FCJIUlfc=;
        b=ZXD1kdMFTC4TnU7pkODE55eHsL+UW9XLMCHpBF9O5OkvArk9XrIYfEljit65oBuAGD
         mCPfSC7Dcs2o8ujurJMrmxh4upvvRTCyrsGrMJNsETn82tLxcghLetyICntPhziNT0uK
         bJbhvuwOtPYd9jXp4P1CP2JOJXmqIb5lfE8StBODSX2sKl4hX5pvwCXDPACx6KnHCnxz
         WzCUdiyLoPFAnnSXqroj6IX6l8k0XGt6jJxzqTSl4akIyp11dz0yN7AjLDFKj0nCcDFX
         0T8mHh4oykiSbkcadlodQuqroN2t2DRsDtHO+H06h8Z07NqZLnhM4lg9ks3RyCmqsAGw
         a/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908572; x=1788513372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1BDXxXSUCLeZPbuvphrpbuZ7FoRllZXIG8FCJIUlfc=;
        b=H9BV1sXWvCSXsMnT2mcAboG+ClsVuYpHZKjFef0mQWsaT9Ze8XAuwlsDlKMmBJGu8g
         Wvd9beSZeWjf7+JbK8YT0aKzu6yRGLfzeMcPu1dWhUB2kdG7yrfAjwlDYusoEyynmiRF
         ZJ6RX6GS2sHtTFGDdTstiA+t9z86GNy71WqzmU8vXyCoX5Zc2GKp4cuXNQKn9i6PUiXc
         1lES/jXOICvqFwz6yYUaO/fNyjf71nocrZJeq9NDvzVS7LU/euM831xp7SP9hhJ/Fca/
         sHwnzMXu4QA3QAJLSkpKuxq/uVla8iqOB2lb9J1gVW8+G0wL3+3A4Oh1CKRuVmajPFc5
         2MsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrpo57xQI/E6ZUCwEEULmARcNTrCmaKhBuNQ82xQ6KgmUzGTIH15XUetVD6OIoYG3tuSFpucBx4V/ZWmyZ3f7gv@lists.infradead.org
X-Gm-Message-State: AFuF++kzXBU/VeXK8igSVf94cZt3pYy4haHL+9n3YwM7XMynBdsxh7lF
	lIDc8Wg7MRIulxG06pf7wg350920kr45jBKbtNVsrDXyczKuGCBQG83v
X-Gm-Gg: AR+sD13Jqg7OYWWVP4zxgHIURqCVG7Sk3eo8BBz/kwhN+5gOhlqZkJXKzdgEIx9ijqm
	OFmPpvOv5QPYCiUq/SujOM2X4KBVgn+f0TFHoniNh1okVgJDWmAFJ4v6ra82HrvU4FlbIxNLW3r
	txaBAoGoOeiCrC6bjEkOl/myHHdx1D1XA2KhFHtcJWHl13vC/oJk3Obnv3DysqgTUtYZdlFpDqC
	teD4uddrd9SM5qFdEfVbmGVAWuBvjeHsFyOYaMLY+PJSMSot8vL+Q5U3TmVG4tIwgdcCRb5Gzwu
	HLUW53/DrkbU6wPvSyYkokk6snt33Wi7gy9OX6EkUQNWmTtpjoEjZ0uKKU4o7JgEcdiJ94fgzGc
	PuCdmlRKPnc/NzVgAHikvoh0DhmlvxnP0lhy+GHJuo/sUhnavLHMvuayxIubTB0KUdXDQj9fWy9
	K6rYeXl70/RtgZ0YMHjW4S2dkyeumTjc24YFTvOIH+U2fg6W6sQtIoAtnHI/ZJh4MxIbQOGwU+3
	2MVoSDRQ5ljBU2saf5wLmg/myqUfKg0nLnpEfu0i7/6LnSooeLhrfsX5ZYTJVE4jv9S+TNOqPpa
	uBgG
X-Received: by 2002:a05:6a00:1143:b0:852:131f:b9d2 with SMTP id d2e1a72fcca58-85626f06db3mr10697213b3a.2.1787908572039;
        Fri, 28 Aug 2026 02:16:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:11 -0700 (PDT)
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
Subject: [PATCH v3 3/8] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Fri, 28 Aug 2026 16:15:27 +0700
Message-ID: <20260828091532.600047-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021614_320681_677DBBC6 
X-CRM114-Status: GOOD (  10.56  )
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
index a517aa67abf6..b3e938088a7b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -296,7 +296,7 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto clk_mux_audio_err;
+		goto clk_mux_audio_intbus_err;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -323,24 +323,22 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
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


