Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662BEC7EE2E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oQZPCQlL01STFivOq4uM2KDIfp6YbbOsKwLoJEg45CM=; b=XZ1l93nHli4WZtpmN7QB+wZBBn
	naCSqsuhLGOJ38AFrIpa8BDZMDqFfvJzsk6Owg18I4bXaj5vGjZhKlC1OQqHtWtvf2KgEkqtVPSrc
	EzTW5qQbRbKKrtyewwojn1DJ+NuJ0RS9CY7AEw3MCU7t3x5V+b/lEXAWiCEUI0uOomaMLEpGQxxh0
	t5MRosnKZH1ucivHvC42FYiopONsP6PMQSPI5hHihFDs9CB+Vfl4ECVHxTL0pGDLi+LehULsBTwbH
	iYuVftzcuyF6AsHdW8tKlLewqchRVk9sK4U1jNKZBGKK+Ac1eSU+8+mfBfT5ZPPeHq7CVtDuJViFx
	XMKuLLmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeUy-0000000G7pX-0JHB;
	Fri, 20 Jun 2025 16:21:52 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSe6F-0000000G43x-3M6U;
	Fri, 20 Jun 2025 15:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oQ
	ZPCQlL01STFivOq4uM2KDIfp6YbbOsKwLoJEg45CM=; b=VBrUoXzc2gSTvyzwq7
	EBr6Og07qOm0qv+6T/jbcGNm/XzOXwvQ9UnJ0ZzTWttid231GQ8m5WFiry61vyyd
	BcoXHnJnN2lFjDon8RCz4/HPHeVaTtdR5PQlEGYSZU4Z6B97+aS6QFiQelc+E02t
	vTX7rYeRG9LUWLC8sGSJX9alE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDHyCldhFVo3bDnAg--.55764S2;
	Fri, 20 Jun 2025 23:55:10 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
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
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v5 0/2] Configure root port MPS during host probing
Date: Fri, 20 Jun 2025 23:55:05 +0800
Message-Id: <20250620155507.1022099-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHyCldhFVo3bDnAg--.55764S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrW8AFWrWF4fWrWfuryDJrb_yoW8uw4DpF
	WfGan3trs7GF13GF9rWa1kCFy5Xa4xGFWUGr9rJwnxZanxAFyUXry8Kw4rA3srXrWfZ3W2
	9F1jqFy8u3WDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pina9fUUUUU=
X-Originating-IP: [240e:b8f:919b:3100:8440:da7c:be7e:927f]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiQwdyo2hVgfhDOQAAsr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_085620_194926_BA6DF61F 
X-CRM114-Status: UNSURE (   7.79  )
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
Changes for v5:
- Use pcie_set_mps directly instead of pcie_write_mps.
- The patch 1 commit message were modified.

Changes for v4:
- The patch [v4 1/2] add a comment to explain why it was done this way.
- The patch [v4 2/2] have not been modified.
- Drop patch [v3 3/3]. The Maintainer of the pci-aardvark.c file suggests
  that this patch cannot be submitted. In addition, Mani also suggests
  dropping this patch until this series of issues is resolved.

Changes for v3:
- The new split is patch 2/3 and 3/3.
- Modify the patch 1/3 according to Niklas' suggestion.

Changes for v2:
- According to the Maintainer's suggestion, limit the setting of MPS
  changes to platforms with controller drivers.
- Delete the MPS code set by the SOC manufacturer.
---

Hans Zhang (2):
  PCI: Configure root port MPS during host probing
  PCI: dwc: Remove redundant MPS configuration

 drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
 drivers/pci/probe.c                    | 10 ++++++++++
 2 files changed, 10 insertions(+), 17 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.25.1


