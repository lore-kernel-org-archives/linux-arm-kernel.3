Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D05FC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 18:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eY5jcIBsf0b/NcKS1qmY9rRfEEXRP/Tca7u8ZAMu2m8=; b=veDXO3JFzGitwpzuLujiJPJfCC
	ilvvl4vfNbf5Yvi0lE50vJiUpN8a/zy9Yu7SyED5Uoakc++f1vdrGWLuyVvcuSIFAgUevOEtArp1/
	r76EaTsC3cxnUJQG/+4LpGMJuGuqDF+Vpl5O/VrbvLeORpvZVfc1HoaerAOT7T2IMNB6vSo+EwN7+
	FkW4d+pKcTrhi5H0oq1hGEOv9gsJgeMvyE5GQu3m0wfBU1iR4zYCkEI6gSiLOlIe6xF8F4pgUiGid
	DVKgcjTSXkZ7Reqnm75p1uFaNuP+70xRekmZOCmAZ2AmTLupzpACpcNlUa65lCT7Bn3RyeXfLBhC0
	6DfLjNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tttBv-00000000UnP-0tvf;
	Sun, 16 Mar 2025 18:58:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tttAD-00000000UMm-38L9;
	Sun, 16 Mar 2025 18:56:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so12133395e9.0;
        Sun, 16 Mar 2025 11:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151404; x=1742756204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eY5jcIBsf0b/NcKS1qmY9rRfEEXRP/Tca7u8ZAMu2m8=;
        b=Ee433KexuXGEwUB8JsJbVRsvXtVd4GBMkyjwZ5zpihOLk/ZsxGmhWYeTy9sVZudvEb
         Z9ut7wO4+bTul3xM7KPSGIIvkyuOzsiDHG20mITylKNf609xkoN1Urz9Gj/6h70ndNZ3
         vpiEjYP/Cq5rqljdkheyUVtDgm9jswKPf8ZbFsLG7eKKj9JfHmYYwv83n3UWcO8Ktwds
         +JT+yButwyue1wu7Xwrv1lajz3I/vnoYm6GjmAwk0nmmMYoIJNlMT5yyQ0PC1flmKEPP
         bnX0ZTxccwRAzRxCkLIlG+iqKe2Yp5dPiME93T8EWjqIhJ8h3FSq8b/su1ncu91qtNAf
         9Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151404; x=1742756204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eY5jcIBsf0b/NcKS1qmY9rRfEEXRP/Tca7u8ZAMu2m8=;
        b=TlRb4M3lNXj9ZToIiMLKvZj5RXbvqZMoINL5aAOwmgQtsW9ZSYyRzyF+c5WaPF1P4b
         YFH6X313KxHC7baYzTGY+dsYFyJczjyQQWf0RYF+Df4p8JPthkcA4WQnki5o1IUkLb2D
         gEMfCDB9U5KIyKlRUJVBEypU2vrLS6QIbs5gpjIXvalzqdKYCAc+D+YTeJK+qcBKSphx
         hyTXgfJuoqCYhCr5kETANGofKWj4Qz7hdix0+IUlSNqpNIkKQf/BIi9NEiRg7A06yHCR
         gxzfKwkBQrPVO8Vhv4uGT0Xe8PCMqLJ2V6CBOgDkYFJufKetCfc4ZARL5jERGMxfOSRO
         IIEA==
X-Forwarded-Encrypted: i=1; AJvYcCVtO+28acKH62SJVWBbAoYvnDo2cV8pAlwLUecaF96p20oa+clNbTMtt6g45NV4g06FQRiwQrMxl9IR5Vw=@lists.infradead.org, AJvYcCXxiiFGUYq33opnRdVBAdL43qj9S6Zjky9cgDYZ+RXVd9rruk1VioMUSpD9VEvtGBZyd3Cc74WC1/HeZAbh5oio@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/OT4bU+zlfyT2ut9XpHtYBuO7k+8cMabMy02TEHP7mv8+dekX
	qvzRA/ccbdxvWL2UWNk29d6CnM2YtVgt4zN1YRQMeXuyVmSWHbM4
X-Gm-Gg: ASbGncu6+80RMBlnyVa16dlVymwKzMbnm4SHy50vZ2vR0GmGpRzhzeeIFgjJVbz2/7u
	3lrOW6GnWMx2607MAj8tf8ekcE35HHEe8J1TkxEa9YScHHYrJNN/fXBbEVonl8OoTFT88XbmABJ
	QaXrrNLwy/6Tix5Sl/7s1/+GEniBzmK85+R4EB3TytMIbWAvC+h2tyt9l/LzV41toewqGORsVLo
	rBAs1i5QsfNzTLmdRKA7c0Mr4yv7DLWSJFKwb/qos+H5cq8KMX9rCdO4rFsi7uF6cRtFEfMSAt+
	snkOHU1CNHQri03fEzw5qjpdKuIuqZFSgrBkrJaIusHwrcXVpQ5jNNTieR5AJb/EKskF
X-Google-Smtp-Source: AGHT+IFXrgw3XrN+TCApbWNShZJAs8R17s1faa0pLtE35kNdsan/Kt1j2yFVTODC5X/sjE+CaW5y1w==
X-Received: by 2002:a05:600c:a21b:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43d1ef4b09amr110453495e9.7.1742151403732;
        Sun, 16 Mar 2025 11:56:43 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:43 -0700 (PDT)
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
Subject: [PATCH v5 0/7] arm64 support for Milk-V Duo Module 01 EVB
Date: Sun, 16 Mar 2025 19:56:30 +0100
Message-ID: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_115645_790296_10566F17 
X-CRM114-Status: GOOD (  16.38  )
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
 arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 81 +++++++++++++++++
 arch/arm64/configs/defconfig                  |  4 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  5 +
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  5 +
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 .../boot/dts/sophgo/cv18xx-cpu-intc.dtsi      | 54 +++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        |  5 +
 14 files changed, 309 insertions(+), 70 deletions(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi

-- 
2.48.1


