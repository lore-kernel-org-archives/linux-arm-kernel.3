Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0FFCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzlwDK3twYbxesixMQo95pQtXYCM6WeotcCerlbK7ps=; b=hzoLMA5x2GCze16IA1djIle0dJ
	WaacCVW8SNWdZPXedc84omxQu6CYETTdgQx245R3dgahaGqCQnorrrx+sA1YKIl3UJ2hyCTjWs+Xw
	VvYYqHLW2wAXomssE3wOQSnN2zuVzk9C3NUL0nDhLwQIhQcG2Lbt4nso5q+wBOHiy1CqCL36b9AqR
	dgsmI+/ikSi0MuvnpFloAv5M0EzVZFjYfLEWx8QmwV2zoZ/DXh2sLSFk+0T4WBsOOaDULhbf7WTfk
	eo2F1sYC1wMu688bIbjtI7sO5X6+ePWOeEGZ2rSscRvdgU8wiGdIBhLKnU98LHzFkKP6nMqD2PrRi
	BvrNKXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3K-00000007Mv9-3N3u;
	Wed, 10 Jun 2026 10:20:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3I-00000007MsX-1hZG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:20:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c0c35980fdso66057475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086852; x=1781691652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzlwDK3twYbxesixMQo95pQtXYCM6WeotcCerlbK7ps=;
        b=aHLNtRLzQUGbPG6sHIILz29e8MIVVuoF4iLrdPhvj7GDtCuCKAaI95MB0riAHUV3xc
         FM9Fj6P+MzfQGoU94SyDUKCj517070dmo3F6EhUBLdWFHwvY/ufkQxQJohNQKU3xAztC
         XI0i6GSQ25cbxSis8D0g7X/DFXIW5VPatYZSx4pGwBL7Edg0tkDZNFJdXYKvRfWx3DKg
         Z4dgt6BIUi5stSO92HKjJ5Dm47oz5WX+rCz2cYC+yoXGnyok9ZCwUo1sdRprFKHJ34Us
         Lte0YVe4Lh6Nz8A/+EGgE92ag9kePdaujI0Lgvca98T2zMnYqwLxXlVHmiE4CEGQY6/Y
         5VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086852; x=1781691652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzlwDK3twYbxesixMQo95pQtXYCM6WeotcCerlbK7ps=;
        b=dUnqXHZwJHQ/GU21Ik8dB1WeQs8zo3gN5oR5YmuIb6APertLdxnBG94t6GjYnTr99P
         luB4QN92ekph8U/flWBdkRutLTixS+BgEXbIO7OjnZHXuDn/p7y55gfbyqXoWsI7FC1I
         0bFEvZNaLMTQtQPwGeld5oyPD8KtNe4Z5O8rQ7x/TSimaBF4rvhfXLRyIkgaRrK4ad8B
         x+kaneO6nvyKjDfTNGsIxMEMqOo0eNit213845QljJFZDuZBIOxJCtV2SMOqjWr19Qd6
         uWN1V3tox7XzH14W3DEfnK2GviNWHREwGVfehBu4iWoOzZuSYEppv+W7YgOdC/bICqTM
         a+Uw==
X-Forwarded-Encrypted: i=1; AFNElJ9cwM/9lkMfELqbltUbeTVG++PTI07HxgkMOClaQHVZka+i0fptYblcamLx5VByQXfm6lmlKHDjtnIyAudaH/FR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0T7j+cUW6SCSXTj+sj05N1QphuJtB5fPprZFPTPQJ97tHrJtX
	/Z12iKem0fXP61JMEiytOBhMGvFSpk0AcHRJKipRRRaWEIm6DW/JJ3O3
X-Gm-Gg: Acq92OG/lJWAiqpxWE4+r+GDWWlpc244OurzQvfXHWfrg1gT+TNSXeKVTzf2UPXkQhI
	ZXUFVFNnmXvnxWNwnXauDyUY0CIM4RcSsNDuHBfkFdZh8uEt5ybnIwlW7eUxH7us3ZlLGvq/NbH
	z/eLZyOgOlAbGDxWwGTRN3JQYC4dUTiGPACPLlTdNNW4M4nxl+nxORnhOBqWpR18Wy44Zq54sRf
	NuYlrMYJ7kHn1et3b8F+6SD7x6JLiKKpknqRkF7DmY9V/2xm6xVbDfEP/QYH4lsIACu0hxnvVoV
	s9sjTi6CnRltCJMtFAstLHWTkxqYDbfDl5ZXg3SPUd7r8XHhDLX1Hm6fLKC9CstzDJu+EneVmJX
	vMpaotxbx29xRQcLWtiCHeQnAGcFs4OaUMgSio0crrdZoYtwIHjbXXjvaRABux9JpZOpDgtmXKv
	9gO7Y0ZYb75EoZ780qePP2H0aUabh+4hMyUTJCmZAEjrD75hxX6Mgf8EfiwEyXxACAkFrW
X-Received: by 2002:a17:903:2411:b0:2bf:379b:53f4 with SMTP id d9443c01a7336-2c1e849511fmr304782305ad.19.1781086851765;
        Wed, 10 Jun 2026 03:20:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:51 -0700 (PDT)
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
Subject: [PATCH 03/10] ASoC: mediatek: mt8186: mt8186-afe-gpio: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:14 +0700
Message-ID: <20260610102021.83273-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032052_476567_6BBFD875 
X-CRM114-Status: GOOD (  11.12  )
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
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 9e86e7079718..aced8e7e920c 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -201,7 +201,7 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 	enum mt8186_afe_gpio sel;
 	int ret = -EINVAL;
 
-	mutex_lock(&gpio_request_mutex);
+	guard(mutex)(&gpio_request_mutex);
 
 	switch (dai) {
 	case MT8186_DAI_ADDA:
@@ -209,7 +209,7 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 			ret = mt8186_afe_gpio_adda_ul(dev, enable);
 		else
 			ret = mt8186_afe_gpio_adda_dl(dev, enable);
-		goto unlock;
+		return ret;
 	case MT8186_DAI_I2S_0:
 		sel = enable ? MT8186_AFE_GPIO_I2S0_ON : MT8186_AFE_GPIO_I2S0_OFF;
 		break;
@@ -230,13 +230,8 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 		break;
 	default:
 		dev_dbg(dev, "%s(), invalid dai %d\n", __func__, dai);
-		goto unlock;
+		return ret;
 	}
 
-	ret = mt8186_afe_gpio_select(dev, sel);
-
-unlock:
-	mutex_unlock(&gpio_request_mutex);
-
-	return ret;
+	return mt8186_afe_gpio_select(dev, sel);
 }
-- 
2.43.0


