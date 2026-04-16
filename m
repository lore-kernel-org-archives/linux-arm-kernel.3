Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C3BF8DFD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 22:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxNAp0GqfZ7LtbiOQAy5YHLPvic8ViXV/zh5m6GPfH8=; b=EMDKcREFW7IuQvN3u8r7l4gcPs
	3W529eMbLLzjKJLi5kiodWCzESWOyEKkSg1Eq3nNp6wJBxyJzS/WwWa+iio2i6svRxqHPW1EmtHR9
	dJI0ji4YGX2Qa1VdpxgH10apCNcrTJhwdXvEOhKFIUWgul0upC1TRYyDtmTN9XCaAgxQvCoXXVjnQ
	CYpuj2p8cwh/FWZuo+GvYVx1X8KVRhegBzxtMj5l2wHnFt6g9ljzuqeqUzT8aunxoCAiqEnTcytcO
	f5WNWiQ/ZjlE5q6O0Qb0b2S0c9i2DAYil06bglKm7klJTHSboev62eE5thFLLpEfY60de7kiS0bL3
	kbI4E1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDVCv-000000038gh-3j5l;
	Thu, 16 Apr 2026 22:29:09 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDVCs-000000038gM-2MoL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 22:29:08 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C0E9E1D0016E;
	Thu, 16 Apr 2026 18:29:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 16 Apr 2026 18:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776378545;
	 x=1776464945; bh=zxNAp0GqfZ7LtbiOQAy5YHLPvic8ViXV/zh5m6GPfH8=; b=
	XK+sRQifAQWZcOdLmvLFcfTCCKnSJdUpLC+0vlGL3Nlshcp9pGYnNBxkYiuyBkmX
	zTthd4ghZhz61T4NYB0Zp014Ir5oq9aayiZxNgNQI6cNIR9kKQaHDjJP0FvVm1RL
	vlhpuEQmScORtrs/u+ajXwxGN8AZoLpeWB1HLjy1tEs+MX2Rc+Uvz7IoD5T8rio0
	SWMewExp5VVwahv3FcIEXw9lySWDibQ4vnmPcQNWe1UYkjv3R0lntfZFzcJYa2zC
	C8UgQn6ne7lkl7RXrTIgAwSsJLefZtdXaWx8uAys5/dHRKYRfCDtP5aaseEBCfTW
	nikMNRkamw6Tq+rziT5Ayg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776378545; x=
	1776464945; bh=zxNAp0GqfZ7LtbiOQAy5YHLPvic8ViXV/zh5m6GPfH8=; b=U
	pzpM5oWbO1m8UAdNewnq5vzIxSyJ4ahvk72bNXjt5CVFEAEaQ9SvNrY+8mwLZEYo
	Xhm/KieQsothAc87RO0SaSZHHkvWkv3mWUcblyvgmz/fdB62LSHMhq95zLKfTj8D
	IXRiFvXKrNkB0UqvMdtfP5TQ8K1iG/LitdWQrcioGB2QqREheyqh+pe/fE7rM5rE
	55XYfPAyrOU7TpQtN6i66rH4P8CIOu0T1ji9982EG3+9MJvLkCgR7kI3poWz/qUa
	uBISLjq82eB6SJ2GwEqTFxWwsnstjZC5VCPGAFlQfAziwHiGpkVo912N2yopATfT
	qVKeus05PbaOqlmZjMcOQ==
X-ME-Sender: <xms:sWLhaZaMXk45l6MNHmpw01pDoI8G-wisOes9KzgLpljsg0k4AwUXCA>
    <xme:sWLhabNzZ9rvxtmMji3rofjwjRXc89FTRxIDBfL5hMzKIxw0a2b4FwwIlk9Mu9teW
    HBiVL0Mw4d74Dpz490m9DgSAQzCMAjacS9kmT_ccPS_vorpdteK9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegkedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeukeeiheeijeevveeghffghedvjeettdejffejffeuffffkefhleejgfduffefffen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpfhhrrghnkh
    drlhhipdhpvghnghhuthhrohhnihigrdguvgenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtph
    htthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgushes
    lhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrg
    hrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    ohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:sWLhaTGqxmICYEhKT4X_5wPgIxLaMqq2Q8kc_MV9nVXaOMIUFNIigg>
    <xmx:sWLhaXNj1wlOCsqf4MoQ7GJ2-Wcr_sfhRBTiCAmMpE76z0gs5-U71A>
    <xmx:sWLhadc8Jb9cGA72CRQn_uTQV01XvKVj9hW_GSA9drcd69wVurPkHw>
    <xmx:sWLhacs7WeWMuB98-zzaGrIpYmC3ntcFqXUocJoBMADhgrsggHnWjQ>
    <xmx:sWLhaeeZdqiZ5NJ5HKM4DTdKAdCJQpQZIoO-PZ_a4OxUMk9OxYtKd4x8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4FEAE700065; Thu, 16 Apr 2026 18:29:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 17 Apr 2026 00:28:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <d80b4370-3d20-4d7c-b91f-455797c52b39@app.fastmail.com>
