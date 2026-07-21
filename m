Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677BBC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=; b=20iCLn+CIcOdGm7hlXXP1qF/Ao
	cWjwJbktx06U6f8W6VnkwX91gAViNx/OzQ54DVVxC3l96uMKj66pT0MF6un8e6GofrQ4KUEMbUw5k
	1GSbYzz68sR1xlRQ4xTntcBkPI0MFv4vKzFFQw4Yg3zMdnHl99Th4Rdd4s6pN99r2o+PWeXzzivrU
	E3slvqBl3LYrU7IuX/kAQm9T3z2+K9w9dy0AOXcy3YPzkmNbB5BTe4RnRr03zswJQd0GRSTLzh5ah
	p6hMjfQxTg3D2lmTXMukdCjraFCVKFCIICcp8oECdsaae/6vwlc82806Bq5bgt8ghwibI8hO4vtgH
	a/a4o96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hb-0000000997k-2vGM;
	Tue, 21 Jul 2026 10:27:55 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hM-000000098o0-3X1E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:27:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cad4170e8eso156527055ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629660; x=1785234460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=s6UzVD35lUkCoMrpwi6N1PjB15bqA6iJlVAx3kHPGNDBzSDV6GNAnxeqThrEkHLgF8
         bCBBYVFlo+sZ/gY2gRsY9B+71h9iJ7JPzR+HGjo29eKqMyaY7H1zq51g2emasvskTYtu
         xh0V+rghmmUgrDyquCyPQxMaGGoA7mn3klwM1+oTBL9aiUN+Jy2TpA/ICM4B8qMoWe/t
         PhmPklH12Ue4EltALMADJO0kBXKS3Qv+n0bXSNVpHRJR3Jbljdgeya0Q0QARbk/0xHBF
         P1Paru7mbNIeypZU/a+T2Dtrtl5VRC23kDyKYqawdgUKBZ4gSMJSg8wN2xIxTreCpufX
         OXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629660; x=1785234460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=a5kTuhp6/VDGtI4CdYdRULV1qxtjp6RxVw1xOrjcLO1GqaLi8y8K1yP+o8VWguKCVS
         7LZ5ouxJ2o1SpR2gWExvcf4jfbhhQvldMawbPUAsbeJ6RAGJ9v4F9rucIhGsc/JAXifL
         /tsRRLvb1Okq3gN8x7kE51uf4+oouoVS3mYmpsxIxC7bbfdxNvqE7Q+dsffZ1SB9rvKb
         mBQeL7eIa46ik4pFVn6eI9ASHp2yTv/Bfk3N2sSRxfCgKQnHJlX0m3yqcWpcMS4bYuWd
         fx8nXfduCLVTUABA/jaraxHI+uGEXRJw2W7pbhJrzI962/ciie+JPkjXZfrNzkfcnA9d
         oVjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYtqDj/1k5QN24ZsrOfYlcojhw0Wav2tYVYK1kkl+0tnu+K21nSbN1H/IM5GyxRZL7CuJJ6ZUPpMvCVctoDz6n@lists.infradead.org
X-Gm-Message-State: AOJu0YyTmZbtTgN95hb1rY6jIg72H5MWAKryEH9JrIoCkcybWxMHL909
	ZJB9p4J1mgnH1M0NrM/QP01koNOo9AvS64nenS8ijhG7uuvR+qqPDlsm
X-Gm-Gg: AR+sD132KipJC/OFEv6nU5SlHfbut/Yc9xWgoYoFrl9qI35JXzjz4GKtsi7OKq4U137
	QxTY8ENNyOf+FOcd8/OKozz0stWgyKUzr9rjI0guMpjwj7+QPCOlULF4I7QE7ZyMDlTS2wjALHA
	80Rv2pAteLV7PIPZcrwoO6NUM6WdfnViYRfKZVnEpKUHh75lEpjJSihkg7DYwNc7u1KDGcfFSNG
	cD4sWRazUmC2HklyvLq8rtSLZWwNHnNH2SmftZi2rBrwVDLG+i6xJ0xVRRfc8GdG2zNNQ6uu6A+
	71rJfEUrQ8VhZa/9H0yjopd1k4QlohKBoUUHqW1fVHkb0tEXq9Rp2Z75RD7JwP3ZOsJtj9i1WzL
	sXUni8QpINMHpA6zP0o7tQCSv9SM5YKEmOKThKvGwfQiJ3PiYybU6FbpKMaHFZZppKJ34nXcnMF
	giPyo+4Ima4DdmZHRJZToWcdDSRQFq6zCZQe5V
X-Received: by 2002:a17:902:e5c8:b0:2c9:e261:95ce with SMTP id d9443c01a7336-2cf3494967emr195445995ad.30.1784629660063;
        Tue, 21 Jul 2026 03:27:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:39 -0700 (PDT)
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
Subject: [PATCH v4 10/29] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:41 +0700
Message-ID: <20260721102600.523199-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032740_909556_DB95F40B 
X-CRM114-Status: GOOD (  12.06  )
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


