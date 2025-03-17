Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C454C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzSzPhYHFCk1AjOl744C9OZinF0iGq9pa64r0FLa73Q=; b=jQCshmOgbOfZAVmLT8EjkRi+xT
	8oXCN+Dna0ep0svbRFWnyuHbPysJg4+mU4SqRh8z9IRy3LHcMC2nWsafDyEMjW3cMfSHXk37ZLvSM
	PMvhUtgbxQ+1W7TAxmXMI0qlakY4FfzNSf/trt5XhwT2LS64LM0jC6/EHKApgkaRFtaX8CqIB0kob
	FvMHyjLJ4V8pRWQJXlidOBsI9/+YASm+Kdrp4nm37sv1/fWhuTG+qd8ps9uZLzJpZggele0Z8xMxB
	cSixFpwCWVmFHqb6N9X1Wm9nFhk8rcy6V84oR5MNiDBzLy2Wcfm4Lkupq///NC0dI7tlMLc6kySJW
	vYzryZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBLd-00000002uLN-0gK5;
	Mon, 17 Mar 2025 14:21:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBIY-00000002tfN-1vTA;
	Mon, 17 Mar 2025 14:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 17D2DA44255;
	Mon, 17 Mar 2025 14:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24269C4CEE3;
	Mon, 17 Mar 2025 14:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742221113;
	bh=IM+geYv9I4lQxYv0svGAAXnD8Yh3yBQXBX8Re0+OfXM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KRliIwH7lSQSVNuW+ytxs9t6HzgpmCdyYfcBuuG66XAYWMXDfzzPeYg9smYtzYSJJ
	 EqT3VAUhiER8BL3KBHhXTobwuDcW4YO3sDtbxbQNuk1gdlv0X5Pz7F3nhdGLoKdy/F
	 ynbGCHoE/8sXyWvmBbjPPE1ei2m1zElzgiEt8MElHokxrirbwDTYsBmzV1IRpGESr9
	 obhvyRMy4SWlp7XvhAGSnp9CtEl3Dtx9CcA/+mrubYkjxd7pelEXVqtylWrUsLS3C6
	 QamIHJAMQ/j5QUGXn4YxZTJDCDkvlQ+GWqueeU+cxLg5V6RmfZOYfa9T4Mxx67HyOq
	 MabOTKrqjVelQ==
Date: Mon, 17 Mar 2025 09:18:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: sophgo@lists.linux.dev, Will Deacon <will@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
 Chen Wang <unicorn_wang@outlook.com>, soc@lists.linux.dev, 
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@gmail.com>, 
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
 Palmer Dabbelt <palmer@dabbelt.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
Message-Id: <174221818050.3957183.18032992749339066585.robh@kernel.org>
Subject: Re: [PATCH v5 0/7] arm64 support for Milk-V Duo Module 01 EVB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_071834_623938_1921678F 
X-CRM114-Status: GOOD (  24.66  )
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


On Sun, 16 Mar 2025 19:56:30 +0100, Alexander Sverdlin wrote:
> This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
> been chosen because the upstream toolchain can be utilized.
> 
> Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
> peripherals with an addition of ARM64 core. Therefore it would be
> beneficial not to copy-paste the peripherals' device-tree, but rather split
> the most suitable riscv DT into ARCH-specific and peripherals parts and
> just include the latter on the arm64 side.
> 
> This series adds the device-tree for Milk-V Duo Module 01 EVB, which
> in turn contains Milk-V Duo Module 01 (separate .dtsi) on it, which has
> SG2000 SoC inside (separate .dtsi).
> 
> This series has been tested with Sophgo-provided U-Boot binary [2]: it
> boots from SD card; pinctrl, serial, GPIO drivers are functional (same
> as for RiscV-based CV18xx SoCs).
> 
> Partial SoC documentation is available [3].
> 
> This series lacks the support of:
> - USB
> - Audio
> - Ethernet
> - WiFi
> - Bluetooth
> - eMMC
> - Video
> 
> Changelog:
> v5:
> - PSCI node in DT
> v4:
> - minimized patch 1/7 (cleanups dropped)
> - cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi in
> patch 1/7
> v3:
> - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
> were moved into cv18xx-intc.dtsi to reduce code duplication;
> v2:
> - dropped all patches related to the new reboot driver and corresponding DT
> and bindings;
> - grouped DT-related and config-related patches together;
> - added patch moving sophgo.yaml from riscv into soc (to share it with
> ARM); added SG2000 SoC and Milk-V Duo Module 01 EVB into it;
> - other changes are documented in the corresponding patches;
> 
> [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> 
> Alexander Sverdlin (7):
>   riscv: dts: sophgo: cv18xx: Move RiscV-specific part into SoCs' .dtsi
>     files
>   dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add
>     SG2000
>   arm64: dts: sophgo: Add initial SG2000 SoC device tree
>   arm64: dts: sophgo: Add Duo Module 01
>   arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
>   arm64: Add SOPHGO SOC family Kconfig support
>   arm64: defconfig: Enable rudimentary Sophgo SG2000 support
> 
>  .../{riscv => soc/sophgo}/sophgo.yaml         |  7 +-
>  arch/arm64/Kconfig.platforms                  |  6 ++
>  arch/arm64/boot/dts/Makefile                  |  1 +
>  arch/arm64/boot/dts/sophgo/Makefile           |  2 +
>  .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
>  .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 81 +++++++++++++++++
>  arch/arm64/configs/defconfig                  |  4 +
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  5 +
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  5 +
>  arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
>  .../boot/dts/sophgo/cv18xx-cpu-intc.dtsi      | 54 +++++++++++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi        |  5 +
>  14 files changed, 309 insertions(+), 70 deletions(-)
>  rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)
>  create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi
> 
> --
> 2.48.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/sophgo/' for 20250316185640.3750873-1-alexander.sverdlin@gmail.com:

arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: psci: 'cpu_off' is a required property
	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: psci: 'cpu_on' is a required property
	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#