In-Reply-To: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com>
Subject: Re: [GIT PULL 2/4] soc: drivers for 7.1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_152906_705918_D20DD006 
X-CRM114-Status: GOOD (  15.55  )
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

The following changes since commit a0e0c2f8c5f32b675f58e25a9338283cedb5a=
d2b:

  reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:=
47 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
rivers-7.1

for you to fetch changes up to 33a20cdaf41d08a66581cc01a60c1a3d596ba9cd:

  Merge tag 'ffa-fix-7.1' of https://git.kernel.org/pub/scm/linux/kernel=
/git/sudeep.holla/linux into soc/drivers (2026-04-11 10:48:50 +0200)

----------------------------------------------------------------
soc: drivers for 7.1

The driver updates again are all over the place with many minor fixes
going into platform specific code. The most notable changes are:

 - Support for Microchip pic64gx system controllers
 - Work on cleaning up devicetree bindings for SoC drivers, and
   converting them into the new format
 - Lots of smaller changes for Qualcomm SoC drivers, including support
   for a number of newly supported chips
 - reset controller API cleanups and a new driver for Cix Sky1
 - Reworks of the Tegra PMC and CBB drivers, along with a change
   to how individual Tegra SoCs get selected in Kconfig and
   BPMP firmware driver updates including a refresh of the ABI
   header to match the version used by firmware
 - STM32 updates to the firewall bus driver and support for
   the debug bus through OP-TEE
 - SCMI firmware driver improvements for reliability, in particular
   for dealing with broken firmware interrupts
 - Memory driver updates for Tegra, and a patch to remove the
   unused Baikal T1 driver

----------------------------------------------------------------
Abel Vesa (3):
      soc: qcom: socinfo: Add PM7550BA PMIC
      dt-bindings: firmware: qcom,scm: document Eliza SCM Firmware Inter=
face
      soc: qcom: pd-mapper: Add support for Eliza

Aelin Reidel (2):
      dt-bindings: arm: qcom,ids: Add SoC IDs for SM7450 and SM7450P
      soc: qcom: socinfo: Add SoC IDs for SM7450 and SM7450P

Akhila YS (5):
      dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
      dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
      dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema

Alexander Stein (2):
      dt-bindings: arm: fsl: add bindings for TQMa8x
      MAINTAINERS: Add i.MX team to all arm NXP platforms

Alok Tiwari (2):
      soc: qcom: llcc: fix v1 SB syndrome register offset
      soc: qcom: aoss: compare against normalized cooling state

Andrew Davis (6):
      reset: ath79: Use devm_register_restart_handler()
      reset: intel: Use devm_register_restart_handler()
      reset: lpc18xx: Use devm_register_sys_off_handler()
      reset: ma35d1: Use devm_register_sys_off_handler()
      reset: npcm: Use devm_register_sys_off_handler()
      reset: sunplus: Use devm_register_sys_off_handler()

Andr=C3=A9 Draszik (1):
      dt-bindings: firmware: google,gs101-acpm-ipc: add S2MPG11 secondar=
y PMIC

Andy Shevchenko (2):
      memory: bt1-l2-ctl: Remove not-going-to-be-supported code for Baik=
al SoC
      dt-bindings: cache: bt1-l2-ctl: Remove unused bindings

Anjelique Melendez (3):
      dt-bindings: soc: qcom: qcom,pmic-glink: Add Glymur and Kaanapali =
compatibles
      soc: qcom: pmic_glink: Add charger PDR service information to clie=
nt data
      soc: qcom: pmic_glink: Add support for Glymur and Kaanapali

Arnd Bergmann (14):
      Merge tag 'samsung-drivers-7.1' of https://git.kernel.org/pub/scm/=
