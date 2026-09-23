Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA67C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2QCi4PA91htWabXRNzZuEPmyi6owb9C7RPIsKtQC/4w=; b=KIoWipAnhzaDNlW6R6iBlQV235
	NAtUZU5z59eT5ye9ibw6nunUjkTZLFuzQCAiXnOPQCL84VxAT3gR9/VHeBDVt1Ca+LhkcdkTf+bVX
	2souldXOuRL4VAJsb8+s64eDPlVhP33OqfeY4Eg3UHUK+6+32YvxAKRKzvPMkbxX6Ryiwk1eKZA5W
	FPepW24wuJVwS72808FKNjnMlduKFbEcnTAE6g+FLb8fMvPFcOfVl9dzuRk9AcHLtbcddDK2YRcWZ
	LLrKAlaFccvTcmBd4hQlgbJWYYxO3uqjCSY6hOlsI9jaSMuF0NauDKe7vHtbzm+KzJTCxsoiAqTW6
	wd6zFGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9D6K-00000006zhT-3B8E;
	Wed, 23 Sep 2026 02:52:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9D6J-00000006zhM-33eg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 02:52:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C3539601FB;
	Wed, 23 Sep 2026 02:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F54A1F00893;
	Wed, 23 Sep 2026 02:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790131970;
	bh=2QCi4PA91htWabXRNzZuEPmyi6owb9C7RPIsKtQC/4w=;
	h=From:To:Cc:Subject:Date;
	b=FGyVqrjZvzzLflL6IKVv6bpGtm96wFB0Xu61OEc7xY/psbXB1FJ0tNuY+HhvgCGb+
	 pEK5VMo00yahUAlcknOJxT0rXLK1gEJFVOTL1vVtP3XK+EGE+uzPPnpK9Mwh1ZMrTU
	 QCDJSSS99FvawHJLfAG7/SUnqmHkDAS4gOwVYif3mw8ylyI87ARgVaU/s2uhuUBoYg
	 FncjMtgf3B2pcJHEy/2kj43u3TKXQAAIG+3+SiSYH+pQpi90Q15B9C3/oPLaACFvxy
	 08AMztKAzNmwIAP/4BqeiuxAXP7DL1DrGqZUpELZX1VDcZWh1kAkVSvCi/qv1Q61V0
	 z6HMoQq8YHTew==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Wangao Wang <wangao.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dan Carpenter <error27@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Gourav Kumar <gouravk@qti.qualcomm.com>,
	Hongyan Xu <getshell@seu.edu.cn>,
	Jason Pettit <jason.pettit@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Linmao Li <lilinmao@kylinos.cn>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Pan Chuang <panchuang@vivo.com>,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [GIT PULL] Qualcomm driver updates for v7.4
Date: Tue, 22 Sep 2026 21:52:46 -0500
Message-ID: <20260923025246.407729-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.4

for you to fetch changes up to d3bacfccd82c974a541398a5ce310de7546b525f:

  firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA) (2026-09-16 17:07:24 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v7.4

Add UBWC 7.0 configuration for Hawi and Maili, and reuse Glymur's UBWC
configuration for Nord.

Parse Glymur's DDR information from SMEM, including its frequency plan and
highest bank bit. Correct DDR frequency overflow and byte order, and handle
unrecognized DDR layouts correctly.

Configure dedicated LLCC slices for the IPQ5424 PPE and Wi-Fi datapaths,
adjust the CPU slice, and propagate errors from optional IRQ lookup.

Allow the GENI serial-engine driver to be selected on 32-bit Qualcomm SoCs
such as Kuno. Fix firmware loading bounds, endianness, and writes to
read-only firmware.

Allow QSEECOM on the Glymur-based HP EliteBook X G2q 14 AI, Lenovo Yoga
Slim 7x Gen11, and Asus Zenbook A14 (UX3407NA), enabling EFI variable
access on the HP and Asus laptops. Release SCM reserved memory on probe
failure or unbind, and limit Qualcomm firmware Kconfig options to Qualcomm
platforms.

Defer PMIC GLINK altmode work until devices resume to avoid accessing
suspended I2C controllers.

Fix cleanup of failed APR service registrations to prevent stale lookups,
and remove unused APR device-ID matching.

Add the SM7250 SoC ID, correct SMSM and SMP2P I/O annotations, and clean
up RPMh kernel-doc and redundant IRQ error messages.

Document the Kuno SCM interface, Shikra CTCU fallback, and Milos CPU
bandwidth monitor. Add Abel Vesa as a Qualcomm SoC reviewer.

----------------------------------------------------------------
Abel Vesa (2):
      soc: qcom: pmic_glink: Fix device access from worker during suspend
      MAINTAINERS: add Abel as reviewer for linux-arm-msm

Ben Dooks (2):
      soc: qcom: smsm: fix __iomem annotations
      soc: qcom: smp2p: fix __iomem annotation on entry->value pointer

Bjorn Andersson (1):
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA)

