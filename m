Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85595D49207
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 16:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BFCqTpO5hD3gV9Gw4+aN5wSpGMUVExHmp0FBXsCj+e0=; b=Nke7cIp+17+OiIvX0FbNg8XhRz
	z5+YL/akMfRF5nwA30Gn7l+8CfbXF5punaRvzveckq5QpG0sG6nnWOLOCgWTeM0Di5pYrNCTZABoF
	JDEEPjTpfhNRPHIXJyoyhsP7Tk7RzdYV5QkBNEeEsejaCZFGqv3xCLVj0JSfpRCo+UsXSNZg3ONaK
	v9YkVom1fdeZLkYo0yPCsED3UmjGuFBUCCX2W9KYiIWaacugPXmkuddCQHAxAp26rSxxlLO5wvQ0k
	hrcNeYLDUEN9FsUk0hM9XkSOy91Ta+Xr+PxSAPlpKXmA9OM9d2B/m8aaarOuCDQJT5dUbmNJB9pwk
	oLFR+fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4G4-0000000A1S0-3Wqg;
	Mon, 18 Nov 2024 16:05:48 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4F8-0000000A1Hy-1JbE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 16:04:51 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53d9ff92edaso4821758e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 08:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731945887; x=1732550687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFCqTpO5hD3gV9Gw4+aN5wSpGMUVExHmp0FBXsCj+e0=;
        b=g3emUYC6CtADVUidRXiGPjRQvVkDMZFdTISqWA2Gdw+CNoRRMlSo6c7boQWaM74a+v
         L6rclGxBu7vDYLa7uU65v488eNdQUgMIad3XMifWpzBfb5AKmzQvIKQrwLRjZBe5F3WP
         Za6ZA1YBNvqo+iZiWw7OqVy55F94zHjbTlD9vmc/53/wRHETv4lja7BMKi7ZYLNBHJ+I
         4KfCRGqopzE+5ZfasfhG9iZJqj40lFuXgJt5XvG3kyejDq1DzkA9PY/1jHyTSBHXEm0p
         f7cMIwSgVmpdJUPhPQwE8otCgcyxbQ8MIaoA2RrTVUPAJCaSEhrRbNyKy8EM9s9dduCH
         pHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731945887; x=1732550687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFCqTpO5hD3gV9Gw4+aN5wSpGMUVExHmp0FBXsCj+e0=;
        b=bwd6zw4FBTxEv5TukQaYpPyy0c1awedua8UPCY3fQyjRpX+fMQJkpD3qjMnkmQii+L
         no8Hv9xtMKJByKP72CAoK/Gmzho0jJQbTRJ+em+2tdoY0rugST9089CQoiVQDp3Ofi1s
         K0Y0wm2ZZJxsELtVjuFV4k5JvZihYsoUgg4NkOpHt9rFE7gJSERGOEJOUc6+8i5hItxN
         x4CK26VMiV7+jWRxUabn5saK+tXAkQUjaM2zCcg3/fYE683ivAN1zagWCW8PhVqqNOOB
         eWya1HuYRul7d+Hsqb0nYeoCmhbdU2BiAbiL2WFPyQZjJaDbl9+e3V+cmGqBbZgtZ3RH
         STqg==
X-Forwarded-Encrypted: i=1; AJvYcCUngHhj/WldJ9i5xIReoIS5JiIBapO7iFV7Yssm8tHx253v0TTXm7l1Bh7K2dpB7PeC9Zy3gGw3l1Kg782pzMjv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4m7uXCtSL2C11MlOKyWDrfcQrU/Vc/zZ7bt1kLPGwwiy47q/j
	SjEN8t6FNqJoCmIjfRzUgMrnhdRNWiAIzKfRx7aOLxQAF+Del7NabZ2qHvdb06Y=
X-Google-Smtp-Source: AGHT+IGd4eVkYYJwl96txBLQUWoJ/8rW9jwI1uP17ARS3pwojFY5Z+QVuAfMzsRsnsHNz1ibQ9S7Ig==
X-Received: by 2002:a05:6512:39c7:b0:52f:ca2b:1d33 with SMTP id 2adb3069b0e04-53dab29e8e1mr5424291e87.20.1731945887460;
        Mon, 18 Nov 2024 08:04:47 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da64f9c0dsm1674649e87.35.2024.11.18.08.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 08:04:46 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain updates for v6.13
Date: Mon, 18 Nov 2024 17:04:44 +0100
Message-ID: <20241118160444.161917-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_080450_376842_B51D6492 
X-CRM114-Status: GOOD (  16.89  )
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

Here's the pull-request with the pmdomain updates for v6.13. Details about
the highlights are as usual found in the signed tag.

