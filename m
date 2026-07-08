Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60261C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=; b=Z9m1o610/4WWkwkSRCj1oBgQh8
	sJPeYJ5paB/x5RTnjA+z0n4izZQWimZZAXB+u9g8vZVa2o9Mi0NHry/rQnpN4/kGrUsG2Bh5FjeDW
	KuS3L9j54ofoZ+xJ9+6G1XGSyAkbnF8FmWswxs5cTzeNLDJRD2ghwu9GJv8HMGkHtJEzQFVJp30Qk
	Kvd4/NJTwvQjvpQhnrLUMwY+fgefC++eDNjTi6JYSwydo1qeSNy46Wcw4Lmk8DTOoweT67+IhUzMk
	FQFHaXIoRtfbm8F1T8HDvkIpd1Mt9DTKO72VkKvnwJWyFEVU1nsXXl/ETjtnUXzx4xQGI2gy4EIW4
	AsqMXtEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8U-0000000HH2l-3jcM;
	Wed, 08 Jul 2026 14:20:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8S-0000000HH0M-3CZ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:20:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cc6ae3e7f1so4989245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520424; x=1784125224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=AFn3ZpP18c3lamJL1XJo/jAsGh1NxfP/agXJefNKkd6frz6aqFuX6Iwf/0oCSFKrQJ
         KGyA57+bxJjO7SUYWRIjZFDmw+TbwHTwhtCVEAmbrfW7swChThlqvwERRHE1yD5oTku1
         TIvtN4C7gD2krzuSQUwqhj2WozMWwSt0kXRYr37r6B7yeWQpORwSVsY7J/ju4qrDE1rB
         rgAtonvuAVPCMlQkORwmxUFx1w2kLNe7C9QBXNJV+Byf5jtZLoxdaEotEMFvH5mytUGR
         lyLdzV+8rpKJsAEZpuSKyjZ3AmlPmXKl9hb/RhcATnH6nO4TCwKVlOjkJ+P8PZS1Xxik
         p1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520424; x=1784125224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=eiDq3GB1dhpNyW4vP0gN167odWNlvsYp5njfQNm6OuqrpoFKEeQnAArXJg39F0sp0i
         UTIKPl1S6ytIEj5wqXZ/sTnC2AtoY2HMdgL0CVKdZq/5f8xjIcjnbPRFuxo9rpHzNsR0
         KYyNBd2lmMlEuy36XlHjoL8NSc00zVXR/Oy104L4oFwr7kKVSD+ixW7BUfMiVg2tQDzZ
         Ky4cQkPKn9BmKxsyQMke9xKT0YQJetKIcxtCfzJe2DbOA8D+DvfTtLaLVciFmAQH7v0s
         GuPdlm63JVRsmlLxXVMtBKOpU/13bWU3pV/x7wigpiVV+0nJ5DXRo/f3AkhQOX80q9Mq
         DS0Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro6vShxxotUVH+OZltHN2gMVw4B9Qr2/A9UlBb+HrfQHz37ZyU3/oZrSeN13lwSGpddDeZTr7zHrXrmyUMQZsgU@lists.infradead.org
X-Gm-Message-State: AOJu0YwWsI7bMIPZgXDDC2Cn0jrsHuuAQ4NoGqHKrU4F0rIbNLpx61e7
	UEFjSwdSCKgP3GYJp69goc3H+djb8IIOb2jMeWpp95RWxWVLX+GKdYaC
X-Gm-Gg: AfdE7ckxl7klgYUW6/hW1lJ8Rea6hOeD7WqK9mHjE0fQ9sD77rN2QXCvFjw+Y22Eqn2
	dUppUE3CCQornaKmaSotTex+KqsQKTlglhInuxB6RUkO4jZv8mkbwjnoChI+3Rr2EC4VJXZbNin
	TjTpsTbmQ7kUjfpkAN47q40KBXbS+Junte3oiM7al81aC8DpFS/nvsS4rN1A6eL91dgvDc4Ssuu
	cFVMa2yG4zxgy/4goDFFJBPLh4IkyqBWjkNRVZWEoSXSFWuvHW9wh1l20nKGn10a60ezm0lf1lO
	tgZlAax2JOaWOoiYM+pQPaY5ozyw+02kpKi6fPt1kizqWGKB9cKh6Lrdox2HhvoP8FNUjqdpCQp
	GbLU9BNRm8Q4GLto80WpcCsBJ9aNgnyNWm1dRbOxjV8x8ANJle0ImHJKXvUKf3U98Dv/IN3XBdZ
	ahalya+J1egTVnRQNvTjYY3InTIj/GJ0xQSWiXREbbalCnaio=
X-Received: by 2002:a17:903:380e:b0:2c9:c083:cd50 with SMTP id d9443c01a7336-2ccea36d9demr28201655ad.17.1783520423848;
        Wed, 08 Jul 2026 07:20:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:23 -0700 (PDT)
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
Subject: [PATCH v2 10/27] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:17 +0700
Message-ID: <20260708141734.578926-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072024_804135_EC50FD0C 
X-CRM114-Status: GOOD (  12.62  )
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


