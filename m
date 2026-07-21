Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE5AC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=; b=dc1ZZTdixLHNOcbbc+Yb47DACQ
	51Lj228Z8TDCjnBqb8tQRyW95sAvOBQfsHmjNDn/MlxZNFK+/8BE+rDziZ/IYVMDd3dsudA+G9pgq
	b7CU1AJXKd36pq1DfF/7dOOPBOtCsC2RRTaWsJ5OOHM0DBbnticgjZqyVOQqObIF7eIqyo8wYFQLc
	j9ES09q/s8MGIfab9LiTgLx+EtkfVww5R2OXRGktO5MtG54vuB0DKaLj2MxnoMtp+JFiK0cP12t1q
	L4kLjHnPNRqxgRW1yD1eVeibE+A4psKO6CzhYL64pKsv/D8BizwnWIdJv/ykyPlIp3QCwfZv0b5Pq
	c5TGGQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7iS-00000009A0M-2r7R;
	Tue, 21 Jul 2026 10:28:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7iG-000000099oA-03v5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:28:38 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso127588065ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629715; x=1785234515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=KFydPjcr1c3maGXJaU/DdaClOr8gpBCEIlYJSiE8I9SiFlyofe+SKGu/GI/e2qLg1z
         VhyrLIHDlejdDfOx67Ow593WY6H4Ab6rSS6NLvT7JLwGAQrassWRyBYsxfoIF4m4PvVV
         UGxRvSEAKldysBDhgxZi6tnOtDriBNbdmHIURcdf7Pyqg7SWs0tWfKVqVpLpDnOl3fFr
         ybL88t+OmQUWkSQ8ycg6SS/xVK7erV/YCPCZTLdo4la8kvano7eYBn0VremLudJGcREA
         YK84a2qPN7OySFf5oe/8I/BlYpcTMP3MpI8Lq2QUVxJ92SzhMs80Z0PzuXb4qnKOm0Qu
         tLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629715; x=1785234515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=ZgqZFqaHp+Zdw+qyRwARd6Sp+hSEHaiRflhn7s2bsnlUA6ayczlxyMHbh2CQQUUjK3
         oNfroVQDJmUcwgaEUEbpTiIED4GYw2Bes0+TMyL6VxMGR8T6bzVNEChw7LuyhWVOn6dj
         yadsAfVeBxINNAhb3zzcd9rHtVXh84IhTLuKyYsf6kwdrpNwyMLTvR49R0hocqk8RbPz
         OPdj5oPVLZXhgWbL/BKRBVqoJ8ow6jn1/wcp9d7669vVqV9Ga0KMO7iS4WxNb6eizbM5
         hla7u7eWlUNRY9naR29waMWXLlAwpKbXFuyx7RXQOOCw5kQnvTbEseqadQpneNoDZi/n
         KB2w==
X-Forwarded-Encrypted: i=1; AHgh+Rob4gCJeoK8S59q9uUFEOHbA9j9oP+0UC2ACi6iIpu5QU1Yt/NHeTO2i7X/j35mB7/SvSehooX5V5hMdA3OWM75@lists.infradead.org
X-Gm-Message-State: AOJu0YxDJFKUveg+uf8Nw1Ptorq4fKX9oNvN2NM2sAQgOKPUz2nv/1C5
	BFdoLT6vJy7NECpX3eYioUcCNulH/drW/14OwRO/qksDlVlRsv9d5Na7
X-Gm-Gg: AR+sD11bZyvNSUTT2U3zEVkYu+ZPTEObYo5wpjoO9xmXjRBh7OI5Kr//lKGc9RR3mml
	Ij8sga2aL44Xz21YsOy6a+XAXzf0fKmHOW/Ohz5RW0rko2pXnSLFzyAKRPpUpllhkoDOPDmjIPc
	PnOmCEcAgOVTNleXdQcfgSpO3h/zIWpwbVSiIhHeWhDTpNExwiynz3yOfg69MR/VAcXr8jxjtSh
	+jw7eCzKNeHYKPMFsMI54ROJ0jlt5OncfIqcMoAFwDhWeV4toRDJ/fmG6KtDTeZMeW7x2pp2hy2
	RANTdddYCuxdCRhVgerQCJIIN+ImxTv+IYEILNY/hBVuNmhmTXJFHp3kE/F1EzqadR3UNa1o7Uf
	eIaHt/gJkugHo3FJyo8f5xGluBmtlp9rRUKj7Mmls1FF80FVUHjrZaXUJOtKAtl7MrbeU9aP0en
	7P7EKAeHKNdwi1RaMVRbvA2OELVpppxU4Pp38o
X-Received: by 2002:a17:902:cecd:b0:2c9:9a19:10c with SMTP id d9443c01a7336-2cf34a4c9d7mr187717855ad.40.1784629715407;
        Tue, 21 Jul 2026 03:28:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:35 -0700 (PDT)
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
Subject: [PATCH v4 17/29] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:48 +0700
Message-ID: <20260721102600.523199-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032836_129971_8EAEAA75 
X-CRM114-Status: GOOD (  13.53  )
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


