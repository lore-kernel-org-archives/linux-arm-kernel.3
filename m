Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE631D26D7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ckvH2/JfK8fntSSaJZKXrrhygEwpYlJj2dCI1t955bQ=; b=3dGBIxcoQqY+Hr5fTuR39rv269
	7B9ihAQzWg0ho6BtrjWR8k8xlWqQ4YEYOKi+rvfAiVpKuPjr6CVlEV2Swb/T8578+sSgg40dc3xLa
	x2uS1kYAiGD6TFrqBfk7/us8inutK62qf+ynexBN3CQ6tggCtBLZ+J4UlSAJKwNjaF1bz5O5HG6Eq
	8eSabZjB/2chQgZmEyuojgfQVesxKPmdJ67lkA80Ag2kLOlqAdTwQ49I9xaYYu/t1DRbWq6xkYTvR
	cK1h97DDfQNzLzu39IwXOsbaxUim1P9N0dwD260hKHAOb8ln0F5R9KfIfuzkO4kzg4d5SB5MG0IsT
	/vXV/5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGIE-00000002pGg-2y5K;
	Fri, 09 Jan 2026 17:28:58 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGIB-00000002pFP-1Vgg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:28:56 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 7ABA31D00109;
	Fri,  9 Jan 2026 12:28:53 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 09 Jan 2026 12:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1767979733; x=1768066133; bh=ck
	vH2/JfK8fntSSaJZKXrrhygEwpYlJj2dCI1t955bQ=; b=QV797tDW1zEE8r8gu1
	stG5ROyDS7N0PM+miHpamY8TUQvkXr4mdPXUrfuduDlrBzkNEvB4qyaAHB1s6g9N
	Wo0k3YbVFsDeTQZLhbJcuURETiFEFAgTgPSnhbsLlkSaBFid2rAflwHBrJ5GOC5t
	fKmeovB0P8DLb2fCEXsuEWwJ+DXHMSXf0HJbroZ53ov04h5m5G9paMtr0SKQO5qD
	+Adru9EBDyYxmRC3A2b+933NeOXDOzA6g0GD0Wl+/yNeb/yNcESOCFqlGWaXSm13
	uUZ9W3+VVuk5EFhKNSlf9MGeALBIgiCvtfm9GahxbdKskJT2nuXCSqMdLbkVg0/t
	FgZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767979733; x=1768066133; bh=ckvH2/JfK8fntSSaJZKXrrhygEwp
	YlJj2dCI1t955bQ=; b=fmq/+OtejQRw8I3u9EQgXVA4dACTsKnM2v327m7F3c7J
	V12MuG+5T0Glg7GRHXBLJ68a2c3HsnIhtbh7i7Z/deCGQjcFg5uQrTSgaxUI/hzF
	wkeN4DR30xCvZKNf6Y8tR4O4b/A6Ophaegi9FqVXNOV5MHXCpm19KTmJsSgL5+r3
	dsZ65bKo+dnVd5Lu7O8copwUpJpXV0dPiMNT8p/BhDIHt+yAE9lwsr/OQq1ItF8h
	6I9WY3f150Raxzs7g/8N3tOvtB+LACP4Z0/HbEXD/S4wEoyUnmwni0FdmBO6B24q
	B7DFler/gZEnghR+cmkjy42DWDecytJ+Vbl510awmQ==
