Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BC4CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aVOu3BYA8D072I0qM7Lp3VGwdHFlopVTdr1RQuFawxs=; b=HpuOgLf5jxTMbc
	Vd5f2m0kuFyeYY8OBKRiVTnTicqUyTWsCyYtqrzDwyYv2cvH4yaRCOxLhHBMzL1HQbL/SLOejiZZs
	z6BKN4L8baQH/eqCpamEPHJT6C/Cc/yZr7yVqLnXSS4MFSIFce6F0EkU35fT3QJ7Wzf2NAfqu0f4J
	1dnSnvM3GnQkZxmB3lOpGz3d7EY1a4B0kDiz4x6J4oCIkOWAb/iTxH2MUqRf8xYZKa8ubD79v4wqx
	koaGaE3DWWQBDE88WvkVfia7OBMZnnDIjCiIDMjkxXtwHFxSchENMukbFUZUfy2xFqicr3ohqOjo1
	1mHbh3NSqC8E3/xOn4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf8U-00000004SJY-3rgq;
	Wed, 20 May 2026 11:30:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf8S-00000004SHx-0Usw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:30:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so36705615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779276646; x=1779881446; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aVOu3BYA8D072I0qM7Lp3VGwdHFlopVTdr1RQuFawxs=;
        b=s/2bR+AGKJU0+dzsWkoDcH447K4JQgRXAAL3vxUEcbk7bQvXLd4JDvUVhu9RRWKlKd
         +PUv//CntpJpie9LEVISYKEkCXMvUhTpx5JJTZVjUR2WFSG3qUrKcOYoIRsflNyHQSq0
         PaqkNnx14qy0nBJaffEafFFRlTZ5I0x3DNeoHU1ASQwph7qRnYt8XFxMkud1lXpT0i0p
         ezuz5OOsjv8Zd4QuG8SliIhPXgxQOiuiXu2tdnZ+4IpIVuWJwkyUwZvErndxhalAaKIi
         WSnu251Te76A1jM1TE1tmoEcnBzU5bi3Mj1HrP/rg6gtkviBzoSn67FXG9jpQKCBUKd1
         a4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276646; x=1779881446;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVOu3BYA8D072I0qM7Lp3VGwdHFlopVTdr1RQuFawxs=;
        b=d7W4Ki3OAKrwHPVhOBgLVkOn9ZWK9qPWMiOLZx2TEOtpS4RZ8LkE0jj89XmUDQc4nw
         37Zd7lrZstU9XMxcMa2H1CwNoua9uqUH5KhaEQIiu5tE+AgmYIaUlT8iOqvxhucCgzCw
         gOfW0dTUnA++S5KpValTkCXlae5JlUDX9o5yg8hftO9pLDVbGKDMAIdwMnvLkH3h60tl
         O357UiBLbYpY1Jlbx98FIKIdqA3dB+69Boh6D3UowzuAh5aTM9B9VkIO/LOIWCGaUHS6
         0aU8nLOrnzRwIyHKI2qq6cN6OayoD2SMn1TeBYjWcUa23Lcl9Y/bYqpSD5fd+NpP80Sr
         pPfw==
X-Forwarded-Encrypted: i=1; AFNElJ/2nI+KKn3tIBuXDWgFAK3y5MWNgOtdaf7TjuuJK62sJgU9o8xfsO1oXee/wZl+Cz3OSZ4HjiO7RA5QUK9C2je2@lists.infradead.org
X-Gm-Message-State: AOJu0YwO02gY6mK8bDbeNbgDjp5o1dpUBhh/2lPcYDdmczAVk4gC8bIA
	aAppiiZKGj9IOHyl7O4300Dr+9FhnPlEfWpLfgrpsU29jWTziSsCqfrb
X-Gm-Gg: Acq92OEpiw7jDtXg922EjK+gl2/NNCbzCQOLjjrYhXnzS2Puxnt1bnQv8gkUSUFSD0y
	+nAaeqy6x6KzglwSgRPJ+cnVgFkslngAoZ7/kVQ+IjParVbqKzUs9GfjYN6bpBxSW9vMtWgnr1z
	LrcZwBf9egQ8cWR136YxBtwo+BzlTwBc0WZBgUm77EX0hW4llQkBMJbtEVHV//WWed7xeXRvm/N
	BFGYXivoWi7GZj675Tsm4wqY+yB02X9JMTWcB5+1HECq2Plf7ocMWDPPdiNQMH6PT+B60NmC/qH
	pFZWZjbBWOFasQpsk2UwZ8mwWB9eKx4mSVHw+niqtGqAGoN9vgUpzLiln8ti8Mgpr/WDqIMD4k5
	Bh08u8gtm9nFMDUh3ADfz13eGSkp/fgWI0ujFxb3SlOZzoYicVFsRz0qJ5Lop+pdWvni5zhvM0P
	QznpXuASWvel5XE+UkdCd63QsjuW7RJyEanxlzZYVUiF/8PzC+7wiZH9W+4M8y7xKRtwTRjiaBq
	Ih+VfRF9/PyAqHEcUe7nDmTVMwQlyBQaOwSZxlPwtusaZUZxrbr5OSW8GrbmzrgXG8OlhVNo8ck
	mQ==
X-Received: by 2002:a05:600c:5296:b0:490:31e:d6f4 with SMTP id 5b1f17b1804b1-490031ed905mr245274475e9.18.1779276645662;
        Wed, 20 May 2026 04:30:45 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab3977sm430363315e9.9.2026.05.20.04.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:30:45 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Wed, 20 May 2026 13:30:31 +0200
Message-Id: <20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFebDWoC/2WNyw6CMBBFf4XM2jF90EZc+R+GRdMOMomAtEpqC
 P9uJXHl8tzknLtCosiU4FytEGnhxNNYQB0q8L0bb4QcCoMSygojJLoQ0M0vvjvkITcGa6WVsa7
 TQUko2iNSx3lPXtvCPafnFN/7wyK/6y9m/2OLRIG28Sci6U0t9aW4LlA++mmAdtu2D3ufFpKyA
 AAA
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
X-CRM114-CacheID: sfid-20260520_043048_179800_EFC9F837 
X-CRM114-Status: GOOD (  10.64  )
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
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  294 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  398 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 5 files changed, 1862 insertions(+)
---
base-commit: 596d0f9f4fefffbf783ab26cfa90cf50f5dd6bb0
change-id: 20260501-add-aquila-imx95-423256af3d21

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>


