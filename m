Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05BCCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=; b=Ycf7Q2kJDY4xQyivauuLXZhX9D
	tpkYgKcrau/F5kyEpPc+WnjQXzS3KSpMtxe/Y+ty+560JAEyeUn6+DaDBw7mKKz7d6rD8a5Vumz2s
	wrI6DXAvg+3EiDwQWP6KdV0FQya7CYSyowXZzumX2sF83USAIrA7Jw5rVc5osR+cHV2SDifKMZbJT
	Pg1dX4s1CRmAijfk4hh+s85B3yISB8M0UBzgUgmTe/NQ8LgCJVmcMxYu9DA711wla2EZ4oZYa78u8
	Usx/NoRXX9ab1MlGLD+DAJTXbplsGgxOEIApxfHJq+7xgitEp6plSkT0kpMYXR3jWRqMFlIJu92t8
	IQg1mNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dr-00000000Tdb-2G0u;
	Tue, 06 Oct 2026 10:16:35 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Do-00000000Tbt-2bGX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:33 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-88bc25fcd0eso2291957b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281791; x=1791886591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=aZ5M58PxYOuk2x11beT3Sng1M+OrMhp988rwCoAc8Od3s4jsH5mIvQohv3bRGNtBnF
         M6eBCKkBLSLXmZ4eb7wM2TstCWVFhoeUu1F2R1Rky1QhMnW3RXsXJKRfGHgy5DX9qHzV
         1tOuHSSOJ1e7g55Cp6xzTKKuQt6GN5QfVN4OKicvxEM67f+aAsDfFo5608OBmvAoQLlo
         1ITaGnshBbSnwTl/iI8lGcMtPJ9r67TPYWjFgV5pNuHghv0mupi+8FmdDrS7YoPEXBXe
         6oGRHQL+W2WgKf8Q6DVlpiJ+XULMZ75pN6sFsMnPPMMrUqh3U5UeYp6RhQJa9X2XBws+
         0QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281791; x=1791886591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=xyvC3Qv6vCtsAaJTtpwD6Vd2GiqCJYA6PgHFJNBMk1JrsweKJMRPH1+jARFy2Mic1N
         imLxF1e1qHvdISShdJEQq4JPrlPTPe/35DdsQeDMaZ02L1bCe1J0GvDweo+hSs0jw0Er
         6u5E0BLcRCQkQWbfGgl7CKCTe0ranFfSEY5MkrS4rVewqiMwrD5o0L29DCWtp2hIuQay
         AZv2CCdRe1np9wU/m2RSRjP4I8a1hp3CLP3iRiAcrkMwgaO8wJl23DBYiyd65qgj89IY
         rSaDBQZMZ7st7zo7oAQxQpikE7VIUkCeZr5ztUTQKsMUlbEVKYyGx2il1DtaFDAsA/UN
         1UzA==
X-Forwarded-Encrypted: i=1; AKwUvBwuO/hJ7+SlGNCykOuPCiObVj3EBeYDzVJS7oBFQ2Dfd8kOknYmxoKILaZ1b8wSgHWGu9U35prmLyiqtD+RL8XE@lists.infradead.org
X-Gm-Message-State: AFuF++l+2125C8A98orL+NbIh3XcEMH2N5Orj8c+7xSu5m7bRsxrioGU
	DH3P+PC1DmXyWvMNT725xZZGFOslY4RzBJM/pYridrgm7PJ9iFnWavU/
X-Gm-Gg: AYBFou08SEmGi3VeD36rgTvLVxZxHBK3lmeDX8jGy8b5S7pP37HT8OGQ7CfwVFL2VKZ
	uRO+dg8mEoEY/momO/4zEswYgTmQAS0k8XhQ8t1gt0wyAx728nTTCBKj8qJBXxUTl3HQ0hkjKd0
	26a5me3r3tT47Y29sTLYEZ0t6H+EVLUClmFkXhCjdRm8r62ZWzJKxXKSzEHz+LTAGO4zaOr6KiI
	XqvS6bJeaaA+pJPCh3lu5NAU+WHMrybG+UVZQOpmJiR+c6NGoTckaNo/tMugtZO8V38KknGh2Nt
	1WwF/NwR77WM34G9g7XvFdDym3tctDzjPcDC61Szzrm2j6IUX8uH/MvU03j/zOWH/FD0HXfyjIJ
	Zr0pXlcNQ0tdnhCyf42+RAFvXEqbVLcVZrkUyoUtVddZ4oCySWIdWLULi1iEwHRUiUagFeK9u3v
	A61ZU6ejTtSa5itD6oS/YnJ7JVp3MuedQ5pT22a+nX/wRW3y8r6Q3mZM/Do5KQY3pTlQrCuwmJ6
	QFRIDpZEPbr9XT7jy8V8Z33ehAnis+cVfYVGaHT8IXLKz1pKxfRWrr//YkqgGzY6QLDT3+D7JTc
	gZACm+tpMLjhPw==
X-Received: by 2002:a05:6a00:14c2:b0:885:e24e:16c5 with SMTP id d2e1a72fcca58-88c64d112b6mr9929947b3a.50.1791281791595;
        Tue, 06 Oct 2026 03:16:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:03 +0700
Message-ID: <20261006101606.54079-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031632_664950_6B21C9FB 
X-CRM114-Status: GOOD (  13.52  )
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mtk_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 283b612429a2 ("ASoC: mediatek: implement mediatek common structure")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 948f606cbaf2..ec99bc4a5d5e 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -75,8 +75,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -88,10 +90,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 		} else {
 			dev_err(afe->dev, "%s() error: no more asys irq\n",
 				__func__);
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_fe_startup);
 
-- 
2.43.0


