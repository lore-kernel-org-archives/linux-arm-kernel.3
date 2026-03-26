Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F5810A88D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=07/cjURuXrTCYh7didrIz8VeWt0ESapQ65aqs/B2tiM=; b=ICemWgdSc+yNSx3H4QBqXqzpkV
	hncZqlFxOqlgR2eok01zxSfwsw2mGRM2l/c4vG1qRGnL5rvz4tN3Q0IMXqFfBfxp+Y7yGRGJ4Zej/
	Qy4z3QM7r1Nb2YsHYVNKqWaul8qqKqRa+rybXLDyMYiJy9deUGmYLZwqK5wHQ6KA9cTG2dE/bPPGl
	eEi2fW2AHO29f5S3PU+UWr49WskezX+SaAgA49/oH1ZFOV932g64Eu9uTLO2nvtV5lvi63T9XxT5w
	xxm4VWtB360v/M/2jGyTObSNo1fJrUNy72xnR7R/reDf0LijE2OqeIlyhxqZbjXxc1Wje0ifJJ4DH
	lobfhf0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mwg-00000005nM0-1S5I;
	Thu, 26 Mar 2026 15:48:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mwe-00000005nKi-02xw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:48:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-486fb14227cso14069725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774540105; x=1775144905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=07/cjURuXrTCYh7didrIz8VeWt0ESapQ65aqs/B2tiM=;
        b=VMWBX9qlew276h+BhoAanRbx2XkGEgF7gZrpUC/bHL8N0qBn/1KO/LKDeMFGsfuJUM
         4/aSmKRXnYmFUD+kv2MBkjj/zyzQ6DovnxlfWW9ctiRlF72eCq0k9FVsB65DBkIlZgIO
         VKgD/THofgWyQI7/KhYB6AmCRe/0mGnceT0MmyLyoomkbSQcBd4klqhuTUKiElNMhLTv
         ZuF2qyj+HTY/rMxxeoSuJnZqcgVnhV2Cw7oIWo+azCaJrVZKSgxWqdPFOCGN44I2ZRZt
         aXaYv8Y4XM/3wVMrr83NQzowuIQUQ9U5+ynMxHenjkJF4tK4tmq0ewXILrEgAtGpBLNt
         xhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540105; x=1775144905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07/cjURuXrTCYh7didrIz8VeWt0ESapQ65aqs/B2tiM=;
        b=o8T80+cP+OAg/7CF+bQe9lHTT9vgGgeI5f9tkpxsak8GlvdtoWsfXG0chuILlLXNDB
         mOryZVK7UMvoTEP4EUEZ7xwtbc44o7QV4YsB/+K7T5ZTBoMGxwHySQrGppvz2oklxn9G
         lNokGnz36DkPq18qNzZZ5baOoH8ypnfIAQj5pxz9/uFwQPVdwFONCaoHprD0oadOf39E
         gGbzXHctWhfkazJPvWpXN81A1e3EsG0w9VPdvKLIUkU1YSoNRPHrDNcYsJ6FNa4KY6ri
         8TNWd1+8nJewr4DpofRz6VHiz1QPUhqWmUTzdrnKU4kkYXfgNPzdptrwsXA/yNHr76Rb
         AAHg==
X-Forwarded-Encrypted: i=1; AJvYcCXekZs0+OSgBwQk51TUjjyo/HiUea5aynMl9/LqVIISpXNKuJjsQu2vzlkOwOD6djqeQz9p0d6v3zk4gj5eclff@lists.infradead.org
X-Gm-Message-State: AOJu0YwgGnIZxanxWBiq/QlZm5akxWvUpz6fHEDv9HTKrNVLKuiGdYdl
	6wltYoFHZ0sPr5yuXpx/mAQFJ9X6XZFsiGKWUayhqQ9bBK9WtdqcLkS2
X-Gm-Gg: ATEYQzyVmgxR/TjJtfB6ZFX74Hz4G2OfNJqE//7u9E8/nrjTX4ULBaR0hYjJ/IVrpRQ
	jNneF0N1JPzrwdMTSPt4YArHAxeF2yVM/xXGyzrIVZYernLPX+pfr1BWe1ekAmcjRbRroYNfmuv
	DIwe6ZW3SBwtCVSdGS52GIGyhgbLp1WOBO4yrfiowiVURTwpdzS++iOowRs9yHlNAmbTN/0LX0f
	yjmeSME9pLNepMSURZ3y470+XU/K9UGf4UpoADZRD79TZ49nWEfYVJBPidg5TfzVBY9jICnAiVA
	+56ZD6VNfjgjaUoc4cbuJ5iOKOo4JA/FLaQ34kYN0gHDxE4WpVuqx6xG0xUsPOtR8M0ItGQvLqu
	dO4o6ge3ZGkqriuJLim688XyGhRzn9ViYh88S6D5uLGloaKWkBL+OJBE1AABs0LRHzMlsf+inGc
	ZrttYzq8oHPrNyDZ26dcNLuWp76fkbWzYuhLiVhN6Ptf+j89w99P0PbOtZf9qtWuse0l/da0JLE
	C/Hl8GjRFY2tRzVu6aBhTz+QCEFKBP9YdBYvA==
X-Received: by 2002:a05:600c:8489:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-48715fc3925mr119005735e9.4.1774540104995;
        Thu, 26 Mar 2026 08:48:24 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942e52sm8831016f8f.9.2026.03.26.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:48:24 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX93 and Sonata board
Date: Thu, 26 Mar 2026 16:47:16 +0100
Message-ID: <cover.1774539301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_084828_114367_F2046937 
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

This patch series adds support for the Variscite DART-MX93 system on
module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX93
  arm64: dts: imx93-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-var-dart-sonata.dts   | 654 ++++++++++++++++++
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 462 +++++++++++++
 4 files changed, 1123 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi


base-commit: 6c4b48012d57f205c94f25da0c68a4027ea6daf6
-- 
2.47.3


