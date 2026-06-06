Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A57CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 04:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1rjS832aE1oA+NWR2plR5pJJ8WRs2Vb19cfZDQa4g2Y=; b=bvyUDf2NE1LPE6J+r9GDwCqG9K
	1RjrgBIqupa8vJbT4zJFA9xu9eVCJWz73jJdTZ1csnIIZcDimzf8eYEsMjWCk83X8Xt+Rw4crWiM8
	xf4TaNESa3taYyGZWcrECtbnyvxXSj7lVZWRFwSeoeZaa0Fg0GAZ6LQ/jTVBA42/kkSC8NPEY67Hf
	xUvMQi/kZWOv1BzR56q/u90IdWaoCwsNLTt/pmLKIqFUQNv70o1dL88/zd2GFM4KwNXiKsKRb4WPd
	aMEkG+8FAN4++AuyxosYjJJWTL2ruX6iqEdLL+uFqg1Nl4tSK4LiVQiaM3VfrkVGz9YfjIZgG12Qz
	1YgNB4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wViJa-00000001R0h-3DSJ;
	Sat, 06 Jun 2026 04:07:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wViJY-00000001Qzl-1kah
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 04:07:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c0c3546924so17263235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 21:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780718835; x=1781323635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rjS832aE1oA+NWR2plR5pJJ8WRs2Vb19cfZDQa4g2Y=;
        b=CFi8GXERi4nu1UU2jNdSlBHaLXHgGY6EzGnJ1HBSYqcI7Bj9xB9PRjAeYbeSpGZMat
         /5R+sEj/8un5XAuEtDCBpzqcj1gf5UzuP1GvS+t/XbpI3aSVwLoOZWtfD4lwLDD/ZjHH
         uaMuSlnDxWkroynzqsrJToLIeDXQ5oolcYf2/qd8L031O7Tg3Q8wQcyMZ0XWUian6SYT
         d2MeDGhm76yGGkm6SpIE0zN8WlR4aYu6RPK2XiljKfTvxxtroU8EtKr/zeqXylBzguTn
         UCd/EzdHEbcT43jg0UzX3HTZ4h83gFyE/ORgmXs8b+8WbDFhCdz/81OeN5sqcg2oDq7D
         BVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780718835; x=1781323635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rjS832aE1oA+NWR2plR5pJJ8WRs2Vb19cfZDQa4g2Y=;
        b=G12MlrXx4jb7/GfUHgt5jdNxKTaCCTvrfL6OcR6Bb/7Du67f6EBNgsGsnXMYo91ZH9
         /kPa9RHKGLw6JUkfSqADE3DRqWgEzcAHjh2O4W5k3dCSEteAZoVok3Q8Bn40wYjd1SVT
         RCjiWdisYG6EmJlMIdfaTaaSC5TVG7I7zZ/mV8lEa8/ZgGWvECnzZNry+w07Dj9ectDB
         JoCWjx7maZxG4lKuTFuQgW1GVPnMVjPPH57Wjh7ivPBd13jG5vxs2XZtGeduqaQtgZb6
         KkKzwW79+9mp0q6u3Jc3s9YDWNAC9hpt/dkduGWeNc+FfCc8tW243zxF2O43pq1Kpudg
         u30Q==
X-Forwarded-Encrypted: i=1; AFNElJ9RUOzkY6JSJYyB89IpXDrkCNHC/qGCcS1ef/2ZV2ceBWX56hj8cj8V26NYKqQxnj8N225/iWFabJ+ifp+Zjb3P@lists.infradead.org
X-Gm-Message-State: AOJu0YzJnFJ+SlByER380n5+KrAaH+i8vjdzbXRH28pifigdalcOg9tG
	z/5oGb+uG2LNc4j6/+eLKZ8tJDk6vQhB71CpyFRBzjuLyUAiak39KCRG
X-Gm-Gg: Acq92OH4t0kuzCL3ctFQ3cuIzMXKqwwiwSbwAS8ahBAXq6LLpJWZmOnOad0K3vT4a1U
	NkupCfXx4YwOUfBBeHOU+uYbyiT3f18l2phG4aO6XuHE/qQ2bVbI6hVTsTVGGJqlRycRcVJ9Pwl
	uuO5/A51bjoeEz5kKbbdsw/OXddZTaRzucpVsmjR88jD7KYUahYR4KLyeTlZVs/dbiBRPq0FqpX
	/YQZ6BiAl6eSUeBUmBGjytrgdwRsZ+nfWF5VYh4VkGZneJSrMgw4/nk32zAju8OfVDlceJ9e6Uz
	hVdTwCkIfmkHAVZCm9XDIRFpyg2HEYCB2XM5XQiFZTl9BNiy8nHNayxwWltHs34mQUGk2MvWRy6
	gSpL4oP5pG/xlUR0bBfqvhQUxXK8R5TfJ6Rdd9gMpxI79v9QW7rv6LZfWQ/L91v4w2HxPqffOAq
	5ZBaCuUf7I6WkSaUwDVn8LW+iuf3NnPnT9Vm2wXgOnk678bSTt8TistQ==
X-Received: by 2002:a17:902:e78f:b0:2c0:a373:89bf with SMTP id d9443c01a7336-2c1e80f9975mr70654185ad.1.1780718835009;
        Fri, 05 Jun 2026 21:07:15 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:967f:7ce4:ec98:f08b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f84335sm107056905ad.19.2026.06.05.21.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:07:14 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8365: check suspend backup allocation
Date: Sat,  6 Jun 2026 12:07:08 +0800
Message-ID: <20260606040708.13-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_210716_456982_F52D83C3 
X-CRM114-Status: GOOD (  12.20  )
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

mt8365_afe_suspend() lazily allocates the register backup array and then
stores register values into it. If devm_kcalloc() fails, the suspend path
dereferences afe->reg_back_up in the backup loop.

Check the allocation result before using the array. Disable the main
clock before returning so the error path balances the clock enable at the
start of suspend.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index d01793394f225..74e4f53b31605 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1978,6 +1978,10 @@ static int mt8365_afe_suspend(struct device *dev)
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
+	if (!afe->reg_back_up) {
+		mt8365_afe_disable_main_clk(afe);
+		return -ENOMEM;
+	}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
-- 
2.34.1


