Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390EACD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 20:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YuckR/NZ8exY6f/XTl1lDY68jOPxEhNdZ4x63rZXPCE=; b=kog9ypGdVeveSxwyfzrpIjC+LF
	P43kbpA2LMBXNY3jndOcstOyZn3MDShr65rmHYmZ480wAnVZGjBPoMu6VI51sPWN8eK7OtYdOrCcY
	3UkB3XVh731IdOHlB7iD+oJOw5nz5s7ABN7QR23RNTqOrAwBQLrCqRFkGgglWd+/TdP/n0IpOo/pI
	xy2IgRy7qmaRImMnrBFu+dQNRXNHRPTonIMkvc7OtxzvOLSoXKT/1Mnap3dMUTCNQgCNCSUq+HlNy
	Mo3MW+bATx4A5gNKP4iW6Tp1zLmOLAYdDR7KoT3LW4J42xbMsLxDWQ92RjIVDPb527/vQP+cPd4ME
	wu/PHEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1s2-00000003WZI-47ZS;
	Sat, 20 Jun 2026 20:00:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1rz-00000003WYZ-3oSf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 20:00:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45fe59255beso1586471f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 13:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985644; x=1782590444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YuckR/NZ8exY6f/XTl1lDY68jOPxEhNdZ4x63rZXPCE=;
        b=APbKBBMADlm9XiNud2g+9kRdi3XX9HC/7kMA4VKrX1sNxX4imRHlRhcePc5kqxtML0
         Spa6CduYb922M9PyE5hgMOLkJzLeiVNjbF8D+i/1Iahmo1BPaUAxA9d0BLQX9arcC+RX
         jCn5G7nopl9JKdxbkMncmh+/m09G0AWsZ6krpK9rd1iVDvgBBScElh/8yTjUnYHRyAhK
         ue8p7euUYK767wCFvKbumuUG7VBOiA/xitpJrDmgWzR4azd0FLYlL9mkjlnRZ4giIyNK
         07BGlpFWVRGtVl7mOhtnHV298lvP0QnyUHhriqmh+MnYmgtaf3brFSmmRDTAhLQkhAti
         CmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985644; x=1782590444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuckR/NZ8exY6f/XTl1lDY68jOPxEhNdZ4x63rZXPCE=;
        b=qhnbByz9bWAUA8eIdZbHFn2Qn9nZzgiy0vkgEUaFqSDTk4+kNyHdX1ZWNm6HFPulrs
         /TvxSUC7LyCqYy0tboqmOrQVEkUS4yMsfHY3IUMN/9mLNEoFAhxO+Me6SyGrFCnQ01CG
         rg3MgR2JbzRv9hLok3ZWWDbYdTcmFeqHdXDxzw6j2HFU1OwGRobaMCXxzS0vaPiXnAY0
         uyaJwYbLiOLXaH1mmTReOS3ZTmZU2rDMA2Jo8hldkKCRF3ymJf1Zvm3gWejXkAyh/GrR
         /JGrj6yO3QR72/6+zTCGFzRZydYgh8ERSfsYJ4RTjU3Tz9ZgnMTmNsBVK5b82I9LWMQ/
         wf6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rppc0Hlk7ZxKkTOR3sIduidso32elpyisbVhw5NyMAcPQ7ECnb6SvdOzKOPLrr+wijRH9sQFsB/qaTPkxLMqyXZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwFKS8ZUUmPJXewqoV7mtrxQLZQ+etDl2bITWrwn9RXCrb6RmiT
	qGzUJ/P5I4I0ipUZwXMvTRRUrVt94PoSShNViS3yJlVb5LSZgfVtYQhZ
X-Gm-Gg: AfdE7clNGdGsXt0fRnxrk8L1JFzqM736y3uGN5JvO9XucSzfrgcJYxJlndYjrBG84+e
	Q+RJz+SaxctnpYT78XTVNCbPBVA2qosWM4epih3fuYu16NQaswekx3UA4coSjLIFEcfac7qNw3z
	/7iUcTvqwrJ273ktKDDZSTul+ayhpHODaTpBDWmSuFdi0v8TzSzfCxHPhC5/K+9a0vUiWKA5rMi
	iJ8Mag8+rVFiQR81iLT8g0gVcO+++gg7oT6JIdiuT7WnYfDPdtAKzFzV8KteMRGNZdQC8R0sGQO
	uc2T6geiLZVr8Not0+zhqY6+qw9sPWw9xHvCROJHPUzDEul4Vx9OHvdrOOoxvY1uRpD4rb2NGhV
	YjbVosu9L8JkzgvCT1HTVxCM0IQBylU4S/Addaa1pGD0GkapDQ9YCvgjUuDQuanHOs1j00WzFTc
	qZBOmTrA==
