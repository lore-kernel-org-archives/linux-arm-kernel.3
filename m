Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F861C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=; b=ahwmkb5GQzsjwh1bl5OXE2ebfl
	vPL+P95x0K8AZ3vZNPYiW76EFCggC1+5pf8DB9I94idYugw1aydDHCgqFeRDmnZFP4QLgu1VtMIhF
	+k2BqWIBN7MyMYnX5psdraBDGh+OGnws8a6bfmX8htGjMTEqCdCQDfQuoxYq3iWrAkkYVX2Z1j5nt
	TphroAiLDZeXr4whCABk7c1tKLlsfbxTk19mqRFRr5Rdn68C4fn7ngUXnvaE5vMF5txppHh6DBRBi
	2qEl2rBRAms2v9x12hp4Gthv1GFJxFrSB9iPl62I+LSpezCq4Uje8QuSdK9qj01vyCkDRa43zskgh
	WaQ96K5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7iG-000000099ot-1YLW;
	Tue, 21 Jul 2026 10:28:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7i5-000000099et-27vv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Jul 2026 10:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=; b=YAWGNGpgLZqODkkQO17ry1PJ2I
	1tdZHVRaFnshPjqkdE7e7bvecdazS8FFitj9CEW086f0hK+VaLpxOUObkkksP8vX98LdYUoTxHlL6
	y6MuKq0iI1J4vsCwkdv4wtcknOTWR6xx4839mHqz2b9m5CrFgv4bHDqFFsmGEpehadEv4cYf3ygfJ
	B0Bm8HZ3sKoPILjRHvtTQsOkj3yLfl+6K/P8f/fDzyjPF76WrLhxfiy1kfvDH19CcpqFqlaAmTkvN
	TxWcq9zVbSzzmooQmIyeFFmJTQGXopVKGPSYMKapQcNflUloskDaCp7lCTyldPW8qxw6udWfmztQM
	P+38xYPw==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm7i1-0000000HRgc-2Fc9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:28:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2caed617615so123141035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629700; x=1785234500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=q2EbBDciXn96q3epqNqyfLYaoudCAvsGUMmw2GcGBoq2W/rL9cd9WX6J/XnVGovJ/H
         2WD9AgWt7fFSznKiQEgmmEF1UEeBfKG+RsZFK/MQIcSZVHn9oh4lCsCA66VBqFIfJPA3
         eEvuecn7Jv2qW8226QlluAn9MOixDIJLtxSZopTQN012lpibJAWTi7J6/LfG72vXx7uI
         IuE5cabHCC82KewxlcfIoO/l2WCbnixk9CZsshAffpC2qR9VV1WYA9IxCQPH6Fy7tts4
         8ngThthzG8rPZbfGdFbQ+WJrXBmCZadQFZ5ug7GOLtcP36iRIu+aZDIFkfBM9K9+mt5l
         ul0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629700; x=1785234500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=J5RiKJ0JRiUeISp7yScQlIHULoiUIUhFjhU5IRW/6hp+aCgqK2366/fL5ph/HhoDdX
         TRuZCyEBUIlC049NpYqxOp21KGEiJOIEw+jjs4D7ul34SNmd1Vtf6QpCf/OF+vBKrGGn
         1PAAIG0qweGpvahY8zukTr5nMN8oeimifRiGZa/6YWvNNoDIPYqBD3S/0ya8Iq0wbjy3
         gQ17mYPUzU5XCUZmbFBg6smoz6KIcrj9ilK9qMR9byj1+Wf3j3s9O37FmtXHRDqJYjsz
         nxxymNwwv/PPGJswn8uvqAxj3Ui6HdIpWelA21rthowB8+98rlBFEykpKBXVk4c0z8rC
         QomA==
X-Forwarded-Encrypted: i=1; AHgh+RoDkpC9IoDhkhc+OuJrjKlzVwSGJFcTCzwlr+hqQxxDgEwaSQ3SSQ1xtzx23DdkCARE3NXRPc3+youa6cfqR1yg@lists.infradead.org
X-Gm-Message-State: AOJu0YySg2l2CLP6988zHN2zYn9o+sKsWZv8S3sBcp/Adw83YB+VWbj4
	f+psFGJAqDT8T24x/4ZrEAXMjYUUhDefGJk03MZ+kryQGI02+KUhJ0eO
