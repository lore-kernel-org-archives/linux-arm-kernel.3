Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDAFF483E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9sxO+oMPPr1hr6g+MEybeB3+bbNLSLnT2Lx4In7Qkl4=; b=M91YTsfrLsENVJ6y2f0Eqci06d
	6H3f3TLdB/vDCbPwoIFkW5hU7RV6vyPXRN8GMT6xdH2JI9mbiuXSbfVOCDi2FiBAxFVMJtAYJIfLo
	U4GC7FeIopyS39/Tw+ZnzckveAJ3yRaexkDN8C72rQrziuqFAwnLvYojrP6HWlvsnWZupy1OCrp+P
	yiFLUsX/e7lo4UgORHp1srO1H2hnyoa6sA1WZhLwQr1QYdnC0Q7X26zVtawqLMcR49lnkv/M7JRa+
	GT2PLN8LASrk3aHj+pqKXVWGjarEytmxMt7KbDOD4W+G5htJ1yfX8Ryvp87XxOBuuFXq6saAv4E6b
	TfMAaXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kYC-0000000HPGs-2EJ6;
	Mon, 23 Mar 2026 19:02:56 +0000
Received: from lpdvsmtp12.broadcom.com ([192.19.144.207] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kY4-0000000HPED-2avs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:02:51 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C7288C0004A8;
	Mon, 23 Mar 2026 12:02:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C7288C0004A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774292565;
	bh=mxwtyI0DqCyBUUMSy2sNcEfaamTmrYvEIXx8FmM3rHw=;
	h=From:To:Cc:Subject:Date:From;
	b=WSZuHleMUxT3bgdFdkeb0g8J7qKtOuAVhtYIf7azbNJbNZGbfqeQxdqjaJ28qRYY2
	 nI9i+JBzf2xIuVESYoH/h3y61nUNzfGBzxNvnImI7pbT7ZXZ5+valC3UmCmhA9duNG
	 cVCTdmykUxZqpX1bMay6LA945TjKOQW0P1I6lFqs=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 6B8A0A83;
	Mon, 23 Mar 2026 12:02:45 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rosen Penev <rosenp@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	William Zhang <william.zhang@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree changes for 7.1
Date: Mon, 23 Mar 2026 12:02:38 -0700
Message-ID: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_120248_758348_09E2528C 
X-CRM114-Status: GOOD (  10.66  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree

for you to fetch changes up to 220bdfcb4b4788f57faa2c28454d8b2dd3bcab6c:

  ARM: dts: BCM5301X: EA9200: specify partitions (2026-03-20 16:57:31 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree updates
for 7.1, please pull the following:

- Rafal provides a complete description of the PCIe Root Complex nodes
  in order to silence a number of dtc warnings

- Rosen provides the necessary NVMEM properties to allow describing the
  WAN device MAC address from NVRAM, also adds better LEDs, USB GPIOs
  and Wi-Fi buttons for the Linksys EA9200 router

- Linus completes the BCA devices description by adding the I2C block
  and fixing interrupts for the DMA block on 63138 and 6878

----------------------------------------------------------------
Linus Walleij (7):
      ARM: dts: bcm6878: Fix PL081 DMA block IRQ
      ARM: dts: bcm63138: Fix DMA IRQ
      ARM: dts: bcm6846: Add I2C bus block
      ARM: dts: bcm6855: Add I2C bus blocks
      ARM: dts: bcm6878: Add I2C bus block
      ARM: dts: bcm63138: Add I2C block
      ARM: dts: bcm63148: Add I2C block

Miquel Raynal (1):
      ARM: dts: BCM5301X: Drop extra NAND controller compatible

Rafał Miłecki (1):
      ARM: dts: BCM5301X: Describe PCIe controllers fully

Rob Herring (Arm) (1):
      ARM: dts: broadcom: bcm2835-rpi: Move non simple-bus nodes to root level

Rosen Penev (9):
      ARM: dts: BCM5301X: add root pcie bridges
      ARM: dts: BCM5301X: EA9200: set WAN MAC from nvram
      ARM: dts: BCM5301X: panamera: set WAN MAC from nvram
      ARM: dts: BCM5301X: AC3100: set WAN MAC from nvram
      ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
      ARM: dts: BCM5301X: EA9200: add WiFi button
      ARM: dts: BCM5301X: EA9200: add USB GPIOs
      ARM: dts: BCM5301X: EA9200: add LEDs
      ARM: dts: BCM5301X: EA9200: specify partitions

 arch/arm/boot/dts/broadcom/bcm-ns.dtsi             |  58 +++++++++++-
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi     |   7 +-
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi        |  16 ++--
 .../boot/dts/broadcom/bcm4709-linksys-ea9200.dts   | 100 +++++++++++++++++++++
 .../boot/dts/broadcom/bcm4709-netgear-r8000.dts    |  73 +++++++--------
 .../boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi |   7 ++
 .../boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts  |   3 +
 .../dts/broadcom/bcm47094-linksys-panamera.dts     |   7 ++
 .../boot/dts/broadcom/bcm47094-luxul-xap-1610.dts  |  36 ++------
 .../dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts    |  36 ++------
 arch/arm/boot/dts/broadcom/bcm63138.dtsi           |  11 ++-
 arch/arm/boot/dts/broadcom/bcm63148.dtsi           |  11 ++-
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            |   9 ++
 arch/arm/boot/dts/broadcom/bcm6855.dtsi            |  18 ++++
 arch/arm/boot/dts/broadcom/bcm6878.dtsi            |  11 ++-
 15 files changed, 289 insertions(+), 114 deletions(-)

