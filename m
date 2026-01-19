Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B94D29C3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5PQtD0fbfhp6USXMwJPXhokift+qfgrXvTefNLgxrlk=; b=rZQN3xcKxpopKQhSz10C6ITIMi
	eHxpPJkiq7/rCvMcYRvdQvEoRBBXpLiPNzOLrVDZjpmxyaqT2Ihs2wtQM3huN6bbOPwCyR0JL0+1c
	6J7QlXVRyI+J4284REOls1H9z3J1JPXjWBxXy42wrzD6IxY4tX3LP+uSewY+ZXBLRT+7vkZVFkKe+
	Wphm6f4nMXEvWf5f7wuSHV+RLSDVMIXYXzAPMZI5z7G/ONRXqkzpIOtHFMuX7J+r+9nWoAdauxhIo
	e5znrSk8Lu+1026xpWqog0mC/x1FAU0a7RMrU30fDT3eTjF2sty3O3tl8mlsLPhfv9k+R8s6SFYxI
	uoZSN6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs15-00000002SPj-44ui;
	Mon, 19 Jan 2026 16:22:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs0y-00000002SOl-3raQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16080439F2;
	Mon, 19 Jan 2026 16:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467B7C116C6;
	Mon, 19 Jan 2026 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839723;
	bh=oqgy3+J9tqflgUKoulRfWzxdEN5sKgu3jxasIQ1uMTU=;
	h=From:To:Cc:Subject:Date:From;
	b=tXXra+oV6S+83cQFE+YBJ8R1aqUp49/qTLrGwAP819CsyArz9vQhe8Sw/GzcfoXgW
	 GglV/JlA44Pc/Xk+53NICwN15sNdddZfGyQJg3ANOLjpZgF3WaKvaEXBcv1Eekr13j
	 YzDUjn+FnKU8SpXG7UhzyoVo6Hgik06vlFJJvTRNKRo2hnrfVGriokk34fo1u1QdUy
	 1VHdJ2vVM2AC38/QyLOiAH6AUPKwHFzvJgT5JZwqLAY4eRoVnWwNqaxMJoUkvnZNMS
	 PxyILa0EZfqICKuEXJqoYRtz5E7Q8ObvFa9E8j0PdUhfwo5D22OsL7BN8ubN1HwZyK
	 5O6or2HMo6cKg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Dale Whinham <daleyo@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.20
Date: Mon, 19 Jan 2026 10:22:01 -0600
Message-ID: <20260119162201.842771-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_082204_998228_D0CED47B 
X-CRM114-Status: GOOD (  12.92  )
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


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.20

for you to fetch changes up to fe099c387e06b566840449ac21008db1b25ad1f4:

  soc: qcom: preserve CPU endianness for QMI_DATA_LEN (2026-01-16 08:19:46 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v6.20

Support multiple wait queues in the SCM firmware interface and provide
discovery of the wait queue interrupt to deal with the cases where
bootloader didn't patch the DeviceTree with the IRQ information.

Refactor the MDT loader and the SCM driver's peripheral authentication
service interface and introduce support for passing a remoteproc
resource table to the firmware. The remoteproc patches that uses this
and uses this to configure the IOMMU are included here due to
bidirectional dependencies. The end result is remoteproc support on the
Glymur platform.

Enable QSEECOM and thereby UEFI variable access, on the Surface Pro 11.

Make the QMI interface endianness aware, to support ath1Xk on big endian
machines.

Add the Glymur support in LLCC driver.

----------------------------------------------------------------
Alexander Wilhelm (3):
      soc: qcom: check QMI basic element error codes
      soc: qcom: fix QMI encoding/decoding for basic elements
      soc: qcom: preserve CPU endianness for QMI_DATA_LEN

Bjorn Andersson (1):
      Merge branch '20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com' into drivers-for-6.20

Dale Whinham (1):
      firmware: qcom: scm: allow QSEECOM on Surface Pro 11

Dmitry Baryshkov (1):
      soc: qcom: ubwc: add missing include

Haotian Zhang (2):
      clk: qcom: Return correct error code in qcom_cc_probe_by_index()
      soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe

Jingyi Wang (2):
      dt-bindings: interrupt-controller: qcom,pdc: Document Kaanapali Power Domain Controller
      dt-bindings: sram: Document qcom,kaanapali-imem and its child node

Jorge Ramirez-Ortiz (1):
      soc: qcom: smem: handle ENOMEM error during probe

Konrad Dybcio (1):
      soc: qcom: pmic_glink_altmode: Consume TBT3/USB4 mode notifications

Krzysztof Kozlowski (1):
      bus: qcom-ebi2: Simplify with scoped for each OF child loop

Luca Weiss (2):
      dt-bindings: crypto: qcom,prng: document Milos
      dt-bindings: qcom,pdc: document the Milos Power Domain Controller

Mukesh Ojha (13):
      dt-bindings: remoteproc: qcom,pas: Add iommus property
      firmware: qcom_scm: Remove redundant piece of code
      firmware: qcom_scm: Rename peripheral as pas_id
      firmware: qcom_scm: Introduce PAS context allocator helper function
      remoteproc: pas: Replace metadata context with PAS context structure
      soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
      soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported symbols
      firmware: qcom_scm: Add a prep version of auth_and_reset function
      firmware: qcom_scm: Refactor qcom_scm_pas_init_image()
      firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
      firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
      remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
      remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux

Pankaj Patil (3):
      dt-bindings: cache: qcom,llcc: Document Glymur LLCC block
      soc: qcom: llcc-qcom: Add support for Glymur
      dt-bindings: cache: qcom,llcc: Remove duplicate llcc7_base for Glymur

Unnathi Chalicheemala (3):
      firmware: qcom_scm: Add API to get waitqueue IRQ info
      firmware: qcom_scm: Support multiple waitq contexts
      firmware: qcom_scm: Use TASK_IDLE state in wait_for_wq_completion()

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  46 +-
 .../devicetree/bindings/crypto/qcom,prng.yaml      |   1 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   2 +
 .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
 Documentation/devicetree/bindings/sram/sram.yaml   |   2 +
 drivers/bus/qcom-ebi2.c                            |   7 +-
 drivers/clk/qcom/common.c                          |   2 +-
 drivers/firmware/qcom/qcom_scm.c                   | 507 ++++++++++++++++++---
 drivers/firmware/qcom/qcom_scm.h                   |   2 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 165 +++++--
 drivers/soc/qcom/cmd-db.c                          |   7 +-
 drivers/soc/qcom/llcc-qcom.c                       | 207 +++++++++
 drivers/soc/qcom/mdt_loader.c                      |  51 ++-
 drivers/soc/qcom/pmic_glink_altmode.c              | 188 +++++++-
 drivers/soc/qcom/qmi_encdec.c                      | 137 +++++-
 drivers/soc/qcom/smem.c                            |   4 +-
 include/linux/firmware/qcom/qcom_scm.h             |  30 +-
 include/linux/soc/qcom/llcc-qcom.h                 |   4 +
 include/linux/soc/qcom/mdt_loader.h                |  22 +-
 include/linux/soc/qcom/ubwc.h                      |   1 +
 20 files changed, 1199 insertions(+), 189 deletions(-)

