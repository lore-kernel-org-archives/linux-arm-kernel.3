Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3A9ED7B9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gTjIg/pA86gqo4YPTXrfDC9YsWUvQ3qeH5b6Z95Zmbo=; b=mrosgt2R6llVeS4Nn29kxWIfKR
	Q7xr19swRCUYRVM2nWLFcfO3G4gFZ6h44yZD2iXjWe/5P65VNVrZ5XtqKOJcbiSAND8V+OZORpiQf
	ks/sjhGZjTyDWkSd11RXnGZXXexL/6Vo6iOIp6B/gm0/9EA2cFDjqNBezZ408V7uYcA0kMirlOf5p
	LRoudL9c19ST3HWdbwe1V4tbhnsQgEo/jnkVgBK/n+S3/GqYW8T8zBC3j59Bgh17quFkGFSOhKJpH
	TjBDkyX4jbBsIAEhUfq2yq1igP8nn9a3qwhHlxT87GFAB3BMDy9ujkewABy82BmpLo1F8ha4CtZ0K
	/3zh6qlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbA9-0000000HAQM-2UCE;
	Tue, 14 Apr 2026 10:38:33 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbA6-0000000HAPx-1uBC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:38:31 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso5781320e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 03:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776163108; x=1776767908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTjIg/pA86gqo4YPTXrfDC9YsWUvQ3qeH5b6Z95Zmbo=;
        b=FbtxTRm6rfBRxD6IDr+F8RZJsjIDGhQljegljAbYwIl81UOHEUs0nEATvAzX24S3Mo
         3MHyk5JrYcaIpbDmh7OHRJ6WgScOS6buvUCB4INgxBkhTe6Vc2ym4klzM0pyj+U+HC/f
         QZu5d00prWSELQN0SJm1LC5mnj5QoUb4lDo2vy4VhpRFrnx5tUkc4TUAQpfTOJG21lRk
         a4f18kKeoO7LhnMqQH7RqGkn02U2v/6ie621SBZzBBotQ9S+KdERraQ/92z7ryDqiGCc
         T5fJvvaFfdKmX45eUc4HJUqbnnQoJOqFKX8tWnZfW9sEpxgKduTj5RcaPkUVJVEIEhJO
         PtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776163108; x=1776767908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTjIg/pA86gqo4YPTXrfDC9YsWUvQ3qeH5b6Z95Zmbo=;
        b=OX7fLgZTmvzai+tD+UaiPYQvxlqL3xRALe7phYIJF0+B95Ew9ZxDKYw43S6eW/hLFq
         uDqY9UW5w7xFy1wTuUqnVx/Td7xSSkzr3tg7gu6yj/RbxTF8itrg8MKF4MjH7jaqB8Gx
         L75a1YO/YMt9kYztOe0VeN6B64pqwoyKbBqxiR+/bQngvSrBODjdDvzun2CbOAFkTxA+
         ZU1+Jpu1VRj/pTUcjFUAYAUIj4EPedWgFnn+yXo60alo9IPjWo1OByNmT2Fln4JvcrUR
         45FD3VZa8GiTThTE6omxreMeAeseT77qKwY+SSjKxh4aZFcNpoPaqeTyXZJiSuJOGw3E
         orEQ==
X-Forwarded-Encrypted: i=1; AFNElJ97/QfnuozGQt0BjwYWpAs4AsPuaDEjIROTdCJvLfEjvcSWRcJX8b6zIlHBC9tBWlRiMSa4Ts/yttMMyISiTS47@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxk7ILT6roXfawFIAlrjblrgXPP+6+UuUKjYo87jqfiKkkHXjz
	ohgQx+V848eslMkXd7Hfp218hhqAugalBSdHZtwiYt++ou92+UqrynToDPmkfnoHlO8=
