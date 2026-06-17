Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780E5CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9wU4tKY2KGJdHyXYk6dnV63C3KexEicox33mI2r9NjI=; b=bBFD+f9t+xMcuO9OrQeFQcEgSk
	m3EriNUON7/fw2f3aH/+D53g802KpQJSMyynEKaNglQV8zDldRBNTd5Ajg56vadWimoyBJYL14feP
	HhCsKioi4SeudZKKoA8OKToGckvcIJ7JgcoX5uoPxT5DiDJLjUVUS/84eoIjREdfYpoX7IP74yHfz
	2BUIFhSE5buweZGZ5zdz8fFJuz+RgiCodS5Mi6SEO4qgXwx52QGA8P2JIC8aJeCd89zVO3nYZsyyJ
	kcXGfn3St/uOLB6R70t5MA5jeJp2ca+c/dqZoXrEho9AX8P3mYSINUqR3FwN1tVQWf4ByGdqKmAt7
	BXgF+HDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnZu-0000000H3ZC-1AVo;
	Wed, 17 Jun 2026 10:33:02 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnZr-0000000H3YQ-2nav
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:33:01 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3042a388168so428888eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692379; x=1782297179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wU4tKY2KGJdHyXYk6dnV63C3KexEicox33mI2r9NjI=;
        b=NJe9juntbiclt7OcpvF9UiVS2tY2JQDluL1m3aSqgN33A3zmZewiZrXIYOEJMCNPgu
         5ESHocZcREjfvWFVCxL7S+HJsRklBxvmyPOjRPfYupiULA/Htc1s3Kr4u6AGIKFPX6/B
         xKlUe03CnYYurROrrFTZ5wm7duUIF0EI933yTin5HpC/25IhlC+orqBbURPCF0MyLnn9
         aT+bdy28azQiYgRw/cm5pLW9OzMgF0HXGVyrx5RFslCMPt+FmSuDIi8QhPeu6pDvcd/J
         RbOrPXUlhh64x4WuRm/pWzBtx9HuTSPzZw6c3TsH35o/d+SrKdKVNeyDxR1PN4ihPg6g
         MYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692379; x=1782297179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wU4tKY2KGJdHyXYk6dnV63C3KexEicox33mI2r9NjI=;
        b=aeU5ds7QlnxBVbrwqEcRqO+WPlDS+Cq4Ail9QsXCP8+TLUIPRL0NhFzE+dAJiCEsbk
         CiPtL2LJ5BnpJ6Pbbw09BEsTMXHLPFcuDIIkjZi4D007TufpJjYowPjK/OF1nXhZyH2O
         kX7mMFKmwfV7aBDSbkGwRZRCmABBIYwCk/1PBCSjVa+E3aLUii+sg9lDBOx40H6BmZG5
         Bd3NKfVsYd4Ho8xXCKGL/YxN+1H2kiKyLjj/1V+MvkIxYdZm5cmlJ8hxhHmaVeAMRAdx
         LI2GrR7iIc723VaQQrZTrDkMvICv29nF+fl8jVOTO6hDQesyUYmdQITHDi5K+UYZhQ6+
         b/+A==
X-Forwarded-Encrypted: i=1; AFNElJ+ZyBrtSGVVuta0GtVyYhiKWfLCW0ypZcm9Sl4NPocoteGK4LZT7vKf6DS3aFs4iGQwtzVSGSP+nWZyDZL1s1tP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3aP1xvkGwK9O+/nfinUm7yAduDrPMyBoRByZ1T4enCWiv+5Tu
	RBFkgfCyYOjbrxWqOwsODCQRnvamQMQL01nAqgVrpyuvNxmWQNKJNKf3
