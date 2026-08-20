Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE77C5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEPw4BvlvPjIur7O7WbNJIb0EAN2oqpObl5Gh2Ij5Dk=; b=NWu7ZLkNmdSzyhi9VHomjDMLVw
	9v9P5y9cVuK62oOHrALxkHeChVe0gZ9LYkHPCJVyIjmfCcPMbWlRiBZskphdcH5T8O2PbSbR1IiGz
	3Vdl9XukAU4nzv4mFrENCZxMh77MfxVwIttsNNCipq+ZtkvbRE5wfFZSXYfqxcc/IuLMyTWm5xVlH
	FJUZBY5mMjHWr8ou/SkbTGqzfO+pwdFG6S3wmxbJVWyHr6s/Qatc9fejtifWX92KGZJGtOaQBNPmm
	jKmQnM0olxSH4mcljRtVPpOpLagfV1QCLhXwo/PNH6VyaKJ9hUa5bMJPY+wFIoDfn677zP2OKEy6+
	kqJySg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iE-0000000BQ71-2Q5k;
	Thu, 20 Aug 2026 11:13:34 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iC-0000000BQ5i-14Ld
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:13:33 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso1227236a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224411; x=1787829211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEPw4BvlvPjIur7O7WbNJIb0EAN2oqpObl5Gh2Ij5Dk=;
        b=BaCg5C162CFwepMSsKEiIL5vBVRb6q8HUmyo8qT9+BXaCdulEivUHxuYvv4/Tzt8Hh
         TlGg/kthfRu2Pzw9WIjJr0SCy5RxJELW1u20MypqoS8fbslNd4zJLYfATS076VOX6Wau
         +WY7VAqYYt4nIaNLQqAKhsA1T+y+/YkjUrtjC0WKDGINyjHin7x1aHfoYpek2jCswYdg
         d/E5uRqyVm6oyvHnVrl+PNF2x8XiOusG2uSpdTIQty3psuMMdII/vWuRZWqOAXYQsF9f
         xCL0OSG7sXDIyOWyrhfL3m5lkwA8IZ10fm6uXPgLj21CGdLus9O/iWIMt3Hfs5D/01UE
         wlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224411; x=1787829211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEPw4BvlvPjIur7O7WbNJIb0EAN2oqpObl5Gh2Ij5Dk=;
        b=leiqVDVeSxPYyyZz6tS6xrI7I/Qr0NM1+2AdU6lBPfyMZ+txRXAvYCaQ4frtJa0Jhm
         At6/zlYKZ9OxWymxD8vK8TjJnmM25ht/1VKKuuo1MIeFoe3ZvaERvY49w4GoBaNb0VPi
         fVEU/RLYBR5TpJkfJmrAVSqBNlmtspH+CU+8R6Hy12f9QCssDDao3AXdziRuhaaZ35pV
         HXlVbKCdRP8y6UJ+vpLNx3bgb7Cdiqoce//yLvhuDYwWgRbiskcLohkU5CIBxeIl/iDa
         ZNas1c9/l2gjbZBnsPZW8luCn5dWImAEfLsQfGL+2LGabxBmH72Tqf/l+rODzjeZ5ThN
         tkSw==
X-Forwarded-Encrypted: i=1; AHgh+RpI6QdV7lExZZpa4GZLS1aOSAWci5yfA8yZESFo7cRdYr0J6vden1v9+fYPasej6Cal5nd3OdzWFTLipE4oVAJX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvc8yuoVfyQ0Cd/pjPdFYvo7VrEyWHa2EkTZcQm6sxUViKbSf1
	+97FRVOGYvmBihzXtWn6gPvlIxLK3aFnHincPENjVn3q0hMgFi5sDANt
