Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014B3CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jpy6WCoUNG/EhEMu1+5xb7+kdwt7VzLT4ekirmQQcVQ=; b=Raco8Q1ju0j6ReEds8nMnpzUoL
	kEn4VIJiy2molxZ+UrkSgUHy1okjjtrw/xwR/BMAWEGFY0eW2S3QoPBvO7+CA/FKUSATd4E+VvfyL
	UqaOxeQlnFKr3KG6J0GSeBc3JeCKPTfxTRRZh9/ALffLWA5K7E3gOk+i4WhjiwlGg3Kar/FCNIRqw
	dnDsqAohBuHH1haYdKYKyzNQJvbWBer3GziExJQRsIlqgARl2Rw+LbrsqdzJVzK6YrcKaSLCov3wW
	gjNxI18kdIJ5cR9C2APoxgAI2o4aey80/OynicX+imVMUqZ1AinnS/g+R2vrnr+I7ryGliDWzUq20
	ToV/b2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWjW-00000003FT0-3FDA;
	Mon, 08 Jun 2026 09:57:26 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWjT-00000003FRn-2es8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:57:24 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-460166910e6so2055907f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780912642; x=1781517442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpy6WCoUNG/EhEMu1+5xb7+kdwt7VzLT4ekirmQQcVQ=;
        b=QqqUIw7d1MisASaDily7JngqojZbyQaF49sJLjQnRS4TB3KUtjUoThlOMOtEqzwrmN
         miiOPzYvu8a+G9PCqnEqOkTPUyHIdjFl/wbmOMfIsCDhVwRf58DvfZIfMKkYRE2r8caI
         Xy7AOKd0jYx9vZBsi5mQvjFXWUrYOMIO7UCiLRvm4uVo9CRPy9RIQcZOzw2Jauf5Qjkf
         ZLX46Vk0po7lLgkj2l5LEcJW+qk7rEPi2WT0Q7FgDeay0GFGb/MQGn2+uSqV894tyB84
         UUcNEjAKgEYzhhAOO3c0M2eIWID/m7ZQEWXu+IYNNj4Oz4+t8/sXc58W28Oa5Bw5GgHb
         LsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912642; x=1781517442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpy6WCoUNG/EhEMu1+5xb7+kdwt7VzLT4ekirmQQcVQ=;
        b=TM/j+FmevvIYdQFnqhn4gD4lfOuEH/uAHy2wlAWumeacbEmlmpRoAJUcLIaIU2shYg
         JWwxc2yKGHXL4lNTw26pBkYlvT0jZvXBT7rixLY1ueAolxIpOJrOZWxjzJ5DqzXBdUoE
         0MnjsIa+roIH1etw+5l9BxaM0VfdSem1HdAatA7hiZG/AnNvUf+0zG0ki4DCSdgme2G5
         WLsy7CRWF5ql6t9qbnIQCfbmxdA+19kR0iF2gqDBgXqTfVXmTus361DpzSYWvvUbqJTe
         Eg9tl1M5RTmL9VaWyriiwXph/+YRaz8okcaTHm3WmCjfwtv7pW5tVX46VNNtVepA4TkY
         wzJg==
X-Forwarded-Encrypted: i=1; AFNElJ9fdIvAWHbMw4PNOnInXb11haEWL1KWMY619ot7+F+YZJclp3xqntnhAFrDuo91IdcXeGVYmt/An/pe1Tda3vEt@lists.infradead.org
X-Gm-Message-State: AOJu0YxpvqhXexrrvocbFgsp6RGe8VQpkeTlKkhjvm7W+pdol5PtH8SF
	DccnE7Ugzw7rAn0wYvEcqM+ZR6Y+5ELULj6TrhZhybizSCriwPtkSTV7
X-Gm-Gg: Acq92OF3GM4VSM0F3V1QBaRem6VsuBlkSl6vgCUWdcB4rXr33Cq1b2nzSGQM5PMZItF
	HifuSPmx8TSzqSkI7rBQuTKTcseN8ggAzN9yuEc023BpYWj6JdGZdaUzKDiOOqrrYcX34FvMD3N
	6YOY2iEcPvclAkluslfTuZhntEScBJY/heWSl2AAdK+V3KpEIA+R0Ko9Szr51PwqJg+6eOSFuK8
	1Ir7kb1CfXBAL3HbYDWWLBZ5bxgApN2OHTLzmR7qFHerK+qQZPE9PiTyBFPL96GyJ6nUvhhCvkE
	4Lsl84vC9joueMTvyqCW34qMzilxmnoTtTr1/wE5QKNjc5sgxm4Dxjg6nqQJLZhv3MdbK5efE0W
	irJIvxno0GSIG4yOdfWqPApgBV8iaws5HMHjztUvTLvysIRNrgzXZzvjC/ymWRQiqg5dYBy/ubl
	RhL//n+CUC1ILM4rN+qAfOqqntb8w5m346OwssSLrDya8SsAV/IskirXN+KVk6emur3O0VEZayQ
	NsayuH/T8bpsK0UjrErjsfRFU5bIIUd4rEPCrqmkF86eqBR
X-Received: by 2002:a05:6000:2990:20b0:460:25f3:b25a with SMTP id ffacd0b85a97d-460306301bdmr15689749f8f.34.1780912641650;
        Mon, 08 Jun 2026 02:57:21 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2eadefsm52385020f8f.11.2026.06.08.02.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:57:21 -0700 (PDT)
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Mon,  8 Jun 2026 11:57:10 +0200
Message-ID: <cover.1780912513.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_025723_688587_EC915126 
X-CRM114-Status: GOOD (  13.15  )
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

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 723 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1206 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3


