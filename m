Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09728C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzI+xvr6p88cYg+8jImYn6yoqZyRq117x6xc2+j9GZs=; b=EjuBDjjTXwYdY7VkTqkNOFn4Jt
	/7pGSWoFhlCOOF9Qi0ooADTUPRw0GdlVtwg8nelNVcbnC+CO9sopgvaRQCA7kPElndb1am9vtvOkg
	JF4j9zwS4M8ZDUM8B589c+9hF7uNF+4VCJVoL2Or0i+AJmcMgVYOVWZtOkueQ6Ci3goFS849SsEz+
	80oRzC0t438RHGXEb36hg7UIrGtHxGF2fQ4Q1hc01hoCSU9LeYxNDD1x4fDojAv/DJNv8TuUmH7tY
	j5ZtwH1IJisfSucdUBDZEpbNAT83DKDkswtmAVWKf5+JGvmhpH9TRGQeBYRLmy959BAMytv4MtoGx
	BCBtV0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7go-000000098IW-1VoX;
	Tue, 21 Jul 2026 10:27:06 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gj-000000098F1-0pzO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:27:05 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2caced6038eso65081705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629620; x=1785234420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzI+xvr6p88cYg+8jImYn6yoqZyRq117x6xc2+j9GZs=;
        b=ryiGuuEnXslQ/c4oLm4c+JeIGhKDoHFsqNf/WUMrXVeeXOs/rg3zm1x5UV47VcFFtO
         o+aJoCbKOY08ZvhdECUqaivYaXTf/M3CtHNus7Jh06pectt4hQS7NY+4ZCA77bmw15HF
         TYK3qpRIYLOZdIulPNkpgQnziduO6sLguOZJKMjsYKelow8P8PQqZ5iZgpUad7CqYPTf
         YWH/p+lzW9p3g+jrHQ/+iGKXbawjDP1UvJLOEwRXn9p3kMw5GwMmoxPsjpnS8jbgD+Mh
         7Hrq5ABcaYnfA+KCvZL6f3o6ldo2lH7q4svr0hicjOUYCy7wU6cWcD9QZND6nkxOMM1P
         +7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629620; x=1785234420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzI+xvr6p88cYg+8jImYn6yoqZyRq117x6xc2+j9GZs=;
        b=IHnJzLDM1cdZZ6ocfwq5IpRGvLlMqCNVmkVqwWp4QZTa6QfgunvFPDAry46ZmnIEY3
         AQoM4szc9VT1iS001mRvvmR9MIHgmtgcWMtN/DclFCOqHxWukH0Z+ZHGJ4A8J1cB6KxY
         SzKd83f04gLZmk0RmB+dW5Zx1rfQcq5D930O7w1cMGWoWW7D6K4Obcweb/c5gGUHK6P4
         2qy/i4D/kdc/AGghmkpgvC7xzh6jX/ZqHz8fnxmOrCjqZRRHZr1/fwaHM/Q6DIWj9Z5n
         /3P1RBBKNt5WCblm9duneNsxitD2RM4CE5D5ne65xL0yV2eYtco0WrV1o3UUspej2gOR
         benw==
X-Forwarded-Encrypted: i=1; AHgh+RqfsVDIszINw+5J9IWi+Ku1Enx7Nc7BsZndGHl3PjY6Ms8mygfhQtzN8wiO192YVk5IUNSkensbnZdg9NjqhWvX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8EFHdium42pi41hYn/uVJxVOQObZTpV26Oo/P+/iz2jSe1Ecd
	FKOqhqya/Otia/oQyodLXiPuVNaRrvnbGsumR3+lCcaVWkdOnx1uc76Q
X-Gm-Gg: AR+sD13F+OUcuisc+noyUKO7If9S+SMPLXxJLxqI9uFerfJwkXMw5qkVA3r7ql3jUIN
	sKVSYqsvSmGhix4rAlF1qftogaTnFYK/Y28E0khXsihYLRHgmEYfcfYd9FjRui7ILRJNZCbQH5v
	BDpiJ5WwfiR5Ga+fac9iLnZYk6z2Kfjk2dsjM7qkUV6cVsGU2qXEIKXGXf++YT0QA0yFjdYEtkb
	keJeq7edGq95rBnP8BC3Kr+H1u7vIgiVIGTNzumX2wS18ojz7OWkJ5nYBcLN23hZbwraih3K/zH
	TNc6/4T85tUyi1f7+Yl+QLMKG8mbqNNbu1/OyfKB1q0f4dSBE8ps0J0z2MeWLC9fBIb20PVQnRi
	poZbuNc/AeVl5buVXPD8brjs9p0/kUKerjdCwFzcCubhjAj0Lslp7KBIh+XQ9Wd23rPbDU7BLu7
	i6jwWX42ReCvDBR8hU7/RobwCKwRLdFMRs9FRA
X-Received: by 2002:a17:902:fc43:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2cf41bab3cdmr143685015ad.12.1784629620455;
        Tue, 21 Jul 2026 03:27:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:00 -0700 (PDT)
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
Subject: [PATCH v4 05/29] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:36 +0700
Message-ID: <20260721102600.523199-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032701_347126_B91492E2 
X-CRM114-Status: GOOD (  13.44  )
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
 sound/soc/codecs/es9356.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index f574b3d6cb3c..a9863900bf70 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
@@ -500,16 +501,19 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
 	}
 
 	/* power state changes are not independent across functions */
-	mutex_lock(&es9356->pde_lock);
-	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
-	if (ret) {
-		regmap_write(es9356->regmap,
-			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps?ps3:ps0);
-		es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
-	} else
-		dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
-
-	mutex_unlock(&es9356->pde_lock);
+	scoped_guard(mutex, &es9356->pde_lock) {
+		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps0 : ps3);
+		if (ret) {
+			regmap_write(es9356->regmap,
+				     SDW_SDCA_CTL(func, pde_entity,
+						  ES9356_SDCA_CTL_REQ_POWER_STATE, 0),
+				     ps ? ps3 : ps0);
+			es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps3 : ps0);
+		} else {
+			dev_dbg(component->dev, "%s PDE is already %d\n", __func__,
+				ps ? ps0 : ps3);
+		}
+	}
 
 	if (rate)
 		regmap_write(es9356->regmap,
@@ -1091,9 +1095,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
 {
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
 
-	mutex_lock(&es9356->disable_irq_lock);
-	es9356->disable_irq = true;
-	mutex_unlock(&es9356->disable_irq_lock);
+	scoped_guard(mutex, &es9356->disable_irq_lock)
+		es9356->disable_irq = true;
 
 	return es9356_sdca_dev_suspend(dev);
 }
-- 
2.43.0


