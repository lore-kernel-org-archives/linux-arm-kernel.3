Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9EECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 00:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMYi6J2P6Qk8dXo27L7CEnEmhr4ccg1b/UM0f+EhKhA=; b=Lep8pjQap2BjThMqJq+jvVcYFt
	If3O0XGXoX6QqkPBVm6DlCIN5G+TzpmCQ/iMPZQnfLJDwj0a9/rWlrJFCvH+mRLXU+W4WPowqSOSz
	gyqUIWuqDsPHZcf+w6zSdWeD4EW8T+/oWNlN2FUXzo6QF4n8RsaA1bI8DUR/XINkNYTWTBBY078K3
	UtLRA/gvHdgHziQtI3xUNOW5jFD0Mj2/77HVxbJa0WQXj1CX27XWFuO7puYP3cPzmZ3nZR4wIzVeN
	IvJIcRMbtSo8hVEj/jDQ4si8E5ti9S3ere6oLsi5Nsjh7O7Qu2SOkCza3xguZSjG4TGKP/XFeAL4i
	deqjTrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2gX-0000000Fp74-3VW5;
	Thu, 18 Sep 2025 00:39:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2gW-0000000Fp6T-1hTr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 00:39:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 891F16013E;
	Thu, 18 Sep 2025 00:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4ABCC4CEF9;
	Thu, 18 Sep 2025 00:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758155979;
	bh=lsWRCCr4cJw7Y8fW6uKVSRJBfmAICK+6DUVgoOLhAWI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Cm/8kvft8UTa4lNLuOTGIbOqxmKVVgddcNJFpRoJ90f2AnqbPjLJX8caF2JSqKNHQ
	 T59yjojCYh2Q+R5CmMpnqmHx/M85eiICWXQfpclsYzngHXS+o743FEWyYGksW7MMup
	 Zs9NY3d6j6eZl2uPml7gmWxv30+mrjege0qk43aeoy67RAGiSRdVJFNcDqw4RMSVIM
	 p9WeMYZ29+PJIEVr9MsIKblBJci3omXfK3DcVUnfod26JNYQZPGtRJhqOe1KqZE2cX
	 D6FsN1gJHlDn3GcvBqo3m7pGdYGv2+tWGfrHqJsYd6tLnKMlAajEMlGAjoC4dhypXw
	 WwpbL8Tq4HgKA==
Date: Wed, 17 Sep 2025 19:39:35 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, 
 John Garry <john.g.garry@oracle.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ian Rogers <irogers@google.com>, 
 Douglas Anderson <dianders@chromium.org>, Jiri Olsa <jolsa@kernel.org>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
 Ingo Molnar <mingo@redhat.com>, linux-perf-users@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, James Clark <james.clark@linaro.org>, 
 Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Namhyung Kim <namhyung@kernel.org>, 
 linux-renesas-soc@vger.kernel.org, 
 "Liang,  Kan" <kan.liang@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <175815587441.3804411.7556880628074141796.robh@kernel.org>
Subject: Re: [PATCH v4 0/5] arm64: add R8A78000 support
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


On Wed, 17 Sep 2025 05:29:39 +0000, Kuninori Morimoto wrote:
> Hi Geert
> 
> This is v4 of R8A78000 support for Renesas.
> 
> This patch-set adds R8A78000 and Ironhide board support.
> It is based on SDK v4.28.0 or later. It will be released at end of Oct.
> 
> Link: https://lore.kernel.org/r/87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com
> 
> v3 -> v4
> 	- Don't include already applied patches
> 	- separate Cortex-A725AE patch into tools/ID/errata [1/5][2/5][3/5]
> 	- fixup gic reg [4/5]
> 	- move timer node into soc [4/5]
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
> Hai Pham (2):
>   arm64: dts: renesas: Add R8A78000 X5H DTs
>   arm64: dts: renesas: R8A78000: Add initial Ironhide support
> 
> Kuninori Morimoto (3):
>   arm64: cputype: Add Cortex-A725AE definitions
>   arm64: errata: Expand speculative SSBS workaround for Cortex-A725AE
>   tools: arm64: Add Cortex-A725AE definitions
> 
>  arch/arm64/boot/dts/renesas/Makefile          |   2 +
>  .../boot/dts/renesas/r8a78000-ironhide.dts    |  92 +++
>  arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 756 ++++++++++++++++++
>  arch/arm64/include/asm/cputype.h              |   2 +
>  arch/arm64/kernel/cpu_errata.c                |   1 +
>  arch/arm64/kernel/proton-pack.c               |   1 +
>  tools/arch/arm64/include/asm/cputype.h        |   2 +
>  tools/perf/util/arm-spe.c                     |   1 +
>  8 files changed, 857 insertions(+)
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
 Base: tags/next-20250917 (best guess, 3/4 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com:

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
arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: soc (simple-bus): timer: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
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






