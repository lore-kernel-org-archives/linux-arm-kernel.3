Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0533109C027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aIJ6bt/DVjHXVsX2+SKn88jbhDMD1b3roo62WEZzt0Y=; b=vrkNN2bLokWzE3
	MV8u/oE1AAl4kmYHJ/JZGTuH7g9Ck7VG8yYCSU4Hz9xGv3xLsf/i9VM6jVnU9bN4G8ps6i2+4GYKt
	aKLzlFfgY5z47MlY4owMi5XtKiQIBjxu+rIGwEuBXC7YIfqjJTPulVHK20Yx/lsi5nxlGRcREoDOv
	/AlSty99XmodmUWAsFTYBaqRSHaHDvoZDjPriAsnComATkT5Ghe3aPhWgebJV8HQxv2T+HXN6pkga
	m4QfBZVf7yDk7FTi3+9eXs1DZIYG0xpVaZhohJQsJeQaoslbb8hadPYhe1FdhHi9mTaJQ8q3X+/u3
	OrnQHodkRSWJRT3O9Cbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PVG-00000003eQJ-36pg;
	Wed, 25 Mar 2026 14:46:38 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PVC-00000003eNf-0EX3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:46:35 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-439af7d77f0so5014921f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449991; x=1775054791; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIJ6bt/DVjHXVsX2+SKn88jbhDMD1b3roo62WEZzt0Y=;
        b=L7MqnDtuu4fBnOeSuaARw4kVnj17uhkCEVz2/LqSFmSHH/PxdGgGlu8/QFJqFf63xa
         rb9b3rhbf2dm6gU9ca6iuaCfNSMQ5AX/36JZIZ5rABcoDN2DBPSPKbw1Ogg+h8IMdIUx
         +sxxGndv1VlzNC44r4Kyqw2COR1+VxSPkcRkI4ZeesCN+oNvm4L2lnX/P+QDgtiKP3He
         y7d/SWln2lZIXOBL13nwsFTldf4VZ3M1GHGMDAxEvHHkDhwEi04BXnaio2n+U8xLdhSo
         D5x/xMlo94Ae2WMFYxda677Ja+UtxhC9F/5Dw/A8yIOrKGKH18jgZLRrhQyb/yQwiI5W
         8ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449991; x=1775054791;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIJ6bt/DVjHXVsX2+SKn88jbhDMD1b3roo62WEZzt0Y=;
        b=bjFWydvu7pfPCBzajnMh0Zj7ywd6CgkqLmNYEIRBcIvndslHStgP4Exitk6u1zJN/Y
         HApTk1ycREzBVsCHaVuc0Z5skdrYC2yRX/O1aOZ1LEvp+mMi5OSNXlOo4bqCh9XYjKqo
         IccdHwv9M6AZFhpTIY5oIdd5bC2YdP1mm4LzHVmF/EtKV3liQYzh0/YGVG7aD7RYxAH+
         fNO5Y3xMosSDQw38AI+KBrrQNWrMNqQX0azA9eSKxgRKJvI5rxCYwqQpuDLYTnFXmxvh
         lXdKW/sNHXU4PTzPrK7OTC8btYn5vBCRWPDe5ucuB+Rvtw7g/nlijFXqjTX9oXuDBylw
         I24g==
X-Forwarded-Encrypted: i=1; AJvYcCWELkprahpioTNxsjm59fq3rtYPiHXX+xUawqCzvP+R9EyBWi+Kw82m1vUX2v9ktocIqjccaldhkj4+BGRq4ujB@lists.infradead.org
X-Gm-Message-State: AOJu0YziicibRfkMtRnQJ0/Xlz8Y3A0Wd/RGZLjJTk7xJ7Cs4+0HKV1U
	FJTe/XEBDpqzeoEXEVMWu+0qrh3SYhj1+EOVNb0puQzTS37eeaQDOO6G
