Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C2DC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oinzcqCiVbGgyb0iiuzscDKJeJyyI76yLcJfoJ0sjS8=; b=EUZ+ypEAY5AI2kZLAc73uc2opB
	bIekQqmxPJC6+QimOuj40+CiGNjG1twrgpZpV61NcQvSvVGTjmhdTZXnT+ZYj6NFYqofENi0IDOPN
	t9h+BPRHlNzSLUhMv8EfXSNed84XhiNAqY2ChtS2Tj/+qtpWVTi3Mkyl20N/N7UbMTbP618RCnLjg
	FiI31UbvGxjHMH9EsIBA2XDNXxwtYgDQDOWfiEkN19CjA6nn0JHftWxnsoHRHy8GS37I8KeXFpnvR
	MUUmbzMMNKUL30yYt3Afb6QsHMosjfxuSI/33T/FVFCxYiewwKH2JQAPf+Fe8NSXoo+0dUY6rbUBY
	bUw0FHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xsZ-00000003EhC-1wkv;
	Sun, 27 Apr 2025 09:00:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wgM-000000037Cg-1awm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:44:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so27475655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 00:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739848; x=1746344648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oinzcqCiVbGgyb0iiuzscDKJeJyyI76yLcJfoJ0sjS8=;
        b=azOdp7kwKdOZ/u7GaLXeZ5W45dc25/PZJ7zST0dPyxh6DGS4QVzILhaACuE3SznUtM
         MD4L4K8OK4DrKyg+VdU6aOYhJQSjn4JeFBx3xYjkV28um0zr2o6kFYWNaqehMjhwk6Sp
         kKyA6n3TTu/GKZf3tFqL/SmcBvra98UK/pABk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739848; x=1746344648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oinzcqCiVbGgyb0iiuzscDKJeJyyI76yLcJfoJ0sjS8=;
        b=mPZigDBDRvrVR13JwNdGmPS4EcMP7mvnzMfVATnt9Ljat5FAI6HmcIdt8RWZaacTTG
         X6oQ8N3RNNnotgaYzT6rmL0MamfCoqqzGpCDRDUjXDtjida45pERcofMKXx2RO+RRODV
         LyUH6ObLih66+ZNbYdnC9z6fbeGwaFDD9VhTj7sK9clhxSt0Xigm2iH5DT+J53UDPaJi
         /11JXLVIlRaH9OVZuySw5IAzI7qzWJoM5TT8HaFp/3OqhSd8R5XtssckR0C9LYsgcuO4
         URqamx0sviAJRwFrCdupWi58PgP9YhSO2stzBz36hEnQ4MOabrYWq21SNxnp7sYPLmh4
         Q0+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtbs5e+Je5rSt/Ci1YGEw8WYYBuH9JHdMDXFakMmL4hOTSRE+q5/rzdOJ6kgRrioSgNBe2T1LsSJHCN99Xsczq@lists.infradead.org
X-Gm-Message-State: AOJu0YxG12OM8Boy+kF1dlosST6wmspyruzvL6kol23UwPsa/NUqVZPJ
	og0W+q/91WqSIAUK9G6XMvDPDkLqqWuZVMZrwLEu4PIuO97v1QSdGjhL0YJi948=
X-Gm-Gg: ASbGncuMRYTo1enrSCttZUcOJI6/ekpfFdEppoQMImnsPzxjWNsjYTjINXYWH2vKdQY
	qhYD/n/ej6ZweMiYM9IPWMP922/UsBL+abtWfrQ73fwmr0OxjOeR25MRMF7yXrNJdvj7bLx9wZ1
	LQ6PJVTp/NOM+Cawr2suLWCd1Jdl/Mq7iiYyqsPMEfoUMzgyub/EGKbuDKUXX/1w+Br5nmagLGA
	qtM7DU3V9BYlYASolIBmfyoXPdoKPsfSjXkgl5t++PoGnroX7hg/gLpfZjOmEXY6AWJe2rZ6yrF
	YNqYRo228CuxPPx6C+1O6dNYQM4SLvd8OrceUTwj6dA9dgNgim4jtGkKBg1gfMXM3DyhlipX39e
	1RC07yA==
X-Google-Smtp-Source: AGHT+IG55beBCMeEpoU+v9sBHrbcIgFnVINAwcpqdyMq90VQ1/y+K+5G8xBe1CVGW38gxB0HOPdp+A==
X-Received: by 2002:a05:600c:3148:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-440a65dd132mr80678905e9.14.1745739848202;
        Sun, 27 Apr 2025 00:44:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Jander <david@protonic.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/8] Support STM32h747i-disco board
Date: Sun, 27 Apr 2025 09:43:19 +0200
Message-ID: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_004410_432544_2F12A6D1 
X-CRM114-Status: GOOD (  12.16  )
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

The series adds support for STM32h747i-disco board

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 Mbyte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html


Dario Binacchi (8):
  ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
  dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
  ARM: stm32: add a new SoC - STM32H747
  clk: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
  ARM: dts: stm32: add uart8 node for stm32h743 MCU
  ARM: dts: stm32: add pin map for UART8 controller on stm32h743
  ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
  ARM: dts: stm32: support STM32h747i-disco board

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   4 +
 arch/arm/boot/dts/st/Makefile                 |   1 +
 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi     |  34 ++++-
 arch/arm/boot/dts/st/stm32h743.dtsi           |   8 ++
 arch/arm/boot/dts/st/stm32h743i-disco.dts     |   2 +-
 arch/arm/boot/dts/st/stm32h743i-eval.dts      |   2 +-
 arch/arm/boot/dts/st/stm32h747i-disco.dts     | 136 ++++++++++++++++++
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts    |   6 +-
 arch/arm/mach-stm32/board-dt.c                |   1 +
 include/dt-bindings/clock/stm32h7-clks.h      |   4 +-
 10 files changed, 187 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts

-- 
2.43.0


