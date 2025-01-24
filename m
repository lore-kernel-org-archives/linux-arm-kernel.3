Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBB1C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJ4WtcWb4pGQvvZfqyG6MRraoEe/+wFppxa1Noh1do8=; b=aRfkeF9ZO8eBjtciAd1YKTLdrF
	aupIdrmPHkdCDUXdoQ8S9NVHbowvp93/RbLMNnMEZMX4/LGULCFrlTuTmPAHRlnL/RodgW91yIVg6
	T84AjwsJaBtHD/M2clIKRKOHjQttf5u3i/wmeJPuFfcW4I9PyRV+TA463T621O6lGKZEw1ayFM4i/
	U7xy04Tm7iG3UzQdjvZ7tWYBXZUnvjmBOgaolwXcdR3k8bycHdhZfjCo4BGdQ+SwgDpYWlrkrTNam
	wsZQUA+k4Ft/hTUqwaGC6Q1zSmpdYnmy8DKTtiqSlGTrR2Qjdr7bR7TCUY0G7x55OHasRS84hMIVu
	9eqEcbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLLZ-0000000EvbG-4469;
	Fri, 24 Jan 2025 15:11:49 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLIy-0000000EvBv-3TdT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:09:10 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 23D5211401A4;
	Fri, 24 Jan 2025 10:09:08 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 24 Jan 2025 10:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737731348;
	 x=1737817748; bh=ZJ4WtcWb4pGQvvZfqyG6MRraoEe/+wFppxa1Noh1do8=; b=
	lfjw9NFqAAebimBslj45njcfoOL9yc9AcqOGdXddzqiSGzSKOGe6Qy/rrEZXnh1X
	t73DgOCIi2WDgSbN86oVcVQ5Hh+jq8PFf1H2U4tpHFDpiRFnEegI0/zW2HOdWCu5
	iruFFA1UFOliZL4F6+slpcNZofiqhdZ0p1h2m4gdHtxHqlyqhg7XXaPj5mqnfaag
	lGUeUUGmFEHuf1N8ZJAg6s51ToTHPuAvs1ruPOyn7We04tSA8F1T7Drw95lEmlYT
	C1FxAdHAzwaP+SzO2TvysQ/k9nH42+kBpNjXVMJ1hwV5rcC6umxFTPUniHMaQx48
	i8OKVZMl7UUmsiUyZcNEYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737731348; x=
	1737817748; bh=ZJ4WtcWb4pGQvvZfqyG6MRraoEe/+wFppxa1Noh1do8=; b=w
	L7taxRQgcnEdbvCEUx8nOxWd/A4rz+GTKepCyuTKjHVI8JdgzUNnPNtrE9KgB8Dr
	HXjre+MxixX2PV+REvo/vJlHk/fnV7LQXlwb+ybBrn9kyi2JjcjGVGNIU1RCZcQs
	2CbY8MgtlvWe+dC3iGxcI/dP3hOESALKtIyQZYqUpkXw0knR6/6VvB8aYeipsXjG
	XolhYzRnzQ1wVdHTjeu2RSG5qKV3XbnendxLVlQ57Zo2H2vFwNEdxL66PUAA3HIl
	UIaeMNuM3kEuU2AEmF8Bqn4byaJN7I6hK0BmVgN1+b6tC0E3Q1rQIy1Jlif2NOFg
	K2hteLSvWy3z7oEB2gIZA==
X-ME-Sender: <xms:E62TZ4rBzBP-9gbjt721ty4RdByw32qf2d8QQLyxAK8URsXdIF8rZA>
    <xme:E62TZ-p_PsNKUelhrdsIT5lzoW5ET3jacbrpLkLyi3ON4Haw36EugIQUbTvroiCjW
    MWr6VaqNpieCzuIJLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedggeekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeejueeluedtteehvefhhedvueeivdeugffghedv
    kedtgfdtheejudejieehleeuheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgih
    hthhhusgdrtghomhdplhhinhgrrhhordhorhhgpdhpvghnghhuthhrohhnihigrdguvgen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidrug
    gvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:E62TZ9MKoRfXbQNdBzP-n9AJIWJfhyL6nJg878v8M3t6wxDdc3ingQ>
    <xmx:E62TZ_6Zsvh7dhkhCllXRPCwmx7Fkds1A9kDVUTGMevUv_th7BB59A>
    <xmx:E62TZ36J0dBPHuFLYMScDcJ9jHDj9OHXm-4YyQXHQMbQLLmcz1jziA>
    <xmx:E62TZ_haza8c0Pk_eY7H9iCflFf2qogpYN7wa_O_42Cbs61OnegKPw>
    <xmx:FK2TZ5kneUgG-pHHbkjHSd1vMZCcyRailzZFVeqtRA1jyJ0Q8bHULB5h>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A53E92220072; Fri, 24 Jan 2025 10:09:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 16:08:27 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <d968434a-4b23-4b81-8610-6588590e9da1@app.fastmail.com>
