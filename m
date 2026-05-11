Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD2DCD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 06:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VzmARtt+BvknoDpQvI+YBgcSlGj9WFW4WVOqaajQab0=; b=VLxbxP1MZHDmMp8crZdvS4EqYa
	j/qBGXZtDDZNN7eWQKfxehQ14v5Hbl6SfW3QCZApXdgcvvRQtiqzIfSf/MOsbkfwifp/tpyIlqwao
	/4PqLOkoG6A5LhAe+N5jPt6tlK4S1DskiKw2jY+JjAWCm4NKOX120+5LyOboE5FkpI6UXrX1NG8TJ
	Oz+fK7wQ1FQq/pE/4btgCzAdZ//qJO3kG9uqnoIaniMJizu/0vD4DIp5iXUsYe1JC5ax88v4VW2ib
	CiC0isM361jSIDQyfBtetnv+AftqAcOnQCtQL2x35uTmkx9RweEUxD4/xJ18/E1WvACFmh1gDi7Er
	R7ONZCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJgl-0000000CQec-44hX;
	Mon, 11 May 2026 06:00:24 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJgc-0000000CQZb-2OUL;
	Mon, 11 May 2026 06:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Vz
	mARtt+BvknoDpQvI+YBgcSlGj9WFW4WVOqaajQab0=; b=GjnjO+qdm9y6wd7AbI
	WkfORnAh9XnD4m5fZYJ86gLEIXWCH383ChhXICijEuklPnwvH6kBQ1CJlmxgjgOQ
	paWEZW55F5u8uh37K4XY96TDx1+ShKc4paCQT4/9zCSph0nVsMxarloUpmUlIruA
	PDNkN7YJ+WUu8Uhzehe3DrOJk=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn9yk8cAFqPHQVAw--.46705S2;
	Mon, 11 May 2026 13:59:25 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
	pali@kernel.org,
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
Subject: [PATCH v3 0/7] PCI: Add common helper for 100 ms delay after link training
Date: Mon, 11 May 2026 13:59:16 +0800
Message-Id: <20260511055923.37117-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn9yk8cAFqPHQVAw--.46705S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr15WF1xZFWfGw17WF4DArb_yoWrWw43pF
	WrGrWSkFn7WFWYvan7A3W7u34Yg3Z5J34UK3ykK34xXFnrAFyYvr4I9FWFqFy7GrWkXrnF
	y3WUK3ZrCF12yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zio5dtUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6x8GqWoBcD-IgQAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_230015_030456_92A7A8B8 
X-CRM114-Status: GOOD (  11.96  )
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
Changes since v3:
- Renamed helper from pcie_wait_after_link_train() to
  pci_host_common_link_train_delay() and moved to pci-host-common.h. (Mani)
- Reorganized Cadence patches: LGA + j721e glue in one patch, HPA separate.
- Added missing DT property reading for HPA and LGA fallback.
- Replace the existing msleep(100) call with the common helper
  pci_host_common_link_train_delay(). (Claudiu)

Changes since v2:
- Add pcie_wait_after_link_train() helper
- Reduce repetitive code comments and have each Root Port driver use the
  helper function instead.
- Increase the delay to 100ms after enabling the link-up that distinguishes
  between Cadence LGA and HPA IPs.
- Add the Aardvark, MediaTek Gen3, and Renesas RZ/G3S Root Port driver. When
  the speed is greater than GEN2, a delay of 100ms should be applied.

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


base-commit: 70390501d1944d4e5b8f7352be180fceb3a44132
-- 
2.34.1


