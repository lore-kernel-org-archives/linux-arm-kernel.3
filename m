Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1C5C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+yd0OdHrM2Itm96/YuqXehoTn8EREnI2dfLKcvCeLuM=; b=sBcQ4q5LikLxp0LAXd2XFoaCYo
	1dTNQaQc8GJJI7qIo0Ex5rdOqtkj06Xj8UYj8Q4gdFgGlz+iRyaIAgMpTDU/RSqSzxPwCCawRjR6+
	V3wiTjWR6E87qnOjDAC+FzLKHJOA46nB6bRW6F0c/tOmIIBzS7e6KHPgFCdP2fCXD5thNlwOt0w8q
	+Jf5HRabA4nitQVzjw1huDrqxfTEWierYj2aHvlUL6RvY6EQfymZOhtGnzgpW1kIDYV0yQcLcqfXA
	MsDQy4Vbow8wtLqupTtcZX1jvJH7BMBtEQz9OjJm5BGYvDf3Ql7618iIvWybaASWDjbOrxsF1gDsm
	tVpALrKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZ6X-0000000FJCM-3JcM;
	Thu, 29 May 2025 08:59:13 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKYgJ-0000000FG5K-3ZPM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 08:32:08 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ad574992fcaso111949566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748507526; x=1749112326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+yd0OdHrM2Itm96/YuqXehoTn8EREnI2dfLKcvCeLuM=;
        b=LJaUzltK1cwAWlS5IAc821l1wZYlQ2ERK4837jP4l1KvmfOONccKbrm/43I17/HG1f
         nrjViTBxRpYdD6IVoYTh6Y5k1vYqp64ctYihPey/19b2s/8JtXXc6DZ3HrUp7alY6ZJu
         cNJWCCPygvrqeS/LYBVjmaQenMp5hD9WDCT5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748507526; x=1749112326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yd0OdHrM2Itm96/YuqXehoTn8EREnI2dfLKcvCeLuM=;
        b=BfZDEOko9yqtCK2OUOqowa5qqUFyZsXufvWdU1AP9Lo2nyFrTf/iSZZitSa6p+Zp5O
         Hb60JdsrN+8J/mchUnEuSv3UWm1Er7tjN4iFxSuwefzdtMNYGlBO4hJoOdYqb9hVzxLu
         2zXMl6KNXVqVwB3JhDCgFbYXHYDxHMredWzUtP4mNzV5C7Yqw69qP1ymq8mNmBVGsTHn
         OWFeUbVtSVu1YUR+3mrV8Qzfa5qGEa8D5vV5Z3Tb4CpujOq3L3SaC+kTijMfQmF1s0/O
         caWqJvhr9ablsu1h15ORpcg2n9lZRZ3b7/+0QZCG8aUd2iwmXGjmHMp9Vjgmt4stTjle
         LvuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDSWI6v2jYtsOmCIUzVNDkakCF8qZ4S69Ffx8Tg71EcKX2rp3yXujaUzUQPEWQc/uY5pbC/dKoS4cxsg4xgcWX@lists.infradead.org
X-Gm-Message-State: AOJu0YzAs8vbJG6NSjXGFnkFnbQGOSoklh95QnyByKzcvTB1U2MUu11y
	tQMNzn0jvMVkBsiw19o8jZO6OaowzbCau5bxTudx6o+ux4KtMputv8nnivX+S99Jp2o=
X-Gm-Gg: ASbGncv78afoSi4kMDuyKnyoS7iIkkOselpOch+1898lTUlZWDhswvq2Oy7vwb2SxjW
	m0D5Ru3flyuPY3JdEIH6dZZaYGMyEvpQ1TaY7r5r8hTRQRG7syzg+YpUuRrj11WSlWpleFOi2TF
	nfs9rnbyChLv5IInAKN/CrDTo8mucL7okkK1ZoPPl2YBGRqqjAyxNeuA1TzL0u6jdSJQjDioQ9y
	W07KpEIahz0K7LaJ7OdIyhaIjndVQOa54Y/xTS2AdmmchV5ruK3/l95hNBzVSH+oBxv4RpGOcPD
	XgFaFwOhs5G5b1kq42GGAePhrIUfQRsSNgn1adeZZXgKvw7qZsq7zcyKWLGjjajWJ1S1+3hdqUI
	lQCLxp6ZSRUAl4BaY
X-Google-Smtp-Source: AGHT+IHJPmyMvrXWwF+oJ+y1YEj0csZRYNNz7OEbL3/Z3gW/L6Zao3qlTysBk8RNZogBxgTqOB++Gw==
X-Received: by 2002:a17:907:9611:b0:adb:1b2b:fe1c with SMTP id a640c23a62f3a-adb1b2c0f71mr86246766b.2.1748507526094;
        Thu, 29 May 2025 01:32:06 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e87esm100609866b.63.2025.05.29.01.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 01:32:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] Support i.MX28 Amarula rmm board
Date: Thu, 29 May 2025 10:31:03 +0200
Message-ID: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_013207_902553_30FD6B49 
X-CRM114-Status: GOOD (  12.13  )
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

Dario Binacchi (4):
  dt-bindings: mfd: convert mxs-lradc bindings to json-schema
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ---
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 106 ++++++
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 303 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 6 files changed, 421 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 2d1e9b3978bc041336f1bf6c611fbbf435a297f5
branch: imx28-amarula-rmm