X-Gm-Gg: AR+sD10qssYJNWqzjuA2b3sX7cAqcDMhYktSJNhTAoBkRhkFSNqlCVtPFpBpBjN4l5e
	hO8gV/czkiAPo1eVed6a/XFgqvetM4DCxh1YCT5AVQYq/NcPsKYFgwQzgqF1ZGYNKUEzXnG790U
	8csuwshHsP+xT0lv78NPjgppsDMVM3ETQidNsS/4/FvAjGOZP4ydHQ8P+/877cQvv73fSHVjH5Q
	c60C1N8bdZze4DryzdcNV9y8y1c2cQxjslnHn4V9H09ei4DzwaT0c0KCh9FvyB7JbhtxNVIzjwL
	ZixIw3RszFaEmi555mGfbe13LPSXgp0ppUC+efiteEnxUw+ySFVQNXjUkxLTD589hoEkr4AJcha
	jjkvomB8Q8Thagtxdd4GfxJhSyS69RMoQEzDISP/8T8mZ84PdSWGl85dzyZPBKmTCSgbCZ5cH9V
	09Ftlme6pWqL7wUosD3YH5sG8V2L+MIpkA3DCACckvbomnq6s3W277bBj1pbDHhg4u0ENwJQp5k
	/znZLSDEgFg5EquiUkiiahc3nS015xPYwQFvLLU53BEM2JoT+pKVaFaVA5mnZxU/M0Rj6bwkn1d
	+hGs
X-Received: by 2002:a05:6a00:14d0:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-851d384706dmr20743184b3a.7.1787224411118;
        Thu, 20 Aug 2026 04:13:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:30 -0700 (PDT)
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
Subject: [PATCH 1/5] ASoC: mediatek: mt8186: fix APLL mux setting error handling
Date: Thu, 20 Aug 2026 18:12:49 +0700
Message-ID: <20260820111253.97866-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041332_348604_C2D7077E 
X-CRM114-Status: GOOD (  12.06  )
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

The APLL mux setup functions return immediately when a clock operation
fails, without undoing the clock changes already made. This can leave
clocks enabled or muxes configured to an unexpected parent.

Restore the affected muxes to CLK26M and disable previously enabled
clocks on error before propagating the original error.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 50 ++++++++++++++++------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index daaca36a2d08..aa8b2eaf7b95 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -98,7 +98,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_1;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
 				     afe_priv->clk[CLK_TOP_APLL1_CK]);
@@ -106,7 +106,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_TOP_APLL1_CK], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_1;
 		}
 
 		/* 180.6336 / 8 = 22.5792MHz */
@@ -114,7 +114,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_ENG1;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
 				     afe_priv->clk[CLK_TOP_APLL1_D8]);
@@ -122,7 +122,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_TOP_APLL1_D8], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG1;
 		}
 	} else {
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
@@ -131,7 +131,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
 
@@ -141,12 +141,25 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 	}
 
 	return 0;
+
+ERR_SELECT_CLK_TOP_MUX_AUD_ENG1:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_ENG1:
+ERR_SELECT_CLK_TOP_MUX_AUD_1:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_1:
+EXIT:
+	return ret;
 }
 
 static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
@@ -159,7 +172,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_2;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
 				     afe_priv->clk[CLK_TOP_APLL2_CK]);
@@ -167,7 +180,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_TOP_APLL2_CK], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_2;
 		}
 
 		/* 196.608 / 8 = 24.576MHz */
@@ -175,7 +188,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_ENG2;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
 				     afe_priv->clk[CLK_TOP_APLL2_D8]);
@@ -183,7 +196,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_TOP_APLL2_D8], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG2;
 		}
 	} else {
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
@@ -192,7 +205,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
 
@@ -202,12 +215,25 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 	}
 
 	return 0;
+
+ERR_SELECT_CLK_TOP_MUX_AUD_ENG2:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_ENG2:
+ERR_SELECT_CLK_TOP_MUX_AUD_2:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_2:
+EXIT:
+	return ret;
 }
 
 int mt8186_afe_enable_cgs(struct mtk_base_afe *afe)
-- 
2.43.0


