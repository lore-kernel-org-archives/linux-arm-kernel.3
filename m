Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0BACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iblNyH9RQUiqFDYiroesQvDFASi4C4PHJ77i3ovtxEg=; b=UYnhfU4ErvkhKar/NhMhRhNwVY
	8/kA7/trrmNcI3flfFgBOQTyj0Gdwz8G1HYFq8wHLc9pGSn4nhj0XwDCOxELEftvoZVzAt+GEpUqG
	CYSV/W77hXKNansvDgImhX1Y5giJ017i8FrRZIkRqoiVHEFdmPezSj/H7wj0zyaJs+IfJUGLE/T+c
	Rd5U4tcVFdH+56a2fKCtAoEV5eAA9Lo2xd3n3aCgHog6gzaEEBq9Tx4+xaCc8wt11UZ02e3oR/Goj
	Q2i9d6H0p+pcT6sf2xbtpoU48CKpAvG6sZQXZuxbErATKyUV2piPdBT8k+c2fV7kqJldXRi5CgGaf
	z7BFQWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CLN-00000002OIn-0Mya;
	Mon, 29 Sep 2025 11:47:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CLK-00000002OIA-3Ka6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:47:00 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5434110e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759146417; x=1759751217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iblNyH9RQUiqFDYiroesQvDFASi4C4PHJ77i3ovtxEg=;
        b=slEGA91ndjU6T1T7MI230XCYqDGdsUgkSApKeI69BRESSc9MB341oZmTXUKkGIqVRv
         eSz1ALNCM+QuYjluzAtFOEoCw4HNRFqxFc2jOqVQ0e6wJen8e/rAp8Bi0E2+lVAXKGqB
         saFzo5LedhcsLFg3kwG9Ox0ua+92ytNOSSFGsD8sRGC+DJ/rJeV7kyyvUDNgilR7t93x
         W4uwHE3y4zSCR4Povj6H2vAwM3WXp9vBcyKHt5pc3c0jDu4JSYmBrZEHxj5utPOBwD2U
         IgAawMdv8kb3tk23ODWl38t8QEr30ZAh9ytFgc/jRl3xtBpU6J2iywrfwqAM8uMmXGlx
         VhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146417; x=1759751217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iblNyH9RQUiqFDYiroesQvDFASi4C4PHJ77i3ovtxEg=;
        b=br4Z8wWlEqAnbopjl6qpsf0sHuPArPpXadhPlXX+KbPjHLEEZ5+LutTbfcJQ5ardVR
         522xNB7wgT9kjTGasKbckeC7qBbcUZRMSkDLI/TOMhFgZHh/obgCS1dJF4P/McMQsbc+
         UYdIQH1WxuWj1+xDKOrfTopU1i22EmTNZ+qYH3Ub0Z64You+kknI8rsRHsiAQO1OK9mn
         fNcZHivZYPiF/A2Tr7uEtAfWhiX2lXIdVXHN89wU8QD6hRdd4XEncM9b6Kr/+y31Ou/z
         w1PLVpoN0qFv982dNcmJ4wnDIs7bMsPwr4RsWxwwP5jAGIsf7gqHrtK8IwGtNhEHLcon
         ZvyA==
X-Forwarded-Encrypted: i=1; AJvYcCVi08F0g75z8mVKXJJjPtk67ryUhAqjA8Nklg0bNakYH5ijpdpMgSdFgyD5KFkuv5A42E2zv34r5hlMOmwPXdsb@lists.infradead.org
X-Gm-Message-State: AOJu0YwkSEK01kXDuI8K0+MAf2IRlmRxnnaITqBbqi+1+vLk6pI0IewM
	Y0ahxWZjAP5r9I7A4OK994N8cfXV7SSpYVIpnIGqv+ist8a8KYLJDoMB4iJbL+8IcjaBGsm1Uhr
	GuCtI
