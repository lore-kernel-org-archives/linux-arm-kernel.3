Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238F4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=; b=QXjk0Y+JV6y43eqZ98WxbdZ431
	N3E4nfcnmGKeJrLHIE+8Xx8RZkGEbRnkvW/b9wYEdZv1K07LMhckjZL08VZNFEBeCoQxoaSfKj73K
	Pq0kNZl3mcjy42ULVff/Hi0LVhExTk70ZjPRny/5n7FbXE/xjNIZMo4b9wWyTn9UJoj//HPCwLWQK
	c+j+z51gej5ctvzVzNByKSrhVTfh8A6cv+O5sEqt2F8+WTogY1xgap9YwLBi+drmyyvUURGmlHB/5
	+5nVjZS/Q/oJaDN9rn7aLdQUKRzCT9ji+FnVCmO03DKW9twt4zbZEyHbrNOfcka0UqeTLT6JbSBn8
	hX7ldU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3RZ-000000048Qu-1MGr;
	Fri, 10 Jul 2026 05:06:33 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3RX-000000048Oh-1I6a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:06:32 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so91010b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659991; x=1784264791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=i/MK+VPMKhE8JZJJJKZQUjAbROnGYBTaY922ig3Mevd7i9oOODWzmonXYhaQoe0yQZ
         wCq2IQX/RcdV3WSmAGnNyPrRe2IYqTN+v8QmIIOKU0jUflDhsfSEzivpr60lNMdI5vRc
         Moba/JBibvPWas7yNoWaenzM6gTiuY/7UtE6EUBQrcAYkfHWmbJS8zBc/xqUwaOEu7UT
         2PX0UdQgSq8qOluCGbtjcEgCtK+RTBjJmGv1wmXOAu9UefTScrGWowy5sG+HXmM/pvBW
         Po+kA+zVGsywSJmeFp9jYMdeZSHPDTNjjqorJBnziLhGwYO5zRMud9jBu/7TvUZg+lLJ
         Qjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659991; x=1784264791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=hVoRgImfCrZ5ipdaYJ7du8MooIeud5iEST+r38j2fZAiILn3pzKshYv6Zug/MYqJ+Q
         bjLJ4e5HJHg/j3TSBvgO7U3QiBAgaaKQgOjeDKS9jyzFufYdIYwz131vz7K89MpDZV+5
         W1MliXVBMQpxym/MncG0HU5YgV2zDMKnZfvbsZQbd77iT9EJI4o6UswP57Z1ncIR39da
         4zmiEPdNADgGEzFI+z3kFhpDf1lzyWCjzMyOTm7AqcYgWfbj3VwpEN9kArWg67Nqvj+I
         zpD8gbWMFVszTqWPbxeuwlyh9NSYbI1cWQDedxYhsfPfZRGaIytgwNzjKFMo0Df1Rvlc
         ovZA==
X-Forwarded-Encrypted: i=1; AHgh+Rpz7aA2F/cVEowZqwfyTzPtzI8EHX1QkMVugWjzgjZSZHY+eykveg8VLfu4h+U8zNqEAx3+v5WA8cl3MS0viyYx@lists.infradead.org
X-Gm-Message-State: AOJu0YyoOnhbf72MEfPuwVoMp44tjf2zu8VYouGeo5k9LX6dbbP30lSF
	qN0K4fxspAgFkIp6cHY/VVsUQipnnpMwMgaZNHfnHvwAiMSO9YIRg2BD
X-Gm-Gg: AfdE7cmH/eMdlvjxipoi5GyTdAkwG4rusEdQAGAQBR9dAOAVACygbhWTD6OGzXjTPec
	JkuDiW3WCNK4jGLPLDkVN7bj3IB/ycROcyC85QUf0RBLIMVP/w/9KInR5ZRA0ILbduWIHcE9qMr
	vq3YM9eRxZHuq1/B5dy7y4H0TP0qByz/4Ii/fdvWypi1Vv9UiT0PyHh8JKgrvW4uNZ8Jhlk3pXM
	F0sh/MO+WGQuivgbByjmOQVfsj9a0721pttFAa+apjeFU6U54vecZLb0yAv5pyJbJnLYVOF90Vd
	2Fh9bSsDTdBUwyMZ0LjWu1xmednowoyZzkh7pnzAVpHlBgUsLw/wOsgcY3nMEZyMwCXAOd6kiqG
	tE/+ExMqfJDyCU6xvmcmihIBcVWIN+QjxlzYjoRdN6PBRk8am0MFILXK1BWGVQ7ruJJWOzic5CE
	piDs1tz4kvhaPT1epsq90vdEeZFTJmbiqqMFEUh9dS5I7cAjo=
X-Received: by 2002:a05:6a00:3923:b0:848:7b92:8e79 with SMTP id d2e1a72fcca58-8487b929051mr502475b3a.67.1783659990526;
        Thu, 09 Jul 2026 22:06:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 10/27] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:54 +0700
Message-ID: <20260710050511.14439-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220631_346205_7CDA0546 
X-CRM114-Status: GOOD (  11.86  )
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
 sound/soc/codecs/lpass-macro-common.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6e3b8d0897dd..7e59616ed7bc 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2022, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -71,21 +72,16 @@ EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
 void lpass_macro_set_codec_version(enum lpass_codec_version version)
 {
-	mutex_lock(&lpass_codec_mutex);
+	guard(mutex)(&lpass_codec_mutex);
 	lpass_codec_version = version;
-	mutex_unlock(&lpass_codec_mutex);
 }
 EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
 
 enum lpass_codec_version lpass_macro_get_codec_version(void)
 {
-	enum lpass_codec_version ver;
+	guard(mutex)(&lpass_codec_mutex);
 
-	mutex_lock(&lpass_codec_mutex);
-	ver = lpass_codec_version;
-	mutex_unlock(&lpass_codec_mutex);
-
-	return ver;
+	return lpass_codec_version;
 }
 EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);
 
-- 
2.43.0


