Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ED9C61CE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TR6WdwjvSGIyObTPwhxsK9zRSRPeNRhfXdDEqD6Slp0=; b=DMRBhHcl+CI8vRTmYLwpseo6IN
	Oj+GGbjDRwFiD//zyE8qrbpG7Wb/hb2yoJBAa9mO9KBTte8T7a9PqcwI6XqLPyejOtU8klGJ7TRWY
	O6DKxkYlubbr1cOLx4Y/fSbdn4zm5wlcBJx34yGyggqIcHajFJKGqjmgE3C3Hwawv2sk+ru+pukrT
	/UF+hINy/Us4zE0KtigjmvuRY2mz/26AYZaoiQs69VbU3C9kBdpMiTV5EJsP+jkI7pLA2/4CIUEVN
	PUr04DsQtxSJ3BXH9ZhmjrpMy47UsdBnrYuvHBlqIjdgGgx5zTp4e/wDxD/rycX7+ce+SzLlxhSCh
	WkY04/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyl5n-00000000FW0-2zO5;
	Tue, 25 Aug 2026 06:57:07 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyl5l-00000000FVe-12Qw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 06:57:06 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c214321dc32so853365566b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 23:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641023; x=1788245823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TR6WdwjvSGIyObTPwhxsK9zRSRPeNRhfXdDEqD6Slp0=;
        b=kibv3hEv0VZZ05XfiF0y31xqE6kkCn4/gEaxKOnB2ImoIH8YqX3XZHJKL50Ca0f45A
         J2AexYP0+RBNvjDYvEMIqzTO55SDTNZT+8ubJ3au+Ngw1SXyo0cTGoFYCAU9+UD6lEXu
         QBAORY7WZFoiST+lwn6Sv5OuxgCX00UkafxC71pzAnw6Cas1blcpIFiGKGCP0Ge3Tv/N
         XDWYfFxY5MSlcUwKM/wwPLlc+v4mtP2Gi534Cz61JKohtp7IvEc1qm6hPDxgVrs8rOAY
         lsgmcW7UXNOUgHeD7qckWOGtYE5BGMUwLil47SrkSjxbNqNAgyY67vlC0foJVbzm/x9p
         1fXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641023; x=1788245823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TR6WdwjvSGIyObTPwhxsK9zRSRPeNRhfXdDEqD6Slp0=;
        b=Bj6w8+nBLyccjzmaMGuh8SGrE2EKiqV+krukI1PpVVcE8zyjdy6TmbnEhL2l2G/sj0
         rqFzC+RupzcZVV+Q8//xo1HnyoQYJw4ey8jZwXrJogH8SiqS19caITVReUGJUYC6X24g
         00VtyYh5/RzCH2VsKxAIq64Tlqx1EnQr2+27p9+vMv/oJF1cl5pqnOfedbtxxl0NAa7Z
         Z9CH0s6qto/137g6f+oJ/8e3xeEOK+tKDVH+nEond+4Xke4QvHCukX1TUQLxTTINM1Ho
         NjcfTZKDsUie7WUg+8osE1kQOiW7T65uGr5onJg7Eco6c6ZwfpZ5MKWtviQro7ajFuC6
         S7Yg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4+hnfz0oV1Fn/HTn3+LB71V8MjAxQEBhM0kfNzIWQslSnLhnw3Jmw/ykn34+GCKkF5MRAC8hxldpVHGorVCc3@lists.infradead.org
X-Gm-Message-State: AFuF++lWGR9R1Znu7GXPHsiZZNwCZ7jUHXFx3oLfXiQAgSTYEaaCXJyi
	7AVvxiVfAZRbaaEF0kah+u4gIX1+wT4iIjIIwYkpE7xzbBftGsfmYggV
X-Gm-Gg: AR+sD10hFCT5EArANzJyNUcMUtzuWL5JGvhik3TOYHFIOxfDM0pf3WF6EF999n05x6G
	a3EMJFFr+2usXma0bLpuLggri9qJ6mBBzO9YKznne3JLkzb0CFJ01EcKX3ICsz9advrUeDsmONC
	hjy4hPVu+kHdyLvx3am8G8e25EcEXMjq0iGhMgqf/+gGCdjLxwwBA2glBsTbaCVQW2i+mUZvZyU
	SZt+2TmWlKYJTO4ucMKT37KbNnVopj5293GzBbZk+OcMV9GQQhIAAoP/aNwUutKOdbiSbV1z1IQ
	V/o2pdHFOnuoncU+UNTkn7Y0PMWeGemMkSL/yLVLjH0byzm9/WWrxnoywy+ts1822VRApq+G28L
	ipSKAtw146H5TVOTfqv5LrLvYjeNxtzm2XuSQxlPBsoFQc+bNcaJtoL4Qs1uqgWKM9tWZ7dAJGH
	sy0lVRSgGrv92lyb/DXa225aQf/XQDS6xcLBf8TuXJYkc5BQH75sWfEtE2VjQUC61KxzXjAUZfr
	FY4yHWh3ZEMgj7/opHNMfzrAXFJD3oPiyJsll15k4DSPczPPCt6ZiJK
X-Received: by 2002:a17:907:72c5:b0:c24:d6f0:1223 with SMTP id a640c23a62f3a-c24d6f20633mr921594766b.12.1787641022759;
        Mon, 24 Aug 2026 23:57:02 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-70-208.net.vodafone.it. [5.90.70.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm613534266b.24.2026.08.24.23.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:57:02 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
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
Subject: [PATCH v4 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Tue, 25 Aug 2026 08:56:52 +0200
Message-ID: <cover.1787586961.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_235705_315552_60DFD6FC 
X-CRM114-Status: GOOD (  13.51  )
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
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  22 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  99 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 382 +++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 635 ++++++++++++++++++
 14 files changed, 1479 insertions(+)
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
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3


