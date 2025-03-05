Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CD9C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6j98wzmws3yBjPpQCP6g3erFXEQ03ngjmGwTh500vM=; b=ikgJ3Q4YO6LKBbnzY0HjxRFFpJ
	f+UjN9mZg43fnjr/8VcehOrHoTAsuRz89IrT1+TnDJr9N4mvKufd4GvkyJoE9tqEOgPCnDQM/hSDd
	yA9O1L/jKldHvORCgGwMeZ/7v8APf+L/8Z0rloBRA6LBHLgwbR4r7p6K5zZZl+F0uEEZb7X7ZBK1n
	+cH/wC8dNLacPNzwWNhtUw/OQ/6oCs/OO86w6VVSGkbC6c+GF1uFpfTuoeUrwRsHuJ2znL+ZQMwkJ
	dDfce0yC9qNknP1XpIn8Ug3Rcr6SIyvSoiDiX6mgqSbHhw2XQxTbbclNpV+DFvXan70SCX3MJmJZO
	1aBmnurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjQJ-00000007GpE-2V4G;
	Wed, 05 Mar 2025 07:44:11 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjLb-00000007G8Q-21As
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:39:20 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30bb75492e4so30669461fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 23:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160358; x=1741765158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6j98wzmws3yBjPpQCP6g3erFXEQ03ngjmGwTh500vM=;
        b=eSZu7ZKQkCbjwgPs1I39tHDuaYxifbLwOPq7CAV3E1dlhoRCT3upoz9bB1XhlykP5M
         TkFGcPUhcKZr/nNfsthSOxqd3Dzv4kH7xG4vDO/GJx1FCm5oEUUIeKzkU/2s2bUtvzQT
         JviALPTwzJlf1czbTUExOsVpfuWVhtqzzIEXA+z/ZE6E0mZNikOx5gZ7u7rjfnMBC9p5
         xF+O4Winl1/hLSoTX806tJxYhizISH2BFb6n3sE5yOdAkhOBUJcmpvPd3IY6WIQ2Pp9A
         GPzMDB+i2cusnuxoR/mHMNBBZvbLD65MFzTXhCOaD8o/nY0TAknvUaftAHw/h76HLO1b
         ACgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160358; x=1741765158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6j98wzmws3yBjPpQCP6g3erFXEQ03ngjmGwTh500vM=;
        b=AkroTCRjuyFz0OOMla1rqckd84wfUwVG9FAXkMrslyzhdk4yId3hlSnnGcqOJFPgjp
         /5VnC02xVhOmvXOuf3tbPeXfuyxkRONoKgvTZFfFYy9y1m/G5Z9ZYqsRx756SXsz6vSa
         x9mKKnfgVpeEv00/9X6vWhbamPX//3I2Jq9HnIh6zW2EfVhaG35kMsUoHMbjgEThGJ46
         MJ7LWyN1f+9SfFndBqNZ+z1lnnllriDx5PvkhlMYBXqHH/sO7p1X8zClsRWbs+Ws5ciW
         5AN2r0h50EsDDoX6zU2R6r4rbjd2h5N9rxVANkIHTjvImvEBINx+KAWbfCOJqD1ek38a
         Rm8A==
X-Forwarded-Encrypted: i=1; AJvYcCUgVaqW0cLhCQatoVwQwwAa3goF4jPF6VLxwCL41swy+bxp+v8LsCQs/w6jvDdvcHCxqxJtSjZaBuJpmH8qWAiI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcq9w9GxdbQiAmnMstdbjZSAJTQlpAvR0X4cebyaKPR/Ajp91R
	gpQVBKVpz3FiKDEVQbirKiLdpZd8xF20n02plPIBLlCh/oM44bWvGbbQbx1+6eU=
X-Gm-Gg: ASbGncuBBwS7LJuix7WW9K6htHtHhtaELqRcz0SQhRHhXaCiUzKa9sumogP+AHFqZau
	W7Qduaz3DTq1qirCHFW7JFd68Tx85XEeNmiFvcYLivz2/j75npk4qcfJb7YflUIxSdj93k9gtQj
	LTzZgrA8p7iKuvAR+AQcvUTmHv05HytkCrE853HDlMaeddhvGCkwJRaAy7DsmrE5zrXFzQxVLZG
	H9/6etTBulkQv746nzjaVrs5kXHSkpF1y+zYuYdNiHxm6Gk+FWooq3j6lPQJgC4eXl/HPPzU0t1
	I25uCGG1q0Hw2MR8Ci1BlEnOo7l7y5iMQqx/qc9xSbO9MZnVmKHchA8=
X-Google-Smtp-Source: AGHT+IGMwrfa7udQAfBfFF3CQtvSnUTEAriZdTrADFcKxLMUZRIgfPtcVBaneZI9rdL95/Sp1Nv4Rw==
X-Received: by 2002:a2e:95d0:0:b0:30b:b28d:f0a7 with SMTP id 38308e7fff4ca-30bd7a5732dmr8079901fa.18.1741160357450;
        Tue, 04 Mar 2025 23:39:17 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:16 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:14 +0100
Subject: [PATCH v2 2/6] ASoC: samsung: littlemill: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-2-20bc980c6445@linaro.org>
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_233919_521365_5573DDF8 
X-CRM114-Status: GOOD (  11.75  )
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

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/littlemill.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index c5260e101c2a136001c6273200fa35740e618829..9fa5e3ff9215164491839d6ffdf499a3eeadfbaa 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm8994.h"

-- 
2.48.1


