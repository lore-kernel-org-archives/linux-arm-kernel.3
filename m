Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B35FC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHFmktxqrJswUeFq/LOQ5JbIOjX6aGqDfIzsCeraA7E=; b=n9P88iVF0VTX+qXXrEd5R0fBCA
	97sBtVloy/1P0cAAdubkoi+IT6GWYJgnXyYGGmuFsFjPDNWdIoK4H8dNurgrCh5tik8H0RGEfVDHE
	pHi+f46KjwsTN7F+lBMWhpQiUSTPEguYtMGu6IhFfu0771nK5UGQKOEUeUpKw44GWsarqbbBZb7kx
	39N2xvRjqLBBTTyz4EKC2Uvw/2m+gvK+q+SISAATFMtxXY53r2QGCjusxSy17+uzNG0XOD4vRMsaB
	g1M2yr/3q4rqoxfsGnuUWEcWb92XAbJCofhXtzSwyVNPdhfcOxVTzlenhC/YrVYBpwE/uYQUfo7ol
	DVF4RMcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iJ-0000000BQB8-3KcW;
	Thu, 20 Aug 2026 11:13:39 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iG-0000000BQ80-0fGw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:13:37 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-848761b5897so814305b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224415; x=1787829215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHFmktxqrJswUeFq/LOQ5JbIOjX6aGqDfIzsCeraA7E=;
        b=UnVLnGXPa15PUG3HLLPw8IWtJkD5LXL/b+CHIHO9twMt9jUsm5ESSuJdk+GGnGK1sB
         6+XOFXQqt2AJNkSgUJmMR+bV3tUx8DrMRzv63Fh32AaowArYcKzVIaNlkIP2l/N1ECsR
         Wnrb8cJ05YhUKCTwYyZ2vgU0HpPKSmd19DbLksVBntGAPDmZUpzWdyoo412iqBWc4V4D
         CzsPYflGjRfJ4wbms/Z65UP7VFM/f6NVh0YZz0lOUKl0WQMdjroVPF5ZzCyaQpS6wwm0
         XaVc1/OrTUufNKw3Ey84aYEZma/YeNqV+t6trQnKOWQO4CxaVwz4W+WZpaCkwIgi33Wl
         /Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224415; x=1787829215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KHFmktxqrJswUeFq/LOQ5JbIOjX6aGqDfIzsCeraA7E=;
        b=h0E6hRQtf9+QmkAhrUg69FycLKOc/Pey2ZZGIwogRzK23B199MxTsajbqf3AaOxkbv
         LN4jvxVopzJwjwaoeitUREBY9JvBO35DWUlczd6yywM3ZYeVAqGCOvX18zNGeoTQMspu
         cI7UsjLhfqy2R4BQk/DsVKlMIvWWh81U2jqpwFYBhSo3qsnU/yHg+7deIo3lc3QbH76/
         9Gw8sKzbnKEp5yZxAEjuvJxicgRFrdw47JhYe9+oqv+12j4p1kLNLv8SifliLzLKoSdg
         wc6lxPS8p9fasqt/G6TZb/CONUpCImrMTXbtDcr1lf8KZKLVP3ThQ49E7KNw2zuPQVNk
         BtZA==
X-Forwarded-Encrypted: i=1; AHgh+RoWspwFh7F0hXuV+VpkZW63+CA6RKEOsXkUbxlFEILKk0Qdlb7CcgLeWdZ5Q3KXsnlA+6tKky4WMJaRtvmyHVwS@lists.infradead.org
X-Gm-Message-State: AOJu0YxkExQIuYYnhJ/eiZp0E4u9j8CFgtDeEtG8wMOipCTzM2d0XYGJ
	Y2xUWxvnVb4T1WK1bjBa+GRH9dv4cOR6LQa3EHS69NCi9IoLt7bIzbWg
X-Gm-Gg: AR+sD10DlhKEP25lshWu/hZ0Nht0jwx+J55KG1h8Pn+ibZz31atjOzdO8G4032LyYAe
	iTbehVmByQFslmqDfd5raEsi01CjiU3mToCCL+y1TGt4V32zXDK4a6V87eWe6Gm8QHdWt7WXhL+
	kCrFgzjfiZl255G3Psvt/4wj25vAj6h8/JK8MvncGxn2T8VH4KZvEPrWApa1WmGTIIrUmtinTNY
	tdTE3ZWhksz4gO3Bq6lrJXBnC/ac6sBvyrR60v9wOrkIYD1ZMYFUMCB3BQ6m1tq210AVrtGv76F
	vxBdfH3SlRFIfkx7I99iDiG6h2/tE5lA/dnfm9dToxoBXf2dNtK6bqGrOE7XG0vuE2gQnqrYJBH
	xEE1JsquycofFp//JY1GtrBCAAO9y7MqSfowf0rISSX242DxP83LGH4CAYVEEOt//xVLYe1hBl7
	97L6Dy7cFf+QgbKpmBmjSwaRkNQoUXZQ9zhobhGOLudPackfCXLz7gh/U02HOOWh3/dTMoNmXmR
	UuWe9BClRlf1qCC7oeMWMPM/hhsC9bimO7wnCOQ71sGwI4wcyUiC0NOniMPKHzKxB7Sh8rrvIMW
	Aq8Q
X-Received: by 2002:a05:6a00:a24a:b0:84c:5b65:ef86 with SMTP id d2e1a72fcca58-851d390b52bmr20899072b3a.17.1787224415368;
        Thu, 20 Aug 2026 04:13:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:35 -0700 (PDT)
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
Subject: [PATCH 2/5] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Thu, 20 Aug 2026 18:12:50 +0700
Message-ID: <20260820111253.97866-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041336_238666_90D757E6 
X-CRM114-Status: GOOD (  10.52  )
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


