Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6F8F5A8C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yKbbLjMj5a+s95ZY4aMoYwg6sSM5rUeqb55KfE7XVeI=; b=WW+CGsqGFL6B0t7ZQwx8lH+96K
	jov1e8g4W+cCuX9aTNaqoH9G20xFJiHfNum8BiBk7IoqLJXqTf1rgJHgWe1we1jHXY0EToURsm48t
	S6u0K1VBWZOD6gk1hrLh+1opScXGybUtlCfieFO8w6ygWO/ND+Cx33HZk62QIHCAU6MDWjlBI1r7Z
	05nk8RBsRhdCdM1eY/VnAB+QIqFe/cC2mmHHwK1DAI2l/35Jo0FOy9vQ6xAZp5I4mS98AjOMKdCuO
	FOxQ/8Pt6byHzhSEqg6lvk1z7YHIdrmX+COirUety33+Tj1VKlfj20AuJHuPn3laH6y8pFvW84qAK
	vrgadr6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwKb-00000007kNM-0AMI;
	Mon, 20 Apr 2026 21:39:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwKa-00000007kMM-0HmS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yKbbLjMj5a+s95ZY4aMoYwg6sSM5rUeqb55KfE7XVeI=; b=Uemb7CuxD+twPE7oHGIDrWyQO4
	Jxna53TRMFYQ2zqQ2vuw1wIewJzPssQc990RZFYpsVhmFp7EHa5zujHfdTnDvr3SWc3W6qtb9474g
	MTEyY9JpcdP96Yqn5aRiDYjc5xITB9iTx8xXjMwt5UE64zj9KivyIGXK9NAHAgdyTFLwM60jkF24Q
	PEEAMPxFqo/GgEzl/9CB+X8ofjhL8+Tv4OaYnIxdXxA36Vx0Y5Vzy/xFawb2dtcJnB3N+g3HewPOO
	mYACuwlPhw4oTRTAeGiBghJTUmJtIhyoYfEWAhZvxAkBdWC91D6KKn9rwhjTKCXqePvE03xGk9QvL
	qpMduS9g==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwHq-00000008rXz-03td
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:38:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso27243875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776720967; x=1777325767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yKbbLjMj5a+s95ZY4aMoYwg6sSM5rUeqb55KfE7XVeI=;
        b=I5Bc0Andt8B5yb8aCa8ojXuhq9KgL4PwoxokkL+x5lfLilBhd7mdaxS+5OGMOpvvjh
         b0KpmkPSW9QbLPHcBKR/x4rdR90ecMwfri97SI5kbjV6aaFzUqzJ+7wi6/VaXATeqnhQ
         r3bUBcdIw2jUyU9PHbzNk0HXbdFe08RK5CMhwORQMWXLZyEyPM8Ax1enGmWt5CIyDNHT
         6C4uphXSVfUKlXOZNVzoLcNhkWv1zFFOk3hs7PkTdvwo34WlHzgkVB72liIUyqw1o7BG
         6b2WVxH/RuhkxFcfAUB8ObhYUuIeEK75ZYHolLCa2JH5m+wcfOS7pClxJ/CwXay7lQlI
         z7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720967; x=1777325767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKbbLjMj5a+s95ZY4aMoYwg6sSM5rUeqb55KfE7XVeI=;
        b=RLr4qMIqkFaOxnMZiJreTh7pp2vzaOr/KVALwnaRl50l/pZf937c/4SPeUyMQPSUq0
         DstOolssd49J4nIAhvBgc7UZhj9qD0veFTLNnbbppExWqNbzxA3POzRjkompT2t+od7A
         hIABjoZty1ImrzuvUeekMrv8qQA8a9e24fBipc1tPXyghJXlUPBTi5Z7qs05TP/XWShM
         Xq/mWuRzJYju7VuPXvPPJ/JC5WpkWJlyKkJh5gOLH+rMuXSK/OOCEfVggfhW22I7p0mn
         dBPZM5b35OhG0uIqGjwBajQ3Kkn7yFhWZwbSUeIvr9I1k04iRpT/WVCDga1VUdBdYgnM
         NQ3g==
