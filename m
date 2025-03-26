Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B45C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w2escYwrmWHZI04j1+ZmCi0mw73OS6dWdYk3lX1suGw=; b=NgbnrAjDfpd0qTGJoFtptXRCS6
	G659mrQNTY0780vTZGY2HxSjnCnQL6CbpjqlTRKwhCxQfsWsfdT1qxIyOOCODuXcOH2WN4wlZcm9y
	e5HS0lU8KXMtkV+iTImTpBvee8aUq2O03LwjOlEfjtlUDS3HOB7anxWuWL47MDyLBqqUCSWAtZX8m
	lgmG7IKk8PLKn/NTXEPMT1U9xgQLK7JE8LmGxUYynHc9Y74+tqkqwUCaOY1GHE5LN5Ui3vMpANjkL
	CB2Se0oN1Ni91XIxdLI+VS5LCdEXe+Wxov+J9R8iqBGORnGIqHaLx9DhiYE7J5SnPvN05IfITSUHA
	6vIsQxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRyV-00000008j8G-4AXK;
	Wed, 26 Mar 2025 14:43:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvD-00000008iQ2-394u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43d0782d787so48595945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742999997; x=1743604797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2escYwrmWHZI04j1+ZmCi0mw73OS6dWdYk3lX1suGw=;
        b=VJq+qSa6IenBxNOxj79fc8P/n/rj/XObO+tgJx4TAyfqGnJQv4yGcypJ90iYY9Uzmq
         rTidacxLoNX+xpooCy20I4zIsI9TBvgh/l2bWyo/V8uc0Nz/nJFcQs1H3OpHgsnHMkUj
         43ZbX58hyp2SBFAcwPZrf65WZ0EgvY47O6caS0EckZEW8e2gdB//2wCadEsFwtjqyz2d
         wALDo/++fktxpmUp4IayzOVYJZXjYVDpsIyM3OBwSf5VoEGRBQrXpLFmCy5WLeHKiOwe
         2dnYvCz8dL2Dxym58aapGEDejvP90oB8Y7+zvQbKvW918WXs0xufRctHEnrYfk4Kp9G+
         EEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999997; x=1743604797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2escYwrmWHZI04j1+ZmCi0mw73OS6dWdYk3lX1suGw=;
        b=WbpxDrMJJw72kXvAXRxSb8WVqHFxrct6BYtQ52+cXjfZkb+dvnqENtI12AbswwDniS
         4HUfj9wNJbxOEElLbXVT6AOt+crvroE8ELnBX5w6jkughQCvMTYnfY2IISVjSZeEXjJX
         fPAkheWDtljjXnFsdi5MRIi5mJyDzKOaWAf+M2RlXRlfTBpRoCyf4SAmokHUCQGPRrtu
         inFg6RPX14wkBCVTQfvxeprmXOlJhL/m44VDToi+gb8ZLsS+j+pNzsge+k1MbiHuwjYa
         UDvXAn77uHc+T4xPel9XroofSwrbWAgfpFBpATX7bQinJ7dvceiRk0PXSahBom6Df0B2
         lOpw==
X-Forwarded-Encrypted: i=1; AJvYcCX0Xb6OSL7oDOnJlGo2Y4KWQGo/eN/7UeNz7JfjWtXUbIhW3D/FsmNbXycw9YAwLyxsack7sxwk4y2hbEyGCc5K@lists.infradead.org
X-Gm-Message-State: AOJu0YyPkkJgjcQrE2OpgS4AxkOaYWadbVfxl333u8uL7SPDW5QAfmv6
	EyWiMAWl4H32PRg0F8cyx93cFvpu1suAWZKnqAMUholONqcgi8Pi
X-Gm-Gg: ASbGncsYHJWqyuVpCDNBhobC+skcEpQ5lKz3FQIJUyYPVXwHE8GgXeIuNX1a6VHo0vw
	OkaUXJ2vgncwMeW/c/Y8QWTsr1i3/vtGfnC84hHyK6KtdFEKHZa9DBuWX5ye7MGgKcw8T5dg3xs
	Z//cZv+lBv1cGMf39W3mmm09sIhuQzrwoMW7zq+fPDb4a3h2VVOwQSItgqnRDJ1f5UxjbT+1uGW
	CZhwByYtjoWpC6mZAmBtzCSpLZbPuB3tSXchwdAQxjuNj3UY4yreOcYOPtTovWcguePcHJJ2mJt
	fQ+3TZLdh3wH0GEzsgMvTZRJcePce/YSkfzSPlhZJNxmsHEi8GdaLVP8CdziqIt/vyxY
