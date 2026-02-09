Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CE1E81BAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cdQQK6HA2N5wcX6J2p0xOEK4xhy0f1zgRy0FKVKyb1w=; b=vu/Ljx7kdCUeE1hZa/YC2KuS4+
	MOdt8ynnT0GYd2W9oWzI/spYgYxKU6PWj4HJn3S5AUzPIfk5bWGy+MHS8iYvxeNq52CwJwL7PPmyB
	NwhXOhdJQgg2o76p0lTrLyhAZ7Sk8KJ0ZjvGrUqdFKzfQ2Bo3bD9LdGc/kITmRx347AUq5onFAhUA
	s0AYdj2gNecSDFeVxHvClsER23/1IhZheeyeQ4P1Y/5pwkDAzQwt/0sUwFTi3pYZdMMEsEHQlj08c
	HRKrG3q0Nxm2NKrJVJQBfSU7pJhLNS25cnF5Dymx7WyQQUiza19XZgPQc0Mws1rmwfYIhdsYr9Bum
	LkrtJFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQgR-0000000FOBd-0IUQ;
	Mon, 09 Feb 2026 12:48:07 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQgN-0000000FOAJ-3ud0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 12:48:05 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59dd7bfeb8aso5309282e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 04:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770641281; x=1771246081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cdQQK6HA2N5wcX6J2p0xOEK4xhy0f1zgRy0FKVKyb1w=;
        b=j0t/9ZqkIkbUWD/AdRYbhnMND0AXk0SJnFhZlBS/QeofnEIYhwL3nlWPGIq9xyJ/Q0
         JDp8z9UQWwu2j7Ec7NJnrRT67tA7swTfKRf1Y/InWeMm3QLKMk0zb72t7hzulcSmS6Oi
         KZarc+YWbWNFkBvhKRXCEX5JVhH38pwo91TTD/ZovqaIsGqPtFS29gXlf8/XFajDKqwf
         yPQih+1f3+rCA2mCj742rdNFC5bq3rLNj0sK4FiF4pRnR+Eo+7ECTFfwySZzbq9kNu+u
         g+oGwxlMzZUm1l2IF2yUwtP6CK1Z5AifQRuGv3w4+2/HddXKjpm/LfZqsl9ieyhvrYMH
         o+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770641281; x=1771246081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdQQK6HA2N5wcX6J2p0xOEK4xhy0f1zgRy0FKVKyb1w=;
        b=hyzocKqaZFInmigLIA1LGysgr+ojk3xH00ODQhjtUWnh5CY8A8cccu3hd6HUFBKowc
         kEuxsnF/dayVNJsyNRkgDP0Wd9QlSYOAz8K7pJo5Xj0fSdZwkWLqUDjhVlqCUqeKwC5z
         MQv1jsuwHiNeaVTIgYz+IrdoZx6ReCONMO+YeCpxPbD2Tt4GPYKod4fqaYX5OuB51G5c
         XlpI8VfdF3SN8xfK+F4h7U8Ndge3sIlL2jRpeOSJz6rsE3Box/DiarhBMscZD7Wl3dkh
         xSmjOAvA0xLu3J+ClUn7xTnevMWilF5DbMFveQ7+M5O2wMbpwERYN0bSDY39dAjxa09g
         Qd/A==
X-Forwarded-Encrypted: i=1; AJvYcCVEyqmRT8hvxJp5m7tO5ysANbrEe1EY+JZ8afh+24F4ywRZLk6l7y7zkjqgtUiximN0nXpRhAZPDk6Kb8MdeW9/@lists.infradead.org
X-Gm-Message-State: AOJu0YyWPtNmluOkEIiwGSOqc/0Rh/R2ggWOF23cXdHjXhICqBabVfIA
	jp94ZfZAtkugdL3//eNIcx1kxiu9BbOvG1m5sCNKXTzvKeo0JylEvqQH+N3USuyEOes=
X-Gm-Gg: AZuq6aKq2pz8uQLBWffVZCVH+J25OLNpn4xLaerDJH3PwognewpTnXD/0+zTaSYNf+V
	ArsS/bpBTTfDc56K4Sfm9Bb7SFSe3PVAu0mxZqyKekUfF73Lv4xXPN3N3tNn2IEZ0iTpuoyP2x+
	+SaBCC8xvimEdvAgoxZCdEn/M2e5PKF5w2llQJqgdjFWC/rH+pYspvkCmsRupHIrBPqbeu8EgGV
	Fs78EICfgMZGtqOoAZ2wlERSZl3DmqCZ2PRqi9pWtUAUP7R/4BAbzMJr+736p+6FeIovHPdZVSR
	KPr9p5nRmwpVqLCXTnB/YBZ2DtVmvbqMTDMLrtEpkPazbzbSHQXup7oQbJbz9qUydVqqubDKdjh
	Zma2hay8GWjQuGRlRxu/FchuTdkEWp8dZ5mOccQNCIbKz0AgnTMbVLP86V0LvvPt29Z8zynYDOe
	jyHpdMMNKdYzAvYtneKYNFh2/Ns9hGFzY=
