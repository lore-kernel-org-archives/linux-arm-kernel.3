Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9345CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=; b=47MFGrLmQu7hV5MVGq4EyLRD07
	3Tzi0fN1x83BIxJ2vOpqQ+8/uVhDwYZQhYmTQ0jzolI1XNL8oaBkqZ5HChMnHD3xFvxgzb9lKGQkJ
	2q4aIy/zbvorTvySO2cf1rPdDNKVwK+W5L20tXoupBgs2jhqoYeDe2/jqehvAL7Vtj2lbYA1MllFA
	ENFGN97iP6WywS2Sugu3SlRnE3eh/DlAgB9wRJYynncCUkTGYyrekeu4IXW9ePEM5ngW3LutTdeIq
	vhVx65ckrZOg8pcMaF0dkcLB3E8HyjiEvbiGzUz+AnFct7dYDIYTjwqDqSQSVZZyKyoMQo65uQ6Nl
	WXvNCkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnh4-0000000H9IB-30ek;
	Wed, 17 Jun 2026 10:40:26 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnh2-0000000H9Fm-1g0u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:40:25 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-137ec563a95so6414788c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692824; x=1782297624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=LilvcNdIbvkAXwzCfhHPbSCCctRc9D02gzW7jIbJEtcMEYo3+RthOu3PrxO7SmJ4pf
         vHnbglvx9ZYHi+1D1ecUwhhSmzcKjSM+55m5raDXAaWnlYZcaxGY/ygshSon5MwBcQlC
         5JjBT3196+F2q7mT6375I+uHKCA9r0CGHe3EuvlYCnOafhUB611DYrZVTF+Do3lEG56h
         Lp50FOsZWnKlRNN53G4F0TIQUBPDGaNYcvPnN22v/MpmUGk5vbiZOo4ukmbEflm7ASwB
         2qMBh4+yV/yJBIg+tyL+ilnqZ/2ZG0JxtKNThd6kD/HKIrGu5EKVSZsGCm3DSlV7/cHx
         ZVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692824; x=1782297624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=VN6UB7SLNPU3KPRHTHiActljje90kOa80vxAj+bHnLmSVeD7Jbu3E314cRffmi4Lwo
         5KCQ1yfpZl5IU6GTsK879ooHZj1SdtuqtqYLZsKdMIvA9/fDxwiL2uHMDj5eHJZEmaVc
         b7LwtFWovMVlrjua1oxXoYIt6x7nTDYnPU7uKuxHnakU0QH2IZw+M6gOnh1xyLxRywyq
         pJDGthNqQmeDf91OFaIBy6uxiYDwI4AKmVUbIaJxLbTJFTWdVYBahREMTQfKhDZkZSxw
         BcDh2ddKUjatqmzF8nVLjG0XmSSyxDeevKhk/hfBpLm9SlsujLL32k/OFNZSetBHEnTi
         eEtA==
X-Forwarded-Encrypted: i=1; AFNElJ+a1TuHb1qgGnlG5Pt8zzxAfzdXfLRQw8L+OndM+FEw1tlA9VNBvMbkvQicoQRdY0V3UtgyRXB9JPERuKYaeGsD@lists.infradead.org
X-Gm-Message-State: AOJu0YzRzUBCswAHwQl78Hx7TosRw7FE0ut9nrB3+Z66o/Xttyn06VsB
	rigYRN8AJLuFkbVCnGX8XZGzsNRe+cajqb6QSo/DwpnyDOj15ivxnLgw
X-Gm-Gg: AfdE7clwGKyehK6IS8PnoorLuQj0PKwXVzRG9k2DsN/R0WiOypq1AkCGtwdiszOatS8
	c+Hq5/nY7b84RGNRiiD6/MTmaulbc5PCrSHjjSgPe0qeTqdhmjKnyZbsulsJrW82GQ5g44lmot7
	PjNIQMiU8uuYZiio8V2hZxegljyKTZ3e6tytDSPF6l1m7QEf19SdrNQRpUp2rKhghX13tuh1utA
	YwTkoTeVh+DhlGTpfn7Q4ZwM606WC+Y/c9ksRTbGo/bkerb4Gkcrodh+Up88WIJ5e8eCmV8G8to
	ky4OWtDE5eaWiS+KJx9tWEUHrnEu/jsnuQNNgM2u3oLEzzCu8J4Y9vGwGtos9XMSPuxBmTdb9KR
	BoXFpUa6KXLka70t7mrW460Al75t2rFsmAWi8UyUMmMKH7E327TBqwzJspwEr1u8dnWoEjNXhs9
	n1xfZs/IktNULtfayyve1wL5OFe4dO1UgsRwZOcoB+FVkBNR/7vUKFQBoGwQ==
X-Received: by 2002:a05:7301:6583:b0:304:e59a:e3d1 with SMTP id 5a478bee46e88-30bca0e2049mr1526809eec.24.1781692823559;
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
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
Subject: [PATCH 47/78] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:04 +0700
Message-ID: <20260617103235.449609-48-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034024_446353_FBA224DD 
X-CRM114-Status: GOOD (  12.15  )
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
 sound/soc/codecs/rt700-sdw.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 30fcca210f05..8b15bbc31ac3 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -416,12 +416,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
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
@@ -502,11 +501,11 @@ static int rt700_dev_system_suspend(struct device *dev)
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


