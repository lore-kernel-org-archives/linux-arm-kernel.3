Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A8DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=; b=3P+CTluBa2jISy5l6GSBBaCMly
	8E19vt+sTtQr7skYuZnpxBTXQpYAZEQHO5XNWPQIWisWCh2nnr/G+NvHJpQlcVmuNmiV/0tZkG/87
	NhW3N2E735JWjcK+cDcHpjtLmDpigFiT+yklZU5a3vkjryadNmtYIeBCZps5N/nnVZH9xEEXk/a7G
	AgOnZe7U0EUbK0vfU3JUgGYrUy9XGb8kihyUIzWWKCKDxscWfo3mEYSCyXkXexRZd2ou9M/5Xdxim
	b6t6/NfI4sqH9aRcJ0mPP9wsAsu6OvqG/zOFfXrv7Vt9ucDVVvuJ7A64I4SUG91oq62uHY3FTr8CS
	H3YJSQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6N-0000000Fzhv-0VfB;
	Tue, 30 Jun 2026 06:37:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6L-0000000Fzfu-2giH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=; b=Ft6vgdom5ib9jKGnV7LPe3eX5u
	MmAp8jOw3kJ9Vwou9EwrA5mTLdRW/r13Nf26gBTP74CGjiuARxHHE1+9m2ib8VfUEPfZjqTSu0YZC
	XohhIk8EBXm5dJ4J92NgH++yG23nhvKl+1osq/lILjZnk+PlyOF9kTiviNc3AHMiIUZJB6btR3fhx
	CSh89QLyzo2hK1jsuYkG/ixjCDntwnAHMNz5VMQzoBTul7e0Ob26IDawg4luvU94gUWen+XTMEDDl
	YO39tJgWHcczHXftcBv6mlQNTC1AdckSXvwvMBkbIVtYc4IiqF4GypGjv8pTrqNu/I1bvXVWABZFo
	RHPJMg3w==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS6E-00000001ZOI-1azp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:37:42 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-847a483e344so188369b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801456; x=1783406256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=RvQmI9cJHWM7mOMQ49DgOlpzOrO1bRdA3yldL1PiUPni97uMDV49kT4BZONhIOzY6T
         F+7C5z73wtT8hujkubK7YhsEvY5j0Xo7ofdqsmu2YxLFlA3hk2HJvIwBovs7E79loDZp
         4Ay7EIDKwH/fQeW1eo1YY20c3vZDBeIoarscVYJOfMttrGvSMWKlFhPJijhGF0sNS0Oj
         HTmoonG+da9lLo3RzKLkqaugOuUbGgpl4fHy56Bg0+knlv06slCMZnGIXdepzNjnKD0r
         yQv26nqB9taMYIrw5Q9S3So/y+g7p46uXJT9+VHZX2cNvoeMpTc6L8iLDkeJHDqNx9Rm
         VO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801456; x=1783406256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=lHg+UE0i9jLTbXr2Sk4XtCCwm24C5WuWjArr4S5VXxSi8EnhHr7x71Puf4/s+iAGfH
         qiFo4McOhI4GzbqoPHlmiCa+nrlh+I9kzAkoh1IcMUielZGIpWVGJoiJieyFRZjWbrky
         8eMLtAj/J49UEV3fArc0FZVnkNmo/laFh7j8zZVQIlOeECXyl3WYoKk0EV33yQ54l0bI
         TrN7Ej5Px3XoeayT3jDH+HUwfQ8Cmal6uCGM2iXCNC5a+EX2OB94CasyM1trtZ9EhUcf
         WFgagJX/8boloO2InjisRZ362s2p4SgQ6kD1wyWi12CiFfgLHJWiMDm/JGP6fr+1Uj8A
         uzwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXYqJJ26hMiJUSNFW5H5bJjsZZYPX3PKyg0aYKcu5W48r3YTOx5u6P89zRRZr1wTsaaxvu25KKQw6kd8h3wTnx@lists.infradead.org
