Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D246C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=; b=ad0GX5845w+ho0TfslF4+NB0gG
	1qFzbuXxo1JqVj4iXV2aYe1zhHamNc9oJKYW+YtUATkyKzuwItDk3Cu1KmuOPZKOANVYBSBw/P+gV
	IhmHobgxlNgbSdjsasRkRk5tqL+R3/CG8CeRJ7WRJZJifqislD/z7+g/z/F7eMeXcphK4yWl9CeuH
	/EFXoFSvQrbTb1pz1irAyfww9E/dBwK5cbP18SHMUC4Sk4bkI+gpngp73ujo8bEUDcuKunNYDEMqI
	M1ekZ2i/7oKZIRSTMSoiwX+aXFqB68HrGReHHzHDocnQIyHRcfosyDsPqZM4pQ5SUUbsL34ZJPRCE
	9JxsN+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7i-0000000HGO6-0ODb;
	Wed, 08 Jul 2026 14:19:38 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7f-0000000HGMK-2ZNS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:19:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cc97653887so8471155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520375; x=1784125175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=N/UQDz6I7IiCUT7S1qwX2QnKrnju51QnLG5t1amTfIxDSUbNgOt6g95RTDEMWNFaBV
         VTVsWTLtgFRj8Xam7eNi2u7KHGVk9eEVSh+X3jcinTebGFLTPgubER2RUSyoMPvRA1J2
         0c3m7NfhLXKMsdKUxLP7+BPi+Ohx82fxsUjuveqkeKqIRwSrl3nwLFuHZY5WmuuN9p94
         mkkhqytFdDI9Y0fq04uTXkkDMYttd3TAepemS8D/s66ZZVegLKO6rjJ91/viEmh3uCB/
         qzfhG74Vud/9gpkAyrE8LzAQ5DmFermZx0+aNy2eKL2VW2/YhUoVb44YFbvqoo1evTGb
         jBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520375; x=1784125175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=gDc3IPx7qc1B97SQuQDVSax8sIB0sVTuGYgugS3KrBAEFKnAvlwjKX6G9pmNbs3cT9
         Q3Rell0WYJw7zo+Azf7jSpNFxLWhHWltM77W9Wyh69waa02Nt//AB0/oC3F9iJ/nNAN0
         aK61D5cAfj4PkjozqufrVSpSOmcur1iBOOcWryg9/d9tyn/f8Mew7NS6dnMVvp2hJh+/
         1jkqkguqxpgoGkokFpSV5iAOctvJqymwoF015OytB4opVfBkgr4P+EpewtPEDGkcuwGA
         znkfLmc+++GwtdQn57CJ/Z/JrGLVILkK5YcXcAjb8cZ69R0teSOOeVnZhR224I9VWlrF
         di+g==
X-Forwarded-Encrypted: i=1; AHgh+RryTvfMJpNZFq5fFjA0FDd19MCq5UPSLRsoFRM+Blw2vUoTFsGD7AvPw2+BVyWiaTIsCNEXlS5hhnv1WpjlWpX3@lists.infradead.org
X-Gm-Message-State: AOJu0YyQSkGGttjIyGL/ld+uo3NhJLfPsnR0CbaO0EDYJdZdC1kkyO+W
	8tRIazR4uXZQ7kH/XJYtEbsRoCuqkjz5isnSmOnxHwzqSZBsBqTK2k+c
X-Gm-Gg: AfdE7cn3qPuHRpY6AP0v/a4Y/euJsPHmL06Moc6gfFNQFl6FKiO61HxkfxoA32eQsKp
	wloWMl8lMmv9iZljnlypjHZLNjR0XDgvmndWNo33tRWulPrmC60ms5RzKATjVY3tfUQIyFjz+4x
	89KXtiZdTPZqt8WLQPSRsQedEsj+moWleapJfA9Rkj8k5nk55LEgHmGnOd7XZfh3/Ev2KfMcqzI
	jJufDfrC5RK8FjWJWzqil4dcBwBlmm18OgwWXPwBnzoQOvtrPmoT3yaVHka3IhLQCXwHPqCO0Aj
	kvdihD6eqh44T/aDcs5E0z1JF0XdtoSRvBtbSJOHA3u6lh0iIuqJF1wqN7b2NW9wwcXx4SzsZCP
	vE0NAh70MEgjBurdsFzlC+65AxDpB9EoHcJTLcL190UR5+MtRKQN5i8JIaiHi57/s55RzAzCAem
	7tz3+wiBtVfIXvUZxgeIvO9gL3rV1sJl+4FIOe4MP/HozXC5Y=
X-Received: by 2002:a17:902:fdb0:b0:2ca:c84b:c4a4 with SMTP id d9443c01a7336-2ccea37bde9mr27502985ad.28.1783520374943;
        Wed, 08 Jul 2026 07:19:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:34 -0700 (PDT)
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
Subject: [PATCH v2 04/27] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:11 +0700
Message-ID: <20260708141734.578926-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071935_662359_ADAF1BD8 
X-CRM114-Status: GOOD (  15.19  )
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
 sound/soc/codecs/es8326.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a79b2da35099..c5460589a88b 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -6,6 +6,7 @@
 // Authors: David Yang <yangxiaohua@everest-semi.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -790,7 +791,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
 		return;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
@@ -845,7 +846,6 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		}
 		es8326_disable_micbias(es8326->component);
 	}
-	mutex_unlock(&es8326->lock);
 }
 
 static void es8326_jack_detect_handler(struct work_struct *work)
@@ -855,7 +855,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_component *comp = es8326->component;
 	unsigned int iface;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 
@@ -873,7 +873,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE,
 					ES8326_HP_DET_JACK_POL, (es8326->jd_inverted ?
 					~es8326->jack_pol : es8326->jack_pol));
-		goto exit;
+		return;
 	}
 
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
@@ -930,7 +930,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			queue_delayed_work(system_dfl_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
-			goto exit;
+			return;
 		}
 		if (es8326->jack->status & SND_JACK_HEADSET) {
 			/* detect button */
@@ -939,7 +939,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			es8326_enable_micbias(es8326->component);
 			queue_delayed_work(system_dfl_wq, &es8326->button_press_work, 10);
-			goto exit;
+			return;
 		}
 		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
 			dev_dbg(comp->dev, "Headphone detected\n");
@@ -958,8 +958,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			usleep_range(10000, 15000);
 		}
 	}
-exit:
-	mutex_unlock(&es8326->lock);
 }
 
 static irqreturn_t es8326_irq(int irq, void *dev_id)
@@ -1200,13 +1198,12 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&es8326->lock);
-	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
-					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
-	es8326->jack = jack;
-
-	mutex_unlock(&es8326->lock);
+	scoped_guard(mutex, &es8326->lock) {
+		if (es8326->jd_inverted)
+			snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
+						      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
+		es8326->jack = jack;
+	}
 	es8326_irq(es8326->irq, es8326);
 }
 
@@ -1219,13 +1216,12 @@ static void es8326_disable_jack_detect(struct snd_soc_component *component)
 		return; /* Already disabled (or never enabled) */
 	cancel_delayed_work_sync(&es8326->jack_detect_work);
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	if (es8326->jack->status & SND_JACK_MICROPHONE) {
 		es8326_disable_micbias(component);
 		snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 	}
 	es8326->jack = NULL;
-	mutex_unlock(&es8326->lock);
 }
 
 static int es8326_set_jack(struct snd_soc_component *component,
-- 
2.43.0


