Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7241075284
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 09:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=69iwq8FlnzMS7nP54HlGXb7s0cbbMSrkUrxQqUW4wfY=; b=c25BBMv1fRvbQyevqRFeAP2H8G
	aNfq/KwPDfTzad9tDBtmoxhQGR4oyLzLHvhZikDqZwAOWPZXXsQv6LGD0K9CLNpsDVil5iZ11ls+x
	yxMkBwoj7GqInQ/jZ+ljJahKC3YiQa1k38WyZQt/H4MS4qBgNGkUinIpzrtqD2d1PX3iVAbi1/4Y8
	8uTVwHDqPTdZ6z5EpLwbeKmIPYx90EnfZ5SFjbCOq7Hh8Rl4utSWbVCNgLo5aXAyfg8kXULhMDV6q
	VT6yGvErCnIGhzWDL5Ljacb8txJSh/USi07U+ReGULDgWtpGMOQmfHqJixTw/Uvl1dL5t7qdTtvZW
	f75agNWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39dB-0000000AK9e-3o3i;
	Thu, 19 Mar 2026 09:25:29 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39d9-0000000AK97-1zNR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 09:25:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso2718025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773912325; x=1774517125; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69iwq8FlnzMS7nP54HlGXb7s0cbbMSrkUrxQqUW4wfY=;
        b=CN48TVVGIiQnN2orz1n7ts9ypng+M1ZfPKWr3ECz8et6bncFWlrn3AogPOfTVeVAFt
         z5PshpNUk0BWNsgTLw8FltylXOJkjmef0Vw+VvsW0pAdz/u0xlIiRXHncn7okg/6wR91
         L8ndt7Da6X+5gL56mb4PSNTw8vRanr1trleJ+Rz8qPb2i9RCaHkCm3KfMV/fNwI29YXB
         oUxxs7ubtO7l8zUcPF8gUtxy9s+MimJpIkJ7bau/QZvpj11dg3MS/Wves+zANRFYd723
         biU+df9tmnEDMg9Yzm0/S9AdwTWZxll5s1phEbasvlzcZJi+0k3QnQQMKwb/LkTrDTd1
         zvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912325; x=1774517125;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69iwq8FlnzMS7nP54HlGXb7s0cbbMSrkUrxQqUW4wfY=;
        b=CDpbtTKC3E+TUwU4B3I/4WHqIEo2XFQ0/ZKOBn7t+W49YoxtIfRjxo41srxaT3IsX7
         duRL4aHrly+3VwBwg/EWSD6c8ORtjTJ6Kq4j8v5qkYXg3vLARfGSJJz7xOLO0/Z7phQE
         DIqAMjxa/hSyUdpKo3KWW5HfrWIWMi+4fmzARzPDyUkZiZcAU4auGx1kQn8RXMCIBIqt
         sTGeRJv7YnTTEcGApizdmKufPYOcTIEuAKPCAnQ6hwApUxPnd+Kf6lQhWdG5sdbm2kDd
         y/ySkYQSUOMZHDMmE29t/bkDlHzfAXHOwfvGaLwOubCJ7biKGxs99FT++ZTKOP6sFTIN
         xyHQ==
X-Gm-Message-State: AOJu0YzdIMU2SoTVU3M06T5c4qYt2wuwjZ4hIx0ZWJwOKM20ZPb1E+iu
	xe4odM9/5xVacFiFi9xatFeKRWzs9/6TTLfTasjg1D5WYO9lpdEGsr2h/uIWtw==
X-Gm-Gg: ATEYQzxXVUhK7uznYzyhHSXUB41VbkjMPTh6YSa1dtLna2tATUgTzyCLJTTdXuwH5e4
	EpOZkHosDXcMNXC30bFx+7fCQ0DEgzVN7Ssf0p/71M/zacCdojKwd9sa3NoEouNpjaBorss4m3X
	Bx4yFIVigl0PPd1TCniV2siyXUqTiq6TR2XuHyxNHR9lmSy+RmzoppEuRX/2hhoBMf04YMLzJFT
	MvVZctIHA5qJUb1vVnbtY0yHgVO61h0NnsLKXtRBE+KBww2WVgmqzpKBAj91Fdmzq199d0F7+aL
	jgI0XAbRG87984VlRklOY8UdyiLAIw564H8H+6PdRvdn2d9nbyN63LG0qVRI2a7Ig17ZcCG2Vf9
	WL2ECb/D0SEyfG9KQC0PFS7fhkIxk4DDYD2t38+USocTmL4Ps35KEsp7304ud6gP9U7U41tJqfF
	hbYpJ9MHGwoaUiLNkztRJZe66AWn9QJft1ggTCANy4J3A4G0yFaBlHHT6NrEuCLMo=
