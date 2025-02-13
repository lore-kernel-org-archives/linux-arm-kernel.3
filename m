Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EF7C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h/E+NEERZ+H3CAvZaK4gBU0W8710bx3dRofufwUO4os=; b=ERmHyXgEgaxmSvXI97iA3iHtNx
	JFL4hoSCXUFCh/Jk/PPQ7CT4U1KJ+AQvqLnOT9gGoysVFRrO4/dBx5ehKoh5jv0k6saBwEg+XCOMR
	j+bgnEikiEolpjJMLaBd71z7oML9txs+sul8+mMHVge3LvG6gbx+dICG9W42QqMKlkaRyBqXf+hxj
	YBtEQ+Xsn/iq9ye3k4yV1DYb2sEMACwR7drQnVhspeG4viW40SYxbq6iXw0gSdZxvkYyJhtjaj0iF
	bSjay590WdbIrvGKrejEpeyjxu9LBc6Suqz+ybXyjW3bL5LlNoqpsVHzFO9fRDh2s9b0D+v1eR/ww
	IN0RqgHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieod-0000000CNmE-143T;
	Thu, 13 Feb 2025 19:24:03 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidqr-0000000CDBH-3Eza;
	Thu, 13 Feb 2025 18:22:19 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5de47cf9329so1920217a12.3;
        Thu, 13 Feb 2025 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470935; x=1740075735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/E+NEERZ+H3CAvZaK4gBU0W8710bx3dRofufwUO4os=;
        b=JXL2G+c73P6asOvwVCp33Kub1Z0C9Irp50iz7aJ1wiNGMkR8VAMjiIfzR0AWR/LRwz
         JVMWWVZZe9zk6zNQG+BnmGXyHnK60hvtH8kZNYqAF457gvbLB1cgolx8V2ZRcjfdtQzg
         MOWIdLv48OlTUA2mFAW+xa791ZNSP48c6103njKBugTtfC/3f+UaCwDnBbQP60w7j0WD
         C3OtK8qudsohlEXOG17Ko24DgSLlnfg/tYfhvRRMX8t9USe4ypf2wbT1SIX0hF0e+XUs
         I8qglywsPvWVVwMD7ys26ExS/85qSZgBbjyIqvfEOHtkM1H+DS/rmYbrHvKpjdLGMqtV
         f5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470935; x=1740075735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/E+NEERZ+H3CAvZaK4gBU0W8710bx3dRofufwUO4os=;
        b=GwXA+2in7kUYpZS5PFmf8gPMzz+nxHZChIAuX+2r4js8FzPyejdcUVAgrEqKh+iEH/
         s4I4iAP1EWClgWYPc7IWjAXatk6aWgqGceemZ/lrKG/XCPybKEySCmg+TDMWDs3EP8Bw
         s4unGX0w6dAgdC02hrD3qVETDXA0i9VjeRbaYPd5eFUA0AfCKhuurehYKRPqxzcizptm
         zNeFFtPI3CsdnilNvLgLwIVr6JGL1cbh6C1U9MaUfNxRE2PDd5abVBM6UyoWdI+XyL8+
         5vIXsGGFRnUMwSK2cDvIk5vezCk6+jvjpXlP32grqlFg8UGzjdVMLTEgHruDnJJtjyza
         YbuA==
X-Forwarded-Encrypted: i=1; AJvYcCWzC/KZ15cHatPZRQhpCiDkvaLUTt5Nn69xqZdn0yOpLYDyr8W33UmOeW+Q12byNptUdBy47kwrdw9gDRXV1dgb@lists.infradead.org, AJvYcCXbLF5MpWhrPurt8fBRE55zs1itaaA0qR2ciT+QEBO5wmo0u3+sZyACnuAGHp4Vq5xGzxsmHnDEOaIG07g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ3pX1lvILEt0rPjlmrZ1gjNrmkvRkDPKH71KJzsqLclU/M7SW
	M8OuB1t7RIyytImxXc7FS7iSqSVs8lNEMwKYK3FW0oOltRvtb08j
X-Gm-Gg: ASbGnctaCrMZrvhA71T/m7h4mzmk4Swt9T6ug7t6UXGtvWc/3J8GCInyu8KPkaduuiS
	6doQ52jDZcP+u9HN3vOf7XnCoTlDlZCjzMr4FJqaG03D1+nWZO4peLfmCc0xzkTJDMEaAXu7nSg
	fLMTPMz/6INhF1/PfZzbIfkjldK9lUHc8JybTVvLDlp5rpiw4aeBjONSWArIs2iS1baoqxyv3sU
	HCGMZN0QwEWWcBkzRjKLvSycVyBOSne69i1bfkRvbBchHdEuEcxeHZHpMs5+NvQmJLJuA10DKP0
	1OgqgXTpqH/uU4ed/qf2YJPCoP73
X-Google-Smtp-Source: AGHT+IEINFZc6fZrjdeRXLHS2OjGj9ojjSsvveBDwdCRTKsop6kumf8PxLs+aNaP64+EA/5Ycanmxw==
X-Received: by 2002:a05:6402:3905:b0:5de:be17:8 with SMTP id 4fb4d7f45d1cf-5debe17e091mr5905623a12.23.1739470935200;
        Thu, 13 Feb 2025 10:22:15 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:14 -0800 (PST)
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
Subject: [PATCH v4 0/7] arm64 support for Milk-V Duo Module 01 EVB
Date: Thu, 13 Feb 2025 19:22:01 +0100
Message-ID: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_102217_809464_94BB80ED 
X-CRM114-Status: GOOD (  16.27  )
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
v4:
- minimized patch 1/7 (cleanups dropped)
- cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi in
patch 1/7
v3:
- &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
were moved into cv18xx-intc.dtsi to reduce code duplication;
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
 arch/arm64/configs/defconfig                  |  4 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  5 +
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  5 +
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 .../boot/dts/sophgo/cv18xx-cpu-intc.dtsi      | 54 +++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        |  5 +
 14 files changed, 303 insertions(+), 70 deletions(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi

-- 
2.48.1


