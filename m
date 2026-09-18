Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D54C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yYuhRQnt/ijyPiiXvVWhWtV+eciNeujLBpVlIUSi5E=; b=eAMAeuQZYEWJoqrgD9cJA1YhS+
	OiSGn4x8j91TwZ2W4t83+xnYXUr0STwu08gglyi5LFrG6iYKPgHjZlOnsIlrFpwXEah5SGDXO6F7g
	9vQrTa1SyDfY9N+n0lALgXM9AiM2iBjGWdYChC9wvx+rcHTX5FtS3tMecOHgk1BkoyL4eegq9Eul0
	4cCX5vKp5mbMU5Nhpb5Rg+G6CF5r4nQNikV73iI0LAlBJ+eyOV/iKgLawD5Po77vSQX2iT4g/iBo6
	d55IP0xy31cdzN3arSfC3PRAjkClb6RD0ZPqVAeUgMaN+XTW2ZK3qYul1tOmkXbO7DRKHmkc5ZBR0
	JBlsqK6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpX-0000000Eb92-1SdB;
	Fri, 18 Sep 2026 13:40:43 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpJ-0000000Eawr-3QA9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:31 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db22383fe8so4597395ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738829; x=1790343629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yYuhRQnt/ijyPiiXvVWhWtV+eciNeujLBpVlIUSi5E=;
        b=PoKCzO5ievlrN9ZDA/EcvT6nEUh/mHQ/vgCNKVErtcydGstft2vxlN8hTw9HcTZMNn
         mMMDFP0vMnVioERkiFJZcnTc3HlO4ERTs+BRaCIK2+Xra47bt0BgDOFfS87GAw+tOs/c
         yzgNL7//BJ4QOHkBzYkt2rY0EKAWxne0NNTa7nlNo3KvzbI7z8AHo7MCDznOlYHSSRhb
         IJwnYDu0CxdrSRj/bfOOBq2170z17Y6SdYaGf3jXZscQhKE4G91jJcVnVbxKfFKheFAH
         wzaUzsN89Tped3+TZLjUKjnsQIP+TFQumh5d8L2/PAe0/wAlfrJJFFQ7rpNfvNv2IdGD
         6Umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738829; x=1790343629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yYuhRQnt/ijyPiiXvVWhWtV+eciNeujLBpVlIUSi5E=;
        b=Rt1mqFtX9nYTNDUHER+XNNtELJ1utyTlZKd9P8/+rHJYaoSWwGHfOQg6uJv9w5VrMT
         nJ4O3XniBBznv8qjw4m4/UvyrOE/u2n2Ubx07g3MHGg+tLZ+s3TffENepDVqVYnMlAHG
         JLKDGjwiUFx8FiuCf7auLzWdaWFobdCk179daw4hE4cuaPQdR/xmmPdNjmsRjckZx2BB
         owHoqhYe8Gpoh9dcbfPRWuCgNvdVx4IXlYAeQ39qPw762H8UxXx/lzwnClYObrTo179m
         VgNoJYJQ73bEmlaP7vG8thy7GmzcZSiauvIomkXY8jUpSbxykykHHIvitlLwZalG4Pw8
         Kyzw==
X-Forwarded-Encrypted: i=1; AKwUvBx4IZa6jvSBLCBwfmWdFYmWq5kPpdlK6h/46t/Y9Fy/F4ur6YGi55kH0mARTNiWrf3/abhaf+lRtiU1plnfshME@lists.infradead.org
X-Gm-Message-State: AFuF++nlQDSBWyjquCQ87CDbTb3p3HrJfx7Fv1fkk3fgE1s8nyjLo64I
	ngEpgXdzqga1RkTb8hqU076SmrTK1I6AyjgqZreInteMx+o7inbhqY1+
X-Gm-Gg: AYBFou0Yb3e3lmtM0huL/2OHb+RMmlFI4ZtOZqGrGhoBfJV0/k8Uv5TNDq0qMAf+GFD
	OQeOK0CybHBKI1Bnt8X90CaHX/dWvs9Vzsc4kSOF5UkC2JSKN1pRk4YhFvP6r7rQUTpX07AAmEG
	pJJHQiOfLqiA5ZbuSYIVUY4hC0SVCHUpIhMC4Xd65+gncritYjtpHAavEeHYhHylbEl2nazQzmA
	jRxJBsZ/9Oxc5Je81MEzm0vRqs3Z7slkOJjq0Kul8VyqP1iBpTT3CYsm4wilKX6Q7m3BM3Y4Z69
	ePQnQjKOH4b6aYHtbD7tEoQB9EcSbfkgHu0PyupFZOp9f9soSBhJHtZQcXOgxAoBw++zH33NbA0
	REcAmser487LqpzWBQ0lo63c/PSGtyQTVGcVQW3D7914HDGyz1MOEspojBIoP3lxhhXzSZ1OrPz
	vGPcdjlCnR65/rfW9VcABft3d4WwMvTigJViF19zdbt5xgJ2ZnR/nKFPObZG7ZhyAscV6m3z7g7
	at/3pwjTrcOQN80FD85QCk2dFiabHI9oHYfv6+3y23etCsMIemc+NwMocmFeU8zdf8SiqZIBjks
	14xGpeP631po5g==
X-Received: by 2002:a17:90a:d005:b0:39d:ba21:fd90 with SMTP id 98e67ed59e1d1-39e54f2bf77mr10812405a91.16.1789738825626;
        Fri, 18 Sep 2026 06:40:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:25 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/15] ASoC: mediatek: mt8192: check return values in mt8192_afe_gpio_init()
Date: Fri, 18 Sep 2026 20:39:05 +0700
Message-ID: <20260918133912.133799-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064029_986413_A4A26EF7 
X-CRM114-Status: GOOD (  11.90  )
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

Currently, mt8192_afe_gpio_init() ignores the return values of
mt8192_afe_gpio_select() and mt8192_afe_gpio_request(). If configuring
GPIO states or requesting GPIOs fails during initialization, the function
still proceeds and returns 0, masking the initialization failure.

Fix this by checking and propagating the return values properly.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index d4218f9708f7..d2e99c55b8c6 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -147,13 +147,17 @@ int mt8192_afe_gpio_init(struct device *dev)
 		}
 	}
 
-	mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_CLK_MOSI_ON);
+	ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_CLK_MOSI_ON);
+	if (ret)
+		return ret;
 
 	/* gpio status init */
-	mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 0);
-	mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 1);
+	ret = mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 0);
+	if (ret)
+		return ret;
+	ret = mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 1);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(mt8192_afe_gpio_init);
 
-- 
2.43.0


