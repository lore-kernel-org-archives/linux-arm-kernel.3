Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6128C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hzYO3WM+V9HIufyqv0Dcv1pFHm97P39m0ar0LDGky6I=; b=mKcyZbl4ldT4aoPdYiZE2f4+UR
	x88Hv+F6225j1eDrm7cTsMN4t+wqYiqPyEvL+KzPu8mKWPRqtldUqgrMCo5zu6qjUJc9a+ORezQRM
	Xixf9qz9EXMjaQ4NuvL/auCxYnXLR2pg2H65nIwm/JtfQ+ABHrcCOZN74ZTpNGsqb2SNBjPZM+ZMP
	v3VFwTH0bz3poFYscX+0Ti4le7Wj/ca/cg8Quhc6uPqjHSJhr4+jOBQ1gy/ejIGhcgvvPjrpTklDB
	X1vmU1M6Xz6JdPLxUKXADrCcQEhtB1wNMFqHxvWzHcNa8gnhGdKjj21r/ujKA1VwiK+qnRBu3YVaR
	8wI0mdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKf5o-0000000G3dm-0sKZ;
	Thu, 29 May 2025 15:22:52 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeML-0000000FyzD-3htG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:35:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac34257295dso175299466b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529352; x=1749134152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzYO3WM+V9HIufyqv0Dcv1pFHm97P39m0ar0LDGky6I=;
        b=Pm5bmsnvngQ3cuL2CnDi8FHa2PjwY7xgpQO5LGQ2ftLh+GkwbRjiIMRjp43iauIihL
         A5NMnfFexQq5JPgh9Y3RRcjZyRo3FFw2kxMXsTHtrJGdV+WjVWkXCS52OgLONRk8aMCO
         AJIOZHu+vh0C0+NQ1nwxYit/VQm3xJEExklJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529352; x=1749134152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzYO3WM+V9HIufyqv0Dcv1pFHm97P39m0ar0LDGky6I=;
        b=RWQBxIN/s4sJX3abaeN/0cEI5gaEDVGDnnkxjuEh11LFHeimQSUKtrawoddhynp75d
         b4nl4S8PHWXpHjPUE64gGXqBd406JoMLNhNBwOw+9ix7axT3Qa5O4Xg5zbSsEkVPaJQ5
         PpmRc2ZRulNoEhORP/pwGlx5fd/reywhUWOgd5smoMKzKrs2aqSwtgAi4wdRO3H4MOpM
         EmQDrVDaxc+BmY1YWUda8M6C4M3JxvoUk5yN7oAglMePw3RQF607fFWX0Y9viWhdTzOs
         904JuNNIHTv6OT/5z63eoO5D2AATrX6jshlYnXgevCb8loCFUDuVR/JowM5NX5Yb9MYg
         vtQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR6fmaSOEyPgF32C2h82nPdtDMZZI+8FfFtt9uQLwD7ndS7/iRedagaqkEx6GYtiCLdpBoWJPU3eWAl/rqo8G5@lists.infradead.org
X-Gm-Message-State: AOJu0YyJev5LDsoWRse/XMl8pDgWOixmB3G6pPjRZo/MbHYLyC9JsFy/
	n1DT5oDVVNGNooK9bwi7UFzaA3ydwC7YcoF1yJ/XmNCSB1FgfE1JPv07qtyEDrMNyj4=
X-Gm-Gg: ASbGncvvZ/akusVCXJ7ukj/d9bV1klDU1hYunDwE1WISKjzHe5rDuZRFuDK5mjm1u1u
	hyLKNYmW/UF0CZvSaXd4szjVz0SwL8+j1OTcoeZaZQ3o9cWRIkzG/gsV/+7Hj6zz6niqhoTbdg/
	4jFBOW6Wgx96XUBh4RM41aQabcc1vo5gNkpp2Ndarl6X/MoochKNVoaSU9CGJG7KLXjKUWI2bbg
	sFWtUTHGu8adqQXxAmrMt/Q75qgceDisxGHimKg8sqj5mUsTTrGPXDTyXFTFgCh6jYyyBofrTVy
	uaPYAy16v+OXZ8fYZXP4ZONMcQTuzCypUcQQsR74Nyaa2dWzZrwQfcmV+9HtSqvgsLuTCm5cza1
	fyiTgTSbCHfvKpoxz
X-Google-Smtp-Source: AGHT+IGERChiFGE/d/VgaSjB/fBHCcIx46SIOubK/5eXYgYTFXXviLMgUfe7m+xgS8A7iYuziAf9Ew==
X-Received: by 2002:a17:907:944b:b0:adb:1b2b:fe27 with SMTP id a640c23a62f3a-adb1b2c0fe2mr217561966b.36.1748529352037;
        Thu, 29 May 2025 07:35:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:35:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Marek Vasut <marex@denx.de>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/6] Support i.MX28 Amarula rmm board
Date: Thu, 29 May 2025 16:35:07 +0200
Message-ID: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_073553_941629_90DC511A 
X-CRM114-Status: GOOD (  13.96  )
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

Dario Binacchi (6):
  dt-bindings: mfd: convert mxs-lradc bindings to json-schema
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board
  ARM: mxs_defconfig: Cleanup mxs_defconfig
  ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ---
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 131 ++++++++
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 301 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 arch/arm/configs/mxs_defconfig                |  14 +-
 7 files changed, 447 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 2d1e9b3978bc041336f1bf6c611fbbf435a297f5
branch: imx28-amarula-rmm

