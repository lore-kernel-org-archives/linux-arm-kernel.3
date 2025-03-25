Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74690C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s+lwlbypyNWLM9oS//k+PaCmQcJfM6mkqUtpIKVPe4Q=; b=JVYLbGXEgfWXV9lZB5SHPYXS2E
	z1PVwJ8Ykjr1wJh+qpJhq8FfZxKk2jOT5IRzaLLw4YF70+gJywbyqWC+32kSkj+vs4RtsLFV4rRpd
	bg6fwzn7aiTEp3fSaKelJJh6r3aRuMU5JDz606qRUffLA93zBtLX/MO47i66xngRVgIsQvD6nwIwP
	pHKlYjG9/+FJ+oCT/2QmEn1Gthb++V8Vv4hnWYXOWEzuNGAdqu5BQ0QoH9IK2l90htoe2Sn3Jn0TW
	9y7sHMCsQNDxMyFsoG+LDZzUaNVwxiidGT+bhXA878Uw+YzZL8kkH3eS1eceN1S0osi5jPPxRSCYU
	friYwh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Uw-00000005qN0-0Cg9;
	Tue, 25 Mar 2025 12:35:14 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3BL-00000005lc5-0hbS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:15:00 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5499614d3d2so6363324e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 05:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742904897; x=1743509697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+lwlbypyNWLM9oS//k+PaCmQcJfM6mkqUtpIKVPe4Q=;
        b=X/DqllwuVMeORGHqLkvuOQrRvLmRGofHdbrkeA3hoonMArIhhlVoRv9o/P/iDUg8k6
         vO9buSomNFahHwbTfyrg1MVCszjkX1N7oZol2HHC7rWzwvqUm3xFu7F95fi7Y1fVL8GH
         UzVtIM1oIDCOqyvt19G1xqsCxDW5LW/O8l/jINN9Z5afmyinPjIuYXxIMq8Jz4q/RT7k
         1wUXZVjjIKQEUqEIIvEFufP7XuHg1w7Bpd77GAef7/IQsIOdETW4fzJ2ZBJnooaANUoc
         1NxncL9xPK2WSt6Pi+FKYWmt3DJjWCweqb44OUjKgr05iqx/3UgDtZYxwe3Xtqyq6x4c
         A54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742904897; x=1743509697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+lwlbypyNWLM9oS//k+PaCmQcJfM6mkqUtpIKVPe4Q=;
        b=eUUMrcy6c6iaF8j8OgANyzyNaH3xOOGYeiH//A5ufIjYYsxQEwU5tSIkFpZn0Veakw
         Wogi7li5GiQUzEGUZt9oYGTWntuLsObcL5D8v5+0iqQMcNlSSa7pyh1Ckprznxd7O5R1
         /etTY03vc4wiPzTZuDkiLqb6mNXHcAV4CbBhJ9p/DocH1XJ5kf6+V8sgiJxcNWxvJpCC
         PWQyXDOZ2QggmUbF8Ke6z9N2iiZGXTMFvkI+e3yZ+desJrwEiaRwfOgMEm+JD0HCCPCn
         GbQ3I+qPHSihmrndvWS+oYjG5dr5Spfqzn4YolIzgvstjX8UtUh/VO6j9sZYnJyXQ2kz
         aYZA==
X-Forwarded-Encrypted: i=1; AJvYcCVZmGQ6zAgkkkmz7YMhK4cZRexlx6DBe0BCsLJFCORhDwwsjrBZjEOMZcvBgqSNKFCckxuocSXvCxJt+FHT0KLi@lists.infradead.org
X-Gm-Message-State: AOJu0YzOVwYEQ/aNWOK8hrVs+nYFQY65bIqzfls4PMn0V2lOO5JOYemz
	MtLfoV3UlYuKcTM7M8iIAeeVa8VFQyL++Y8WFWEE5UQ9WkyucyANkA3PHe4L0sw=