X-Gm-Gg: ASbGncvAq4MM1BNZ/5QFGKyraQupSL+KWrclB5jExFv+Sly/IOph5H53KPEK+JLqeR8
	5ImgDX6kPBaIy2pGIvqmLphYiFwpu4LUNHNLGUVmc+4cC8lmIWlo++6b/Ug+QS9p9LFjjV81vCd
	84yfrCDZiPE8qK5BIDmeuP/fggL55hBWP2VPq554X7GJbBsrwza9/kHRgVSK59nh8bkQse+YPaL
	PxjI3QhUnmmUEJtNm7I5XsGe1qF3NOULvAOxT//jyrFrNY+bsyDi2ohmsSsips+RX7oIGRha/MJ
	KGEZIkzSHJK1FMt6cQWhail74PFHog3RwjwP7R438KiqJMIrIsgJTRxRD3vnqNv6zYzrRX7zW5I
	68E0sMTLq45HhotuBEAdpa1oeQAytxd9ljOmnnDhT6L6DCnHaWEtslSX3GeA0ikoM8K8GJQ+j
X-Google-Smtp-Source: AGHT+IH1tc5UyrowpjgG09PaeQoeg5mBDgVtgXBs7JIEjr1VUn4l35hQOfbuJl6g30wFsygaWJEMsA==
X-Received: by 2002:a05:6512:130b:b0:581:d8:a922 with SMTP id 2adb3069b0e04-582d406cfdamr5131282e87.50.1759146416675;
        Mon, 29 Sep 2025 04:46:56 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316656353sm4117319e87.88.2025.09.29.04.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:46:56 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain updates for v6.18
Date: Mon, 29 Sep 2025 13:46:35 +0200
Message-ID: <20250929114655.226466-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_044658_883661_3DC28F6C 
X-CRM114-Status: GOOD (  16.21  )
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

Hi Linus,

