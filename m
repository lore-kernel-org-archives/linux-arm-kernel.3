Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D986E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9PXFgx4gZyQu7VC9XVvNG6nJyL8x1+v0m94l5VvDM0=; b=klma4PFLhvDhJtYx1wLruWJ8F6
	EN+ItjwZN9F9+DVrMA9DOsTXcVE/xuiL3LcnCD5I3iVa711vMYMetQJQP4i3aEV3bublYSpLBFM6m
	vy4qM+0AZ0DFdKsHNx55wHmAe0BTfoFe+tC6vIYccKk0L5s8AhNOVnfa5a/bVlAS9c330NgIOYblD
	tKzPWo0dwFL5ool8BqkOTlo72Xs2JKp9bsMjg6P1+kl8pVaU5R9hhOHbIdTFD9cJymWHD+R+aZs+p
	vIXVpxgyBQHzCE6NPBvK0jU88zGqWxtWCWNWOyUS432mdaOZ4KoXcCubrhDZij/2uM3zS2wyHeSX+
	BGI63p7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNE1Z-0000000Abli-2ytP;
	Mon, 16 Dec 2024 16:32:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDyJ-0000000Ab1V-3IUL;
	Mon, 16 Dec 2024 16:29:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 18ADF5C5ADF;
	Mon, 16 Dec 2024 16:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0439C4CED0;
	Mon, 16 Dec 2024 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734366567;
	bh=WswVB2hWDdgnFxBdwaN5lvCh0kjPGoHeFg1ZvRO82ZI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=goyJCFvzUTX39mOU8MHSaApke2XyeTfNV6Q146PhWb1vXEyAm/vIcuEYSX+TivDlm
	 vR5zdoblHDb6unXxksGbUZaEmzSFCjvOMS3hEuQtnQ2ARS5oruE+tg+LgW3rX4jrt9
	 YXVnEE/kNjHuTUZH7nM6Hay2mTOTj0Fg+xRIIfRKC3w1Tr+G2UyWEfgiYJJmvhpCc8
	 uV2y0loOiftcx8ARDlOlXtqeQydoPMRBRw/1UgBw6/oR2XM66lpLyHDkcTjPUYcRkF
	 4cfCiacfWVBBbWJYJ2Sy+WwmV5ZLO+L1r8c5Og9u4CsTavf3djCk/pYAcsYfhU/M6n
	 3nux341egmGSg==
Date: Mon, 16 Dec 2024 10:29:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, andy.yan@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, 
 rfoss@kernel.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, algea.cao@rock-chips.com, 
 conor+dt@kernel.org, heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
 hjc@rock-chips.com, cristian.ciocaltea@collabora.com, 
 l.stach@pengutronix.de
To: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20241216031225.3746-1-damon.ding@rock-chips.com>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
Message-Id: <173436598997.265439.13057492933592323468.robh@kernel.org>
Subject: Re: [PATCH v2 00/11] Add eDP support for RK3588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_082927_916549_A9254115 
X-CRM114-Status: GOOD (  16.53  )
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


On Mon, 16 Dec 2024 11:12:14 +0800, Damon Ding wrote:
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board.
> 
> Patch 1~3 are the RK3588 eDP support of Rockchip analogix_dp driver.
> Patch 4   is the eDP mode support of samsung hdptx phy driver.
> Patch 5~6 are the Rk3588 eDP support of Aanalogix DP driver. Add phy
>           interfaces is to configure the HDMI/eDP TX Combo PHY.
> Patch 7~8 are the renaming of hdptxphy node. It is not only used by
>           HDMI display but also for the eDP display.
> Patch 9   is the addition of RK3588 eDP0 node.
> Patch 10  is to enable the eDP0 display on RK3588S EVB1 board.
> Patch 11  is to add the eDP1 related nodes for RK3588 SoC.
> 
> Damon Ding (11):
>   drm/rockchip: analogix_dp: Use formalized struct definition for grf
>     field
>   dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
>   drm/rockchip: analogix_dp: Add support for RK3588
>   phy: phy-rockchip-samsung-hdptx: Add support for eDP mode
>   drm/bridge: analogix_dp: add support for RK3588
>   drm/bridge: analogix_dp: Add support for phy configuration.
>   dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
>     HDMI TX Controller
>   arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
>   arm64: dts: rockchip: Add eDP0 node for RK3588
>   arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
>   arm64: dts: rockchip: Add nodes related to eDP1 for RK3588
> 
>  .../rockchip/rockchip,analogix-dp.yaml        |   1 +
>  .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   2 +-
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  33 +-
>  .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   2 +-
>  .../rockchip/rk3588-coolpi-cm5-genbook.dts    |   2 +-
>  .../boot/dts/rockchip/rk3588-evb1-v10.dts     |   2 +-
>  .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  55 +
>  .../rk3588-friendlyelec-cm3588-nas.dts        |   2 +-
>  .../arm64/boot/dts/rockchip/rk3588-jaguar.dts |   2 +-
>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |   2 +-
>  .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588-rock-5b.dts      |   2 +-
>  .../boot/dts/rockchip/rk3588-tiger-haikou.dts |   2 +-
>  .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  50 +
>  .../dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 +-
>  .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  |   2 +-
>  .../boot/dts/rockchip/rk3588s-odroid-m2.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |   2 +-
>  .../boot/dts/rockchip/rk3588s-rock-5a.dts     |   2 +-
>  .../boot/dts/rockchip/rk3588s-rock-5c.dts     |   2 +-
>  .../drm/bridge/analogix/analogix_dp_core.c    |   5 +
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  56 ++
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 149 ++-
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 937 +++++++++++++++++-
>  include/drm/bridge/analogix_dp.h              |   3 +-
>  26 files changed, 1223 insertions(+), 100 deletions(-)
> 
> --
> 2.34.1
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


New warnings running 'make CHECK_DTBS=y rockchip/rk3588-coolpi-cm5-evb.dtb rockchip/rk3588-coolpi-cm5-genbook.dtb rockchip/rk3588-evb1-v10.dtb rockchip/rk3588-friendlyelec-cm3588-nas.dtb rockchip/rk3588-jaguar.dtb rockchip/rk3588-orangepi-5-plus.dtb rockchip/rk3588-rock-5b.dtb rockchip/rk3588-tiger-haikou.dtb rockchip/rk3588s-coolpi-4b.dtb rockchip/rk3588s-evb1-v10.dtb rockchip/rk3588s-indiedroid-nova.dtb rockchip/rk3588s-odroid-m2.dtb rockchip/rk3588s-rock-5a.dtb rockchip/rk3588s-rock-5c.dtb' for 20241216031225.3746-1-damon.ding@rock-chips.com:

arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: edp@fdec0000: resets: [[28, 469], [28, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: edp@fdec0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'reset-names', 'resets' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fded0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fded0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fded0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fded0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fded0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fded0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: edp@fdec0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: edp@fdec0000: resets: [[31, 469], [31, 468]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: edp@fdec0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fded0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fded0000: clock-names:2: 'grf' was expected
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fded0000: resets: [[31, 471], [31, 470]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fded0000: reset-names: ['dp', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#






