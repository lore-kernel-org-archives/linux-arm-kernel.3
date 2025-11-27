Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A71DD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V/pS6w4rFfk/7ExZrmkUZsh7BR5ggFxkvqiAgus5FlI=; b=WaQFIeDSg04RZxOuSticLikDoL
	9o6/x51/PlmME3A+dV/f1zQHpjyfF5TeGuGIa2sQG6Nwzpvd4YZwicQWtjidoRPmgc1Pe2K4QfThN
	v68+fuydEdA3n6bPj7+4/DzkUPxuYRsjJ6h8/csP+l/Hdr2Ov6H6IN9jap/jpwK1WbsxLNEYVgmq4
	7qujHy/KXuxqf5ks0R+mkXx1upBINvlU/jP1yS7324DlP6ZXmwlsNA4+/9XbzJgyjYHcVET6hSB9G
	dauwCACVE9S+bwoC1yCkhhr7uETK+sB3+RkAUx4+uHY10JnyVIWJZvmtEz1INwG8j2bOUV1Xow4HK
	LkMVvkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOfVT-0000000Gy45-2f3y;
	Thu, 27 Nov 2025 17:10:11 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOfVR-0000000Gy1P-1vdq;
	Thu, 27 Nov 2025 17:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=V/
	pS6w4rFfk/7ExZrmkUZsh7BR5ggFxkvqiAgus5FlI=; b=WxY1kTW5iD9Tag5MVL
	3PylHmgbmRIRcRPR6+vagTaDcVMoEPC5XqUe4bxk0/ooFObo+PjdSxQjd0lt3qrm
	Ko9ErzZE/EBVpHEGXNoArMyB8r0Z+rDevDBDdy1YZ6MRy4G9AstEZ+3UH8l/S4uR
	L5ErgPhHu6fGR5W3q5YNnzauA=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDX71K2hShpkFjfDA--.43603S2;
	Fri, 28 Nov 2025 01:09:11 +0800 (CST)
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
Subject: [PATCH v7 0/2] PCI: Configure Root Port MPS during host probing
Date: Fri, 28 Nov 2025 01:09:06 +0800
Message-Id: <20251127170908.14850-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX71K2hShpkFjfDA--.43603S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw1DXr45CF1fAr1kGr1DAwb_yoW5urWkpF
	WFgws3Gr4xGF15Ga9rGa1jkFy5Xas7GFW3GrZ8GwnxZan0vF1UXryv9a1Fyry7XrWS9a12
	vr9FqryxC3Wqva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEtCzPUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:9218:e74d:98cf:7e7c]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBjzl2kohbgRVAAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_091009_922390_76088DB8 
X-CRM114-Status: UNSURE (   9.13  )
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

1. Core PCI enhancement (Patch 1):
- Proactively configures Root Port MPS during host controller probing
- Sets initial MPS to hardware maximum (128 << dev->pcie_mpss)
- Conditional on PCIe bus tuning being enabled (PCIE_BUS_TUNE_OFF unset)
  and not in PCIE_BUS_PEER2PEER mode (which requires default 128 bytes)
- Maintains backward compatibility via PCIE_BUS_TUNE_OFF check
- Preserves standard MPS negotiation during downstream enumeration

2. Driver cleanup (Patch 2):
- Removes redundant MPS configuration from Meson PCIe controller driver
- Functionality is now centralized in PCI core
- Simplifies driver maintenance long-term

---
Changes in v7:
- Exclude PCIE_BUS_PEER2PEER mode from Root Port MPS configuration
- Remove redundant check for upstream bridge (Root Ports don't have one)
- Improve commit message and code comments as per Bjorn.

Changes for v6:
https://patchwork.kernel.org/project/linux-pci/patch/20251104165125.174168-1-18255117159@163.com/

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


base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
-- 
2.34.1


