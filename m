Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667D5C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 21:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ip7IdjXpbTEeQtpgf2f2+OGWRKdS1gcsDSa0BlUX+KU=; b=3Kx7MB72DCussdC9xjbiw4+u7a
	LILBunTE335RIz5cMFAgLdE3ymUnLOQsB7srxgXSxgse2JItojHV9zPv8Opd2qH4auAXPec4WV/DG
	oTFTA/H9fDZJlbzNJyhw9Xx4Mb0U6YxzN8BM3VrzOi/CfQIMFr7ixeiRa8Gwih4G6jTfuLkkEcIdM
	BPtpT821q7h79OWMInjgSEWLnbgVRSQ1nipIpwRQy3SALrwzUt+VyY4Umujj0YIS6cGrDVsUI1iZx
	kONMLAYI4wAgrvImYpUXXdLu3c/0pa+Yvk2EU+UFNOuUMXyvo9xPO3JZb2uVP+cIrkcnuqeoctb3g
	5sM3jeoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wviZX-0000000579b-2PVQ;
	Sun, 16 Aug 2026 21:39:15 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wviZU-0000000578t-2gSl;
	Sun, 16 Aug 2026 21:39:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B360311C019;
	Sun, 16 Aug 2026 23:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786916340; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ip7IdjXpbTEeQtpgf2f2+OGWRKdS1gcsDSa0BlUX+KU=;
	b=XOIUTmIUxl/DqvjJpR1nE8U/RUOpYhlbUN+4T7+ENF4+546kRJlhejTar7pkICTFh6acro
	WyGqIAhfkmeq0+KXDiFBLDmeup6DF6KeT64pVUVn8AwlFuVXpmd2Usk9WPdXPyqfq/bNGQ
	dkFB/0wzpBnn0gdpM/RZV4FQ5nlk/1AUkKeUaLVE1vKc+aQPr2MPcpkJmFRoQq8eJTnJhz
	eyr1RSkEmNeCwYoiN5+ez9V9a6a1ucQhb7Yvc+juDoZMBKX4Khj23evYdXcjOYtYyAVdcG
	CWJDEWpCK4Ias1lNJtW3rZYP6yHkHkL6aSZAFavVSKu5qdlah8Ziew31RFGH9A==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 0/9] arm64: dts: phy: st: usb: Add STM32MP2 USB support
Date: Sun, 16 Aug 2026 23:37:02 +0200
Message-ID: <20260816213849.1044073-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_143912_914709_726A1E78 
X-CRM114-Status: GOOD (  10.38  )
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

Add USB support for STM32MP23xx/STM32MP25xx SoCs. This includes USB 2.0
FEMTO-PHY driver, DWC3 glue code and DT adjustments. Parts of this are
taken from ST downstream kernel fork, reduced, or rewritten, since not
all of the content there was useful and bits which might be missing and
are useful can be added later.

Unlike the downstream implementation, the DWC3 glue code is using plain
dwc3-generic-plat, the EHCI and OHCI controllers are instantiated as
plain generic controllers without any wrapper glue driver, and the USB2
PHY driver is simplified.

Both USB 2.0 Host controller and DWC3 super-speed controller are tested.

Marek Vasut (6):
  dt-bindings: usb: generic-ehci: Document access-controllers property
  dt-bindings: usb: generic-ohci: Document access-controllers property
  dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
  usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller
    glue
  dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd
  arm64: dts: st: Add USB nodes on stm32mp231

Pankaj Dev (3):
  dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
  phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY
  arm64: dts: st: Add USB nodes on stm32mp251

 .../bindings/arm/stm32/st,stm32-syscon.yaml   |   7 +-
 .../bindings/phy/st,stm32-usb2phy.yaml        |  73 ++++
 .../devicetree/bindings/usb/generic-ehci.yaml |   3 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   3 +
 .../bindings/usb/st,stm32mp25-dwc3.yaml       | 108 ++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |  81 +++-
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  65 +++-
 drivers/phy/st/Kconfig                        |  10 +
 drivers/phy/st/Makefile                       |   1 +
 drivers/phy/st/phy-stm32-usb2phy.c            | 361 ++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c          |  44 +++
 11 files changed, 751 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
 create mode 100644 drivers/phy/st/phy-stm32-usb2phy.c

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org

-- 
2.53.0


