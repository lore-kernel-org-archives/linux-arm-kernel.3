Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6850FCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=; b=vEcGMMKhITvYmJg1kl2Mwv/W1N
	KurPQGV+r4guRKCGEWY63ILGjnu0ai1A2K5Ulkc2iYpjuWZLifgl5QSIRphZLGKn5gwQWKW0hVIdJ
	ta3O3PGZDyAWN/1AkfGVdMjJOMPEAt7klfPX7KRCM5XfEGT6PSR4XBDTza/RIGTgmXl3k3YP90xKm
	gBsMs/PTHy8tT1JSro7jY2fY+aPdEBhs3VGydf8eYcyIElZ1aHdTvoSQlCvgBpXRvfsOgzX8FSYbD
	wxjpEqvvt5SkfC6ZbX1AM9UPWEu9Zrr/KbIGSRAutHlf8iXqMh5aZf65sDt0eSp3+/Mmo+rbBgbtq
	q3iH5VtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAcv-000000019LU-1SPX;
	Thu, 18 Jun 2026 11:09:41 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAcs-000000019IZ-2eWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:09:40 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c8894387780so386788a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780977; x=1782385777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=IGa8EyyvM1oUonATGl9rjKPa4CBjfd11Wb/oIslYbnamOYdBfSGIve3enBDVHOpI+U
         sTaUWEB7Cd5ioO9quTpCrMhLKruzBMv1eqePf7DbukQlbImHwjjbj/j8+EHYkpWRpTaG
         moOxSdKOwxYgu4cI3gF8z3vxgxeSYvKbEY6RzCR14iVrXH/Om6pKG5uMhNDOzwyg8OVJ
         Zfvx4sG9wBCOMyW+zSeu8+Gvz2i8jU0Rvgzmf/Tfr/PVEulG5dVkKSqj3Vcx+zYdOsZa
         SxU8cdfez09uiQR1FBrhf9fSVPDinLfQLxS0WXCP2cX50caQd5251KAf3NuW3/78rfi6
         1wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780977; x=1782385777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=G06tuvCkZAy7w8pqSDWiZMJF+sgmJGiLaxUPOizj63+7AliTea8Jrn91cr6eHKIiN9
         qBiZdVKMID/qvVKOBiqr0dY4Rbuksn3u1oYdfGZimkUJn+bEgnCQFmcowQqlw3Uvg0XY
         P5XJGwwmn5vLWcx9idvwhOzf6E+ypX9EKC9tUB0O+CIgFjreWr8sskFaFSZT84AEuK5F
         LulRWRAJvonpPq2/fndVWSaPfDL4LoYoMU2kS8eeeliDS3T0yZn+OCRHjPpERDYY0943
         KYeoFSMz4F3hZNzIQtWt8zB/t97VWSKn9HEDXydTq9OSakq/EFYHoNsY2qH5M8/KUUA+
         z7HQ==
X-Forwarded-Encrypted: i=1; AFNElJ//ONyXN9We5/xL5efBQezagwgoxFmrujS7+75qri5Ww9mWlt7SzC9wAYUDoTwnIoZCTX+jdjsxPGRHjbaFb6yb@lists.infradead.org
X-Gm-Message-State: AOJu0YxTJlJAXUcUxpaAcfqOOSuEnyo+HznrJUWjP/2DojbASgXvcvz5
	DU+TU2FZiZDdNyE0lQf5iNvPrxuhtvHK6uBkH3Eih5ZAd6/4EZY71s1m
X-Gm-Gg: AfdE7cnxQzPKVLA5r6bgmSX2YyC3zzFi7gKT424Mms1YxwLM0otFc9KSvpQQwpbiecD
	6kKk4LUaxBih5LBlPvj1rOOI2q2Em+giUFf04EN/poFEdUPCBDl6o1JKh9i2BZXASUSgz4XlkQ0
	mVcn1L2EhoGaGLm/p7D06VPzrMiOgN2rAh/gNnM/FCpYazkE1XcKK8AdhjM1Ta0pXs/kaRG1U7X
	6paQyvUIrDTecjiuhE5jTgI3W9lBgj5mad1iWQELTK9FbwkbE4bWGGnCuHngYo3hv7iCEx4LQxU
	j4kO77/mxeEOBEYoZv822D4pO+5Dyz00ydywONGCtwqAeVVfKD60z9vQ+QXTh2nrmAvvL9bqPb7
	I8cEjNm0XgKggGbjOkNxpr+ravIg7eLUc2KHMARDltKowUQy6XK+TODyu/nXD7ivBDySGpi2+vr
	pNr51YZKfiW1G3fB7pMTs9+KfAbgDg4dRTTZBsouBVY0F5enk8t3MdEThHFA==
X-Received: by 2002:a17:902:f547:b0:2c2:c0db:964a with SMTP id d9443c01a7336-2c6bc23d4c8mr89883015ad.26.1781780977509;
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 62/78] ASoC: codecs: twl6040: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:11 +0700
Message-ID: <20260618110827.232983-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_040938_670490_E8A100F9 
X-CRM114-Status: GOOD (  10.54  )
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
 sound/soc/codecs/twl6040.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index e10c51092a35..6b18252fa8c6 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -273,7 +273,7 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 	int status;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	/* Sync status */
 	status = twl6040_read(component, TWL6040_REG_STATUS);
@@ -281,8 +281,6 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 		snd_soc_jack_report(jack, report, report);
 	else
 		snd_soc_jack_report(jack, 0, report);
-
-	mutex_unlock(&priv->mutex);
 }
 
 void twl6040_hs_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