X-Gm-Message-State: AOJu0YxA/6QevAcZSxDXz8oqudzeyc43x9CbmMEf98l3mKewEJqdNCQr
	8arOHtOlQB/zUrDtPBk7A0aaNa01PS81vgAE9nUSdFKkwSeSQ3eQmGHu
X-Gm-Gg: AfdE7cm5sGth8giqnLq5oaspAiG/zpMB1fPWCctb1hn58rAy6B7+s514il+4Yu2TRN1
	wouh26riLx0sfKNquDMJpnULWhBlz5uTCd+yNodgLJEQaATpDg2ENOwFu0Sy1llydxfK0WD6bl8
	w6AefPFj0kHAIJ975zJpyLFsR21cA3mjshDNXbLmJyjIY/4wCh5/FSA0Wpwce5Y/dF/RVt1bbkX
	hvYufgjll8Rfp3v5PTTmM6gZ2YJXPYq6Y+IgD8lZ9K5MOK1QBMNMUp/wYVOhZ9tSUPQ2eZ+etwx
	Uc+WF+ZK7cIqk1JbQPpWXhaL+sNbNx7E7SmzoFxi3tOo6xNBFyz1NsaDnRnowBL416NS8IZejME
	fVPTh7q7gn2gnJjWaowQJnizCGes9Q4LgQYDMMuQAkZbdl/a6MtukzwVoUxTO3AEjpT0Xa/KSZY
	lRgehhNSB14WNbgRq1hJkgBO3yqSMA600Rvj5e3roDLN3dkGE=
X-Received: by 2002:a05:6a00:3d04:b0:837:f111:b70 with SMTP id d2e1a72fcca58-847a81835d1mr428150b3a.4.1782801456574;
        Mon, 29 Jun 2026 23:37:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:36 -0700 (PDT)
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
Subject: [PATCH 17/27] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:39 +0700
Message-ID: <20260630063449.503996-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073739_239144_57BFC7C2 
X-CRM114-Status: GOOD (  13.17  )
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
 sound/soc/codecs/rt5514-spi.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 199507d12841..91290bfe8daa 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -6,6 +6,7 @@
  * Author: Oder Chiou <oder_chiou@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/input.h>
 #include <linux/spi/spi.h>
@@ -79,17 +80,17 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	unsigned int cur_wp, remain_data;
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	if (!rt5514_dsp->substream) {
 		dev_err(rt5514_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5514_dsp->substream->runtime;
 	period_bytes = snd_pcm_lib_period_bytes(rt5514_dsp->substream);
 	if (!period_bytes) {
 		schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-		goto done;
+		return;
 	}
 
 	if (rt5514_dsp->buf_size % period_bytes)
@@ -111,7 +112,7 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 
 		if (remain_data < period_bytes) {
 			schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-			goto done;
+			return;
 		}
 	}
 
@@ -146,9 +147,6 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	snd_pcm_period_elapsed(rt5514_dsp->substream);
 
 	schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-
-done:
-	mutex_unlock(&rt5514_dsp->dma_lock);
 }
 
 static void rt5514_schedule_copy(struct rt5514_dsp *rt5514_dsp)
@@ -216,7 +214,7 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 		snd_soc_component_get_drvdata(component);
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	rt5514_dsp->substream = substream;
 	rt5514_dsp->dma_offset = 0;
 
@@ -225,8 +223,6 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 	if (buf[0] & RT5514_IRQ_STATUS_BIT)
 		rt5514_schedule_copy(rt5514_dsp);
 
-	mutex_unlock(&rt5514_dsp->dma_lock);
-
 	return 0;
 }
 
@@ -236,9 +232,8 @@ static int rt5514_spi_hw_free(struct snd_soc_component *component,
 	struct rt5514_dsp *rt5514_dsp =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5514_dsp->dma_lock);
-	rt5514_dsp->substream = NULL;
-	mutex_unlock(&rt5514_dsp->dma_lock);
+	scoped_guard(mutex, &rt5514_dsp->dma_lock)
+		rt5514_dsp->substream = NULL;
 
 	cancel_delayed_work_sync(&rt5514_dsp->copy_work);
 
-- 
2.43.0


