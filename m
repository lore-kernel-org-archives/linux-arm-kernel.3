Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD319C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPhO/s+nu5UxhSDYOLNe6C0ZQzan6vEsVi0GgxY87JQ=; b=qf1ITs9zxdI4fd2C92eN2jMubG
	Q2y4/mlRjxkAkxnC1jxgHItOI4azlqf8Bs4nRAptstuEZeK9avnkWRjr0t0G2ui1f9Mi7/vve3g0L
	17nSd3ler8x/5zuGvYRDCOljBwfGQdu16Gzbdm9yj9lwbi5LHDgzFMz01X1iyFwasdujvMaQbmYXH
	Zy5YCsI7DTIToocO8rfy72yZO37pO/0GCeI02p1rinTTlvzoTFfsVG+WG29opoSDnNPZ/cIoSn6c6
	bo4TmzRGMj5zbUIpOWMy+XSKCdfFYINbW3fXJM39x7kk0K/c6aIENzK9rGnxzs+Zhf7gTNPQFaaFf
	H5jRGPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jE-00000009Amr-0z5w;
	Tue, 21 Jul 2026 10:29:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jC-00000009AlA-406m
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Jul 2026 10:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oPhO/s+nu5UxhSDYOLNe6C0ZQzan6vEsVi0GgxY87JQ=; b=TFhK/Sz+WNEeu4JQXibeXcK0H/
	cvagtfb9JIVEC3pBE4ZO5qHML6+2BvXDnuUeS0A1eEHNTQMpsF0vLiIDm2eB7y9k+PQveyuJe/E4Y
	25KwrnV8Q0m9FD/1qxRTRbmlMrxBi8tnLymfkyqtND5DoFsXKIA+UO/BmCP4ea6hxPV2d7GRltvED
	L/+1k9YX/WnF02aLVrb/Vz3nSYize54TANO0D+Ya3vHRUqVTHh8ZKMmfTRoXjiXBlUj/3ElTk2psr
	Lq0YtoTCX3YTn7PJTnoVOQM1KHhm8RVa0cKTgFzEscm4cLVXH4k1WlQp7+UZiLT+dPlEYeFhFGAvp
	y12/b0+g==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm7jA-0000000HRpY-159p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:29:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2caea3f742bso132686755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629770; x=1785234570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPhO/s+nu5UxhSDYOLNe6C0ZQzan6vEsVi0GgxY87JQ=;
        b=kzh5+LgjC//PyS7lssliD8isJAgUgt0DUfIDxmxi/VtgbXuDca+MjqMVDHqkE063BX
         envMiXFo8yD+tkifqtcqO6hPpDiwkVhgo1RAqHlsonAC+b1ULDfPE541dSRhnIo03M6J
         bL6Bk9K2CordPO6vz2xWFoRRcapkwgEpQUHEBuXyejq0pc3Rey79rLVudTlgSkdRcZKg
         U/C5rQTZrpUzMubYj3+fteqKYLW0IZkot9Bahfuo5NIRqLS5oH2KkqZzUwfKqTaAAxZn
         REAScOiRRYIZ8hytSSkm3bhAhLMQFsIOKnhbSmlbxloGu1OJOUUKXZ8CE/A+CA1Kbi9l
         yALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629770; x=1785234570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPhO/s+nu5UxhSDYOLNe6C0ZQzan6vEsVi0GgxY87JQ=;
        b=TqR3VY5nd07vzP3gGP8A/yhxMRqJct8OG4NRk8duMYfYywgpAWEtDQtMNziTGPLZcU
         9D/DP11aGIaGLYhIvCUN1uAqDpksHxBGmvnYePACC941owOEDpK2aNTggAKcoG1bUCG4
         k2fvneSvwPz4YqQlFihWzUK6hg7iWe+fE8ioz1JiRFZSDTghuvFKyQGtqZQmlGD/zznq
         dnvxj+9AvofqdVouNgC9YcuhhL5I1LFk9VTeDD7uK2IhrkGotJ1jvGojJlEgg5DsRaAv
         zITzQnpVVh50kt1EuwjnajMCrCSejXK3Kj4GVDNnMT/wVOgwOuimLmK4xRJtLjJri1Te
         Co/w==
