Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529FFC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OL5RYRK2xW8zpfGNlxCIqPA3FpSRk6s+VzdpwCEyABE=; b=3kDAzZplRRH+MBE+5jrwWKhaRE
	Ycxz4lETYBQBTl98/2hOAnrv4D68CPCQd3ChzIaKFPwI9g5cuADj4fNCGffZS0OVZJsiYZE4xRuEE
	G+jknWsAcipWNdVnlU1AbAzftF3Uxk5sjI4n5ia0VNLuyJCsNvRwFO34M5xV2Thl0P5OmUphGPjvq
	z4+bZHsB8FwRU4awgWcThkiCrvbre/LG1uwKYQaa8QLTLWVvMdL1hgjy3Gbs97XhsqPAi8wHnZ2X1
	J+YdMrlrAx7ewqJLuPN++8+pz2o1/Cni6MXPeKLbB5AivDvHl/Fv7u9C2UJux6b4nkrVxQmdKoMuk
	dvbWfr+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXX9-0000000F89X-2QXc;
	Fri, 20 Jun 2025 08:55:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSX65-0000000F3Oo-2jnU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:27:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-450cf214200so14825615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 01:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408060; x=1751012860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OL5RYRK2xW8zpfGNlxCIqPA3FpSRk6s+VzdpwCEyABE=;
        b=Q6u18Byz1f10M2i8pmK8HnbU2Aw0lgeu8O8iV9CTZ+OEVCrW2qNSUKVP2W/bBi5JW7
         Sio22y/bgidHrQOqCAUPObbnrbd/M0+IK0UakvyhxtByK83uQdpgwctbFvyCc9whnaUG
         oEPokg4SS26xu6LJhUVNZk3FFhcmp5UD3UfM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408060; x=1751012860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OL5RYRK2xW8zpfGNlxCIqPA3FpSRk6s+VzdpwCEyABE=;
        b=mZ6NpzYgbq6LOUVS8t0UO7zQBCgqVY/Ao1ISzs5z196Sl0oBaf3xyUxp5uXDejzEsz
         Ed+gGfdm6xKSpkuBO32FKrbS38Mtj8qiWlTaH1YkE12zVxjruKmVI0v31THB67k5m+NC
         VFVU55L7vPy5QYGm4MOJ1NdwHqHAXA/wIqDbvZmEMh6jAlp5mPIgdd+awUil7JvxFF0C
         qwiQLPb1ApZWnAex5xBLNSJkjkJk1BdErICaZ4KyIQS60Ob6v7VDrTLMYS62oXdFGjV9
         cVF3thXD0LujPaSw8U9QLJ3gbHOWwAk5RYqt/zll2irzvZD1jeo/A8UBBCQvpphJQkvb
         9kSw==
X-Forwarded-Encrypted: i=1; AJvYcCVgt32qrnkeFzjwKqWV5ikM7MZnmXh1GI7gObISSnERu5UWXAxUQzUbBY7MSSvvovRQBypMLsjbzCv7dPXbcQfL@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ1M+jIiThfBh6mLDAFZrbluq2pmDeN7zE+K7Et9YR87EXdQNl
	6Xx8Q0smGXVZBPQ8aQwdJBzkkLQLCOZMsIyR4rcJHs4LGfE/SgN87t974IjgWPpY6HE=
X-Gm-Gg: ASbGncs3r6EY2YPjiJf22pD9C6lDI9La9e6y1Q9ZSzFSOuKxG03/NennJY2/SMEAxQF
	dJJonzlqDBcl156nRmsq76HXhAZBU3UQ+FmKY+gslMYSnYvYzfVH3EdYqIXPsz0xfPUi9G02nPF
	JyllJ/i3JsOOUCdtUSbrwuwjUEtF/NGVx8Qz29AwMN1QksEiBvGQzcq9rJ/kABLhOOTCFovBRDy
	B7SYcH6EYXNOgU2qCEdf4XgHcjCpCD4ToI2ChlPG1K9TSsy4O0qwne8R8GAprqMmPpwGYmK4DNp
	FDmCy7r23LsawS4MkBUReve2Wvz+xUB0b0oje9hTU5nGjY4qRyi0gqXjg9ys64Vd/AFD8BdG76Q
	H0qnJVldZqCTpZV0hR3sVReNHS92TZLjguoDhGzu5OL/LmY2RzFhE
X-Google-Smtp-Source: AGHT+IGsnvq3aPtcZJNsLrMJuMg3R1s04T36bsYu97E9L1l5W6bV0L0RgKZbLxc2RjE75y0x1FOIIg==
X-Received: by 2002:a05:600c:4e8a:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-453659ca684mr17891535e9.9.1750408060027;
        Fri, 20 Jun 2025 01:27:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
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
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v4 00/10] Support Engicam MicroGEA boards
Date: Fri, 20 Jun 2025 10:27:04 +0200
Message-ID: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_012741_698498_A24099F8 
X-CRM114-Status: GOOD (  12.75  )
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

Changes in v4:
- Fix commit title. It was referring to a wrong configuration

Changes in v3:
- Drop an extra blank line from the iomuxc node.
- Rename sgtl5000 node to audio-codec.
- Move the reg property of the audio-codec node right
  after the compatible property.
- Drop an extra blank line from iomuxc and iomuxc_snvs nodes.
- Rename sgtl5000 node to audio-codec.
- Move the reg property of the audio-codec node right
  after the compatible property.
- Drop an extra blank line from iomuxc and iomuxc_snvs nodes.
- Drop an extra blank line from the iomuxc node.

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
- Drop an extra blank line
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.

Dario Binacchi (10):
  dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
  ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
  ARM: dts: imx6ul: support Engicam MicroGEA BMM board
  ARM: imx_v6_v7_defconfig: cleanup with savedefconfig
  ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
  dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
  ARM: dts: imx6ul: support Engicam MicroGEA RMM board
  dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
  ARM: dts: imx6ul: support Engicam MicroGEA GTW board
  ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

 .../devicetree/bindings/arm/fsl.yaml          |   9 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 303 +++++++++++++++
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 162 ++++++++
 .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 360 ++++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  95 +++++
 arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
 7 files changed, 938 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 75f5f23f8787c5e184fcb2fbcd02d8e9317dc5e7
branch: imx6ull-engicam-microgea

