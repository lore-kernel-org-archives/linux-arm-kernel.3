Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A473C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=syBpKBFGjGejGwg1BjAhn4n5QdMB5B8yOZv838BwUKA=; b=DaAnojb/wZQf14j/zvfvnsfkMS
	WNnfKM5iFkXGL3IP7AzAUmJD5z84Nd8khpRVq5S2M4cBbFs+aUVDFphi9adhgZEK5RZ1v9lONppV7
	t6baxfgLBhbhAuoV2kIClkF3mj8DjgpBf92oKkI2FPQv/1uSCzTU3pp5TCdDngyMTYuL61xUSzPJo
	B1KDNTbIe8gZry7WqSlLjZvuFojwTyIHGJHgkXnuIS7F8bCPFpS9AfqXlb0qP+bT8dNPi+Lv52MsI
	jeD+VSGE6NIpwQd3wA9VZi499G/NZjhXf+R/5zqqCm1PrbbSdqUHRYVGkXSJcy3Sus2QyZlbJFQWz
	xYoFXEIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS3q-0000000FxdZ-3Tc3;
	Tue, 30 Jun 2026 06:35:10 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS3n-0000000FxaU-2k3Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:09 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso2438643a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801306; x=1783406106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=syBpKBFGjGejGwg1BjAhn4n5QdMB5B8yOZv838BwUKA=;
        b=fkUud+b6nla82mxvRV99da7vHiix4FWxRmtgtICooKKUUV35bohvy99ZyoxfLRr/Ok
         Ka54VW5aBfI0ck6bTjztkQ1d4Y7qjKj10RVplMq5Nqd0m+MP05EhGUqHAk2zpHsyHSEo
         gwLnoUgZ5z3ycJkCUllXFiWZyjSKrAT7ZfWqghgeud3XuQRK+sMZCoTSSZ2p102OdnUq
         /e8mntX+OJd81WiB2f3vPlYVLNeq+oB0QJddv2+/rdgzYOII8kD4FF7ctEYVavF2f25L
         8/7u2fkNsmRpdMOVXbJ56hnBMW6a3Hnqgblocx7uDEJJEJ+mDSjfzP58RIJUXK6LflVg
         LTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801306; x=1783406106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syBpKBFGjGejGwg1BjAhn4n5QdMB5B8yOZv838BwUKA=;
        b=rAX8d3wt4C5kQC/EhJgezfa1MTmVHK85p8U00VRWHkFkPffM0cTeVeQ7zGX5USnEha
         HjIP3Vxe0U1srIQ8HXdjD4l+C2sRUor3X47RPVI/TKgwveOWAQVC4cc7Z577p/BCN3gi
         eH1HzjpRXvPFZHJwBdotmDBisXgaXphqh/I1zn9cnHMmTz3LTCzI1aOGMsXzkvqBg9q/
         akWH9enK6RCEXQyzTShzw9FKoby39HUqTc5yTEqxPMu+LG11BPctlDrirBIZuBFE6/XF
         rMjmD81/zFOwGkv6gAH6utKOtoZir3r4gBcLX/Qcq4deWtAma76sh1JuBEeWz/htA1R8
         OQSA==
X-Forwarded-Encrypted: i=1; AHgh+RqVmdh+9nEOMP7IZWPBTkuhT8O6JF4z9LqAxqtXD+yMtDcpuiC4gwHpqiL53X7l9wjn0dy8zE9ESMf9PiQg6h4T@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh3jwJY5YPIJCd3YTVxO71Xsn9wo2eEulJGNHWQ5UHPCf8Q9cL
	BKH4zCBJIQvWxg44WZkrA2eOOdCvvIgpfVG6SptavpZBT0FCOtQeJmHq
X-Gm-Gg: AfdE7ckFWWwN/raT4HLn+xlzeHRiUYTBBDBg8tLm4PPPoP7ZMJ6y5z2kgS3keqT987f
	s6dqb4Kg8niJ/uheVS2zqy72UoNnf7qVciBE/HTTSRZ3l77EcIzXOU0RZvjJbB2hfMFVZE5Znic
	1Q0LRPUlCJf7whjkdFNX9UTn49FlmWLPJ0SirR4USgXYzsqqkwewqH8cDwAJRT0FKQgcYwzm3Ux
	BjSHZVIB6TGN775ZuSBF+d/xUerFMacgRAnDaG0nRGDgu2AWXWoavxzCyQtCzRhQ+m5S7FN4jpz
	iHPpSUD0Z5JHJDZ49SF/ViBgnEkuY5NREwU4MiEunnfKBgmDfZcZUhdwO/YDPEzeQi1F7h5yf/r
	wN+OSHOHTFKiW6DnIKOHcqrQPeBAIztNJgdUz/3chVFOF32m0PGYyXF18ziMB71fPUbiy8pSs4S
	usA2oe1VWGHtPiy7kLDR3igSRztmUs8VSgktwIlzEhTqrWDaUE5fCa+cuLFg==
X-Received: by 2002:a05:6a00:b481:b0:845:e44c:2e5 with SMTP id d2e1a72fcca58-8479f109b70mr1989863b3a.22.1782801306377;
        Mon, 29 Jun 2026 23:35:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:06 -0700 (PDT)
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
Subject: [PATCH 00/27] ASoC: codecs: Use guard() for mutex & spin locks
Date: Tue, 30 Jun 2026 13:34:22 +0700
Message-ID: <20260630063449.503996-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233507_902789_F21446DD 
X-CRM114-Status: GOOD (  11.66  )
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
 sound/soc/codecs/da7219.c             |  55 +++------
 sound/soc/codecs/es8316.c             |  31 +++--
 sound/soc/codecs/es8326.c             |  30 +++--
 sound/soc/codecs/es9356.c             |  29 ++---
 sound/soc/codecs/fs210x.c             |  87 +++++---------
 sound/soc/codecs/hdac_hdmi.c          | 117 +++++++++----------
 sound/soc/codecs/hdmi-codec.c         |  15 +--
 sound/soc/codecs/idt821034.c          | 121 ++++++++-----------
 sound/soc/codecs/lpass-macro-common.c |  12 +-
 sound/soc/codecs/madera.c             |  32 ++----
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
 sound/soc/codecs/rt711-sdca-sdw.c     |  30 ++---
 sound/soc/codecs/rt711-sdca.c         |   8 +-
 sound/soc/codecs/rt711-sdw.c          |  24 ++--
 sound/soc/codecs/rt711.c              |  46 ++++----
 sound/soc/codecs/rt712-sdca-sdw.c     |  30 ++---
 sound/soc/codecs/rt712-sdca.c         |   8 +-
 sound/soc/codecs/rt721-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt721-sdca.c         |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt722-sdca.c         |   4 +-
 36 files changed, 557 insertions(+), 707 deletions(-)

-- 
2.43.0


