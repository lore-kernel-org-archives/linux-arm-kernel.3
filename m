Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AF0C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MLRgP3IIDXezaBsOM8+vWEmARGcut96oeFGa111PeEU=; b=QRP3dEiYDoM0pXRF+Pq/611Cae
	AMG/ceNMZxLwHfURdOpWj7XFUk7+dHhnRHY+jsav0/WGRX917vAYNrzy8nNNsWpj3MyGKgsst6tQ7
	t9aXyZCIgHVFCE6J01WfRhg9qjd6Ldg7TEJwF67QuxXB1ZWGN6L3VuRRqIQZPkvjcDDYyvg/XSR0u
	/Brfuibt4uQMFGratL2h7T3Y5JFDxnzx6YFdaDsBvN4mDUn14wOsae1cUzo8WuIC38cowrZ/XOy5d
	YjSTXjV9KXFYrM05oS4K3TSPFSBmhyL4zEuQrg7fYnEdpTB6l7J/bsH9KB2FmhmEB1CynI7WWNVwC
	ISWITBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowI-0000000EX9s-21kJ;
	Thu, 12 Jun 2025 20:54:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhyu-0000000DSS7-0HP0;
	Thu, 12 Jun 2025 13:28:37 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-451d6ade159so8143995e9.1;
        Thu, 12 Jun 2025 06:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734914; x=1750339714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MLRgP3IIDXezaBsOM8+vWEmARGcut96oeFGa111PeEU=;
        b=OXUg8sWm8VlcwmfxEMnBsppCRPm7qWVps2weVBxEXgU59FI40N92j5/RWVrUylieQ/
         U2WotCtFAMSc9Y4GMEOVQTMuwh+LffdCJOUwfNlzDy5zqGOcRRJy3BV2UfNi/Lr7Ao90
         9YMvKepsONHFjuKcQxYQzXRdk/+gtX5l4jzO1wgIXus8ILeXc0nilS0HPN7wP0OJirYn
         IH33rZg4nIaQI9I8UJFsR2elAKm0Z63HDOieJA8QljpqE27AhhhD+EYbn3havYiidETs
         vYIJC8DW6+/TR11WmWPBXvi8x+6uEidO9Fz1oahE+OS4su7U4/foiy7SAetIzXV/g3So
         M3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734914; x=1750339714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLRgP3IIDXezaBsOM8+vWEmARGcut96oeFGa111PeEU=;
        b=qFXtv8zukbrBd1ofmOZvPtby3WpiWKVg7sD73whTejZfW1qSH3Z9tV3r3O3MXgc8Y3
         T7Xvyeg2cwNy8Zoq3C1d5o+JiZhIxNfQjouzptPJz4FFxYzCYmsHVcjzno7NMUIe0cDJ
         /i9k6M3DS807EThjhCcJUPTBsN3Y9yKJyGrarfDlSvxnD3WlzirmlPjAn/oWK43anyIg
         znCm7gv3pqwol2KnhxRezJUeafwdA/MjSiQ+94glFPD65JCch3Mt3cnn4wNHEqd12m7F
         YIUz4F/L/ErbJT5AIRXFtAokiE5NkFGx1ULvKuHSwe77fqsptrdYL2+kxthBurv8rtZg
         J5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV+9zXQI1vN9Uhsyj0W/KLu4SG1n47bXwB+DZXDoKhKdTb7oDsDIBGA3Bowc77JJ5FRmjeZk5vYNnPaLG0=@lists.infradead.org, AJvYcCWVBVB1NHQ58tm6FIUNXDHJmg+EUJeGErIv5cjcoaC0ji85wlwOdNg7MKxAJzk4syHceT+tRW7eJD7PYDfH2Eb8@lists.infradead.org
X-Gm-Message-State: AOJu0YwKg12Leet3yP/WTgWpMf1yHIenmbpCTKUrt0R8FUk5J7iav+F/
	N21gs21S9yw3Q00jpmSe2GiP9ygIyNxHziV6q2EQamxnHQxHSav/fEGV
X-Gm-Gg: ASbGncu2BedFmdiICMn68fl9w079DoIF8qfHhVpiilN+v/IMNZUhG5ogN0jJEh0BBon
	fG3JlNye1FihvfhsdsMJ1396brfYGcMVzMC1F68OuAcGVC6BipHF98vXyOVjQ+MsFYR0DxBW4IH
	wVNEU1GgwlAgbK9HxEgx1a/O06kEjI6gc7WFSTToZch7AdjPwAisYDwRWLC1F9WQSBFCZ9syVpN
	AejCWXQzueLHhzq2LlZ1K6XHWIr6nQBDRgXwJCARsJL3rI4g6JU5W00hdmNEe8sjCV0Cc8ZgiE2
	dl5jI1BW/A49Ir45U8nk9I0NPgb1/WLy94mkYx3dZIz/Zk6KVqOs98TuBYhzeq05GByJwLnCovs
	=
X-Google-Smtp-Source: AGHT+IFpZt9xeRACCbkBph/0b80F5G96pQJWNHfEEsFXmXUcl680bXAt70dE6+INj00D/baZ5bvXKw==
X-Received: by 2002:a05:600c:1c19:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4533332161fmr1421105e9.16.1749734913718;
        Thu, 12 Jun 2025 06:28:33 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:33 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 0/6] arm64 support for Milk-V Duo Module 01 EVB
Date: Thu, 12 Jun 2025 15:28:08 +0200
Message-ID: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062836_105847_FFF0ED31 
X-CRM114-Status: GOOD (  18.43  )
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

Changelog:
v8:
- moved sdhci0_cfg and uart0_cfg pinctrl nodes from module into board .dtsi
- dropped Inochi's RB tags from the patches affected by above changes
v7:
- dropped all reset stuff again; it will come independently in [5] and is
  fully compatible;
- rebase onto sophgo [6] for-next (3a8cef361be5) (almost v6.16-rc1)
v6:
- rebase onto sophgo/for-next (108a76779829)
- dropped first patch refactoring RiscV counterpart (equivalent present in
  sophgo/for-next)
- added cpu_on/cpu_off properties into psci node
- added reset-controller node, compatible comes in [4]
v5:
- PSCI node in DT
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
[4] https://lore.kernel.org/sophgo/20250609230417.620089-1-alexander.sverdlin@gmail.com/
[5] https://lore.kernel.org/all/20250608232214.771855-1-inochiama@gmail.com/
[6] https://github.com/sophgo/linux.git

Alexander Sverdlin (6):
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
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 76 ++++++++++++++++
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 40 +++++++++
 arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 86 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  4 +
 8 files changed, 221 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

-- 
2.49.0


