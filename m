Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A86C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yYwdC6FkM1FkoHrBLoPreNjUtz/aJNsrJlKRqn3rXe4=; b=aIOAtJdXBpCLHK76DuNaE2v0ca
	c+8dbmjEAOL+oYc55PADJfVWMNPEdqf38aNin6a9NypLV6S2ikq6RF7MkRgzXwxPWhw9vilOhO8pa
	yllyPWLIf/hzi4wI3mKJ5YSwloxAPSdeYofrDGt6quIOdkeYzma9Q7jc4D/8kuZ/coviW9xoyuIhT
	+a6rPck0aWeC0W7UBrumh0XneqYxDl6kOInejDgtDqyIG7r3qwaF1/7c9CcryD04Pya0Tlu6SW/CR
	Ruz/ksOok80UjRKTgkAjP3GjN1WHAK3UZH+O+n5dKtXOorxnawXWQZKdYKodJJnybUWE0czjAKa3B
	MeCoRaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfexY-00000003Iwx-0vuD;
	Wed, 05 Feb 2025 12:56:52 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfetK-00000003Hn3-0yz5;
	Wed, 05 Feb 2025 12:52:31 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso12363271a12.1;
        Wed, 05 Feb 2025 04:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759948; x=1739364748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYwdC6FkM1FkoHrBLoPreNjUtz/aJNsrJlKRqn3rXe4=;
        b=k2gVTEv9nnp59r18mqpBSGyJfpbt3fIxsOkuL5MHqEnetVsgBm/hJr/kA05fGP68dt
         S33LSDkwy2sVJYBaV0k2YXI1P9HFYBtpJ7Rharr5i+L6urjbJMM3TW1xyg9LzRhjtiiv
         6DBjqu9qp2BnD06RgWIAb6IKevmYqvS7PqpcupuQ9vliDwemU6ET7U+wtt8AYOs4haXW
         lS0ySw7N4jopNJlJ5o1e+OlhmaK8At7KkNm0uVqDtwZ82vum15MpmCN0EenD4xlhfIiM
         PDu5+Mo5noz57i+kMJeYTZt11mycDR+imP3Rf/+ELr+2O47vA//qrKTXgIUSDbqKMNPL
         Xzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759948; x=1739364748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYwdC6FkM1FkoHrBLoPreNjUtz/aJNsrJlKRqn3rXe4=;
        b=FtJ9HpWDgIKwAWM8WS4vCPmRTYG31ptqjTTJ+95uR6CuFJiw7xeokBClWItjNgSLNO
         iqjD6aX28TMe7irf95E7qtvbPvBHCN4V7SJ/fM7tWB0DWaLPzckqps2EhlizjdBDSv3r
         jMwvdjwzWhDJEvVFuCc32smi83mTMcaoDZ6GS69GxCmZsiysKjaU82VpHYjrJQNdD/CT
         dxjdQ9OV/i9MVMYNdyrThcm51kF5XLCevKdcaRxMG5ky679fqTHlhWqHF9ASFzdB8mti
         N1+Y3KCZMHbKR3Pz5Gfhz6VnIs6Q8NO9dXJ1D34dXtTSjm5cLTxqCP8h1pY9cwjbzyJH
         80Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVu2RspZ2lW6/ucdoUwS3TUKZd7S6jRVRSGYZqFj3I1eQOpLucSYs2nSHKDA/29aw3Wdnyp43FBgvKd@lists.infradead.org, AJvYcCW27vKJ5tSzilPKNZHiiYfUzqwUTODm2elYNsqsEbO0stV4bbregGdjF0VTbD9WpAev+8UXJVxVQ7JLIhM=@lists.infradead.org, AJvYcCWdp/GIgDs/9mEuoqAzyaQ7sQ9nBXML9LCwuswPKkhdMSaJYusu7HJ+5zpQHmWQFzb+7LLqIjg1FfxZrVvT7HJU@lists.infradead.org
X-Gm-Message-State: AOJu0YwXiXZUkdNU1rPSuMP5ovQnoolLq7T7P7GybKgN3qQ4jGsF30sE
	r3Z9VJ5yyxmvz0h1daq7epIALbPbkCqRNkK4DcS4ZVNGUwr6tbn7
X-Gm-Gg: ASbGncsV+J5UIJeF41Fi7zzxctZ+NN9SFYuKuQTu/nN23imEAaY+3PGgchmyslFY+VN
	kGpFDfFvTI0ocfy9e1UjGe0qmbJleykmppaJNdXu9IFOH61RrG9bIanGRrLrsh0oqcPzBXRYvgg
	UGsxbVEIohiRBk5ayrExq5N7SiZuroBaJJbPRA3hFWbKsfnT7QpUUKdumgsl8qslJXwzo9LtAOa
	DAIbjztRWeyAbxnZv2Z84B5qBb959IzHrUFGfBkhu+OR/7B68vkPBCbX8YMifZpXZH7wGMTwk88
	3U3q+2763GJnEuKdi7SAugeLAmaN6O4tzlz39RvGFpVmNg==