Note that, this time there is also a signed-tag that I have pulled from Mark's
regulator tree.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit d2fab3fc27cbca7ba65c539a2c5fc7f941231983:

  mailbox: qcom-cpucp: Mark the irq with IRQF_NO_SUSPEND flag (2024-11-12 19:45:25 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13

for you to fetch changes up to 5812b95b7ff47d2ccc07b8f050652604ac54cdcf:

  pmdomain: Merge branch fixes into next (2024-11-12 19:46:55 +0100)

----------------------------------------------------------------
pmdomain core:
 - Set the required dev for a required OPP during genpd attach
 - Add support for required OPPs to dev_pm_domain_attach_list()

pmdomain providers:
 - ti: Enable GENPD_FLAG_ACTIVE_WAKEUP flag for ti_sci PM domains
 - mediatek: Add support for MT6735 PM domains
 - mediatek: Use OF-specific regulator API to get power domain supply
 - qcom: Add support for the SM8750/SAR2130P/qcs615/qcs8300 rpmhpds

pmdomain consumers:
 - Convert a couple of consumer drivers to *_pm_domain_attach|detach_list()

opp core:
 - Rework and cleanup some code that manages required OPPs
 - Remove *_opp_attach|detach_genpd()

----------------------------------------------------------------
Chen-Yu Tsai (3):
      regulator: Add of_regulator_get_optional() for pure DT regulator lookup
      regulator: Add devres version of of_regulator_get_optional()
      pmdomain: mediatek: Use OF-specific regulator API to get power domain supply

Dario Binacchi (1):
      pmdomain: imx: gpcv2: replace dev_err() with dev_err_probe()

Dmitry Baryshkov (2):
      dt-bindings: power: rpmpd: Add SAR2130P compatible
      pmdomain: qcom: rpmhpd: add support for SAR2130P

Jishnu Prakash (1):
      pmdomain: qcom: rpmhpd: Add rpmhpd support for SM8750

Rob Herring (Arm) (1):
      pmdomain: imx: Use of_property_present() for non-boolean properties

Taniya Das (1):
      dt-bindings: power: qcom,rpmpd: document the SM8750 RPMh Power Domains

Thomas Richard (1):
      pmdomain: ti-sci: set the GENPD_FLAG_ACTIVE_WAKEUP flag for all PM domains

Tingguo Cheng (4):
      dt-bindings: power: qcom,rpmpd: document qcs8300 RPMh power domains
      dt-bindings: power: qcom,rpmpd: document qcs615 RPMh power domains
      pmdomain: qcom: rpmhpd: Add qcs8300 power domains
      pmdomain: qcom: rpmhpd: Add qcs615 power domains

Ulf Hansson (17):
      Merge tag 'regulator-of-get-optional' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch fixes into next
      OPP: Rework _set_required_devs() to manage a single device per call
      PM: domains: Support required OPPs in dev_pm_domain_attach_list()
      pmdomain: core: Manage the default required OPP from a separate function
      pmdomain: core: Set the required dev for a required OPP during genpd attach
      OPP: Drop redundant code in _link_required_opps()
      drm/tegra: gr3d: Convert into devm_pm_domain_attach_list()
      media: venus: Convert into devm_pm_domain_attach_list() for OPP PM domain
      cpufreq: qcom-nvmem: Convert to dev_pm_domain_attach|detach_list()
      OPP: Drop redundant *_opp_attach|detach_genpd()
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch fixes into next

Yassine Oudjana (2):
      dt-bindings: power: Add binding for MediaTek MT6735 power controller
      pmdomain: mediatek: Add support for MT6735

Zhang Zekun (2):
      pmdomain: ti-sci: Add missing of_node_put() for args.np
      pmdomain: ti-sci: Use scope based of_node_put() to simplify code.

 .../bindings/power/mediatek,power-controller.yaml  |   1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   4 +
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |   1 +
 drivers/base/power/common.c                        |  21 ++-
 drivers/cpufreq/qcom-cpufreq-nvmem.c               |  82 +++------
 drivers/gpu/drm/tegra/gr3d.c                       |  39 +---
 drivers/media/platform/qcom/venus/core.c           |   8 +-
 drivers/media/platform/qcom/venus/core.h           |   6 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     |  44 ++---
 drivers/opp/core.c                                 | 199 +++++----------------
 drivers/opp/of.c                                   |  39 +---
 drivers/opp/opp.h                                  |   5 +-
 drivers/pmdomain/core.c                            |  76 ++++++--
 drivers/pmdomain/imx/gpc.c                         |   4 +-
 drivers/pmdomain/imx/gpcv2.c                       |   4 +-
 drivers/pmdomain/mediatek/mt6735-pm-domains.h      |  96 ++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c         |  17 +-
 drivers/pmdomain/mediatek/mtk-pm-domains.h         |   2 +
 drivers/pmdomain/qcom/rpmhpd.c                     |  87 +++++++++
 drivers/pmdomain/ti/ti_sci_pm_domains.c            |  25 ++-
 drivers/regulator/core.c                           |   4 +-
 drivers/regulator/devres.c                         |  39 ++++
 drivers/regulator/internal.h                       |  18 +-
 drivers/regulator/of_regulator.c                   |  51 +++++-
 .../power/mediatek,mt6735-power-controller.h       |  14 ++
 include/dt-bindings/power/qcom-rpmpd.h             |   2 +
 include/linux/pm_domain.h                          |   9 +
 include/linux/pm_opp.h                             |  42 +----
 include/linux/regulator/consumer.h                 |  37 ++++
 include/linux/soc/mediatek/infracfg.h              |   5 +
 30 files changed, 569 insertions(+), 412 deletions(-)
 create mode 100644 drivers/pmdomain/mediatek/mt6735-pm-domains.h
 create mode 100644 include/dt-bindings/power/mediatek,mt6735-power-controller.h