linux/kernel/git/krzk/linux into soc/drivers
      Merge tag 'memory-controller-drv-7.1' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'scmi-updates-7.1' of git://git.kernel.org/pub/scm/linux=
/kernel/git/sudeep.holla/linux into soc/drivers
      Merge tag 'stm32-bus-firewall-for-7.1-1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/atorgue/stm32 into soc/drivers
      Merge tag 'hisi-drivers-for-7.1' of https://github.com/hisilicon/l=
inux-hisi into soc/drivers
      Merge tag 'tee-for-v7.1' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'optee-for-v7.1' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'renesas-drivers-for-v7.1-tag2' of git://git.kernel.org/=
pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'imx-soc-7.1' of git://git.kernel.org/pub/scm/linux/kern=
el/git/frank.li/linux into soc/drivers
      Merge tag 'tegra-for-7.1-soc' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/tegra/linux into soc/drivers
      Merge tag 'tegra-for-7.1-firmware' of git://git.kernel.org/pub/scm=
/linux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'imx-bindings-7.1' of git://git.kernel.org/pub/scm/linux=
/kernel/git/frank.li/linux into soc/drivers
      Merge tag 'reset-for-v7.1' of https://git.pengutronix.de/git/pza/l=
inux into soc/drivers
      Merge tag 'qcom-drivers-for-7.1' of https://git.kernel.org/pub/scm=
/linux/kernel/git/qcom/linux into soc/drivers

Bartosz Golaszewski (15):
      reset: gpio: remove unneeded OF-node put
      reset: gpio: add a devlink between reset-gpio and its consumer
      reset: gpio: simplify fallback device matching
      reset: gpio: remove unneeded auxiliary_set_drvdata()
      reset: warn on reset-gpio release
      reset: fold ida_alloc() into reset_create_gpio_aux_device()
      reset: use lock guards in reset core
      reset: handle removing supplier before consumers
      reset: protect struct reset_controller_dev with its own mutex
      reset: protect struct reset_control with its own mutex
      reset: convert of_reset_control_get_count() to using firmware nodes
      reset: convert the core API to using firmware nodes
      reset: convert reset core to using firmware nodes
      reset: gpio: make the driver fwnode-agnostic
      reset: don't overwrite fwnode_reset_n_cells

Biju Das (3):
      dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM=
 and Carrier-II EVK
      dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC
      soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC

Bjorn Andersson (3):
      Merge branch '20260309230346.3584252-2-daniel.lezcano@oss.qualcomm=
.com' into drivers-for-7.1
      Merge branch '20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.co=
m' into drivers-for-7.1
      firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X

Chris Lew (2):
      soc: qcom: smp2p: Add irqchip state support
      soc: qcom: smp2p: Add support for smp2p v2

Ciprian Marian Costea (2):
      dt-bindings: interrupt-controller: fsl,irqsteer: add S32N79 support
      dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB board

Claudiu Beznea (1):
      reset: core: Drop unnecessary double quote

Cl=C3=A9ment Le Goffic (1):
      bus: firewall: move stm32_firewall header file in include folder

Conor Dooley (4):
      dt-bindings: soc: microchip: add compatible for the mss-top-sysreg=
 on pic64gx
      gpio: mpfs: Add interrupt support
      dt-bindings: soc: microchip: document PolarFire SoC's gpio interru=
pt mux
      soc: microchip: add mpfs gpio interrupt mux driver

Daniel Lezcano (3):
      soc: qcom: qmi: Enumerate the service IDs of QMI
      soc: qcom: pdr: Use the unified QMI service ID instead of defining=
 it locally
      samples: qmi: Use the unified QMI service ID instead of defining i=
t locally

Dmitry Baryshkov (6):
      soc: qcom: ubwc: disable bank swizzling for Glymur platform
      soc: qcom: ocmem: make the core clock optional
      soc: qcom: ocmem: register reasons for probe deferrals
      soc: qcom: ocmem: return -EPROBE_DEFER is ocmem is not available
      soc: qcom: ubwc: add helper to get min_acc length
      soc: qcom: ubwc: add helpers to get programmable values

Ernest Van Hoecke (1):
      dt-bindings: arm: fsl: add Verdin iMX95

Florian Fainelli (1):
      memory: brcmstb_memc: Expand LPDDR4 check to cover for LPDDR5

Frank Li (1):
      dt-bindings: arm: lpc: add missed lpc43xx board

