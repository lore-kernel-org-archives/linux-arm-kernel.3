Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC17FC88E59
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Nk0vDbW8nS5kYgocrElJ7R98oQE2CWqYVPeodJnZJo=; b=bJJfR5FVSZbzXq72kxwDt33G4e
	RBiqGhAi9JPrc/kiZ1xyaePauKrxlLgFfBfnW4aI6dPxmwJSuhMsyj3i+gAMTYJYwIaWn1hqwJWc/
	Alkjn+61+SP0zP6aH0Ft4JwrGaA+Y22dpO5r6+puztB2UUZPCnYydYzQHVTfLZFGT2jM0JMnSmBMQ
	oMS/Bch1kjRYc59fjX+fPgW6r9mygCd0ECnoqnWRr5mR6X9gykO0YrNPZ0KsFYU6kX8GH81Ebx26b
	sZc9eQ/QZhnh+8aurWaTBk2kez+iuIlBcbGJOKlwNuKxXB77PHsx4/rmfb85rk3yqoFWQajms2DN0
	Y7DFtjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x545N-0000000HDNS-1Jkr;
	Fri, 11 Sep 2026 16:26:45 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x545H-0000000HDJo-1eWr;
	Fri, 11 Sep 2026 16:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2N
	k0vDbW8nS5kYgocrElJ7R98oQE2CWqYVPeodJnZJo=; b=PAw6h70XtVazbhr4ia
	aXwxBRWP4w2kLauSCfWpTjoQv9w2WZR5hAouK5/nvsxeYR/DUc0gC09DW7NJ9YUV
	e3fWE+mnCETTr3fFv5N2E2IJl/4SSQobasNJhtUKTkQidlX89M1a/VdUQUnGMlhz
	8f9Sck5Wod6gjJI3Ucdfkatl8=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnDy6JK6RqMNRdAA--.33660S2;
	Sat, 12 Sep 2026 00:25:46 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	heiko@sntech.de,
	mani@kernel.org,
	yue.wang@Amlogic.com
Cc: pali@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	cassel@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 0/2] PCI: dwc: Clean up DWC PCIe register macros
Date: Sat, 12 Sep 2026 00:25:35 +0800
Message-Id: <20260911162537.469018-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnDy6JK6RqMNRdAA--.33660S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFyUAry8uw48Gr1DKFW7Jwb_yoW5Wry5pa
	45KayavF1ktF45ua13Z3WDAF1aq3Z7AFWUK39rWw12g3W3uFW0qr1rKFyFqF9rJrWxJr42
	kF4aqa4xGr43AFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEFAp5UUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:8f8f:b76e:3756:1454]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wuwVGqkK4vNsQAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_092640_007633_43058ED6 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

This series cleans up the DWC PCIe controller register macros to better
match the Synopsys DesignWare PCIe Controller Reference Manual, and
removes an unused set of iATU unroll register definitions.

Patch 1 renames various register and field macros, dropping redundant
PCIE_ prefixes and using documented base names.  Field macros are
renamed consistently so their register association is clear.  No
functional change intended.

Patch 2 removes the unused PCIE_ATU_UNR_* macros.  These have no
remaining users now that the driver uses the ATU_* macros and
ATU_UNROLL_BASE() for unrolled iATU register access.

The series was build-tested with defconfig and allmodconfig.

---
Changes in v2:
- Rename Port Link Control register to PORT_LINK_CTRL instead of
  PORT_LINK_CTRL_OFF, as suggested by Bjorn.  The _OFF suffix is
  ambiguous and unnecessary.
- Extend the cleanup to more DWC PCIe register macros, dropping the
  redundant PCIE_ prefix and using documented base names, such as
  PORT_FORCE_LINK, PORT_AFAC, PORT_LANE_SKEW, TIMER_CTRL_MAX_FUNC_NUM,
  PORT_LINK_DEBUG0/1, LINK_WIDTH_SPEED_CTRL, GEN3_CTRL, GEN3_EQ_CTRL,
  MULTI_LANE_CTRL, MISC_CONTROL_1, MSIX_DOORBELL, and the ATU_*
  registers.
- Include the register name in field macros, e.g. PORT_LINK_CTRL_DLE,
  PORT_LINK_CTRL_FLM, PORT_LINK_CTRL_LC_*.
- Fix PORT_AFAC L1 field names (PORT_AFAC_L1_*).
- Unify COHERENCY_CTRL1/2/3 and RAS_DES_EVENT_COUNTER_* naming.
- Drop the _OFF suffix from MISC_CONTROL_1.
- Add a patch to remove unused PCIE_ATU_UNR_* definitions.

v1:
https://patchwork.kernel.org/project/linux-pci/patch/20260904061823.592216-1-18255117159@163.com/
---

Hans Zhang (2):
  PCI: dwc: Align register macros with Synopsys documentation
  PCI: dwc: Remove unused PCIE_ATU_UNR_* register definitions

 drivers/pci/controller/dwc/pci-imx6.c         |  26 +-
 drivers/pci/controller/dwc/pci-keystone.c     |   4 +-
 .../pci/controller/dwc/pcie-designware-ep.c   |  10 +-
 .../pci/controller/dwc/pcie-designware-host.c |  18 +-
 drivers/pci/controller/dwc/pcie-designware.c  | 176 +++++------
 drivers/pci/controller/dwc/pcie-designware.h  | 275 +++++++++---------
 drivers/pci/controller/dwc/pcie-fu740.c       |   6 +-
 drivers/pci/controller/dwc/pcie-nxp-s32g.c    |  18 +-
 drivers/pci/controller/dwc/pcie-qcom-common.c |  28 +-
 drivers/pci/controller/dwc/pcie-qcom.c        |   6 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  26 +-
 .../pci/controller/dwc/pcie-tegra194-acpi.c   |  22 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |  86 +++---
 drivers/pci/controller/dwc/pcie-ultrarisc.c   |  10 +-
 14 files changed, 349 insertions(+), 362 deletions(-)


base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
-- 
2.34.1


