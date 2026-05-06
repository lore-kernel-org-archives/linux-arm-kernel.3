Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE707CD3443
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fWcSjK7EV2ez99Q2HCbUPG3YXPdtccdv6DKjz8LT2Wk=; b=YluspPhtAMYKlm8viZf9+WQZKB
	Y58j2leDbENqqxvEpNlwv1wWk2i3hBJOC+RWOat+UOULLLOqkWCSAhFTGY+wwMIbwWgyFV+jgNcNt
	hGBjeo1+O9C+SOkxr9KG8xJV3FKv80GOgB20HGS3hOn7m8uxQ9PEr7G0UfHVSUN4jtGxXLwmMgwqg
	T09IZ7K7pllef3nT8psLXSeVQisXeCzUPw2DncEeqSV1a6lMX3M9aog+FZ7MBWU7ofxuNc/GPQf9Y
	ZCMM0cmNllHUOGHg295aDUcM9wd8KgrNeQ6pvpvz72HYJt/JSHvLDgCHUjLYmTsrfS7KMZdrDewHB
	npQ5jcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7K-00000001Iy6-0J5T;
	Wed, 06 May 2026 15:24:54 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7G-00000001Iu5-3Pb3;
	Wed, 06 May 2026 15:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fW
	cSjK7EV2ez99Q2HCbUPG3YXPdtccdv6DKjz8LT2Wk=; b=H1c5bR0lY6woK98BBu
	KS1lpJyYa+aqcVLHMqhvEee3O5SrDi8RoKrITFon2F0a3pmd/80Fg8StTNo9v/+/
	Ml9B6c9lyIb8uaTqsDOkImVrTmRqoSRu+9XEq8gcMjUrUgD1na/NeLoph0Imcc2d
	jaxf8+gpSe1cgQtuh5qHHqdYs=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCHAqsXXftpv5CgDg--.43926S2;
	Wed, 06 May 2026 23:24:08 +0800 (CST)
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
	jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 0/8] PCI: Add common helper for 100 ms delay after link training
Date: Wed,  6 May 2026 23:23:38 +0800
Message-Id: <20260506152346.166056-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHAqsXXftpv5CgDg--.43926S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF48ArWDZFyxXr13tr17Awb_yoW5trykpF
	WrGrWSkFn7JrWYv3Z5A3W7ury5W3Z5G3y7Jws7K34xXry3C3W3Jr1IqFs5tF9rGrWkZr12
	vw1Ut3WDCa90yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziDPEfUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xm2Wmn7XRnXsQAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082451_202028_339C5E70 
X-CRM114-Status: GOOD (  12.41  )
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

PCIe r6.0, sec 6.6.1 (Conventional Reset) states:

- For a Downstream Port that supports Link speeds greater than 5.0 GT/s,
  software must wait a minimum of 100 ms **after Link training completes**
  before sending a Configuration Request to the device immediately below
  that Port.

Several PCIe host controller drivers currently omit this 100 ms delay
when the negotiated link speed is Gen3 (8 GT/s) or higher. Only the DWC
driver already implements it. The missing delay can lead to violations
of the PCIe specification.

To fix this consistently and avoid code duplication, this series:

  1. Adds a static inline helper `pcie_wait_after_link_train()` in
     drivers/pci/pci.h. The helper checks the given max_link_speed
     (or negotiated speed) and calls msleep(100) if the speed is > 5 GT/s.

  2. Converts the DWC driver to use this helper.

  3. Adds the missing 100 ms delay to the Cadence PCIe controller
     (both LGA - Legacy Architecture IP - and HPA - High Performance
     Architecture IP) after introducing a `max_link_speed` field in
     struct cdns_pcie.

  4. Adds the delay to the Aardvark, MediaTek Gen3, and Renesas RZ/G3S
     host drivers, reusing their existing link speed fields.

All changes are placed exactly where the driver has just finished
waiting for the link to come up, i.e., immediately after link training
completes and before any Configuration Request would be issued.

---
Our company's product is based on the HPA IP from Cadence. When connecting
to different devices, we encountered issues with the enumeration failure
when connecting to the NVIDIA RTX5070 GPU and the NVMe SSD with PCIe 5.0
interface. Our code is based on: 80dc18a0cba8d ("PCI: dwc: Ensure that
dw_pcie_wait_for_link() waits 100 ms after link up").
---
Changes since v2:
- Add pcie_wait_after_link_train() helper
- Reduce repetitive code comments and have each Root Port driver use the
  helper function instead.
- Increase the delay to 100ms after enabling the link-up that distinguishes
  between Cadence LGA and HPA IPs.
- Add the Aardvark, MediaTek Gen3, and Renesas RZ/G3S Root Port driver. When
  the speed is greater than GEN2, a delay of 100ms should be applied.

v1:
https://patchwork.kernel.org/project/linux-pci/patch/20260501153553.66382-1-18255117159@163.com/
---
Hans Zhang (8):
  PCI: Add pcie_wait_after_link_train() helper
  PCI: cadence: LGA: Add max_link_speed field and 100 ms delay after
    link training
  PCI: cadence: HPA: Add 100 ms delay after link training
  PCI: j721e: Set max_link_speed to enable 100 ms delay after link up
  PCI: dwc: Use common pcie_wait_after_link_train() helper
  PCI: aardvark: Add 100 ms delay after link training
  PCI: mediatek-gen3: Add 100 ms delay after link training
  PCI: rzg3s-host: Add 100 ms delay after link training

 drivers/pci/controller/cadence/pci-j721e.c          |  1 +
 .../controller/cadence/pcie-cadence-host-common.c   |  4 ++++
 .../pci/controller/cadence/pcie-cadence-host-hpa.c  |  3 +++
 drivers/pci/controller/cadence/pcie-cadence.h       |  2 ++
 drivers/pci/controller/dwc/pcie-designware.c        |  8 +-------
 drivers/pci/controller/pci-aardvark.c               |  4 +++-
 drivers/pci/controller/pcie-mediatek-gen3.c         |  2 ++
 drivers/pci/controller/pcie-rzg3s-host.c            |  2 ++
 drivers/pci/pci.h                                   | 13 +++++++++++++
 9 files changed, 31 insertions(+), 8 deletions(-)


base-commit: a293ec25d59dd96309058c70df5a4dd0f889a1e4
-- 
2.34.1