X-Received: by 2002:a05:600c:1f8d:b0:485:3f65:94a1 with SMTP id 5b1f17b1804b1-486f4572a00mr111573515e9.18.1773912324935;
        Thu, 19 Mar 2026 02:25:24 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486f8aacc73sm50169335e9.0.2026.03.19.02.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:25:24 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 19 Mar 2026 10:24:59 +0100
Subject: [PATCH v3] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' from USB host nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-armada-37xx-drop-usb-misc-reg-v3-1-8585c8a0a8ba@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NvQ6DIBiF4VsxzP0a/graqffRdEBAJSlioCU2x
 nsvOrm143uG5ywo2ehsQtdqQdFml1wYS7BThfSgxt6CM6URxVRghjmo6JVRwOQ8g4lhgndqwbu
 kIdoebCPYhTe1VlagYkzRdm7e/fuj9ODSK8TPfpfJtv4rZwIEaow1aSUXrVS33iv3POvg0SZne
 tCI/KXRohnTdZISwjnhR21d1y/rW8zXGAEAAA==
X-Change-ID: 20260304-armada-37xx-drop-usb-misc-reg-e9635498cae6
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_022527_532883_6DCAE485 
X-CRM114-Status: GOOD (  16.22  )
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

The 'marvell,usb-misc-reg' property is present both in the EHCI and
in the XHCI USB host device nodes, however it is not documented. Thus
'make dtbs_check' produces warnings like these:

  /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
          from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
  /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
          from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml

Apart from the fact that the properties are not documented, those are
not even used by any USB host drivers. Due to this, drop the properties
in order to get rid of the warnings.

Note:

With the same name, there is a property used for the Armada 3700 USB
UTMI PHYs of which dt-bindings documentation has been added in commit
e60958699afa ("dt-bindings: phy: mvebu-utmi: add UTMI PHY bindings").

Additionally, the property is handled by the 'phy-mvebu-a3700-utmi'
driver since commit cc8b7a0ae866 ("phy: add A3700 UTMI PHY driver").

When the nodes of the UTMI PHYs has been added to the SoC dtsi by
commit 05d168a56fae ("arm64: dts: marvell: armada-37xx: declare USB2
UTMI PHYs"), the properties has been added to the USB host controller
nodes also. According to the commit message this was unintentional,
however in regard to the USB hosts, neither the respective documentation,
nor driver support has been added into the tree since that.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v3:
  - s/intentional/unintentional/
  - add Reviewed-by tag from Miquel
  - Link to v2: https://lore.kernel.org/r/20260317-armada-37xx-drop-usb-misc-reg-v2-1-ddff72114414@gmail.com

Changes in v2:
  - add Reviewed-by tag from Andrew
  - change subject and reword commit message
  - Link to v1: https://lore.kernel.org/r/20260304-armada-37xx-drop-usb-misc-reg-v1-1-800c1b746b7a@gmail.com
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index ea1824f5321fbb32fc4373c08a0d94bca1dc793b..44c47409f8793ae1266303607812ef481edbfbc5 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -369,7 +369,6 @@ usb3: usb@58000 {
 				compatible = "marvell,armada3700-xhci",
 				"generic-xhci";
 				reg = <0x58000 0x4000>;
-				marvell,usb-misc-reg = <&usb32_syscon>;
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&sb_periph_clk 12>;
 				phys = <&comphy0 0>, <&usb2_utmi_otg_phy>;
@@ -393,7 +392,6 @@ usb32_syscon: system-controller@5d800 {
 			usb2: usb@5e000 {
 				compatible = "marvell,armada-3700-ehci";
 				reg = <0x5e000 0x1000>;
-				marvell,usb-misc-reg = <&usb2_syscon>;
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb2_utmi_host_phy>;
 				phy-names = "usb";

---
base-commit: 98226a594f313442fcba38cefc1df0b6c1691c7e
change-id: 20260304-armada-37xx-drop-usb-misc-reg-e9635498cae6

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


