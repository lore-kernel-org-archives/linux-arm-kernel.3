Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AEBC55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eOClrm/u2VRY9VSgrwD7HR56oauHzrkY9aLE4Ys3yG8=; b=nf3X12EprQhBaXVN0fQEEi3uzi
	N5PoTObdNpEqYVglBLsHXzamnwt/fSfjBX5Ty6iR+LgPHncabSECyDeX1fwTHxrhX1eci/7tuwOcG
	sHQtFgH/6/OkGJ/e/B52Tr3+0hf9YOmuf78SskjryTO+RSHdT/OFX1tH/a3cZf0vdbyweQQG3QDFk
	Vt3R341MbRcX2J3qZjO3JoaFwf17EV61tskkPImtYlF+J70U1W6AdnfhbOEK+Oqe22jsDd2PTXAbo
	nzTVz/hRLQfmXZ42J6JCwui/ineeRbXxkW5/dXxEgO7sFshtgOJdcLn8ReDobMVZMW4O6szuNPq3H
	24iual1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpToX-0000000B1gJ-30tH;
	Thu, 30 Jul 2026 16:40:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpToW-0000000B1fx-2Pun
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:40:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD0BB600AD;
	Thu, 30 Jul 2026 16:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D241B1F000E9;
	Thu, 30 Jul 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785429655;
	bh=eOClrm/u2VRY9VSgrwD7HR56oauHzrkY9aLE4Ys3yG8=;
	h=From:To:Cc:Subject:Date;
	b=IzI2sCib+1llKImo2BoNONVnf54FVGWgowOMSlcU4rwp4GKOIS9NqwRtNt7C5rsbT
	 MJKDn9m4jbExjd96TYZe8UFKlMj7ehxcxTVhMuulKAav/AsGFGU4xKOr9Qt3NtQ9iB
	 XrIcHravELEV1XngGoPqo5/oUykgVeoX52brE8VzB+KIZbEHPNBkF8ZP8+HFmk16rW
	 BZHWeIk1C/5alpUs1FY4OJasT69VspeCM9HS6j4HVvDlpN5ErzuCR8k9INlv6WXUpj
	 6c7jIyW/9GHoHy8IAa1oYZJZ8fYpVkXAGQOinGvYdysSwZiWeBQ2CPzV1tS6AojT2L
	 Aq+ARZBQCP6gA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>,
	Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
	Konstantin Shabanov <mail@etehtsea.me>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Mayur Kumar <kmayur809@gmail.com>,
	Nabige Aala <nabige.aala@oss.qualcomm.com>,
	Ruoyu Wang <ruoyuw560@gmail.com>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v7.3
Date: Thu, 30 Jul 2026 11:40:52 -0500
Message-ID: <20260730164052.176832-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
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


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.3

