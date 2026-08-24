Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0469C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/nOah9yaCPBJ9asb8hJhVi9n8xa+eAyGsPGC/JnGbYU=; b=h0lTo8rFqlBso+ScsXbuBqJTRM
	2Psxx4wOuknfV+cWDPC4NxAzDUVstV4IOB1Y1lHey2KVSldh/d4dOxF2+A/gQHw03BWyDVctJA1sK
	diCTzaq+QNaxOq+30x80Zgt8MxcJTSAQQ+/Ytr8qMs1kdYN2DKm3olSkDPKP+AhUbBMK4OMlZKj2S
	IrlAKPoD6w3YkJroPl702v4ZCk9Ws2y1PIKyLUUP9baBGKDiVA0MFKW8IjfLUy3vJ5amLOsao09Q9
	PCG43+IJGkCSDCJTmRZxLpNi6H/lw/hyB18AMwjg6A9pE46ehunr5L/bQKV3c9p7wNGl5Ni4v47fa
	Ozwxcggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWHz-0000000Grxn-1qDr;
	Mon, 24 Aug 2026 15:08:43 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWHx-0000000Grws-1zCZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:08:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c2022323c37so566195166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787584119; x=1788188919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nOah9yaCPBJ9asb8hJhVi9n8xa+eAyGsPGC/JnGbYU=;
        b=b42O4XMWdn7pTdV1izXkX1Ix6FIA2cuwWyQ2Apv9IkJxjPWnlw5X74hotg3BsDVwaX
         IIcEczksK1Q82po8tmqwVbaiZBBo+wGP3C/UnotLBlTZa26QFkiDBELLxs067nLeAEfV
         12yqbwB2Vw9gUcxQsOEpupl3G+mqjRdbss5rhUJJaLzFNnC1gzgrI/2J7V5R47+s79Ma
         JRsEEe/myA6ktcxP+mNv8Aza43nWsMuy0kWhYiSK1Px0Z4512AD67Ba3e+eS8OW5EMf4
         rOVifJIk+vUmbfrKLUzXqWD9cCBMgT1LA9tIqs7lXMFSzUenqk98SK/d5HH+n8Q2Ern7
         QmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584119; x=1788188919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nOah9yaCPBJ9asb8hJhVi9n8xa+eAyGsPGC/JnGbYU=;
        b=STGiGOdl/IXhDpj+lQyuIrFjlfbYtq31ivAzTdwQLH0DNfCgCR2CFSwMw0sJPWlvrm
         WrakgEcI6q5m1w9ioaFXgQFP2A03nO82dFGyabnhftxuichleXjBuL58G20M8d/K/X3I
         K3KbT/pcOM+kpnjnlAYzu8HV0lBo/SW9/ILldEEi1/CTO8EO6h4m5eEl52YoZEdxC/yz
         xD8tK8+f6U0vexYzQqQL9buiMNWXdLXWkYoMSdr28pzAfN2Z9embb0NHvM6PQ37i8Ujq
         uf8ljnBzS7yJwT//WZIqPSTu6+Mzv0AvotZGDV/9Ac1s3RIl2/GEXLxKwbE8EkoEhwbF
         ZYvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8qRRlp8w6phm/zBrns6APG97V93vV5HLkVHYrwlRea/gimpAfpVcLxcOc6mMkS51p629Znbk+8yWGbb//Zjw2@lists.infradead.org
X-Gm-Message-State: AFuF++kw6EzZ43eBx8FUyudwAUq1caklKk+XGJqw+CK+vSG7iE4AoPLR
	O+pbSiEG7CO8KXija1Iqqy3DUn6tqdx95vy4/gm6uohSbiVR6qyBZfEH
X-Gm-Gg: AR+sD10a6anx26AFE2KS2Wr0gLqp5iWw9bbV/TUKJSlv09ENmGqxhBf/umrAr/8+64R
	BKtqGLek4I3TwnR957dQGyhWvk0CTBXxs0hIqEB4VGH3vJk1z3cHYUWCbpoDsMzMo4pQkeGpBhv
	QdHGcbkGr7OEgoxWLRl0T5ejoV/N2Nz4sAcD/1TxJSJDvBB3QtpcjgrQX9aQ1dpuDxY0ATfGpGK
	BQfE4nCxF289W+7z8Y2L45jeOEVnZFxQWf2rQctefQVX3YrZgR/rTJCYMTwFk+mwNQMujiGwb0J
	piYFL+jgqEBX0jAqEmjKuFMu4+ibhhF3yrME4R7NvbV4BrBw5Jm3tiv8AAG3IXQFETlUHbK7hHc
	LQJftHE5KHdXP2et3/CZkcSrxyhSHoPqvfgYG6rNy9dCiA4VjkBQIRANk0B5NA5nffcYa5FPDKx
	MPWk5cRQ6RA7UYLLXwwvrw4Pu9E9l1V2qY+uQCTUpnTA/M4aRKvCykAG6bR1Ioe4FY1vfM6MZ40
	To02+G9KZ8tsPJJfD+RiJvBSw==
X-Received: by 2002:a17:906:2083:b0:c24:b11a:46fc with SMTP id a640c23a62f3a-c24b11a4996mr1066420866b.22.1787584119253;
        Mon, 24 Aug 2026 08:08:39 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496297189sm1273530066b.22.2026.08.24.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:08:38 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Mon, 24 Aug 2026 17:08:27 +0200
Message-ID: <cover.1787583584.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_080841_562762_E1C04072 
X-CRM114-Status: GOOD (  13.37  )
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


