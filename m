Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A0AC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 09:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=8/g6vyHilQjjcSTnrPbpb3Jk/BH6c4Lj3y4koJE69UY=; b=UjzKGmbfBDnf5r95Q2P/jFNx/7
	MI/pDJCiGkgajlzv0WxfYxVNHUivSFVHGdXWmdVUg6Hy8zosPJz09+OY+J508uEDutMVp6qMHAICd
	AQ+pUTKmTipO5rFWRaKj3lNqh2/zuZru0/YnaEd1t0r7/iZw3tL8dKQ7AYYHC+GL5kPRdvTYFCOSf
	ZraneYVzxKQRZVvv+rF/IJNLbBGUx3EJ74Gc33lR0cWFQ9ck4G5djMUsUb8J/QReP3kH/pLBh1rfr
	KV3lNDhsEERfpFAQVBiWt4NJlX31muzvGo/6wrvZyWKcjoZ3eq8+WYbblZaPE4T9E8ejyhcSqN8xl
	DLTYruiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx4L-00000008dsD-3UU9;
	Mon, 19 May 2025 09:46:01 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwoL-00000008ZJs-2rOb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 09:29:31 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250519092927epoutp0478b0cde515d4855e273f2546fc6cbdde~A46huuEnl1579015790epoutp04P
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 09:29:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250519092927epoutp0478b0cde515d4855e273f2546fc6cbdde~A46huuEnl1579015790epoutp04P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747646968;
	bh=8/g6vyHilQjjcSTnrPbpb3Jk/BH6c4Lj3y4koJE69UY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=UqqKHd4puhiodSUV0+dPUdgSuRwewaKcAn0ru7d1nIcRJFY7jq5q10Q3XZ+ELDRo1
	 JEFG5+zMHTbFCyaznzS8gUN7oxIGivr7nWW17jDrr1ZvA4dl/zCYF+0FpAW3p4VMTZ
	 ifNpdDGDGObiy1amtHszeQb60MlgcGblC8nJPknU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250519092927epcas5p29cc7c78741885d807b4862e37da451c1~A46hKQYX51126411264epcas5p2q;
	Mon, 19 May 2025 09:29:27 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.177]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4b1C7V1cHCz6B9mH; Mon, 19 May
	2025 09:29:26 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250518193219epcas5p24b442233b3e2bc2a92f43b71a126062f~AtfmzdgcQ1923619236epcas5p2D;
	Sun, 18 May 2025 19:32:19 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250518193217epsmtrp2417411fcc9c4c964f7a98b47e7b54e7c~AtfkhlhkH0348003480epsmtrp2Z;
	Sun, 18 May 2025 19:32:17 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-0e-682a35c036f9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	80.C1.08766.0C53A286; Mon, 19 May 2025 04:32:16 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250518193214epsmtip19e58f6b1d64d38c1d3222269b76999bd~Atfhxhd2e0974409744epsmtip1d;
	Sun, 18 May 2025 19:32:13 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, Shradha Todi
	<shradha.t@samsung.com>
