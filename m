Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E515FC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEjcaLeodosmHYaYiyTfEDLf32OqTBL16rI4GMqtRw0=; b=u0lbhJaD1/HE4VVfQvOh7HtTCK
	x540c++OrIfOgA0X3nIT3uG9opxBX4AXKrRx9GwE4RlfYQket5MxBg1S4Ws5O36gKxpqaUFoUOphu
	+XNtq6wVl8IIxC5izgmQNqgSYiII18iLEMijAieaJVaUEwM9hbrccgj7R5DemHATjDiOpJaaS5plC
	UaTQ4y/6lMsoRfYVFI242SzTpnnY5IuIvoyMkUxWwd5W3fSFpvEVBHeJmf/ABVeiWkY1W/V+ILTCE
	PyYwGVleocg7g1ZKi2t6A1Dw9TE1x002u8SpDRJ9KqadDYaQX5VAn2eCA8fhwKyPNrbUzST8zK6ev
	XuxXY14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dCI-0000000EFOo-1O05;
	Thu, 10 Sep 2026 11:44:06 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dCF-0000000EFMe-2Am9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:44:05 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db1ca06b03so13178885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040642; x=1789645442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEjcaLeodosmHYaYiyTfEDLf32OqTBL16rI4GMqtRw0=;
        b=kNGLPYTswQTN15PGzYVM4OHANtttSKXKdtamEJi6ihy2R6BFk7V08d3vTS11RY3IQI
         NKRTovAqFX3JCmrrafxINKcacDEOwV3LEOckTx7GtGdJt+4sx1+NLOVhnab2HBgXkdB0
         LDFnUfiUD0XecaPbIwa3MLeL1WYeQG40INjEg5ffK3dmm5YJaNj8bjkzc46d7s5laqq6
         YWYhlAEhDpSlysYszuFLLuIJWpJjC0INyotm3ucXtMBLHCSxVFmuqAju+06fwYb8CPV3
         brAbFYyoOtv0fq10wf0uFezs+oTrnPo4d8/B6cuBPCd5J/1XP/vjhYDgxW1O/vOjZTh8
         fEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040642; x=1789645442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jEjcaLeodosmHYaYiyTfEDLf32OqTBL16rI4GMqtRw0=;
        b=pigEx+zM+hUXUXPYNd00LtjOi5UWvzcZ6RjQTuHPonY2gbjcucR9Le2DU9abvXCqVo
         7meFQXNuLA9BmiqprG7y1PP9v+iNfDqjrtBBd6Z4CiUNqk24YTl0Sv87l9to8mdfkrM5
         Sav4/LQcsKdDaj1dxmvSnSwGwEDO/cjB2ZGYi+DURFg2PDkkzfKdrTbsm0z1I89CITvi
         B7VtUrBZNwfjX80w15wnpl3DLS14s/XzBLnJLFE9hnDU1cK85sERfNzQUKgF9kh0FalT
         7qodeswOV+8d6uDq3J99FMRE1gwv35HJ33T3WP1It4qLdmwrGNaawsW2OXKZBpV5+KCY
         QMiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxbIO3C5e9waUIUiCWaxU2F5aZxPukRizBbKbzevmgBT2sst6nAwxvLYP8atoDInGQqf9bc0ofPEKbUtilrYwP@lists.infradead.org
X-Gm-Message-State: AFuF++kR19/rHY88g5yo1/lUfS/8xwmJdp7eM9Y+En7lZk2jL20T++tX
	m6r1qwPw815Uc7dk32Otk1ybNmM9Y0PvL28XNWtLKwmBDDXsZlslZQM0
X-Gm-Gg: AYBFou3uI2A5e4qIQSIyF68vMRDvc7FQ6VTWX5sZzeAMQpl9lZdtqnx9lncxQuXUi+t
	n2YtZ0jbr3SHQ6kpmqDcEm/zJdbwFyoRQuxod5lv+1/uClBHnuMjzuwCzZP8EFnRMRFP7oNyb5E
	fEEgsrHYI1i17jA0U2YDLqQTMYMEWxGsLIcDFqxA7ZL9GSRVp5PwYcSQL2hcwWl9Irc/FOEm+8+
	1THMg7RWu8A8QRd3sO0qytMMd1nihC4ZiH6y9ku0t1iZSZ8k99XpumBgeokLIP+iZqWbxyW49uS
	nlmFAO6hNS+a3utWHurq/8iCqY6lte7sDV6w8rQXMnCUpkIyGhbT+Eu7LaDhs4oL6c4TJWPSLU+
	gN3zjHU+FCGuMDWklaun2m9Gsi3amtK04prnuR3JR6c3Xj4hy9B1bEj1VYXf72IOCR4MuqouMpr
	FRaNl/gQaMTpaLv5KG993ahz94wxPSzDitOq4ocJIGFw2hMt/2iSWz2q0xyDAfDmwar2P7OKmxC
	c50BSVwIgpoa0u7O6AeBjWY71MyeQMNGAQjRYAHGxZHlPQ/gdHGHgHifeGO3xdfsGNgR/W3zrw4
	6K+7yfrHBQ/huLeVRShhP4Nv/w==
X-Received: by 2002:a17:903:1b6c:b0:2ca:12aa:a390 with SMTP id d9443c01a7336-2dd0dca9c9dmr43423175ad.0.1789040642448;
        Thu, 10 Sep 2026 04:44:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14959fd2sm87427155ad.23.2026.09.10.04.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:44:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Darren Ye <darren.ye@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: mediatek: common: Propagate PCM buffer errors
Date: Thu, 10 Sep 2026 18:43:38 +0700
Message-ID: <20260910114338.142682-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910114338.142682-1-phucduc.bui@gmail.com>
References: <20260910114338.142682-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_044403_566411_0DF140FD 
X-CRM114-Status: GOOD (  10.69  )
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

mtk_afe_pcm_new() currently ignores the return value of
snd_pcm_set_managed_buffer_all().

Return the error to the ASoC core.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index c1869b38c9e7..84218d137143 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -151,11 +151,10 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
-				       afe->preallocate_buffers ? size : 0,
-				       size);
 
-	return 0;
+	return snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
+					      afe->preallocate_buffers ? size : 0,
+					      size);
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
 
-- 
2.43.0