X-Gm-Gg: AfdE7cn89zu5TjaqruzfUtjnl+gA0dlfnl/o59YNpmVNvf5Za04c8xpJTN5IwM5q5QF
	EaHNdhO1fLoRoh64ZjHhI1xw3SddCTDuBoS6Or/3Td/NH24uSwZj/W3Y4M9HZ1N9mYsQrCOftfr
	isoWYn5CwnNP6POLHSv+EpKuXyNi7xfLXmo55c4vUSsWgRhfAYu4FKJtQE5fPdEyaZr0UbicUVy
	KsoiRCHnz9BPZLZfVWPwOwxsxfwZWA/sI8cp6f4e+tRgQJhbQhcp1PJw20QDSDFo9xM8K3zlzMA
	sRf3oVXnVramkSK1mhT3GLOzMP5BtjXXR4BptSR6btOt1d30InT355JzebXiRGXSIhLuwEB9Lbx
	psDgsGIKPYH5+6tSntthK4Afxk9ciVSj9cDCkUvs5cFJlih/BWXgbdWk2QqHmfUpQIDFu/sDYeP
	xTH5tS69rI8exjSgcRf8Ve1lELc1q4oUuGyCiKWYyUxB7sx7g=
X-Received: by 2002:a05:7301:6402:b0:30b:d209:dc18 with SMTP id 5a478bee46e88-30bd209ff68mr687132eec.10.1781692378517;
        Wed, 17 Jun 2026 03:32:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:32:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/78] ASoC: codecs: Use guard() for mutex & spin locks
Date: Wed, 17 Jun 2026 17:31:17 +0700
Message-ID: <20260617103235.449609-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033259_736725_4AE97B90 
X-CRM114-Status: GOOD (  11.38  )
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

Hi all,

This series converts mutex and spinlock handling in the ASoC codec
drivers to use guard() and scoped_guard() helpers.
The changes are purely refactoring and should have no functional
impact.

Compile tested only.

Best regards,
Phuc

