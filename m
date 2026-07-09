Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F74C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ad0P2VMz9bf8HA6F8SGWlOPHl2k6oftAxCYlJLG1Vz4=; b=kPewp+7xSk1HA9BEO398rSJVAl
	U62b4Zb3UhvO5KAtVUrF7X4QcO4FXNILQwI+2SrQuM1t1UlbNnjz8Fs2DpZpNmk1HzFrUBbZert7G
	NQtaDj+cOe6/WTm2imX6C8+nySn6mRkVhAWHiGvs5L9CSljErlSoVWwL0VjF7waQPNjtt3v9ceH/A
	LiZHeUwDnoTTCSkqkCaPKQwjOJrCbG3aQLTJ+7LAWGgR6Zgifyt56h4+/js4DaJkAoAACJwUrNqYu
	RwrxKFE4e66WRr+DMz7TUkO1TVgajKR9Q4PhaYelV3TdAe9d7qc0LmxaxZBWMiQ6quTdH+gh7/PbA
	uSgeM+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgrQ-000000011iQ-1WxX;
	Thu, 09 Jul 2026 04:59:44 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgrO-000000011hW-00d7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:59:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1372412a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783573181; x=1784177981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ad0P2VMz9bf8HA6F8SGWlOPHl2k6oftAxCYlJLG1Vz4=;
        b=eoZXdCuCex+f1b8o4Ywh74nx3zACg5nHHK/2Pjsj/YGmFU0YWYlNDVrWbfo6l4qkBV
         kdB+C7tkJaUD8XdAsxIszYW0WAlMxQB56n5uYQFXA6LClDjANX4YHSn1jjr+hpUCFCeY
         PLvcmMLJLnsm/uS7y403CmlniULsQPm5WjFcoRyVEaQzncTVFC8Oxwje1WRR5zfEHTZr
         hwEktMb/U/7xMC7p4OoSmVizKsN73/ctN/SgAIPOCmu9BJDtsnRGLSczZzUD9ADKFsJO
         MSYIf8I1LrlnKtMu0cSLvpfoXAXUpCQbmidgAiFMVZ2XfDr0NgtvrhHO0lrYYcxkNMfu
         EGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783573181; x=1784177981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad0P2VMz9bf8HA6F8SGWlOPHl2k6oftAxCYlJLG1Vz4=;
        b=YkT5jgoZMh8jcmHa49NMfb1RglHJHFp+/eZyhykfremCVTdJzLv2GQftqunsTD0tgw
         z7hiEN1X56tXBXDoghsnNkJHo5LG8hB+fJhUUnbKt3KtuKMbr3GJn8lEZGleMCFkIzDD
         xeQc89wID9XKdVA6lEUpzAhGhJogJnGrRVBSrZrfOPAbAB3V3bDC/oM8+eG0QMTB2da2
         CLFv+CWcQidFZlvVQyrZ2tUZwYvnwYAWJHfnDE9snD72V0AIe3DWW6Ke8S5yn52MFIiw
         3gEyvzbFh4EFBHDDtYWBloaNs/FslLD1U/ILW7VFqlmu4xr6fzcE+7zSjqAQhsBwqmKO
         B22A==
X-Forwarded-Encrypted: i=1; AHgh+Roqsf2rmvzYIfEKVTey0qt8ZAO78WsxraTHoEo/YrSWtAZuSRXva2pQWUzquziLg+xulRbBUSwKegjzHhY1yZxE@lists.infradead.org
X-Gm-Message-State: AOJu0YysUph5qCTayltYQESWVb7t4gNi9HKd7P5UUle6YlgAOVbveFCC
	vL+HK6FbtOAkYHhgIWgEbPI4Y2I6PBxgP4WtfpD1oNLBsFXtFbFNFK0S
X-Gm-Gg: AfdE7cl3aZGFR0Bn9oUKjU4YXp3o658ufTdr8tFIWxkmnG8ldM1sjZVzUDQmLjGSOPb
	F7539Am9QoEQIP5G27DZpImy4ZosytqApX4OcDEpWeT1ZbHYvGV58dzz0ZrMA3fPmAyJZP666vO
	W7B/v/6f0zrFtLe2tXsioBFmwYmzgD4KmpKGVo1HJvCVscs11TXLTNuC/44Pa+vSXXoRudLDqwg
	iTOZ7sjyA8hHSOOQW52KXhYhsJLPmJg7Xi0UgcZQD+HqFSOTpqswHoCRDM2BfbRRG7GIpbFPRuH
	tltJ1J1O9xP1Dld/qJ+W+gIJ75bsHFgimLjnPyoN6OBSWloUnIiHgHRG9hvZtZFi6pPsqwXS4od
	vUG0+zQEdzwVAYDMipU07wjeYhSifhCgq3ceuAyrkoWmmA/ojRDqUGSgA18smJfymSbXsM7P6B0
	UnRMDSDvt+nA+kAok0Nmx3U/12+urqyLMkuk7ySVit65AZQu5NqACUyJvPPA==