X-Forwarded-Encrypted: i=1; AFNElJ+GAOPe7AUUk1bSF2CLnoK8douFmwkMv7lufSS3H1L0ekrm64OMf3hW9d7H+NPREsa/cPKULd4sQ7RI0OfKrDyU@lists.infradead.org
X-Gm-Message-State: AOJu0YxBJV0f85whM720kjhkbPZc+l/lY4aZudb2gX9QGcn1WfHapg1e
	Wx4qeMI8t17rih9IEOM/pH/rVKPZW3ghk60w5KmDaLZzKmCwVbJIWSqu
X-Gm-Gg: AeBDievZ9xyNONdW93MNIM+Cx8RwDgtzy5qTE2aPiQDnb+0Sd9rDCvvN0S1BEIhrwxx
	OVqcGepcaBJdOUtzdZn03D1pRc4iyFsjPBe4blYzRJhtpc325Y1uYfCyhFqdZD0jAet52UBKGcq
	mxqYf5co8+LSbFvzTM0/5YqOuzpWfNtMncr/dE2g/OREL1SW6IQrtSi4Xx5LiRPEm2jZgPDV2Ll
	Xbk2yfOz0vaygvvzq5V9lJJND8HGsalEhT/Q03YLzFdrKBhbzWprRWXt/pKBrnOyy1uwUB8ctXE
	jnwydoWQ01sP6h/yUB85bozEXL7WVHbhrf+MtWvmBsdD8/S320adXRQ0F72OuGQ1U8yXLwM6Rg1
	2rUbV2AA0vckxK7xrz4ptDP+jvUZeQzTR6hceEo+BHPEVekVXlOr02UEg4b/JaTHzQefiREUSKY
	lNpBLvF8Kbe47k+K4sCYkfW8Y95yGSmw==
X-Received: by 2002:a05:600c:34c3:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-488fb792dd0mr216654415e9.23.1776720966527;
        Mon, 20 Apr 2026 14:36:06 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:36:06 -0700 (PDT)
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
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 0/9] Add support for MT6392 PMIC
Date: Mon, 20 Apr 2026 22:29:59 +0100
Message-ID: <20260420213529.1645560-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_223726_180299_0F82DBB0 
X-CRM114-Status: GOOD (  20.40  )
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

The MediaTek MT6392 PMIC is usually found on devices powered by
the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

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

The series has been tested on Xiaomi Mi Smart Clock X04G.

Changes in v5:
- Double checked regulator driver with data sheet and Android sources.
  The data sheet I have misses a lot of register descriptions, but
  Android sources have been helpful to fill the gaps
- Reintroduced the required attribute for the regulator compatible
  in the bindings
- Fixed the missing reference to the MT6392 schema
- Fixed casts/unused vars reported by kernel test robot
- Removed Reviewed-by tags from the regulator patches as they have been
  modified in this version

Changes in v4 [4]:
- Dropped usage of the regulator compatible
- Fixed commit messages text to properly reference the target subsystem
- Added supply rails to the regulator
- Reworked the regulator schema and PMIC dtsi. Now all supplies are
  documented and the schema no longer includes voltage information
- Removed redundant ldo- / buck- prefixes
- Renamed the pinfunc header to mediatek,mt6392-pinfunc.h
- Modified the MFD driver to use a simple identifier in the of_match
  data properties

Changes in v3 [3]:
- Added pinctrl device
- Changed mt6397-rtc fallback to mt6323-rtc
- Added schema for regulators
- Fixed checkpatch issues

Changes in v2 [2]:
- Replaced explicit compatibles with fallbacks

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/cover.1771865014.git.l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260306120521.163654-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260317184507.523060-1-l.scorcia@gmail.com/
[4] https://lore.kernel.org/linux-mediatek/20260330083429.359819-1-l.scorcia@gmail.com/

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
 .../bindings/mfd/mediatek,mt6397.yaml         |  27 +-
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
 .../regulator/mediatek,mt6392-regulator.yaml  |  76 ++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  73 ++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 118 ++-
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 ++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 740 ++++++++++++++++++
 .../pinctrl/mediatek,mt6392-pinfunc.h         |  39 +
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  42 +
 include/linux/mfd/mt6392/registers.h          | 487 ++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 +
 19 files changed, 1776 insertions(+), 31 deletions(-)
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


