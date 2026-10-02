Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F035CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 04:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTeu9HyQ7QnjlcIIK3OqakZx+SHSODb4TDDJ1zx8l2A=; b=WxgKTeCZsDobHe0WX1Wma5IGEG
	ox9OBo70Yenh46LgDiWB+s7zam4XWIcl90xcHA+Jc/4ZtS/MZk2jPF9h5wdq3A/W5M2E58SjAahmI
	xtGUtiV0jKWDVQgp7VGRTtDMdaRp/9jtf9Mtexmn4Zx/ycTUgxZR0Mzpjy0soOgtr5r13uvh52uUk
	mNfHp7dqE3U83pMGbQnhKDE0clP6r68MgpuqncPatvftsLz1pzBk1CXJmTu8s0lpKP3RiACbkhf7B
	K02Y0gEUHVSzQ8gWvWuTkN3VxNdmv5D0FeUILQZkS35Vt5iJ2pOVuUfSu1/tfiUr5C4zubb00bN0j
	Li2XAz9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3U-0000000Ac2T-2uXH;
	Fri, 02 Oct 2026 04:39:32 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3Q-0000000Ac0x-27n7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 04:39:30 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2e2bfc2540cso19002045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 21:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915967; x=1791520767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTeu9HyQ7QnjlcIIK3OqakZx+SHSODb4TDDJ1zx8l2A=;
        b=lrf9cwgOzmqJXzQa5bGu/p5XnRGolsJ547YrbVFRmdobevlSGsourZD/m+LQNfcpyS
         VODk6yjf6IgFNyTDtPaz5Dg0lxqarjSYSa1ceNN+nxzWRq8av8cYuV9+WFIM/XD05y6C
         CV469qIkszOtQW8sEgJ2ygFnIuIdgJfCPE2ohgzNPtVlJgspvA5a9SUXSO7AdggY0f+0
         Ahrvk7nk2LlGDfeIOeh+XfvBXJc3UkriHpyv8NS7hOBUhboYpmrums1cYoRkhn2TfFeh
         vk7YMZN4VERgOtem04gsH2lszpryAe+g6a7mjIGKOR3et5Vzhe/lvEh9mp7q8xoM9z2/
         15Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915967; x=1791520767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTeu9HyQ7QnjlcIIK3OqakZx+SHSODb4TDDJ1zx8l2A=;
        b=ZtaXfqwk7Z4t78EzrkwG2wWFjnIOAe140/VpTx5kGUcQQMKM5Uh2A9EFJJX2Z2b5CE
         qlrmZFWw56tcDP1ZxQq7b030n++781+GQ0RFxBQjHqN1eOAwah14waGbeVk1NzS6GymI
         RNfxk3rW+NaNf0RFPeRnf/lb1s0lu82Ja6JdrC2l8llmYCJZvyq9CZMD9N1dCJqN6pNj
         HgKTAQdfA37LByU1w0QOU/cn7fMp0ThSlGuQqFjeXUfpGFcjdDYgsS2FBW2uICQXnVxM
         labb5GHhyZIJzmQbRF65T1yxo09JtQDJTpAFPBnWPjtF+9dM7dUKtka4KWQKHFqyJcOG
         icxw==
X-Forwarded-Encrypted: i=1; AKwUvByKWkRN2XECReR12F9dzmoE44rzjIkwsAm+9si/7viJhzVYZI0QfIaLycClQuAU88xkmESQcMAlZI0JGEZK9Pi4@lists.infradead.org
X-Gm-Message-State: AFq9FYIUpdWFQTmjZKGuBqol3hk7JIULUNFVuh7WkirYNODKhKmez61O
	En29b5Exm0PgYzmrKzWiOcGcXSC43hdBFJhcU8jOLxlXxTjU2cEtDcfW
X-Gm-Gg: AYBFou3PNdI4VHalmtp/cTB5rKrwERKDKa2Z1gWSYXjsE26nCdaF6M+z40MS2dJCsBt
	MWAcyOiOdnflOf5cw3YplSfND1V9W1EGYhY1Sl63xZ4i/9x4vhzNqYykO4cbiImXMwM+I61+kZ2
	W2x2yYyxvcTKH6NUbp8fDgJ3bMwtvzBjvlKX+K7TVbHeUHNLQ+ppy22oGO63sqzhpEEnXtSYRrm
	IPR1mvaBVw4aEYxAzd5Gimpd4j3eVQ3KJscF4fIVBcmrjHS3ZwMR2Dx9aHIBsgLPmZ2oU6bndYb
	31DrDXgxVbwkyDPH7+QD8LAyv1W0hxw2ZbdrjXJyurEKqTaY/HRPg5szig96XAiJImwiWKPqVro
	GvDFBO4zr388RsIeyBusKSJC/k4378cewJ/nCep6mlDIWtIpRjzWWMZGShcNfYBHFm6Un5rgvQ8
	cWyw9p8XlfLD/1LqxLVY3/b4xHBRCIksuk99BM9U+ZpUeO8RIPK5A5c9pCme+mOYYN5rxNWKfZg
	SPHvcm4n+eM8Le/pN5CrJRcYKUXsBhV/vuHIJfDR/x3DE7P95gN1PbepHKT8rHVgkMBLrpNKMOL
	c1/IpQa7Cu40Dg==
X-Received: by 2002:a17:903:181:b0:2dd:c053:d73f with SMTP id d9443c01a7336-2e49b681d7dmr15081205ad.38.1790915966639;
        Thu, 01 Oct 2026 21:39:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:26 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/5] ASoC: atmel-i2s: fix MCK generator error handling
Date: Fri,  2 Oct 2026 11:38:52 +0700
Message-ID: <20261002043856.97295-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_213928_598130_A33CF2D5 
X-CRM114-Status: GOOD (  12.60  )
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

Disable the gclk and reset the MCK configuration when an error occurs
while enabling the MCK generator.

This prevents the gclk from remaining enabled after a failed clock
configuration.

Fixes: 73ad0df57290 ("ASoC: atmel-i2s: Remove unnecessary audio PLL clock (aclk)")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index d9ad262ec44d..f28808d980ce 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -466,11 +466,21 @@ static int atmel_i2s_switch_mck_generator(struct atmel_i2s_dev *dev,
 	mr |= ATMEL_I2SC_MR_IMCKMODE_I2SMCK;
 	ret = regmap_update_bits(dev->regmap, ATMEL_I2SC_MR, mr_mask, mr);
 	if (ret)
-		return ret;
+		goto err_disable_gclk;
 
 	/* Finally enable the I2S Master Clock generator. */
-	return regmap_write(dev->regmap, ATMEL_I2SC_CR,
-			    ATMEL_I2SC_CR_CKEN);
+	ret = regmap_write(dev->regmap, ATMEL_I2SC_CR, ATMEL_I2SC_CR_CKEN);
+	if (ret)
+		goto err_reset_mr;
+
+	return 0;
+
+err_reset_mr:
+	regmap_update_bits(dev->regmap, ATMEL_I2SC_MR, mr_mask, 0);
+err_disable_gclk:
+	clk_disable_unprepare(dev->gclk);
+
+	return ret;
 }
 
 static int atmel_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.43.0


