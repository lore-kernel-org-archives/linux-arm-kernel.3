Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB77CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 17:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRGjJGkjgULdfJmp/p/WbgXPAtKUngmCwoasaodSbNY=; b=MVtgrfFV3tOgjQb5Br9YO4DyRa
	E13yO+7/dKl4q06/ZnJKUi2zKJS3Df57JuRNpyKgnvxUPHRucvo9F7h3LKqYDz+nu+Hb8isSggDuq
	simCDwyBZYdevr+PcBGYdZYn5sKhqTSQq9wV9Kq4g8W170yMDdVTYabFXkir5CFQmCRuGM/hX29r5
	0A4AiaSgxgEJSz66CrYUT+N8nTnQzpwK92CHz28/xPaG+qzjczoAXgm3okBUj/VexRFlf/3pan3A8
	/bsQNp2PZgbExshwJPEBbio/G8u3NY8O1c5t62rrmhJ3Fldm486XsQyp6u9SyRHxGg9e3ZbcLWZhs
	VPvt5Msg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOTZ-0000000Fk5h-24YA;
	Wed, 10 Sep 2025 17:19:21 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOTU-0000000Fk25-2Y3S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 17:19:18 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C7720C000718;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C7720C000718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757524753;
	bh=rl0U26Y/Z4PNUS4Zgspmy5Z7/zfxkT1YPC9XXuffGM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H9RkSk52AdzdjBwQSbHQbD5zC8U/l/VNFnV5lqYJMVSbs5MT6tsjrOKmNI5CwFzrj
	 js5Wkd/km9Bzx+rL8Ce2QrAN6RG0gTeXflntbxqAyI4+yg80icNsREW1f8S8KCTbqD
	 7bvqMApgBc8jN5ENWiZwIOb5017tT/rYWcNWkfTA=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id A0BBB180004FC;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/4] Broadcom devicetree-arm64 changes for 6.18
Date: Wed, 10 Sep 2025 10:19:09 -0700
Message-ID: <20250910171910.666401-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910171910.666401-1-florian.fainelli@broadcom.com>
References: <20250910171910.666401-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_101916_663375_816539C2 
X-CRM114-Status: GOOD (  11.40  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-arm64

for you to fetch changes up to 70bab1937e39fd8f6efc80fd1a8b4da63622dd81:

  arm64: dts: broadcom: Enable USB devicetree entries for Rpi5 (2025-09-09 15:40:27 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 6.18, please pull the following:

- Krzysztof fixes a DTC warning for the ARM GIC in bcm2712.dtsi

- Ivan adds the pin controller node(s), an additional GPIO controller,
  the second SDHCI controller node for SDIO Wi-Fi, and the UARTA for
  Bluetooth to the BCM2712 DTS (Raspberry Pi 5)

- Stanimir adds the Ethernet DT node and enables it for the RP1 sister
  chip

- Andrea deletes a number of redundant PCIe DT node enablement, updates
  a comment to describe the relationship between bcm2712 and RP1 and
  finally enables the USB controllers with RP1

----------------------------------------------------------------
Andrea della Porta (5):
      dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI controller
      arm64: dts: broadcom: delete redundant pcie enablement nodes
      arm64: dts: broadcom: amend the comment about the role of BCM2712 board DTS
      arm64: dts: broadcom: rp1: Add USB nodes
      arm64: dts: broadcom: Enable USB devicetree entries for Rpi5

Ivan T. Ivanov (4):
      arm64: dts: broadcom: bcm2712: Add pin controller nodes
      arm64: dts: broadcom: bcm2712: Add one more GPIO node
      arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
      arm64: dts: broadcom: bcm2712: Add UARTA controller node

Krzysztof Kozlowski (1):
      arm64: dts: broadcom: bcm2712: Add default GIC address cells

Stanimir Varbanov (2):
      arm64: dts: rp1: Add ethernet DT node
      arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5

 .../bindings/mmc/brcm,sdhci-brcmstb.yaml           |   2 +-
 .../boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 133 +++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  41 ++++++-
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  56 +++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi       |  44 +++++++
 5 files changed, 271 insertions(+), 5 deletions(-)

