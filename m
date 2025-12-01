Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70891D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 17:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CQAmSf/I/r1AJACdEyDQZKuMSYhZU2RwlU93Oa7O8sU=; b=xA6+zBzXepRWvtl2wD6EDOnbby
	NHOHqVFJJtJiRCwt2heCMltfCQGargtrPDVC57VvqUpjeIonpJVyOK5tMSZcitdJoRa50ro22IYH9
	wyynreBh3eoM/ozdMAE9irICOWrDHB7R4XimvQamoYEH/fafvPJ5k6UrU40M33qOqA9rcqo1ix78Y
	jyNuSb6Y5e7hT5XpSVjfprFwFfH2KboRZa/TozFhTSIpROYkNWFr0hZFGTSxWkTZFIzcvptIphCy9
	zZVtg3KNqkC529mBd5+P0n6kXdjSceqr+/Ia4gurFtHdfbcTwafQ6D98OIuG9DGo68g9i9nH7/H4l
	0bXcz0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ83i-00000004NqU-0PtX;
	Mon, 01 Dec 2025 17:51:34 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ83f-00000004Npz-2kgN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 17:51:32 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5957753e0efso4843676e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 09:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764611489; x=1765216289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CQAmSf/I/r1AJACdEyDQZKuMSYhZU2RwlU93Oa7O8sU=;
        b=ivL9c8BNy9+2QswLaI0sN89t/+ztsVGAcrSsBUl5pKj+zi4Ct+OUNHsN3sn0cD65b2
         nXd7r3NEeXOoRjApHMaEQUS0prSjye8jS7q7u2rBGn+SG0kH1fDdGzcU7Ed7cR//nPno
         uiT5pZm05HAPkAzm75kxA2912z5EcB3F92mV3/qb0xJQ4BDt26r9HGjYE95s1JUFvsCI
         2akzJ2G60XXXs4eZTHI+knZUvfFSNw9aRV8LtbrDJt3mDlAIzroDBOr2Dirkyg0gKIn+
         KucuyHcRqpRpdihRFjIjappx6Vk4kEOzNCo6WG3xOoAR2zjiDJlTGsJvb+s3LILzRPqg
         LXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764611489; x=1765216289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQAmSf/I/r1AJACdEyDQZKuMSYhZU2RwlU93Oa7O8sU=;
        b=LHP7v6YHKzJHYkHRNxLsssfmt0cd79n6SQHKWCONhQpecWsYsLAnRCu2ggNkjp2Ws0
         pOM+APruhJRa5XoBYhw2XIAZrjm9JazCCj8Gq0KB77113RPBWTY1Fuxeu2IQEHSOSLbd
         N2V7SA6y3k4s+sAYCo9fyDomQ4KdyefPf2hwXQtiW6w+/Om3OLtjMdEILNfKl2E0rmrR
         V/xiYxgg72hgwAiCQ1pEeu3BEablC24MXsgLLA7J71ohEBTvXhX5nfnN8QWmuLKDMaJW
         dwGmeqXx/7uL14oIWiKevoVErmzfUr3ziWsDMBSDHLVdJUzQ93wXtv7tgX4dSDKLXUQn
         LerQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLe9O5YHs/vugXKy4jOO1g/xIcExaIWtr5PLaz4Oje63IFOhbjrSKs0bBgZUSj1uemR3alptxI8npr3GvbWjKe@lists.infradead.org
X-Gm-Message-State: AOJu0YxrXz/3JZY1gHLHEJcc81IKyzO73dhVNDnOf2K4ef6PhzAx1rDm
	SsDE3tNZCBqVC4egLwZ8w0/U5DbaRv2B8hOT6JY4f+BgVSmr9A1fWgTsuqtD4J3+NLU=