X-Gm-Gg: AeBDiesXkyYribahXbU4ok59kCY0wMTUj2hzt8NsXe6tfUlyXtMxDr3RnJBewzO0F14
	1q46sC4i4KrQE3AfHEq9yRznDEBWtJuz80R47wUpPtJSycKBWX8WF1Drb0h/ZGE33tHhWT6KHQ3
	xmAc2/9dnuFPrUl1Hi4PIyoH/yOj1y57CibVBCnZY46d90W+b1J+MuuhkiuIYBpeO/ZPm++eDf8
	V6TCc3CcxZD8607JXzx9m99nWCa5sQbuSMSO6SghNN3GirQc1DcVHqS9yl4YTTeB4Qi7NphAwc5
	qrrs34CBqRhFR9ETxUsLmK79FZXYgMtRZFpzqB6Rl8uMgkQfyM/dmH+MOZUWpEuAOXTQeVEbrtE
	ar9w1ChwPlFnIIm77KG6A87VF/4QdXQ0D7jqfeyVIy+hHW9yZsThEpbE4EVbJ2Vn5vGSEnGGrdl
	LaQrkfk8Omg40vSRvfN9ZsD6wsJCrJC2NrhGyUpKTEeoanfzQ3T2Mf7f9FZTOMoEo2ugEdIrEG
X-Received: by 2002:ac2:4c4e:0:b0:5a3:cd94:df73 with SMTP id 2adb3069b0e04-5a3efe9b66cmr5228076e87.38.1776163107457;
        Tue, 14 Apr 2026 03:38:27 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefb9d4sm3153723e87.68.2026.04.14.03.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 03:38:27 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain updates for v7.1
Date: Tue, 14 Apr 2026 12:38:21 +0200
Message-ID: <20260414103826.161076-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_033830_573870_03B30416 
X-CRM114-Status: GOOD (  16.01  )
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