In-Reply-To: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
Subject: [GIT PULL 4/5] soc: driver updates for 6.14
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_070909_027084_BBB5770D 
X-CRM114-Status: GOOD (  15.82  )
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

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.14

for you to fetch changes up to 9ec80025030b0492512e01e2e667f4111c583b46:

  Merge tag 'litex-6.13-rc1' of https://github.com/litex-hub/linux into soc/drivers (2025-01-22 14:35:25 +0100)

----------------------------------------------------------------
soc: driver updates for 6.14

These are changes to SoC specific drivers and DT bindings that don't have
a separate subsystem tree, or that get grouped here for simplicity.
Nothing out of the ordinary for the 6.14 release here:

 - Most of the updates are for Qualcomm specific drivers, adding support
   for additional SoCs in the exssting drivers, and support for wrapped
   encryption key access in the SCM firmware.

 - The Arm SCMI firmware code gains support for having multiple
   instances of firmware running, and better module auto loading.

 - A few minor updates for litex, samsung, ti, tegra, mediatek, imx and
   renesas platforms.

 - Reset controller updates for amlogic, to add support for the A1 soc
   and clean up the existing code.

 - Memory controller updates for ti davinci aemif, refactoring the code
   and adding a few interfaces to other drivers.

----------------------------------------------------------------
Andrew Davis (1):
      drivers/soc/litex: Use devm_register_restart_handler()

Arnd Bergmann (13):
      Merge tag 'renesas-drivers-for-v6.14-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'optee-for-v6.14' of https://git.linaro.org/people/jens.wiklander/linux-tee into soc/drivers
      Merge tag 'memory-controller-drv-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'memory-controller-drv-ti-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'scmi-updates-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into soc/drivers
      Merge tag 'imx-drivers-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into soc/drivers
      Merge tag 'mtk-soc-for-v6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux into soc/drivers
      Merge tag 'tegra-for-6.14-soc' of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'ti-k3-maintainer-for-v6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/drivers
      Merge tag 'qcom-drivers-for-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'samsung-drivers-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/drivers
      Merge tag 'reset-for-v6.14-2' of git://git.pengutronix.de/pza/linux into soc/drivers
      Merge tag 'litex-6.13-rc1' of https://github.com/litex-hub/linux into soc/drivers

Bartosz Golaszewski (2):
      soc: qcom: rmtfs: allow building the module with COMPILE_TEST=y
      soc: qcom: rmtfs: constify rmtfs_class

Bastien Curutchet (6):
      memory: ti-aemif: Store timings parameter in number of cycles - 1
      memory: ti-aemif: Remove unnecessary local variables
      memory: ti-aemif: Wrap CS timings into a struct
      memory: ti-aemif: Create aemif_check_cs_timings()
      memory: ti-aemif: Create aemif_set_cs_timings()
      memory: ti-aemif: Export aemif_*_cs_timings()

Biju Das (1):
      soc: renesas: Add RZ/G3E (R9A09G047) config option

Cristian Marussi (4):
      firmware: arm_scmi: Allow transport properties for multiple instances
      firmware: arm_scmi: Support vendor protocol modules autoloading
      firmware: arm_scmi: Add module aliases to i.MX vendor protocols
      firmware: arm_scmi: Add aliases to transport modules

Dr. David Alan Gilbert (1):
      memory: omap-gpmc: deadcode a pair of functions

Eugen Hristev (1):
      soc: qcom: Rework BCM_TCS_CMD macro

Gaurav Kashyap (1):
      firmware: qcom: scm: add calls for wrapped key support

Ivaylo Ivanov (1):
      dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos8895

Jan Dakinevich (2):
      dt-bindings: reset: add bindings for A1 SoC audio reset controller
      reset: amlogic: add support for A1 SoC in auxiliary reset driver

Jens Glathe (2):
      firmware: qcom: scm: Allow QSEECOM for HP Omnibook X14
      firmware: qcom: scm: Allow QSEECOM for Windows Dev Kit 2023

Jerome Brunet (3):
      clk: amlogic: axg-audio: revert reset implementation
      reset: amlogic: aux: get regmap through parent device
      reset: amlogic: aux: drop aux registration helper

Joe Hattori (1):
      memory: tegra20-emc: fix an OF node reference bug in tegra_emc_find_node_by_ram_code()

Johan Hovold (1):
      Revert "clk: Fix invalid execution of clk_set_rate"

Kartik Rajput (1):
      soc/tegra: fuse: Update Tegra234 nvmem keepout list

Konrad Dybcio (3):
      soc: qcom: pd-mapper: Add X1P42100
      firmware: qcom: scm: Allow QSEECOM on X1P42100 CRD
      soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1

Krzysztof Kozlowski (13):
      soc: qcom: pmic_glink: simplify locking with guard()
      soc: qcom: smem_state: fix missing of_node_put in error path
      soc: qcom: pmic_glink_altmode: simplify locking with guard()
      dt-bindings: samsung: exynos-usi: Restrict possible samsung,mode values
      soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic()
      firmware: qcom: scm: Fix missing read barrier in qcom_scm_is_available()
      firmware: qcom: scm: Fix missing read barrier in qcom_scm_get_tzmem_pool()
      firmware: qcom: scm: Cleanup global '__scm' on probe failures
      firmware: qcom: scm: smc: Handle missing SCM device
      firmware: qcom: scm: smc: Narrow 'mempool' variable scope
      soc: mediatek: mtk-devapc: Fix leaking IO map on error paths
      soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove
      soc/tegra: cbb: Drop unnecessary debugfs error handling