X-Gm-Gg: AR+sD10cOyLP1jX24xgfijx2NGB4ZzmiVY4UBkDxFM7TWlQ4VYvl9rZ0ED0EC9sFOU3
	1CF4j1FbXM5/5e3uZUn1RrZ8jSDqWKHQOTLc5mZf3mRuqnFCuHyyVd7xG/qYtiglby31qzM9d5v
	0v1GcnLbwGpXS2+eZvVY9DxG6aYu+nSypA8RzcQx4Q/HOCG1AnAqb2U+kbmNyGRLFIgjPipMa7B
	ItWko5u1KtmMLq82lrGaEDmLLe67ho+OqdVPB/AyJVU2/gArI86esbm3bgjdBy2IK20MvaPOmtY
	8GIXEryAEcZoW7uyQnvMnMiv0QuKD2nViURihxR/1UErKPEz3FzSJNGAaEjSbkP3FbkK3pOluVu
	FI7HnV7q1KJhqPX9CV5fPfCvDTLw+14+c5kF1qN53NscrpGXzvAvFS5XxM8VfgS7WhmhiUi5avK
	AAX7rhcrTdZoQEFvjDeq2u/3U/05GgA3Rhi2cK
X-Received: by 2002:a17:902:e5cb:b0:2cc:9763:e607 with SMTP id d9443c01a7336-2cf349bc5c8mr181903165ad.27.1784629699763;
        Tue, 21 Jul 2026 03:28:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 15/29] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:46 +0700
Message-ID: <20260721102600.523199-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_112821_706993_125C77BB 
X-CRM114-Status: GOOD (  13.85  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/pcm6240.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 4ac4448ac3c8..a2b66eae6ac4 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -12,6 +12,7 @@
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -605,7 +606,7 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int reg = mc->reg;
 	unsigned int val;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	if (pcm_dev->chip_id == PCM1690) {
 		ret = pcmdev_dev_read(pcm_dev, dev_no, PCM1690_REG_MODE_CTRL,
@@ -613,18 +614,18 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 		if (ret) {
 			dev_err(pcm_dev->dev, "%s: read mode err=%d\n",
 				__func__, ret);
-			goto out;
+			return ret;
 		}
 		val &= PCM1690_REG_MODE_CTRL_DAMS_MSK;
 		/* Set to wide-range mode, before using vol ctrl. */
 		if (!val && vol_ctrl_type == PCMDEV_PCM1690_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -25500;
-			goto out;
+			return ret;
 		}
 		/* Set to fine mode, before using fine vol ctrl. */
 		if (val && vol_ctrl_type == PCMDEV_PCM1690_FINE_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -12750;
-			goto out;
+			return ret;
 		}
 	}
 
@@ -632,15 +633,14 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	if (ret) {
 		dev_err(pcm_dev->dev, "%s: read err=%d\n",
 			__func__, ret);
-		goto out;
+		return ret;
 	}
 
 	val = (val >> shift) & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
 	ucontrol->value.integer.value[0] = val;
-out:
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return ret;
 }
 
@@ -678,7 +678,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int val, val_mask;
 	unsigned int reg = mc->reg;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	val = ucontrol->value.integer.value[0] & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
@@ -702,7 +702,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 			__func__, rc);
 	else
 		rc = 1;
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return rc;
 }
 
@@ -1645,9 +1645,8 @@ static void pcmdevice_comp_remove(struct snd_soc_component *codec)
 
 	if (!pcm_dev)
 		return;
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_config_info_remove(pcm_dev);
-	mutex_unlock(&pcm_dev->codec_lock);
 }
 
 static const struct snd_soc_dapm_widget pcmdevice_dapm_widgets[] = {
@@ -1890,9 +1889,9 @@ static int pcmdevice_mute(struct snd_soc_dai *dai, int mute, int stream)
 	else
 		block_type = PCMDEVICE_BIN_BLK_PRE_POWER_UP;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_select_cfg_blk(pcm_dev, pcm_dev->cur_conf, block_type);
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return 0;
 }
 
-- 
2.43.0