X-Forwarded-Encrypted: i=1; AHgh+Rq+GJaJVkwcUib6Cmsbgw94jlKQLA1PpfW37qCgcF9T4Dk+B42AVDXKCiCW9yvfDIhMJMSuAc64Yz80j9Rx4YeW@lists.infradead.org
X-Gm-Message-State: AOJu0YwOek7xL1H851gZUTxn8QwYV02CjHQ8U8pWo2njHJUaYr8vlz3G
	kZ8OGwYkt+G8BmYDem2OugyJ9FURdpADB0v0m6wDOoZ80vhVNOV+ZcTc
X-Gm-Gg: AR+sD13U1emju4G5XbXNhkLqOsIfJww0ieyoBeo2P/zsdZwuMaIBQWL7xlezb05gMCh
	n4DMQXniDWR661wR3F5iQxuPpsLcZfFkWv2wnd5AytloeIPFx2nqbn9PNNCLcExUv1uw9X2U4S+
	KtNdAbIDt0eThr+gUK+CsSn26YW4JuyAETKD/4oazF8UDTgSPORaT/uQb6OIIwSUHvKzNEt6otE
	ZlcAa/DKOm3EXWXrCW8SAGXtsIS7Us8GUY0GBfXlENhhGMkAv6enpZ7f5kpBN0D/rmBp9Z2Qz5o
	CkGgoDFoA+g4/6jVbfDhfkqQWiAT2ep/SzyhsRFbGJSI9VYDWrNkBrzWcpwPFZCNcPgk+fYxxpS
	9cGd8LAcrx4EK8ihypmCh04upn+SYD/pjorZfgS/cNiXL/Badl7GNSDtoyj/7kVFQssOkJxXR5p
	OMaa8A2nThjU3KxXGiouRKPd/AkgUTjtuA/C5w
X-Received: by 2002:a17:902:e548:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2cf34673ed1mr194644435ad.0.1784629770337;
        Tue, 21 Jul 2026 03:29:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:30 -0700 (PDT)
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
Subject: [PATCH v4 24/29] ASoC: codecs: rt711: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:55 +0700
Message-ID: <20260721102600.523199-25-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_112932_434023_3FCF7894 
X-CRM114-Status: GOOD (  18.45  )
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
 sound/soc/codecs/rt711-sdca-sdw.c | 29 ++++++++++--------
 sound/soc/codecs/rt711-sdca.c     |  5 ++--
 sound/soc/codecs/rt711-sdw.c      | 24 +++++++--------
 sound/soc/codecs/rt711.c          | 50 +++++++++++++++----------------
 4 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index e028a1c3a9ac..e292b28b029e 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -415,13 +416,13 @@ static int rt711_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt711_sdca->disable_irq_lock);
