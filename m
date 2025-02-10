Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B43C021A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aWyO6Omj46BLGouriEYcHBj4I5jL2cpuWdyYPhlUQ7g=; b=HQVxLNHrR+uJ6wSCCHQAquDQ5G
	owkQi0vLsGJ/+CWVOBBrqDzNUdJBASGjLdqdeIzsEYFVtc4XwSOxaR1wEkdCr5c4KpGuGD0N+mt2t
	AhqOxII9d/qEJ+Jpl9/gEh25SIagz6rFgeFffFhItqVyg+Ff41V9I4FR/lDaef9zmVmN/dqe5kdVy
	lKvDBEOAC9wVyRRdnPMNPo3wUH0R7ExIvEzh+CoMIg8YyvfNH7rlJsqha2i6lgq5JZ2f/8Xyn2HWb
	4wX7pylerWLRKMisuSGQlhS9wjSx1S8HqvTEINYzIDREVwmj6QZKdOgO1FuqSCyR7z75ivEa+/2l8
	GA5JCoNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdA3-00000001q2u-1FJ6;
	Mon, 10 Feb 2025 23:25:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbye-00000001bJq-0qli;
	Mon, 10 Feb 2025 22:10:05 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso1464415f8f.0;
        Mon, 10 Feb 2025 14:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225402; x=1739830202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWyO6Omj46BLGouriEYcHBj4I5jL2cpuWdyYPhlUQ7g=;
        b=iJL8ljC3O1TDLsRSe3cR9WkJtXukeGXrZRUD8nB8mX2VrDxI6NPnyADXCZN+bLJSA2
         GawBxN+5Zr1Ye4j1EjCZx6bJd+82XNoq5bEiycrYf8xQpPyBeDRItd8KZin68Z+UZNAz
         FGe9l+aWtiwA+fb+caM6fHdSe1+TXEFdWji8+Sq0CnEpDti7wkU2B9Kot/c59UnhpU5Q
         8WdIgaoLNCS86bPRC/J6Hq2B/bjhZWQ+nv9DRBJhphJzLSXkjRf5VgOIrzAJPqseNTHo
         QDsQl8iJOx7m4h5k3MYaWk1ZFqQvI+cT/00t6T+m/rF105DYdiJARkBaoae4N/VT8tUQ
         8pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225402; x=1739830202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWyO6Omj46BLGouriEYcHBj4I5jL2cpuWdyYPhlUQ7g=;
        b=Vt79IeDDvNkgohE4EGwv2rkrMzEdYR4Hpx/+/8p6MHlZM5Js8JmudNeDBWPW3tQPyU
         PPS1vmRQLkByVd6uqbqMXEBYa68Sj8BGXqGQfomzNsXnYAMTqccr6obowq6a0XFQI8RB
         Coq0Fv7qXKkg7wOaS0kC2j0igya1P+DjmeyNiLW/LfhTASRUs7XD/Fv5bOs9G+R3QRlS
         QRinhGwGM16NLXbfvjv8u3Cba8Zo9faNUpvaW79Yx4Uzb7XtVtDBmSG80XVxEXGQAvTG
         sOuzLK22crKc6ANFDHWZOC2LpcGb0osB2lewEI1a+Xw+qU3X39xow0d3PxZ6LrRk2VhL
         xvgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5z3ZUgxfRpWhsLElpBXa0HiyTqMo6LbEhAkC2q7P1UoUhOrd9AK/VLzpS1GPcD1BWu25f9eTJKe4sAdA=@lists.infradead.org, AJvYcCV5YLtz0bzCZyihvMyy66+X9txJKcOW7QxwsSP1BrK5k78Cmkl0vEg8E5B4/wa3GKsmddW9ijvjV+8QaeKTmaFX@lists.infradead.org
X-Gm-Message-State: AOJu0YzoNdEGZezTgm8zeoB9dzutZggPRJtjya9hXREB2SqLamFf2Z4v
	+/76z7AQDrp1PpR9fccrYB+zSn36zUUuEOwP5bHUtC8W3L/GLI+m
