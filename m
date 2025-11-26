Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48491D1037E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 05:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=; b=Mb/V7VyDWs8m50u746cb4e6lTc
	Fm65kIN4sGm4JXfUrjA/pI9H74Lx+H42135h2rRR0JKs0+khE2cVkA+Vn40qWiBnEjk7EdSiYDc6A
	wms6xF7QPvMnjZmdkfylIbfmMnFEM59LXTqKdW7DqSblk5+FP6gFm5xu6xMyaX1Vl5qNaU1morE5Y
	xavsJz6Sr1fiXsZiuilGdkUNRmoN4/SDlS97mgLjq22x4r0bkUbTKoKu9CLb8brAdkUnLprXg4von
	DWLyXf70SOZKWuBCgOKPNQyKHLcd8G7aTu20ABd6GgA1wc68/ekkm0pKKlBxmjBXy+g1liUTRedIg
	2O3iEjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO8He-0000000EPAt-2shf;
	Wed, 26 Nov 2025 05:41:42 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO8Hb-0000000EPA4-1xkg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 05:41:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so3524789f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 21:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764135697; x=1764740497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=;
        b=iNAfPyavoIsky3lrkpUEssx7UqQE6LVBOlcCLgZt0LXIWlBi8cQNCvDo6DwzcarMRI
         IT+Jpl/97Cz6whdP3T+orFGy/wteHwKltIyWwyZsT9yPnzuzuvigRHUnkSovgsiRG9Qo
         7Iaeo1FS6ggozxG0Sv3q3JRLA0lXkGT6Z0bndvUASB7/DVtLeoky28lWgNDap3yYzR+M
         uiqKUzGgvkSgAHQrPCKTIZYbMELPNLPFW8R3/4N9qbxpFBSJOvoaW3OOlnJn+yl1TpBe
         SKX4i89w8xIEZY8FIuoBzLLoaJ/aqnp3+OPrnkXWehe711nse5uHrzK0PJoCpUmN1EY5
         3g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764135697; x=1764740497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=;
        b=vvwcIh6stxW9LzcaYYVVLCNpaqj0kdDguOYNPo1XqMSxzJSYJZ2C6xbSMdlOQ1x5oA
         qDek885J+snsOxOU/QOh0MV5dqhQT4vzPJR1PG/LpFLmlY2T4hdHTyipoGaqb6Js2BqF
         E+MBW8vl6iHbrFrbeGarHcqDQzwSOZOTBgYh2Xbsme30M8dW3IcbY9WTRvOtoQCsRze9
         1OxLK0p9jwLpepy8dnrAEtHIGf6vVah5bgnO4EU/xyBIzhyGDCmpBBM5d0s+AKtf8xoN
         BjxdwHYh1cSdd321P+VD3uB/Ck/ruOElKVtnZOb+KJYsGApbABVszOj9GF7+Xc2MgRF2
         JMNg==
X-Forwarded-Encrypted: i=1; AJvYcCW4vD491oTasIFjkp/bVFvJW1Kbt1oRaRPJQsLDSKX7p+5JVdcCrbSbTriLCXQYk2e5/B6XruU3q7TlrZNHeAWG@lists.infradead.org
X-Gm-Message-State: AOJu0YwDAE71Fede2q9llwe1tCjUhAbO77nynACu2ydUnqKfZYSHpDuQ
	YDXqynIxJId1LildHR11woz5aZiqopBHekN5M/nRiBmqSBL181qwWxJY
X-Gm-Gg: ASbGncvJcKihU6nlcze8os+3u/wvrLPWNpTpJ7RoOTF3Jhg/k8QPNW6vwpQvUJu0jbJ
	/lmtXG40NB/stOgOWFvkzExAUbt/EdQwrlYk3KsUYbIFVgxdztHWsgR7y89rGHM4/XGv7VtFX8s
	cwWdKoWXo8Ixu74EwgpAFu4bXfO2qRR1ewP+ffpzQKUa9qC+ZiTgxdqYFzwFaN4SADa0XsBQOWo
	HH1YPupLq+R2L8EtEHctTU2o3ZTuUDTRZQnMq7swVMbmDPRzA2M3p3q1NCf3hE8O+umPvWaVEWb
	ItL2fCtRaZXa1h5bW2a/Tx/aLsXm+ExCExIpdOtv8BWnXO3rDZyg7qPvoaWxYA3K06hcim78dTX
	8QWbKVPQxaWb7CwcMrYi3YFzZueaAgLAD/K1PEJgAXmQIWjMq5/1AHMo6558SBj+l9L4K1b9WOf
	8ZLr9E6XZNCXkD
X-Google-Smtp-Source: AGHT+IF5V48oVy47DDAvZnj5lN2hPNi8IKQoV7v+luO0VgruXL17m6le0MnbAaH8JmcsbJdk8AXskQ==
X-Received: by 2002:a05:6000:240b:b0:42b:3661:304a with SMTP id ffacd0b85a97d-42cc1d08715mr20198687f8f.38.1764135696988;
        Tue, 25 Nov 2025 21:41:36 -0800 (PST)
Received: from gmail.com ([147.161.143.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f363b0sm38658536f8f.13.2025.11.25.21.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 21:41:36 -0800 (PST)
From: hariconscious@gmail.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: optimize property formatting error handling by using scnprintf()
Date: Wed, 26 Nov 2025 11:05:02 +0530
Message-ID: <20251126053500.56353-3-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_214139_514340_422D7235 
X-CRM114-Status: GOOD (  11.23  )
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

From: HariKrishna Sagala <hariconscious@gmail.com>

Replace snprintf() with scnprintf() when constructing the property
and remove negative return error handling as scnprintf() returns the
actual number of bytes written to buffer.

snprintf() as defined by the C99 standard,returns the number of 
characters that *would have been* written if enough space were 
available.Use scnprintf() that returns the actual number of 
characters written.

Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch optimizes the error handling part of property formatting
using the scnrpintf().
Removed the error check ret < 0 as scnprintf() doesn't return the
negative value as per contract.
https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.scnprintf

Thank you.

 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 44 ++++++---------------
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fd4f9f8f032d..77c58c9ec3e2 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2652,14 +2652,9 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 
 		etdm_data = afe_priv->dai_priv[dai_id];
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-mclk-always-on-rate",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-mclk-always-on-rate",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_u32(of_node, prop, &sel);
 		if (ret == 0) {
 			etdm_data->mclk_dir = SND_SOC_CLOCK_OUT;
@@ -2668,24 +2663,14 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 					 __func__, sel);
 		}
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-multi-pin-mode",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-multi-pin-mode",
+			    of_afe_etdms[i].name);
 		etdm_data->data_mode = of_property_read_bool(of_node, prop);
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-cowork-source",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-cowork-source",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_u32(of_node, prop, &sel);
 		if (ret == 0) {
 			if (sel >= MT8195_AFE_IO_ETDM_NUM) {
@@ -2707,14 +2692,9 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 		dai_id = ETDM_TO_DAI_ID(i);
 		etdm_data = afe_priv->dai_priv[dai_id];
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-chn-disabled",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-chn-disabled",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_variable_u8_array(of_node, prop,
 							 disable_chn,
 							 1, max_chn);

base-commit: 30f09200cc4aefbd8385b01e41bde2e4565a6f0e
-- 
2.43.0


