Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C13EC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P2oQDwCwCo1gfWj8hUM2bE3rJ8xWs7DjrsEeE/nug/Y=; b=aDLRijteGZ8NL+8W9z0g566xjO
	20QYBHlQRzrv+ECXQ9smvZMaMWx/HybobB9i8sExpmLBo2IqXfQ+uVQCJ0nwv4cxEOwbSCp3bINdR
	wbrSkUlnwb9xa0qub1NVKA16o+qKuJrtcX1BXNZMnonBrgscoscSbQ+rcaLvWDjBdJVyOQWsr/Ju4
	gmm3hlzFKjKfzLf5JusDZ1OYzdo4gw0Xm94etDBykbihFqu7KJ0qtKpfnHXj4VIf6/uhwS5mv8GRa
	V7MR5KtQvA/wddvsm/oQlI5QwJJ5s/d9nlRjH/H1ZorCEhDkJsOjwm0no9gyPP7J0cpt5UItMi5Uu
	BBTmyAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9H1-0000000E1dc-3vhw;
	Fri, 25 Sep 2026 16:59:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9Gz-0000000E1cv-0CGW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 16:59:46 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso1927013a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 09:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790355583; x=1790960383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2oQDwCwCo1gfWj8hUM2bE3rJ8xWs7DjrsEeE/nug/Y=;
        b=jhJ3NXUcVwWtHYK9hgo/JrBYcgxZkf85S8oK6XrM1omazPFFmHA19dKsfLTTCpBBQy
         Ew99Skii3/3wTGsWLmHb1vZV3cv0N9oC6WEkD6tnr4K49PVaII/IC30nRRJrsv1ehTrj
         lYrJkuPauF/gu1RrTl/mXQfeK3jcc6znQtZ+n33l7hLXOrtOSH6qy1w9L3Lrqs830oUS
         S61Zn9YzfhqBnrVHAKH/DgnOzPgQit9aMaq3/AH/iHvgr7uO/gWd7BcscoYavmqhW403
         RF6ONnEGEDaBkCCcNkdpj/PuB9vB9phszlqTYh1WuoZwfmVW46IPAwGmP8fs+OI7h60f
         nvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355583; x=1790960383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2oQDwCwCo1gfWj8hUM2bE3rJ8xWs7DjrsEeE/nug/Y=;
        b=bdEBOVd1lQRcL1hKADZUf2m4wEBW/IUsyjNkoXWrJzZwh7HMJg++KnwE9NyYW2asMA
         G5AemlcVcQRUTFjbthgM9gEq+w1L1fVVpnKJoSx+jBidLzpEe6KfjBVA4IqrWv5+z/a5
         dNl+I8pesh797Sjxkf8IRur17S9qo9kOJDrfLQ1X0guFrsQ2q/h06OCRUqR5QMBKPg2G
         RHQAXzSqW5o2QWcilUFVWgLnjynAd1I1zDJZngAmtJYWoxf2lpAAF8220KMTMEJW9gqN
         ici+6b0jwRrvQJjn2AVy3mgxkY8Jg0+QCmpTrtsCX56ApS9ULpX2MakA32X/VotbN6cj
         q+0g==
X-Forwarded-Encrypted: i=1; AKwUvBzsARduDyK68hon58959mTPTLSQHUUP413x4jWz3975AlSjYyGgWDHRsyqSPMlQYEGha/u0Jy+kCun7gcXdJcSw@lists.infradead.org
X-Gm-Message-State: AFuF++lX8oScA97t75yV8UvUU0euhDYmaha/10YSIkdNGP3jiK86XjDr
	HZ2ocE5ypU0nYhC2GpA/P/7TMkk+UP4OAO1cKK4MX6Zh2Nn9roGlZFu0
X-Gm-Gg: AYBFou1640hTExITbaasx7byI1CxoRbRnQOmDjI621siHIfQ0HwUuoZU1H+CvVIyKK7
	Riu+/d0qSCs2MuKuUsOATrH9YUvEVrMH9s5ux0iudB1LjgwYoJByx7D9IC7D1bUE28/VUVwmBGn
	hER6LlvFSM2RRhxkNcEWq/Auyi3wK7+YkSqES3ileu8y0c3W9P6H5Cz7h4Nic6ORViPwJVl6YLY
	BvC7lRS4IH6+cfkRCQyiBHmCZP0F1EX8Bds8X2gTvfZsCVUl4aUSWseWEwxuWvBw8r6h97lv1un
	QUeUjo3la06wQE5wCJIguI+3iMTE3OTuU2y8IaOUf92AKYQmNJExwQAtqnf5Q4TZvRQmMzdRF6R
	F9SYSYqytQYrN3WOZE3/fUUhvBbOqo1e9ECHEmoGeRmf758r63FhFFQAow69OrqqBBf4erIVXDr
	jO97qy//rZ6YAGZ0lBVKvHhuqZysNx+xHInHD2cwVItutJfEVpCGZpyDZVU4jsAY1lRA+WCvIu0
	ImLqAApK/c48lnAG4lD5r7ehLN0w8/rcm5y8+k/z1vBnTFiYYrlzllQKN2VPXUE
X-Received: by 2002:a05:6402:12d0:b0:6aa:ab94:4a36 with SMTP id 4fb4d7f45d1cf-6aac8f1b94fmr4157302a12.8.1790355582773;
        Fri, 25 Sep 2026 09:59:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb9b0asm1321152a12.9.2026.09.25.09.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:59:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: airoha: Fix sparse warning for AN7581 AFE PCM
Date: Fri, 25 Sep 2026 18:59:17 +0200
Message-ID: <20260925165919.5407-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_095945_132786_5FD02C07 
X-CRM114-Status: GOOD (  15.66  )
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

Fix sparse warning reported by kernel bot:

sparse warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:144:30: sparse: sparse: symbol 'an7581_afe_fe_ops' was not declared. Should it be static?
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse:     expected void *base
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse:     got void [noderef] __iomem *
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:439:42: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *regs @@     got void *base @@
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:439:42: sparse:     expected void [noderef] __iomem *regs

Make an7581_afe_fe_ops static and add __iomem for the base from
devm_platform_ioremap_resource.

Fixes: 4974ffa0d6c2 ("ASoC: airoha: Add AFE driver for Airoha AN7581")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609242059.t4FlJzOz-lkp@intel.com/
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/an7581/an7581-afe-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
index a1d742362538..d47edb630452 100644
--- a/sound/soc/mediatek/an7581/an7581-afe-pcm.c
+++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
@@ -141,7 +141,7 @@ static int an7581_afe_fe_startup(struct snd_pcm_substream *substream, struct snd
 	return ret;
 }
 
-const struct snd_soc_dai_ops an7581_afe_fe_ops = {
+static const struct snd_soc_dai_ops an7581_afe_fe_ops = {
 	.startup	= an7581_afe_fe_startup,
 	.shutdown	= mtk_afe_fe_shutdown,
 	.hw_params	= mtk_afe_fe_hw_params,
@@ -375,7 +375,7 @@ static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *reset;
 	struct mtk_base_afe *afe;
 	int i, irq_id, ret;
-	void *base;
+	void __iomem *base;
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.55.0


