Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5F8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FKz6zL2lYGruFgrXSmVh8CpNcaMm/DKeCPXfcKM2u4=; b=j/rnXnFYQPSfjZmDBN/hRdPY8/
	Xm6AdHR/r87EZ3CcvUdOJXi4o8C2sSEfe7HMWo5NZ1Aw9fem4m0UDH+f2K0tdk20j/W2Yihb9hxKG
	pnmn/buxUE+Xz9cTWktr/6YTURqHTJk2ra7FnnooDIc4HEc2Q8gNT96H1MaaSC8nYdMNGPGSgSVzI
	5m9WGo+aIzoSbnGKBeNZVPm+9x1nodxrNPhmd58rbyceLXM7wFeJmDP/Avkt926meXtP2zUYZvE75
	H6mRwlVLLIZJwRrnl/4F1vHauTEbLs/YSByfvlwmoyxvWFFIN5DjvD7u4QIiVMAzjxeVo6slQJ6gy
	4AFFDLvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Qb-000000047mj-1cPk;
	Fri, 10 Jul 2026 05:05:33 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3QY-000000047lw-2OML
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:05:31 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8484f229529so345691b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659930; x=1784264730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FKz6zL2lYGruFgrXSmVh8CpNcaMm/DKeCPXfcKM2u4=;
        b=cZAnfJtNkd2giWgKZjMZ0yTuVGAnUST+8WhVs2ZFs7ft9ZQJXKmjYd7RJKhaou7akK
         PyrF9wLRsRSQZHw6YXmSJALQc4ebWJQzDAROVhMRJ2xIMtNbfpY5H6QoP4IVU/uQtFvU
         XfPoF/sDnU2yetolDCae7M0zZxwSplv60M8DqxgPTJhwk2Y/pg/AOqZ83a1icxqYz+cm
         42XBjjBEJUtX8fRgB1cksjawM5DUrRDzL1ANzWbEAesFcQYugrwsh7iSvUBOru/V2hV6
         Oj6ZcbgsniDQswD/Y6Fph6XNALfNFLEl9ZeIzYqGqV0efEDRXpjI82kv9P80V+6NvQpd
         tdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659930; x=1784264730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FKz6zL2lYGruFgrXSmVh8CpNcaMm/DKeCPXfcKM2u4=;
        b=i/jQlN9CNr2FeQoV13BxYeRsRtdLZmiEMD/MRsmCv6byojV0sDtpMl23pscoP+/UAu
         va2LNKsvtXyVWkwDa7fWf+ZGosf0auvwD8VdGg+vJWPji9UI6dh/loQ7C4xpVvxAI1Xl
         mtPw9KueQe12U6XidmqJ8s/9Ewn+AHg7uDEisxvnreoiSh+mHCOdCt9UF0pUJUSzt/zY
         McsMZd82K9sFMI+qSLAaJFiD+ITUyMQiEp/ddSF0he9cfj/wkUfbnSZiZKycZIyOIIqF
         DrQ7b2+/cejC88vhNEvNFGWN50BZJPwmLPPQ88TfTBTU3d/0yy+teD54GHbHFt/yNQVM
         /2CA==
X-Forwarded-Encrypted: i=1; AHgh+RrPsjhQ5B70DZvsCQVOPsX71qpbOXM22yYIYgE2DuA4mqBRV278Iwrd5yKCyR3UN4Yslxw2JvHtunQp6h7Y45R+@lists.infradead.org
X-Gm-Message-State: AOJu0YycPr4Ge16MuLHRgrWlVWWs22D63WjyNw/7O1J3dsdTdU1G/0Ya
	ZmK8ZLWpOu69O8zjnE4H6L20HoVXkpQA2eYefT5gXMy/kugsr51msl57
X-Gm-Gg: AfdE7ck2zY4BSDHz+IHquMVEATvp39kjMdjld/T4dMIN/w/KB440rDpAtElFCUz3jX4
	u5hjxBnfWvdkg1z3m1lCYli6UioC3jLHnyc4xWwZAP75rwXzRUj6po/3E+SuMGqBfcny67n8/TZ
	A6+jBoJq9nk2q60dxna+db1gEcSJRFed+GQU+TSbsmiXuDXpnmgQu0jOu4V/tkdgqJrpswdcmXR
	AWHgCRRvlcB6qzXz3JWFVvMNm6CuW+jh26/Md82yDv3A+fs5yCMxn0d2ng0iPepD/MztP2nI4hN
	v4AW/R7QeL7wfhzzwgIQ2uf9dyh+y9mdd0We2Pf4xb3U1edvYyJsgqICerrOZ1oLRLfwiKzdl1/
	rsXqTFPVWvxoXq0ODY4fTEPA//oXiPjrx3Si6tAfykCpKjGnT8z6o4MJetxRFN1vy8rQ5IAAzqO
	EGnGJG5ij8M5MZNlaMLHomxgxaXeqUi77h5CiIeV2PnLb64cmR1rd+FXLRiA==
X-Received: by 2002:a05:6a00:400d:b0:848:6447:e09c with SMTP id d2e1a72fcca58-8486447e365mr3946827b3a.39.1783659929668;
        Thu, 09 Jul 2026 22:05:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:05:29 -0700 (PDT)
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
Subject: [PATCH v3 03/27] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:47 +0700
Message-ID: <20260710050511.14439-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709045902.498848-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220530_615367_44F96EDC 
X-CRM114-Status: GOOD (  15.35  )
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
 sound/soc/codecs/es8316.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 3abe77423f29..87f331868dc7 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -620,15 +621,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
 	struct snd_soc_component *comp = es8316->component;
 	unsigned int flags;
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
 	if (flags == 0x00)
-		goto out; /* Powered-down / reset */
+		return IRQ_HANDLED; /* Powered-down / reset */
 
 	/* Catch spurious IRQ before set_jack is called */
 	if (!es8316->jack)
-		goto out;
+		return IRQ_HANDLED;
 
 	if (es8316->jd_inverted)
 		flags ^= ES8316_GPIO_FLAG_HP_NOT_INSERTED;
@@ -681,8 +682,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -699,18 +698,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
 	es8316->jd_inverted = device_property_read_bool(component->dev,
 							"everest,jack-detect-inverted");
 
-	mutex_lock(&es8316->lock);
+	scoped_guard(mutex, &es8316->lock) {
+		es8316->jack = jack;
 
-	es8316->jack = jack;
-
-	if (es8316->jack->status & SND_JACK_MICROPHONE)
-		es8316_enable_micbias_for_mic_gnd_short_detect(component);
-
-	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
-				      ES8316_GPIO_ENABLE_INTERRUPT,
-				      ES8316_GPIO_ENABLE_INTERRUPT);
+		if (es8316->jack->status & SND_JACK_MICROPHONE)
+			es8316_enable_micbias_for_mic_gnd_short_detect(component);
 
-	mutex_unlock(&es8316->lock);
+		snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
+					      ES8316_GPIO_ENABLE_INTERRUPT,
+					      ES8316_GPIO_ENABLE_INTERRUPT);
+	}
 
 	/* Enable irq and sync initial jack state */
 	enable_irq(es8316->irq);
@@ -726,7 +723,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -737,8 +734,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0