X-Gm-Gg: ASbGncsDolVO6/DHQjJ7Itxa3G7lz38UGkGqlXsaKAzo43p2Ck5SA1K9kfi+iioJnOn
	WW62yrR4VRclgf5tU54EOx+wL9s2yZPAo0Mi3XECSC+r47MzmX040MURs9kE8+EbFg5wD/A23nR
	nFhCKQC+/4pwbHjfsJpCOoEHSYz/uKjQHF9SvI+PWiy6Qcc4dBV+oVuPnJBjAYcvqkyXsoa/NkB
	G0DzewdHyAWOmDuwuv5PkorVlqJJAYtI8sgs8mS7OYES66K7Vzjii7r7/WOLmyS9qUTkHLZ2Tjh
	kC7Cr0ix78Z0SvC2FboTyv/K0o/mm0vrFs9HrYau7mEYRlDlrwJ0xhLI2OAX/LS1Ivgj+6zziWI
	hWPOP5JGhb85T+VzbeBYTHmwGhXYVldZj9tbyhHPxFflR+UoJkFOnq5QKJqafMy33jiEV4A5tRN
	WEMhVO/sgPjTcFF5PeywNiVEDD072LkIMkkGGj1W6yt2g3l4miwqOZcL6glc9j
X-Google-Smtp-Source: AGHT+IGJ/2qcLJ93I8tQ9xcZfNdaAnY6D2Sz4qECv7ecbOoK2+SCkO7fr0vpFnxNjafmmj1k2a9cOA==
X-Received: by 2002:a05:6512:104f:b0:593:f74:9088 with SMTP id 2adb3069b0e04-596a3ee5881mr12619568e87.43.1764611488885;
        Mon, 01 Dec 2025 09:51:28 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48f7bsm3731430e87.85.2025.12.01.09.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 09:51:28 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/cpuidle-psci updates for v6.19
Date: Mon,  1 Dec 2025 18:51:25 +0100
Message-ID: <20251201175125.34284-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_095131_744525_6386A4FD 
X-CRM114-Status: GOOD (  14.00  )
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