-	rt711_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt711_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt711_sdca->disable_irq_lock) {
+		rt711_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -443,13 +444,15 @@ static int rt711_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt711->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt711->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 3a26c782d800..9781f289f8ad 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -450,7 +451,7 @@ static void rt711_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 {
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	if (rt711->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -515,8 +516,6 @@ static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 
 		dev_dbg(&rt711->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt711->calibrate_mutex);
 }
 
 static int rt711_sdca_set_jack_detect(struct snd_soc_component *component,
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index a0c6a9efa840..4ad2b1da1954 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/soundwire/sdw.h>
@@ -422,12 +423,11 @@ static int rt711_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt711->disable_irq_lock);
+	guard(mutex)(&rt711->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt711->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt711->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt711->disable_irq_lock);
 
 	return 0;
 }
@@ -509,11 +509,11 @@ static int rt711_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt711->disable_irq_lock);
-	rt711->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt711->disable_irq_lock);
+	scoped_guard(mutex, &rt711->disable_irq_lock) {
+		rt711->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
@@ -535,12 +535,12 @@ static int rt711_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+				rt711->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt711->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 5dbe9b67703e..3e49c3d0f25b 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -89,24 +90,24 @@ static int rt711_calibration(struct rt711_priv *rt711)
 	struct regmap *regmap = rt711->regmap;
 	int ret = 0;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	regmap_write(rt711->regmap,
-		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+		     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
 	dev = regmap_get_device(regmap);
 
 	/* Calibration manual mode */
 	rt711_index_update_bits(regmap, RT711_VENDOR_REG, RT711_FSM_CTL,
-		0xf, 0x0);
+				0xf, 0x0);
 
 	/* trigger */
 	rt711_index_update_bits(regmap, RT711_VENDOR_CALI,
-		RT711_DAC_DC_CALI_CTL1, RT711_DAC_DC_CALI_TRIGGER,
-		RT711_DAC_DC_CALI_TRIGGER);
+				RT711_DAC_DC_CALI_CTL1, RT711_DAC_DC_CALI_TRIGGER,
+				RT711_DAC_DC_CALI_TRIGGER);
 
 	/* wait for calibration process */
 	rt711_index_read(regmap, RT711_VENDOR_CALI,
-		RT711_DAC_DC_CALI_CTL1, &val);
+			 RT711_DAC_DC_CALI_CTL1, &val);
 
 	while (val & RT711_DAC_DC_CALI_TRIGGER) {
 		if (loop >= 500) {
@@ -119,16 +120,15 @@ static int rt711_calibration(struct rt711_priv *rt711)
 
 		usleep_range(10000, 11000);
 		rt711_index_read(regmap, RT711_VENDOR_CALI,
-			RT711_DAC_DC_CALI_CTL1, &val);
+				 RT711_DAC_DC_CALI_CTL1, &val);
 	}
 
 	/* depop mode */
 	rt711_index_update_bits(regmap, RT711_VENDOR_REG,
-		RT711_FSM_CTL, 0xf, RT711_DEPOP_CTL);
+				RT711_FSM_CTL, 0xf, RT711_DEPOP_CTL);
 
 	regmap_write(rt711->regmap,
-		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
+		     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
@@ -362,24 +362,24 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt711->component);
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	/* power on */
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+			     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
 	if (rt711->hs_jack) {
 		/* unsolicited response & IRQ control */
 		regmap_write(rt711->regmap,
-			RT711_SET_MIC2_UNSOLICITED_ENABLE, 0x82);
+			     RT711_SET_MIC2_UNSOLICITED_ENABLE, 0x82);
 		regmap_write(rt711->regmap,
-			RT711_SET_HP_UNSOLICITED_ENABLE, 0x81);
+			     RT711_SET_HP_UNSOLICITED_ENABLE, 0x81);
 		regmap_write(rt711->regmap,
-			RT711_SET_INLINE_UNSOLICITED_ENABLE, 0x83);
+			     RT711_SET_INLINE_UNSOLICITED_ENABLE, 0x83);
 		rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
-			0x10, 0x2420);
+				  0x10, 0x2420);
 		rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
-			0x19, 0x2e11);
+				  0x19, 0x2e11);
 
 		switch (rt711->jd_src) {
 		case RT711_JD1:
@@ -449,8 +449,7 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 	/* power off */
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
+			     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 }
 
 static int rt711_set_jack_detect(struct snd_soc_component *component,
@@ -511,7 +510,7 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	unsigned int read_ll, read_rl;
 	int i;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	/* Can't use update bit function, so read the original value first */
 	addr_h = mc->reg;
@@ -599,7 +598,6 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		regmap_write(rt711->regmap,
 				RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
-	mutex_unlock(&rt711->calibrate_mutex);
 	return 0;
 }
 
@@ -908,11 +906,11 @@ static int rt711_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		mutex_lock(&rt711->calibrate_mutex);
-		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE,
-			AC_PWRST_D3);
-		mutex_unlock(&rt711->calibrate_mutex);
+		scoped_guard(mutex, &rt711->calibrate_mutex) {
+			regmap_write(rt711->regmap,
+				     RT711_SET_AUDIO_POWER_STATE,
+				     AC_PWRST_D3);
+		}
 		break;
 
 	default:
-- 
2.43.0


