Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82727CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1QeGLnTyUL0/QJF0HVH9R665IeUBRSb9Jie1YUIXrk=; b=Xmr7xFvWcAjQXr95uBFwYeZYVS
	xUNfcZjRI66RfgmD+eCIaFcadPeI1JyvEq/apGYJg1UaGnlQaUv6I6oOVQzh55m8sbvoWtHTqq888
	fE37XmPfJ15INkgv5Q4x58zIfGS3Y+4jxhtknN2irthBiQVTOWcCaTEPP9mSkyY7EJnc1J2WNUkTb
	OmpQaTVkOqb38b/+EjBrJVkDQ9/Z/sy+lbne2gnj7n9i3G+IvJ/WPiRe0tiE+8B9o3jGRjqgnqsVb
	wWyl6yzWWPo+uHIYyhzS0K/TUjyPoBm3o+9zktb/WzKABnT2CVjul/jV09CFtYDu478VPrE46XXqb
	LfvkYZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbr-0000000H4yR-21FZ;
	Wed, 17 Jun 2026 10:35:03 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbo-0000000H4vb-3XZN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:35:02 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-30bd47b9f0fso480760eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692500; x=1782297300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1QeGLnTyUL0/QJF0HVH9R665IeUBRSb9Jie1YUIXrk=;
        b=Fz0MhC001KZTxfsa4BLPJxcAnyZJ8Q5S83ls+rWpf6KLtWYCq5H20Kw4tBBD5h0P/b
         6A+OcC+hC7YSRGgiROwhIjTiDSyQIdVNR/KZmeSu0+geE5M2YTvAN2ROi9fMyReb8hjW
         0LC0d1mrL9Kkohe0uc8R47kwD2SR3G+20+JXqyG8rTduYMDCY+wNH1dBNcrV8/4TxrQP
         PNs5YB8rWKqxiyOOMHeiy8MoE78UMR0inU8UMagMcOtTY6gupIqMMLQALYnpTWBAzQ0B
         FuT1jmBkg+gc4KYoY7wDbjTOF+MlbDvBsbRZVHiHQhZyOUfJt/8pHp8Ko1CuuskQnS4G
         tFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692500; x=1782297300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U1QeGLnTyUL0/QJF0HVH9R665IeUBRSb9Jie1YUIXrk=;
        b=osupRhUgh4Iasji2QWZTRL4/sytjMb9dosajE4rmmh9cRd4cytbypsapgqRB7Ah2mF
         /Oxld4NyHauQJzqOh/0cQTrRYPgxccBcRiGtjHqlfhcL/GlAtf/K7KGMfjmLqymnXPyA
         pVsSsLhE4SlcTi1UwoEaJ+mhRQw7RWUzu5SwycC3p+4/yll+vJwXsQvN/3IlTW1q/mAT
         ZuSpBbzFyaFPZM3mQe6dhMVvQXfmCvKJuYDObSj75wBIAmifRvcJ7qcyWcj5ZOHW7I7i
         wV7gb540nhyPb0NyGqc84GhsL0ZyFK0sjEzJwitNUiNl4oMxA/OYPLSK8EweTlKQFpwg
         Xu6w==
X-Forwarded-Encrypted: i=1; AFNElJ+vYLmjzj4OTTXN6JyUggxXq0sqz05p62EDFezRFesB+3Cc1AZBcf8B5PUQgKKYoSN58GipKKANNEb9selWiAaQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxMTLhi5RKaiJVZ4N7bX7Jg4I65rGxKah5PffJ97fKu/5o1tXjc
	7DJowob6uakwKr96UdL5IuzCdmUloK3h/VW9ilFkL0wVHT58764GyBOT
X-Gm-Gg: AfdE7cnWibygZ5CW21KYjzigPa/99iVL4AsUI2Caj06mphtQZ/ORaepLmlB91Q1TimO
	IJ66HO5h4RSIj8EaJ2Ot7ckmvh+1uJFJjgk9di/TvwHdjwNPZgsqX/fIWn/lCbqpv/8W717xBnc
	WkJuKXtwQBRzB+eDAO8ltZAj7YbtqIx+Y7ZMOZP3ETo13DeA1UMH+9K9bfbVIufLhFh83sIqvFw
	2ZFzU9lC0/r7K+fsdl4e+lTv8oB3K3+IJtHH1t5SN2PXeZ4fMSQRBmomJQWOtIwN4PqV92pqmIr
	5Oaxh3MUZT8BiqxpJJK00udgX2LCyQv8Tel2PEJrox0udxeDlnXRgD9qEO91RZ8CM2voSPNjgz/
	uWL8h9BhcF4ZVpbKEolebsbGP13SHwwtcvuHPIUI5RJ+A0VkJKzCsv+xErVigzpU9Osy4nOTlNR
	Q/FCW6Ta2ppcu+XLwugE2RcZMQPpp74Dok3HRhAleJrISpn6g=