Here's the pull-request with pmdomain updates for v6.18.
More details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 5fc4ab3269dea6a0b00c7256cb6f6c0101b6a44b:

  pmdomain: mediatek: set default off flag for MT8195 AUDIO power domain (2025-09-23 16:33:34 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.18

for you to fetch changes up to bbc3110823eca23b066e75a920bdc8118adda0d2:

  pmdomain: thead: Fix error pointer vs NULL bug in th1520_pd_reboot_init() (2025-09-26 14:50:20 +0200)

----------------------------------------------------------------
pmdomain providers:
 - amlogic: Add support for S6/S7/S7D power-domains controller
 - imx: Add support for i.MX91 power-domains
 - marvell: Add support for PXA1908 power-domains
 - mediatek: Add support for modem power sequence
 - mediatek: Add support for RTFF Hardware in MT8196/MT6991
 - qcom: Align power-domain definitions for rpmpd
 - rockchip: Default to use power-domain support
 - thead: Create auxiliary device along with a corresponding reset driver
 - ti: Synchronize on/off state with HW-state for ti-sci power-domains

----------------------------------------------------------------
AngeloGioacchino Del Regno (7):
      dt-bindings: power: mediatek: Document access-controllers property
      pmdomain: mediatek: Refactor bus protection regmaps retrieval
      pmdomain: mediatek: Handle SoCs with inverted SRAM power-down bits
      pmdomain: mediatek: Move ctl sequences out of power_on/off functions
      pmdomain: mediatek: Add support for modem power sequences
      pmdomain: mediatek: Add support for RTFF Hardware in MT8196/MT6991
      pmdomain: mediatek: Convert all SoCs to new style regmap retrieval

Brian Masney (1):
      pmdomain: mediatek: airoha: convert from round_rate() to determine_rate()

Dan Carpenter (1):
      pmdomain: thead: Fix error pointer vs NULL bug in th1520_pd_reboot_init()

Dmitry Baryshkov (4):
      dt-bindings: power: qcom-rpmpd: split RPMh domains definitions
      dt-bindings: power: qcom-rpmpd: sort out entries
      dt-bindings: power: qcom-rpmpd: add generic bindings for RPM power domains
      pmdomain: qcom: rpmpd: switch to RPMPD_* indices

Duje Mihanović (2):
      dt-bindings: clock: marvell,pxa1908: Add syscon compatible to apmu
      pmdomain: marvell: Add PXA1908 power domains

Icenowy Zheng (2):
      driver: reset: th1520-aon: add driver for poweroff/reboot via AON FW
      pmdomain: thead: create auxiliary device for rebooting

Joy Zou (3):
      dt-bindings: soc: imx-blk-ctrl: add i.MX91 blk-ctrl compatible
      pmdomain: imx93-blk-ctrl: use ARRAY_SIZE() instead of hardcode number
      pmdomain: imx93-blk-ctrl: mask DSI and PXP PD domain register on i.MX91

Mikko Rapeli (1):
      pmdomain: rockchip: enable ROCKCHIP_PM_DOMAINS with ARCH_ROCKCHIP

Tomi Valkeinen (1):
      pmdomain: ti-sci: Set PD on/off state according to the HW state

Ulf Hansson (7):
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next

Wolfram Sang (1):
      pmdomain: remove unneeded 'fast_io' parameter in regmap_config

hongyu.chen1 (2):
      dt-bindings: power: add Amlogic S6 S7 S7D power domains
      pmdomain: amlogic: Add support for S6 S7 S7D power domains controller

 .../devicetree/bindings/clock/marvell,pxa1908.yaml |  30 +-
 .../bindings/power/amlogic,meson-sec-pwrc.yaml     |   3 +
 .../bindings/power/mediatek,power-controller.yaml  |  37 ++
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |  59 ++-
 MAINTAINERS                                        |   3 +
 drivers/pmdomain/Kconfig                           |   1 +
 drivers/pmdomain/Makefile                          |   1 +
 drivers/pmdomain/amlogic/meson-secure-pwrc.c       |  95 +++++
 drivers/pmdomain/imx/gpc.c                         |   1 -
 drivers/pmdomain/imx/imx93-blk-ctrl.c              |  23 +-
 drivers/pmdomain/marvell/Kconfig                   |  18 +
 drivers/pmdomain/marvell/Makefile                  |   3 +
 .../pmdomain/marvell/pxa1908-power-controller.c    | 274 ++++++++++++++
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c    |   8 +-
 drivers/pmdomain/mediatek/mt6795-pm-domains.h      |   5 +
 drivers/pmdomain/mediatek/mt8167-pm-domains.h      |   5 +
 drivers/pmdomain/mediatek/mt8173-pm-domains.h      |   5 +
 drivers/pmdomain/mediatek/mt8183-pm-domains.h      |   5 +
 drivers/pmdomain/mediatek/mt8186-pm-domains.h      |   5 +
 drivers/pmdomain/mediatek/mt8188-pm-domains.h      |   6 +
 drivers/pmdomain/mediatek/mt8192-pm-domains.h      |   5 +
 drivers/pmdomain/mediatek/mt8195-pm-domains.h      |   5 +
 drivers/pmdomain/mediatek/mt8365-pm-domains.h      |  14 +-
 drivers/pmdomain/mediatek/mtk-pm-domains.c         | 399 +++++++++++++++++----
 drivers/pmdomain/mediatek/mtk-pm-domains.h         |  74 +++-
 drivers/pmdomain/qcom/rpmpd.c                      | 112 +++---
 drivers/pmdomain/rockchip/Kconfig                  |   1 +
 drivers/pmdomain/thead/th1520-pm-domains.c         |  16 +
 drivers/pmdomain/ti/ti_sci_pm_domains.c            |  24 +-
 drivers/power/reset/Kconfig                        |   7 +
 drivers/power/reset/Makefile                       |   1 +
 drivers/power/reset/th1520-aon-reboot.c            |  98 +++++
 include/dt-bindings/power/amlogic,s6-pwrc.h        |  29 ++
 include/dt-bindings/power/amlogic,s7-pwrc.h        |  20 ++
 include/dt-bindings/power/amlogic,s7d-pwrc.h       |  27 ++
 include/dt-bindings/power/marvell,pxa1908-power.h  |  17 +
 include/dt-bindings/power/qcom,rpmhpd.h            | 233 ++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h             | 391 +++++---------------
 38 files changed, 1592 insertions(+), 468 deletions(-)
 create mode 100644 drivers/pmdomain/marvell/Kconfig
 create mode 100644 drivers/pmdomain/marvell/Makefile
 create mode 100644 drivers/pmdomain/marvell/pxa1908-power-controller.c
 create mode 100644 drivers/power/reset/th1520-aon-reboot.c
 create mode 100644 include/dt-bindings/power/amlogic,s6-pwrc.h
 create mode 100644 include/dt-bindings/power/amlogic,s7-pwrc.h
 create mode 100644 include/dt-bindings/power/amlogic,s7d-pwrc.h
 create mode 100644 include/dt-bindings/power/marvell,pxa1908-power.h