Subject: [PATCH 00/10] Add PCIe support for Tesla FSD SoC
Date: Mon, 19 May 2025 01:01:42 +0530
Message-ID: <20250518193152.63476-1-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42LZdlhJTveAqVaGwaN/5hYP5m1js/g76Ri7
	xZKmDIs1e88xWcw/co7V4savNlaLFV9mslscbf3PbPFy1j02i4ae36wWmx5fY7W4vGsOm8XZ
	ecfZLCas+sZicfb7AiaLlj8tLBZrj9xlt7jb0slq8X/PDnaL3sO1FjvvnGB2EPX4/WsSo8fO
	WXfZPRZsKvXYtKqTzePOtT1sHk+uTGfy2Lyk3qNvyypGjyNfp7N4fN4kF8AVxWWTkpqTWZZa
	pG+XwJXR8O8KS8ExoYqOOUdYGxj/8XUxcnJICJhIbP1yhb2LkYtDSGA3o8S0x7uZIRKSEp8v
	rmOCsIUlVv57DlX0iVHi+cs5YEVsAloSjV+7wGwRgROMEn23LEGKmAXeM0nMXPALrFtYwFLi
	zIopYDaLgKrEic3bwRp4Bawk5px5CRTnANogL9HfIQERFpQ4OfMJC4jNDBRu3jqbeQIj3ywk
	qVlIUgsYmVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgRHl5bmDsbtqz7oHWJk4mA8
	xCjBwawkwrtqs0aGEG9KYmVValF+fFFpTmrxIUZpDhYlcV7xF70pQgLpiSWp2ampBalFMFkm
	Dk6pBqbW+rQ4rZcz5rWuOVp96ctH83kTJG8s8lpqzMQZwe1yb+3n6CL7tx+q1e5qNFydyVve
	mvGxJUTdnrXJIbDe+O7Jo5qNyk6velwZ1vS1Z8udYDuVLVu33yCyv+hpLdtlmSmZ/xUrnx6e
	8Fztg+T+qYb1K6ZcTbWY8slWocq//pbS6p91rmsMP3ldXWb5octw2wER5bfvUnZEv9pq42cZ
	uJ358rxHzLOM7cWZay7PvblsdmTX6x9HHsvxrWX/17ly8aeVnp5mATfETS/FvRRP9XttttTS
	5tEjdu1fi2zUv1uav08umCh6pTdRf9FT/jUV9dMjQzzbPC3aOLqzbsYoHvva3Wx7KcyXs9Tw
	Bx9DnhJLcUaioRZzUXEiAOrOrZodAwAA
X-CMS-MailID: 20250518193219epcas5p24b442233b3e2bc2a92f43b71a126062f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250518193219epcas5p24b442233b3e2bc2a92f43b71a126062f
References: <CGME20250518193219epcas5p24b442233b3e2bc2a92f43b71a126062f@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_022930_038545_A8F00D03 
X-CRM114-Status: GOOD (  19.88  )
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

First a v1 version was posted as a separate driver file:
https://lore.kernel.org/lkml/20221121105210.68596-1-shradha.t@samsung.com/
This was rejected and request was made to add the support in exynos file
itself.

Then another patchset was posted to refactor existing exynos file:
https://lore.kernel.org/lkml/649a8d88-0504-5aa9-d167-d25d394f3f26@linaro.org/T/
This requested some major changes

Taking both these reviews into consideration, I have posted a fresh
patchset where both changes to exynos framework and addition of new FSD
support is present. This is why not considering it to be v2 of either
patchset.

Currently the DT node is not added in this patchset and will send it
in the devicetree mailing list post this.

Shradha Todi (10):
  PCI: exynos: Change macro names to exynos specific
  PCI: exynos: Remove unused MACROs in exynos PCI file
  PCI: exynos: Reorder MACROs to maintain consistency
  PCI: exynos: Add platform device private data
  PCI: exynos: Add structure to hold resource operations
  dt-bindings: PCI: Add bindings support for Tesla FSD SoC
  dt-bindings: phy: Add PHY bindings support for FSD SoC
  phy: exynos: Add PCIe PHY support for FSD SoC
  PCI: exynos: Add support for Tesla FSD SoC
  misc: pci_endpoint_test: Add driver data for FSD PCIe controllers

 .../bindings/pci/samsung,exynos-pcie-ep.yaml  |  66 ++
 .../bindings/pci/samsung,exynos-pcie.yaml     | 199 +++---
 .../bindings/phy/samsung,exynos-pcie-phy.yaml |   8 +-
 drivers/misc/pci_endpoint_test.c              |   3 +
 drivers/pci/controller/dwc/pci-exynos.c       | 569 +++++++++++++++---
 drivers/phy/samsung/phy-exynos-pcie.c         | 357 ++++++++++-
 include/linux/pci_ids.h                       |   2 +
 7 files changed, 1043 insertions(+), 161 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/samsung,exynos-pcie-ep.yaml

-- 
2.49.0


