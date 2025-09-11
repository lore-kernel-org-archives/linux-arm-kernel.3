Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D24FCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4mUiUyxJ+UgqSNBwzNnX4weNZjeK/F4l8p0MRA1dyxY=; b=fgWKkkc5X1j0eIzv7+phirSVkI
	YH2wodAOPkZt4RHT2DU2l8keFyiQfojxP94fBTQ/kEE7ZKHEorVhOmZGlTjRay75kkz4Pm1g8m7eR
	lM+x9W1A69SRv3jpdBl5GMDnwLYr/+q7GAsVlvP/dKciqD6o4DaBAkh0GBkfAGghm3del6t1rNRDp
	amHFuRgWIsrLbA35fzlRs2HW8FPAbPg2lOvKKWI79zkJv/V/HEbmEWd6M+GDn9ESq566XNvdEZ1TN
	r/5xViHwv/UvewQAXlBs8JlnriE8gUMgr6AfVEqbSGwFFkotigMcr5MsyuPV5R4oBfkT+7jDKlIqW
	WdwMmAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwh1V-000000038tk-21ei;
	Thu, 11 Sep 2025 13:07:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwh1T-000000038sx-3qMt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Sep 2025 13:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=4mUiUyxJ+UgqSNBwzNnX4weNZjeK/F4l8p0MRA1dyxY=; b=WA6vvLKBpKYksTkZjbQ+h8s1o3
	VNTiOn4O9M8Or6/dfthciGGGupv1LQqaJuYKs1HZnC1wDSX9dS++QkUcvEif1l3MBJ6PzE4JYk+2M
	yl++dAF1Xsrxg9htfhfUgNfGFWSvjbSuQ+NRWFraJj+MsBqI3fEP2JoAM5DFGWQmGkTl9KS25Zn+Z
	Ans7OwLxePnoDdPvZGAYMFQvNmHlrxM9VUdyrG/A1bxudCFDigbcLKldAROC225sK1ZlvpbePai7j
	KMS2QuEkr/EhX3e5TYbG4GqsOGnigv9Y5FRwm6ZGAq6PsWmGaqwQktKDblLnmwKCjc6D/rReF5XUK
	+OngAp+A==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwh1Q-000000065JD-1n7A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757596018; bh=96Jo2OM+eBPpT8kKW/qCZKj26J6puMVroHTCm7h9Q+0=;
	h=From:To:Cc:Subject:Date:From;
	b=Qloo6V9Eb/VNX5GTPe7EOoPtScJ4UkOLfW41AhspcpIXxuLCisJXA1LH3hufZUbLr
	 V4lnNOWtP4RfeyiRyFynhbeDXIAMx/z84RSGvV6mGfeR8a6clL3FtTwcBRXjhTo/n3
	 zcJVUI2f+ROCVzwnggMwj7ytWJzMq4EV3xZjKhMdklnpthOyO9HW+pCbvx2DnFBL6x
	 vNMQgm5r1M1+axqfdz+oFKtYlJdiNJHHwsuUQ8BZtKIlgS7bblYeoB5rxAn76O/urS
	 QY4NH0+CvArrCbvXWaVy8UcCxp8YhrjbgFcCdt9Ag8//oS5cDC0lpqdTIJyFGr4S7h
	 oH43F9pXG+nrw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 270B83D3AEA;
	Thu, 11 Sep 2025 13:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757596018; bh=96Jo2OM+eBPpT8kKW/qCZKj26J6puMVroHTCm7h9Q+0=;
	h=From:To:Cc:Subject:Date:From;
	b=Qloo6V9Eb/VNX5GTPe7EOoPtScJ4UkOLfW41AhspcpIXxuLCisJXA1LH3hufZUbLr
	 V4lnNOWtP4RfeyiRyFynhbeDXIAMx/z84RSGvV6mGfeR8a6clL3FtTwcBRXjhTo/n3
	 zcJVUI2f+ROCVzwnggMwj7ytWJzMq4EV3xZjKhMdklnpthOyO9HW+pCbvx2DnFBL6x
	 vNMQgm5r1M1+axqfdz+oFKtYlJdiNJHHwsuUQ8BZtKIlgS7bblYeoB5rxAn76O/urS
	 QY4NH0+CvArrCbvXWaVy8UcCxp8YhrjbgFcCdt9Ag8//oS5cDC0lpqdTIJyFGr4S7h
	 oH43F9pXG+nrw==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 9F3EF380DFB;
	Thu, 11 Sep 2025 13:06:57 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [GIT PULL] NXP LPC device tree changes for v6.18
