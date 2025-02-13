Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71DAC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 21:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AAzGpmQaLH7sVclaZm3nGvic6C3AJbqc+WlMSefsOAw=; b=HfKOE2SVvLGmV1IwB2bfJO3Rqj
	LRA9qVpqXZuBS8WwchyU4mofFcAWIp1Du7AI6Ipf7N17+yG3U0YzH3RGJWZ5D27uwv5AEk4f2DLie
	VlkOkkDvQiH4ZnpO7+RQ5RFNa/KRTE1aNuP0MkxVvH/Q7LweCgeMoWz6xpa+nGpEPdHnOyKZbL5nZ
	BqBPby7NgvEXGR84XOpDEyqta91LflRZFtRzfCRsWbhN83TjTX7eLaAl2XLZFa2yXarBvyHDWsaA/
	yIRwMl05XiGvyp3tA07FdxikFKNFq9pGLmihnP9sClxUWkHl8wHqqyzI/QTBHbEzyT4ce1aQEWTXS
	A/zy+9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigg2-0000000Cgsd-1D5o;
	Thu, 13 Feb 2025 21:23:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tigec-0000000CghD-0QHx;
	Thu, 13 Feb 2025 21:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AAzGpmQaLH7sVclaZm3nGvic6C3AJbqc+WlMSefsOAw=; b=Qx4W4KWKiwfCjJV3G2gWh6xBO1
	uNKN7ZuqHeYNmJCUOBbE4p/93XLSvKJDnO4HI/vSZ1C29cNg8jADZM17m2lHuHeRk2ZCA2Ycd7CKK
	uYUe0Q8oEHBCaETuc60d0JswnfipZGigk4m/GIZBlOjlB+f4UUvB3kAEJB+EYsp+jaWUSJ5MNkQQC
	4U4dzIRFcGh6QcTeVsP+u+YsOghGJhNwyo51Izyh1XbZCAYv3uLxBaEC4Tfe1tLjJdcGkMDJBmIpo
	y6T755N0XuKqQKqUN7UV5jvMmAoYH+AA6qB9cB8dcigD1w1GLy8qlbvjvXLPk7drzfboHRIICxvfj
	AjsnBBtw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tigeX-000000016fm-1ssf;
	Thu, 13 Feb 2025 21:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AAzGpmQaLH7sVclaZm3nGvic6C3AJbqc+WlMSefsOAw=; b=vyZw3DCpxWNkwL091vItEM+22M
	UXlSTnznfZkHIUA0IPp4tLhY0gTIaiwFIcxizxaDmumUHi9rKvSfJRJAp5C9xbscr5WNCg7Tjkc83
	Ii79BJBYzDa8oZ0Sv9j6c26DQJ4hMoqL63fwBTrTy7g72EPPq9WazoU8+eI/1iCc4VYxCnO6DAR/c
	rLZuFmlc7GNtQ4Rsiqgyf8hto/shVd8fmmpaHVP6sPNf93Z17wIrOt48qKGn41Zxqz6zSTF0wbyHV
	mUWtnYOuQtsNLWE3nWOrsfF8w3z9t9w+7GWTZglJUf7U8suVFNcqr4yZFUlyZ7s6LqTT8+SAquz02
	hHi/C91w==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tigeT-0006eG-VR; Thu, 13 Feb 2025 22:21:42 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.14 #1
Date: Thu, 13 Feb 2025 22:21:41 +0100
Message-ID: <3004814.3ZeAukHxDK@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_212147_029394_0FCC8DFF 
X-CRM114-Status: GOOD (  11.38  )
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

Hi Arnd, Kevin, Olof,

please find a below some fixes for the current release 6.14 cycle.

Please pull

Thanks
Heiko


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.14-rockchip-dtsfixes1

for you to fetch changes up to 8546cfd08aa4b982acd2357403a1f15495d622ec:

  arm64: dts: rockchip: adjust SMMU interrupt type on rk3588 (2025-02-11 21:28:13 +0100)

----------------------------------------------------------------
Fixes for the IOMMU used together with the PCIe controllers on rk3588,
some board-level fixes for wrong pins, pinctrl and regulators, and
disabling DMA on a board where the DMA+uart causes the dma controller to
hang, as well as improved network stability for the OrangePi R1.

----------------------------------------------------------------
Alexander Shiyan (1):
      arm64: dts: rockchip: Fix broken tsadc pinctrl names for rk3588

Andy Yan (1):
      arm64: dts: rockchip: Fix lcdpwr_en pin for Cool Pi GenBook

Heiko Stuebner (1):
      arm64: dts: rockchip: fix fixed-regulator renames on rk3399-gru devices

Lukasz Czechowski (2):
      arm64: dts: rockchip: Move uart5 pin configuration to px30 ringneck SoM
      arm64: dts: rockchip: Disable DMA for uart5 on px30-ringneck

Niklas Cassel (1):
      arm64: dts: rockchip: disable IOMMU when running rk3588 in PCIe endpoint mode

Patrick Wildt (1):
      arm64: dts: rockchip: adjust SMMU interrupt type on rk3588

Rob Herring (Arm) (1):
      dt-bindings: rockchip: pmu: Ensure all properties are defined

Tianling Shen (1):
      arm64: dts: rockchip: change eth phy mode to rgmii-id for orangepi r1 plus lts

 .../devicetree/bindings/arm/rockchip/pmu.yaml      |  8 +++++++-
 .../boot/dts/rockchip/px30-ringneck-haikou.dts     |  1 -
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  6 ++++++
 .../dts/rockchip/rk3328-orangepi-r1-plus-lts.dts   |  3 +--
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dts  |  1 +
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi |  1 -
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |  8 ++++----
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       | 22 +++++++++++-----------
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 22 +++++++++++-----------
 .../dts/rockchip/rk3588-coolpi-cm5-genbook.dts     |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |  1 -
 .../boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtso  |  4 ++++
 13 files changed, 50 insertions(+), 37 deletions(-)