for you to fetch changes up to 43584144a46bccbe90482cd8eede9596d8fc47dc:

  soc: qcom: llcc: Skip ECC interrupt setup on Shikra, pre-configured by DSF (2026-07-17 17:22:44 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v7.3

Add Maili platform bindings for SCM, IMEM, AOSS, and PMIC GLINK. Add
Shikra IMEM, RPM SMD, LLCC, and UBWC support, including handling for
firmware-configured LLCC ECC interrupts.

Add the generic Peripheral Authentication Service with SCM and OP-TEE
backends, and migrate the MSM DRM and IPA drivers to it.

Add SCM SMC-call tracepoints and configurable minidump delivery through
always-on SRAM. Correct SCM download-mode pointer ordering and improve
download-mode probe diagnostics.

Rework the UBWC configuration database and add Milos and Shikra
configuration. Add protection-domain mappings for SA8775P and QCS8300,
support newer ICE versions, Hawi subsystem statistics, and SDM850
identification.

Simplify Qualcomm SoC Kconfig selection and architecture dependencies.
Use managed resources in EBI2 and RPMh RSC probe paths to correct cleanup
on failures.

----------------------------------------------------------------
Bjorn Andersson (1):
      Merge branch '20260702115835.167602-2-sumit.garg@kernel.org' into drivers-for-7.3

Chunkai Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side channel

David Heidelberg (1):
      soc: qcom: socinfo: Add SoC ID for SDM850

Dmitry Baryshkov (7):
      soc: qcom: ubwc: set min_acc length to 64 for all UBWC 1.0 targets
      soc: qcom: ubwc: drop ubwc_dec_version
      soc: qcom: ubwc: drop ubwc_bank_spread
      soc: qcom: ubwc: drop macrotile_mode from the database
      soc: qcom: ubwc: use fixed values for UBWC swizzle for UBWC < 4.0
      soc: qcom: ubwc: sort out the rest of the UBWC swizzle settings
      soc: qcom: ubwc: deduplicate UBWC configuration data

Faiyaz Mohammed (1):
      soc: qcom: llcc: Skip ECC interrupt setup on Shikra, pre-configured by DSF

Fenglin Wu (1):
      dt-bindings: soc: qcom: qcom,pmic-glink: Add Maili compatible string

Jingyi Wang (2):
      dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
      dt-bindings: sram: Document qcom,maili-imem compatible

Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      soc: qcom: llcc: Add configuration data for Shikra SoC
      dt-bindings: sram: Document qcom,shikra-imem compatible

Konstantin Shabanov (1):
      firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14

Krzysztof Kozlowski (5):
      soc: qcom: Unify user-visible "Qualcomm" name
      soc: qcom: Hide all drivers behind selectable menu
      soc: qcom: Restrict drivers per ARM/ARM64
      soc: qcom: Make important drivers default
      soc: qcom: Avoid SCM and SPM for cpuidle drivers

Luca Weiss (1):
      soc: qcom: ubwc: Add config for Milos

Manivannan Sadhasivam (1):
      soc: qcom: ice: Support IP version beyond v3

Mayur Kumar (1):
      soc: qcom: cmd-db: use C-style SPDX comment for source file

Mohammad Rafi Shaik (2):
      soc: qcom: pd-mapper: Add support for SA8775P
      soc: qcom: pd-mapper: Add support for QCS8300

Mukesh Ojha (4):
      dt-bindings: firmware: qcom,scm: Add minidump SRAM property
      firmware: qcom: scm: Fix missing smp_load_acquire()
      firmware: qcom: scm: use dev_err_probe() for dload address failure
      firmware: qcom: scm: Add minidump SRAM support

Nabige Aala (1):
      soc: qcom: ubwc: Add Shikra UBWC config

Pengpeng Hou (2):
      soc: qcom: rpmh-rsc: manage PM notifiers with devres
      bus: qcom-ebi2: use managed resources for clocks and children

Ruoyu Wang (1):
      bus: qcom-ebi2: Fix clock leak on probe failure

Sneh Mankad (1):
      soc: qcom: qcom_stats: Add SoCCP and DCP subsystems stats

Sumit Garg (6):
      firmware: qcom: Add a generic PAS service
      firmware: qcom_scm: Migrate to generic PAS service
      firmware: qcom: Add a PAS TEE service
      MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
      drm/msm: Switch to generic PAS TZ APIs
      net: ipa: Switch to generic PAS TZ APIs

Yuvaraj Ranganathan (2):
      firmware: qcom: scm: add trace events for the SMC call interface
      firmware: qcom: scm: instrument SMC call path with tracepoints

 .../devicetree/bindings/firmware/qcom,scm.yaml     |   9 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |   1 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |   1 +
 Documentation/devicetree/bindings/sram/sram.yaml   |   2 +
 MAINTAINERS                                        |   9 +
 drivers/bus/qcom-ebi2.c                            |  44 +-
 drivers/cpuidle/Kconfig.arm                        |   4 +-
 drivers/firmware/qcom/Kconfig                      |  22 +-
 drivers/firmware/qcom/Makefile                     |   3 +
 drivers/firmware/qcom/qcom_pas.c                   | 298 +++++++++++++
 drivers/firmware/qcom/qcom_pas.h                   |  50 +++
 drivers/firmware/qcom/qcom_pas_tee.c               | 479 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm-smc.c               |  10 +
 drivers/firmware/qcom/qcom_scm.c                   | 456 +++++++++++---------
 drivers/firmware/qcom/qcom_scm_trace.h             | 143 ++++++
 drivers/gpu/drm/msm/Kconfig                        |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  11 +-
 drivers/net/ipa/Kconfig                            |   2 +-
 drivers/net/ipa/ipa_main.c                         |  13 +-
 drivers/soc/qcom/Kconfig                           | 120 +++---
 drivers/soc/qcom/cmd-db.c                          |   2 +-
 drivers/soc/qcom/ice.c                             |   4 +-
 drivers/soc/qcom/llcc-qcom.c                       |  30 ++
 drivers/soc/qcom/qcom_pd_mapper.c                  |  38 ++
 drivers/soc/qcom/qcom_stats.c                      |   2 +
 drivers/soc/qcom/rpmh-rsc.c                        |  37 +-
 drivers/soc/qcom/socinfo.c                         |   1 +
 drivers/soc/qcom/ubwc_config.c                     | 302 ++++---------
 include/linux/firmware/qcom/qcom_pas.h             |  43 ++
 include/linux/soc/qcom/ubwc.h                      |  81 ++--
 32 files changed, 1662 insertions(+), 561 deletions(-)
 create mode 100644 drivers/firmware/qcom/qcom_pas.c
 create mode 100644 drivers/firmware/qcom/qcom_pas.h
 create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
 create mode 100644 drivers/firmware/qcom/qcom_scm_trace.h
 create mode 100644 include/linux/firmware/qcom/qcom_pas.h

