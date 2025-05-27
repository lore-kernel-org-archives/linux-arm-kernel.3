Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7744AC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9vKSPPco8uaYslgb3qMpB6uZMQh78r5qUBilSeR1pXE=; b=G42vXiiCkhc4mMcfNRg6fPKx2b
	pvP+0zL08SEzE0zIlj0GU1i1uGi7AoRpVs4X1X6QSshGbc+UCEn0f90742dSGT0CTiymlqGr29k4D
	tzEGVfzeN4hjOD9hTH6t3gSuzCMAU74AAmElVkgb0xHJaNyu/5Xc3InIMtPmZwZSfNPR9Bvulpvyp
	nFg+2J0jSEjntHh9rcNu6STEat7YrB9smWmIwdeeUDONTLSWI8C8XUj+hSUN6uptZtYvKiB9Nh5IC
	/Qi2OsmzN1bUbuNHATPO2rYN1RIk5j2Kjy8yLR0HvxyqG5ASwps5fwD2nMNOT/FFvGu/Qe5XLUAzm
	z4Zud4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJruM-0000000AVL6-3AYJ;
	Tue, 27 May 2025 10:51:46 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrrg-0000000AUnH-1jok
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 10:49:01 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30db1bc464dso31355161fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 03:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748342938; x=1748947738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vKSPPco8uaYslgb3qMpB6uZMQh78r5qUBilSeR1pXE=;
        b=tF7xt+dWaFWH2wny56sjXlKWYBJTuNoqWSfEwhsHMAAYegUzdxSQpJqzYEUQGc5DlJ
         1hegZZvKspfaLdlFBhHjZ23aqiFJhuTD27GQnvv1cEQve/ETOPSU3hqNV/gd24DRkAdz
         TU0NOx0ZIBnPxbQ4V0ji4bz7+V+gvYbfGsUR79xpkME9f5Iar9c0iQuQjSschEIyEEZG
         VXNmQBF7HYV4orffVWs/gEyV5+3LdsaZ8K7SdJQVLPZxSfE7msal+oFyvOt5SLAqeCqr
         k1xMu1HpkSxQG98v9Or6c9hnP5owTcqhOc50CsDa5G+06HMDr7ele6QDMocxqFwHLC4J
         9QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748342938; x=1748947738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vKSPPco8uaYslgb3qMpB6uZMQh78r5qUBilSeR1pXE=;
        b=uzeudjWCqkcZGVtfqJW//w04Ih3z2+XmUohpep5uRM9J9Up13LeP+cOOKEGeDTCXwO
         +MkOL9LfOZFAhX5ksYi3yxwXBluQBIul/iYkYYVyCsx5dffTB6Q4Lqsj8RzIJODh7cNf
         VM4OoApKP6PIJOX1UFh1MFiJK3TszKEZfppggfo+RkFv4QaS/UnSpJ11mJomiMnLQ+kv
         VZzhkZuRxDffkL5UdA6yckYnP6f3oBIRfiLv0r1/p/Zry0A9j3CQrMxMyv8M+6gG+o+o
         CfHk3aC3UgyXZqdNRjXcFQjmF5Vr9O0uutSmluVUpLl6/WrOGimfEb75mg5t0MqTPA/D
         fLwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT3inOBSdz3ItugZiM1LjCKkCHfVimHtrnmco1g+RptmddviActXDzkkX/axgHdSrZ1vYaiFSG1+i/qV53P6WM@lists.infradead.org
X-Gm-Message-State: AOJu0YxHNHkpcikFhJALNpl+NMVTyu+i9tYxeSYnQt9P04Wi9km1ATEN
	VPk4OivtfIA2EYatvU625mJsD8rmxNHXKt/kp7J9Qbmm5rE0ncaMpVAY7a1ghSBbFRo=
X-Gm-Gg: ASbGncuVOanO3ee/NMZehXtRQ23lYANIMKxxwMKqfJqK+3wCfHybCVQyhLH3MKy6r3y
	8Gbcrkfe70wISjgrH2+jd3BEMGGW7yGxs2q35gOyZW13cFoUQ7BmShWa/aiw21ZnPd1L2au8ADc
	OO+4zvR0WlU0kxnK4F3USWkYlroUKDEWN1FcUKYwVjSmh/cHO+7WRj+qiOjkkI6Bmoj/G5p4xdd
	56dCsiUiui2nTTIsbqshWTYN9pY7x1uCWzD7Mi8XwYHnfksrynHSjMm5NLGkUwDRnHVkzlW+zWY
	MPRaqcSVhvol+Onmfs4b4dX1tSXoeCt8SCkYo8brzdBwGL3qgWHCYN02oJtPtc7c5iaLKFXbxfn
	+2VC3Jei7kWEnepdeK5e1qlbCkg==
X-Google-Smtp-Source: AGHT+IE9g01utC6Y6xeS//vjJ++/Yn75a8WpLtE+4tobVTnoaHBMkS9DP3t1Hn0PzpUeqXgyM5sSjw==
X-Received: by 2002:a05:651c:146d:b0:30b:b7c3:949a with SMTP id 38308e7fff4ca-3295b9f26cfmr30739661fa.18.1748342938112;
        Tue, 27 May 2025 03:48:58 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6cf9c68dsm2674441fa.58.2025.05.27.03.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 03:48:57 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/cpuidle-psci updates for v6.16
