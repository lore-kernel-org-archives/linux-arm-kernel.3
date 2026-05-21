Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE06CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lj8wo7p1UD9NN5CnfCz6+orZZMLzy36Q+ONgzMn+SaQ=; b=TervNib/G6b9Wy
	6Vuis5i/NsJiqI7hNuIujdctykXhdq9qnl4WwknEj2lOfvH3uSQ112ZH5NKGwbpMWRT8aooyFibNk
	CMfhYWIr8nzz8v+b8RRCyNiHVkcQu5YCxXIKRqj3W8nFcW7kQuDg1dZRKJ99F7leVls6jiNG7wQCs
	uTb2RwyHYHqTBiXv8B0EF/+pofFD9dRwuJuFs231+MM5dED7gDed4CSoN0N7125QKzO92+cE+IV73
	9AOfYwNek7dMGCUnHkhI6DZyDnWW3I9G/9p5XAELGExPS8+nUvPlsMD5VxalXXqZHjS6ZmkVm9dBc
	De7RjinDGKsqwQ2Q+fTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6vT-00000008avN-2FLs;
	Thu, 21 May 2026 17:11:15 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6vQ-00000008ati-2tVy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 17:11:14 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-44e1860558fso4158610f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 10:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779383470; x=1779988270; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lj8wo7p1UD9NN5CnfCz6+orZZMLzy36Q+ONgzMn+SaQ=;
        b=qkNYNsBsNLrcusjQsBev9YZBivPiqwouu2dwfguGrJWAoAU8M9NMp43b0hla/gaB7B
         99nP2nrz98nwDRUHNMq76obyrLA9x9zu9JrYXsPeAekKAfBqeIYVfWO/hjUrzf0ywyN6
         FsXvucaV0Am/3ba0HX7RxGZ7hzF5+IGv7Co3/AY/M0CZtHFZCZBVm5FMwbtX9ItlZnYz
         Uw21B1LdVbuPG535h/egacP0YRFTlF2HyetC7RveiwurY6U6M7YxfiR7aXiw7ytTSNZH
         4Ae+rB6xKGi25dyJCsfO30525ugEWuuMC035bTpwuhHXwKFSmxtvVHyDTnuIApdR3TAB
         ZzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779383470; x=1779988270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lj8wo7p1UD9NN5CnfCz6+orZZMLzy36Q+ONgzMn+SaQ=;
        b=NFa6Pudz4KSECSIFHxwUuP/ddDmYuXNFOHdfaPzoy845qjx7ydG2Net6PRUOhLMf6S
         3hhsWnnLGRruKLuSYei1CZpaK4Y+ElN8KybWqelEq25NfYdwPoRv8k25q945Tn0kDIjt
         nFTbZKHx6CWsV/cWKDSY82dAZehiWOTaI3ml001//mPnKHmCzUWUOCON/lh9pTfrBONZ
         mGHdrIY5Ro+lxLV3MkW14rEKg+MOc6nTavfed4tfRZliSDgt+O6kAP+3b7eFdvL4OTUd
         znFKuqbLJPTKmUU2Gy8t+oj3gpPcwdnKSlepNNonFuB+/baBV8pfDW6NATzuISzsMOOR
         h6OA==
X-Forwarded-Encrypted: i=1; AFNElJ/AHG2/ifUvtO7vvmd2+bCyNulHeG6dLWBveIqD1clAVv7dwEERRcCvwvX1pafk3pHl8m/Saz89Bs27p5tf2HNp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/uFKql4bd+eHmf8HNEeV9spVCM8HBzI0JR5nBEGhjQPrXmQgF
	3AEmz7yVkCOyrqb7ChA5kRWSV9a1OaM2tL0LoBX3a1SkOZG+41jIG46n
