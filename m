Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB94C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gNSsiXJWRtJEnKo3j2+KbnfQcpFMSwgfHd0NV7zL7z0=; b=e4m2NIUAoehUsfghXvociIOy+6
	3dw6gFfCbDp9HAJBxBnQN8wnqMpeturFJw0ButVkMLfzGUx+vjRWug1OTxa0mJpn5QS/Rc1SeZibQ
	xjmWkE0KmxB8vNHYkVKdsy1FYla+YvJOHz/itURaInwyV4tuUmzHb2NL0sYkoaD7QKK37IZhuLGYe
	gQ4rF+iNuRbDL5sy1R3q1I8OCNHJFv6YpRtZ2kRBXUNNihKJWFlfXoTdYu3TCjNu5XkcQp+vd8PtJ
	mX7/JDAofcmjkb2S04CADITHlofYmFgT5sljmK3z08Squ/kyu1vYk2vBJT7sw4JrEbM5NeZsBFFcr
	ZoQbHV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63I-0000000ATAL-1a1l;
	Sun, 09 Aug 2026 16:07:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63F-0000000AT8s-1I2X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so5370695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291623; x=1786896423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gNSsiXJWRtJEnKo3j2+KbnfQcpFMSwgfHd0NV7zL7z0=;
        b=e9fLmvOEteSauRkvpadqQrEzcWVsRx/T+svACRkcEFiFMF4xPDMZ5BnLu9tS18YsDq
         vw3yzrJwJmKcotIpuJnkVGGk1dgNVhfHxq5vRpJdceYNR9DmrTArlH9CKPTYCq/XFDX5
         muF5naWBaTjbsrlSaHV/myd/WxklabXS2fbRV9plspC0GpyQLx48bMd0wdyH6uDzHrEZ
         AEPU87kVYCv7U4WFvqKK/aZP7QIKwQItkG8jXA736Hyjke5+VwToPdjiEeH1/1tTNQx1
         i5Awh+/N2gjqIhw2L6oPTocXc0zgmea5q+2GE2lsKW7YiQ2VNoSBvpmBdgVYTZ+f+q65
         CqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291623; x=1786896423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNSsiXJWRtJEnKo3j2+KbnfQcpFMSwgfHd0NV7zL7z0=;
        b=LU+D5I9vsOkV20mWsRC2h+LPGdk+8pKEzqbJs8UDUV0oroZKn/i1v0EzF/FeUhHvxC
         dwFniAnI8buDvS8N/y7f/4BeszTZzmBmSxY/JE1ZCjFGhi7uVraTUAbaIgCISsb+IW1j
         76AFNnd5HhlEzjzv3o+gX9O0/oIHfcYihvHUllLKQz6Uwuga7kO784BFqN4DiBCY+cff
         ZOmAtnhBKs3rs1TZ6e2VhIDBsPZVYJCTWBijaERDNDL70xwL4A+4htdX4y1H1CPDgplt
         O2Gn0fjVt2aj3dIQHxNVnFPURuuULzYOnUWAnXnHNv7pnGdpxE5l2mtFNC74ON5HaSKy
         ErSg==
X-Forwarded-Encrypted: i=1; AHgh+RqPHhjWAYiwU4o1Qc5ycTNh1Hycq3Fdt29gVD3qStuerFnAdQEaeV79bxtlNgyamN2VO+2azkUNjEJlvJUIE0ra@lists.infradead.org
X-Gm-Message-State: AOJu0YxHd4ZGtvG+57U1c/NxdYr5mzLaV31Vzl+JUXytozVVA4Mxaghg
	iAWFY1b885AAUkeKq26s+m+EAa2JicCy8AWipQkOiNHCjHghQgrVISe5
