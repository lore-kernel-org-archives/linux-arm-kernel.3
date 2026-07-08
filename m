Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DBEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=; b=rwPJDM85jbxb1y0zTSyd7Rlfgw
	sDya5oOHZxSYMvL/jQlEtSnDDlbelXVARH3dz1Q5GklWqinYlE2rtKmnjQfBlzoPVJsOjBRNvQkc9
	vnXno4lEjLhGfFoVgsmPUkShTKn23YbPwpotXfimcPVKZm1EFBz2PGJLGp6UCHSHhA5J4LDP8VCSi
	+zikouqjlyFvaj8o5X9bi+ziNlAB0vq+Dm1/lk6vKADISU+S5/0qZk2jeP0DDgPqBjX0wdkgqonZi
	9j96LZVtA+oM5OlmGHscotxQCiLyNwaXP94DGTA3Gd4Gp0bIYrcC1Pqf8IZbnQiRnmA4/d+sx8o4v
	DEk4O54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9S-0000000HHnp-3AFE;
	Wed, 08 Jul 2026 14:21:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9O-0000000HHjs-3Y04
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:21:25 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso9395285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520482; x=1784125282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=lVYmMGEHLsGsrxoueXVIOZRGRMQndQJS6bL6YvztEawgsbMWAdYFw9sw+o3Ge908fR
         6pRK3m7WgtExANYYizfYXITo+vtC2gpyWzvlvSVfVnZeYYpHWGSNytwGVo9RoHwl5PRn
         RoNW5l5EsEvd47uoDfkMw7DLqllhGU7k4X7r1A3EIYBvIRyDPzN1zDVe8WW5E3D/zM/m
         gIWljH43ctJeUQqGashyGjfwfpipw1vYPnd/jIZGX/hQv5N+HtPmXng8RIIc5Aa62NDJ
         07UKNEQBhl5CPFlxGKuJdXlASpEk5iSNxGYhmSKGR6Y1ckaMLu5K5qV6Z+reKhgAFHOx
         Guxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520482; x=1784125282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=POk8pVgrvVq0zmImIFagDEZwLFoHu9pNlKDUf2IN1juVHToU9IIaYt0rXt88RPIL0H
         /9Re/E2dMvuxlYt5wgtdV9liVpbqtKqZrzBQ7YG7PVGXes4cSc+5GkZ/LKRbAn6WUl0K
         +mzehZv4Rf4LvboGAm6LaRrIRQGYD1m1SRZkcgOcRigPjZ9hRMMPqL7CUsCq5xN8ifL4
         M2j7CsRCh89EQOZb2y+cQFqnSl3zIYlupJKbTWrAUhVIxvV/9p1UFaJaW4QaQJPJ8W8C
         d5weM93hNwbf6SKMS5d+iPqSlD9d+ed2feTiJTIqAhO7zytOHGSBj+SW6J0RYZ57ztZU
         utow==
X-Forwarded-Encrypted: i=1; AHgh+Rp6PX74UNr2HESTpsD0DuCTrQsXWau3lGsPlDtlsL8ylvH2ldEJkRYyeagGruEUppkeZhg6sW9AIK0vdNaLR0vF@lists.infradead.org
X-Gm-Message-State: AOJu0YwO26uKt6Nf8637e4zh9dOwyPmzOQIUKWmhosKw8B2h7r4038cp
	zIM15njamUE9/zELNF3CTOCWPAo4FqjrdT+gDR+E14NAFlL08JzhK7hy
X-Gm-Gg: AfdE7cnKj069zKpIUlfc2jQRzJGvirSoy3lf3spsgMYSN/hIKLUHQeBcp5eViO/EEVX
	oGk0lEJz560FtdIWlr5/iV70cvFEf07v4PadTTD9c0g0hcGXhGNOKFGbMAwGLeDIJ9A4+60mtEL
	FZ/bwtTqICMniiy+WtuNd2y+fMrFSkgDyUkmH6+8Zdy6g0eG/2bPFCtd4sDWwttrgY/OVmA0Gse
	yTIq0gd0MUU/YyNnbvx28VVCEIjA9AzHmeTI/2aCLNAADtUfNUZv0MCPwN+BchIvMpjAV167+GH
	3vOg9s+jEZj/HA39v21iXJS6CA8YrVgE2S4ajfHPbm8GjDvuOPnyUnITWd/1BcolI3GSUUJ8rmj
	fVI1KYK2uj5oLTchZXu510P2BW0vG24e2Q9hc6PcmH5XHUUcvfjnQwGRpXm+3iDCymMJsroDKjH
	A9dKaI62IRiIKK/NShxA0Pfkq/wK+kKwAE5sPYj8TKsg9HtZo=
X-Received: by 2002:a17:903:4684:b0:2ca:9ab:e723 with SMTP id d9443c01a7336-2ccea481a57mr30746255ad.33.1783520482185;
        Wed, 08 Jul 2026 07:21:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:21 -0700 (PDT)
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
Subject: [PATCH v2 17/27] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:24 +0700
Message-ID: <20260708141734.578926-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072122_889597_2F00B587 
X-CRM114-Status: GOOD (  13.88  )
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


