Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5AECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scEyZMTlLH6mwjsA5sCn5nSp3p4jb0a5uSDw6vi/Yac=; b=AclZ3gFBrNEs6Se8x3wxT6MdQw
	G+Hk/gjadEWYRAeu2M2gYs9S76u0bqA4XC4BVBM8y8V6vnZH1MeCIo4dT9wmNMMHFPBgt70MOMr9U
	iMCR2skxMdkFVeAlfU1hC4vtlhkPcwldGAHE0YFPocDhAuVYVvOIZtPwrx/bAvddb/8k+IGGRz7xj
	AAqJKY48dFkxpr9JROd+he81GDHlBVB/kFUsMgdFB66DcFm1g4Pl6hOJ+exrLo8uW6EIEuCqC0GCG
	6jCv7akNjNa20Ab2i4l1GQneuM6Bk5j1olJbNfpYexUwrDUXqC698ZtqyR+Q0wcurpgRc3A0YLqgv
	3VqnKRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwYk-00000002rkF-1OuY;
	Fri, 15 Aug 2025 15:41:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuAg-00000002XYS-0fuM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 13:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8773A5C67F2;
	Fri, 15 Aug 2025 13:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFA0C4CEEB;
	Fri, 15 Aug 2025 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755263317;
	bh=yEAbtItrMUSwsbmLsQ1h3fvOKuTppfxoHtOpTlKH+bI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=e72r1ZkayaRwLfQ+nLTuFAxrdiNLa1aZYngD9qJdth7uJwXI2YL3T0HQHERtnjNwf
	 DkibBkwfKU3X64RWniNTd3NOLSRuJW62YxTC9WMTBvXyAi60wj+Htnca+SoZoVTNLX
	 o8HtH+IhGZ+BzXRX4g2FSTwpZ/5QNV/Wfb6QDr6DRuW1//Wr9VLWbS3PsOh7s8N4Rb
	 +znL6gijlnoUW95qJyYHmmW+37WBUjC4oaAUZU/v1pV+TGzzral8EUK9ZauTtaV/ZA
	 xzoxYPjJh9iPbRrciypX3GYWERE9FJbwZxLAzwZ9jPXTw5JZAYAh4BUNk+/0t+i4Pw
	 ChyYHH4H0+kKQ==
Date: Fri, 15 Aug 2025 08:08:36 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Alex Elder <elder@riscstar.com>, Stephen Boyd <sboyd@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Alex Elder <elder@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ray Jui <rjui@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
References: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
Message-Id: <175526317070.1748815.1341247491221597696.robh@kernel.org>
Subject: Re: [PATCH v6 0/9] clk: bcm: kona: Add bus clock support, bus
 clocks for BCM21664/BCM281xx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_060838_285172_484EA9D3 
X-CRM114-Status: GOOD (  22.14  )
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


On Wed, 13 Aug 2025 13:00:06 +0200, Artur Weber wrote:
> This patchset does the following:
> 
> - Introduce support for bus clocks. These are fairly similar to
>   peripheral clocks, but only implement policy, gate and hyst.
> 
> - Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
>   and update device tree bindings to match.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v6:
> - Rebase on v6.16
> - Make kona_bus_clk_ops const, add a new commit to make kona_peri_clk_ops const as well
> - Link to v5: https://lore.kernel.org/r/20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com/
> 
> Changes in v5:
> - Pick up Reviewed-by trailer from Krzysztof on patch 3
> - Rebase on v6.14
> - No code changes since v4
> - Link to v4: https://lore.kernel.org/r/20250318-kona-bus-clock-v4-0-f54416e8328f@gmail.com
> 
> Changes in v4:
> - Rename moved CLOCK_COUNT defines to CLK_COUNT to avoid redefinition
> - Squash BCM21664/BCM281xx bus clock DT bindings commits together
> - Link to v3: https://lore.kernel.org/r/20250308-kona-bus-clock-v3-0-d6fb5bfc3b67@gmail.com
> 
> Changes in v3:
> - Fix DT schema example in BCM281xx bus clock bindings
> - Move CLOCK_COUNT defines from dt-bindings header to the driver
> - Fix BCM21664 UARTBx_APB IDs being out of order compared to clock
>   driver
> - Link to v2: https://lore.kernel.org/r/20250303-kona-bus-clock-v2-0-a363c6a6b798@gmail.com
> 
> Changes in v2:
> - Drop prerequisite clock patch
> - Move clock/bcm21664.h dt-bindings header change to dt-bindings patch
> - Add BCM281xx bus clocks
> - Link to v1: https://lore.kernel.org/r/20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com
> 
> ---
> Artur Weber (9):
>       clk: bcm: kona: Move CLOCK_COUNT defines into the driver
>       dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT defines from DT headers
>       dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and BCM281xx bus clocks
>       clk: bcm: kona: Make kona_peri_clk_ops const
>       clk: bcm: kona: Add support for bus clocks
>       clk: bcm21664: Add corresponding bus clocks for peripheral clocks
>       clk: bcm281xx: Add corresponding bus clocks for peripheral clocks
>       ARM: dts: bcm2166x-common: Add matching bus clocks for peripheral clocks
>       ARM: dts: bcm11351: Add corresponding bus clocks for peripheral clocks
> 
>  .../devicetree/bindings/clock/brcm,kona-ccu.yaml   |  49 ++++++-
>  arch/arm/boot/dts/broadcom/bcm11351.dtsi           |  33 +++--
>  arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |  28 ++--
>  drivers/clk/bcm/clk-bcm21664.c                     |  99 ++++++++++++++-
>  drivers/clk/bcm/clk-bcm281xx.c                     | 141 ++++++++++++++++++++-
>  drivers/clk/bcm/clk-kona-setup.c                   | 116 +++++++++++++++++
>  drivers/clk/bcm/clk-kona.c                         |  64 +++++++++-
>  drivers/clk/bcm/clk-kona.h                         |  14 +-
>  include/dt-bindings/clock/bcm21664.h               |  17 ++-
>  include/dt-bindings/clock/bcm281xx.h               |  24 +++-
>  10 files changed, 540 insertions(+), 45 deletions(-)
> ---
> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> change-id: 20250212-kona-bus-clock-4297eefae940
> 
> Best regards,
> --
> Artur Weber <aweber.kernel@gmail.com>
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
 Base: using specified base-commit 038d61fd642278bab63ee8ef722c50d10ab01e8f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/broadcom/' for 20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com:

arch/arm/boot/dts/broadcom/bcm94709.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']






