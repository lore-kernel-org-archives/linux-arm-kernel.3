Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F562C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=; b=uQ8z5Mkr811zW0APZ/Aq+Dv7Jz
	ZWZDx23PX9eyk2c16zYTUQdUdNg+7EwX5GaFKeUlEWIeLHYGvli3MTqsOd63UJcv/adiiIw9JEjqc
	TUvGjxLkrqO4TtX9cSPrwo7uCyq4T1YlrAG+7iB5XLe5lbj4WFIorceLiYgdAREWGq2tB7WVoG3Rj
	fvXprGkwomA5nYV5WK4LYQxsHPv/1kmvJ+h/zag42I5eumKbgKaWUFi8BCNNkNaPToQpmO4qB8XAl
	gM+PDNNGA1BtoTTxLkw8Z+E1tF+xKVOTN2mpsPx//oZCELz/tVinNwvstqqxPXo7DgdqnYA4XjY6S
	OL/LrC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3SK-0000000498G-2cQZ;
	Fri, 10 Jul 2026 05:07:20 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3SE-0000000492s-0hcZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:07:20 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8423f236418so308168b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660033; x=1784264833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=bu932MS88hdn2lVWpS1Fp6Kdz+1jNY8Bz2BgL9egT/43VcNcjhjol+6h27YKyi8v11
         jiKjNrZt4YSIo0qFVwjpTCnp6vscxmalr0Jq2/SsLRqbyeHmgCJq55NPBpHIkrEVmn5b
         XjuPQ84iPiIh42aGYzuE0oFBx+Izu8JZgez5NEcOaaw1Q5dURQiOsi+nR+nJqXaU3Awp
         TGEz5r938wfvMiiwZEOfiFVv/STpx5qA+5NQHCRAg4udT6jDqfU0xl2b9wrggfApU6mB
         iUT6587+w5PR4BI6uATtr6xatduCzGkmW0uBJDf85+Xn6q/8JGZfW47gokKitdTPg1OQ
         5Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660033; x=1784264833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=K9io53kZWrj0vwVlpgaK1iAVGUepjPlXQqLUPVWXZGMpicOa39h4LibOlzdp8ANKt7
         YhxnZUnYbfitMuTL0Q8UFEjXop8sF0mA/XqjZR+GoXSqm1ZGNO/MXSeXvgNv36v7ccwR
         DiOt0t00B0kc9yB88iHbivCq5WT+Y5cKCPGoA4SYQs1ni6kN6d4ashrO8ANK2ouRWrZ2
         UtrRPV32iAb97nOGukHfgkNCu5F79FQhYskf4K4cYC5Z72/l5/xd4FSaSlpRTKeh8Byg
         BwqQG1B3Ea9BiW8v1dxGOTov54d+hiLoJrTBeUP1PDdnWQsuK5mP5+juHHzG2CGRTqwR
         kADQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2X+9YtmHe/1obR27qL7vRTxD2n8JvSfI6xLxSQ2b6nks08L/eBDbAapRIgDX6XtEXJJV8orISZD8ZHZIpvOrb@lists.infradead.org
X-Gm-Message-State: AOJu0YzW3iOGA2lllcde5sTxrjmYyRVgJ8ec15O3wzF/PBZz2IQISQr6
	e5gZkSaJcptybbgHmZaba3pfNcc0LVw/Lujy2sAB+D6tjkkaY92wrnMZ
X-Gm-Gg: AfdE7ckELk9KJnv5/JCwVoK46Hy6sgoPE9g8bIRFJRce5/vxkWXNI3N55xiBlR1VjRc
	C3dLPr7fYK0rKzJJ/O0B9PfxNM1r7k5Gm2xgaDwKUEYjxEIyb1nA8EmXgzpsbcJcKKNOqJkU9p+
	hAeQZypUARbp4O7bTq7ZujjCexFI5iw8QXdnmNhdKNAgIgMkfJXVpjXNa1+3XcP9dt1GeJauvoQ
	5D4UBcuGWvftHiSmJabtjlqsaGBEBYRKeQD4bpziiw8HUEorIyYkXdfSgYQyoSlkAE+/uvvBGL+
	iUGlXNXItKzafkPleccLRyDuhGCtF1coK3JBFQwkK++Bo+GTf4pf2P6cHJEZNu3IzYuqt9zXpC1
	tnGldWNtz0XzsNMON/r/2t/CwYJnx0elgcPIfSdbrId7QT1i/sXvvLwhGaiPp02nbxaPiNIJVon
	b24z7UMwzHKdNVIBdVDP3kz2M+ZmVB5NTw0dGknH7gtPSrsPE=
X-Received: by 2002:a05:6a00:348a:b0:848:2f74:1d5d with SMTP id d2e1a72fcca58-848438a7e5fmr9480496b3a.67.1783660033363;
        Thu, 09 Jul 2026 22:07:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:13 -0700 (PDT)
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
Subject: [PATCH v3 15/27] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:59 +0700
Message-ID: <20260710050511.14439-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220714_257911_3428DB2F 
X-CRM114-Status: GOOD (  13.67  )
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


