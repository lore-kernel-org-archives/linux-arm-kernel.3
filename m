Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622D2EC1E86
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qMd6eVgyTaMp2dz0Bmva0s1vsJYaGNF3GbW8MNURkF8=; b=dYaKQXRHI1pgRyY9YS8lyIczEg
	O0BA+b5FGUm8a3C7wOhYD0fkJ/7IQ1QFW+3uvhzYzhGF8wnOx9ORnJ0X4dR9ttVK2dnTs7v0PQrb7
	QIxRGJ/Mn7lx2v2aF7iRDoqbg5Tyqp3BSc6KNQVmxwtgmLXaLNVd+kPXMM0otTKkDzN95IwuXYzRD
	F5xTWJMGWVqpymojmfWzM9odezQsoegHGIx+B/nGB6UW5uFn/riJUUFXOZVjZ1q6dw3GbZiDtgHTD
	8eW7z9RcBovLYtrPifkaZ2Rl2Wcv5Kdp7I/TSLe0frKRhCYfSshA39sQlDkzCMD8yBfSiiv3tXfwx
	U/XLNRCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwBQ-00000009kNr-1IQr;
	Thu, 05 Feb 2026 10:01:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwBO-00000009kN3-2gtT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 10:01:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so519126f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 02:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770285713; x=1770890513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMd6eVgyTaMp2dz0Bmva0s1vsJYaGNF3GbW8MNURkF8=;
        b=KTlTvKr9l+2gzovmb4N3FfTSFv1XaPkg7byMviKoFQvutRtEBoS+ALW0ji+7YT2RqD
         PWXsaCO+xgPO66IkWEQ18CnW1J5tUUryNMsDHtGWqn83UtHfdLGTOodcYGKs2jzhHL6M
         tn9sb+Q95MkRMHyK/IeZ8UXiAH1ErsOeM76P1+BN0r3j1Dr/mFPF+XebL6NRl8uL3mes
         v0B9wjlEUAv+lQ9rXVtEC8q/nkfgSCAab+0i432cBZargFTAgbI0fkN17YviCk4Ae100
         9FPSh/Dq8khuQAuwDKlF4h1wBDddLUFEvb9fBZ4whFm+LwyKAN4d8WFjEhrpFvZgvDIQ
         waNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770285713; x=1770890513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMd6eVgyTaMp2dz0Bmva0s1vsJYaGNF3GbW8MNURkF8=;
        b=bfN/OgAq4XjrIzPElZo+TBfGIoR3dc7ym/2EAP9Q5aF45Mg4UTmsrH+WutgB4VmsNb
         HlPj8AAJpW7FgwjPEYF0kWRpWVoTG7ZVIYy9xlLKp8eCStWrhSEK/dYahBLTxOl5g15U
         X+VTOk3xvEwtNKCmn02pUw0+4uzyNW5TckwTehCG8OcE9R0Lygc45W+kF8tbS0dKQPf8
         tssse71BWhFYCKDVJL1/mr1FGmpukH01Z6oLmaOQVrNUjU6e1JkWX1BHhwNPOHQ1b0kc
         /K2ajmxDbw6IRQGV35iHPHzR0KYvbwSzo/Gq1ecBFp+mgOyY1TE+UbavV+e4CGXzCZTu
         mwtA==
X-Forwarded-Encrypted: i=1; AJvYcCXh8bhtEhn6rhVJLrL84KNUsv6Y+E51Xdp4twjTtbizwfhooTbeeT7VgjY38wV56XA27o7HKM/V+Pa5BcN7S2PS@lists.infradead.org
X-Gm-Message-State: AOJu0YyMJxSOfLn8lhYOUMeaOadQP5kaGQKziIwntgwnJlG/KwmEWcYx
	5A0Z9SfX5cPYwH23HDBYhiTR3RR9V2kV572iK+NmE461XVTQmsP0sr1C
X-Gm-Gg: AZuq6aL/R/RLDW6hkuew1lnh1I716PBg7CtgpQmnfGUfw8BKZ3jYUuZcsmAyMv1Ncwm
	0Wt9jzQvtQ+O9U2eFJiK1IOuQ6XKrQE9RWLvUqdpcsYQIgUjMEVcSXYbJQbiSy/VAt1lNig0BQU
	24flhKESwspQwYXlRyLmjN+Z2B5Bg+XAHh2AjoyQQeBSL44IfmjfHsVxzPvy0pcteKJ0HFYb8IW
	sc05a6nAd/ODsnW4WusJJhHpD+1hxVxIcfnSfx+MSQAskZ8+i00i3vFbr1jTd8BBjxdfejIeBlM
	tJ2WJ6uW0zuZAkGwoiQtNMO936ni5lqg5B41nDmFOSNvQvTGenM4ZdAzicSEWPqD8Ubn8vICT38
	LP/T+wBRnBDiCTFFS69wXRqham2nbHDXarp+oX1K7Kan9MLFzLq9jokzNx8lfFmx+FTmTd/6282
	wX+jHz/3jX2ORo51mshdOLd2LHBcdritWaodZAXufRZaSbiAYh5NukEGJzD030Y4NvvGsHug0Tt
	XQoRRzmsiu2LGkdpWs9FuAqnZP1
X-Received: by 2002:a05:6000:2384:b0:435:a258:769 with SMTP id ffacd0b85a97d-436180627b8mr8506438f8f.59.1770285712565;
        Thu, 05 Feb 2026 02:01:52 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805fbc5sm12025466f8f.34.2026.02.05.02.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:01:52 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: [PATCH v2 0/3] Add support for Variscite DART-MX91 and Sonata board
Date: Thu,  5 Feb 2026 11:01:22 +0100
Message-ID: <20260205100125.9095-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_020154_691419_67C189D7 
X-CRM114-Status: GOOD (  13.01  )
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

This patch series adds support for the Variscite DART-MX91 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX91
  arm64: dts: imx91-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-dart-sonata.dts   | 498 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 ++++++++++++++++
 4 files changed, 973 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi


base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
-- 
2.47.3


