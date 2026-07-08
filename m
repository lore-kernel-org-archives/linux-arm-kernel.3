Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA86C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=; b=LZcvNHfMiHXUo7JhpY97nveshj
	GX7hMaFM3qJEsEwAvjcPDIoJn19TzndDOSU/sCosmFo0bdlPP2KBA6V1PJ1YOGe1c3O+WHPzDie8t
	LEdALwFijXLVWQXIy+g7kVvHfCBVGl0M+tzm7MvxVaTDg8PXZEJaIjpedhZnf0y2rsSE/HfXWvHjF
	DvKJJfwJsDDgDwT8kNpY2EjkaCwtLPS3aA1QLe14+VoA3IUJhhTdIXUc6RjuC8rjdnSnH1WX1yiWY
	jPM9emJDsdgfaHJihdIim27Hy4Bwje27MuvUugv5nAQVeNjJ76nH5AYv7f8nZBUlhBurVJl3QMd02
	XstBAZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAv-0000000HJ4e-3L1S;
	Wed, 08 Jul 2026 14:22:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAj-0000000HItH-0zU5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:22:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cc84e77e78so6183155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520564; x=1784125364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=npTDoh/q1Wvjmit7A2FA1WpSbBGKxBLK9zmlq5Ys7O+LIt4vpwcQs7EqVIabeNirYD
         XPHZLX0Y5WuHluvkMDcFhTxI4jyit87D8E59CA7oCQLDEMTL+0Foqyv+WGt09NaKnP+H
         VFhsKeR9E7fDkwfiDz7J282MOyZO6xLzlB7ZvTHJWaGl9F16DWS33sa77k15zE8zH39u
         izLOcLOGg3xnovhEOLpZfheopiQP29De4NTqnP9R95Mb2fmu02jsVrAqwaspIsVxE3ZR
         62qNaGsUOzMU8ri4x9SQJFsXxKTVw8+5KcUn6m9Kf3tptoMNlL4xXlNBeQbq+D48H/3q
         X8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520564; x=1784125364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=onlhUv9qxPNRarIY0Lo5Ux52hRk5H6v7Nub1TmJh7k1mvk8lfjqoXR+L6rdsYu8NZ3
         Q4Vsp3vxCkufJ1+yIKCFdrGeoGJxCm8tIvUk9puZdy7BxQ6LKzwkPUkS0hgeT/IH6exb
         eKgyCVBvJbwj9gCKez0FaMP/9cpMwT22iZBdjqVTAS4WMxaQOOK42j8cwLaIO0xBysyw
         vl2sP9E/A7XrNHA2h7MG+5/6UKqmjfLNcYZEko3sH/rCS8PAFNoh1Q+/NZHqsGuuCKzo
         aUWc7mGnF8eAPXtfaFhwxyADhjefNYBdrdYT+blu6D4uxnCmUXCTI0lepX93pHwDdqcX
         oQwA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6rERaeDoNn2VUONJLPMaSw5+GIx1080Vv8p5A1h+jY9BscGH/xksGXixFBEpHFHsCUX/HajefET7yOPw1ibVm@lists.infradead.org
X-Gm-Message-State: AOJu0YwirFnn3q2OXJHPgb4S+hdGGTLmsC0di66ra2BoOIOtslqIT5Ob
	95ENzXe/ciIliZvRMHMSKgn06L384CunQ0oe6nsXuEj8NUyLCpOZIp8K
X-Gm-Gg: AfdE7cmLB7O6dSvXVTVprgBXGHE37gUuHoy+6fs7gJd1dpEyrBoRdbJqkNef8lsVX8F
	7vtarpm3Orqx82eS8kV0ZIat0ZcWOaurpTaYcRPFJx16t3rqVDRPvE4oIZNxCCDkWDFutVJJY59
	u3rDdAhFRtWZCJzv3qyMMNUjVJrv/P7QxRjSJD6NNNMY1djFRc7Iu1mSIOfObYOmPXBBUvUqnzS
	0zUaYb4Tw3vs79SY0d88lLlanLNN0BoCFeuQvUwgq5E7yZ1863xSAUPRULVOvG4tKona2EhDrSx
	pAKzQUsMUdiyjCXE3XjJRVxaoaUrospeVbxt2fUm5M48YCOk0c3ZgV4swEp1LTQfNCBUwAo85cR
	YLjM3OY9cVdupq385N4/IHvK4jr0OmGm+oGsHhnctKNCnK+UtXseC8S81mAXtKto+XtWrURhr1v
	0emNvfimZ7qfLC3/PrwP/8xaU2HX+qL+XRSvHi0lVoKuCyJCc=
X-Received: by 2002:a17:903:234f:b0:2c9:97a8:8c17 with SMTP id d9443c01a7336-2ccea5962bemr27443295ad.42.1783520564494;
        Wed, 08 Jul 2026 07:22:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:44 -0700 (PDT)
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
Subject: [PATCH v2 27/27] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:34 +0700
Message-ID: <20260708141734.578926-28-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072245_274990_68655B89 
X-CRM114-Status: GOOD (  15.83  )
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
 sound/soc/codecs/rt722-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt722-sdca.c     |  4 ++--
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 284900933ebf..895b8b2ed607 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -514,13 +515,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt722_sdca->disable_irq_lock);
-	rt722_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt722_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt722_sdca->disable_irq_lock) {
+		rt722_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -542,13 +543,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt722->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt722->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1b6729f363fc..decf9407ab6d 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -294,7 +295,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +318,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


