Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40D8CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kB/u4VLuYTRIxSTjaGgA4kG1SxYpk8i9RP3w3UDvgAY=; b=EWXLfbDj7ctZEvRnuD8wX/XVjI
	qsvY/EDK5pi6DVKGc50E6oSlgmWjqASHudROvvmy9L4GzU2eX3wqZ57n5c+EgW2JLCBgdR1eeqTpl
	I5mFtjr4oc2Eo+pUO2qWk0ZbOWPMBxzCFdTNLHxZ0xyoXSdb9scWDi6oFNBnAYpUMQB8chcR+7AMK
	N3lIS0DRurcN6soxChf0Dbif6k7m3cNdIKE6HFsAkH7i6cxzajdvIs+aLXe5Y7JR27HLigQRKZ81r
	PuHSnbilmTfiOXuvjRAgX8TozE2U4zNEYHK5ifAJNB72uSp71fd7jT+lGiTxrq/uRoiEH30jEUjQ3
	8yeYYiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1av-0000000DlBW-2uFQ;
	Mon, 15 Jun 2026 07:18:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1as-0000000Dl9d-00Zk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:18:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490b613a17bso26008225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507928; x=1782112728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kB/u4VLuYTRIxSTjaGgA4kG1SxYpk8i9RP3w3UDvgAY=;
        b=fXSchhE522EYjimdj2qZZRvK5S9lBLW5aTeBPge+hpJMW/ufdIKazdt2FNNzVKkPT2
         Fpo/FYe50hvFl4a0jkhMmK+lDgnQObwx3ZsiadK7CMRjLKRmoCOy4yQZGDPA2xYtVeqM
         XJY7ZR4gPjo0FjbvzbzAfrgf6ju1fqFusklKpYao8I/LkXyjv0k6OhSXBXkjhZeGqK6k
         ETzuPJI9NhcwMCtwowteYXEmdg6/Z9udne+HEcnKQ5N7d6A60ncf8rzFAbSlp5ojxz8p
         RmjKKrJ2fKmkQfb1ZJdC3eslU7/d7x5S73RgbodJcyQcW1CKf5/EUkLKDYMwOj+5QrLI
         3SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507928; x=1782112728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB/u4VLuYTRIxSTjaGgA4kG1SxYpk8i9RP3w3UDvgAY=;
        b=mGNY5i6b5LWDSdWD/YLs0HeCRcKrpIdPtPekbvoDRv2frvtOaqawsOJJzOL50yIFM9
         qOWDjEBxeLvnZ/+BnRpQuNAfWLVvVFf1DBmWSgv1yfSFZCR1mAohIuOhv57f30QUg6fd
         runukRmZlUJ5XXcBExDPgIoCx4WQmOYn7ChwARgDMLWrk1Mzl7Xc1xH3K6EPMITbj5/E
         BtgoyAUJcrkixcE+9eUd3ZYsTYeVk2byeK6AXSeS6CtA2YXr7/7QmkLfigSXI0fPPKo1
         IIbr1aIKG/94LTQnLLe1UxPO92FUETOS3A1fWCf4YdywrEBNtOXcsPfPtJDQRn+PuBx0
         ZIhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hVWvBOTvXnZ2ewuP5ssPZdd5R4iK5IQP42IM+HhX9yQkSYFhndxalEZI+tO2cGg0+vjqs6TBROa6pER95POTc@lists.infradead.org
X-Gm-Message-State: AOJu0YzVPw/ohAs0+vb/y9YCUWdWueECI+iIGW6IBk7CrHk8OtsNEEP5
	oSrb1eymTFKnxfVPSQFM/no635byzpjaR3VE3R9LL299lRNooWiGHQ7/
X-Gm-Gg: Acq92OF3V3byg2j/bUpaQ9M1U+kWEBjF6RaW6NmQ2HOXo/f31orr+7S5Q0WuPxX869X
	+Jef5oQq3s67PfightdlU93AXAmhpkm5ENL1tHJvs+vfD0wsIA/8JkINfWzHjElVFPjUAPZvhwy
	RT9TPOSZmgv6c1pSkCIgdwZgmrlqEy5gjPPwPt9v3XHqezneNFcsdAE7yAtFhU6kGnpcJssfvY2
	U9a+naQSLD5FpHEtAbUIFipn5I4UwuKhvMKQI0efCvIWgls1elhSCtAaVDuvAYtGJno013bw+S7
	UAe8Rtx6+TlBnLV91KuQrudqYcpn2ROXBOPO1oTUV6LIN5gpb/oMjdAm7fKf6pwaHThJgAjbvvV
	vONrv91HGfZ6ppBv54KT1dlRVnJV6PBa4cgqEfDtpnNN078SSkkQt1JUXq0n8gawQvzwx45JdVP
	ZkQyXQahJw7L3kvy4w
X-Received: by 2002:a05:600c:820c:b0:490:e913:6564 with SMTP id 5b1f17b1804b1-490ec4cc6d8mr166377465e9.3.1781507927328;
        Mon, 15 Jun 2026 00:18:47 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:18:46 -0700 (PDT)
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
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 0/9] Add support for MT6392 PMIC
Date: Mon, 15 Jun 2026 09:16:06 +0200
Message-ID: <20260615071836.362883-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001850_082158_4CED32DF 
X-CRM114-Status: GOOD (  32.93  )
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

The series has been tested on Xiaomi Mi Smart Clock X04G and on the
Lenovo Smart Clock 2 CD-24502F.

Changes in v7:
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
 .../bindings/mfd/mediatek,mt6397.yaml         |   9 +
 .../regulator/mediatek,mt6392-regulator.yaml  | 234 ++++++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  75 ++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 295 ++++---
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 ++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 756 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  43 +
 include/linux/mfd/mt6392/registers.h          | 488 +++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 +
 17 files changed, 1942 insertions(+), 162 deletions(-)
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