X-Gm-Gg: ASbGncsclmIpkffsI1nTo52IoonINDDKhMEf5miw+TJ1n3p6jr4l+yr+xxTTjCCOcsS
	IV0lHsdFO1qpm7EnJJvklDKpvLta1AjiOcgzQ+K7rqYl7ks77NHkP+l2EzNJuJoVqR+I0nogNaS
	WZ5fM1f7LDujol0pFgvOonc8zJkQBiFQkKGlVWts/7Lbs4z0SBRNwWbrTj3cheXUpVKtX06jWxP
	cgLRvbdKySd0PZMXEaZ8F8eDPofoaO10+Cg/DxJ/6qEapyqq0i7Iks/30vC/Adzcac4Yo/fBv1j
	Og0nLmR9Sj8n9KG+WSfMGSalAPyD
X-Google-Smtp-Source: AGHT+IEMaGIcU19hT3jyRgsUsaV8XvP59su/yVG0KhKsBGbkZitk0/Jmb/o11eWD/isTEql3vIA+Cg==
X-Received: by 2002:a5d:6da4:0:b0:38d:dd32:c939 with SMTP id ffacd0b85a97d-38ddd32cd83mr6651606f8f.36.1739225401776;
        Mon, 10 Feb 2025 14:10:01 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:01 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sebastian Reichel <sre@kernel.org>,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Subject: [PATCH v2 0/7] arm64 support for Milk-V Duo Module 01 EVB
Date: Mon, 10 Feb 2025 23:09:40 +0100
Message-ID: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_141004_240508_D0CA3B71 
X-CRM114-Status: GOOD (  15.75  )
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

This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
been chosen because the upstream toolchain can be utilized.

Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
peripherals with an addition of ARM64 core. Therefore it would be
beneficial not to copy-paste the peripherals' device-tree, but rather split
the most suitable riscv DT into ARCH-specific and peripherals parts and
just include the latter on the arm64 side.

This series adds the device-tree for Milk-V Duo Module 01 EVB, which
in turn contains Milk-V Duo Module 01 (separate .dtsi) on it, which has
SG2000 SoC inside (separate .dtsi).

This series has been tested with Sophgo-provided U-Boot binary [2]: it
boots from SD card; pinctrl, serial, GPIO drivers are functional (same
as for RiscV-based CV18xx SoCs).

Partial SoC documentation is available [3].

This series lacks the support of:
- USB
- Audio
- Ethernet
- WiFi
- Bluetooth
- eMMC
- Video
- "reboot" functionality

It would probably make sense that the series will go into ARM SOC tree.

Changelog:
v2:
- dropped all patches related to the new reboot driver and corresponding DT
and bindings;
- grouped DT-related and config-related patches together;
- added patch moving sophgo.yaml from riscv into soc (to share it with
ARM); added SG2000 SoC and Milk-V Duo Module 01 EVB into it;
- other changes are documented in the corresponding patches;

[1] https://milkv.io/docs/duo/getting-started/duo-module-01
[2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
[3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf

Alexander Sverdlin (7):
  riscv: dts: sophgo: cv18xx: Move RiscV-specific part into SoCs' .dtsi
    files
  dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add
    SG2000
  arm64: dts: sophgo: Add initial SG2000 SoC device tree
  arm64: dts: sophgo: Add Duo Module 01
  arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
  arm64: Add SOPHGO SOC family Kconfig support
  arm64: defconfig: Enable rudimentary Sophgo SG2000 support

 .../{riscv => soc/sophgo}/sophgo.yaml         |  7 +-
 arch/arm64/Kconfig.platforms                  |  6 ++
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 +
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++
 arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 75 +++++++++++++++
 arch/arm64/configs/defconfig                  |  5 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 64 ++++++++++---
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       | 64 ++++++++++---
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi    | 57 ++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        | 64 ++++++++++---
 14 files changed, 451 insertions(+), 103 deletions(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi

-- 
2.48.1