Date: Thu, 11 Sep 2025 16:06:42 +0300
Message-ID: <20250911130642.41958-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250911_130658_177922_0EC065BB 
X-CRM114-Status: GOOD (  11.71  )
/bin/ln: failed to access 'reaver_cache/texts/20250911_130658_177922_0EC065BB': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_130658_177922_0EC065BB 
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

Hi Arnd,

I kindly ask you to pull the next changes.

It's been awhile since the last NXP LPC32xx and NPX LPC18xx/LPC43xx pull
request, fortunately today's Linux runs on the platforms with no issues.

Best wishes,
Vladimir


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/vzapolskiy/linux-lpc32xx tags/lpc32xx-dt-for-6.18

for you to fetch changes up to d2dab63098bde9a6373eeb4672df806ad62a12da:

  ARM: dts: lpc32xx: Correct PL080 DMA controller device node name (2025-09-11 03:30:27 +0300)

----------------------------------------------------------------
ARM: nxp: lpc: device tree updates for v6.18

This pull request contains device tree changes for ARM NXP LPC32xx and
ARM NXP LPC18xx/LPC43xx for v6.18, please pull the following:

- Frank fixes a multitude of device tree checker warnings reported for
  NXP LPC18xx/LPC43xx powered boards,
- Vladimir fixes a number of compile time warnings issued by a dt checker
  for NXP LPC32xx powered boards,
- Vladimir replaces Roland as a maintainer of NXP LPC32xx platform
  device trees, Roland is inactive for more than 10 years.

----------------------------------------------------------------
Frank Li (11):
      ARM: dts: lpc18xx: rename node name flash-controller to spi
      ARM: dts: lpc18xx: rename node name mmcsd to mmc
      ARM: dts: lpc4350-hitex-eval: change node name flash to flash@0
      ARM: dts: lpc18xx: swap clock-names bic and cui
      ARM: dts: lpc: add #address-cells and #size-cells for sram node
      ARM: dts: lpc: add cfg surfix in pinctrl child node
      ARM: dts: lpc4357-myd-lpc4357: add power-supply for innolux,at070tn92
      ARM: dts: lpc: change node name 'button[0-9]' to button-[0-9]'
      ARM: dts: lpc4357-myd-lpc4357: change node name mdio0 to mdio
      ARM: dts: lpc18xx: add #address-cell and #szie-cell for spi flash controller
      ARM: dts: lpc18xx: add missed arm,num-irq-priority-bits

Vladimir Zapolskiy (7):
      dt-bindings: arm: nxp: lpc: Assign myself as maintainer of NXP LPC32xx platforms
      ARM: dts: lpc32xx: Set motor PWM #pwm-cells property value to 3 cells
      ARM: dts: lpc32xx: Correct motor PWM device tree node name
      ARM: dts: lpc32xx: Correct SD/MMC controller device node name
      ARM: dts: lpc32xx: Specify a precise version of the SD/MMC controller IP
      ARM: dts: lpc32xx: Specify #dma-cells property of PL080 DMA controller
      ARM: dts: lpc32xx: Correct PL080 DMA controller device node name

 .../devicetree/bindings/arm/nxp/lpc32xx.yaml       |  2 +-
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi             | 14 ++++++++++----
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi             | 11 ++++++-----
 arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dts         |  6 +++---
 arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts   | 22 +++++++++++++---------
 arch/arm/boot/dts/nxp/lpc/lpc4350.dtsi             |  9 +++++++++
 .../arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts | 21 +++++++++++----------
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  6 ++++--
 arch/arm/boot/dts/nxp/lpc/lpc4357.dtsi             |  9 +++++++++
 9 files changed, 66 insertions(+), 34 deletions(-)

