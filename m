Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1537EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xn1CB+ZLcGxV8ZFV2HSZz3RsXenQLkjSfas4c7S2PdU=; b=yU4IRwsfcrmgQ57mipmw/tJs3b
	lOx9Vj24Z579l4jSrCpwOAVHOSan8dXI8+P1pZrBE1aNIuKrjcoRAtl9I8Sx3tPC6UEFi50OrDGGC
	uITxS9vCKbvAJzIeULalgi4g2dggGtjzkNnm0YwhUg+Nt0jIbaqGBfCybd2TS1y2Cs6ymdVQEetTB
	hnY9ApzNi/0PO2k4PzwXWtcCtK7c6FVJCbMKPPKN6cZD8pIksBU1nBcYMeB03ipB5vjHRI8wD0PTE
	btw8DJbSYkKETFxaViCqMsQgGMGIVejdKKkYb0oJL5ru1K7QyhiYJ7QbMsohpYJuVlJ5O+eNFeYNF
	C8exuwow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNpyA-00000001Ufm-2ZWv;
	Sat, 07 Jun 2025 09:36:06 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNpvw-00000001UDy-3ugh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 09:33:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-60768e108baso2977606a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 02:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288827; x=1749893627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xn1CB+ZLcGxV8ZFV2HSZz3RsXenQLkjSfas4c7S2PdU=;
        b=dCi3Gx1/s1y9jRhPa72FzCLhteILFdodab2zt5dUetk/SvMiaOME6yXVI3PrBrtnZx
         ZYh0+xGuRyU9SHh526o+IdYeg8TdrFsFxPxYZEds4vqrMcZz2cgyyG8s4o59isHTJ75E
         4nIWa7NEt0T8WDx1RAVBi4nmzBo9mf+Tyvo9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288827; x=1749893627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xn1CB+ZLcGxV8ZFV2HSZz3RsXenQLkjSfas4c7S2PdU=;
        b=xTaI9+SPYZGK4p9AjoYaXc18ZjIQtWgoDLQPhzxKuXS4Gnz3PlmismSyFjMCSbqW/l
         WgSPFyWG5IP/PAyya6RZr32s68E6lt2BuZayPVj20mIrh4LHqu73q2xaD5+OAjPTh6uJ
         Q2PYwsy8DbcL+o2a4wpWx42YMaBcrMy9R55nCbLc9WF5cHc4eBO1QEfEDyH6qHrpJLMl
         +a5+kPd720trQHp3jaOR6zemEu8miHyG3zESy95w6+Wfu2DfKinLxEiZOhc/v5wuODof
         u5i4sm3b/9xgaUBPYCbVIli7b5c+VKuptvq3/v5L8vTi+eJhS2YFjBXC0KNvHTVsFhzk
         xxDA==
X-Forwarded-Encrypted: i=1; AJvYcCVfDV69vObZiZlKGYGFntbbmNlXaGhzASpjj5ahHQetR5WGDrQrnnQ4eW8Kl+N6nU7QODteylcSn2ZUl5tXEOdh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe1BlwP3S6BPdj5K2BTD56HgYRCIy7oUmUA2zTOsL34iQ0kI7b
	O28qrVjqAP4gy7Y85jXle7z0p7zeV9ENTqBFpZIpB6Qx1X4vyFAiCQBM2JuoNkw9npw=
X-Gm-Gg: ASbGncu3gconEyv/m76IgbL9Ef8gLUZGnzfNAEaiq/V5vJ1uFHQ4hfwEDyBTI6pFJjw
	LCqIAwvtLJxU5IiuQEDCZ2G+QjrHjg0fI2+W1PIpSs6IlVSmLP1pdtLEDJUYOotks9kC1O5BCb1
	iqqGBr+Co6NSAOKqtGkBLCuN2YKGhaXyY7clQONxMTLLaMZnOl5C5PiekuFcLRzYNFkScoYoanY
	/dkvVfPR2gLDHtZcRQX4hDT7DpEesQfBRsIKoHrjdfdX7Xqtx5svKk3++YfR5nnBXIv39AFG8Yh
	IiXVs9kztsblINtuTLE15FaAne6UCFoLXBTkYorHooiWpozdBPYY2viWJgFqX1DzvSmyPfIbiAC
	jIgkbkQng/yd2H7QSeMYfDzzd6oN863cMn/4w4HtGIZObs0+J/ZvzfpwpLKwiVgo/e0gKZrKFFq
	EOnsQmMnNSx732
X-Google-Smtp-Source: AGHT+IFSjDnmW2EWNA+L7rjZYf/CeSyJkQ7tNtchDLVj5RAdGtBJa7XPtmYoEbrLf4khxRuwgaXdPQ==
X-Received: by 2002:a17:907:9491:b0:ad5:42bd:dfab with SMTP id a640c23a62f3a-ade1aa8db96mr547985866b.30.1749288826712;
        Sat, 07 Jun 2025 02:33:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/10] Support Engicam MicroGEA boards
Date: Sat,  7 Jun 2025 11:33:12 +0200
Message-ID: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_023348_985256_2F8F653F 
X-CRM114-Status: GOOD (  10.17  )
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

The series adds support for Engicam MicroGEA boards:

- BMM
- RMM
- GTW

based on MicroGEA-MX6UL SoM.


Dario Binacchi (10):
  dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
  ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
  ARM: dts: imx6ul: support Engicam MicroGEA BMM board
  ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
  ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
  dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
  ARM: dts: imx6ul: support Engicam MicroGEA RMM board
  dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
  ARM: dts: imx6ul: support Engicam MicroGEA GTW board
  ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

 .../devicetree/bindings/arm/fsl.yaml          |   9 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 306 +++++++++++++++
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 164 ++++++++
 .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 362 ++++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  96 +++++
 arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
 7 files changed, 946 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

-- 
2.43.0

base-commit: bdc7f8c5adad50dad2ec762e317f8b212f5782ac
branch: imx6ull-engicam-microgea

