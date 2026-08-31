Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902F5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h31VU+R5UPSga0UvhcM5lnBnLp5VXrWzv1ka1JR7q+E=; b=byTHmqqmRPeYdvSwM+EbhnHO54
	zNiwG+dpLEn1YW2mlbdu5YzU87p5fo/9SPlub9yFyWxfHe57nBVrpuBhM7b0007L9+p7CYxnzp4x7
	gEZvr3nUFvIFBpsF+Wj98Om0gWYdKVUaDmzUTIloE0f8hHKQ4wkqcUaT8DKwxr+D0mqxS67TEkSeu
	GMDyihNlrEIRO3xa+yYq9+Nm7WN9H/hES8F9AwXRoZwHrelvuebKjCyL2vj6YBa8/Bb2leAzTslE1
	VyOkPotZK2CsdtnNc+Zxh7AqsHnKnVlM4tr/mLGCawonxrTDGQom8WHJNi6phhHGiLhjeC+U988FP
	FaYPv+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BGm-0000000Adlq-48aB;
	Mon, 31 Aug 2026 23:18:29 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BGj-0000000AdlX-29Zh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:18:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D19D11C757;
	Tue, 01 Sep 2026 01:18:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788218299; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=h31VU+R5UPSga0UvhcM5lnBnLp5VXrWzv1ka1JR7q+E=;
	b=JCPBi3WZdTtIt78Td+gg97FO2qxleHJqq+HDx/8RsSIzoCPdlHbnXtZQwNrdbitVUkl2X9
	O927rJNbbr9Vd1QqrexFtaEi6KaTNwrbsWQ933C2VEMy3mKn7RG1s5m1w0Xj/1acFGe+43
	Rs2ecy1rJcKUKBpxYSMpDBKVbRnmV12w0UGGjLiDx6K0nR5Tusdkq4K1Z8drSv7gHUMET9
	910gJUAhdS6E9NYt/2HDiryyOp7+fdeKmVmwJ/OBsCQWuZ6CS8vVv8J7xTlV2OMm2UEbLD
	gKUCQmKapZ8hKTsBcdldjA7UMBXX6EI5ONtI9phbBSrHeSWPA6fjXOOvSIV9fQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 0/4] arm64: dts: st: Add STM32MP2 USB support
Date: Tue,  1 Sep 2026 01:17:31 +0200
Message-ID: <20260831231814.137120-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_161825_724402_CA9C2F64 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

Depends:
- dt-bindings: usb: generic-ohci: Document ST STM32MP1 SoC compatibles
  https://lore.kernel.org/all/20260828150202.173109-1-marex@nabladev.com/
- dt-bindings: usb: generic-ehci: Document ST STM32MP1 SoC compatibles
  https://lore.kernel.org/all/20260828152130.176171-1-marex@nabladev.com/
- dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
  https://lore.kernel.org/all/20260828150739.174460-1-marex@nabladev.com/
- dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
  https://lore.kernel.org/all/20260828150937.174735-1-marex@nabladev.com/
- dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
  https://lore.kernel.org/all/20260831231359.136475-1-marex@nabladev.com/

Marek Vasut (3):
  dt-bindings: usb: generic-ohci: Document ST STM32MP2 SoC compatibles
  dt-bindings: usb: generic-ehci: Document ST STM32MP2 SoC compatibles
  arm64: dts: st: Add USB nodes on stm32mp231

Pankaj Dev (1):
  arm64: dts: st: Add USB nodes on stm32mp251

 .../devicetree/bindings/usb/generic-ehci.yaml | 22 +++++++
 .../devicetree/bindings/usb/generic-ohci.yaml | 22 +++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi        | 64 +++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 63 ++++++++++++++++++
 4 files changed, 171 insertions(+)

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org

-- 
2.53.0


