Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4D8CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 21:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SJRp2wrffSdTEzc2A0jyXhx0rgIi195AdOSsXPwcqzg=; b=PRlgHyFWx7SVoj
	Tq7ZXoA+e7egSL4kRaD9RJbudjHnqltsMSv6qb2rrmk1UvJ6KV5UKNxm8pq01IRmdVtRiwfJI1Gqe
	NUOMwxCbCZJhR/mCLuMl1F6Sxx6No5XMr2Sf411eh2+oXxFYmyGhYUA02giyfk8Dwx2QFCLB1o9nM
	840RVqJk1XsJLyKxp4SqVpt5n9NUVOqnPi24VIk/YTT2d3XZxgwUI3tip2pH3/4TPCrCnpPB1hKXX
	hqrAYqa4gBUltdVamZLJk9zBhyAe5kgRyL1ID5b1+gT60sl7bizFIorA7JnMqkbuf44krYZ8PGf/t
	sIuz1aYspHD3t/QOTwxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUZ-00000008NQx-47Sx;
	Wed, 10 Jun 2026 21:29:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUW-00000008NOj-2kEf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 21:29:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so41243225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 14:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781126978; x=1781731778; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJRp2wrffSdTEzc2A0jyXhx0rgIi195AdOSsXPwcqzg=;
        b=awyjCcAY2yptaDMHLXtQHhRN87bekhDxk1HaO2P4uoFGUXhVPLjcCAo6lrKfdn0JPY
         mqbbLG90dM9zXn1VDjPKu+ePQ+RxPprNLBn8WTsujXZuIa2bXJIkQItPyiSq2zWinUKF
         obi5s9lUiiQADtxG8P/MibJ6a0BUs8eZHTPYKhY6A8hxzD7qXfpWCt/bMwoA1OCq8Pij
         UZz8ouotwcemcP+kX/rJFcVGJQ99f6mA1suGx4nRIblc3e/gnX9tMzWp96tRBGPpolxc
         SIh7Quc2W2gooSwZGIOiMsqXL54cw0oSnkycKsm4KrePKJ/2OFh0cvArJEJjr7yCoB6R
         YLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126978; x=1781731778;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJRp2wrffSdTEzc2A0jyXhx0rgIi195AdOSsXPwcqzg=;
        b=FBEQU0w4xCyH5ex6ZVAZQYR43GH9xxWrIpvnU5Xp7okIsnRdPJwWpJS8r/bmSEPa7M
         DmahYdhua2h1OInJ+g9TOaSFobFvVV66AGdST+DOPDYAChWocEhhUtq+dSV1mHVWIg0H
         3sRUr4wpXxyjIWsz/HVaAjkCcJc4s2d2Mcznhc7eUsJWNlAv8Jjib2Z3mIssOisbpTGr
         +St1a+IMa+c4m1pxVzD0Gxw+cqLAr99NToShaBBHNY5/0Zzk7Z42CeUgU53i15o1V4+O
         K2hKysf1aajW9eShq3qadNVgeNZHhzbuT/2oVZN+FEMk7hphPMNV18lHWWC0pWqjgx9g
         cQ4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+evsdQAKvyc7XcYirC3rwcUexStwXuxn7D/pPuPhlb2MFqGfmg/s0R7GdDAucQqyhRG/nNyUGOPhTMm2cr+t9D@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc1UnL5b9BU5av/d/vAvrddY10VIPIrWlQbOfkRy0KUkv+iZEa
	uYbjQ5ucBBsrBFJq3a11Av8BqjF9IQ7EhLPpvPp+Pe8nYIyrE6Zvr4JzXix7ca+c4iBkqSBAiEq
	dyXPLCvI=
X-Gm-Gg: Acq92OHlJksZbYZRqLtH20zSCd+6wGFXT2IaoiWzMsaTQB2jhFFeaKgOoIcPhznYBOj
	3lUIvTN/jx1VzSMRjGmb+PrjGYFtVkZ13Aac395VM8Hx0t0WL0ZB2y6RNyTVfiDql34XgHnr5/1
	awj6dHJqpKjRB6k5nhSSX7bJZHd9OQx0+Gxtyn32EmVUc1/TA2OW4Ab0JXLrgNC5nv7wI4Eq0dE
	5vDfK4DkpOtfaF3kEGVg2O9IvMEsJfDEZOpGA7I4ZBdltVrC63hPdmLPwcsld6uw1q4v56CFc4z
	yU8R27XztqcLqWz26u/0VYIyukrdYMuyGC08uK0GcRMdYgKoBnVJwZW7lKuB70PaxYpdRCyHtzH
	P0VMDohvIaR92wgrQ3NdmAY9+fHErETUuEyLy1VxwUkYsrfcoB65ZDdhQ4tQ3zOD6LyMN9fa+QG
	xP/+AnNygS343zqZACcyBbMdlzt5xRtm4=