Kyle Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the qcs615

Lijuan Gao (1):
      dt-bindings: interconnect: qcom-bwmon: Document QCS615 bwmon compatibles

Luca Weiss (1):
      soc: qcom: pd_mapper: Add SM7225 compatible

MD Danish Anwar (1):
      MAINTAINERS: Add entry for linux/pruss_driver.h

Manikanta Mylavarapu (1):
      dt-bindings: firmware: qcom,scm: Document ipq5424 SCM

Maud Spierings (1):
      firmware: qcom: scm: Allow QSEECOM on the asus vivobook s15

Pengyu Luo (1):
      firmware: qcom: scm: Allow QSEECOM on Huawei Matebook E Go (sc8280xp)

Qingqing Zhou (1):
      dt-bindings: firmware: qcom,scm: document QCS615 SCM

Sahil Malhotra (1):
      optee: fix format string for printing optee build_id

Stephan Gerhold (1):
      soc: qcom: socinfo: Avoid out of bounds read of serial number

Varadarajan Narayanan (2):
      dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
      soc: qcom: llcc: Update configuration data for IPQ5424

Wasim Nazir (2):
      dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
      soc: qcom: socinfo: add QCS9075 SoC ID

alice.guo (1):
      soc: imx: Add SoC device register for i.MX9

liujing (1):
      soc/tegra: Fix spelling error in tegra234_lookup_slave_timeout()

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  20 +-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   2 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   2 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../bindings/soc/samsung/exynos-usi.yaml           |   1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   8 +
 MAINTAINERS                                        |   1 +
 drivers/clk/clk.c                                  |   2 +-
 drivers/clk/meson/Kconfig                          |   2 +-
 drivers/clk/meson/axg-audio.c                      | 109 ++++++++-
 drivers/firmware/arm_scmi/common.h                 |   4 +-
 drivers/firmware/arm_scmi/driver.c                 |  74 ++++--
 drivers/firmware/arm_scmi/transports/mailbox.c     |   1 +
 drivers/firmware/arm_scmi/transports/smc.c         |   1 +
 drivers/firmware/arm_scmi/transports/virtio.c      |   1 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c |   5 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |   5 +-
 drivers/firmware/qcom/qcom_scm-smc.c               |   6 +-
 drivers/firmware/qcom/qcom_scm.c                   | 271 +++++++++++++++++++--
 drivers/firmware/qcom/qcom_scm.h                   |   4 +
 drivers/memory/omap-gpmc.c                         |  33 +--
 drivers/memory/tegra/tegra20-emc.c                 |   8 +-
 drivers/memory/ti-aemif.c                          | 192 +++++++++------
 drivers/reset/amlogic/reset-meson-aux.c            |  97 ++------
 drivers/soc/imx/Makefile                           |   2 +-
 drivers/soc/imx/soc-imx9.c                         | 128 ++++++++++
 drivers/soc/litex/litex_soc_ctrl.c                 |  23 +-
 drivers/soc/mediatek/mtk-devapc.c                  |  19 +-
 drivers/soc/qcom/Kconfig                           |   2 +-
 drivers/soc/qcom/llcc-qcom.c                       |  58 ++++-
 drivers/soc/qcom/pmic_glink.c                      |  70 +++---
 drivers/soc/qcom/pmic_glink_altmode.c              |  11 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |   2 +
 drivers/soc/qcom/rmtfs_mem.c                       |   2 +-
 drivers/soc/qcom/smem_state.c                      |   3 +-
 drivers/soc/qcom/socinfo.c                         |   3 +-
 drivers/soc/renesas/Kconfig                        |   5 +
 drivers/soc/samsung/exynos-pmu.c                   |   2 +-
 drivers/soc/tegra/cbb/tegra-cbb.c                  |  20 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c               |   2 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c              |  17 +-
 drivers/tee/optee/smc_abi.c                        |   5 +-
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 .../reset/amlogic,meson-a1-audio-reset.h           |  36 +++
 include/linux/firmware/qcom/qcom_scm.h             |   8 +
 include/linux/memory/ti-aemif.h                    |  32 +++
 include/linux/omap-gpmc.h                          |   4 -
 include/linux/scmi_imx_protocol.h                  |   9 +-
 include/soc/amlogic/reset-meson-aux.h              |  23 --
 include/soc/qcom/tcs.h                             |  26 +-
 50 files changed, 978 insertions(+), 385 deletions(-)
 create mode 100644 drivers/soc/imx/soc-imx9.c
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
 create mode 100644 include/linux/memory/ti-aemif.h
 delete mode 100644 include/soc/amlogic/reset-meson-aux.h

