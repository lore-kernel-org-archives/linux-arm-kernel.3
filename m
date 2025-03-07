Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E744BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ONfCbFvRTC0wtjI4q0xkEGyj03AMzM22PYHe8Bw4+g=; b=wTTcfk+dwnHW1I8mqi4tHamk+P
	Wh+mYshSkCrOJ18J+NYKsJB6dsis54N2RZOYPUiBeYnsQtA/xLLpTckuGpT0BcI9KjMz+DP8C1cwu
	z5Lpw2ZYDXUuGDWu0PCBiryF75ZTL8+x2fDfi9lNRgngdxYRAoAZ298qD/+H+xpm6dAlQYclXrnZK
	Q7EvaIxAl3XsrBFqUKccRq3jumU53J5k/mvwwXpf42nm1g+2v6Jwh56yGcojpS7tse0qdGmC3/KVZ
	T4ptC6YHtbA0FuGSit9prvmrscz6T/7SR2dVeTXZwwjFGIipG1fTigoY+UE6GgenOmxzFpgSUOnbq
	yDShIhqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhJb-0000000FqBW-3rI8;
	Fri, 07 Mar 2025 23:41:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhGL-0000000FpTD-2ZXY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 23:37:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C9575C624E;
	Fri,  7 Mar 2025 23:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A26C4CED1;
	Fri,  7 Mar 2025 23:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741390672;
	bh=ntJVwAlnC7PYrvIOC5jK7B6yxVs/a1jXq1ba53Gp12E=;
	h=From:To:Cc:Subject:Date:From;
	b=uLya8N82ynikuLeVwl0uwksI1eaD3k60c8OjDE2TxI/rfoZC6qD9odpBM2qVC4tSv
	 0t42V9ybYVU1PznQs3ZBnY8c/MKiauAjGnQz8dAlQo095PH1h9l1UNSsuMpFndvpWD
	 CaUsPUNvOLBT8joky0bNXIuxaQnK5hB6xJ4288VdQ7VwPgVhlOyoBKM49S4cV+Y0Z9
	 ISDeTw3g2z+CCbPhu2IzM5YAOQouFxRBh7pT3w0jqN7DybrRjxHufkgB/2OTr+JuD5
	 XvCkZcpq3OdmFfjdoZ4DKBwY5hhtJpLAkarFmedPmTw4cm1LC4Gpm3vhTVadTMzdJg
	 xAagsnBPxfhOw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 0/4] PCI: dwc: .cpu_addr_fixup() sketch
Date: Fri,  7 Mar 2025 17:37:40 -0600
Message-Id: <20250307233744.440476-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_153753_765171_18C4CBBA 
X-CRM114-Status: GOOD (  15.17  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

This is not complete or ready to merge at all.  It's just a sketch to see
if this approach to moving away from the .cpu_addr_fixup() approach is
feasible.

This is based on Frank's series at
https://lore.kernel.org/r/20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com,
and these apply on top of these patches from that series, which applies on
v6.15-rc1:

      PCI: dwc: Use resource start as iomap() input in dw_pcie_pme_turn_off()
      PCI: dwc: Rename cpu_addr to parent_bus_addr for ATU configuration
      PCI: Add parent_bus_offset to resource_entry

The idea is that on some systems the PCI controller lives in a different
address space (an "intermediate" address space) than the CPU physical
address space.  Frank has a beautiful picture of this at
https://lore.kernel.org/r/20250128-pci_fixup_addr-v9-4-3c4bb506f665@nxp.com

The devicetree *should* describe the fabric address translation between the
CPU and intermediate address spaces, but historically we haven't taken
advantage of that and have used .cpu_addr_fixup() functions to convert CPU
to intermediate addresses each time we program the ATU.

What I tried to do here was to:

  - Try to extract the offset from devicetree using the 'reg' property
    (this is from Frank's patch at the link above)

  - If a .cpu_addr_fixup() function exists, run that as well and compare
    with the offset from devicetree

  - Save the offset in struct dw_pcie_rp and apply that instead of calling
    .cpu_addr_fixup() in the future

  - Emit messages about devicetree offsets that don't match what
    .cpu_addr_fixup() did, or about .cpu_addr_fixup() methods that are
    superfluous because they *do* match the devicetree offset

I only looked at the RC side and didn't do anything at all with the EP
side.

Bjorn Helgaas (4):
  PCI: dwc: Move cfg0 setup to dw_pcie_cfg0_setup()
  PCI: dwc: Delay cfg0 setup until after discovering bridge windows
  PCI: dwc: Look up 'config' address
  PCI: dwc: Use parent_bus_offset

 .../pci/controller/dwc/pcie-designware-host.c | 88 +++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.c  |  3 -
 drivers/pci/controller/dwc/pcie-designware.h  |  1 +
 3 files changed, 72 insertions(+), 20 deletions(-)

-- 
2.34.1


