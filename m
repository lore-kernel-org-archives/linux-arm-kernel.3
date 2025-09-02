Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11534CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJ22HnFTSkMy9nUsY+Jvm9GXHXO+y0yrb+s3/W6fbIM=; b=AcXS2MZYLLbBCJHs6xUSAeeC1y
	Ew2HHrWWr/PVruxQCvId1CdeteN0rXO69WbCBg9fvTTAUuWA+hv5dfPL8iqzqBgqkKDKX+eYmjCn1
	8EmBgVsuqGlPWLQ+7fp2ptzYXRGuV5ruP7pduOYJhK+Pcu/+09AToyWILm879QfEM8N/7K+L1qAKv
	qf/qOc+QoKIM1kyiBuIFXU3MJyL9sIHtFd0yzSijzTNg9L6/3Vat9J5pRqKMszFP8Xw+KH2Lh4GdZ
	XZAyIj8QhtoyL7TYG30EnA0qKkPVeL+XtwidJkQ5Gv5c2unb7uKNjSugookzMxPsGoDBo8r2lsqie
	AYlw5YlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWOO-00000001adI-3YSp;
	Tue, 02 Sep 2025 19:10:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQu7-0000000HaIy-1Zqb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 232664408A;
	Tue,  2 Sep 2025 13:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A072BC4CEFA;
	Tue,  2 Sep 2025 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819111;
	bh=nQUVR7QuD0wO5Rmr1nt0LUWraj/tUYvMI5niL2joU/o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RZ8f6yx+IGqsgI9sgMl2O96dV0/sWGFZrJ3FAu8l1KC5NFP5BBaatI7gV6eW1xcoS
	 4ehJ+GTF+Zf/Qk3uIdPTSch89U2fxk3jsNALl4c7RRfVfnRs4RMxaw5hGRdtBsCetb
	 8lhU8mOSu9/zcWkML8ioB13IWGyJXeC/Ortl0PfXTRyLNvGtgInNvskYec3lcjUScj
	 PF+zTIlT9oMSPRcHkp7D9eDEGrEXFpA+x7vpMYNpN45h2qKs6pov2CxlVhqU00yuz6
	 Ff4UFAe07D7E9l1KfEInQS7/ajpTHyRsL72nPfShxaTw1AeW19i7z+irUNs+NXpO2m
	 t6Ebn6071UFMw==
Date: Tue, 02 Sep 2025 08:18:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wens@csie.org, kuba@kernel.org, mripard@kernel.org, davem@davemloft.net, 
 netdev@vger.kernel.org
To: Conley Lee <conleylee@foxmail.com>
In-Reply-To: <tencent_C4014DA405A96C2E1E7FEFCC050BA56D5B08@qq.com>
References: <tencent_C4014DA405A96C2E1E7FEFCC050BA56D5B08@qq.com>
Message-Id: <175678731505.878234.8586954068434331429.robh@kernel.org>
Subject: Re: [PATCH 2/2] net: ethernet: sun4i-emac: enable dma rx in sun4i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061831_456653_60065E57 
X-CRM114-Status: GOOD (  14.98  )
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


On Sat, 30 Aug 2025 15:50:00 +0800, Conley Lee wrote:
> The current sun4i-emac driver supports receiving data packets using DMA,
> but this feature is not enabled in the device tree (dts) configuration.
> This patch enables the DMA receive option in the dts file.
> 
> Signed-off-by: Conley Lee <conleylee@foxmail.com>
> ---
>  arch/arm/boot/dts/allwinner/sun4i-a10.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
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
 Base: tags/next-20250829 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/allwinner/' for tencent_C4014DA405A96C2E1E7FEFCC050BA56D5B08@qq.com:

arch/arm/boot/dts/allwinner/sun4i-a10-jesurun-q5.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-a1000.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-cubieboard.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-itead-iteaduino-plus.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-pcduino.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-marsboard.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-hackberry.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-ba10-tvbox.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
arch/arm/boot/dts/allwinner/sun4i-a10-pcduino2.dtb: ethernet@1c0b000 (allwinner,sun4i-a10-emac): Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#






