Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D13BCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3PdRhw4p3EoVxJpWYSAXydAjeo8TcVLX9r9WftaEstM=; b=dKf+EDTp/sabjYF9dUKSLqkz4O
	/esr3oH/FNc4XLmi3zHgPckmc3HpsjJJYZoUapvoTnUDRYKAQy4NPrVd/pB9TR4v2pX3NtRPF4fCF
	2XZxBmQr71GM02BKRHdr0yLt3FNlAD0ey7dG4kXEtsrnlH6BeJFIxI3cFCT5lJLjnbkxyEixAABWa
	LiAXWPBIsdVtPTrXiCba6y1Q5ZaZ2ygJacG+RE4LJetZ1OmDCLTGBLk9VqjFHUxwdLF7UJBEab+Mv
	9jfOy9AkILrWvdbtIETVfYuaYDaZ7LzPDi9TEmXbGNNggUWVyt8crRVviPEOcE1CpG3ErhYiNCTrH
	1/uWsvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKGr-0000000CDuk-07SW;
	Tue, 04 Nov 2025 16:52:37 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKGn-0000000CDqw-2kW5;
	Tue, 04 Nov 2025 16:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3P
	dRhw4p3EoVxJpWYSAXydAjeo8TcVLX9r9WftaEstM=; b=pHxgCdwVe18OieQi0V
	oDE/QKq1ZkR9EKQcdTCYjPxG8+8FHvvn5DRIrS799xXQWFbPJPw+N65FEYW5C9P7
	Eo+6E1ZIKPj1SJ3cATvavRk3fs8pmXUcqeAgCSrvS/+eX84hkznpMgzDywMflQQh
	aHODZzs5ywjbAcNHOjgIpn1Dg=
Received: from zhb.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDHcqsQLwppjl+qCg--.1966S2;
	Wed, 05 Nov 2025 00:51:29 +0800 (CST)
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
Subject: [PATCH v6 0/2] PCI: Configure Root Port MPS during host probing
Date: Wed,  5 Nov 2025 00:51:23 +0800
Message-Id: <20251104165125.174168-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgDHcqsQLwppjl+qCg--.1966S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw1DXr45CF1fWr1rXrWkZwb_yoW5Ar17pF
	WFqFs3Gr4xGF13Ga9rGa1jkFyYqas7GrWUGrZ8GwnxZan8ZF1UXryvka1rAry7Xr4S93WI
	vry2qry8C3Wqva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE_-BtUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:355:1a70:fad9:bcdf]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxOsUGkKLxOqdQAA3s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_085234_232019_C5AE81AF 
X-CRM114-Status: UNSURE (   9.33  )
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

Current PCIe initialization exhibits a key optimization gap: Root Ports
may operate with non-optimal Maximum Payload Size (MPS) settings. While
downstream device configuration is handled during bus enumeration, Root
Port MPS values inherited from firmware or hardware defaults often fail
to utilize the full capabilities supported by controller hardware. This
results in suboptimal data transfer efficiency throughout the PCIe
hierarchy.

This patch series addresses this by:

1.  Core PCI enhancement (Patch 1):
- Proactively configures Root Port MPS during host controller probing
- Sets initial MPS to hardware maximum (128 << dev->pcie_mpss)
- Conditional on PCIe bus tuning being enabled (PCIE_BUS_TUNE_OFF unset)
- Maintains backward compatibility via PCIE_BUS_TUNE_OFF check
- Preserves standard MPS negotiation during downstream enumeration

2.  Driver cleanup (Patch 2):
- Removes redundant MPS configuration from Meson PCIe controller driver
- Functionality is now centralized in PCI core
- Simplifies driver maintenance long-term

---
Changes for v6:
- Modify the commit message and comments. (Bjorn)
- Patch 1/2 code logic: Add !bridge check to configure MPS only for Root Ports
  without an upstream bridge (root bridges), avoiding incorrect handling of
  non-root-bridge Root Ports (Niklas).

Changes for v5:
https://patchwork.kernel.org/project/linux-pci/patch/20250620155507.1022099-1-18255117159@163.com/

- Use pcie_set_mps directly instead of pcie_write_mps.
- The patch 1 commit message were modified.

Changes for v4:
https://patchwork.kernel.org/project/linux-pci/patch/20250510155607.390687-1-18255117159@163.com/

- The patch [v4 1/2] add a comment to explain why it was done this way.
- The patch [v4 2/2] have not been modified.
- Drop patch [v3 3/3]. The Maintainer of the pci-aardvark.c file suggests
  that this patch cannot be submitted. In addition, Mani also suggests
  dropping this patch until this series of issues is resolved.

Changes for v3:
https://patchwork.kernel.org/project/linux-pci/patch/20250506173439.292460-1-18255117159@163.com/

- The new split is patch 2/3 and 3/3.
- Modify the patch 1/3 according to Niklas' suggestion.

Changes for v2:
https://patchwork.kernel.org/project/linux-pci/patch/20250425095708.32662-1-18255117159@163.com/

- According to the Maintainer's suggestion, limit the setting of MPS
  changes to platforms with controller drivers.
- Delete the MPS code set by the SOC manufacturer.
---

Hans Zhang (2):
  PCI: Configure Root Port MPS during host probing
  PCI: dwc: Remove redundant MPS configuration

 drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
 drivers/pci/probe.c                    | 12 ++++++++++++
 2 files changed, 12 insertions(+), 17 deletions(-)


base-commit: 691d401c7e0e5ea34ac6f8151bc0696db1b2500a
-- 
2.34.1