Here's the pull-request with pmdomain updates for v7.1. Details about the
highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit e91d5f94acf68618ea3ad9c92ac28614e791ae7d:

  pmdomain: imx8mp-blk-ctrl: Keep the NOC_HDCP clock enabled (2026-04-01 13:03:07 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.1

for you to fetch changes up to 596ca99cf04f339db2ed18a5bb230ee11a47b699:

  pmdomain: qcom: rpmhpd: Add power domains for Hawi SoC (2026-04-08 12:01:37 +0200)

----------------------------------------------------------------
pmdomain core:
 - Extend statistics for domain idle states with s2idle data
 - Show latency/residency for domain idle states in debugfs

pmdomain providers:
 - imx: Add support for optional subnodes for imx93-blk-ctrl
 - marvell: Add audio power island for Marvell PXA1908
 - mediatek: Add legacy support for the MT7622 audio power domain
 - mediatek: Add nvmem provider functionality to the mtk-mfg-pmdomain
 - mediatek: Add support for the MT8189 power domains
 - qcom: Add support for the Eliza and Hawi power domains
 - sunxi: Add support for the Allwinner A733 power domains
 - ti: Handle wakeup constraints for out-of-band wakeups for ti_sci

----------------------------------------------------------------
Abel Vesa (2):
      dt-bindings: power: qcom,rpmpd: document the Eliza RPMh Power Domains
      pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domains

AngeloGioacchino Del Regno (2):
      dt-bindings: power: mt7622-power: Add MT7622_POWER_DOMAIN_AUDIO
      pmdomain: mediatek: scpsys: Add MT7622 Audio power domain to legacy driver

Chris Morgan (1):
      pmdomain: rockchip: quiet regulator error on -EPROBE_DEFER

Dmitry Baryshkov (1):
      PM: domains: De-constify fields in struct dev_pm_domain_attach_data

Felix Gu (2):
      pmdomain: ti: omap_prm: Fix a reference leak on device node
      pmdomain: imx: scu-pd: Fix device_node reference leak during ->probe()

Fenglin Wu (2):
      dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Hawi SoC
      pmdomain: qcom: rpmhpd: Add power domains for Hawi SoC

Gabor Juhos (1):
      pmdomain: qcom: rpmpd: drop stray semicolon

Irving-CH Lin (3):
      dt-bindings: power: Add MediaTek MT8189 power domain
      pmdomain: mediatek: Add bus protect control flow for MT8189
      pmdomain: mediatek: Add power domain driver for MT8189 SoC

Karel Balej (2):
      dt-bindings: power: define ID for Marvell PXA1908 audio domain
      pmdomain: add audio power island for Marvell PXA1908 SoC

Kendall Willis (1):
      pmdomain: ti_sci: handle wakeup constraint for out-of-band wakeup

Krzysztof Kozlowski (1):
      pmdomain: mediatek: Simplify with scoped for each OF child loop

Marco Felsch (3):
      pmdomain: imx93-blk-ctrl: cleanup error path
      pmdomain: imx93-blk-ctrl: convert to devm_* only
      pmdomain: imx93-blk-ctrl: add support for optional subnodes

Maíra Canal (1):
      pmdomain: bcm: bcm2835-power: Replace open-coded polling with readl_poll_timeout_atomic()

Nicolas Frattaroli (2):
      dt-bindings: power: mt8196-gpufreq: Describe nvmem provider ability
      pmdomain: mediatek: mtk-mfg: Expose shader_present as nvmem cell

Rosen Penev (2):
      pmdomain: qcom: cpr: simplify main allocation
      pmdomain: qcom: cpr: add COMPILE_TEST support

Ulf Hansson (8):
      pmdomain: Merge branch dt into next
      pmdomain: core: Restructure domain idle states data for genpd in debugfs
      pmdomain: core: Show latency/residency for domain idle states in debugfs
      pmdomain: core: Extend statistics for domain idle states with s2idle data
      pmdomain: arm: Add print after a successful probe for SCMI power domains
      pmdomain: Merge branch pmdomain into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next

Yuanshen Cao (2):
      dt-bindings: power: Add Support for Allwinner A733 PCK600 Power Domain Controller
      pmdomain: sunxi: Add support for A733 to Allwinner PCK600 driver

 .../bindings/power/allwinner,sun20i-d1-ppu.yaml    |  17 +-
 .../bindings/power/mediatek,mt8196-gpufreq.yaml    |  13 +
 .../bindings/power/mediatek,power-controller.yaml  |   1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   2 +
 drivers/pmdomain/arm/scmi_pm_domain.c              |   1 +
 drivers/pmdomain/bcm/bcm2835-power.c               |  25 +-
 drivers/pmdomain/core.c                            |  59 ++-
 drivers/pmdomain/imx/imx93-blk-ctrl.c              |  77 ++--
 drivers/pmdomain/imx/scu-pd.c                      |   1 +
 .../pmdomain/marvell/pxa1908-power-controller.c    |  39 +-
 drivers/pmdomain/mediatek/mt8189-pm-domains.h      | 485 +++++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       |  59 +++
 drivers/pmdomain/mediatek/mtk-pm-domains.c         |  44 +-
 drivers/pmdomain/mediatek/mtk-pm-domains.h         |   5 +
 drivers/pmdomain/mediatek/mtk-scpsys.c             |  10 +
 drivers/pmdomain/qcom/Kconfig                      |   2 +-
 drivers/pmdomain/qcom/cpr.c                        |  13 +-
 drivers/pmdomain/qcom/rpmhpd.c                     |  58 +++
 drivers/pmdomain/qcom/rpmpd.c                      |   2 +-
 drivers/pmdomain/rockchip/pm-domains.c             |   7 +-
 drivers/pmdomain/sunxi/sun55i-pck600.c             |  35 +-
 drivers/pmdomain/ti/omap_prm.c                     |   1 +
 drivers/pmdomain/ti/ti_sci_pm_domains.c            |   5 +-
 .../power/allwinner,sun60i-a733-pck-600.h          |  18 +
 include/dt-bindings/power/marvell,pxa1908-power.h  |   1 +
 include/dt-bindings/power/mediatek,mt8189-power.h  |  38 ++
 include/dt-bindings/power/mt7622-power.h           |   1 +
 include/dt-bindings/power/qcom,rpmhpd.h            |  12 +
 include/linux/pm_domain.h                          |   5 +-
 29 files changed, 932 insertions(+), 104 deletions(-)
 create mode 100644 drivers/pmdomain/mediatek/mt8189-pm-domains.h
 create mode 100644 include/dt-bindings/power/allwinner,sun60i-a733-pck-600.h
 create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h

