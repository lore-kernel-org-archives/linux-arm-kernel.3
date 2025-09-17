Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8E9CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2HnbDh5+Gwop4XwI3LP/PM5O+qRBlOr4c13q6+74tk=; b=osX/gZBvT+QpJaik/Wcn2W/cF1
	3pWwj6GIBuWK6mH4q2O4DgqpiMrYFcIgIi3C7uwUecP/gjLwtDY6IHuvzsC6pbRNBbDxZ6xIJtABS
	5lGgqkVVD3Qi9zZck64anwAOKJ8zsbKztwja6jhMptkfffVEuSwNG6Kg/MwLAmKvyheRToWp93hFt
	1GFEPWz2EbdUqfDSeRssIHE86SiT9uuI7UJ5rJffO8/a3wiVIzHtAyxDAyhA8eJLHyEg0+6+FEPaf
	497ShemOWeOf8ibeXr1uKbj8tjzEuu5FT/aNab4z5V/9dirxKWlg5SIlY9eEpU9zBAGqzGywk5YwG
	RZpr8p+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyteN-0000000CUyN-0PRB;
	Wed, 17 Sep 2025 15:00:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyteK-0000000CUwZ-3P9h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:00:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9BE540882;
	Wed, 17 Sep 2025 15:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E347FC4CEE7;
	Wed, 17 Sep 2025 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758121247;
	bh=6DeGizyZIA3afK/7T64SltvBMy2M5KKOzGhFBzbG51s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IC9AdMtH1NTKJCgNfV4PjeWazIArN918M3iAYzDdZpCmSyiEcn4HY3iW1a9R1NOc6
	 V39uH648CYQt62LMyPJVQzzXM0QipgshekPUUa1xVTylOPo5kYYrovdLgBtT3u2hFP
	 5+3QMBeMWr929lgV4/h9xnO+t9niPF9ohtxhXD+VTWmXasrVlw8IThwj8V7IMmTiQJ
	 dKLf57vsY+KSzt2nU1CkpJ6uhBGrrzTykLkLalks4r7tJrMnS7035FMljS8u1Q5BaK
	 tPFUyG9ns7wbxst3QY3HUSGm/6ti/WpBUE4apzIH+HW7dYgdgcFb9smcBgY4sgr92+
	 ZZhyntTB38ncQ==
Date: Wed, 17 Sep 2025 10:00:46 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-perf-users@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
 Marc Zyngier <maz@kernel.org>, linux-renesas-soc@vger.kernel.org, 
 Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, "Liang,  Kan" <kan.liang@linux.intel.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>, Leo Yan <leo.yan@linux.dev>, 
 Mike Leach <mike.leach@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 linux-arm-kernel@lists.infradead.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <175812100931.2051995.11690526615460455453.robh@kernel.org>
Subject: Re: [PATCH v3 0/6] arm64: add R8A78000 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_080048_908586_F49A426C 
X-CRM114-Status: GOOD (  21.11  )
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


On Tue, 16 Sep 2025 02:37:50 +0000, Kuninori Morimoto wrote:
> 
> Hi Geert
> 
> This is v3 of R8A78000 support for Renesas.
> 
> This patch-set adds R8A78000 and Ironhide board support.
> It is based on SDK v4.28.0 or later. It will be released at end of Oct.
> 
> Link: https://lore.kernel.org/r/87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com
> 
> v2 -> v3
> 	- Add Reviewed-by from Geert [1/6]
> 	- Add cortex-a720ae patches [3/6][4/6]
> 	- Drop enable-method = "pcsi" [5/6]
> 	- Tidyup node name controller -> cache-controller [5/6]
> 	- Remove cache-unified from L2 [5/6]
> 	- add dummy-clk-sgasyncd16 for scif [5/6]
> 	- re-add clock-frequency on scif_clk [5/6]
> 	- Tidyup GIC comments [5/6]
> 	- Tidyup GIC regs [5/6]
> 	- use "renesas,scif-r8a78000" instead of "renesas,rcar-gen5-scif" [5/6]
> 	- Tidyup Subject [6/6]
> 	- Tidyup Makefile position [6/6]
> 	- Add explanation why it needs "maxcpus=1" [6/6]
> 	- 518MB -> 518MiB on memory [6/6]
> 	- 16666666 -> 16666600 on extal_clk [6/6]
> 	- Drop comment from hscif0 [6/6]
> 
> v1 -> v2
> 	- Add Krzysztof's Acked-by on [1/4]
> 	- Tidyup "cache" properties on [3/4]
> 	- Add "clock-" prefix on fixed-clock [3/4]
> 	- remove un-needed clock-frequency [3/4]
> 	- use "-" instead of "_" on dummy-clk-sgasyncd4 [3/4]
> 	- use "0" instead of "0x0" for gic [3/4]
> 	- cleanup "bootargs" [4/4]
> 
> 
> Duy Nguyen (1):
>   soc: renesas: Identify R-Car X5H
> 
> Hai Pham (2):
>   arm64: dts: renesas: Add R8A78000 X5H DTs
>   arm64: dts: renesas: R8A78000: Add initial Ironhide support
> 
> Kuninori Morimoto (3):
>   dt-bindings: soc: renesas: Document R-Car X5H Ironhide
>   arm64: cputype: Add Cortex-A720AE definitions
>   dt-bindings: arm: cpus: Add Cortex-A720AE
> 
>  .../devicetree/bindings/arm/cpus.yaml         |   1 +
>  .../bindings/soc/renesas/renesas.yaml         |   6 +
>  arch/arm64/boot/dts/renesas/Makefile          |   2 +
>  .../boot/dts/renesas/r8a78000-ironhide.dts    |  92 +++
>  arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 756 ++++++++++++++++++
>  arch/arm64/include/asm/cputype.h              |   2 +
>  arch/arm64/kernel/cpu_errata.c                |   1 +
>  arch/arm64/kernel/proton-pack.c               |   1 +
>  drivers/soc/renesas/Kconfig                   |  12 +
>  drivers/soc/renesas/renesas-soc.c             |  12 +
>  tools/arch/arm64/include/asm/cputype.h        |   2 +
>  tools/perf/util/arm-spe.c                     |   1 +
>  12 files changed, 888 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi
> 
> --
> 2.43.0
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.17-rc5-68-g945f50036169 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com:

arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
	from schema $id: http://devicetree.org/schemas/cache.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000 (renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,scif-r8a78000', 'renesas,scif'] is too long
	['renesas,scif-r8a78000', 'renesas,scif'] is too short
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s72100']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s9210']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g044']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
	'renesas,scif-r9a09g057' was expected
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a09g047', 'renesas,scif-r9a09g056']
	'renesas,rcar-gen1-scif' was expected
	'renesas,rcar-gen2-scif' was expected
	'renesas,rcar-gen3-scif' was expected
	'renesas,rcar-gen4-scif' was expected
	'renesas,rcar-gen5-scif' was expected
	'renesas,scif-r9a07g044' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,scif-r8a78000', 'renesas,scif'] is too long
	['renesas,scif-r8a78000', 'renesas,scif'] is too short
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s72100']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s9210']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g044']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
	'renesas,scif-r9a09g057' was expected
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a09g047', 'renesas,scif-r9a09g056']
	'renesas,rcar-gen1-scif' was expected
	'renesas,rcar-gen2-scif' was expected
	'renesas,rcar-gen3-scif' was expected
	'renesas,rcar-gen4-scif' was expected
	'renesas,rcar-gen5-scif' was expected
	'renesas,scif-r9a07g044' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0708000 (renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,scif-r8a78000', 'renesas,scif'] is too long
	['renesas,scif-r8a78000', 'renesas,scif'] is too short
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s72100']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s9210']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g044']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
	'renesas,scif-r9a09g057' was expected
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a09g047', 'renesas,scif-r9a09g056']
	'renesas,rcar-gen1-scif' was expected
	'renesas,rcar-gen2-scif' was expected
	'renesas,rcar-gen3-scif' was expected
	'renesas,rcar-gen4-scif' was expected
	'renesas,rcar-gen5-scif' was expected
	'renesas,scif-r9a07g044' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c070c000 (renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,scif-r8a78000', 'renesas,scif'] is too long
	['renesas,scif-r8a78000', 'renesas,scif'] is too short
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s72100']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s9210']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g044']
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
	'renesas,scif-r9a09g057' was expected
	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a09g047', 'renesas,scif-r9a09g056']
	'renesas,rcar-gen1-scif' was expected
	'renesas,rcar-gen2-scif' was expected
	'renesas,rcar-gen3-scif' was expected
	'renesas,rcar-gen4-scif' was expected
	'renesas,rcar-gen5-scif' was expected
	'renesas,scif-r9a07g044' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,hscif-r8a78000', 'renesas,hscif'] is too short
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
	'renesas,rcar-gen1-hscif' was expected
	'renesas,rcar-gen2-hscif' was expected
	'renesas,rcar-gen3-hscif' was expected
	'renesas,rcar-gen4-hscif' was expected
	'renesas,rcar-gen5-hscif' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0714000 (renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,hscif-r8a78000', 'renesas,hscif'] is too short
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
	'renesas,rcar-gen1-hscif' was expected
	'renesas,rcar-gen2-hscif' was expected
	'renesas,rcar-gen3-hscif' was expected
	'renesas,rcar-gen4-hscif' was expected
	'renesas,rcar-gen5-hscif' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0718000 (renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,hscif-r8a78000', 'renesas,hscif'] is too short
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
	'renesas,rcar-gen1-hscif' was expected
	'renesas,rcar-gen2-hscif' was expected
	'renesas,rcar-gen3-hscif' was expected
	'renesas,rcar-gen4-hscif' was expected
	'renesas,rcar-gen5-hscif' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c071c000 (renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,hscif-r8a78000', 'renesas,hscif'] is too short
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
	'renesas,rcar-gen1-hscif' was expected
	'renesas,rcar-gen2-hscif' was expected
	'renesas,rcar-gen3-hscif' was expected
	'renesas,rcar-gen4-hscif' was expected
	'renesas,rcar-gen5-hscif' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#