X-Received: by 2002:a05:7301:7c0e:b0:303:f295:4db2 with SMTP id 5a478bee46e88-30bc91d96d0mr1569188eec.0.1781692499885;
        Wed, 17 Jun 2026 03:34:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:59 -0700 (PDT)
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
Subject: [PATCH 13/78] ASoC: codecs: cs35l56: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:30 +0700
Message-ID: <20260617103235.449609-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033500_894033_3FFA43C1 
X-CRM114-Status: GOOD (  17.27  )
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
 sound/soc/codecs/cs35l56-shared.c |  6 ++--
 sound/soc/codecs/cs35l56.c        | 56 +++++++++++++++----------------
 2 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f14e2eaaa4ee..6cb835a5aaac 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -645,12 +645,12 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (!cs35l56_base->init_done)
 		return IRQ_NONE;
 
-	mutex_lock(&cs35l56_base->irq_lock);
+	guard(mutex)(&cs35l56_base->irq_lock);
 
 	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
 	if (rv < 0) {
 		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
-		goto err_unlock;
+		return ret;
 	}
 
 	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
@@ -692,8 +692,6 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 err:
 	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
 
 	return ret;
 }
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 570a68829ccd..98ebf38c9bb7 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -848,42 +848,40 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 	if (ret)
 		goto err;
 
-	mutex_lock(&cs35l56->base.irq_lock);
+	scoped_guard(mutex, &cs35l56->base.irq_lock) {
+		reinit_completion(&cs35l56->init_completion);
 
-	reinit_completion(&cs35l56->init_completion);
-
-	cs35l56->soft_resetting = true;
-	cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
+		cs35l56->soft_resetting = true;
+		cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
 
-	if (cs35l56->sdw_peripheral) {
-		/*
-		 * The system-reset causes the CS35L56 to detach from the bus.
-		 * Wait for the manager to re-enumerate the CS35L56 and
-		 * cs35l56_init() to run again.
-		 */
-		if (!wait_for_completion_timeout(&cs35l56->init_completion,
-						 msecs_to_jiffies(5000))) {
-			dev_err(cs35l56->base.dev, "%s: init_completion timed out (SDW)\n",
-				__func__);
-			goto err_unlock;
+		if (cs35l56->sdw_peripheral) {
+			/*
+			 * The system-reset causes the CS35L56 to detach from the bus.
+			 * Wait for the manager to re-enumerate the CS35L56 and
+			 * cs35l56_init() to run again.
+			 */
+			if (!wait_for_completion_timeout(&cs35l56->init_completion,
+							 msecs_to_jiffies(5000))) {
+				dev_err(cs35l56->base.dev, "%s: init_completion timed out (SDW)\n",
+					__func__);
+				goto err;
+			}
+		} else if (cs35l56_init(cs35l56)) {
+			goto err;
 		}
-	} else if (cs35l56_init(cs35l56)) {
-		goto err_unlock;
-	}
 
-	/* Check if the firmware is still reported missing */
-	cs35l56_warn_if_firmware_missing(&cs35l56->base);
+		/* Check if the firmware is still reported missing */
+		cs35l56_warn_if_firmware_missing(&cs35l56->base);
 
-	regmap_clear_bits(cs35l56->base.regmap,
-			  cs35l56->base.fw_reg->prot_sts,
-			  CS35L56_FIRMWARE_MISSING);
-	cs35l56->base.fw_patched = true;
+		regmap_clear_bits(cs35l56->base.regmap,
+				  cs35l56->base.fw_reg->prot_sts,
+				  CS35L56_FIRMWARE_MISSING);
+		cs35l56->base.fw_patched = true;
 
-	if (cs35l56_write_cal(cs35l56) == 0)
-		cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
+		if (cs35l56_write_cal(cs35l56) == 0)
+			cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
+	}
 
-err_unlock:
-	mutex_unlock(&cs35l56->base.irq_lock);
 err:
 	cs35l56_enable_sdw_interrupts(cs35l56);
 }
-- 
2.43.0


