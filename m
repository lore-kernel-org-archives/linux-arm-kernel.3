Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA63CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ClqrB5Nb1VE/6HPxn34XKW1S5rErGzsfqCMXXB5t2dI=; b=l80QiFEfYu7dEELyWtwEfV18Y6
	XIpu0ljcmrFJeZWvih3Jawwz6R5k5biE9aTVP0/8TqlybAJFsaNic8xGzNbIt8b0V+0Aj4kglr3Lk
	Xldt8fVqqxO7J4o1Q1vpEyr/XKdd9U2gUwt/ViHH9oex7JcmJFNyRtE8kbFs9U9j9zbvVI97DCA5x
	dfKUnPbCzBjIn9qZzPeKd2seZszDbrmLPAZURuwlbf++8YdTsS0+VAU0uc0JXj+AgQjFMxwI/KSZS
	/416qQ4EEaX6TS0v6vGeFaRwn4krjHx6JHpyOEKH0soq9oI5DRNQmIE+QAD6YLTBxZNu/tg1XF7rQ
	bz6NBLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLJF-0000000BLJD-3QfZ;
	Mon, 12 Oct 2026 19:03:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLJA-0000000BLIg-3wz7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:03:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 964AF419A3;
	Mon, 12 Oct 2026 19:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD75E1F0089B;
	Mon, 12 Oct 2026 19:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831816;
	bh=ClqrB5Nb1VE/6HPxn34XKW1S5rErGzsfqCMXXB5t2dI=;
	h=From:To:Cc:Subject:Date;
	b=Qc87fPCbdRHXT6Crexos9HfSxNeqhRI0i3BcudRlX4omUs/qESaurv6wqZuNz+wte
	 wBCfi/8HIQ7tFp8hNaYIqtLIi/T0vC2079pAQwq7EM5VsJNGUqAxaRANdeSKzscjkn
	 30tfZib5RIXIIb7CxCfQadk7HzmIzEjoLwUmfZt4RpoR8Cu/tNMusN294ydZ9vtW3Y
	 fT5dH1lPPvAoc331yDB+Kb/jsSpDbFrRN8bqF7/0sPUOSqUpIpAIYKaGEgJQ1TwUFf
	 7k5mJmW6NRyQCKjlEhin4JlHUziJFXu1u79UcqGfFCVFoIoUs0yluXhKstrvA8s1/B
	 4i0+VldJu93/A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Muzaffer Kadir <muzafferkadir@mainlining.org>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Antony Kurniawan Soemardi <linux@smankusors.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peng Fan <peng.fan@nxp.com>,
	Sasha Levin <sashal@kernel.org>,
	Somesh Dey <somesh.dey@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Vitalii Skorkin <nikroksm@mail.ru>,
	Yibo Tan <lhfff@tju.edu.cn>
Subject: [GIT PULL] More Qualcomm driver updates for v7.4
Date: Mon, 12 Oct 2026 14:03:31 -0500
Message-ID: <20261012190332.10322-1-andersson@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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