X-Received: by 2002:a05:6512:3ca1:b0:59d:e7ac:619f with SMTP id 2adb3069b0e04-59e4504c6b8mr3559631e87.18.1770641281237;
        Mon, 09 Feb 2026 04:48:01 -0800 (PST)
Received: from uffe-tuxpro14.. ([2a02:1406:249:f8a3:3249:60bc:db1:48cb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cff6a5sm2622296e87.34.2026.02.09.04.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:48:00 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain updates for v7.0
Date: Mon,  9 Feb 2026 13:47:57 +0100
Message-ID: <20260209124757.554032-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_044804_049994_47C2023F 
X-CRM114-Status: GOOD (  16.44  )
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

Here's the pull-request with pmdomain updates for v7.0. Details about the
highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit e2c4c5b2bbd4f688a0f9f6da26cdf6d723c53478:

  pmdomain: imx8mp-blk-ctrl: Keep usb phy power domain on for system wakeup (2026-02-05 11:33:30 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.0

for you to fetch changes up to 1fca2a4426aac222a724770a56c71e6bb3cf96f2:

  pmdomain: Merge branch fixes into next (2026-02-05 11:52:19 +0100)

----------------------------------------------------------------
pmdomain core:
 - Extend debugfs support for domain idle states

pmdomain providers:
 - imx: Add suppport for child nodes for imx93-blk-ctrl power domains
 - marvell: Add support for the audio power island for Marvell PXA1908
 - mediatek: Add support for the MT7622 audio power domain
 - mediatek: Expose shader_present as nvmem cell for mt8196-gpufreq
 - mediatek: Add support for the the MT8189 SoC
 - ti: Handle wakeup constraint for out-of-band wakeup for ti_sci domains

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      dt-bindings: power: mt7622-power: Add MT7622_POWER_DOMAIN_AUDIO
      pmdomain: mediatek: scpsys: Add MT7622 Audio power domain to legacy driver

Dmitry Baryshkov (1):
      pmdomain: de-constify fields struct dev_pm_domain_attach_data

Felix Gu (2):
      pmdomain: ti: omap_prm: Fix a reference leak on device node
      pmdomain: imx: scu-pd: Fix device_node reference leak during ->probe()

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

Nicolas Frattaroli (2):
      dt-bindings: power: mt8196-gpufreq: Describe nvmem provider ability
      pmdomain: mediatek: mtk-mfg: Expose shader_present as nvmem cell

Rafael J. Wysocki (1):
      pmdomain: imx: gpcv2: Discard pm_runtime_put() return value

Ulf Hansson (13):
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: core: Restructure domain idle states data for genpd in debugfs
      pmdomain: core: Show latency/residency for domain idle states in debugfs
      pmdomain: core: Extend statistics for domain idle states with s2idle data
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch core into next
      pmdomain: Merge branch fixes into next

 .../bindings/power/mediatek,mt8196-gpufreq.yaml    |  13 +
 .../bindings/power/mediatek,power-controller.yaml  |   1 +
 drivers/pmdomain/core.c                            |  59 ++-
 drivers/pmdomain/imx/gpcv2.c                       |   4 +-
 drivers/pmdomain/imx/imx93-blk-ctrl.c              |  77 ++--
 drivers/pmdomain/imx/scu-pd.c                      |   1 +
 .../pmdomain/marvell/pxa1908-power-controller.c    |  39 +-
 drivers/pmdomain/mediatek/mt8189-pm-domains.h      | 485 +++++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       |  59 +++
 drivers/pmdomain/mediatek/mtk-pm-domains.c         |  44 +-
 drivers/pmdomain/mediatek/mtk-pm-domains.h         |   5 +
 drivers/pmdomain/mediatek/mtk-scpsys.c             |  10 +
 drivers/pmdomain/qcom/rpmpd.c                      |   2 +-
 drivers/pmdomain/ti/omap_prm.c                     |   1 +
 drivers/pmdomain/ti/ti_sci_pm_domains.c            |   5 +-
 include/dt-bindings/power/marvell,pxa1908-power.h  |   1 +
 include/dt-bindings/power/mediatek,mt8189-power.h  |  38 ++
 include/dt-bindings/power/mt7622-power.h           |   1 +
 include/linux/pm_domain.h                          |   5 +-
 19 files changed, 779 insertions(+), 71 deletions(-)
 create mode 100644 drivers/pmdomain/mediatek/mt8189-pm-domains.h
 create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h