bui duc phuc (78):
  ASoC: codecs: ab8500: Use guard() for mutex locks
  ASoC: codecs: ak4613: Use guard() for mutex locks
  ASoC: codecs: arizona-jack: Use guard() for mutex locks
  ASoC: codecs: arizona: Use guard() for mutex locks
  ASoC: codecs: aw87390: Use guard() for mutex locks
  ASoC: codecs: aw88081: Use guard() for mutex locks
  ASoC: codecs: aw88166: Use guard() for mutex locks
  ASoC: codecs: aw88261: Use guard() for mutex locks
  ASoC: codecs: aw88395: Use guard() for mutex locks
  ASoC: codecs: aw88399: Use guard() for mutex locks
  ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
  ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
  ASoC: codecs: cs35l56: Use guard() for mutex locks
  ASoC: codecs: cs42l42: Use guard() for mutex locks
  ASoC: codecs: cs42l43: Use guard() for mutex locks
  ASoC: codecs: cs42l84: Use guard() for mutex locks
  ASoC: codecs: cs43130: Use guard() for mutex locks
  ASoC: codecs: cs47l15: Use guard() for mutex locks
  ASoC: codecs: cs47l35: Use guard() for mutex locks
  ASoC: codecs: cs47l85: Use guard() for mutex locks
  ASoC: codecs: cs47l90: Use guard() for mutex locks
  ASoC: codecs: cs47l92: Use guard() for mutex locks
  ASoC: codecs: cs48l32: Use guard() for mutex locks
  ASoC: codecs: cs2072x: Use guard() for mutex locks
  ASoC: codecs: da7213: Use guard() for mutex locks
  ASoC: codecs: da7219: Use guard() for mutex locks
  ASoC: codecs: es8316: Use guard() for mutex locks
  ASoC: codecs: es8326: Use guard() for mutex locks
  ASoC: codecs: es9356: Use guard() for mutex locks
  ASoC: codecs: fs210x: Use guard() for mutex locks
  ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
  ASoC: codecs: hdmi-codec: Use guard() for mutex locks
  ASoC: codecs: idt821034: Use guard() for mutex locks
  ASoC: codecs: lpass-macro: Use guard() for mutex locks
  ASoC: codecs: madera: Use guard() for mutex locks
  ASoC: codecs: max98095: Use guard() for mutex locks
  ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
  ASoC: codecs: pcm512x: Use guard() for mutex locks
  ASoC: codecs: pcm6240: Use guard() for mutex locks
  ASoC: codecs: peb2466: Use guard() for mutex locks
  ASoC: codecs: rt5514-spi: Use guard() for mutex locks
  ASoC: codecs: rt5645: Use guard() for mutex locks
  ASoC: codecs: rt5665: Use guard() for mutex locks
  ASoC: codecs: rt5668: Use guard() for mutex locks
  ASoC: codecs: rt5677: Use guard() for mutex locks
  ASoC: codecs: rt5682: Use guard() for mutex locks
  ASoC: codecs: rt700: Use guard() for mutex locks
  ASoC: codecs: rt711: Use guard() for mutex locks
  ASoC: codecs: rt712: Use guard() for mutex locks
  ASoC: codecs: rt721: Use guard() for mutex locks
  ASoC: codecs: rt722: Use guard() for mutex locks
  ASoC: codecs: sigmadsp: Use guard() for mutex locks
  ASoC: codecs: sta350: Use guard() for mutex locks
  ASoC: codecs: sta32x: Use guard() for mutex locks
  ASoC: codecs: tas2781: Use guard() for mutex locks
  ASoC: codecs: tas2783: Use guard() for mutex locks
  ASoC: codecs: tas5805m: Use guard() for mutex locks
  ASoC: codecs: tas675x: Use guard() for mutex locks
  ASoC: codecs: tlv320dac33: Use guard() for mutex & spin locks
  ASoC: codecs: tscs42xx: Use guard() for mutex locks
  ASoC: codecs: tscs454: Use guard() for mutex locks
  ASoC: codecs: twl6040: Use guard() for mutex locks
  ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
  ASoC: codecs: wcd934x: Use guard() for mutex locks
  ASoC: codecs: wcd937x: Use guard() for mutex locks
  ASoC: codecs: wcd938x: Use guard() for mutex locks
  ASoC: codecs: wcd939x: Use guard() for mutex locks
  ASoC: codecs: wm0010: Use guard() for mutex & spin locks
  ASoC: codecs: wm2000: Use guard() for mutex locks
  ASoC: codecs: wm5102: Use guard() for mutex locks
  ASoC: codecs: wm8731: Use guard() for mutex locks
  ASoC: codecs: wm8903: Use guard() for mutex locks
  ASoC: codecs: wm8958: Use guard() for mutex locks
  ASoC: codecs: wm8962: Use guard() for mutex locks
  ASoC: codecs: wm8994: Use guard() for mutex locks
  ASoC: codecs: wm971x: Use guard() for mutex locks
  ASoC: codecs: wm_adsp: Use guard() for mutex locks
  ASoC: codecs: wsa88xx: Use guard() for mutex locks

 sound/soc/codecs/ab8500-codec.c           |  11 +-
 sound/soc/codecs/ak4613.c                 |  72 ++++---
 sound/soc/codecs/arizona-jack.c           | 194 +++++++++----------
 sound/soc/codecs/arizona.c                |  25 +--
 sound/soc/codecs/aw87390.c                |   9 +-
 sound/soc/codecs/aw88081.c                |  17 +-
 sound/soc/codecs/aw88166.c                |  23 +--
 sound/soc/codecs/aw88261.c                |  20 +-
 sound/soc/codecs/aw88395/aw88395.c        |  23 +--
 sound/soc/codecs/aw88395/aw88395_device.c |  39 ++--
 sound/soc/codecs/aw88399.c                |  14 +-
 sound/soc/codecs/cros_ec_codec.c          |  17 +-
 sound/soc/codecs/cs-amp-lib.c             |  10 +-
 sound/soc/codecs/cs35l56-shared.c         |   6 +-
 sound/soc/codecs/cs35l56.c                |  56 +++---
 sound/soc/codecs/cs42l42.c                | 222 +++++++++++-----------
 sound/soc/codecs/cs42l43-jack.c           |  57 +++---
 sound/soc/codecs/cs42l43.c                |  16 +-
 sound/soc/codecs/cs42l84.c                |   9 +-
 sound/soc/codecs/cs43130.c                |  96 +++++-----
 sound/soc/codecs/cs47l15.c                |  10 +-
 sound/soc/codecs/cs47l35.c                |  10 +-
 sound/soc/codecs/cs47l85.c                |  10 +-
 sound/soc/codecs/cs47l90.c                |  10 +-
 sound/soc/codecs/cs47l92.c                |  10 +-
 sound/soc/codecs/cs48l32.c                |  28 ++-
 sound/soc/codecs/cx2072x.c                |   4 +-
 sound/soc/codecs/da7213.c                 |  36 ++--
 sound/soc/codecs/da7219.c                 |  59 ++----
 sound/soc/codecs/es8316.c                 |  30 ++-
 sound/soc/codecs/es8326.c                 |  29 ++-
 sound/soc/codecs/es9356.c                 |  29 ++-
 sound/soc/codecs/fs210x.c                 |  86 +++------
 sound/soc/codecs/hdac_hdmi.c              | 116 ++++++-----
 sound/soc/codecs/hdmi-codec.c             |  16 +-
 sound/soc/codecs/idt821034.c              | 120 +++++-------
 sound/soc/codecs/lpass-macro-common.c     |  11 +-
 sound/soc/codecs/madera.c                 |  31 +--
 sound/soc/codecs/max98095.c               |  34 ++--
 sound/soc/codecs/mt6359-accdet.c          |  12 +-
 sound/soc/codecs/pcm512x.c                |  17 +-
 sound/soc/codecs/pcm6240.c                |  27 ++-
 sound/soc/codecs/peb2466.c                |  15 +-
 sound/soc/codecs/rt5514-spi.c             |  20 +-
 sound/soc/codecs/rt5645.c                 | 161 ++++++++--------
 sound/soc/codecs/rt5665.c                 |   7 +-
 sound/soc/codecs/rt5668.c                 |   9 +-
 sound/soc/codecs/rt5677-spi.c             |  35 ++--
 sound/soc/codecs/rt5677.c                 |  77 ++++----
 sound/soc/codecs/rt5682-sdw.c             |  23 ++-
 sound/soc/codecs/rt5682.c                 |   4 +-
 sound/soc/codecs/rt5682s.c                |  16 +-
 sound/soc/codecs/rt700-sdw.c              |  13 +-
 sound/soc/codecs/rt711-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt711-sdca.c             |   7 +-
 sound/soc/codecs/rt711-sdw.c              |  23 ++-
 sound/soc/codecs/rt711.c                  |  19 +-
 sound/soc/codecs/rt712-sdca-sdw.c         |  34 ++--
 sound/soc/codecs/rt712-sdca.c             |   7 +-
 sound/soc/codecs/rt721-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt721-sdca.c             |   3 +-
 sound/soc/codecs/rt722-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt722-sdca.c             |   3 +-
 sound/soc/codecs/sigmadsp.c               |  16 +-
 sound/soc/codecs/sta32x.c                 |  12 +-
 sound/soc/codecs/sta350.c                 |  12 +-
 sound/soc/codecs/tas2781-comlib-i2c.c     |   4 +-
 sound/soc/codecs/tas2781-i2c.c            |  20 +-
 sound/soc/codecs/tas2783-sdw.c            |  89 +++++----
 sound/soc/codecs/tas5805m.c               |  15 +-
 sound/soc/codecs/tas675x.c                |   6 +-
 sound/soc/codecs/tlv320dac33.c            |  77 +++-----
 sound/soc/codecs/tscs42xx.c               |  44 ++---
 sound/soc/codecs/tscs454.c                | 106 ++++-------
 sound/soc/codecs/twl6040.c                |   4 +-
 sound/soc/codecs/wcd-mbhc-v2.c            | 142 +++++++-------
 sound/soc/codecs/wcd934x.c                |  46 ++---
 sound/soc/codecs/wcd937x.c                |  24 +--
 sound/soc/codecs/wcd938x.c                |  21 +-
 sound/soc/codecs/wcd939x.c                |  19 +-
 sound/soc/codecs/wm0010.c                 |  63 +++---
 sound/soc/codecs/wm2000.c                 |  27 +--
 sound/soc/codecs/wm5102.c                 |  12 +-
 sound/soc/codecs/wm8731.c                 |   3 +-
 sound/soc/codecs/wm8903.c                 |   3 +-
 sound/soc/codecs/wm8958-dsp2.c            |   9 +-
 sound/soc/codecs/wm8962.c                 |   7 +-
 sound/soc/codecs/wm8994.c                 |  51 ++---
 sound/soc/codecs/wm9712.c                 |   4 +-
 sound/soc/codecs/wm9713.c                 |   4 +-
 sound/soc/codecs/wm_adsp.c                |  87 +++------
 sound/soc/codecs/wsa883x.c                |  10 +-
 sound/soc/codecs/wsa884x.c                |  10 +-
 93 files changed, 1330 insertions(+), 1863 deletions(-)

-- 
2.43.0


