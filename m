Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A56FC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hlkDh2w3FYKJyuWC9RIyLPhUb8AZYQjeTSJNq/2gbqw=; b=Z2sCUgzlR6n5/+/lx6UpvBr5jq
	ft29PayZ1g2H/CcieigtkF5z01DcknYleSbbJPrxHtnqBvpxbc/R5n6jshy0gb58u5m7rEqiY9kZr
	lTL5bBuSuU/uJ0rnMwIpWAh/NSJg/P+yg6j2u7qkeSHWRIT8tOlxnSZQZ7imZHAqiJaTFsnUlu9Ge
	vxeycA+T42tbxfkmoT9vDuqfISRjCFKOjZ25WSKD+1EoLwWRpgNkyEdGENyLQD3TXjOGw8EXZVuV0
	o164TO5B3WocTQ3zKG6CyNlHaIdE6vXQNOxLruykzp6mVwzCFzJTJKFpV1g3lJ9dNP8Z4gqGSRBLt
	ZRE2ZASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51DE-0000000GjWt-15WO;
	Fri, 11 Sep 2026 13:22:40 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51D7-0000000GjTc-3MX4;
	Fri, 11 Sep 2026 13:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hl
	kDh2w3FYKJyuWC9RIyLPhUb8AZYQjeTSJNq/2gbqw=; b=aL0D4sMY8DfqNRk2QR
	wfGQAxM7wqe9xd58OF3ecMGCauO4nSxffVLagposE5qVNMinSnBw55evk/VYdfLB
	K2KpZjsGwwD3DbHspeWSa6DWXE3VfbSEIca6RItX8OeeWGlYyLSoWnQ5G3EBtzVD
	K6Wrar/BaRRB3BgJx/tzQQDKI=
Received: from zhb.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAHqBJmAKRqYh6mRA--.52761S2;
	Fri, 11 Sep 2026 21:21:43 +0800 (CST)
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
Subject: [PATCH v8 0/2] PCI: Configure Root Port MPS during host probing
Date: Fri, 11 Sep 2026 21:21:43 +0800
Message-Id: <20260911132145.211380-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAHqBJmAKRqYh6mRA--.52761S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw1DXr45CF1fAr1kGr1DAwb_yoW5tFyxpF
	WFqFs3Gr4xGr15Ga9rGa1jkFy5Xas7GFW3GrZ8Gw13ZFs8ZF1UXF929a1Fyry7XrWS93W2
	vr9Fq34xC3Wqva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi0JP_UUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:8f8f:b76e:3756:1454]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AndgWqkAGl5BQAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_062234_165016_3C564D1D 
X-CRM114-Status: UNSURE (   9.86  )
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
Changes in v8:
- Rebase to v7.3-rc1.

Changes in v7:
https://patchwork.kernel.org/project/linux-pci/cover/20251127170908.14850-1-18255117159@163.com/

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


base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
-- 
2.34.1