Gary Yang (2):
      dt-bindings: soc: cix: document the syscon on Sky1 SoC
      reset: add Sky1 soc reset support

Gatien Chevallier (8):
      bus: rifsc: fix RIF configuration check for peripherals
      dt-bindings: document access-controllers property for coresight pe=
ripherals
      dt-bindings: pinctrl: document access-controllers property for stm=
32 HDP
      dt-bindings: bus: document the stm32 debug bus
      bus: stm32_firewall: allow check on different firewall controllers
      bus: stm32_firewall: add stm32_firewall_get_grant_all_access() API
      drivers: bus: add the stm32 debug bus driver
      pinctrl: stm32: add firewall checks before probing the HDP driver

Geert Uytterhoeven (1):
      firmware: arm_scmi: Support loop control in quirk code snippets

Gopikrishna Garmidi (2):
      soc: qcom: ubwc: Add support for Mahua
      firmware: qcom: scm: Allow QSEECOM on Mahua CRD

Haoxiang Li (1):
      clk: spear: fix resource leak in clk_register_vco_pll()

Hrishabh Rajput (1):
      firmware: qcom: scm: Register gunyah watchdog device

Huisong Li (2):
      soc: hisilicon: kunpeng_hccs: Fix discard =E2=80=98const=E2=80=99 =
qualifier compiling warning
      soc: hisilicon: kunpeng_hccs: Remove unused input parameter

Jens Glathe (1):
      firmware: qcom: scm: allow QSEECOM on ASUS Vivobook X1P42100 varia=
nt

Jon Hunter (10):
      soc/tegra: pmc: Add kerneldoc for reboot notifier
      soc/tegra: pmc: Correct function names in kerneldoc
      soc/tegra: pmc: Add kerneldoc for wake-up variables
      soc/tegra: pmc: Remove unused AOWAKE definitions
      soc/tegra: pmc: Add support for SoC specific AOWAKE offsets
      soc/tegra: pmc: Add AOWAKE regs for Tegra264
      soc/tegra: pmc: Add Tegra264 wake events
      soc/tegra: pmc: Refactor IO pad voltage control
      soc/tegra: pmc: Rename has_impl_33v_pwr flag
      soc/tegra: pmc: Add IO pads for Tegra264

Josua Mayer (1):
      dt-bindings: arm: fsl: Add various solidrun i.MX8M boards

Kathiravan Thirumoorthy (4):
      dt-bindings: arm: qcom,ids: add SOC IDs for IPQ5210 family
      soc: qcom: socinfo: add SoC ID for IPQ5210 family
      dt-bindings: firmware: qcom,scm: Document ipq5210 SCM
      dt-bindings: firmware: qcom,scm: Document ipq9650 SCM

Ketan Patil (6):
      memory: tegra: Group error handling related registers
      memory: tegra: Group register and fields
      memory: tegra: Add support for multiple IRQs
      memory: tegra: Group SoC specific fields
      memory: tegra: Prepare for supporting multiple intmask registers
      memory: tegra: Add MC error logging support for Tegra264

Krzysztof Kozlowski (24):
      firmware: exynos-acpm: Use unsigned int for acpm_pmic_linux_errmap=
 index
      firmware: exynos-acpm: Count number of commands in acpm_xfer
      firmware: exynos-acpm: Count acpm_xfer buffers with __counted_by_p=
tr
      firmware: exynos-acpm: Drop fake 'const' on handle pointer
      dt-bindings: arm: qcom,ids: Add SoC ID for CQ7790
      soc: qcom: socinfo: Add SoC ID for CQ7790
      memory: renesas-rpc-if: Simplify printing PTR_ERR with dev_err_pro=
be
      memory: tegra-mc: Drop tegra_mc_setup_latency_allowance() return v=
alue
      memory: tegra-mc: Simplify printing PTR_ERR with dev_err_probe
      memory: tegra-mc: Use %pe format
      Merge tag 'renesas-drivers-for-v7.1-tag1' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'renesas-dt-bindings-for-v7.1-tag1' of https://git.kerne=
l.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      firmware: qcom: uefisecapp: Simplify mutex with guard
      firmware: qcom: uefisecapp: Annotate acquiring locks for context t=
