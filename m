Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7320DCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=Ed+5kxoNWx3Jwxxg6b5MJ/fr9ca6CEUeMaFTMyUKs7E=; b=aXKS/xi+kieBZVbhpFDpm/L8NU
	QyHD/ZmncmCQxjbT7AxXA8NN4lyMtfPo3N1Kk1EkurIB5EsRP5K0ZFi7qFz8gY5djo0NLX9nyLx7l
	kOEUOVZl0xkb1JTJ8ZMD7bHalR5eCnuhjefcsBrD6V974kVFaaGU3luDbguTYb8zyup5o2Y6y06pf
	fS7e1cLFzn54fZ0mO3h8tmx3C+Iub7SdyPcLBuHQZ2pEoeWokIrR93hEIBk0L2rbVWNE86dhzUfBP
	nniLwjzOeMb6cl95yUvAQ5JpH9qAT5jlJ2T+KEZtheqf9i47Q6ULf6ImXYBbzK6FJfSiK5STcQb1Q
	pv3wa5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v233j-0000000GraR-1u4N;
	Fri, 26 Sep 2025 07:40:03 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v233g-0000000GrXN-3W5C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 07:40:02 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250926073956epoutp02ba53101540f6b697a88aa4e8fbcf704f~oxSA2rSSe1846318463epoutp02O
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:39:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250926073956epoutp02ba53101540f6b697a88aa4e8fbcf704f~oxSA2rSSe1846318463epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758872396;
	bh=Ed+5kxoNWx3Jwxxg6b5MJ/fr9ca6CEUeMaFTMyUKs7E=;
	h=From:To:Cc:Subject:Date:References:From;
	b=WHD5tGIG5QrmybbVc1rzwlihvsaLvo/2NGNq577Ao3XaUAXfjxFxpnZ3bWVKsRA4G
	 XTzGQRdDxct59ZRAzUFKvSjfswHEJFT9HD/asmIezOulgxlvArg6KVm2hcvwG3ldvb
	 eExURASMxKMlHtA4ohXglq23flaYh2iO/fwmZTuI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250926073956epcas2p4e0831378871edb628034c6e8e7a0c31d~oxSAT3qfW0615906159epcas2p4g;
	Fri, 26 Sep 2025 07:39:56 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.97]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cY2Y72vjTz2SSKq; Fri, 26 Sep
	2025 07:39:55 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250926073954epcas2p4b8bb4206e526b7d7860ed4378ed75f78~oxR_4fYk71317313173epcas2p46;
	Fri, 26 Sep 2025 07:39:54 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250926073954epsmtip210aab09bd6750df88f1647162d5c1287~oxR_y2Ce_1108911089epsmtip2F;
	Fri, 26 Sep 2025 07:39:54 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org, m.szyprowski@samsung.com,
	jh80.chung@samsung.com, shradha.t@samsung.com
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	sh86.bae@samsung.com
Subject: [PATCH 0/4] Add support for ExynosAutov920 PCIe PHY
Date: Fri, 26 Sep 2025 16:39:15 +0900
Message-ID: <20250926073921.1000866-1-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250926073954epcas2p4b8bb4206e526b7d7860ed4378ed75f78
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250926073954epcas2p4b8bb4206e526b7d7860ed4378ed75f78
References: <CGME20250926073954epcas2p4b8bb4206e526b7d7860ed4378ed75f78@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_004001_188145_CF849C6C 
X-CRM114-Status: GOOD (  14.78  )
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

The ExynosAutov920 SoC has two instances of DesignWare-based PCIe PHY IP.
Each PHY has a different lane specification: one is a 4-lane PHY and
the other is a 2-lane PHY.

Each PHY can be used by separate controllers through the bifurcation
option. Therefore, from 2 up to 4 PCIe controllers can be supported
and connected with this PHY driver.

Most of the PHY structure and registers are identical, but some aspects
need to be distinguished. For this, PCIe lane number added for each PHY
properties only in ExynosAutov920.

This patchset includes:
- DT bindings for ExynosAutov920 FSYS0 sysreg
- DT bindings for ExynosAutov920 PCIe PHY
- PCIe PHY properties for ExynosAutov920 in the device tree
- PHY driver for ExynosAutov920 PCIe

Note that this patchset does not enable PCIe0 and PCIe2.
Enabling them requires additional patches for the ExynosAutov920 PCIe
RC driver, which will be applied later.

Please note that these patch set depends on the Shradha Todi's patchset
https://lore.kernel.org/lkml/20250811154638.95732-1-shradha.t@samsung.com/
so need to apply on top of that series, because that adds
the patches to make Exynos PHY common for all.

Sanghoon Bae (4):
  dt-bindings: soc: samsung: exynos-sysreg: add hsi0 for ExynosAutov920
  dt-bindings: phy: Add PCIe PHY support for ExynosAutov920 SoC
  arm64: dts: ExynosAutov920: add PCIe PHY DT nodes
  phy: exynos: Add PCIe PHY support for ExynosAutov920 SoC

 .../bindings/phy/samsung,exynos-pcie-phy.yaml |  14 ++
 .../soc/samsung/samsung,exynos-sysreg.yaml    |   1 +
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  28 +++
 drivers/phy/samsung/phy-exynos-pcie.c         | 231 ++++++++++++++++++
 4 files changed, 274 insertions(+)

-- 
2.45.2


