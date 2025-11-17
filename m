Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F224CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 19:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J7Vvlxd+X+pSIr3KKaZRu4ytQq2StehwuON4q3HOrHw=; b=eDW4M39baLP9G7xrD7xTcTfA6s
	tqcpOQB2/TIow70oLtytY1uKIQvACWstOenZQzsg5PBIoQODd5CyLARuriigIUz56EzOW2mLfSTpA
	imoT4q03KhFTnaTeCGwHb/MzHrcSdDZGei+AaysJikaeVpqM5txHQfTejqHHwg1QHDBxT59GGE8lP
	INntiGUMfYY1M32ljFXVBi8JNmmT8ZyylXaXcorzPEEQUeCjsLOptn6iim+r9zDvpUSejTolbAOvs
	fFReXqswjTUsNHXJo5EerqTiuEBz47Xce/vESNU6Y8FrpfsJ1GtguFXKKxx+Yvnw7NBCNs0k2Sqo4
	o+p6krbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5K7-0000000GnDN-3iub;
	Mon, 17 Nov 2025 19:55:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5K7-0000000GnDE-0MLC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 19:55:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2414460250;
	Mon, 17 Nov 2025 19:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B096C2BC86;
	Mon, 17 Nov 2025 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763409337;
	bh=5NYv7IhXQWWcpLL+EOWuBkb9pQPJESIJu5lfgINYai8=;
	h=From:To:Cc:Subject:Date:From;
	b=SbIqvnS4+ghe1JRWib/V+hwCkB40FtAWp7of4kJ2Yi56O/km3W6+p215vYD7+e4lN
	 BYGurIMvo1CnhkHjy/YvnmcqenT9kd8IMfcoJ78RIBh+ycW5WonNf/XSanW9+4IbjL
	 MZX+obPMMudSNeyRNWTt/0g1vUahVyg4ZeF+UiE/cZcxn1iec+pgl+WadS2R4lpv/n
	 At/Tf4Xvm8Lsd/lbMfGgsUyRAVM1ejZKVBppG4Z2muxVVEH9/rPIpy1nSJSnvh5UXC
	 hZ4p+QfIim3LBPLr5skvWxt8yG+J/Nq87IFCrCPbE6cO5vY0XOyvM9pN/7sWXYlKVw
	 +nnuxkQNejkRg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.19
Date: Mon, 17 Nov 2025 13:59:54 -0600
Message-ID: <20251117200001.3169354-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
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


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.19

for you to fetch changes up to 186b8f8fcc86949eaf0c3bd11a47048ec4c78b5b:

  soc: qcom: mdt_loader: rename 'firmware' parameter of qcom_mdt_load() (2025-11-11 09:48:57 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v6.19

Support for hardware-keymanager v1 support for wrapped keys is introduce
in the ICE driver.

Support for the new Kaanapali mobile platform is added to last-level
cache controller, pd-mapper, and UBWC drivers.

UBWC driver gains support for the Monaco and Glymur platforms.

The PMIC GLINK driver is extended to handle the differences found in
targets where the related firmware runs on the SoCCP.

Support for running on targets without initialized SMEM is provided, by
reworking the SMEM driver to differentiate between "not yet probed" and
"probed but there was no SMEM". An unwanted WARN_ON() that triggered if
clients asked for a SMEM item beyond the currently running system's
limit, was removed, to allow new use cases to gracefully fail on old
targets.

The Qualcomm socinfo driver is extended with support for version 20
through 23 and support for providing version information about more than
32 remote processors. Identifiers for QCS6490 and SM8850 are also added.

Additionally, a number of smaller bug fixes and cleanups in PBS, OCMEM,
GSBI, TZMEM, and MDT-loader are included.

----------------------------------------------------------------
Abel Vesa (1):
      soc: qcom: ubwc: Add configuration Glymur platform

Akhil P Oommen (1):
      soc: qcom: ubwc: Add config for Kaanapali

Anjelique Melendez (1):
      soc: qcom: pmic_glink: Add support for SOCCP remoteproc channels

Christian Marangi (2):
      err.h: add INIT_ERR_PTR() macro
      soc: qcom: smem: better track SMEM uninitialized state

Gabor Juhos (2):
      soc: qcom: mdt_loader: merge __qcom_mdt_load() and qcom_mdt_load_no_init()
      soc: qcom: mdt_loader: rename 'firmware' parameter of qcom_mdt_load()

Haotian Zhang (2):
      soc: qcom: gsbi: fix double disable caused by devm
      soc: qcom: smem: fix hwspinlock resource leak in probe error paths

Jingyi Wang (6):
      dt-bindings: cache: qcom,llcc: Document the Kaanapali LLCC
      soc: qcom: llcc-qcom: Add support for Kaanapali
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8850
      soc: qcom: socinfo: Add SM8850 SoC ID
      dt-bindings: soc: qcom,aoss-qmp: Document the Kaanapali AOSS channel
      dt-bindings: firmware: qcom,scm: Document SCM on Kaanapali SOC

Johan Hovold (2):
      soc: qcom: ocmem: fix device leak on lookup
      soc: qcom: pbs: fix device leak on lookup

Kathiravan Thirumoorthy (4):
      soc: qcom: socinfo: arrange the socinfo_image_names array in alphabetical order
      soc: qcom: socinfo: add the missing entries to the smem image table
      soc: qcom: smem: drop the WARN_ON() on SMEM item validation
      soc: qcom: socinfo: add support to extract more than 32 image versions

Komal Bajaj (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for QCS6490
      soc: qcom: socinfo: Add SoC ID for QCS6490

Mukesh Ojha (2):
      soc: qcom: socinfo: Add support for new fields in revision 20
      soc: qcom: socinfo: Add reserve field to support future extension

Neeraj Soni (1):
      soc: qcom: ice: Add HWKM v1 support for wrapped keys

Pankaj Patil (1):
      dt-bindings: firmware: qcom,scm: Document Glymur scm

Prasad Kumpatla (1):
      soc: qcom: pd-mapper: Add Kaanapali compatible

Randy Dunlap (1):
      firmware: qcom: tzmem: fix qcom_tzmem_policy kernel-doc

Sibi Sankar (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the Glymur AOSS side channel

Yongxing Mou (1):
      soc: qcom: ubwc: Add QCS8300 UBWC cfg

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   3 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   2 +
 drivers/soc/qcom/ice.c                             |  81 +++--
 drivers/soc/qcom/llcc-qcom.c                       | 373 +++++++++++++++++++++
 drivers/soc/qcom/mdt_loader.c                      |  52 ++-
 drivers/soc/qcom/ocmem.c                           |   2 +-
 drivers/soc/qcom/pmic_glink.c                      |   9 +-
 drivers/soc/qcom/qcom-pbs.c                        |   2 +
 drivers/soc/qcom/qcom_gsbi.c                       |   8 -
 drivers/soc/qcom/qcom_pd_mapper.c                  |  10 +
 drivers/soc/qcom/smem.c                            |  33 +-
 drivers/soc/qcom/socinfo.c                         | 102 +++++-
 drivers/soc/qcom/ubwc_config.c                     |  24 ++
 include/dt-bindings/arm/qcom,ids.h                 |   2 +
 include/linux/err.h                                |   8 +
 include/linux/firmware/qcom/qcom_tzmem.h           |  15 +-
 include/linux/soc/qcom/llcc-qcom.h                 |   7 +
 include/linux/soc/qcom/socinfo.h                   |   4 +
 include/linux/soc/qcom/ubwc.h                      |   1 +
 20 files changed, 645 insertions(+), 95 deletions(-)