X-Received: by 2002:a05:6000:4902:b0:463:a7e3:9f71 with SMTP id ffacd0b85a97d-4656dd09554mr11611148f8f.15.1781985644072;
        Sat, 20 Jun 2026 13:00:44 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:00:43 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 0/9] Add support for MT6392 PMIC
Date: Sat, 20 Jun 2026 21:56:46 +0200
Message-ID: <20260620200032.334192-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_130047_994557_6BC8D4DF 
X-CRM114-Status: GOOD (  34.76  )
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

These patches enable four functions: keys, regulator, pinctrl and RTC.
Mono speaker amp will follow later as I need to work further on the
audio codec.

I added a handful of device tree improvements to fix some dtbs_check
errors, added support for the pinctrl device and addressed the comments
from last year's reviews.

Please note that patch 0006 and 0008 depend on patch 0005 as they need the
registers.h file, but belong to different driver areas. I'm not sure if
I'm supposed to squash them even if they belong to different driver
areas of if it's fine like this. Any advice is welcome.

Patch 0009 also depends on patch 0003 because of mt6392-regulator.h.

The series has been tested on Xiaomi Mi Smart Clock X04G and on the
Lenovo Smart Clock 2 CD-24502F.

Changes in v8:
From reviewers:
- Added example code to the MFD device binding, removed it from the
  regulators docs.
- Added minItems/maxItems constraints on the regulator mode definitions,
  improved the mode constants.
- Fixed formatting issues in the regulator binding.
- Import the mt6392.dtsi file in pumpkin-common.dtsi, as it was originally
  meant in [8].

From sashiko:
- Added more explicit constraints on the regulator modes definitions.
- Use the appropriate modeget register for LDO regulators, Buck registers
  don't have the corresponding register according to the data sheet.
- Added the missing of_map_mode function.
- Removed some debugging code that had no use and masked error codes.

Changes in v7 [7]:
- Removed patch 0008 dependency on patch 0003.
- Reintroduced the regulator driver. In earlier revisions of this series,
  it was proposed to remove the dedicated compatible for the regulator
  device [3]. The driver does not use actually it, but it is not possible
  at this time to remove it from the bindings since it's a required
  property.

  Making the regulator-required property conditional was NACKed in [5],
  with the suggestion to create a separate binding altogether for devices
  that do not require the compatible property. I tried implementing this,
  but since the parent device needs to be declared as compatible with
  mt6323, it leads to a warning in dt_binding_check since mt6323 would
  be declared as a compatible in both mt6392 and mt6397.

  In the end the only regulator driver from the mt6397 documentation that
  still declares an of_match is mt6397-regulator and it does not seem
  to be necessary, so it should be possible to remove it and make the
  regulator compatible optional for all regulators, but that change would
  probably deserve its own separate patch series.

Changes in v6 [6]:
- Dropped the regulators driver for the moment
- Explained the FCHR key name origin in the commit message
- Introduced the MFD_CELL_* macro in the sub-devices definitions.
  A separate, independent commit introduced MFD_CELL_* to all the
  subdevices in the mt6397-core.c file for consistency
- Replaced of_device_get_match_data with device_get_match_data
- Removed the mfd_match_data enum in favor of the preexisting
  chip_id enum
- Adjusted the error message if the device is unsupported

Changes in v5 [5]:
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
[5] https://lore.kernel.org/linux-mediatek/20260420213529.1645560-1-l.scorcia@gmail.com/
[6] https://lore.kernel.org/linux-mediatek/20260612200717.361018-1-l.scorcia@gmail.com/
[7] https://lore.kernel.org/linux-mediatek/20260615071836.362883-1-l.scorcia@gmail.com/
[8] https://lore.kernel.org/linux-mediatek/20190323211612.860-25-fparent@baylibre.com/

Fabien Parent (3):
  dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
  mfd: mt6397: Add support for MT6392 PMIC
  regulator: Add MediaTek MT6392 regulator

Luca Leonardo Scorcia (4):
  dt-bindings: mfd: mt6397: Add MT6392 PMIC
  regulator: dt-bindings: Add MediaTek MT6392 PMIC
  mfd: mt6397: Use MFD_CELL_* to describe sub-devices
  pinctrl: mediatek: mt6397: Add MediaTek MT6392

Val Packett (2):
  input: keyboard: mtk-pmic-keys: Add MT6392 support
  arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |  74 ++
 .../regulator/mediatek,mt6392-regulator.yaml  | 118 +++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 148 ++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   2 +
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 295 ++++---
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 ++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 764 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 +
 include/linux/mfd/mt6392/core.h               |  43 +
 include/linux/mfd/mt6392/registers.h          | 488 +++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 +
 18 files changed, 1973 insertions(+), 162 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0


