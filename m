Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1296CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=; b=q4G2GHbPs3AUfpUH+yKV51wCmk
	QtRtHml3T1eDgUfM3rxBTNA7yHb6ublNzqcA4ZQhA6B8bt7ZOL+gWlRQJJGmMuPQVg5BjUMbJ6BiT
	ahFQJF8lHllvn9/x/vJDQehkWTgx66C90e4OKHx050IC3U7vRkvXC+6uRa2HeRhsOsv/JOrZ2uy1/
	ZXwSSedhnkavDN++hLgHPI32E17BCL4CTIeHmL7E7HoeD3wG5EIoznXWqr1h/bnBnq5n3iNjCWra6
	6RFA/gJP4ywyTiNxsaRCzdAa1zzv7R5ky2nmBRD3Yf0Al9RhDQvF+EfA+dur2FjWgrt5xxdnW/Ca/
	eNFxweRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3TK-00000004A11-0s5s;
	Fri, 10 Jul 2026 05:08:22 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3TI-000000049z8-11T0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:08:21 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8484a0b998fso707612b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660099; x=1784264899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=ojcXfYfpQvw5a7W1ad7PF1fujwZ/syRt6s9qyrZ018M01tIkCUaWHhAsW1cBPM3rJi
         8vQADCngtpvomm70DE2s8rknVGAkePr1yA4ftc+mCCETUlPna1DAxMhsDQ4ASV0DIro6
         F2kbpZO7SwbvbWnlayuhl5lj7iwfwEgMapcYg+i1xcLItXD53fuzyHWE1/iF9y2hAiES
         C4ahQrhipXzlFTGrYI0aOEFwJKadBEz3KTfQxr5nfT+TIzmZQ33talAjQBp1h8JqLslG
         xLMCvLaCsLEBCKYSmOewArzeMzAK/T/ZcuKm6/meby6OuyFpVNyYNcGFtmwXjpQXj0rz
         Ekfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660099; x=1784264899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg/gWaxirv5UsoAezn+cQqTNjJoliJnwtNunNsyjzH8=;
        b=WADVVOwKIkvEh7pbJEsmPd35Bf+p1ktkhiKF5rQ+Xs71YvrczawRFKfG9MGg3swsFj
         qz6FZ/YrbJJ9gN0PpavTfVisHfzBA2T5YvaFhIQnb0lvYzyvXI3tjWTkTbv8KJthqNkL
         6Bktr8gC269KMTfhvLqNvd22scUUjoXufWsC3meiQs7nQchhcdUSvO2Iq53n2qkQwdgF
         fQi8DhOx05s3XdAUzXbZbFRPOuMOZ6vGssgy0xPMhsbmk01lao9SokymTaNnoA7u4HAk
         EP9R1aKyOCM26IE4qNBphz/iLnSrpUASoAiw0/pK/P38/f2qggbMBNGptxDbTFXhCD8P
         Kaag==
X-Forwarded-Encrypted: i=1; AHgh+RqSn9z0WNG4oCuhMufkXcslhUJbEyzBnXe8R+T3FoVL4foQNvc/RQGGI4wrqDA/DCW4/53xLTL+Vco5cgqERNIg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2EyPGv54qMA+pl5F+hGfq6m3J/S6Vhl0mSyCYLFAg3mXfV7XO
	EphCcnotlQbFTT1LV+VVIvRBxvNxm85EY/Qsjc7aKIG4FRlR+6R54vDU
X-Gm-Gg: AfdE7clFo1BcWCPvPIqHGSEd0DdXtoU65hF/EKmhVmxs52V5fYszwtR6i3jQYmz0uFL
	RSPRPeoc9xJIU18Vn1gqv8cncBCjRbz6Z7mCTX77rInvpPkh8X85XC6YZz/r0a2KathcdvDFT6v
	U5MpbQUJEuANS4j7ZUKHrOWq3HIV9vWmTcwdjwn+JqRZbeiTY12Eoh97rn5APz0Zh/aN9xu0Vsv
	ZMGDgojcvWQKEPbJjkTS4sY9bb62ZX0S1TgV5Q98J2X9j5GpY7pI6IzoWO1i+A6Z9KWggQUV3rY
	nsYlADTTq2CQ6UEDC7QeCPr2tPyieqguDFVBJDkPPNgOgzmeCmP3M0uETXAGQmKdb2PdQglZd1l
	bkP+Bc1w7Q658jENOcYKerzjtmvkeIkKCKdq86ol5KNnRz14zzW12Hlj8MFdld9egF5ZCNQFaOR
	Umk/3Yr6wGzl6Fy7ZLZRSjtWU569Kq4AFLszit0LnqR1cW5ZA=
X-Received: by 2002:a05:6a00:1826:b0:848:2c2e:c7a3 with SMTP id d2e1a72fcca58-8484323444cmr9691356b3a.16.1783660099554;
        Thu, 09 Jul 2026 22:08:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:19 -0700 (PDT)
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
Subject: [PATCH v3 23/27] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:07 +0700
Message-ID: <20260710050511.14439-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220820_290726_02812C25 
X-CRM114-Status: GOOD (  13.08  )
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
 sound/soc/codecs/rt700-sdw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index bb449f08e30c..3ba0cc37acd9 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/soundwire/sdw.h>
@@ -415,12 +416,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -499,11 +499,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0


