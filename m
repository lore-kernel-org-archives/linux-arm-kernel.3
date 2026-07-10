Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01884C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4c06G1YhkVvW99Bq1imq6AORHZjUoeyckmKw8GFUMY=; b=KuG2fjQTQisz0iNrZKreVVGWRA
	cS6TyfugTaM2VCmN3pWE/0kYCCwzySrb/m5HTa/a+lrqXxw7l1Umm9im1WEr4jcudYVG036EDXjQO
	Fok6ufP1ZZ/DFO2rlwT7DTuhqzLEv80PGr2zWJuvvonKsxRAS7i8gF4h3fNox40GW4D0aFXY9B3OS
	DusahNaU2g8x1XCf17RrVu4ETmTuxN3M5tdqgcmG8UlJvFnrXTkCPBoaA64ekVtEXkx/R5QT2Xt7G
	dX7HMQU3uYFL3bdouj1+HJ3fqQwzWFfsX3ilm53jz4ud6cPKIxC8VrGSO4QEiDv0Sm4Apj4IQ7x1q
	3cLN/Dcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Tk-00000004AOO-12Pr;
	Fri, 10 Jul 2026 05:08:48 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Th-00000004AM0-3o0Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:08:47 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8487088510aso520143b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660125; x=1784264925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4c06G1YhkVvW99Bq1imq6AORHZjUoeyckmKw8GFUMY=;
        b=sg6hD+IvMlIzfx4hi31Go0qO1RwQeUjqXOsiqINSFBiBncgQ/gC74CxEgeuWl7swp9
         2BI1Oz3WgL8K8fgWZJs1r++X7lRnZXZM6M4nBMWZpMaRbNaGGoikLYOwx+1qhjjjwBun
         bqpY29ZtmWCBp0Y7LZ5awpI7HEZwYyLLFlMIRxzG0MV4ZS5T5Cdl2SmEDpaghT/3zT6V
         1IwymvKPLVUczxPh8FfT3slEYiSGHlHYK1NA1K7yth6V+GL255O8MOTEAg8FZKlOWJyE
         kI3E78xve28sewmb8+CAMEWksrodKssm9W/q1O+OfqWddahiTdHrG8kGZ25DiRefHgaI
         /fYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660125; x=1784264925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4c06G1YhkVvW99Bq1imq6AORHZjUoeyckmKw8GFUMY=;
        b=UJ05yd8WPWFB5am6wuNsAPJpjOYbphQfsn6wVWtIPtLybizuY33i+jss9Bo7MGAkgE
         apcziPIXV9W/GkLcgKVaQui7zyYd2FF+mM7BxB7SlMt+XvoO2vwKexzBLsRGKNQOvMvj
         uBsozAnjfRQCt1XqahJlOFmMaDyMhhZN0o273P1ajwEDVVAadLNl01+ffA73a0PGKCvs
         eVNgwRdbVd8BcYGvARyAX4Ll9l8ALVcM+7KmT1TCsnNChVpYUwwfpQveNJ+C7xamy+BX
         yynSGwYZD+WNjNbtBrQqTwCkxWc5jd9z5pp2zamas297eEfX3Vky996BecTnCelm2ujm
         WEyw==
X-Forwarded-Encrypted: i=1; AHgh+RplG/BOwJfWw1qY06lPNukOixxGZ0uD3dQWqEaabPcRTo7GSOZdX5cQZWsqs1mOCHxvqC2UCq7CccMGutmuOwNH@lists.infradead.org
X-Gm-Message-State: AOJu0YzCSU3CyLq5nbGiuIx9xD50mWYS45tL0hLXYRch/GCPUErt1jvj
	uQubMgBc1G/dhambz8vgO9PC0we58InGsvK83xK2Cr9a+3iMs8VdYAaP
X-Gm-Gg: AfdE7cnor46rbNgTVbFtDRBJRl7AxctuRnJoXRJOrOoVqtlyDiv7AqiHaV3gyoqzryg
	zULdi3gxyberzyLaiJzEUHuhRecSb8wucvtTe7okPVfPHr4o0DIOfaSeZ321HvaylNmSJ0auA/E
	q62ril/05+F0rEVwVmqPjfguREh8l7ZLI+JU35U3wjEym9kVC3GAZzDFYwlvHJl7pFnLEsPp2Xm
	+u3H7uSPBVS7aW40A0ibDIu0IaHE6FcHMHp0yd9S+LD4IdiSshiSdaNnjKgHplxNIVFDlzGTlvk
	a8QXoR5wSO0yjUVXVbg2+Ut4j6/W+zTUv/gm/F4cBNQ64ixDPQ/g/O1auur07bHbohoU+x5gH29
	/K4kDNhHQbiXWsiImC0vSj3FkyTHVqh4GxFymNDUeHcQNRn5kOdae2Jv6ZfbXDhDXXfZG6vp/8B
	2uRMIuMMG0kv2EteVdIoH6tBnI0VWSSzhpMXfaQPPxSv9OA6U=
X-Received: by 2002:a05:6a00:a02:b0:848:2f73:8fff with SMTP id d2e1a72fcca58-848436944cfmr10668853b3a.72.1783660125218;
        Thu, 09 Jul 2026 22:08:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:44 -0700 (PDT)
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
Subject: [PATCH v3 26/27] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:10 +0700
Message-ID: <20260710050511.14439-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220845_971755_A187C53F 
X-CRM114-Status: GOOD (  14.66  )
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
 sound/soc/codecs/rt721-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 041b381e582b..d54f3f2d5bdd 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -466,13 +467,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt721_sdca->disable_irq_lock);
-	rt721_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt721_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt721_sdca->disable_irq_lock) {
+		rt721_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -494,13 +495,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt721->disable_irq_lock);
-		if (rt721->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt721->disable_irq = false;
+		scoped_guard(mutex, &rt721->disable_irq_lock) {
+			if (rt721->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt721->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt721->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 35960c225224..159c35d19dba 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -5,7 +5,7 @@
 // Copyright(c) 2024 Realtek Semiconductor Corp.
 //
 //
-
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -289,7 +289,7 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 {
-	mutex_lock(&rt721->calibrate_mutex);
+	guard(mutex)(&rt721->calibrate_mutex);
 	if (rt721->hs_jack) {
 		sdw_write_no_pm(rt721->slave, SDW_SCP_SDCA_INTMASK1,
 			SDW_SCP_SDCA_INTMASK_SDCA_0);
@@ -309,7 +309,6 @@ static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 		rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_GE_REL_CTRL1, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt721->calibrate_mutex);
 }
 
 static int rt721_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