racking
      firmware: qcom: scom: Simplify mutex with guard
      soc/tegra: Make ARCH_TEGRA_SOC_FOO defaults for NVIDIA Tegra
      bus: stm32_firewall: Simplify with scoped for each OF child loop
      soc: qcom: ubwc: Remove redundant x1e80100_data
      soc: qcom: ubwc: Add configuration Eliza SoC
      Merge tag 'tegra-for-7.1-dt-bindings' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'at91-soc-7.1' of ssh://gitolite.kernel.org/pub/scm/linu=
x/kernel/git/at91/linux into soc/drivers
      Merge tag 'riscv-soc-drivers-for-v7.1' of ssh://gitolite.kernel.or=
g/pub/scm/linux/kernel/git/conor/linux into soc/drivers
      Merge tag 'qcom-drivers-for-7.1-2' of ssh://gitolite.kernel.org/pu=
b/scm/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'ffa-fix-7.1' of https://git.kernel.org/pub/scm/linux/ke=
rnel/git/sudeep.holla/linux into soc/drivers

Lad Prabhakar (3):
      soc: renesas: r9a09g057-sys: Mark rzv2h_sys_init_data as __initcon=
st
      soc: renesas: r9a09g047-sys: Mark rzg3e_sys_init_data as __initcon=
st
      soc: renesas: r9a09g056-sys: Mark rzv2n_sys_init_data as __initcon=
st

Le Qi (1):
      soc: qcom: pd-mapper: Add QCS615 power domain mappings