X-Gm-Gg: ASbGncsQJZlyVxDWw1W1w9L0y4odWAekqHdQlDILAQlVZyyVyW+GHteIvQwn15zHxZo
	elk1EysQylr+hS4MMxgTdo9hf0ML3kCRRPBPszeEy234gDy282+tRN6uF6z91o5hVDdKvUoblwt
	yJYsTafVc8Atfxg/Q6iUS+axuGOU5I9rVDt4md+sIbL10ff0a3XB0RMaUIeLOFzF/dWBAbYWv97
	7k0fmjobIeI9JpMMFnpul5Ka5NtXOd5Uanv8YOK8igQpgrTzQQK/pjBoFukzmBaLCjtT63XN0k6
	wN9UltSvJjcWoa2xsk4BFlKi0+fi/pPdAl1GyVn9bdHaxZmx9KS3HkzT2pSxc4hjePWfslNJkiN
	9BsEKwtlsI0fFCw28EdeqTfLCp8Ojyw==
X-Google-Smtp-Source: AGHT+IGzo1EvbrVCd9ZKmxlnNIRHybsaVGEX6jF84cBerHx8WU6tqQpBpys6UGtNAgMqTeEtrVx5Rw==
X-Received: by 2002:a05:6512:130c:b0:545:b28:2fa2 with SMTP id 2adb3069b0e04-54ad6476fd4mr5231938e87.7.1742904896727;
        Tue, 25 Mar 2025 05:14:56 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad651211csm1515556e87.227.2025.03.25.05.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 05:14:56 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/cpuidle-psci updates for v6.15
Date: Tue, 25 Mar 2025 13:14:54 +0100
Message-ID: <20250325121455.36031-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_051459_209613_830E1D89 
X-CRM114-Status: GOOD (  17.67  )
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

Here's the pull-request with pmdomain and cpuidle-psci updates for v6.15.
Details about the highlights are as usual found in the signed tag.