X-Received: by 2002:a17:90b:258f:b0:380:15fa:c5b2 with SMTP id 98e67ed59e1d1-3894043e537mr5070234a91.18.1783573180995;
        Wed, 08 Jul 2026 21:59:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b47esm490481a91.3.2026.07.08.21.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:59:40 -0700 (PDT)
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
Subject: [PATCH v3 00/27] ASoC: codecs: Use guard() for mutex & spin locks - part 2
Date: Thu,  9 Jul 2026 11:58:35 +0700
Message-ID: <20260709045902.498848-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_215942_038785_BC106B6D 
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

Hi all,

This series converts mutex and spinlock handling in ASoC codec drivers
to use the guard() and scoped_guard() helpers.

This is part 2 of a larger 78-patch conversion series. Part 1 (24
patches) has already been posted, while this series contains the next
27 patches to keep the review manageable.

https://lore.kernel.org/all/20260617103235.449609-1-phucduc.bui@gmail.com/

The changes are purely refactoring and have no functional impact.
Compile-tested only.

Changes in v3:
 - Rebased onto the latest broonie/for-next.

Changes in v2: 
 - Add Reviewed-by tags from Charles and Herve.
 - Address Herve's review comments.

Link v2: 
https://lore.kernel.org/all/20260708141734.578926-1-phucduc.bui@gmail.com/
Link v1 : 
https://lore.kernel.org/all/20260630063449.503996-1-phucduc.bui@gmail.com/


Best regards,
Phuc


bui duc phuc (27):
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

 sound/soc/codecs/da7213.c             |  37 ++----
 sound/soc/codecs/da7219.c             |  62 +++-------
 sound/soc/codecs/es8316.c             |  31 +++--
 sound/soc/codecs/es8326.c             |  30 +++--
 sound/soc/codecs/es9356.c             |  29 ++---
 sound/soc/codecs/fs210x.c             |  89 +++++---------
 sound/soc/codecs/hdac_hdmi.c          | 117 +++++++++----------
 sound/soc/codecs/hdmi-codec.c         |  15 +--
 sound/soc/codecs/idt821034.c          | 144 +++++++++--------------
 sound/soc/codecs/lpass-macro-common.c |  12 +-
 sound/soc/codecs/madera.c             |  39 +++----
 sound/soc/codecs/max98095.c           |  35 +++---
 sound/soc/codecs/mt6359-accdet.c      |  13 +--
 sound/soc/codecs/pcm512x.c            |  19 +--
 sound/soc/codecs/pcm6240.c            |  25 ++--
 sound/soc/codecs/peb2466.c            |  16 +--
 sound/soc/codecs/rt5514-spi.c         |  21 ++--
 sound/soc/codecs/rt5645.c             | 160 +++++++++++++-------------
 sound/soc/codecs/rt5665.c             |  15 ++-
 sound/soc/codecs/rt5668.c             |  10 +-
 sound/soc/codecs/rt5677-spi.c         |  36 +++---
 sound/soc/codecs/rt5677.c             |  75 ++++++------
 sound/soc/codecs/rt5682-sdw.c         |  24 ++--
 sound/soc/codecs/rt5682.c             |   5 +-
 sound/soc/codecs/rt5682s.c            |  17 +--
 sound/soc/codecs/rt700-sdw.c          |  14 +--
 sound/soc/codecs/rt711-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt711-sdca.c         |   5 +-
 sound/soc/codecs/rt711-sdw.c          |  24 ++--
 sound/soc/codecs/rt711.c              |  50 ++++----
 sound/soc/codecs/rt712-sdca-sdw.c     |  30 ++---
 sound/soc/codecs/rt712-sdca.c         |   5 +-
 sound/soc/codecs/rt721-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt721-sdca.c         |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt722-sdca.c         |   4 +-
 36 files changed, 569 insertions(+), 731 deletions(-)

-- 
2.43.0