Lei wang (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
      soc: qcom: socinfo: Add SoC ID for SA8650P

Liu Ying (1):
      dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema=
 and example

Luca Weiss (1):
      soc: qcom: pd-mapper: Add Milos compatible

Marek Vasut (2):
      dt-bindings: firmware: arm,scmi: Document arm,no-completion-irq pr=
operty
      firmware: arm_scmi: Implement arm,no-completion-irq property

Markus Niebel (1):
      dt-bindings: arm: add bindings for TQMa95xxLA

Martin Schmiedel (1):
      dt-bindings: arm: fsl: add MBa93xxLA-MINI

Maud Spierings (1):
      dt-bindings: arm: fsl: Add GOcontroll Moduline IV/Mini

Mikko Perttunen (2):
      memory: tegra124-emc: Fix dll_change check
      memory: tegra30-emc: Fix dll_change check

Mukesh Ojha (1):
      firmware: qcom_scm: don't opencode kmemdup

Pankaj Patil (1):
      firmware: qcom: scm: Allow QSEECOM on Glymur CRD

Peng Fan (2):
      firmware: arm_scmi: Use round_up() for base protocol list size cal=
culation
      dt-bindings: fsl: imx7ulp-smc1: Add #clock-cells property

Philipp Zabel (2):
      reset: core: Fix indentation
      Merge tag 'reset-fixes-for-v7.0-2' into reset/next

Pierre-Henry Moussay (2):
      dt-bindings: soc: microchip: mpfs-sys-controller: Add pic64gx comp=
atibility
      soc: microchip: mpfs-sys-controller: add support for pic64gx

Randy Dunlap (1):
      tee: clean up tee_core.h kernel-doc

Richard Acayan (2):
      dt-bindings: cache: qcom,llcc: Add SDM670 compatible
      soc: qcom: llcc: Add configuration data for SDM670

Rosen Penev (2):
      reset: sti: kzalloc + kcalloc to kzalloc
      soc: qcom: wcnss: simplify allocation of req

Rouven Czerwinski (1):
      optee: simplify OP-TEE context match

Sebastian Ene (1):
      firmware: arm_ffa: Use the correct buffer size during RXTX_MAP

Shengjiu Wang (2):
      bus: imx-aipstz: set default value for opacr registers
      dt-bindings: arm: fsl: Add compatible for i.MX8MP audio board (ver=
sion 2)

Sherry Sun (1):
      dt-bindings: arm: fsl: Add i.MX93 Wireless EVK board

Srinivas Kandagatla (1):
      soc: qcom: pd-mapper: Add support for Glymur and Mahua

Stefano Radaelli (2):
      dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
      dt-bindings: arm: fsl: add Variscite DART-MX91 Boards

Sumit Gupta (5):
      soc/tegra: cbb: Add support for CBB fabrics in Tegra238
      soc/tegra: cbb: Set ERD on resume for err interrupt
      soc/tegra: cbb: Fix incorrect ARRAY_SIZE in fabric lookup tables
      soc/tegra: cbb: Fix cross-fabric target timeout lookup
      dt-bindings: arm: tegra: Add Tegra238 CBB compatible strings

Svyatoslav Ryhel (3):
      dt-bindings: display: tegra: Document Tegra20 HDMI port
      soc/tegra: pmc: Enable core domain support for Tegra114
      soc/tegra: common: Add Tegra114 support to devm_tegra_core_dev_ini=
t_opp_table

Thierry Reding (16):
      memory: tegra: Add support for DBB clock on Tegra264
      firmware: tegra: bpmp: Rename Tegra239 to Tegra238
      soc/tegra: Add Tegra238 Kconfig symbol
      soc/tegra: Update BPMP ABI header
      firmware: tegra: bpmp: Add tegra_bpmp_get_with_id() function
      dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
      dt-bindings: phy: tegra-xusb: Document Type C support
      dt-bindings: clock: tegra124-dfll: Convert to json-schema
      dt-bindings: interrupt-controller: tegra: Fix reg entries
      dt-bindings: arm: tegra: Add missing compatible strings
      dt-bindings: phy: tegra: Document Tegra210 USB PHY
      dt-bindings: memory: Add Tegra210 memory controller bindings
      dt-bindings: memory: tegra210: Mark EMC as cooling device
      soc/tegra: bpmp: Use ENODEV instead of ENOTSUPP
      dt-bindings: arm: tegra: Document Jetson AGX Thor DevKit
      MAINTAINERS: Change email address for Thierry Reding

Thorsten Blum (1):
      bus: rifsc: Replace snprintf("%s") with strscpy

Tommaso Merciai (5):
      reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device lif=
etime
      dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' =
property
      dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY=
 reset
      reset: rzv2h-usb2phy: Convert to regmap API
      reset: rzv2h-usb2phy: Add support for VBUS mux controller registra=
tion

Unnathi Chalicheemala (2):
      soc: qcom: llcc: Add per-slice counter and common llcc slice descr=
iptor
      soc: qcom: llcc: Use guards for mutex handling

Val Packett (1):
      firmware: qcom: scm: Allow QSEECOM on ECS LIVA QC710

Vladimir Zapolskiy (1):
      soc: qcom: pd-mapper: Simplify code using of_root to get root devi=
ce tree node

Yanan Yang (1):
      dt-bindings: arm: fsl: Add FRDM-IMX91S board

Yijie Yang (1):
      firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK

 .../devicetree/bindings/arm/arm,coresight-cti.yaml |    3 +
 .../bindings/arm/arm,coresight-dynamic-funnel.yaml |    3 +
 .../devicetree/bindings/arm/arm,coresight-etm.yaml |    3 +
 .../devicetree/bindings/arm/arm,coresight-stm.yaml |    3 +
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |    3 +
 .../bindings/arm/arm,coresight-tpiu.yaml           |    3 +
 .../bindings/arm/atmel,at91rm9200-sdramc.yaml      |   66 +
 .../bindings/arm/atmel,at91rm9200-st.yaml          |   69 +
 .../bindings/arm/atmel,at91sam9260-pit.yaml        |   49 +
 .../devicetree/bindings/arm/atmel-sysregs.txt      |   48 -
 .../bindings/arm/freescale/fsl,imx7ulp-pm.yaml     |    5 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |   86 +
 .../bindings/arm/microchip,sam9x60-pit64b.yaml     |   68 +
 .../bindings/arm/microchip,sama7g5-chipid.yaml     |   41 +
 .../devicetree/bindings/arm/nxp/lpc32xx.yaml       |   22 +
 Documentation/devicetree/bindings/arm/tegra.yaml   |   56 +-
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |    4 +
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        |   76 +
 .../bindings/cache/baikal,bt1-l2-ctl.yaml          |   63 -
 .../devicetree/bindings/cache/qcom,llcc.yaml       |    2 +
 .../bindings/clock/nvidia,tegra124-dfll.txt        |  155 -
 .../bindings/clock/nvidia,tegra124-dfll.yaml       |  290 ++
 .../display/tegra/nvidia,tegra20-hdmi.yaml         |   13 +-
 .../devicetree/bindings/firmware/arm,scmi.yaml     |   10 +
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |   50 +-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    4 +
 .../interrupt-controller/fsl,irqsteer.yaml         |    4 +-
 .../interrupt-controller/nvidia,tegra20-ictlr.yaml |   23 +-
 .../memory-controllers/nvidia,tegra210-emc.yaml    |    6 +-
 .../memory-controllers/nvidia,tegra210-mc.yaml     |   77 +
 .../bindings/pci/nvidia,tegra264-pcie.yaml         |  149 +
 .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  |   39 +-
 .../bindings/phy/nvidia,tegra20-usb-phy.yaml       |    1 +
 .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  |    6 +
 .../reset/renesas,rzv2h-usb2phy-reset.yaml         |    9 +-
 .../bindings/soc/cix/cix,sky1-system-control.yaml  |   42 +
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |   78 +
 .../soc/microchip/microchip,mpfs-irqmux.yaml       |  103 +
 .../microchip/microchip,mpfs-mss-top-sysreg.yaml   |   18 +-
 .../microchip/microchip,mpfs-sys-controller.yaml   |    4 +-
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |    2 +
 .../bindings/soc/renesas/renesas,rzg2l-sysc.yaml   |    1 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |   13 +
 Documentation/driver-api/reset.rst                 |    1 -
 MAINTAINERS                                        |   20 +-
 drivers/bus/Kconfig                                |   10 +
 drivers/bus/Makefile                               |    1 +
 drivers/bus/imx-aipstz.c                           |   15 +
 drivers/bus/stm32_dbg_bus.c                        |  250 ++
 drivers/bus/stm32_etzpc.c                          |    3 +-
 drivers/bus/stm32_firewall.c                       |   59 +-
 drivers/bus/stm32_rifsc.c                          |   61 +-
 drivers/clk/samsung/clk-acpm.c                     |    4 +-
 drivers/clk/spear/clk-vco-pll.c                    |    4 +-
 drivers/firmware/arm_ffa/driver.c                  |    2 +-
 drivers/firmware/arm_scmi/base.c                   |    4 +-
 drivers/firmware/arm_scmi/common.h                 |    4 +
 drivers/firmware/arm_scmi/driver.c                 |    4 +
 drivers/firmware/arm_scmi/quirks.h                 |    8 +-
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c    |    9 +-
 drivers/firmware/qcom/qcom_scm.c                   |   71 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |   13 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |    4 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        |   26 +-
 drivers/firmware/samsung/exynos-acpm-pmic.h        |   10 +-
 drivers/firmware/samsung/exynos-acpm.c             |   30 +-
 drivers/firmware/samsung/exynos-acpm.h             |   10 +-
 drivers/firmware/tegra/bpmp.c                      |   34 +
 drivers/gpio/Kconfig                               |    1 +
 drivers/gpio/gpio-mpfs.c                           |  122 +-
 drivers/memory/Kconfig                             |   11 -
 drivers/memory/Makefile                            |    1 -
 drivers/memory/brcmstb_memc.c                      |    8 +-
 drivers/memory/bt1-l2-ctl.c                        |  323 --
 drivers/memory/renesas-rpc-if.c                    |    8 +-
 drivers/memory/tegra/mc.c                          |  135 +-
 drivers/memory/tegra/mc.h                          |  153 +-
 drivers/memory/tegra/tegra114.c                    |   18 +-
 drivers/memory/tegra/tegra124-emc.c                |    2 +-
 drivers/memory/tegra/tegra124.c                    |   40 +-
 drivers/memory/tegra/tegra186-emc.c                |    8 +
 drivers/memory/tegra/tegra186.c                    |   22 +-
 drivers/memory/tegra/tegra194.c                    |   22 +-
 drivers/memory/tegra/tegra20.c                     |   31 +-
 drivers/memory/tegra/tegra210.c                    |   21 +-
 drivers/memory/tegra/tegra234.c                    |   22 +-
 drivers/memory/tegra/tegra264.c                    |  420 +-
 drivers/memory/tegra/tegra30-emc.c                 |    6 +-
 drivers/memory/tegra/tegra30.c                     |   18 +-
 drivers/mfd/sec-acpm.c                             |   10 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          |   14 +
 drivers/reset/Kconfig                              |    9 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/core.c                               |  505 ++-
 drivers/reset/reset-ath79.c                        |   12 +-
 drivers/reset/reset-gpio.c                         |   27 +-
 drivers/reset/reset-intel-gw.c                     |   11 +-
 drivers/reset/reset-lpc18xx.c                      |   12 +-
 drivers/reset/reset-ma35d1.c                       |   11 +-
 drivers/reset/reset-npcm.c                         |   12 +-
 drivers/reset/reset-rzv2h-usb2phy.c                |  197 +-
 drivers/reset/reset-sky1.c                         |  367 ++
 drivers/reset/reset-sunplus.c                      |   12 +-
 drivers/reset/sti/reset-syscfg.c                   |    9 +-
 drivers/soc/hisilicon/kunpeng_hccs.c               |    7 +-
 drivers/soc/microchip/Kconfig                      |   11 +
 drivers/soc/microchip/Makefile                     |    1 +
 drivers/soc/microchip/mpfs-irqmux.c                |  181 +
 drivers/soc/microchip/mpfs-sys-controller.c        |   74 +-
 drivers/soc/qcom/llcc-qcom.c                       |  188 +-
 drivers/soc/qcom/ocmem.c                           |   17 +-
 drivers/soc/qcom/pdr_interface.c                   |    4 +-
 drivers/soc/qcom/pdr_internal.h                    |    3 -
 drivers/soc/qcom/pmic_glink.c                      |   66 +-
 drivers/soc/qcom/qcom_aoss.c                       |    2 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |   33 +-
 drivers/soc/qcom/smp2p.c                           |  103 +-
 drivers/soc/qcom/socinfo.c                         |   11 +
 drivers/soc/qcom/ubwc_config.c                     |   31 +-
 drivers/soc/qcom/wcnss_ctrl.c                      |   17 +-
 drivers/soc/renesas/Kconfig                        |   12 +
 drivers/soc/renesas/Makefile                       |    1 +
 drivers/soc/renesas/r9a08g046-sysc.c               |   91 +
 drivers/soc/renesas/r9a09g047-sys.c                |    2 +-
 drivers/soc/renesas/r9a09g056-sys.c                |    2 +-
 drivers/soc/renesas/r9a09g057-sys.c                |    2 +-
 drivers/soc/renesas/rz-sysc.c                      |    3 +
 drivers/soc/renesas/rz-sysc.h                      |    1 +
 drivers/soc/tegra/Kconfig                          |   20 +
 drivers/soc/tegra/cbb/tegra234-cbb.c               |  169 +-
 drivers/soc/tegra/common.c                         |    5 +-
 drivers/soc/tegra/pmc.c                            |  664 +--
 drivers/tee/optee/device.c                         |    5 +-
 include/dt-bindings/arm/qcom,ids.h                 |   10 +
 .../dt-bindings/reset/cix,sky1-s5-system-control.h |  163 +
 .../dt-bindings/reset/cix,sky1-system-control.h    |   41 +
 {drivers =3D> include/linux}/bus/stm32_firewall.h    |    0
 include/linux/bus/stm32_firewall_device.h          |   26 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   40 +-
 include/linux/reset-controller.h                   |   21 +-
 include/linux/reset.h                              |   43 +-
 include/linux/soc/qcom/llcc-qcom.h                 |    8 +-
 include/linux/soc/qcom/qmi.h                       |   12 +
 include/linux/soc/qcom/ubwc.h                      |   25 +
 include/linux/tee_core.h                           |   30 +-
 include/soc/tegra/bpmp-abi.h                       | 4605 +++++++++++++=
+++----
 include/soc/tegra/bpmp.h                           |   20 +-
 include/soc/tegra/mc.h                             |   40 +-
 samples/qmi/qmi_sample_client.c                    |    2 +-
 149 files changed, 9188 insertions(+), 2652 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,at91rm92=
00-sdramc.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,at91rm92=
00-st.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,at91sam9=
260-pit.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/atmel-sysregs.=
txt
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,sam9=
x60-pit64b.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,sama=
7g5-chipid.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp131-=
dbg-bus.yaml
 delete mode 100644 Documentation/devicetree/bindings/cache/baikal,bt1-l=
2-ctl.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra=
124-dfll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra=
124-dfll.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers=
/nvidia,tegra210-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra26=
4-pcie.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-s=
ystem-control.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/micr=
ochip,mpfs-irqmux.yaml
 create mode 100644 drivers/bus/stm32_dbg_bus.c
 delete mode 100644 drivers/memory/bt1-l2-ctl.c
 create mode 100644 drivers/reset/reset-sky1.c
 create mode 100644 drivers/soc/microchip/mpfs-irqmux.c
 create mode 100644 drivers/soc/renesas/r9a08g046-sysc.c
 create mode 100644 include/dt-bindings/reset/cix,sky1-s5-system-control=
.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-system-control.h
 rename {drivers =3D> include/linux}/bus/stm32_firewall.h (100%)

