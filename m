Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC832C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 22:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3+ViYFK6cZ5RDnEJVte/faPIBmDF3fgsQUkS20n29yE=; b=Z8IOwj/eRK+86UC6B5aI6yIRNe
	+Td+cPn9HOCeh8pgwLjjf9r9w9qqoRclONgW+0aVwli/K1bCyCPxIK6McNo1/ocb2mkFQfa3/jTN4
	lVfzpA31TshnpapkszXTeoNm+FkVYpEMeC2LLqhQMXkjfHP/jegxbvprYIUgbSzFUVXa9RewWF2W2
	m8nExkGMiWiomT/C1B8MHqSXA7Ym8kXHuNTqdcF/9WAy4EsJKP4ykPswgDnB92T1MliMDpnI6BCkS
	kc8gJm8gfccwAwnD9iin11+DqIF66vIcRLHGsgnsOfAoxvahp8VGFQUedfrXSe7DL7qvmFHmkSgH3
	1M/JrQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Auh-0000000AcNy-0oKQ;
	Mon, 31 Aug 2026 22:55:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Aue-0000000AcNT-3yJn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 22:55:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so29395565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 15:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788216935; x=1788821735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+ViYFK6cZ5RDnEJVte/faPIBmDF3fgsQUkS20n29yE=;
        b=TnaUXI2nbTibHkXPnAIM0XYKQ8A9n1XaIrxJlGl3NhsJ/d8B8fqNaX1xAyO+8zJi5l
         nVqLW3KALWrrbLHxDWVbN30nz0YC40T3+gPH440J6qD1odwJlLIlLMFl25QvG42/OtWq
         RsqLjtPHb+Tjk4A/TpC256hNkTC2cNhkuSuzb/X7wwRy+z+XmqI3+R+VLDRZeQtXOY0s
         FaiXt5uRta/HbMl2nKBQXcNJhtKdsrG4GWJZBnYKQj11YMXkCQIwDDwrWKTzKQ4CAsXq
         w8T73la2okNN4AcjYs/7oa+PgQVhupaFYEqthNNmhkq2exUc1lJYYRz1CK7Y4Cj8zsLg
         rvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788216935; x=1788821735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+ViYFK6cZ5RDnEJVte/faPIBmDF3fgsQUkS20n29yE=;
        b=TAuQ4cWIxohYadwzyPaT/ojxZxVL4BHBUGm/NZlclxzbSbw9VjgfqSt74TRme9l1e/
         YoQHDZBNyuPunYmMECrtJQJH/bkc2zaYD4RVj8E/oyR2tWvBvReoW0EWDKagGU7mUiY1
         LWFqykzv48OlELynE3wOgq+kuk1aQy6cEizhi93oxit8enwIobyLxMgkJdc4vHNMgiQm
         3nO+riAv+2o6FiQ/7RnS5capdLP1hgvYnt4sT3M8GNixpvE6lzH7QRcSO1fgd3cyi6df
         QNX/6HOabl30xW3fxXvqVRY7UgUoHiTKErpj58JAGW1X0BefuEzWE0j+sCFT3nCEsc28
         Xupw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2YD3dJMzTLPnq7tK9X0hR5pcxPlU3mNcfRn+0pTFEz67PBABGyB6JnF7/ZVOltONzm+33Rdd7CDytCbK7DNd5@lists.infradead.org
X-Gm-Message-State: AFuF++n+d5RxkhTJL3dnKT9TSp+CUKF6rq/vcVVhv2E0tZxTxR31Ut95
	cy6Y/aIK6IjDRYZhzx3QQlCpHsuk/qkpSR8sJjEviqH/ug/mnPfYAYUd
X-Gm-Gg: AR+sD12+5VbEKwjXHq3XQCK7ess6P+42py2xv6vjYp4XUP2UrmyBp0k+CBOn44iGOdk
	2nYLEpYpBSlqsGyEIE4kYYtiz3AxAQ6oUTHKAuk7tRpkocb1i173pSbO3btZd7+we2p3IHKUEF5
	B0o0hu8eHKYvJgYyicdhWdLNBwCMQzqz6xGoenFxudTWGSlY9LecdFhTaCZnerH1oWbMtAo/Smy
	H7JxT+GaPqtvpso3KSJtSnROeh9AtBGZxUt3V5lJgez9jmnpKBGC4qYGy2pcWQHk/JZoEhxgyAb
	cwT8bU1Bli72HW6eUtmSpL9KfBP17OIshrRwAqIBJgTME3bwEEnNIUHfjoxMBJ6T7UjFxcE5Mze
	VWpODxq5OpKc4fWTKw3ohIffNzGMvNJ4XAxoOhRLWVA5k1/Y2DBZ38Z7KjQ4qareV4IPLu3JdDQ
	/7oEb1XST+LwmEv/l3biSFwo+fzfcsEEj8hqybDkwmzigJSifCPM9r6vLN9Wt0DHarww5mTs9a/
	kyr7uSFe4qCVTYclYJwPc9CdA==
X-Received: by 2002:a05:600c:3b13:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-49cdc4332d4mr66819045e9.7.1788216934602;
        Mon, 31 Aug 2026 15:55:34 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm24452615e9.4.2026.08.31.15.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:55:33 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v8 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Tue,  1 Sep 2026 00:55:17 +0200
Message-ID: <cover.1788184274.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_155537_009831_FE1A5FCE 
X-CRM114-Status: GOOD (  14.71  )
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

This patch series adds support for the Variscite VAR-SOM-MX7 system on
module and the MX7CustomBoard carrier board.

The series includes:

- DT bindings for the supported VAR-SOM-MX7 board configurations
- VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
- MX7CustomBoard carrier board support
- eMMC and NAND storage variants
- optional WM8731 audio codec support

The implementation follows the standard SOM + carrier board pattern,
where the common SOM dtsi contains the on-module peripherals and
hardware revision differences, while the MX7CustomBoard dtsi contains
the carrier-specific interfaces.

The final board device trees combine the supported VAR-SOM-MX7
configurations with the MX7CustomBoard carrier board.

v7->v8:
 - Fixed commit message adding wm8904

v6->v7:
 - Added common dtsi for wm8904 codec removing it from base dtsi
 - Spacing cleanup

v5->v6:
 - Removed unused 100mhz and 200mhz pinctrl

v4->v5:
 - Removed wrong gpio-hog

v3->v4:
 - Fixed non-generic names and wrong separators
 - Fixed ads7846_ts pendown gpio

v2->v3:
 - Removed wrong header in dtsi
 - Fixed pinctrl name
 - Fixed sai clocks

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio property
 - Added disable-over-current property in usb nodes
 - Fixed model names

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  23 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  56 ++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 358 ++++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  23 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 +++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  24 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  24 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 +++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     | 102 ++++
 .../dts/nxp/imx/imx7d-var-som-wm8904.dtsi     | 118 ++++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 533 ++++++++++++++++++
 15 files changed, 1469 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3