Date: Tue, 27 May 2025 12:48:56 +0200
Message-ID: <20250527104856.206797-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_034900_471414_43A4B9F6 
X-CRM114-Status: GOOD (  15.67  )
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

Here's the pull-request with pmdomain and cpuidle-psci updates for v6.16.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 0f5757667ec0aaf2456c3b76fcf0c6c3ea3591fe:

  pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id() (2025-05-08 13:29:30 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.16

for you to fetch changes up to 36795548dcc841c73f03793ed6cf741a88130922:

  pmdomain: ti: Fix STANDBY handling of PER power domain (2025-05-19 16:11:05 +0200)

----------------------------------------------------------------
pmdomain core:
 - Add residency reflection for domain-idlestates to debugfs
 - Add genpd helper to correct the usage/rejected counters

pmdomain providers:
 - mediatek: Add support for Dimensity 1200 MT6893
 - qcom: Add support for SM4450 power domains
 - rockchip: Add support for RK3562 SoC
 - sunxi: Add support for Allwinner H6/H616 PRCM PPU
 - ti: Fix STANDBY handling of OMAP2+ PER power domain

cpuidle-psci:
 - Correct the domain-idlestate statistics in debugfs

----------------------------------------------------------------
Ajit Pandey (2):
      dt-bindings: power: qcom,rpmpd: Add SM4450 compatible
      pmdomain: qcom: rpmhpd: Add SM4450 power domains

Andre Przywara (2):
      dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
      pmdomain: sunxi: add H6 PRCM PPU driver

AngeloGioacchino Del Regno (3):
      dt-bindings: power: mediatek: Support Dimensity 1200 MT6893 MTCMOS
      pmdomain: mediatek: Bump maximum bus protect data array elements
      pmdomain: mediatek: Add support for Dimensity 1200 MT6893

Chen-Yu Tsai (1):
      pmdomain: mediatek: Add error messages for missing regmaps

Christophe JAILLET (1):
      pmdomain: amlogic: Constify some structures

Finley Xiao (2):
      dt-bindings: power: rockchip: Add support for RK3562 SoC
      pmdomain: rockchip: Add support for RK3562 SoC

Krzysztof Kozlowski (1):
      pmdomain: arm: Do not enable by default during compile testing

Stefan Wahren (1):
      pmdomain: bcm: bcm2835-power: Use devm_clk_get_optional

Sukrut Bellary (1):
      pmdomain: ti: Fix STANDBY handling of PER power domain

Ulf Hansson (15):
      pmdomain: core: Add genpd helper to correct the usage/rejected counters
      cpuidle: psci: Move the per CPU variable domain_state to a struct
      cpuidle: psci: Correct the domain-idlestate statistics in debugfs
      pmdomain: core: Add residency reflection for domain-idlestates to debugfs
      pmdomain: core: Reset genpd->states to avoid freeing invalid data
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next
      pmdomain: core: Convert to device_awake_path()
      pmdomain: Merge branch fixes into next
      pmdomain: core: Convert genpd_power_off() to void
      pmdomain: core: Simplify return statement in genpd_power_off()
      pmdomain: core: Use genpd->opp_table to simplify error/remove path
      pmdomain: Merge branch fixes into next

 .../power/allwinner,sun50i-h6-prcm-ppu.yaml        |  42 ++
 .../bindings/power/mediatek,power-controller.yaml  |   2 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 .../bindings/power/rockchip,power-controller.yaml  |   1 +
 drivers/cpuidle/cpuidle-psci-domain.c              |   2 +-
 drivers/cpuidle/cpuidle-psci.c                     |  40 +-
 drivers/cpuidle/cpuidle-psci.h                     |   4 +-
 drivers/pmdomain/amlogic/meson-ee-pwrc.c           |  78 +--
 drivers/pmdomain/arm/Kconfig                       |   6 +-
 drivers/pmdomain/bcm/bcm2835-power.c               |  16 +-
 drivers/pmdomain/core.c                            | 131 +++--
 drivers/pmdomain/governor.c                        |   2 +
 drivers/pmdomain/mediatek/mt6893-pm-domains.h      | 585 +++++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c         |  17 +-
 drivers/pmdomain/mediatek/mtk-pm-domains.h         |   2 +-
 drivers/pmdomain/qcom/rpmhpd.c                     |  16 +
 drivers/pmdomain/rockchip/pm-domains.c             |  48 +-
 drivers/pmdomain/sunxi/Kconfig                     |  10 +
 drivers/pmdomain/sunxi/Makefile                    |   1 +
 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c        | 208 ++++++++
 drivers/pmdomain/ti/omap_prm.c                     |   8 +-
 include/dt-bindings/power/mediatek,mt6893-power.h  |  35 ++
 include/dt-bindings/power/rockchip,rk3562-power.h  |  35 ++
 include/linux/pm_domain.h                          |  10 +
 24 files changed, 1185 insertions(+), 115 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
 create mode 100644 drivers/pmdomain/mediatek/mt6893-pm-domains.h
 create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
 create mode 100644 include/dt-bindings/power/mediatek,mt6893-power.h
 create mode 100644 include/dt-bindings/power/rockchip,rk3562-power.h

