Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CEACD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXVJClFlTnZc58L4TC2N3jn2K6slmmQnCORLu4klL7Y=; b=3IsW68Zt64GE0AuBRJfAhvAe4D
	ve5kiagj0vIuv7Z2ZdU/Euoif4vkgmbiPg31qwPdKeOT68hZnvPz9lQPobN3H63J2LJFcz37OpErM
	remmwzxbnORGDYstnOqyRTULvXTmMXPlEpmKZ3laIfPNcImxPCAyZGb8+BEOFCnUM5p9MBeKvQO7M
	U2fUCca8+/D5bkq+w5+JV/11PJ2DBlHVL7JO/aCWgwhPRUem6ID9OLSKzCWQ4fJCNG5qAgyxvwM23
	kflL27WaMPk0/7lE64B3bIWvpyWdWuWvM2TxdRZzgRldS/assoMrRkc2BpiDP7zXBiNoGD9Y17It2
	K0kgYTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3d-00000007NG2-3oqM;
	Wed, 10 Jun 2026 10:21:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3b-00000007NBx-14rf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:21:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c0c3315c5dso68728315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086870; x=1781691670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXVJClFlTnZc58L4TC2N3jn2K6slmmQnCORLu4klL7Y=;
        b=jcHBgBgVH5qvoJHZ+q9MxgoUNsupkyaDRz5euwCeakpC8hpusrGQfXbx3cAnLylOb0
         qjlgMJA3GQssZr/8zf8mtpqG/XyFbig9pQWXxAb4/282D7cRBoS0ZS3k1sKfBD4GvAtJ
         zTB2RrqvTXQacckyuvyWpWqkaZEc2036ndommRArtPq5TqUVDmz0+Ywjn27tAxdAAc+j
         WFToBOmhFLU08Rnu0fRVgrxVOt5DqzTBqgJSzSItgv3pd8c4lkLQCWJ3FOqcScXTjArH
         a8+cbs7dBjcZOgPdTwvPHjKpTJ8Jdv2z3lQLWC8k4B+T8XQGoZ9nHAg4WVOyaidtaw8l
         0okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086870; x=1781691670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXVJClFlTnZc58L4TC2N3jn2K6slmmQnCORLu4klL7Y=;
        b=VWJnkCDw0KToiSdr27fU3vbkbcd9h0J5Oa8aBH1DtP2tCC4Uu16/gr6XQczm8JVvGj
         Av2GQrc9a9ev1NV/laMFhRsroPsooC+5BL28BpARJRVeWOwIk1L9Ci2VAja76CNgFhVP
         XwhgU7cv745sfMxCJNAufWEgZVMdcUvgJoaqPfsYUrvf8ujoafqckd8fIpQLKRdqkz0Z
         4JjQviW794JGXw/gC0jI62hQuYBr1B+B2uvxNj36wLqZymzau8Eoy/WTYdHIhWYk3Sb4
         ENR82EerHSc29V1k6fGx+FIejH113gvjTG53X2q7vomQNSudzyrwZS2IcCSQxIcUNw9X
         w74g==
X-Forwarded-Encrypted: i=1; AFNElJ8TtIuisc6i76i8uVx98ZVBYESCuLfqaHDRSeH9Fovj307qr+YkS4RFLXgMu9SD2ZDL5bydC9CHAoD9j36x3GwQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjg6dWAVZfCipu3nS7hA+qFoo2yz3zjjbGqr8kFdTfLfgl8SjE
	mZHroP71Y05m2+JiWKYI3uf8OAgXBQ3cXHlqY61D+smHlbFpr5nozEBo
X-Gm-Gg: Acq92OFvsEgg6pW3qhBGd4gHr03CFr4EtBtv4K3JM617wfyPNteSPyZllazjMDufU9H
	p1DKuU1AnyaASWEOxKrDaJmXdfRqzZVL+sA5F43js7xpGNhCZjdOTOQTWNm5QoZ8S5RiApNcOv4
	W1FtXaI/jfAMsE2/iaRCrS91sqKvktLqNztKcs7vnA0SfDcZff2hlIkmwQs+m98qAXlAt5l4iBL
	FUdGNQGe8L8ZcpJ/QYUxtg3jCG7m6/C+a0Ls9YRIV8L+dQGWE8NOQULFD67X1mxlZC/Cwy5LVtk
	VbUfgNAGXfiiX7XEpMBsK0ZYaS+tdcKebBTvSq10CztQGrLZY7ZL8y//eafpBwu2PL2ezYlqico
	MoqmUlB8xVIymzu424QtpgWStfwAdAUlLbxoXlU725hQabditBYC9hzaLKeZuEGnOgApMx+zNoq
	WAgLoyLjhrdV2kLnAkrgjMCwB/g82AdTQYZP8lvmeRtfqebdUqaUsN+Ro3NdrKnVS4qMWL
X-Received: by 2002:a17:903:b0b:b0:2c2:1e6c:450f with SMTP id d9443c01a7336-2c21e6c46c8mr212600175ad.10.1781086870419;
        Wed, 10 Jun 2026 03:21:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/10] ASoC: mediatek: mt8195: mt8195-dai-etdm: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:18 +0700
Message-ID: <20260610102021.83273-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032111_307942_531B0F81 
X-CRM114-Status: GOOD (  12.83  )
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 5dcc8ed26e00..1a20adb2cbf5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1318,24 +1318,22 @@ static int mt8195_afe_enable_etdm(struct mtk_base_afe *afe, int dai_id)
 	struct etdm_con_reg etdm_reg;
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
-	unsigned long flags;
 
 	if (!mt8195_afe_etdm_is_valid(dai_id))
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai_id];
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 	etdm_data->en_ref_cnt++;
 	if (etdm_data->en_ref_cnt == 1) {
 		ret = get_etdm_reg(dai_id, &etdm_reg);
 		if (ret < 0)
-			goto out;
+			return ret;
 
 		regmap_update_bits(afe->regmap, etdm_reg.con0,
 				   ETDM_CON0_EN, ETDM_CON0_EN);
 	}
-out:
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
 	return ret;
 }
 
@@ -1345,26 +1343,24 @@ static int mt8195_afe_disable_etdm(struct mtk_base_afe *afe, int dai_id)
 	struct etdm_con_reg etdm_reg;
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
-	unsigned long flags;
 
 	if (!mt8195_afe_etdm_is_valid(dai_id))
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai_id];
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 	if (etdm_data->en_ref_cnt > 0) {
 		etdm_data->en_ref_cnt--;
 		if (etdm_data->en_ref_cnt == 0) {
 			ret = get_etdm_reg(dai_id, &etdm_reg);
 			if (ret < 0)
-				goto out;
+				return ret;
 
 			regmap_update_bits(afe->regmap, etdm_reg.con0,
 					   ETDM_CON0_EN, 0);
 		}
 	}
-out:
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
 	return ret;
 }
 
-- 
2.43.0