X-Gm-Gg: ATEYQzwgGGFDRSWOOsmnkYJS3+NF/fZox9ThZH7Ocy5h6S1RK2NO52bDNmfKeS/gl8h
	vXw5JqxzYUqADUmtRdT5o2gvM4+s2BjYN7RSvNV9hgZcjnI3NwZvI9HLraf1IxG4R+d208uhzI/
	+nnQBOpJsQnEXs6BaNTIWTPrRDZNie/X28y+CRY1AqQ/pwLb/NORqgGy0c3LWVcXYVAo+reRXhD
	aIqfCYlV8ka1edKtXK9ECxHXsVc+XvYu0DOS/AcoqhCPEJ4oV/fn9dNYK0xH64r8mqWuo/uTMPU
	yRi19N2ee5bxmP4tOmvj+/MckdNfUkUJEIBmAA2Snl9OB3EC554FDHDzCJ7u9/ZohhaV6pSKGps
	idumT55tH6/Am9dFwyeYoVbdyyqmUobyKxMgjQpPNXifjS+yGhnqR1DH/ONU0GQ3KUn55ZkaLfY
	+eG3CYs0JuOzh6FQv/ZKdOlsBcxEVJvUQPwC/4BvxyatOO2EBYh8EHUOR4oKOlqEo/ZjkeHdt5y
	lbk3XVPLOcEYqWltkeOQ9BF6a4=
X-Received: by 2002:a05:6000:2385:b0:43b:4396:674f with SMTP id ffacd0b85a97d-43b88a0d0b0mr5635919f8f.55.1774449991153;
        Wed, 25 Mar 2026 07:46:31 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm304592f8f.8.2026.03.25.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:46:30 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v3 0/6] arm64: dts: freescale: add Verdin iMX95
Date: Wed, 25 Mar 2026 15:46:01 +0100
Message-Id: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACn1w2kC/5XNSw6CMBSF4a2Yjr2mFMvDkfswDvq4yI1SSIsNh
 rB3CyPjSIf/GXxnZgE9YWCn3cw8RgrUuxT5fsdMq9wNgWxqJrgoeM4lRPSWHFA31RKeQxg9qg4
 ar9wdHgRaBQQtS6Xr0khpMpakwWND0/ZyuaZuKYy9f22nMVvX//yYAYdK5I2yXFhs6nPilMXpY
 PqOrQ9RfKhZ/psqkqrtsao0lqaov9RlWd4L7OILLgEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_074634_120865_A255950D 
X-CRM114-Status: GOOD (  10.01  )
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

This patch series adds support for the Toradex Verdin i.MX95 SoM and its
currently available carrier boards: the Verdin Development Board, and
the Dahlia, Ivy, Mallow and Yavia carrier boards.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR4x RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, an I2C EEPROM and Temperature Sensor, an RX8130 RTC, an
I3C bus, one Quad lane CSI interface, one Quad lane DSI or CSI
interface, one LVDS interface (one or two channels), and some optional
addons: TPM 2.0, and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/de/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
---
Changes in v3:
- Rebased
- Link to v2: https://lore.kernel.org/r/20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com

Changes in v2:
- Fixed imx95-verdin.dtsi, imx95-verdin-dahlia.dtsi and imx95-verdin-ivy.dtsi node order

Link to v1: https://lore.kernel.org/r/20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com

---
Ernest Van Hoecke (6):
      dt-bindings: arm: fsl: add Verdin iMX95
      arm64: dts: freescale: Add Verdin iMX95 support
      arm64: dts: freescale: imx95-verdin: Add Dahlia carrier board
      arm64: dts: freescale: imx95-verdin: Add Ivy carrier board
      arm64: dts: freescale: imx95-verdin: Add Mallow carrier board
      arm64: dts: freescale: imx95-verdin: Add Yavia carrier board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   24 +
 arch/arm64/boot/dts/freescale/Makefile             |   10 +
 .../boot/dts/freescale/imx95-verdin-dahlia.dtsi    |  270 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-dev.dtsi |  250 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi |  515 +++++++++
 .../boot/dts/freescale/imx95-verdin-mallow.dtsi    |  223 ++++
 .../dts/freescale/imx95-verdin-nonwifi-dahlia.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-dev.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-ivy.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-mallow.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-yavia.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-nonwifi.dtsi   |   16 +
 .../dts/freescale/imx95-verdin-wifi-dahlia.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-dev.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-ivy.dts   |   21 +
 .../dts/freescale/imx95-verdin-wifi-mallow.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-yavia.dts |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi.dtsi      |   50 +
 .../boot/dts/freescale/imx95-verdin-yavia.dtsi     |  217 ++++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi    | 1162 ++++++++++++++++++++
 20 files changed, 2947 insertions(+)
---
base-commit: b4c2be6e5620c5054299aaf63e89412f08ab60d8
change-id: 20260305-verdin-imx95-upstream-frank-li-base-b57ab97c55c1

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