X-Google-Smtp-Source: AGHT+IGwwnpMG9KpubRS1ckqsKV0lRhKkSXdJJkp9LazwK0ad82cff1p5Us/UKXT3VoqZffwLnJ1uw==
X-Received: by 2002:a05:6402:388c:b0:5d9:8877:895a with SMTP id 4fb4d7f45d1cf-5dcdb732cd0mr3409724a12.17.1738759947712;
        Wed, 05 Feb 2025 04:52:27 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:27 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 00/10] Support for Allwinner V853 SoC
Date: Wed,  5 Feb 2025 13:52:15 +0100
Message-Id: <20250205125225.1152849-1-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_045230_271708_B922F216 
X-CRM114-Status: GOOD (  16.55  )
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

V85x is a SoC from Allwinner with video encoding targeted for the field of
IP Camera. It integrates the single CA7 core, and a T-Head E907 RISC-V mcu.
The SoC has the usual Allwinner peripherals and a Vivante NPU.
V853 is a BGA package without DRAM, V851s/V851s3 has the same die with
co-packaged 64MB/128MB DRAM (in a QFN88 package).

This patchset tries to add basical support for the V853 device family.

Changelog - v2:
 - rebased on 6.14-rc1
 - add a needed gate with key support to sunxi clk
 - rewrite the ccu-r driver
 - fix license issues
 - remove the pinctrl binding, as it has beed applied
 - rework the pinctrl driver, use the new sunxi dt based mux support. This new pinctrl
   driver depends on the new sunxi device-tree based mux support patch series [1].
 - remove the new usb phy binding, as the v853's usb phy is very close to d1/a64
 - add a board dts
 - ccu: add module description
 - ccu: fix PLL enable bits, and min multipliers
 - ccu: change PLL flags to CLK_SET_RATE_GATE
 - ccu: use SUNXI_CCU_M_HWS at peripheral PLLs
 - ccu: convert the VIDEO and CSI PLLs from nm type to nkmp according to BSP
 - ccu: cpu axi clk use pointer
 - ccu: fix comments
 - ccu: swap i2s1 and i2s0 bus clocks
 - ccu: fix indentation
 - ccu: fix RST_BUS_SPIF order
 - ccu: convert RST_RISCV_CLK_GATING from reset to gate

[1]: https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/

Andras Szemzo (10):
  clk: sunxi-ng: allow key feature in ccu reset and gate
  pinctrl: sunxi: add driver for Allwinner V853
  dt-bindings: clock: sunxi-ng: add compatibles for V853
  clk: sunxi-ng: add CCU drivers for V853
  dt-bindings: power: add V853 ppu bindings
  pmdomain: sunxi: add V853 ppu support
  dt-bindings: phy: allwinner: add v853 usb phy
  phy: allwinner: add v853 usb phy compatible
  ARM: dts: sun8i: add DTSI file for V853
  ARM: dts: sun8i: add DTS file for yuzuki-lizard V851s

 .../clock/allwinner,sun4i-a10-ccu.yaml        |    3 +
 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |    2 +
 .../power/allwinner,sun20i-d1-ppu.yaml        |    1 +
 arch/arm/boot/dts/allwinner/Makefile          |    1 +
 .../boot/dts/allwinner/sun8i-v851s-lizard.dts |  196 +++
 arch/arm/boot/dts/allwinner/sun8i-v853.dtsi   |  656 ++++++++++
 drivers/clk/sunxi-ng/Kconfig                  |   10 +
 drivers/clk/sunxi-ng/Makefile                 |    4 +
 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c       |  120 ++
 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h       |   14 +
 drivers/clk/sunxi-ng/ccu-sun8i-v853.c         | 1145 +++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-v853.h         |   14 +
 drivers/clk/sunxi-ng/ccu_common.h             |    2 +
 drivers/clk/sunxi-ng/ccu_gate.c               |    6 +
 drivers/clk/sunxi-ng/ccu_gate.h               |   14 +
 drivers/clk/sunxi-ng/ccu_mux.c                |    4 +-
 drivers/clk/sunxi-ng/ccu_reset.c              |    7 +
 drivers/clk/sunxi-ng/ccu_reset.h              |    2 +-
 drivers/phy/allwinner/phy-sun4i-usb.c         |   10 +
 drivers/pinctrl/sunxi/Kconfig                 |    5 +
 drivers/pinctrl/sunxi/Makefile                |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c    |   53 +
 drivers/pmdomain/sunxi/sun20i-ppu.c           |   15 +
 .../clock/allwinner,sun8i-v853-ccu.h          |  132 ++
 .../clock/allwinner,sun8i-v853-r-ccu.h        |   16 +
 .../power/allwinner,sun8i-v853-ppu.h          |   10 +
 .../reset/allwinner,sun8i-v853-ccu.h          |   60 +
 .../reset/allwinner,sun8i-v853-r-ccu.h        |   14 +
 28 files changed, 2513 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v853.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
 create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
 create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
 create mode 100644 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
 create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
 create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h

-- 
2.39.5


