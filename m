Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C42C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99i9nGarF6fpMJcSsyK/zMOoKgv0iyJOn2gHXdA2a0s=; b=emEy55lB00OGEILxxCXxTTpJyP
	74tCn/jNa+PiwuGOz4SjX+oWMnWsPclzijxLReNLQPAZDtaiv8KkeiK5hVnW2ntpARZOSdXvKYfXj
	qU3lqrk6oJpkwBc4rg63ljmFV7dTOMBAyJmS5zTnuJpnWYJHSqLW/JoN/IYUgJfgKglub5BjoTqxB
	oyXypVtPYZHoydTkkipO8LHHogpiAxR+XGkeXLoiMF/Fms3r5Uf0znwrrwgjAZpWNsDDP0coJhyDy
	zmZkM7RHk6Msk0aVuvjwrY11745LU29Q3U7HeAA5SUQUfLFr3p39xcluCdl0hWNRm5u43NpPSytf/
	ocO0k5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1b1-0000000BJge-0tN8;
	Fri, 28 Feb 2025 14:44:11 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1HO-0000000BFSi-2Nn8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57F7F61F51;
	Fri, 28 Feb 2025 14:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65801C4CED6;
	Fri, 28 Feb 2025 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740752633;
	bh=ajCu9g41SZnPeTte9fd4UeergPTy5SPY1Z6qHX4P4pQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=q3ts9Dl08IFf5rhKdIW+MNOY0rlMe6p4eBaL5wod/m0ILfNKfYjppJPsRR4+1xj4Q
	 J5vIPEt9jvt5fyiT3+hcte/iUh9GvRPgT+ePyod+bGrfUHgUI8sCmp4jNzn6K4vYZX
	 k5JNVEvFDtlvUMEPSx4mAhi2JMVE6VkaVsngwt2YAWaWO1b38DxRdoBPDi5v/XpR5D
	 D6nmjGeZZL/xgRhFbLVtg5ZhQ/dSOICCOyMh/Jj78FBYw6T7FMh20xlBUwxid9qDe3
	 SEUlLXtZxOJe6qxl1sxLG0Nu4gR/9s9XjRJgTuyfUmkywfdzwAAhcSFIQtAOao7rpf
	 XPlCG6RXZXf0g==
Date: Fri, 28 Feb 2025 08:23:51 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Steven Price <steven.price@arm.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
 Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20250227170012.124768-1-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
Message-Id: <174075232481.2756018.16964908012353216483.robh@kernel.org>
Subject: Re: [PATCH 0/9] arm64: dts: imx95: Add support for Mali G310 GPU
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


On Thu, 27 Feb 2025 17:58:00 +0100, Marek Vasut wrote:
> The instance of the GPU populated in i.MX95 is the G310.
> Add support for the GPUMIX reset via simple-reset driver,
> add reset and multiple power domains support into panthor
> GPU driver, add iMX95 GPU support into panthor driver and
> describe the iMX95 GPU in imx95.dtsi DT.
> 
> Marek Vasut (9):
>   dt-bindings: reset: imx95-gpu-blk-ctrl: Document Freescale i.MX95 GPU
>     reset
>   reset: simple: Add support for Freescale i.MX95 GPU reset
>   dt-bindings: gpu: mali-valhall-csf: Document optional reset
>   drm/panthor: Implement optional reset
>   drm/panthor: Implement support for multiple power domains
>   drm/panthor: Reset GPU after L2 cache power off
>   dt-bindings: gpu: mali-valhall-csf: Document i.MX95 support
>   drm/panthor: Add i.MX95 support
>   arm64: dts: imx95: Describe Mali G310 GPU
> 
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  4 +
>  .../reset/fsl,imx95-gpu-blk-ctrl.yaml         | 49 ++++++++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi      | 62 +++++++++++++++
>  drivers/gpu/drm/panthor/Kconfig               |  1 +
>  drivers/gpu/drm/panthor/panthor_device.c      | 79 +++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h      |  8 ++
>  drivers/gpu/drm/panthor/panthor_drv.c         |  1 +
>  drivers/gpu/drm/panthor/panthor_gpu.c         | 12 +--
>  drivers/reset/reset-simple.c                  |  8 ++
>  9 files changed, 219 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml
> 
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> 
> --
> 2.47.2
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250227170012.124768-1-marex@denx.de:

arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: opp_table: $nodename:0: 'opp_table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: opp_table: Unevaluated properties are not allowed ('opp-1000000000', 'opp-500000000', 'opp-800000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /soc/reset-controller@4d810000: failed to match any schema with compatible: ['fsl,imx95-gpu-blk-ctrl']
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpu@4d900000: interrupt-names:0: 'job' was expected
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-valhall-csf.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpu@4d900000: interrupt-names:1: 'mmu' was expected
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-valhall-csf.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpu@4d900000: interrupt-names:2: 'gpu' was expected
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-valhall-csf.yaml#