The following changes since commit 87802d4dc4850bf27b3955ee9162b1e52c99da1a:

  firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA) (2026-10-05 09:10:43 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.4-3

for you to fetch changes up to f44ee24f4a96ad97c2f0191e503c91477d9b530b:

  soc: qcom: geni-se: Drop unused icc_ddr parameter from geni_icc_get() (2026-10-05 09:10:45 +0200)

----------------------------------------------------------------
More Qualcomm driver updates for v7.4

Add SM8950 Maili and SM8975 Hawi SoC IDs. Document the Maili CPUCP
mailbox and PMIC arbiter compatibles.

Allow QSEECOM on the Kalambo CRD, Glymur QCB, and Lenovo ThinkPad T14s
Gen 7. Reuse Glymur's UBWC configuration for Kalambo, and add the Nord
LLCC configuration and binding.

Add Shikra SoC and subsystem low-power statistics. Document its
modem_apps GLINK audio channel. Document MSM8952 SCM and record that
MSM8952 has no UBWC. Describe IPQ5424 IMEM as mmio-sram and add the
MSM8960 SPS interrupt-controller syscon compatible.

Fix SCM PAS resource-table retries and handling of empty tables. Use
sleepable one-time initialization for TZMEM, and correct SCM Kconfig
selection for non-Qualcomm builds. Disable the SHM bridge on SM7125
to avoid boot-time RCU stalls.

Fix PMIC GLINK probe ordering and PD charger ULOG removal races. Provide
I2C Hub serial-engine program-RAM depth without accessing absent DMA
registers.

----------------------------------------------------------------
Antony Kurniawan Soemardi (1):
      dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic

Anurag Pateriya (2):
      dt-bindings: cache: qcom,llcc: Add Nord compatible
      soc: qcom: llcc: Add LLCC configuration for Nord

Fenglin Wu (1):
      dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Qualcomm Maili SoC

Gopikrishna Garmidi (3):
      firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

Hemanth Selam (2):
      firmware: qcom: fix typo "uninterruptable" in comment
      soc: qcom: fix typo "upto" in comment

Jingyi Wang (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8950
      soc: qcom: socinfo: Add SM8950 SoC ID

Kathiravan Thirumoorthy (1):
      dt-bindings: sram: describe the IPQ5424 IMEM as mmio-sram

Konrad Dybcio (1):
      soc: qcom: pmic_glink: Avoid losing early rpmsg probe

Mohammad Rafi Shaik (1):
      ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra

Mukesh Ojha (5):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8975
      soc: qcom: socinfo: Add SM8975 SoC ID
      firmware: qcom: tzmem: Use DO_ONCE_SLEEPABLE() in qcom_tzmem_enable()
      firmware: qcom_scm: handle empty PAS resource table
      firmware: qcom_scm: align PAS resource table retry

Muzaffer Kadir (2):
      dt-bindings: firmware: qcom,scm: Document MSM8952 SCM
      soc: qcom: ubwc: Add UBWC config for MSM8952

Neil Armstrong (1):
      soc: qcom: geni-se: provide PROG_RAM_DEPTH for I2C HUB Serial Engines

Peng Fan (1):
      soc: qcom: use assign_bit() where applicable

Sasha Levin (1):
      firmware: qcom: scm: Hide QCOM_SCM instead of depending on ARCH_QCOM

Sneh Mankad (2):
      dt-bindings: soc: qcom: stats: Add compatible for Shikra
      soc: qcom: stats: Add stats compatible and config for Shikra

Somesh Dey (1):
      soc: qcom: geni-se: Drop unused icc_ddr parameter from geni_icc_get()

Srinivas Kandagatla (1):
      firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7

Taniya Das (1):
      dt-bindings: mailbox: qcom: Document Maili CPUCP mailbox controller

Vitalii Skorkin (1):
      firmware: qcom: tzmem: disable SHM bridge for SM7125 platform

Yibo Tan (1):
      soc: qcom: pmic_pdcharger_ulog: prevent work requeue during remove

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  55 +++++++-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   3 +
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml     |   4 +-
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |  25 ++--
 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   |   1 +
 .../devicetree/bindings/sram/qcom,imem.yaml        |   1 -
 Documentation/devicetree/bindings/sram/sram.yaml   |   1 +
 drivers/firmware/qcom/Kconfig                      |   3 +-
 drivers/firmware/qcom/qcom_scm-legacy.c            |   2 +-
 drivers/firmware/qcom/qcom_scm.c                   |  19 ++-
 drivers/firmware/qcom/qcom_tzmem.c                 |   3 +-
 drivers/soc/qcom/llcc-qcom.c                       | 139 +++++++++++++++++++++
 drivers/soc/qcom/pmic_glink.c                      |   3 +-
 drivers/soc/qcom/pmic_pdcharger_ulog.c             |   2 +-
 drivers/soc/qcom/qcom-geni-se.c                    |  20 ++-
 drivers/soc/qcom/qcom_stats.c                      |   9 ++
 drivers/soc/qcom/smp2p.c                           |  10 +-
 drivers/soc/qcom/smsm.c                            |  16 +--
 drivers/soc/qcom/socinfo.c                         |   2 +
 drivers/soc/qcom/ubwc_config.c                     |   2 +
 include/dt-bindings/arm/qcom,ids.h                 |   2 +
 include/linux/soc/qcom/geni-se.h                   |   2 +-
 include/linux/soc/qcom/llcc-qcom.h                 |   2 +
 25 files changed, 280 insertions(+), 48 deletions(-)

