Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F20C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 06:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q+Ji5J8LTGbxypsqRCu69yH+HVZ9BprDmcay4dgGIBI=; b=DsQ9K96bnYEMDrUMH+Fal8vYOM
	a/+5kUlerc/HQN2K/r6k9JvPIvQHHF73VcmjdqF3ZqHOt3FhXiXBOihiCWV2h2LykSD2Oz641Mfwc
	Db9hG+5GGLeojJGZKsv2kbZ0IFwY34NDlSSNHaHvj05wQXj664dobuR1n+b2tYouHVxjp+7JKhShM
	/Soip9S7/8kTUEhoYGySdEsdbOfkcAjDGlIY6+NrxNz9gt2W/FikMEvTh+nXTqqYGE9smTGVEBALj
	z30Y5fjDKj4VGtJpc26rMyC1s92yDfkHcEp+07TCOwnq86/bBLDite4ORtzdgD4UQytNe2OLiW6Ol
	Go1yMdFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgy8-0000000BtsP-0mAY;
	Fri, 31 Jul 2026 06:43:44 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgy5-0000000Btr3-38HU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 06:43:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso563243f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 23:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480220; x=1786085020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+Ji5J8LTGbxypsqRCu69yH+HVZ9BprDmcay4dgGIBI=;
        b=ja/NcVk1Bm5FBfxRsV6Tw2TN1Wxr64FLx/rmTGz1j1htyFv4U9f/KmLuDzk6ds6/k9
         qmB2FH4L4UxG6zgDplltO49cSzXrkQ8y480mBVzTwABUG5HYzWc6gIdcoHYpZ9jOnv1e
         0cT6ulkIzvDG52me3kAiJxCzBRoTFTWKN1/rapr+KSwMRnceUyj26JoH9n4X4Wkmz4Ts
         V7TFj80I5/7yb7Nm9w+cZrEKcXYyJcWYfFLaN7DnLXBZj3yiUhKHDaeg2zL5zVelnaTX
         09YbQrB6GT36GPb9Dt99ul/llU0WT6goDZaj8U4cuWlEI49pxV3gn3dG7lMsRP9MO+gm
         IPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480220; x=1786085020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q+Ji5J8LTGbxypsqRCu69yH+HVZ9BprDmcay4dgGIBI=;
        b=UlrP67q55FX/LmBEcqneki9Vd1UgV+udRSJWW7VZao10aRrLpeYz/L8x/qySzedQLZ
         G1eAx78X/n1dIInuqKPis9XSiuW27RZ+Y33r6msOWXZ4HbfnnryNWKXl7JQx91AKXuD5
         4wQUJPj02WxNgD393aKgIeFRYeL51V5T25EGXSxK356IWL2xARzlKokMVnnOvAslR23Z
         A/3vKlFQKodjYlX3a96wyWRbIJ1QiZ2YPN47I1K7/EGxv3hSGeInocL/6JkHhlHwJmRS
         ymIMltAOnRFcONHHVyALwhkVTWbjHqJuyZv+H59vkJjGmf7AacPbQgxzpSqeFyosE4qd
         pYMA==
X-Forwarded-Encrypted: i=1; AHgh+RqkN2mqsZtaN0JrlAWN6PTz7PhcfR7FRxvDBaPCZkxMXbN9nVrKVIJsBShK/4fZOjkPQOqXUtc03kj+j9n6xn1R@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6vAJAbtjGrxon1JVgh2XdfZ5JF0GKaK9w1LboPIlvljtln0eH
	S8JLr2P+tqnY3/ssId8LqlT/0l1itVZnR/RH3bt3KmSTCwxituBAvkbo
X-Gm-Gg: AR+sD13nVq/7VfOV5aCg18XBPtama+HmWo5K3go7CMXsE3WXhb1sboZTzpIrXy07wy1
	UhDgPtGRyqK+6K7WxaRdEkB9RYfPc+YayxBndC2rupJYXz9e+rwK8WdxhIrRjJPVXg08CVCkDMt
	MakohF5wrSYbokArocNNTgZ6+mC+7fzo2LOaU1+vGlDm6aPqZ9akjpCKF8cZl02lKRJW1D00pGQ
	i2xyzYH4Ol+TO8GWRZbx0G7XC8UKJfXxj+BGHK27QPbomnIOgOUYE/64qE+aIC5kkxwT6az7GKR
	0acpuGLG3S+d4UWwoYeOVCxRsFAXrmK5lP5uWALPatLEw6EzZEIv9D2csHiO9WGVmSJvHA6A6K5
	kXThzu0ye747+k2+iVsp0DPYOPiGv8bg4QgghEAKTKJ/ORSdcfQpZ4+cayi9HXNYnVqQnqle94S
	A9QKpWPKDKvvNc8ZEpEhjfLwzebKeGsV5L34qHjGm3zoGOMvcHWKH/7xK9hqKuDSx7eTOiaut1X
	nuIuOh6bZWEGkXcQCR0DZGN+4S0otdLcHr1AO7OZT30fEtuMICyIA==
X-Received: by 2002:a05:6000:2309:b0:47f:9404:5185 with SMTP id ffacd0b85a97d-47fd2ac976cmr2008837f8f.24.1785480219703;
        Thu, 30 Jul 2026 23:43:39 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/4] ASoC: Add support for Airoha AN7581
Date: Fri, 31 Jul 2026 08:43:20 +0200
Message-ID: <20260731064326.2284228-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_234341_821795_422E5B17 
X-CRM114-Status: GOOD (  16.85  )
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

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Changes v4:
- Improve Documentation YAML
- Move IRQ regmap to mtk_base_afe_irq
- Use mutex for user tracking in ETDM
- Register IRQ after memif allocation
- Address suggestion from bot
Changes v3:
- Major fix to the ETDM code
- Add duplex support
- Improve Kconfig setup
- Rework and improve YAML schema
Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (4):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  50 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 529 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 458 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 161 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1479 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.53.0


