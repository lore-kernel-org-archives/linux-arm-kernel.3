Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF0EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+Jtygu+85BYYl+nZawFG490qiPpGrZE3faHfj25h+8=; b=Ki6jjXY+yr1RuUxkOG7VPc9uux
	w4GHCP96EHB1j2qgummNc4vrBjey8I1/Lu0VQomM+RRclgiEmKMMS/f0Usimzt7tncg0ALdPI0eaO
	o3yGr5IHazbl/P+RvlCPaVFED3nO4MoGkd0kjRCrdtzPtBG9LiSp9G9ovILc8jsp1ebj6/mH9sz2Q
	TSPogEEB62p2iA84SVYgwE9LMN7mau5lUni8PJXuAwO765NJyHgUAfrQ/DiILC4LMtNWOLvhIXfyC
	3zYd07Ew7x+t7HwvoHM6oQYoUhsx1uYEaY3B1+p5erfcZiwyEzsvAH9x2E8xPctFaSpdXDv4p6Xa6
	dDNdwslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9W-0000000HHri-0Qwi;
	Wed, 08 Jul 2026 14:21:30 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9F-0000000HHce-1nAY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:21:26 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc6dd436c6so7920705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520473; x=1784125273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+Jtygu+85BYYl+nZawFG490qiPpGrZE3faHfj25h+8=;
        b=PoOZvZ/oZl1Xi+DB50JMJEjFxQAKdk55GfPlyXJsXndPKsJ+XlyONmdFe+FFZDUrYs
         o8rNrD2up2q4DqSa0rpn9Q690S2dh8j+w6W1Ptw/B4sx4Z/Yp0CMWrBU/QySBDVCbq6C
         /L5PthRGH8jIZdmNL3YUMmOfjhfgiS5q6bwajhi8IlVrnuK22IiOaOrEwjhhd7z0RICY
         kiUx6HWhQsP60ZSrhRrEC/bVn3eyGiOulGLmkFrjFhP4E/EimEgT2hWS//zDVbvuiH0E
         BwVwLGeccnF9n0Deg8PjUMvlu7UFUXQDG0p2pIygS2zNyGiPmnlPKFFBKkuBR2aGhdxs
         fpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520473; x=1784125273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+Jtygu+85BYYl+nZawFG490qiPpGrZE3faHfj25h+8=;
        b=exHeeGyPmKVC5AAfCPMiRQln85wRb6L6omWp4Phpk1Vfjb9szFsADQbs4H5VNGUYk3
         IXT9FBbjprYmvQfoo00JVJObUl7HqGXPFPL0UgfQwQCGURlthe+VsdKIjGGOOZTTkb+M
         BaPj6A0hGLahDiUDYSQyyDgkS3u7OQ2HYBPHd2vB7XWpq3k3dSvNW/dAaN7WAcGqYnwM
         ThI47e2RdQLKvk5vfPz415qgUjUOVpvbsgXNkAozKTWeMdomQzwEZQ54BjUjQC/zSIjW
         vqc73KyWTsZfTzuGD0cSFCRg2WfUCV4fQobXqnCdw1dZjlyJvyxvZ0jcnGPU0IDzimPz
         u9+g==
X-Forwarded-Encrypted: i=1; AHgh+RrZo/tMfUjSRsI9ULwxlSyQs+ZwzuJqCUt8+Y+0Vutl27FjeukVaDEbK5gCRrNqNvaVodvNo2CVGlpkkg9dJweO@lists.infradead.org
X-Gm-Message-State: AOJu0YzgROB42uYvlj2mYLl8T5I/rWxNbdAOTjW9PeKaLLZo7mdIrkiN
	mHoALQKsJcNTwpeLNehKv18YBu4dT/HcjqpzRlAS3hujpZnwBesaqkxW
X-Gm-Gg: AfdE7cnRKMjW/tpTVoxJ6VBFqueCEzz6ndTZRwrc52v2j/Pn17n8ysd7bQCbQqorcVN
	MDIsiqa5pjL1nlWh6EJCMjBdOrKDTBQENq32wM3HhcdxWvJK5w+DIwCv5q+2MA/D/sc908IGDUE
	Hk2Z37oSYHCuUyQ8+kz4qj0w9r2ggJjMiYUI+1LKhuw3GPVr1VR0IgtLDUAkLirXx+jxBBZzG/M
	AESBF6AotCNX8zhBIrEMLvyWzvIGS0nWfsVusLlixSz8fYXt6gBitdGqhz4zyTkG9gYF1WvAdxx
	o4Su47N/oZVoTyWIQucLUCEOCfOz/tK1lmV7ulIdV/SzE/KLi47OuyBzwOn84zHY2AEHz1ZL4S2
	azaRShst5XZS6/PAqFdAwkvJvVGn6H7ppSZBXjLC/RqNVC8c/0STYPd7D+54MWg2lzcdCJ42b3N
	iFYP3QG7a0IeT5WyMPYvTnE9CpeU/xmcRb+lOWT6/JnCeenxfZ4Pd0AfKoUA==
X-Received: by 2002:a17:903:2307:b0:2ca:6d2a:871 with SMTP id d9443c01a7336-2ccea47c7a5mr27721945ad.37.1783520472703;
        Wed, 08 Jul 2026 07:21:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:12 -0700 (PDT)
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
Subject: [PATCH v2 16/27] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:23 +0700
Message-ID: <20260708141734.578926-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072113_486798_C823565B 
X-CRM114-Status: GOOD (  14.98  )
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

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Add Reviewed-by tags from Herve.

 sound/soc/codecs/peb2466.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..5a1ed02abb84 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/clk.h>
 #include <linux/firmware.h>
@@ -1704,13 +1705,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	 * So, a specific cache value is used.
 	 */
 
-	mutex_lock(&peb2466->gpio.lock);
+	guard(mutex)(&peb2466->gpio.lock);
 
 	cache = peb2466_chip_gpio_get_cache(peb2466, xr_reg);
-	if (!cache) {
-		ret = -EINVAL;
-		goto end;
-	}
+	if (!cache)
+		return -EINVAL;
 
 	tmp = *cache;
 	tmp &= ~mask;
@@ -1718,14 +1717,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
 	ret = regmap_write(peb2466->regmap, xr_reg, tmp);
 	if (ret)
-		goto end;
+		return ret;
 
 	*cache = tmp;
-	ret = 0;
 
-end:
-	mutex_unlock(&peb2466->gpio.lock);
-	return ret;
+	return 0;
 }
 
 static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
-- 
2.43.0


