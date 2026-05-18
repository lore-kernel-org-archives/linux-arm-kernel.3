Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF575CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 00:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=71TiXWZeiNEnZ9aHbMl8KHb/RAdwEUbQt5Z1vVI0djc=; b=aA9pGh4GsYgSoRgWxr3nvXCgS9
	trygQnNFcUXwe4+zYnh61rJ5TT/cgyTeJNrnuluCzGk4LCFSYft6Yhf4/AAYoyWlxCjDJrOzTD71O
	FQzD+PJyNi739aUwjBOThscmaR+po70Wj2UNnb+jFOlqxmBCKJ6BubCfa+rEq3/nePPXYyWv+5SZo
	P9htNFSIfMUbyE35pvDl+gpRUB1oHMPI4fmVeyqFGp4Co2T4l1udbB93n8qr/H2VvAZ/gupF9ZCJq
	GUs6xYBhH+bHJtnafH29j5rhO0/bn3h0zfj0Tk7P2IBunYcBRxg402qhdPKFBFZWNJmWBtohLklus
	MmoNW2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOm55-0000000DlPA-33uZ;
	Mon, 18 May 2026 00:43:39 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOm53-0000000DlMy-0NKT;
	Mon, 18 May 2026 00:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=71
	TiXWZeiNEnZ9aHbMl8KHb/RAdwEUbQt5Z1vVI0djc=; b=FvbFaNgDlCc4BH7ZQ1
	bkLp4gMSaI26ucPewKKL6mBMwC5aiuJWuc3zL+9jmS/rBKTF5U+8iFn73uCG2k5g
	NZGjlktM7zIP8E4e47SFrWY9AJ0ANDzELqXQc0ByfzH4mkM3OPnq9UN2VDXf+rmf
	aTVUPpmOEnUdcRQWNYOch+W0U=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnj6SIYApq2fikCA--.4779S2;
	Mon, 18 May 2026 08:42:50 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
	ryder.lee@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v4 0/7] PCI: Add common helper for 100 ms delay after link training
Date: Mon, 18 May 2026 08:42:39 +0800
Message-ID: <20260518004246.1384532-1-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnj6SIYApq2fikCA--.4779S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr15WF1xZFWfGw17WF4DArb_yoWrKr1xpF
	WrGrWSk3Z7XFWYvws7A3W7u34Yg3Z3G34Ut3ykK34xZrnrAFyYvrWI9FWvvFy7GrWkXrnF
	y3WUK3ZrCw12yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUkucUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAxY+2oKYIwFAAAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_174337_478014_44D3DF4B 
X-CRM114-Status: GOOD (  11.94  )
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

PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
Port supporting Link speeds greater than 5.0 GT/s, software must wait a
minimum of 100 ms after Link training completes before sending any
Configuration Request.

Several PCIe host controller drivers currently omit this 100 ms delay
when the negotiated link speed is Gen3 (8 GT/s) or higher. Only the DWC
driver already implements it. The missing delay can lead to violations
of the PCIe specification and cause enumeration failures with high-speed
devices (e.g., NVIDIA RTX5070 GPU, PCIe 5.0 NVMe SSDs).

To fix this consistently and avoid code duplication, this series:

  1. Adds a static inline helper `pci_host_common_link_train_delay()`
     in `drivers/pci/controller/pci-host-common.h`. The helper checks
     the given max_link_speed and calls msleep(100) if speed > 5 GT/s.

  2. Converts the DWC driver to use this helper.

  3. Adds the missing 100 ms delay to the Cadence PCIe controller
     (both LGA and HPA IPs). A `max_link_speed` field is introduced
     in `struct cdns_pcie`. The j721e glue driver sets this field;
     other LGA glue drivers fall back to reading DT property
     "max-link-speed". HPA also reads the DT property.

  4. Adds the delay to the Aardvark and MediaTek Gen3 host drivers,
     and replaces the existing unconditional delay in the Renesas
     RZ/G3S driver with the conditional helper (per spec).

All changes are placed immediately after link training completes and
before any Configuration Request would be issued.

---
Our company's product is based on the HPA IP from Cadence. When connecting
to different devices, we encountered issues with the enumeration failure
when connecting to the NVIDIA RTX5070 GPU and the NVMe SSD with PCIe 5.0
interface. Our code is based on: 80dc18a0cba8d ("PCI: dwc: Ensure that
dw_pcie_wait_for_link() waits 100 ms after link up").
---
Changes since v4:
- Resolve the pointer reference error in patch 0002. (sashiko)

Changes since v3:
- Renamed helper from pcie_wait_after_link_train() to
  pci_host_common_link_train_delay() and moved to pci-host-common.h. (Mani)
- Reorganized Cadence patches: LGA + j721e glue in one patch, HPA separate.
- Added missing DT property reading for HPA and LGA fallback.
- Replace the existing msleep(100) call with the common helper
  pci_host_common_link_train_delay(). (Claudiu)

Changes since v2:
- Renamed helper from pcie_wait_after_link_train() to
  pci_host_common_link_train_delay() and moved to pci-host-common.h. (Mani)
- Reorganized Cadence patches: LGA + j721e glue in one patch, HPA separate.
- Added missing DT property reading for HPA and LGA fallback.
- Replace the existing msleep(100) call with the common helper
  pci_host_common_link_train_delay(). (Claudiu)

Changes since v1:
- Add pcie_wait_after_link_train() helper
- Reduce repetitive code comments and have each Root Port driver use the
  helper function instead.
- Increase the delay to 100ms after enabling the link-up that distinguishes
  between Cadence LGA and HPA IPs.
- Add the Aardvark, MediaTek Gen3, and Renesas RZ/G3S Root Port driver. When
  the speed is greater than GEN2, a delay of 100ms should be applied.

v3:
https://patchwork.kernel.org/project/linux-pci/patch/20260511055923.37117-1-18255117159@163.com/

v2:
https://patchwork.kernel.org/project/linux-pci/cover/20260506152346.166056-1-18255117159@163.com/

v1:
https://patchwork.kernel.org/project/linux-pci/patch/20260501153553.66382-1-18255117159@163.com/
---

Hans Zhang (7):
  PCI: Add pci_host_common_link_train_delay() helper
  PCI: cadence: Add post-link delay for LGA and j721e glue driver
  PCI: cadence: HPA: Add post-link delay
  PCI: dwc: Use common pci_host_common_link_train_delay() helper
  PCI: aardvark: Add 100 ms delay after link training
  PCI: mediatek-gen3: Add 100 ms delay after link up
  PCI: rzg3s-host: Use common pci_host_common_link_train_delay() helper

 drivers/pci/controller/cadence/pci-j721e.c      |  1 +
 .../cadence/pcie-cadence-host-common.c          |  4 ++++
 .../controller/cadence/pcie-cadence-host-hpa.c  |  8 ++++++++
 .../pci/controller/cadence/pcie-cadence-host.c  |  4 ++++
 drivers/pci/controller/cadence/pcie-cadence.h   |  2 ++
 drivers/pci/controller/dwc/pcie-designware.c    |  9 ++-------
 drivers/pci/controller/pci-aardvark.c           |  5 ++++-
 drivers/pci/controller/pci-host-common.h        | 17 +++++++++++++++++
 drivers/pci/controller/pcie-mediatek-gen3.c     |  3 +++
 drivers/pci/controller/pcie-rzg3s-host.c        |  3 ++-
 10 files changed, 47 insertions(+), 9 deletions(-)


base-commit: 50897c955902c93ae71c38698abb910525ebdc89
-- 
2.43.0


