Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE24C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cyfKdctycKARmAaj+/avYhghhHnWLQqSBVG4F5RrJyg=; b=JsEJy44siJEHp2DR8UGISLb1oF
	/wqobTAZiyoVhjX0DGsnrvuOeW2ERfnbn+0IX2rxib4drwIbETmQiNBQ3bwgx4Cxh1e1cidSscHXH
	fWeQp78o/ekAH7ADnwmQHctM98rYJsbScR8ufkW6tYyVFvGSzJUbOKqL7xLBkz0eYqR2aP+snxMVz
	GQmPEbkGpGULXSBZUpJCaX6Av2bU5dHCWp2/+kOTk+LQewx8UgXodnMuX2BzAY80O9hDAh/5doHQJ
	lep7bu6pk7O8wup58RDBijoLqm6qb8zXiN/jcXautw4s2XhXqjuICDm1mDNN/SnSvSa27hsLdA35E
	7at269+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4Yj-0000000FfQX-2TX1;
	Wed, 12 Aug 2026 08:43:37 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4Yh-0000000FfQA-1crB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:43:36 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84a2dcede83so997487b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524214; x=1787129014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyfKdctycKARmAaj+/avYhghhHnWLQqSBVG4F5RrJyg=;
        b=iilooERGMnyOkik5vNkccp5wucDt7cfNqMGJeyIsIF34NTmuiI44WYP1QgWQj80Lqm
         Gq9Afq8U7dTe7OivzYDoUPgbEYYfe4dsf0wav9NirWPIoQObeG+b13TwClrlHdWRMW9m
         ild2QgP6ABNzqtX2V2W1FaHHpX9511bUGx6v29XLRnSpBxTaK07t+axymFav2M+VHwU6
         LAPMatJ3WSyPJwrdpdGB1Lqqs6GCaYfVr36+xQtawGi3dWcFBCezgLf/7WaImoLOJAFs
         GYNuDeVf7Jxt06vvRxSg7nVezfwcfgfOYZFeBjpS9TyJynQ7q7nmy/kIyL7S7B//c2bk
         z2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524214; x=1787129014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyfKdctycKARmAaj+/avYhghhHnWLQqSBVG4F5RrJyg=;
        b=oKTAoGretCc251oGsmRHg+Er1IJjZor6MwDJjdux8TBbBdxBRi0L1pcfxz0mS/iwlP
         6iyhZ0/vhrQysmtaQ61pTn3jU7sIBMbU3obgXECsNtZQ9ij384DJNxIl26nzrVup2ppp
         ZK8zgM7Fw/neb8I1+UEyEdktm2oFfC5CgijGISQvclLMQZPTk1tMUoJvimlzU6M8ACPj
         JuPboU0XyjVulJLaMko4CpOAPxTmy1OkDpqWYhC3Tv5Dgd1LVufZFImzMQJlQA11rpSz
         bbdOLHvhKWQMm3wmvFjE05DAoMIPTkJzme+PopeW6wiaQRhzltd4nXmF48vITqlmnW0T
         HdLg==
X-Gm-Message-State: AOJu0YwuagAMcFc5Hl97HiCpz5IvbPjkbX+9xC/ilpn24XVZGv2YANyo
	6eZGkFb+4T9/H3rwELBqbbOviweWWt4T6dRO/x5qODBRRndxZYrHEXOi
X-Gm-Gg: AR+sD10TIrlVGu3xXXLaMBR1KJAzcecQWyPf32fuOmGrbheh6sX6QUyIqN/UK2UKTTH
	jE7KxjkXKaCWBFPWIWrYMeazHCIRLrjl5NG8h5J+P9ZzaaLfffAjXE6/bublCgFHywRXf0w3F1j
	eoxxw14g4pt4a4dlr0oi3v/V5Llk5dB58f4zD7RzNEXn5MksL1A1goOhbGxA/dt0aGhRvuVSoMZ
	vdfztFTGtanEeToutotp3NV/uxCO3Or+w7WqZlvJHjlpIGGOBmw3IFKD0amWp+kzPVGRTZno+xS
	UGgGypflZT/mR7dERVHH02V6bmxiGhVmixf8bxXWH6zU+0MiDgnqUil6uhMgIUigQrwn+Ijsloq
	gce39okllCeiPptZ1xcUVbYB6YBFeF9m47itctInN2VGUqQYwH5nekaFZpafvsh2hxoc8ZI6S+R
	U0trB0VqOqxxRedgFbbRvWR1JS7dKG3HCW6vpt66RYNSw7pvbXuIoPGDTOINAykcCSvLc6l2eTE
	ozHfdr/onbpa3Uhyz9TMKoeTMiyaVvDxk0bewF0YCzE28iPQnfk32JVbpDjIvAJTIBOSwd0el3C
	tbPA
X-Received: by 2002:a05:6a00:b48:b0:843:49f0:f5a0 with SMTP id d2e1a72fcca58-84fb5548cccmr3663158b3a.32.1786524214525;
        Wed, 12 Aug 2026 01:43:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbee7d52d4dsm350174a12.31.2026.08.12.01.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:43:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Daniel Mack <daniel@zonque.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: pxa: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 15:43:11 +0700
Message-ID: <20260812084311.29188-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_014335_453876_7F12E638 
X-CRM114-Status: GOOD (  13.55  )
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

devm_platform_ioremap_resource() does not report the error itself,
but the error is already reported deeper in the call chain,
so the dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/pxa/pxa2xx-ac97-lib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/pxa/pxa2xx-ac97-lib.c b/sound/soc/pxa/pxa2xx-ac97-lib.c
index d9c3935636da..d7f720431afb 100644
--- a/sound/soc/pxa/pxa2xx-ac97-lib.c
+++ b/sound/soc/pxa/pxa2xx-ac97-lib.c
@@ -316,10 +316,8 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 	int irq;
 
 	ac97_reg_base = devm_platform_ioremap_resource(dev, 0);
-	if (IS_ERR(ac97_reg_base)) {
-		dev_err(&dev->dev, "Missing MMIO resource\n");
+	if (IS_ERR(ac97_reg_base))
 		return PTR_ERR(ac97_reg_base);
-	}
 
 	if (cpu_is_pxa27x()) {
 		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
-- 
2.43.0


