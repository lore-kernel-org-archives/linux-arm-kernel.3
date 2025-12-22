Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FBFD711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=msG8vtW5um6NYWQqGUn6/O23YNr4+QRXb7+KOiLqASA=; b=swdyXKD+QAk08W2cahneDS5dky
	zpYdi6EDu1LLilLTUMY1GLlpxPJbuvaU2RET8YJiq6CKs3QVcZ8s8M68U+mpbbegkCKnGDZQvC6O7
	MLUHS5Hcsz6nVWPkhCJE10DVHLe+AtRZyUTz9tVpNVyHkLMvqdpQYrc3IhS8H96nvfUzK35291nlk
	cETPjhBdUQnyE2MKwEjZpc5a4WQv+tu6jprY+nCCAfQMjti/ntmFKE6EoS84X1Ngx8f8eTkZ7TW30
	Ugs0EMTiRwrneFS1zNWA+kkC8TV3n7YXgjBkCU+EeKLPESssKQ1vUHd7o9YF5DRn5ktBJQ1acpxAI
	do/xNppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZck-0000000DJwz-2D4G;
	Mon, 22 Dec 2025 06:42:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZch-0000000DJwP-3gQM;
	Mon, 22 Dec 2025 06:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFD7E40E40;
	Mon, 22 Dec 2025 06:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882F7C4CEF1;
	Mon, 22 Dec 2025 06:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766385744;
	bh=j/mEMdNJlnAjwrnihLKGYdQ3OZVjJQVBvrLHExhr67I=;
	h=From:To:Cc:Subject:Date:From;
	b=IfCgpAH8IAGbJyxYrETz1YYvyP0FIGZ2lg+1Hgdv0Ez+FHajVjZm+RFALf/CXLELF
	 5iCRDuqdGAslhE9nnRKBi7sbPPgSCgkyzQnHBn//SPVwDWfAhELCMmE8bg9ZoNgT4v
	 Pu3M1al55TbDY4Pue0hhu0t05TeNAsvyQq6WH7Vns2MRFmW8tl1Uk9fY4TJR5eBJKI
	 EQPCg+Iuti6xOPdFWlWeUK8iCDSid4YajJOKe5ApYRcRm0X8ZJpsJVlxWwUnSgXLRa
	 kKwm+QYx0HqpS+ext8hPDO5gaqOsadYmu7/aYzPmcpjPzOeA8dG6EJmVAWnUNfrYYa
	 WdcohC/k6ZkZw==
From: Niklas Cassel <cassel@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/6] PCI: dwc: Revert Link Up IRQ support
Date: Mon, 22 Dec 2025 07:42:07 +0100
Message-ID: <20251222064207.3246632-8-cassel@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3817; i=cassel@kernel.org; h=from:subject; bh=j/mEMdNJlnAjwrnihLKGYdQ3OZVjJQVBvrLHExhr67I=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDI9Xtj/ZN8jXWwic1qlhM3JUqik+9IE8+OrHEI5VwbV7 dzfrlffUcrCIMbFICumyOL7w2V/cbf7lOOKd2xg5rAygQxh4OIUgIn8K2RkuDvz6PbDOq8Lj9/d nn3papF6/vUz8y79q6s5pP2b+YWCYQ8jw+XEkuTZV5cvXvl06fKjYs6zOO4tZj/5qGf3VlXvdUn sN1gA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_224228_152656_502A29DA 
X-CRM114-Status: GOOD (  12.20  )
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

Revert all patches related to pcie-designware Root Complex Link Up IRQ
support.

While this fake hotplugging was a nice idea, it has shown that this feature
does not handle PCIe switches correctly:
pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46

During the initial scan, PCI core doesn't see the switch and since the Root
Port is not hot plug capable, the secondary bus number gets assigned as the
subordinate bus number. This means, the PCI core assumes that only one bus
will appear behind the Root Port since the Root Port is not hot plug
capable.

This works perfectly fine for PCIe endpoints connected to the Root Port,
since they don't extend the bus. However, if a PCIe switch is connected,
then there is a problem when the downstream busses starts showing up and
the PCI core doesn't extend the subordinate bus number after initial scan
during boot.

The long term plan is to migrate this driver to the pwrctrl framework,
once it adds proper support for powering up and enumerating PCIe switches.


Changes since v1:
-Rebased against latest pci/controller/dwc
-Picked up tags.


Niklas Cassel (6):
  Revert "PCI: dw-rockchip: Don't wait for link since we can detect Link
    Up"
  Revert "PCI: dw-rockchip: Enumerate endpoints based on dll_link_up
    IRQ"
  Revert "PCI: qcom: Don't wait for link if we can detect Link Up"
  Revert "PCI: qcom: Enable MSI interrupts together with Link up if
    'Global IRQ' is supported"
  Revert "PCI: qcom: Enumerate endpoints based on Link up event in
    'global_irq' interrupt"
  Revert "PCI: dwc: Don't wait for link up if driver can detect Link Up
    event"

 .../pci/controller/dwc/pcie-designware-host.c | 10 +--
 drivers/pci/controller/dwc/pcie-designware.h  |  1 -
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 60 +-----------------
 drivers/pci/controller/dwc/pcie-qcom.c        | 63 +------------------
 4 files changed, 6 insertions(+), 128 deletions(-)


base-commit: cfd2fdfd0a8da2e5bbfdc4009b9c4b8bf164c937
-- 
2.52.0


