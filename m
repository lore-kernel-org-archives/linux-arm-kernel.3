Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCA3C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w2eNUIeZ5UwiRp6oWlkiO1U+c9h/DGgR+XfrLwmwISU=; b=gi7PVbz4r0moBKt4Mvz1Riiih3
	B8BfshQ2p74QU3NxH3mz8FW5E8h42I8RThgpxU3h0/Q74PQ7cnqyMtXfrp9T9b8TentYWEd9o+lq2
	UF71tcF6aZkD9NL+Tp8kFHyFpI50k4w/MHnCr0l6kVJOSaM6jgPJ9zvNqHRor5Q3KpVjRT1wPoEv1
	Vm2JocV9679M3sOdRoLAy6fEajMJaiRQ+HiUGd0SDU2PPr/1DdaKasTAp/9R1/dMgX0MECtDXaYsJ
	nLshaGZI82U01KzW5hcsrFAgnvBQFXrm/dBZQvxNUNkFZJahccjzZzckVw8483EvXuyXwsoAY4kPr
	4aOrpOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWsy-0000000F1ez-17Br;
	Fri, 20 Jun 2025 08:14:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWlc-0000000F0BH-37DF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:06:34 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451d3f72391so14772495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406791; x=1751011591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2eNUIeZ5UwiRp6oWlkiO1U+c9h/DGgR+XfrLwmwISU=;
        b=XWAwWo58guKfObg0ItXMLovKlV2uAfm3VrgL+Do3LEviVpKu+c1GTRkS6wOgDlyaeT
         Q4Cu5OpwiAKzbSbqAnYYerVW3egSlzzKD3gXVmiISdYcaTCAYiP7elzpEyTcyJs0gZOO
         GwprzT4tLyO6XMmCDHC9j+bPX61ZUNaLPK0MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406791; x=1751011591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2eNUIeZ5UwiRp6oWlkiO1U+c9h/DGgR+XfrLwmwISU=;
        b=gILiu10k46IdhhYLdn29GEcn+MKdRDHaEn5SilR5/9sGnov4ms1q1lHTWlnlgqN6Eo
         Mtmv0rbP49tDg9JUsCxau/A0+Vn4nMTF+KVHpiG5MVmQKj0rura7D632lUMIau5IbWoA
         uBua6nGJTOZMzDwtpLqorg+EvqfXYELtY2qzVlEzRl1+bD8e6tpDx5BiTMWEKy6ACSGK
         n6869qdS4/SWfTOYP2QAfKlshDM1Zm4bu35H+xL55LkAMJ44f97Nb0aVt9H50kLyiLfN
         IoWSLwL2w+iPOmGA6ruIKDFScLrHG6VYTgc2Il4TfWf/3LwBz1bDVl5dtxlFHW9mwPA0
         uvwA==
X-Forwarded-Encrypted: i=1; AJvYcCUZbVULWP9oz417Fn0icLPRcsiT8Wh78nF7nMKoTpV4RZiLWk0VBDCIu++GczSeFQGmQJvwiRNRdaVXm+WDRCxe@lists.infradead.org
X-Gm-Message-State: AOJu0YyJYLWi6ciTGYvGYClzUzAJs820E8gEwB4AcKWwWa1luAG0nvJn
	RgK4KQ39OsJiluCYvLzncHhS+ctkGMxSEuyN+4rhIVtLVjTdzVKGAxHUKHTgnTKMYms=
X-Gm-Gg: ASbGncuP0jWW6sIoOf/6yaQLUcB8niQt8Y5Cs0S2xkD+citV2V/fVvC3ipHAOas21bo
	cVhw1ZCu0Hwrz7EXMqpVu3YC4campGV5ZiECdJX7PtBHq3vfbU+A5lf3glygtQdOf5O+r6HkkP/
	Shn6nWJhubQ7IZxzMQyLZrOP5D/4zcXeMIL/KpUHCBMZ+iz+b5kaAz2jFSmar4VbI0wH550Ipml
	neUnoGRl7m1uX0bm97gTiDvcP3IXtqK4Y2kiWcTwtt1HE+nwMTv3X7CAhSXjdCYf7a2gtClZ5vD
	wp2BV3d76e2Ztv+gEyREoXCIZBjmJ5iLebVlUpJ4UBzah6vUFgJj6qQX4kQiVf7Ysm/A9Uq0+CZ
	OCNUGQIrP5QmeolUrTW5d1t+k5AawtTlSRvlnr4cDp6X/XiCWZMbP
X-Google-Smtp-Source: AGHT+IGex2m7oBS93TBsbAaINT6CSOEuBu1mC17t+mWbAEvl99cHeitnaXtcBxitr8TCel6t0Kgqvw==
X-Received: by 2002:a05:600c:4fc1:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-453659c4832mr14575205e9.6.1750406790643;
        Fri, 20 Jun 2025 01:06:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/5] Support i.MX28 Amarula rmm board
Date: Fri, 20 Jun 2025 10:06:16 +0200
Message-ID: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_010632_807643_8200DDC7 
X-CRM114-Status: GOOD (  12.99  )
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

The series adds support for i.MX28 Amarula rmm board.

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 128 Mbytes DRAM DDR2
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Changes in v6:
- Drop [PATCH v5 1/6] "dt-bindings: mfd: convert mxs-lradc bindings
  to json-schema" because applied by Lee Jones.

Changes in v5:
- In mxs-lradc.txt:
  - Fix deacription formating
- In imx28-amarula-rmm.dts:
  - Drop #address-cells from gpmi node

Changes in v4:
- In mxs-lradc.txt:
  - Fix typo Low-Resoulution -> Low-Resolution'
  - Wrap lines at 80 char.
  - Drop '|' from the description
  - Describe what each interrupt is for.
  - Move touchscreen-wires constraint for imx28 to the top level
- In imx28-amarula-rmm.dts:
  - Drop label property (deprecated) under the leds sub-nodes.
  - Add microSD comment above the ssp0 node.
- Add patch 5/6 "ARM: mxs_defconfig: Cleanup mxs_defconfig"
- Add patch 6/6 "ARM: mxs_defconfig: select new drivers used by
  imx28-amarula-rmm"

Changes in v3:
- In imx28-amarula-rmm.dts:
  - Drop xceiver-supply property from can0 node.
  - Rearrange the order of specific nodes and properties
    alphabetically.

Changes in v2:
- In imx28-amarula-rmm.dts:
  - Replace '-' with '@' for the pinctrl sub-nodes.
  - Replace edt,edt-ft5x06 with edt,edt-ft5306.
  - Drop LCD reset hog pin.
  - Add correct #address-cells and #size-cells to gpmi node.
  - Replace edt-ft5x06@38 with touchscreen@38.
- Drop from commit messages all references to LCD display.
- Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
  json-schema".

Dario Binacchi (5):
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board
  ARM: mxs_defconfig: Cleanup mxs_defconfig
  ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 300 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 arch/arm/configs/mxs_defconfig                |  14 +-
 5 files changed, 315 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: fb5103df1b24f6cf8bdb333b24bbdf45d4186b0e
branch: imx28-amarula-rmm

