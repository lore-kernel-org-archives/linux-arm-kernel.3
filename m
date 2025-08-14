Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D46CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f5UMD/xY6n74rTwJzCF49EHwD8igFHe+owBVi4TP2j4=; b=lu5Z5kjI0+eHMQav2Olgdp3Pga
	eyBD5CZUYgK0pjgFnQMc5l/Pl2YWIHVHo9t2kFejcom2yDOTIiH14h4z8pK3a7sY8Nhnztb9GH+1y
	6nZo+DDXdNzsrmL1TasURMTmdI2j85goGxcVe1uo57+iBmyOHHIQtmueSNkM/RNd1mrAZySb/x6aW
	5n30Rondhv+Wr5v2mO2HLfO793tAaBiwCuxR8m+mcgwbnufSq9XQ3x7Ac6j6BS+N7QCFXsyUGa95F
	cE/WyhZeScSGLw17laT0noIEK/HpZnn0A4CyPBJyQvH2GcCwU8Uriq7XI9iqK9YJH3l+ZGoq2SHR2
	1lzBRflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma5h-0000000HVwg-1QZx;
	Thu, 14 Aug 2025 15:42:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZm1-0000000HQ3F-2g65;
	Thu, 14 Aug 2025 15:21:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E644601D8;
	Thu, 14 Aug 2025 15:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CBDC4CEED;
	Thu, 14 Aug 2025 15:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755184908;
	bh=BxH6frzEx2Nl3V2ClnA48ry3Dd7sJkgks2idYBbkBRI=;
	h=From:To:Cc:Subject:Date:From;
	b=iNWpmuQKfgFHOHkXVDC2foQTi3+J+peXo2P1+gHRDe4BfU1c99GqsNMzEY/U6LPvH
	 50j+Wm0cqy3iul7p7cdbh9W/VRa220LYzlGK/JGMnJU2p65iwV+8Y2TJcocMZqYT/y
	 CbuMvlQWDwQmzyQJvQm1uNz/fo9Sbz5j4/mPSIMjdrbHf4UnKCAbH1TF8yqAtB2Ckd
	 1k16TQ4se2ILx02IeaOKovaGBCaWbFJ8/fGmCudak3Q6z1MpiZVgE8pIgCabCYJQbo
	 0jG10pkamtAmu/qxmbaKY7kfqDCjaPS8Tgns41D5X1Yfljr2OMr/40zY/QZL2hijLS
	 TyPbFNyxu1orw==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 00/13] PCI: Drop superfluous pci_epc_features initialization
Date: Thu, 14 Aug 2025 17:21:19 +0200
Message-ID: <20250814152119.1562063-15-cassel@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2026; i=cassel@kernel.org; h=from:subject; bh=BxH6frzEx2Nl3V2ClnA48ry3Dd7sJkgks2idYBbkBRI=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDLm/vvApNE/bZPy/8YKh26Pres/ct7tSfT5wTUv13x/f 99CNZ1vHaUsDGJcDLJiiiy+P1z2F3e7TzmueMcGZg4rE8gQBi5OAZiIJR8jw/ZnrL9lb2jOOcXT LTbpfry0xJMNyfXGl2/+3bF76tk7VtsZGZ4cq779xajRP4xPaPftGJbfzr+WH3wo5bTo2sEIvbs LfvIBAA==
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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

Hello all,

struct pci_epc_features has static storage duration, so all struct members
are zero initialized implicitly. Thus, remove explicit zero initialization
of struct members.

Series is based on pci/next.

Feel free to squash to a single commit if that is preferable.

Kind regards,
Niklas


Niklas Cassel (13):
  PCI: cadence-ep: Drop superfluous pci_epc_features initialization
  PCI: rcar-ep: Drop superfluous pci_epc_features initialization
  PCI: rockchip-ep: Drop superfluous pci_epc_features initialization
  PCI: dra7xx: Drop superfluous pci_epc_features initialization
  PCI: imx6: Drop superfluous pci_epc_features initialization
  PCI: keystone: Drop superfluous pci_epc_features initialization
  PCI: artpec6: Drop superfluous pci_epc_features initialization
  PCI: designware-plat: Drop superfluous pci_epc_features initialization
  PCI: dw-rockchip: Drop superfluous pci_epc_features initialization
  PCI: keembay: Drop superfluous pci_epc_features initialization
  PCI: qcom-ep: Drop superfluous pci_epc_features initialization
  PCI: rcar-gen4: Drop superfluous pci_epc_features initialization
  PCI: tegra194: Drop superfluous pci_epc_features initialization

 drivers/pci/controller/cadence/pcie-cadence-ep.c  | 2 --
 drivers/pci/controller/dwc/pci-dra7xx.c           | 1 -
 drivers/pci/controller/dwc/pci-imx6.c             | 4 ----
 drivers/pci/controller/dwc/pci-keystone.c         | 1 -
 drivers/pci/controller/dwc/pcie-artpec6.c         | 2 --
 drivers/pci/controller/dwc/pcie-designware-plat.c | 1 -
 drivers/pci/controller/dwc/pcie-dw-rockchip.c     | 2 --
 drivers/pci/controller/dwc/pcie-keembay.c         | 1 -
 drivers/pci/controller/dwc/pcie-qcom-ep.c         | 1 -
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 2 --
 drivers/pci/controller/dwc/pcie-tegra194.c        | 2 --
 drivers/pci/controller/pcie-rcar-ep.c             | 2 --
 drivers/pci/controller/pcie-rockchip-ep.c         | 1 -
 13 files changed, 22 deletions(-)

-- 
2.50.1


