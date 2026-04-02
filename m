Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB6AD3942E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uheuigAt51hXKsD9B+v7gKCUGf5jzHjoKGXCK5IPGks=; b=s82JHa8gy4nWOy
	hzdewXiAEFbPRP3d0o/jhhX/8GJ5dz11qns24as7dEe4GN5UJbo/pI3djphu/7S9y8QIJjbLSpJ8Q
	4XUnwmRNfncZpKLAQWjr3dkTEMv7LMsmmRR1Xul8fWwQPkr3xyoY/x76xuhtNmUs7k+P7D2MptD61
	qBCdfJQOiyHvBYC0PNECPCkOf63ZYQXVHwVbLYZCaXrWpTiek/Mng2YkBSixHRoXZtFcKn4Q5YTuM
	jInFYMu7iWDyubcUi6GpNNNh/V4XSz0KBXuIkXMC5Jg/Y1+ZUWipITtdO62o5eMGyGVRs+xeFz6Sr
	yWyaltfscFd1InFM5hXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1Y-00000000Kmh-3Z5E;
	Thu, 02 Apr 2026 14:27:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1Y-00000000Kjg-15GJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A004600C4;
	Thu,  2 Apr 2026 14:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDECC116C6;
	Thu,  2 Apr 2026 14:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775140074;
	bh=Zer/BJD+qJqeBtob+isjMLL/b+ilLo5Tgi4DcTu1vu0=;
	h=From:Subject:Date:To:Cc:From;
	b=S4b7ctXJxnf+ZsiRGJaBCXbBWCNAusE0H5aSNAbYVB8YMWhXLLscg3uvZrwL0kI3z
	 YeA4WglrmVRjUrvU1/0/MkuWlJTJGZcSUEC/9FzD9TvG6pFw0e6I+5z6Ue2Xd6Fswy
	 vmTLrhmV94Wtssm7kOk7QBONGTtExTu0JeIp4Sf+njAuyzu8aht14JPKUOD9ID7Hps
	 9ojezoGOoICwjAaE51P6XYk73bYF62yhRpGA8pouvb6i+ASx7sBnpnl9VwODsOIPKh
	 zBdUVcYk/cEtVYhDs3vrpeg8esHZH/IGEqZR2WKxjaX/ZpIK84qr9M2VUm1uHgK7nc
	 PN0tV1nss3W3A==
From: Thierry Reding <thierry.reding@kernel.org>
Subject: [PATCH v4 0/4] PCI: tegra: Add Tegra264 support
Date: Thu, 02 Apr 2026 16:27:34 +0200
Message-Id: <20260402-tegra264-pcie-v4-0-21e2e19987e8@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr2K6tk1n2oK48h7GBcIIowbIFInGc
 HeLblzpZvJ/8t+bp4okTFFtV08lNHHkvkvFr1eqasuuIc116gotZtZb1CM1UmLm9VAxaXK2PBK
 6urS5SswgdOL727c/fHq8Hc9UjYtkWbQcx14e74cTLLuP20EBmQWwBiHl4DXosWUSeRihmrtmd
 yHp6Gp6adTinvCLTheD985gyKFA+59233QGLmxCMJgXAXzxm57n+QVw0+cMOAEAAA==