Here's the pull-request with pmdomain and cpuidle-psci updates for v6.19.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit c98c99d5dbdf9fb0063650594edfd7d49b5f4e29:

  pmdomain: tegra: Add GENPD_FLAG_NO_STAY_ON flag (2025-11-24 11:14:01 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19

for you to fetch changes up to 1f67707fafa598e2338dba08e3de0db3e468afd1:

  pmdomain: Merge branch fixes into next (2025-11-24 11:14:36 +0100)

----------------------------------------------------------------
pmdomain core:
 - Allow power-off for out-of-band wakeup-capable devices
 - Drop the redundant call to dev_pm_domain_detach() for the amba bus
 - Extend the genpd governor for CPUs to account for IPIs

pmdomain providers:
 - bcm: Add support for BCM2712
 - mediatek: Add support for MFlexGraphics power domains
 - mediatek: Add support for MT8196 power domains
 - qcom: Add RPMh power domain support for Kaanapali
 - rockchip: Add support for RV1126B

pmdomain consumers:
 - usb: dwc3: Enable out of band wakeup for i.MX95
 - usb: chipidea: Enable out of band wakeup for i.MX95

----------------------------------------------------------------
AngeloGioacchino Del Regno (5):
      dt-bindings: power: Add support for MT8196 power controllers
      pmdomain: mediatek: Add support for Hardware Voter power domains
      pmdomain: mediatek: Add support for secure HWCCF infra power on
      pmdomain: mediatek: Add support for MT8196 SCPSYS power domains
      pmdomain: mediatek: Add support for MT8196 HFRPSYS power domains

Brian Masney (1):
      pmdomain: mediatek: convert from clk round_rate() to determine_rate()

Claudiu Beznea (1):
      amba: bus: Drop dev_pm_domain_detach() call

Finley Xiao (2):
      dt-bindings: power: rockchip: Add support for RV1126B
      pmdomain: rockchip: Add support for RV1126B

Jishnu Prakash (3):
      dt-bindings: power: qcom,rpmpd: document the Kaanapali RPMh Power Domains
      dt-bindings: power: qcom,rpmpd: add new RPMH levels
      pmdomain: qcom: rpmhpd: Add RPMh power domain support for Kaanapali

Nicolas Frattaroli (3):
      dt-bindings: power: Add MT8196 GPU frequency control binding
      pmdomain: mediatek: Add support for MFlexGraphics
      pmdomain: mediatek: mtk-mfg: select MAILBOX in Kconfig

Peng Fan (4):
      PM: wakeup: Add out-of-band system wakeup support for devices
      pmdomain: core: Allow power-off for out-of-band wakeup-capable devices
      usb: chipidea: ci_hdrc_imx: Set out of band wakeup for i.MX95
      usb: dwc3: imx8mp: Set out of band wakeup for i.MX95

Stanimir Varbanov (2):
      dt-bindings: soc: bcm: Add bcm2712 compatible
      pmdomain: bcm: bcm2835-power: Prepare to support BCM2712

Thorsten Blum (1):
      cpuidle: psci: Replace deprecated strcpy in psci_idle_init_cpu

Ulf Hansson (5):
      pmdomain: Merge branch dt into next
      pmdomain: mediatek: Fix build-errors
      smp: Introduce a helper function to check for pending IPIs
      pmdomain: Extend the genpd governor for CPUs to account for IPIs
      pmdomain: Merge branch fixes into next

Xu Yang (1):
      usb: chipidea: core: detach power domain for ci_hdrc platform device

 .../bindings/power/mediatek,mt8196-gpufreq.yaml    |  117 +++
 .../bindings/power/mediatek,power-controller.yaml  |    4 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
 .../bindings/power/rockchip,power-controller.yaml  |    2 +
 .../bindings/soc/bcm/brcm,bcm2835-pm.yaml          |   38 +-
 drivers/amba/bus.c                                 |    9 +-
 drivers/base/power/main.c                          |    1 +
 drivers/cpuidle/cpuidle-psci.c                     |    4 +-
 drivers/pmdomain/bcm/bcm2835-power.c               |   17 +-
 drivers/pmdomain/core.c                            |    6 +-
 drivers/pmdomain/governor.c                        |   20 +-
 drivers/pmdomain/mediatek/Kconfig                  |   17 +
 drivers/pmdomain/mediatek/Makefile                 |    1 +
 drivers/pmdomain/mediatek/mt8196-pm-domains.h      |  625 ++++++++++++
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       | 1044 ++++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c         |  306 +++++-
 drivers/pmdomain/mediatek/mtk-pm-domains.h         |   49 +-
 drivers/pmdomain/qcom/rpmhpd.c                     |   28 +-
 drivers/pmdomain/rockchip/pm-domains.c             |   41 +
 drivers/usb/chipidea/ci_hdrc_imx.c                 |   11 +-
 drivers/usb/chipidea/core.c                        |    3 +
 drivers/usb/dwc3/dwc3-imx8mp.c                     |    9 +-
 include/dt-bindings/power/mediatek,mt8196-power.h  |   58 ++
 include/dt-bindings/power/qcom,rpmhpd.h            |    3 +
 .../power/rockchip,rv1126b-power-controller.h      |   17 +
 include/linux/pm.h                                 |    1 +
 include/linux/pm_wakeup.h                          |   17 +
 include/linux/smp.h                                |    5 +
 include/linux/usb/chipidea.h                       |    1 +
 kernel/smp.c                                       |   22 +
 30 files changed, 2417 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml
 create mode 100644 drivers/pmdomain/mediatek/mt8196-pm-domains.h
 create mode 100644 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
 create mode 100644 include/dt-bindings/power/mediatek,mt8196-power.h
 create mode 100644 include/dt-bindings/power/rockchip,rv1126b-power-controller.h