X-Received: by 2002:a05:600c:1d27:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-490c25e10f9mr448608335e9.20.1781126978195;
        Wed, 10 Jun 2026 14:29:38 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.238.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e4228768sm970965e9.0.2026.06.10.14.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:29:37 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 0/4] ASoC: meson: aiu: align I2S design to the AXG one
Date: Wed, 10 Jun 2026 23:29:24 +0200
Message-Id: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTXKWoC/32NQQ6CMBBFr0Jm7ZiWUlFW3sOwGMoAkyglrRII4
 e5WDuDyveS/v0HkIByhyjYIPEsUPybITxm4gcaeUdrEkKv8oqy2GDgONDGSfJAi0tKjbsndlCk
 dtQbScArcyXJEH3XiQeLbh/X4mPXP/s3NGhVa0xS2LK9F15l7Q+tTmsBn519Q7/v+BX8wK5a3A
 AAA
X-Change-ID: 20260515-reshape-aiu-as-axg-1dac9037cad3
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2673; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=gUzrcXWFBRd4+87BftZYwKJ52jua2o2zGHf5pOVqNd8=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFma1x2MVZdFz6h6XLD0jbTR6jPFnzWS+jw9IgWcEp6WL
 l88Pdmto5SFQYyDQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABO5u57hf5FU44xSJwaJaYv0
 X+yelXb9at+csHUfI3V+Bpjcm9w6dRkjw7d5wre+ss0TW1H5qWXGWtMXOafTJ7z8xrZEUe9mnEr
 rZkYA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_142940_729593_C2B49C25 
X-CRM114-Status: GOOD (  13.89  )
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

The goal of this series is to reshape Amlogic GX's AIU implementation for
I2S to let it follow the same design as in AXG's TDM. Keeping the same
design allows for unifying the two platform implementations in the future
and it also allows for an easy addition of I2S input.

The first commit introduces gx-formatter as the basic block which takes
care of properly formatting audio data. Formatters are DAPM widgets
(c.f. axg-tdm-formatter in AXG) which are dynamically attached/detached
to the streams when the latters starts/stop, respectively.
aiu-formatter-i2s is introduced as formatter implementation for the i2s
output.

By the end aiu-encoder-i2s will only need to handle interface clocks and
enforce interface wide rate symmetry (c.f axg-tdm-interface on the AXG
platform). Right now rate symmetry is not relevant because only i2s output
is supported, but it will become useful when following patch series will
introduce the i2s input part.

This series was tested on an OdroidC2 board (Amlogic S905 SOC) both with
HDMI output and with NXP SGTL5000 codec connected to the I2S pins.
This series was also verified using "pcm-test" test tool and all tests
are passing.

Changes in v2:
- Fixed most of the weaknesses found by Sashiko review tool [1].
- Resolved testing failures with "pcm-test" as reported by Mark Brown
  (thanks for the heads up!). I left a comment in
  "aiu_encoder_i2s_startup" to explain the fix.

Link to v1: https://lore.kernel.org/r/20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com

[1]: https://sashiko.dev/#/patchset/20260515-reshape-aiu-as-axg-v1-0-53b457784ff3%40baylibre.com

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Valerio Setti (4):
      ASoC: meson: gx: add gx-formatter and gx-interface
      ASoC: meson: aiu-encoder-i2s: prepare for multiple streams
      ASoC: meson: aiu: introduce I2S output formatter
      ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data

 sound/soc/meson/Makefile            |   2 +
 sound/soc/meson/aiu-encoder-i2s.c   | 281 +++++++++++++++++++++++++----------
 sound/soc/meson/aiu-formatter-i2s.c | 104 +++++++++++++
 sound/soc/meson/aiu.c               |  32 +++-
 sound/soc/meson/aiu.h               |   4 +
 sound/soc/meson/gx-formatter.c      | 282 ++++++++++++++++++++++++++++++++++++
 sound/soc/meson/gx-formatter.h      |  56 +++++++
 sound/soc/meson/gx-interface.h      |  48 ++++++
 8 files changed, 731 insertions(+), 78 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260515-reshape-aiu-as-axg-1dac9037cad3

Best regards,
-- 
Valerio Setti <vsetti@baylibre.com>