X-Change-ID: 20260402-tegra264-pcie-e30abe23da07
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>, 
 Manikanta Maddireddy <mmaddireddy@nvidia.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2819; i=treding@nvidia.com;
 h=from:subject:message-id; bh=Zer/BJD+qJqeBtob+isjMLL/b+ilLo5Tgi4DcTu1vu0=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBpznzn8GyWDCsk1KnLx87ijwIsQ/CXd+W6jaRvz
 pYORK2DmqCJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCac585wAKCRDdI6zXfz6z
 oWqnEACMzABpCGQB5QXhKC4LEdSLeJcPJRNZXPlzNzEEQPiyHCdNBOi0FeNAEDqd5smgl4E6vtj
 Gio5rrUK6cCmPlAfN50Ne6AhAqGjuxzhgXPrGnkAXswhUIPs9sf/UrDP0ze2nNrd1/kYFvAe/Av
 NoIvra40dSEw4p6F1wucit7xC3ICCtLl7PWs4R8+CLM/mVRV3XR5G4gj9e4Hj8uzMJMCfN56EFc
 qgDj2OT37ewuSItdcySi0LpPydLhYd5+pWrFCvfL0xldAoTkt6kpvMQrlr8Z8tMufYVT8ZN8bLj
 e/9xk326peBDniUdJ0qm1FT2q+/MW2mVrOeZzJJC9Gu7cA4oBbpElmxE/9h+W3Doe/bl6GSs3fb
 M0dNca/uFpnXptbS6p2JIhbjwH2JcJcPoBwUZSKx5OvsNLNBdJCegmZcvlhBfixTM5AmbbSVkZ6
 UaUjYO0w17ZUanXoNjGsIhKN0FEzjSjgGxa+SncXAlIv1LOuZwXXYbE8+iOuHxkmcs/FKZT6kZ8
 DDCFhevxHUGMtnsleZTQi5BtoIsgZFYL1CqtrkSRujlwGhlBzUO6/CT65ZluAp6ZtKD1RZ779d5
 6JT0LnQgP21WPDPZuBbHe1FiDAB79fSenKiLeX/vhBENsVDvXTio1Q7/WR10QyKEObu9i1KSIwX
 z4qZRDuviV3Yf1g==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
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

Hi,

this series adds support for the PCIe controllers found on the Tegra264
SoC. There are six instances, one of which is for internal purposes only
and the other five are general purpose.

The first two patches in the series add the BPMP support needed to power
up/down the PCI link. Patch 3 contains the device tree bindings for the
PCIe controller. Before adding the driver in patch 5, patch 4 introduces
some new common wait times for PCIe and unifies the way that drivers use
them. Finally, patch 6 adds DT nodes for the controllers found on the
Tegra264 SoC.

Note that this cannot be applied for v7.1-rc1 because there's a build
dependency that's going through the Tegra tree. If you'd like to merge
this, please let me know and I can provide a branch with the
dependencies resolved.

Changes in v4:
- strip out dependencies that are going in through the ARM SoC tree
- revert bindings to oneOf construct so that we don't produce new DTC
  warnings
- Link to v3: https://patch.msgid.link/20260326135855.2795149-1-thierry.reding@kernel.org

Changes in v3:
- integrate PCI standard wait times patch into the series to maintain
  bisectability
- fix review comments from Mikko
- Link to v2: https://patch.msgid.link/20260320225443.2571920-1-thierry.reding@kernel.org

Changes in v2:
- fix an issue with sanity-checking disabled BARs
- address review comments
- Link to v1: https://patch.msgid.link/20260319160110.2131954-1-thierry.reding@kernel.org

Thanks,
Thierry

---
Thierry Reding (4):
      dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
      PCI: Use standard wait times for PCIe link monitoring
      PCI: tegra: Add Tegra264 support
      arm64: tegra: Add PCI controllers on Tegra264

 .../bindings/pci/nvidia,tegra264-pcie.yaml         | 174 +++++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 248 ++++++++--
 drivers/pci/controller/Kconfig                     |  10 +-
 drivers/pci/controller/Makefile                    |   1 +
 .../controller/cadence/pcie-cadence-host-common.c  |   6 +-
 .../pci/controller/cadence/pcie-cadence-lga-regs.h |   5 -
 drivers/pci/controller/mobiveil/pcie-mobiveil.c    |   4 +-
 drivers/pci/controller/mobiveil/pcie-mobiveil.h    |   5 -
 drivers/pci/controller/pci-aardvark.c              |   7 +-
 drivers/pci/controller/pcie-tegra264.c             | 527 +++++++++++++++++++++
 drivers/pci/controller/pcie-xilinx-nwl.c           |   9 +-
 drivers/pci/controller/plda/pcie-starfive.c        |   9 +-
 drivers/pci/pci.h                                  |   2 +
 13 files changed, 946 insertions(+), 61 deletions(-)
---
base-commit: bfbb8533d7293235b71e4096cc0bc9a5c0c20b20
change-id: 20260402-tegra264-pcie-e30abe23da07

Best regards,
--  
Thierry Reding <treding@nvidia.com>