X-Gm-Gg: Acq92OEPE2iTlJY9QcLTPaS1exzyN4VuOO15wtrNN0/Swx3wFZ/N0mqgyBe1TpEEOcq
	ZV+ply8EpD5US/IJLOVBNoFk/98ei15NzgEv6fh9DezvjNQTHr2mp8Rbw2reFdjyObB5hM7WCB3
	1D4NB3/fQsPy/aQfw0pVF0fXf7n8YapovKrC30TCFIM/zoseiwpgPQdbAds2WcnpCN6s+2jDdyX
	0TLUENoxKgXGKSEJFp2FjK+qCyzrDtljr1UwWouMQIScG1CQvym3ssJAsBRitV0TTyhioRgmwCL
	5a2reuLt+8lzMk1DSpN2eu9tUcgOuI+d8MJnw2ZdbDtizlDpAMxXKSlQ1Grtn8r3Y3ee1r+Ko/e
	sV4rjF2gPkgoD+jiDz1Vfgvqgseogd9teRU/VTTKOTlYTPMNyRR6X41H/IlA6G+JtxYpPk+If8h
	qE2c0Wv07zmOGv19A3QIPF1MnNODnMdJUTtF98IjogthNqcfBWOj8x2roWgE4VbF3SrEKLfZ0i+
	2ezz7dQc4+jHWWdHuhHtskIB5JNnAvNevv1sLkFoX1ahKRy/dDnrJR87lhwEW6ef/jS2GE9mxB7
	P20ZHY6j/oC1
X-Received: by 2002:a5d:598b:0:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-45ea4146976mr6175500f8f.35.1779383470219;
        Thu, 21 May 2026 10:11:10 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cd815sm6046116f8f.6.2026.05.21.10.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:11:09 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Thu, 21 May 2026 19:11:03 +0200
Message-Id: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKc8D2oC/23PTQrCMBAF4KtI1kaSyY+tK+8hLkIytQHbaqKhU
 np304JQaZdv4H0zM5CIwWMkp91AAiYffdfmIPc7YmvT3pB6lzMBBpopxqlxjprn298N9U1fKip
 BgNKmEg44ybVHwMr3M3m55lz7+OrCZ96Q+DT9YXqNJU4Z1aUtELlVkotz7hqH/cF2DZm4BAsC2
 AYBmWBagjSKoxBmTYglsfFSEtMVwAspCnZ0WP0T4zh+AaGyVuI4AQAA
X-Change-ID: 20260501-add-aquila-imx95-423256af3d21
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_101112_747958_66325A88 
X-CRM114-Status: GOOD (  10.56  )
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

This patch series adds support for the Toradex Aquila i.MX95 SoM and its
currently available carrier boards: the Aquila Development Board and the
Clover carrier board.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and 
Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
lane DSI or CSI interface, one LVDS interface (one or two channels), and
some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0, 
and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Changes in v4:
- Removed som_dsi2dp_bridge node from dev and clover board
  since SoC's DSI controller is unsupported
- Link to v3: https://patch.msgid.link/20260521-add-aquila-imx95-v3-0-621843807def@toradex.com

Changes in v3:
- Changed QSPI_1 4bit iomux node name to 'flexspi14bitgrp'
- Deleted the cdns,* properties from flexspi1
- Link to v2: https://patch.msgid.link/20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com

Changes in v2:
- Add 'acked-by' tag from Conor to the bindings patch
- Reordering iomux by node name
- Changed Francesco's tags to have the Toradex mail address
- Link to v1: https://lore.kernel.org/r/20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com

---
Antoine Gouby (1):
      arm64: dts: freescale: imx95-aquila: Add Clover carrier board

Franz Schnyder (1):
      dt-bindings: arm: fsl: add Aquila iMX95

João Paulo Gonçalves (1):
      arm64: dts: freescale: add Aquila iMX95 support

 Documentation/devicetree/bindings/arm/fsl.yaml     |    8 +
 arch/arm64/boot/dts/freescale/Makefile             |    2 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  285 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  389 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 5 files changed, 1844 insertions(+)
---
base-commit: 596d0f9f4fefffbf783ab26cfa90cf50f5dd6bb0
change-id: 20260501-add-aquila-imx95-423256af3d21

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>