X-ME-Sender: <xms:1TphaWsP5hMzZk9JyPHCr7r85_QVyTd_yH0UdiPeGr2jRixeRGo1ig>
    <xme:1TphaWSGAQcbejJW748n4g6B4-_3gcJ4kZmmM_5MOT6rOCSt4bmQxoxQ0uXwdfXY9
    0tSTtmMXBw_UhQqMDBhARk5wjO_X3iF-4FBWrJVoxY26bE4m9s3CrSD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdelgeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epudfgfeeuheelheehfeeigeeigeeiveevheelteelleeijeeikeekvddthfejieffnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggs
    rdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphht
    thhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1TphaYY7ebMmvYViIupjc4JX39cptdvp6z15ZBXNLgl4IuCYZlHOsw>
    <xmx:1TphaaSizYSKN0pOJIVntdP0jDLW8OCkULV0NVSjPIK8jCDXJ9b5eA>
    <xmx:1TphabQq8BWMupVFR0ckn7uuIDnCNnXt1tGBWhrZ6tcm8n1CxEZzrg>
    <xmx:1TphaeQQMRmeryzBcAn0c1Zi_PHx-FMS2AdPWhXSUxV5yeuLh_Ul8g>
    <xmx:1TphaWi23IyKWhsRO7EC9wpXXKV4f9cTThN98EU5wkYm2W_xbe57Wb8J>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1745E700065; Fri,  9 Jan 2026 12:28:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 18:28:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <82cf1376-7a4d-4ac4-a874-139ba053b72e@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.19
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092855_446041_F000604C 
X-CRM114-Status: GOOD (  12.58  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.19

for you to fetch changes up to bf104037ebd5c1774fa736050a484c1f28cb2e6b:

  arm64: dts: hisilicon: hikey960: Drop "snps,gctl-reset-quirk" and "snps,tx_de_emphasis*" properties (2026-01-07 17:55:19 +0100)

----------------------------------------------------------------
soc: fixes for 6.19

The main code change is a revert of the Raspberry Pi RP1 overlay
support that was decided to not be ready.

The other fixes are all for devicetree sources:

 - ethernet configuration on ixp42x-actiontec-mi424wr is
   board revision specific

 - validation warning fixes for imx27/imx51/imx6, hikey960 and k3

 - Minor corrections across imx8 boards, addressing all types of
   issues with interrups, dma, ethernet and clock settings, all
   simple one-line changes.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: mba8mx: Fix Ethernet PHY IRQ support

Andrea della Porta (4):
      dt-bindings: misc: pci1de4,1: add required reg property for endpoint
      misc: rp1: drop overlay support
      arm64: dts: broadcom: bcm2712: fix RP1 endpoint PCI topology
      arm64: dts: broadcom: rp1: drop RP1 overlay

Arnd Bergmann (2):
      Merge tag 'arm-soc/for-6.19/devicetree-arm64-fixes' of https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'imx-fixes-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes

Carlos Song (1):
      arm64: dts: imx95: correct I3C2 pclk to IMX95_CLK_BUSWAKEUP

Haibo Chen (2):
      arm64: dts: imx8qm-mek: correct the light sensor interrupt type to low level
      arm64: dts: add off-on-delay-us for usdhc2 regulator

Ian Ray (1):
      ARM: dts: imx6q-ba16: fix RTC interrupt level

Krzysztof Kozlowski (3):
      Merge tag 'ti-k3-dt-fixes-for-v6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/fixes
      Documentation/process: maintainer-soc: Be more explicit about defconfig
      Documentation/process: maintainer-soc: Mark 'make' as commands

Linus Walleij (2):
      ARM: dts: ixp4xx: Fix up Actiontec MI424WR DTS files
      MAINTAINERS: Fix a linusw mail address

Marek Vasut (1):
      arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on DH electronics i.MX8M Plus DHCOM

Maud Spierings (3):
      dt-bindings: arm: fsl: moduline-display: fix compatible
      arm64: dts: freescale: moduline-display: fix compatible
      arm64: dts: freescale: tx8p-ml81: fix eqos nvmem-cells

Rob Herring (Arm) (2):
      ARM: dts: nxp: imx: Fix mc13xxx LED node names
      arm64: dts: hisilicon: hikey960: Drop "snps,gctl-reset-quirk" and "snps,tx_de_emphasis*" properties

Sherry Sun (1):
      arm64: dts: imx8qm-ss-dma: correct the dma channels of lpuart

Vitor Soares (2):
      arm64: dts: freescale: imx95-toradex-smarc: use edge trigger for ethphy1 interrupt
      arm64: dts: freescale: imx95-toradex-smarc: fix SMARC_SDIO_WP label position

Wadim Egorov (3):
      arm64: dts: ti: k3-am642-phyboard-electra-peb-c-010: Fix icssg-prueth schema warning
      arm64: dts: ti: k3-am642-phyboard-electra-x27-gpio1-spi1-uart3: Fix schema warnings
      arm64: dts: ti: k3-am62-lp-sk-nand: Rename pinctrls to fix schema warnings

 Documentation/devicetree/bindings/arm/fsl.yaml     |  9 ++++-
 .../devicetree/bindings/misc/pci1de4,1.yaml        |  8 ++++-
 Documentation/process/maintainer-soc.rst           | 10 +++---
 MAINTAINERS                                        |  2 +-
 .../ixp/intel-ixp42x-actiontec-mi424wr-ac.dts      | 11 ++++++
 .../intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts | 11 ++++++
 .../intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi  |  1 -
 .../boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts  |  8 ++---
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts       |  4 +--
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts  |  4 +--
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts   |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi          |  2 +-
 arch/arm64/boot/dts/broadcom/Makefile              |  4 +--
 ...i-5-b-ovl-rp1.dts => bcm2712-rpi-5-b-base.dtsi} |  0
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   | 39 ++++++++++++++--------
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi        | 14 --------
 arch/arm64/boot/dts/broadcom/rp1.dtso              | 11 ------
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |  1 +
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      |  2 +-
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi |  5 +++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  3 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |  8 ++---
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |  4 +--
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  2 +-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |  2 +-
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts  |  3 --
 arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso     |  2 +-
 .../ti/k3-am642-phyboard-electra-peb-c-010.dtso    |  7 ++--
 ...m642-phyboard-electra-x27-gpio1-spi1-uart3.dtso |  8 ++---
 drivers/misc/rp1/Kconfig                           |  6 +---
 drivers/misc/rp1/Makefile                          |  3 +-
 drivers/misc/rp1/rp1-pci.dtso                      | 25 --------------
 drivers/misc/rp1/rp1_pci.c                         | 37 +++-----------------
 drivers/pci/quirks.c                               |  1 -
 34 files changed, 111 insertions(+), 150 deletions(-)
 rename arch/arm64/boot/dts/broadcom/{bcm2712-rpi-5-b-ovl-rp1.dts => bcm2712-rpi-5-b-base.dtsi} (100%)
 delete mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
 delete mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 delete mode 100644 drivers/misc/rp1/rp1-pci.dtso

