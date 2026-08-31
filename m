Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4728CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MTylV7csYnLWM1x8O3QnuC/IfF/z4HrLSIT7SMiMU7I=; b=wa3CRU8Bok18OuIRoBRByRqqxD
	C4uY4rCTvUvCU3ynNEcVERRT5M/t7NSeBQvF2WuxYGdpkNceEItaDZmdbnHyYVjKD81dWslZ3j/5H
	5kKyZ07u8b9YYb25gjHs3DLwLpgGkhPBLM9TaGgO6vjsUdB9m40uOYUeGISvZgQxWmrsQxnzPxV+p
	RDkwkd+PTNtSQW2J/RATQQ98Ih2JJw37Pl7elUOw6MQRuQqocXeID7/9o2rRLR9i6iYxb6i2LqkS5
	nH0mMBxArDQadPeDPLmihyj4GiZo3YpDX0HWTPo6a0nkWAB+PUe/FUl5ra8uE8LNk5Lj3VAO1Y7TR
	oRLrvF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11TK-00000009KuI-2HPk;
	Mon, 31 Aug 2026 12:50:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11TI-00000009KtH-1oNF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:50:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso48049735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180642; x=1788785442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTylV7csYnLWM1x8O3QnuC/IfF/z4HrLSIT7SMiMU7I=;
        b=hRaHz8XPCvncb6gA/gF/OL80Jgkys2WxTykvi0xmMt3sj7b1kEvWs9GgvK5EXuomTJ
         ZkV3iDXzZXFy13FmM73lTdWR4mnvfHLl2jJ3fWMosLmUrdgDxInKkzPvgCtDs1D/MMIF
         KaaKjIYwSBuBAqSBfzFPJmYAyqZue+3rQDaeN4HEZWLyfU6u3WlcirrQyhNteyBxSNRl
         bDoa0IVQD3x1ZH78yMk7OMyiLfEdq0ymxo71t0irfOkzAyL8cK7Stit4pG3eb5rzXjh8
         KHNoDc4bPt0LQ2NO8uNtPBbtTSW9w98DFCqYoOqLgdibKtzIgKT/68/aSx7Ld9Ybz4pf
         cnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180642; x=1788785442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTylV7csYnLWM1x8O3QnuC/IfF/z4HrLSIT7SMiMU7I=;
        b=NYNvNImGRFVRAWEJiP14fSlt7IsRaVQLiPIwARdxH8lN3vgnvUAP8aYM1hZ51rrzwG
         eZlzPSQpAgGEiy/ndCQfL7AcBbl6WjxOmokdaA0Rrxc/CjxA5v2Q+DrhFCrmBSCPu5AL
         MHex4yEDRmjiQFLqqIQRb3D6+4Y1uPrDqWwwUt0GSwrQwCQyG3y8jUrR9Oh8dhwWrfZY
         37izKfwSnHy69xPZDyz8sb83YehgKfV3vNCGsYNuyxMaYf4fuyOh9zrb2KonMvM0u4So
         4sVQ/agPa2GY3oPQUzrYBcTvMX/2TibgWANvowh/JYRVNGyzHVU6FSJEB4KnklZ2IIEd
         mrEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnYfR4fCGA3ud61vaL8Sjts1QPFWk+b2CzfVHh6YEVZt4yLtNCWldki0Ruqq/HJZwH1c5t72ELqvCYHWxox/6u@lists.infradead.org
X-Gm-Message-State: AFuF++kt/LTXnMInMofm/UXIQlYy8rBqu1k6+NW14c95hFmLAdbjZ6hi
	cxEDzYhZYorDlBpYnuliLNo/Bi2UWTvOAQJGbAiDeWRr7HwKHIjr1G9ZYEPRYIZVziY=
X-Gm-Gg: AR+sD13AwdZS2yMzij5ryu2Jw5T1sDl5x0/XFhPcFvA5Pz3VJw97BnuCZ3RtOp9qjhY
	LxjBTp8xlz0EwxQgSJveJ4vNtbfFRgIqCNBq7WLJF4kSmd6ypNk9gis0lXIWa2re3OX0I7C7Oy2
	sPdWhIQttoV2/biPzprxo8d9M4SI7RJYj5Ie3zvd8d7H2VJ8VC0PIHPZn1l45T0h6j61gxkctFV
	CpPmGyfe43BxAUpnBIztaJ/tbzIY6BiXO+G/1bogBrubfw4vovc31l5ytTiE6m2erBwwNNA3RBd
	05hVcbK9Y7BykPq88lzpslNfYdmTv8dTcW+DgpIui8V9BpVgzAqNEMwIqqE+pvqLq6yeoijgH3M
	yrl8wCZ5Vi+QMATdcZzdLy7OgEShJ9TbeK/R0eZVRtPscJyLUpnGW6GxZ7rMvr/zzdFtDJELG0c
	B56Bk1VTteC5Ra+SMqk0fScZvWjNkxfhQRhIua1CassW83DcllPeTus7gUq8c/L/9U1YrV5Sxe9
	9qixr7YsJ8WHPLks9tMvxsBKg==
X-Received: by 2002:a05:600c:354f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49b91c1ece1mr452067475e9.5.1788180641698;
        Mon, 31 Aug 2026 05:50:41 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm116571225e9.13.2026.08.31.05.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:50:41 -0700 (PDT)
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
Subject: [PATCH v7 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Mon, 31 Aug 2026 14:50:22 +0200
Message-ID: <cover.1788180142.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_055044_502923_683BF1ED 
X-CRM114-Status: GOOD (  14.51  )
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