Dan Carpenter (1):
      soc: qcom: smem: Fix signedness bug in smem_dram_parse()

Geert Uytterhoeven (1):
      firmware: QCOM interfaces should depend on ARCH_QCOM

Gopikrishna Garmidi (1):
      soc: qcom: smem: fix 32-bit overflow in DDR frequency calculation

Gourav Kumar (1):
      soc: qcom: ubwcg: Add Nord UBWC config

Hardeep Sharma (2):
      dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC
      soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm SoCs

Hongyan Xu (1):
      soc: qcom: apr: clean up failed service registrations

Jason Pettit (1):
      firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI

Jie Gan (1):
      dt-bindings: arm: add CTCU device for shikra

Kathiravan Thirumoorthy (1):
      soc: qcom: llcc: Update the SCT table for IPQ5424

Konrad Dybcio (2):
      soc: qcom: smem: support Glymur DRAM info
      firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x Gen11

Linmao Li (1):
      soc: qcom: smem: Fix byte order in v3 14-frequency parser

Luca Weiss (1):
      dt-bindings: interconnect: qcom-bwmon: Add Milos cpu-bwmon compatible

Maulik Shah (3):
      soc: qcom: rpmh-internal: fix kernel-doc issues in rpmh-internal.h
      soc: qcom: rpmh: fix kernel-doc issues in rpmh.c
      soc: qcom: rpmh-rsc: fix kernel-doc issues in rpmh-rsc.c

Mukesh Ojha (1):
      firmware: qcom: scm: Use devm_of_reserved_mem_device_init()

Pan Chuang (1):
      soc: qcom: Remove redundant dev_err()

Sreeshankar K (1):
      soc: qcom: socinfo: Add SM7250 SoC ID

Uwe Kleine-König (The Capable Hub) (1):
      soc: qcom: apr: Drop unused apr_device_id

Viken Dadhaniya (4):
      soc: qcom: geni-se: Fix endian conversion for serial_protocol comparison
      soc: qcom: geni-se: Widen fw_size to u32 to prevent wrap-around
      soc: qcom: geni-se: Fix fw_end computed before round-up; propagate size to caller
      soc: qcom: geni-se: Fix write to read-only firmware buffer

Wangao Wang (2):
      soc: qcom: ubwc: Add configuration for Hawi
      soc: qcom: ubwc: Add configuration for Maili

bui duc phuc (1):
      soc: qcom: llcc-qcom: Handle errors from optional IRQ lookup

 .../bindings/arm/qcom,coresight-ctcu.yaml          |  1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |  1 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |  1 +
 MAINTAINERS                                        |  1 +
 drivers/firmware/qcom/Kconfig                      |  4 +-
 drivers/firmware/qcom/qcom_scm.c                   | 25 +++----
 drivers/soc/qcom/Kconfig                           |  1 -
 drivers/soc/qcom/apr.c                             | 69 ++++++++----------
 drivers/soc/qcom/llcc-qcom.c                       | 60 +++++++++++++---
 drivers/soc/qcom/pmic_glink_altmode.c              |  4 +-
 drivers/soc/qcom/qcom-geni-se.c                    | 45 ++++++------
 drivers/soc/qcom/qcom_aoss.c                       |  4 +-
 drivers/soc/qcom/rpmh-internal.h                   | 16 +++--
 drivers/soc/qcom/rpmh-rsc.c                        |  4 +-
 drivers/soc/qcom/rpmh.c                            | 40 +++++++----
 drivers/soc/qcom/smem_dramc.c                      | 81 ++++++++++++++++++++--
 drivers/soc/qcom/smp2p.c                           | 12 ++--
 drivers/soc/qcom/smsm.c                            | 20 +++---
 drivers/soc/qcom/socinfo.c                         |  1 +
 drivers/soc/qcom/ubwc_config.c                     | 10 +++
 include/linux/device-id/apr.h                      | 21 ------
 include/linux/mod_devicetable.h                    |  1 -
 include/linux/soc/qcom/apr.h                       |  4 +-
 include/linux/soc/qcom/llcc-qcom.h                 |  4 ++
 include/linux/soc/qcom/ubwc.h                      |  3 +
 25 files changed, 276 insertions(+), 157 deletions(-)
 delete mode 100644 include/linux/device-id/apr.h

