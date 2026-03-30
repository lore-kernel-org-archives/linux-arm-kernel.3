Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4833F3D61F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ffjqD22wwfmhO+ld9/luMon3GDz24nlqdVKsWtkc/0=; b=Lsk0mOM9ikshApl4yJA+SfPm6n
	jW1JRzh7AlbrdU9gPuqKatss4dozEZR+rFCp9NnirF2Nm4By4s1Du7MSbfLa2viulXUSwAxs1hdqs
	F5fCIShIJ5+HowxqDZm6jf9ebLo5w6CB9pfyvzLxruQoCi2hLQGS6wqV/qVBGoNDOs0y2yANAMbvO
	2diIASuS56bbXG52RNY6PMzcHVV2HawsMmLQB/DLhFXEQOQPa7xYfKtjhcNY/Nqj3k4hMs0xGy5Id
	kbEqsyYaOLaJeZXgvnOw6N8uOxVZ2eo1kgdCHMtYkYYA27BrVjljMv1YnVS7KBCizfxalbt3DqA//
	avX/iNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785C-0000000Arcn-0sDX;
	Mon, 30 Mar 2026 08:34:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7858-0000000Arbx-3NhW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:34:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso36844295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859685; x=1775464485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ffjqD22wwfmhO+ld9/luMon3GDz24nlqdVKsWtkc/0=;
        b=g0mBEDCy5Xt1VoE/QHMtZJVUHgblztehyqspci6PVOscCeFcOlJtVLzMxvtSOn3dfm
         cBCdS/cHScP5ZOU42jhYMW2k2D/1ZYLOgUx1Lv8MrERyCCNi1L4LO3PTmZIIUTSQ0nq6
         5LCRmvGBzV4ktJ1JzJpi2KJuorEYgDmsT4nfxdpeN7wvn3USjEDQiqt0zJEdJyF7VWxU
         SanLOm98pytlb5H9QI8tYgo15V2Jj9FRggfsV+Zg+FmvVLWNN8z1Y8dti4FoyP2EcAjP
         ubVaINQ9oaBZ4amhGSQ6Ar0/czorZos8Rk02cGXxc9pXLyPW73bPYUqSk5Oo8earcuov
         ox/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859685; x=1775464485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ffjqD22wwfmhO+ld9/luMon3GDz24nlqdVKsWtkc/0=;
        b=AvSaqHQROMjj0WZe7UwlXhyG6eNnwGZK9pX6sXipiLzTWu/4BIapIz8TFtor9rvsZD
         nhrb6jx9Rx36nFeuW1NpZQ5qL6s69Zq/XrMyZcAmap6OqvTyM2YbODAg8U8MsE3FvHuI
         dg9iuWJMCDpNoQZTmPcvrz2hLC150yqCSL+5uSJ/o7U6xOO1fO3nOEz5YUrcCplOtL28
         /JQW5UPx8gTq6EleDZ3rZs+uzSmKye9lYV4eYMve7ANb222B/R/unWH3xmlx8VB92Ppr
         Ph26aMV3tYQeQZ4kfcvkub5OkPznJzVmyDUBBGxVXS+DQZSXNx1kbA5LbFY4zGH6FHjo
         SRlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJFZVNUweHyl+jHfg5YB4WGw/yZTn5AB3i0OIzbg4CnTbhTetqdP+Kd7hqRo2LrmTdCYCR1ABk/sNILDY15HqC@lists.infradead.org
X-Gm-Message-State: AOJu0YzatolTRlBJyDCLo3KpIMTskh+mnM/XP7+RVeK8J4CTI7z6I4G1
	0BN+YbJZcqfwXqqY6wTsaxSPwF7E33XJoCbuYGu6++YT7GvX+/zwfUTY
X-Gm-Gg: ATEYQzxPPsPV46gVGko6t+2K0g/jXzc2Hel/8XsWhmHeg9ow2jxHeNHyZg0KhZHHTGP
	wc4Gh9+uUTswbqom9XqkTgmYJRNcsbM9Xhduy1aFcA0ugJB83UwNbcBa4rlQOLKTkz/s1fonL1/
	s6enmDtESbMiMvw7Tmgahk0fRd1FzhdWh2MvnZKnKn10b6P8gjmcHKU+HN2qGVfg55a10IVrWRJ
	dsG3OJpJbm8RcPQxZIkPoIYNXP4r3DH9Fezp7rtJuZZCNXbTfTsGJLL/yuZYOIztLJ7VXKW42fE
	V9HLaCpJny4xkPH/C7RRvTGZZfzK+AVGK3pbT0OQHfys8ESeZVI2mNhOLkDH42rmJvRmSHnytIQ
	L4Nsojz5qJL2Dtjj/s03Cx7GMv3CPb+NQyXUCjkCHzlYjFm+2LRPgEmFYPDQ852ZusyX9sFPddd
	3TsOJcPqF4OhHeZS6NiSM=
X-Received: by 2002:a05:600c:6287:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-48727ef6617mr197260045e9.26.1774859684663;
        Mon, 30 Mar 2026 01:34:44 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:34:44 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 0/9] Add support for mt6392 PMIC
Date: Mon, 30 Mar 2026 09:29:34 +0100
Message-ID: <20260330083429.359819-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013446_875698_B2309798 
X-CRM114-Status: GOOD (  20.69  )
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

The MediaTek mt6392 PMIC is usually found on devices powered by
the mt8516/mt8167 SoC and is yet another mt6323/mt6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

This series only enables four functions: regulators, keys, pinctrl
and RTC.

I added a handful of device tree improvements to fix some dtbs_check
errors, added support for the pinctrl device and addressed the comments
from last year's reviews.

The series has been tested on Xiaomi Mi Smart Clock x04g. In order for
pinctrl to probe successfully patch [1] has to be merged too, but
each patch set is independent from the other.

Changes in v4:
- Dropped usage of the regulator compatible
- Fixed commit messages text to properly reference the target subsystem
- Added supply rails to the regulator
- Reworked the regulator schema and PMIC dtsi. Now all supplies are
  documented and the schema no longer includes voltage information
- Removed redundant ldo- / buck- prefixes
- Renamed the pinfunc header to mediatek,mt6392-pinfunc.h
- Modified the MFD driver to use a simple identifier in the of_match
  data properties

Changes in v3 [2]:
- Added pinctrl device
- Changed mt6397-rtc fallback to mt6323-rtc
- Added schema for regulators
- Fixed checkpatch issues

Changes in v2 [3]:
- Replaced explicit compatibles with fallbacks

[1] https://lore.kernel.org/linux-mediatek/20260317110249.391552-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260317184507.523060-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260306120521.163654-1-l.scorcia@gmail.com/

Fabien Parent (4):
  dt-bindings: mfd: mt6397: Add MT6392 PMIC
  dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
  mfd: mt6397: Add support for MT6392 PMIC
  regulator: Add MediaTek MT6392 regulator

Luca Leonardo Scorcia (3):
  regulator: dt-bindings: Add MediaTek MT6392 PMIC
  dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392 pinctrl
  pinctrl: mediatek: mt6397: Add MediaTek MT6392

Val Packett (2):
  input: keyboard: mtk-pmic-keys: Add MT6392 support
  arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |  11 +-
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
 .../regulator/mediatek,mt6392-regulator.yaml  |  74 +++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  73 +++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 118 +++-
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 +++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 509 ++++++++++++++++++
 .../pinctrl/mediatek,mt6392-pinfunc.h         |  39 ++
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  42 ++
 include/linux/mfd/mt6392/registers.h          | 487 +++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 ++
 19 files changed, 1527 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0