A few additional notes:
*) I have merged an immutable tag/branch from Mark Brown's regulator tree.
*) I made a few typos in some of the merge-commit-headers, sorry!

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit ef17b519088ee0c167cf507820609732ec8bad1a:

  pmdomain: amlogic: fix T7 ISP secpower (2025-03-05 15:51:04 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.15

for you to fetch changes up to 51f0b8911ec4355cea07b180f6569cc52f65aaa8:

  firmware: thead: add CONFIG_MAILBOX dependency (2025-03-18 13:13:03 +0100)

----------------------------------------------------------------
pmdomain core:
 - Add dev_pm_genpd_rpm_always_on() to support more fine-grained PM

pmdomain providers:
 - arm: Remove redundant state verification for the SCMI PM domain
 - bcm: Add system-wakeup support for bcm2835 via GENPD_FLAG_ACTIVE_WAKEUP
 - rockchip: Add support for regulators
 - rockchip: Use SMC call to properly inform firmware
 - sunxi: Add V853 ppu support
 - thead: Add support for RISC-V TH1520 power-domains

firmware:
 - Add support for the AON firmware protocol for RISC-V THEAD

cpuidle-psci:
 - Update section in MAINTAINERS for cpuidle-psci
 - Add trace support for PSCI domain-idlestates

----------------------------------------------------------------
Ahmad Fatoum (1):
      pmdomain: imx: gpcv2: use proper helper for property detection

Andras Szemzo (2):
      dt-bindings: power: add V853 ppu bindings
      pmdomain: sunxi: add V853 ppu support

Arnd Bergmann (3):
      pmdomain: rockchip: add regulator dependency
      pmdomain: thead: fix TH1520_AON_PROTOCOL dependency
      firmware: thead: add CONFIG_MAILBOX dependency

Dan Carpenter (1):
      firmware: thead,th1520-aon: Fix use after free in th1520_aon_init()

Geert Uytterhoeven (2):
      pmdomain: ti: Use of_property_present() for non-boolean properties
      pmdomain: renesas: rcar-sysc: Drop fwnode_dev_initialized() call

Keita Morisaki (1):
      cpuidle: psci: Add trace for PSCI domain idle

Luca Weiss (1):
      dt-bindings: power: rpmpd: Fix comment for SM6375

Michal Wilczynski (4):
      dt-bindings: firmware: thead,th1520: Add support for firmware node
      firmware: thead: Add AON firmware protocol driver
      dt-bindings: power: Add TH1520 SoC power domains
      pmdomain: thead: Add power-domain driver for TH1520

Peter Geis (1):
      pmdomain: rockchip: fix rockchip_pd_power error handling

Sebastian Reichel (6):
      regulator: Add (devm_)of_regulator_get()
      dt-bindings: power: rockchip: add regulator support
      pmdomain: rockchip: cleanup mutex handling in rockchip_pd_power
      pmdomain: rockchip: forward rockchip_do_pmu_set_power_domain errors
      pmdomain: rockchip: reduce indentation in rockchip_pd_power
      pmdomain: rockchip: add regulator support

Shawn Lin (3):
      soc: rockchip: add header for suspend mode SIP interface
      pmdomain: rockchip: Add smc call to inform firmware
      pmdomain: rockchip: Check if SMC could be handled by TA

Stefan Wahren (1):
      pmdomain: bcm2835-power: set flag GENPD_FLAG_ACTIVE_WAKEUP

Sudeep Holla (1):
      pmdomain: arm: scmi_pm_domain: Remove redundant state verification

Ulf Hansson (11):
      pmdomain: core: Introduce dev_pm_genpd_rpm_always_on()
      mdomain: Merge branch rockchip into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch rockchip into next
      MAINTAINERS: Update section for cpuidle-psci
      pmdomain: rockchip: Fix build error
      pmdomain: Merge branch rockchip into next
      pmdomain: Merge tag 'v6.14-rc4' from Linus into next
      pmdomain: Merge tag regulator-devm-of-get into next
      mdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next

 .../bindings/firmware/thead,th1520-aon.yaml        |  53 +++++
 .../bindings/power/allwinner,sun20i-d1-ppu.yaml    |   1 +
 .../bindings/power/rockchip,power-controller.yaml  |   3 +
 MAINTAINERS                                        |   7 +
 drivers/cpuidle/cpuidle-psci.c                     |   3 +
 drivers/firmware/Kconfig                           |  10 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/thead,th1520-aon.c                | 250 +++++++++++++++++++++
 drivers/pmdomain/Kconfig                           |   1 +
 drivers/pmdomain/Makefile                          |   1 +
 drivers/pmdomain/arm/scmi_pm_domain.c              |  11 +-
 drivers/pmdomain/bcm/bcm2835-power.c               |   1 +
 drivers/pmdomain/core.c                            |  35 +++
 drivers/pmdomain/imx/gpcv2.c                       |   2 +-
 drivers/pmdomain/renesas/rcar-sysc.c               |   2 -
 drivers/pmdomain/rockchip/Kconfig                  |   2 +
 drivers/pmdomain/rockchip/pm-domains.c             | 205 +++++++++++------
 drivers/pmdomain/sunxi/sun20i-ppu.c                |  15 ++
 drivers/pmdomain/thead/Kconfig                     |  12 +
 drivers/pmdomain/thead/Makefile                    |   2 +
 drivers/pmdomain/thead/th1520-pm-domains.c         | 218 ++++++++++++++++++
 drivers/pmdomain/ti/omap_prm.c                     |   2 +-
 drivers/regulator/devres.c                         |  17 ++
 drivers/regulator/of_regulator.c                   |  21 ++
 .../dt-bindings/power/allwinner,sun8i-v853-ppu.h   |  10 +
 include/dt-bindings/power/qcom-rpmpd.h             |   2 +-
 include/dt-bindings/power/thead,th1520-power.h     |  19 ++
 include/linux/firmware/thead/thead,th1520-aon.h    | 200 +++++++++++++++++
 include/linux/pm_domain.h                          |   7 +
 include/linux/regulator/consumer.h                 |   6 +
 include/soc/rockchip/rockchip_sip.h                |   3 +
 include/trace/events/power.h                       |  37 +++
 32 files changed, 1076 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 create mode 100644 drivers/firmware/thead,th1520-aon.c
 create mode 100644 drivers/pmdomain/thead/Kconfig
 create mode 100644 drivers/pmdomain/thead/Makefile
 create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
 create mode 100644 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
 create mode 100644 include/dt-bindings/power/thead,th1520-power.h
 create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h

