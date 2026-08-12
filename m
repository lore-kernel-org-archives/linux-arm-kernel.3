Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48891C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 01:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PfgDafVpcYcIsx/y/Mtz5wPBNsA0Bqi65/JdgQqh0iY=; b=BeFv2suz3ey7z6036ZOecktndh
	J9LQEj43umjMjLdRnacddjSMQEqEMynl1T5Ht3xERimTBdOZbiMI67w6mjla8J+HWA14RwBTG4jOo
	lgCGMhbkUPWq/dQgReK5l0lRm/7J2B2xwCQZI2f/B13OaEnal86eYNJi2uPEtDkfgYk60b/AK/g+t
	PPauDysFk2ysXVScZJNqt4Kn4MZQqJPaEE81WbKZFIPTBsAL+/N8cy/0i1cPeHgEMyq5Maz35yr+N
	Tvf+BFS8nono3Y+QvyuQ2GSp66+U2XFVIbqb3Oi1TfKYWDhOdzqTZJxQjlvcnxqoeR8mLv2tcpKnX
	m7pwhOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtxMi-0000000FAhL-0lar;
	Wed, 12 Aug 2026 01:02:45 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtxMf-0000000FAge-0L8t;
	Wed, 12 Aug 2026 01:02:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B45B111A03D;
	Wed, 12 Aug 2026 03:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786496549; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=PfgDafVpcYcIsx/y/Mtz5wPBNsA0Bqi65/JdgQqh0iY=;
	b=EFYrinV3BEapm6M2XOHJBjrJ2IA4vSaRhrSmC3sLGx7r+x4bZk7Z5LZQ7Jg3kcoGWizKwE
	/KGEKJDNNvjjJRuIT24HMYRzoz6s7b8W8QG/4oOasO0Em7EAgtdhzHxzxI7qCH5SqJ5hkM
	gbWV6kmZdJPvUkclEMXOuewW6Tu7PRRV/0z9Bx5cnYbLSdGJ296L258AL86RPtrWE9V5mJ
	YbZnFXlDADh1UyCYOhXGPTS6Gh7mdCKUa0GgdwRnMU00fk3E3U4D0LPvU70nv1FLFGo6PA
	o+VioM4lgh1MwCv6wDXPl3sJMtn/TxijLzF/RljnDM8UnsBUfiiony24qnL58w==
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
Subject: [PATCH 0/8] arm64: dts: phy: st: usb: Add STM32MP2 USB support
Date: Wed, 12 Aug 2026 02:55:40 +0200
Message-ID: <20260812010157.1772849-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_180241_391355_DAD31D26 
X-CRM114-Status: GOOD (  10.21  )
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

Marek Vasut (5):
  dt-bindings: usb: generic-ehci: Document access-controllers property
  dt-bindings: usb: generic-ohci: Document access-controllers property
  dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
  usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller
    glue
  arm64: dts: st: Add USB nodes on stm32mp231

Pankaj Dev (3):
  dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
  phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY
  arm64: dts: st: Add USB nodes on stm32mp251

 .../bindings/phy/st,stm32-usb2phy.yaml        |  72 ++++
 .../devicetree/bindings/usb/generic-ehci.yaml |   3 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   3 +
 .../bindings/usb/st,stm32mp25-dwc3.yaml       | 108 ++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |  77 ++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  61 +++
 drivers/phy/st/Kconfig                        |  10 +
 drivers/phy/st/Makefile                       |   1 +
 drivers/phy/st/phy-stm32-usb2phy.c            | 356 ++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c          |  44 +++
 10 files changed, 735 insertions(+)
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


