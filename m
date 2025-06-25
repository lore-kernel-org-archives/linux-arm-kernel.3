Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552BCC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 02:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=uDMB1Z9AjVBe8c2zXxGE4Co7kt+hAiHK3QF5M3qdFBQ=; b=b+Gw5THMtloGsHgzXBrBTOSXl8
	vXjBsXi1/ZZs+11V5Pk3gthEflyBXE1p3d2F9y9yPpp+YaJtHpUkRfMkZticTd8Uhz5EFKVT4vErr
	VORR7QDy2zE5K8HTGbvtG7xv0P7HmQk7WL6nSCUx77aG6U9N7HJBCQKincDVP6uQOs0vC0mTUUpzc
	3gMvFSwoN4JAjMGX9GQOaJo6oMWI+WiIraVaPMEaYwnZ7XGKBa1cE2TzyKP/XPuO64lDwztk03vLq
	BJXCvRyvxG6tt3BuSrw40X2iK+yjqnIgjxOkAK+hW6rYMthUYEX9pQH8wKHCTyPmZ+esKkfmCerv+
	l5dysOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcWR-0000000ASvu-3MlE;
	Thu, 26 Jun 2025 02:39:31 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcU6-0000000ASGb-1bM2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 02:37:09 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250626023658epoutp04514d4ded9f58ecedda301c21c046f272~MdzN_vvm12446924469epoutp04s
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:36:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250626023658epoutp04514d4ded9f58ecedda301c21c046f272~MdzN_vvm12446924469epoutp04s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750905418;
	bh=uDMB1Z9AjVBe8c2zXxGE4Co7kt+hAiHK3QF5M3qdFBQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=LFbSOWBdPiv/5Afw4wRBYQ5xMdOgj7HY4Kd2lrrBUIQLvbHXm8DgL8SUU19H7OvDv
	 S4Z+ZWdfxahT7zGXF8uhFrdphvPuEmYY5mtkKCOuCG07z16Y4WpWAv4hv/mGY+QXFI
	 i9YcQhaqMfrzMbDHU/uOvsAcZki2a8dwoIXL9NRY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250626023657epcas5p4a4a1cf57a1aa0c4c264120eec35ec18a~MdzNWH9ju2563825638epcas5p4e;
	Thu, 26 Jun 2025 02:36:57 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.183]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bSN9z4Sl6z6B9mC; Thu, 26 Jun
	2025 02:36:55 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250625165241epcas5p471ca039a776513c4da7ee2a0955de5c2~MV1EnqnFE0913509135epcas5p4d;
	Wed, 25 Jun 2025 16:52:41 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625165238epsmtip2a96f05e6c212ccb6164b2e3fc64e727e~MV1B4OmR01741117411epsmtip2L;
	Wed, 25 Jun 2025 16:52:38 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-fsd@tesla.com
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>
Subject: [PATCH v2 00/10] Add PCIe support for Tesla FSD SoC
Date: Wed, 25 Jun 2025 22:22:19 +0530
Message-ID: <20250625165229.3458-1-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250625165241epcas5p471ca039a776513c4da7ee2a0955de5c2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250625165241epcas5p471ca039a776513c4da7ee2a0955de5c2
References: <CGME20250625165241epcas5p471ca039a776513c4da7ee2a0955de5c2@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_193707_054442_716D0046 
X-CRM114-Status: GOOD (  17.53  )
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

FSD platform has three instances of DesignWare based PCIe IP,
one is in FSYS0 block and other two in FSYS1 block.
This patch series add required DT binding, DT file modifications,
Controller driver support and PHY driver support for the same.

To keep single PCIe controller driver for all Samsung
manufactured SoC, we have made changes to Exynos file to extend
support for FSD platform and other Samsung manufactured SoCs which
shall be upstreamed soon.

First a version was posted as a separate driver file:
https://lore.kernel.org/lkml/20221121105210.68596-1-shradha.t@samsung.com/
This was rejected and request was made to add the support in exynos file
itself.

Then another patchset was posted to refactor existing exynos file:
https://lore.kernel.org/lkml/649a8d88-0504-5aa9-d167-d25d394f3f26@linaro.org/T/
This requested some major changes

Taking both these reviews into consideration, I have posted a fresh
patchset where both changes to exynos framework and addition of new FSD
support is present.

v2:
 - Reordered patches for removing unused MACROs and renaming them
 - Fixed all incomplete DT bindings
 - Modified PHY driver code to adopt better design
 - Removed patch to add alignment data in PCI endpoint test driver
 - Added dts changes in the patchset itself

v1: https://lore.kernel.org/lkml/20250518193152.63476-1-shradha.t@samsung.com/ 

Shradha Todi (10):
  PCI: exynos: Remove unused MACROs in exynos PCI file
  PCI: exynos: Change macro names to exynos specific
  PCI: exynos: Reorder MACROs to maintain consistency
  PCI: exynos: Add platform device private data
  PCI: exynos: Add structure to hold resource operations
  dt-bindings: PCI: Add bindings support for Tesla FSD SoC
  dt-bindings: phy: Add PHY bindings support for FSD SoC
  phy: exynos: Add PCIe PHY support for FSD SoC
  PCI: exynos: Add support for Tesla FSD SoC
  arm64: dts: fsd: Add PCIe support for Tesla FSD SoC

 .../bindings/pci/samsung,exynos-pcie.yaml     | 121 ++--
 .../bindings/pci/tesla,fsd-pcie-ep.yaml       |  91 +++
 .../bindings/phy/samsung,exynos-pcie-phy.yaml |  25 +-
 arch/arm64/boot/dts/tesla/fsd-evb.dts         |  36 ++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi    |  65 ++
 arch/arm64/boot/dts/tesla/fsd.dtsi            | 147 +++++
 drivers/pci/controller/dwc/pci-exynos.c       | 568 +++++++++++++++---
 drivers/phy/samsung/phy-exynos-pcie.c         | 317 +++++++++-
 8 files changed, 1240 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml

-- 
2.49.0


