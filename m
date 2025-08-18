Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B754CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZfELhmEnwpejxjjlXXyGDvAEpA4IoDFCORz+dzuWrA=; b=FcpEE/z782bNifP4+v28EANmO0
	XMofVPCCccDc4bAakY31ozECzbIL0xCeV7QE9w+ayj6YDrn4dXEuLRlln12zrNuphgOmnuNF0iMkk
	nuSFWbaWyB1ySr56CTw185zbJ9vqGc8U0k8ZZolH1ZWNQMPNzGjvcqxeIBHmRBn0ykDZGTMYpaYy4
	0NB8d4Kuq2YjLkqMByBvena3y75q1JTS8w8eIbo53z3PzUOPDmMaZbooxE5e9F8C0rMXFtUm+JtBw
	g6gDhNZGA/zaCbqrcspVzmthJ261TxKCed/yFCPC2SOHCFTVJ/c/vSBGVqg6pSWbe1hB7sLCxMo40
	iy9SXAEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4xE-00000008Pwj-367b;
	Mon, 18 Aug 2025 18:51:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4XF-00000008KJP-0zwS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 18:24:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06CE55C627A;
	Mon, 18 Aug 2025 18:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCB0C4CEED;
	Mon, 18 Aug 2025 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755541483;
	bh=e0T6uswFPCYymAbe+gdn+JgFiwh+mCDg31acddcY9C8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YyAhz2KfF1h8FYPqMG/TZLyTRI42YbxfLuR/fd/nIXbkFzZwmge1E+g6l47gnf5sC
	 +5lnHt2jA16KJ1RsY8noWIlQDkxDE1jFb13EvoapqzLdmJUiEUs1dlTUPf2owgimgN
	 Fb6iYXKEkRq3clh8TDWaETgufk1gCFPwusdbpavmUhl5tiJCGDXeUWPIBoh0UYBaTp
	 0zRwUdzdeRJqH5XfNwC1KJb0X/Ezm8lnFtR37qDVMosbeU2Le1+TJk0x6yvsi3prKQ
	 viYSLwyNZd6wEAk30hPstCfGUbqmQq1B2a9i43jyS1QD/oqiwWRBnRdjH5byLWr71h
	 i8NF8UVcg1yRw==
Date: Mon, 18 Aug 2025 13:24:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: daniel.lezcano@linaro.org, krzk+dt@kernel.org, rafael@kernel.org, 
 geert+renesas@glider.be, linux-pm@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, mturquette@baylibre.com, 
 linux-kernel@vger.kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
 sboyd@kernel.org, linux-renesas-soc@vger.kernel.org, conor+dt@kernel.org, 
 will@kernel.org, magnus.damm@gmail.com, john.madieu@gmail.com, 
 linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, 
 devicetree@vger.kernel.org, catalin.marinas@arm.com
To: John Madieu <john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250818162859.9661-1-john.madieu.xa@bp.renesas.com>
References: <20250818162859.9661-1-john.madieu.xa@bp.renesas.com>
Message-Id: <175554055722.1719725.13076334498195294379.robh@kernel.org>
Subject: Re: [PATCH v7 0/6] thermal: renesas: Add support for RZ/G3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_112445_354988_0226260A 
X-CRM114-Status: GOOD (  23.00  )
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


On Mon, 18 Aug 2025 18:28:46 +0200, John Madieu wrote:
> This series adds support for the temperature sensor unit (TSU) found on the
> Renesas RZ/G3E SoC.
> 
> The series consists of 5 patches (one of which is not related to the thermal
> framework) that progressively add TSU support as follows:
> - patch 1/6:    adds syscon/regmap support for accessing system controller
>                 registers, enabling access to TSU calibration values
> 
> - patch 2-6/6:  adds dt-bindings, actual driver, DT node, and config symbol.
> 
> Patch 1/6 has been duplicated at [1] in USB series. This series addresses comments
> got from there.
> 
> Changes:
> 
> v1 -> v2
>  * Fix yaml warnings from dt-binding
>  * Update IRQ names to reflect TSU expectations
> 
> v2 -> v3
>  * Remove useless 'renesas,tsu-operating-mode' property
> 
> v3 -> v4
>  * Improve commit messages
> 
> v4 -> v5
>  * Remove useless curly braces on single line-protected scoped guards
> 
> v5 -> v6
>  * Minor typo fix
>  * Constify regmap config in patch 1/5
> 
> v6 -> v7
>  * Update DTS trim priperty name and specifier, updading the documentation
>  accordingly
>  * Refactor main driver: remove spinlock usage, using polling timeout as computed
>  from datasheet. Also use polling for get_temp() while using IRQ for trip-point
>  cross detection, and finally add both runtime and sleep PM support.
>  * Add new patch to update sys #address-cells as trim specifier now requires an
>  offet from sys base
> 
> Regards,
> 
> [1] https://lore.kernel.org/all/20250808061806.2729274-2-claudiu.beznea.uj@bp.renesas.com/
> 
> 
> John Madieu (6):
>   soc: renesas: rz-sysc: Add syscon/regmap support
>   dt-bindings: thermal: r9a09g047-tsu: Document the TSU unit
>   thermal: renesas: rzg3e: Add thermal driver for the Renesas RZ/G3E SoC
>   arm64: dts: renesas: r9a09g047: Add #address-cells property in sys
>     node
>   arm64: dts: renesas: r9a09g047: Add TSU node
>   arm64: defconfig: Enable the Renesas RZ/G3E thermal driver
> 
>  .../thermal/renesas,r9a09g047-tsu.yaml        |  87 +++
>  MAINTAINERS                                   |   7 +
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  49 ++
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/soc/renesas/Kconfig                   |   1 +
>  drivers/soc/renesas/r9a08g045-sysc.c          |   1 +
>  drivers/soc/renesas/r9a09g047-sys.c           |   1 +
>  drivers/soc/renesas/r9a09g057-sys.c           |   1 +
>  drivers/soc/renesas/rz-sysc.c                 |  28 +-
>  drivers/soc/renesas/rz-sysc.h                 |   2 +
>  drivers/thermal/renesas/Kconfig               |   7 +
>  drivers/thermal/renesas/Makefile              |   1 +
>  drivers/thermal/renesas/rzg3e_thermal.c       | 575 ++++++++++++++++++
>  13 files changed, 760 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
>  create mode 100644 drivers/thermal/renesas/rzg3e_thermal.c
> 
> --
> 2.25.1
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
 Base: tags/v6.17-rc1-12-g0a0e0852f3f3 (best guess, 10/11 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250818162859.9661-1-john.madieu.xa@bp.renesas.com:

arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: system-controller@10430000 (renesas,r9a09g047-sys): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas,r9a09g057-sys.yaml#






