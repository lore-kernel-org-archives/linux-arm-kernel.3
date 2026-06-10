Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B96FCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8yD0V3JpTBBCPvBkTEEQc4c3oKXbaRtxhAPfIJqxXo=; b=zpSq7j/9s+qTChidDGiksU0NiK
	Hn/mU9WWOJiLunXuR3pZpOhnjzU5aMRKgcHSut05e/v9QKrYhZ/JEX2Wy6SjlJ0s1yY6pJKEOVBVI
	GPFw31G9LJTOjHZXx33uEqliQAsdlI5zCXh1Gawd2c2v/VgdvzVK/ApJGjm0FXKDmdnDr+bPMK8Ne
	uoHSDmhabPghiYgwlvnH+8GNbqNzgYz+W1uETBUk48kZs96J/h8St3YZD5avXecd9Y0KIcDM6EEKt
	h11iQ4PxWny4Y9sVU3eSsKRQj2dyXJB87K+BUdjYHz+ETC7uvWLOcAhDGBqs2bb5JUUFtMrmLi8jI
	+1ABp8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3n-00000007NSD-1yfF;
	Wed, 10 Jun 2026 10:21:23 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3k-00000007NNm-0YZW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:21:21 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so4466063a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086879; x=1781691679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8yD0V3JpTBBCPvBkTEEQc4c3oKXbaRtxhAPfIJqxXo=;
        b=T+xZu7dx77LbSVkY5mezXCoEQI8t6JyZIQS5fwHHeqRaKJ0xkLXrb1ZcQhYBh6UIVC
         pieG466KlPCWUaXC9CHLiWbWfeDqBcUJQBfow2Tb681WiuMYZHK5NIznTpO8EaH/miQu
         qwSWEbSZffX1CZG4nrIZKqNjNgFrTBosaZziQvck+i7JQaq579/HNZ6x5RZmaD44zJds
         TaZlXRJ+rC34/xwr59kKcnxj8e4k6NPVvbmC1pSFn5rGQUqdmlrL56iZO5vFR1T6t7A+
         KTBdqTialsaiUxWOAs3dUWrVOlID2rxI48LX3tXYLuRjGB7u2tKlT1wtlxDqMDFLwyq4
         yWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086879; x=1781691679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i8yD0V3JpTBBCPvBkTEEQc4c3oKXbaRtxhAPfIJqxXo=;
        b=nRGn+mjKOnpkRMKe3m+2BqxJQ2RdDN2TfaAlnrEZhy9HfEmXVUF+uv7yXHk9kQeOiE
         vXQ50vgZ5CS+5dT3fRuHOIJ/l3+3jPVy4obZxUu7PvPZRYQ6/0Cjx4qi0HMyQf3mu0I5
         fkv2NL5rHrtbD2EwIz7kwPEElOcJISq6GrQXEYVUAAX2kPMl2BoiT0517X9xQKgbn+Cq
         NDhq7GC3aOQIXCFmF/eJpeLoC73so36Qtf/skG00t9mT21zEzKcD+Hd+4zS/Cn/PsgT1
         9NKMnlg3pj0hnJqaXCE3O/UzxmgAv9jRH5KkULmTC8vw48KTMilAwn+/rDlslimgn4On
         uJQg==
X-Forwarded-Encrypted: i=1; AFNElJ+BYtWJ5KOOKHXPpvJM78tLmeXNk3yAwG67ADt8WNvbg/qo8P0GcOBpCK56Uk4wLR/WJPytPb0Oy2ZBCT58cKFp@lists.infradead.org
X-Gm-Message-State: AOJu0YwTAvSERykbksbIGahEUbMQ0Voz4YV0WIjzj7TxnJPAaYe71VQ3
	Iy3ZfMo0XDVGj6nsxJabGv5G4+8zo4Arp6Pv/y+022HscE546KvSCmlQ
X-Gm-Gg: Acq92OEbceV4+ZEyWHjNFcIyQ5vGI5af1hkpmXHfQJia/xxtAgxhvB+G42UVBhWl/Gj
	tDLbwHDmweEtBnVqwgmdEAWRppjt8DVab67HF2EtNrcbAuvg4U02UAJNsFguFMjalyex6AVwKDf
	eUeNkv7UiRsSOy3ghIinWVszoI2pgjzgfYrRyZqlEy8XdOuE+MAEioZQ4AAahODM7oSVzDZn+Pm
	QVZjTstqffj/RBZ8PQamT9a7sV0nHOb8Gl23BcH4HYPDBsvAL/msHutFTiY3AvnvviLsMHxHs1s
	FZvzbkNrIjKg2zm40yfpBklcOVNDp4n+5j3aBlmkq22L1Leg4RfvfPtB7AiPpYIrKFUXaSNZ+cn
	wEBxoOnNHKVTeO3Ea/ltV2pe+m8Y3Scn3Z95S188ZpgKiaNzj84Rw29YEksUDtXsDWla1Z8ymR4
	XlftSzxoxihsi+x3kdwyyG7+f8sqTKxldNA8w2cZ2i51C1D3im1c/1iL4jOytfVLz2jQUz
X-Received: by 2002:a17:902:da4b:b0:2c1:f262:494d with SMTP id d9443c01a7336-2c1f2624a70mr252269075ad.19.1781086879138;
        Wed, 10 Jun 2026 03:21:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:18 -0700 (PDT)
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
Subject: [PATCH 09/10] ASoC: mediatek: mt8195: mt8365-dai-adda: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:20 +0700
Message-ID: <20260610102021.83273-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032120_195885_DE6D5793 
X-CRM114-Status: GOOD (  12.16  )
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
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-adda.c b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
index a04c24bbfcff..d8eda9e17eb8 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
@@ -63,10 +63,9 @@ static int mt8365_dai_set_adda_in(struct mtk_base_afe *afe, unsigned int rate)
 
 int mt8365_dai_enable_adda_on(struct mtk_base_afe *afe)
 {
-	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	adda_afe_on_ref_cnt++;
 	if (adda_afe_on_ref_cnt == 1)
@@ -74,17 +73,14 @@ int mt8365_dai_enable_adda_on(struct mtk_base_afe *afe)
 				   AFE_ADDA_UL_DL_ADDA_AFE_ON,
 				   AFE_ADDA_UL_DL_ADDA_AFE_ON);
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
 int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
 {
-	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	adda_afe_on_ref_cnt--;
 	if (adda_afe_on_ref_cnt == 0)
@@ -96,8 +92,6 @@ int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
 		dev_warn(afe->dev, "Abnormal adda_on ref count. Force it to 0\n");
 	}
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
-- 
2.43.0