X-Gm-Gg: AR+sD10NQ6o5/ZvQsLQ5ncndCu+cjhmPJq9K6N8snwpsqHiJgFYqKq61sWjISl7Ehqq
	QOagKwG+DRoDMawxsa424d3j25qR6uFJyJfHYvEQ5TeXeOoJzmzLDU5oR14e/aTXYOEmFpHx4fp
	iVapv5biQp2sdebiWgsAl5JhVY6SzfmsVdS6E5D0vvptLlCIEOf6aq58+vEUf4Siqgk3PL2bzwt
	O/jHe9yDpMBj58evzeKz6I9eIfUV3rF81ECMJvMkDsaYZwJd4OLZQy80ppfUB0B/mpEyuHnRper
	ea3lv4LhVKKUcea3jNO14j95lEmT7JuUGatPMzikL0L4lzjNvuTCHUwSc+rY/+bMLDpnlmPITba
	HLtWB2XtPinztitkkd296tXQlkRfCN7r6SVI11n4ZKQUwPdPwcytQoIbMGHXeHsCMb27qJkn2ju
	nJstzhdquZ8fv/OFy+/z3X6IwW6Ua5zp0pqaRtGluFATEIK6hmrZHD5A==
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr196750445e9.7.1786291622542;
        Sun, 09 Aug 2026 09:07:02 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:02 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/8] Properly describe mt6589 and mt8167 toprgu resets
Date: Sun,  9 Aug 2026 18:03:24 +0200
Message-ID: <20260809160643.33991-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090705_389077_156BF8A8 
X-CRM114-Status: GOOD (  19.38  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt, which does not support toprgu
resets yet. This series adds support for mt6589 toprgu resets with bit
definitions obtained from Android stock sources.

However, according to its data sheet, mt8167 has 15 sw resets instead of
12, and its reset bits point to different subsystems than the mt6589 ones.
If the number of resets varies between SoCs, the watchdog driver becomes
incompatible.

Therefore in the first three patches we improve the description of the,
resets for mt6589 using the definitions obtained from Android sources.

Then we introduce a dedicated mediatek,mt8167-wdt compatible for the
watchdog driver that describes correctly this SoC's resets. Also while
we're touching the bindings reset header, we add constants for the MMSYS
resets.

In the 7th patch we add a node for the mt8167 watchdog referring to the
new compatible in the SoC dtsi.

In the last patch, we define the mmsys reset table for the SoC. According
to the datasheet, there are 28 mmsys reset bits divided across two
adjacent registers.

Changes in v3 [3]:
- Improved explanations in the commit messages;
- Added the #reset-cells property to mt6589 watchdog node;
- Included the mediatek,mt6589-resets.h file in mt6589.dtsi;
- Included the mediatek,mt8167-resets.h file in mt8167.dtsi;
- Moved the mmsys reset table from the mt8167-mmsys.h header file to
  the mmsys driver implementation.

Changes in v2 [2]:
- Sashiko pointed out correctly a missing entry in the mmsys reset table
  in the last patch.

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260717163959.714561-1-l.scorcia@gmail.com/

Luca Leonardo Scorcia (8):
  dt-bindings: reset: Add mt6589 toprgu reset IDs
  watchdog: mediatek: Add wdt/toprgu resets for MT6589
  arm: dts: mediatek: mt6589: Enable toprgu reset controller
  dt-bindings: watchdog: Add compatible for MediaTek mt8167
  dt-bindings: reset: Add reset controller constants for mt8167
  watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
  arm64: dts: mt8167: Properly describe the SoC watchdog
  soc: mediatek: mtk-mmsys: Add resets for mt8167

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm/boot/dts/mediatek/mt6589.dtsi        |  2 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  8 +++
 drivers/soc/mediatek/mt8167-mmsys.h           |  3 ++
 drivers/soc/mediatek/mtk-mmsys.c              | 38 +++++++++++++
 drivers/watchdog/mtk_wdt.c                    | 13 ++++-
 .../reset/mediatek,mt6589-resets.h            | 24 +++++++++
 .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
 8 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h

-- 
2.43.0