X-Google-Smtp-Source: AGHT+IGdl4gZEs10PQlzsN+VIaU/DUCwY0IWNIT2HC33rcyjm98sYqp/GuDO9Lr86yE82SREs/oVZQ==
X-Received: by 2002:a05:600c:5849:b0:43c:f81d:f with SMTP id 5b1f17b1804b1-43d52a2068emr136915965e9.8.1742999997100;
        Wed, 26 Mar 2025 07:39:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:39:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 00/15] Add support for Renesas RZ/V2N SoC and EVK
Date: Wed, 26 Mar 2025 14:39:30 +0000
Message-ID: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_073959_792948_E15433E5 
X-CRM114-Status: GOOD (  15.95  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch series adds initial support for the Renesas RZ/V2N (R9A09G056)
SoC and its evaluation board (EVK). The Renesas RZ/V2N is a vision AI
microprocessor (MPU) designed for power-efficient AI inference and
real-time vision processing. It features Renesas' proprietary AI
accelerator (DRP-AI3), delivering up to 15 TOPS AI performance, making
it ideal for applications such as Driver Monitoring Systems (DMS),
industrial monitoring cameras, and mobile robots.

Key features of the RZ/V2N SoC:
  Processing Power:
    - Quad Arm Cortex-A55 cores at 1.8GHz for high-performance computing
    - Single Arm Cortex-M33 core at 200MHz for real-time processing
    - 1.5MB on-chip SRAM for fast data access
    - LPDDR4/LPDDR4X memory interface for high-speed RAM access

  AI and Vision Processing:
    - DRP-AI3 accelerator for low-power, high-efficiency AI inference
    - Arm Mali-C55 ISP (optional) for image signal processing
    - Dual MIPI CSI-2 camera interfaces for multi-camera support

  High-Speed Interfaces:
    - PCIe Gen3 (2-lane) 1ch for external device expansion
    - USB 3.2 (Gen2) 1ch (Host-only) for high-speed data transfer
    - USB 2.0 (Host/Function) 1ch for legacy connectivity
    - Gigabit Ethernet (2 channels) for network communication

  Industrial and Automotive Features:
    - 6x CAN FD channels for automotive and industrial networking
    - 24-channel ADC for sensor data acquisition

LINK: https://tinyurl.com/renesas-rz-v2n-soc

The series introduces:
- Device tree bindings for various subsystems (SYS, SCIF, SDHI, CPG, pinctrl).
- RZ/V2N SoC identification support.
- Clock and pinctrl driver updates for RZ/V2N.
- Initial DTSI and device tree for the RZ/V2N SoC and EVK.
- Enabling RZ/V2N SoC support in `arm64 defconfig`.

These patches have been tested on the RZ/V2N EVK with v6.14,
logs can be found here https://pastebin.com/8i3jgVby 

Cheers,
Prabhakar

Lad Prabhakar (15):
  dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants
  dt-bindings: soc: renesas: Document RZ/V2N EVK board
  soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
  dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
  soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
  dt-bindings: serial: renesas: Document RZ/V2N SCIF
  dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support
  dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
  clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part number
  clk: renesas: rzv2h: Add support for RZ/V2N SoC
  dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
  pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
  arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
  arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
  arm64: defconfig: Enable Renesas RZ/V2N SoC

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |   5 +-
 .../devicetree/bindings/mmc/renesas,sdhi.yaml |   4 +-
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +
 .../bindings/serial/renesas,scif.yaml         |   1 +
 .../soc/renesas/renesas,r9a09g057-sys.yaml    |   1 +
 .../bindings/soc/renesas/renesas.yaml         |  15 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 264 ++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 115 ++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g056-cpg.c           | 152 ++++++++++
 drivers/clk/renesas/rzv2h-cpg.c               |  18 +-
 drivers/clk/renesas/rzv2h-cpg.h               |   1 +
 drivers/pinctrl/renesas/Kconfig               |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  36 ++-
 drivers/soc/renesas/Kconfig                   |  10 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/r9a09g056-sys.c           | 107 +++++++
 drivers/soc/renesas/rz-sysc.c                 |   3 +
 drivers/soc/renesas/rz-sysc.h                 |   1 +
 .../dt-bindings/clock/renesas,r9a09g056-cpg.h |  24 ++
 .../pinctrl/renesas,r9a09g056-pinctrl.h       |  30 ++
 24 files changed, 790 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
 create mode 100644 drivers/clk/renesas/r9a09g056-cpg.c
 create mode 100644 drivers/soc/renesas/r9a09g056-sys.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h

-- 
2.49.0


