Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B75D10F5F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tB73pe6/NtX8eM3PTQbggN9wppvlKOL9jZo7eXvreFA=; b=t8lH8UFy3s3dfsYecCDCWeiRMt
	5lNdb5VlxNn0OxAzMU1IvnbsAGw7ZBmATllyGwWFtiBvaymQmJXhLPpBpL7IAEdNw9y3wx9YZ6ouG
	N8ATPgh58MebO0iCoo44PdB0R1yrm0mOHeQpjGZBZJpC00P5qUcERP3aVtkwwxxMk0ECycfPBTAl4
	7+9J5f3nG+vb2338/IymsIGzs3XDl5hZyds5CQmCaY75IL9YVOkj6SsiqWr5z9Ui4NkLcdffK8Dyx
	mT59su6p5ny87r0nFhzroOS2jBd7UTgYo5t/ynFQSy0EHpF8JY5Da0jbhZOyv6Kvue8noXTt2Cj35
	UW5glbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGsn-0000000F8X5-0ISg;
	Wed, 26 Nov 2025 14:52:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGsj-0000000F8VT-2tMf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 14:52:34 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so72107675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764168751; x=1764773551; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tB73pe6/NtX8eM3PTQbggN9wppvlKOL9jZo7eXvreFA=;
        b=fJn2fT0sCo4uSSlYF/5HhQ2q0geZc7kxcQDKwPD8OL9CqOHvMJ5mew3suUuyVWWNIS
         9pjMjl3+MmHzW1arMqyKnS5JQeQF4w/unPH73stsZ4FG8SztnODf7UDl1n36lWbkB7Vp
         z8YeJx3R93g5AtP4iSLhnGA9NfIV4330WSG0MSNJZZeyKeQ9zUG6Yqnv+EVIKeEjkKBW
         enMc5UuYsIIN/lcD8CaKF5AUpg/WQdDanbxOdsWYaymitO5BVYOBeFoBRj+/b8qwc7Zp
         VAOIGYouuO2DUTG+AHuma47O8t8ceHmGQT+XXt065w5cZxKEaoyTMICVIq8+MVFFdfF9
         b79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168751; x=1764773551;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tB73pe6/NtX8eM3PTQbggN9wppvlKOL9jZo7eXvreFA=;
        b=WsiLOWdTYZXPb+Yj1cWY755ah+ysaRSXpv8c/W1APWyMyvuqGx9kjorPKUi7IWUDX+
         miQxDUS/Y/etWCnDP6XjN+BAJLK2IB8FKbbkaElPNYcNOvZCKw0HZaT1wH1huAOgJfy2
         kmP/uSg8s+Pbu0xIW6zeKT21GqWAAI7yGcmsfbDXJSnU3l/o+gCFiE6kYicTcMLfQNav
         ez/f+STTlBODlvoloUQgUi/LzCqNyUYs/SAFkG2LeEIeOamQ/5JiN1x77PFkZbvh7HtC
         7soSXKhQmZxRouTNFgoOAeW7mQmaeZp2oa38oQM2hbOwiB0rDaHwTvlsh0yzpRHGmKX/
         m2HA==
X-Forwarded-Encrypted: i=1; AJvYcCUtlUO1Szy3HdpolStVNgMjPamoEZZu24paBitfn9Yc/VQg4FMQDKaSUiFes/OzNXoKovzQI3B4wLC1iOdhEos6@lists.infradead.org
X-Gm-Message-State: AOJu0YxyIAQNxofk0GYmiCM1eLFWpfqGvvQJaGqR36vDimnkFgq2ikEc
	LS7q5ql+jz0nGn/Byy9akMjhVWNQOISUrT5MnQPCPqpGJYqxSTmJ2Fyx9757uibWCWQ=
X-Gm-Gg: ASbGncs2LB5ONL7RgqQ6DLcX9IYrv7otoIenXbj4lLCkmt3B7cGsHOkDWIIaqOX1xuT
	hI7ZFhK/ClbXA+PkjrO4/j9RoZYoEBi80t1fqKHw6VkUJWWEcsSW0UROjbReAlAjuIIUNh2TymF
	1OrE3SgQYzb1ZzedTo9tIeGGHLWWilUXO11LPr7MaGUhmUAW8W7apf0Jz21DaOR6MrwErqm8pWQ
	Utt4aPcagGdVK5U68hgOIotfvjCnjOzGo4Sf9g2NXQnZuyPWbTnKsgk08GopmgJON0puQd/knPf
	9DnQPgPZFyokArR78Xw5nox4j0OpqNrvQ943C+bSVk8SbyuuJfuH5YHYlIQTit1ZeF6w8p5d6OL
	8GXfyRhKohpIAIpd+6VMhOaKEBoA6pdHoWY/RYzNcciS8Qgln//Qm+Dod/E1slSxI3ZdudrP7z3
	Mf1gN1ZW4F+c3apYw=
X-Google-Smtp-Source: AGHT+IGCLmd8tRJyaKxnoPAOY3teB1a8/mQwQE4e51HEL7L4ZyHqrgXF4lwoEPkRwuQbHk3YrwrBYw==
X-Received: by 2002:a05:600c:8b37:b0:477:9cc3:7971 with SMTP id 5b1f17b1804b1-47904b1ac02mr55156645e9.20.1764168751196;
        Wed, 26 Nov 2025 06:52:31 -0800 (PST)
Received: from localhost ([41.210.159.101])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7f2e454sm40974088f8f.2.2025.11.26.06.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:52:30 -0800 (PST)
Date: Wed, 26 Nov 2025 17:52:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cyril Chao <Cyril.Chao@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8189: remove unnecessary NULL check
Message-ID: <aScUKqCEhSIZoOmg@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_065233_752386_D26D6DAE 
X-CRM114-Status: GOOD (  13.14  )
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

Smatch complains that the call to snd_soc_component_get_drvdata(component)
will dereference "component" so this NULL check is too late.  The probe()
function will never be called with a NULL component pointer so just
delete the check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index dcee8e11eca8..166ece74270e 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2352,12 +2352,10 @@ static int mt8189_afe_component_probe(struct snd_soc_component *component)
 {
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
-	if (component) {
-		/* enable clock for regcache get default value from hw */
-		pm_runtime_get_sync(afe->dev);
-		mtk_afe_add_sub_dai_control(component);
-		pm_runtime_put_sync(afe->dev);
-	}
+	/* enable clock for regcache get default value from hw */
+	pm_runtime_get_sync(afe->dev);
+	mtk_afe_add_sub_dai_control(component);
+	pm_runtime_put_sync(afe->dev);
 
 	return 0;
 }
-- 
2.51.0


