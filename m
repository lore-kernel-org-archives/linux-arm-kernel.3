Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F77C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a98oAuM8OrENFrTwu5iQDjlNYdQwmhmq8BEwUfJ3B1U=; b=2Xy4I1OwYc2WtQ6ME/ZzGCeMVv
	Z9F5Zo65zU0PyIY6R/yBTlxwruivJKgUWQ5arURqqfKFqK/bGNX3IE5oSz+ngZ0ks1qGQTVaE/SiQ
	+/k0aaFbB81H7ueuTTgS7iJMis0RZpNW8tBU3bfNHMqR5yN9UUKMBcrEXYZRmbR1UmeI60xv3Kfa9
	0tK+8vvAFasi0k6U9VF2E/S5Yw3vE35LVJlPkP8MqccPJRhQY8ntaOHDDep8Qst0K1yb5761VS08A
	VTShwA+oX8kuJJ2pCiJUxLBp1O7lDvSaj63kz45yOtNpDLUzFZgg4OmnvEjezOsqzU3WoLP9PEyC+
	f0YV+l6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjP9-0000000FvQ0-0wH6;
	Wed, 21 May 2025 13:22:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHizW-0000000FqhA-3F4P;
	Wed, 21 May 2025 12:56:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D47B7629E7;
	Wed, 21 May 2025 12:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE17C4CEE4;
	Wed, 21 May 2025 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747832173;
	bh=IM7NTdSfeNt5Q2RVCsl9ffDdJiDnlEFyeiTU0lAfpCs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=b4UYdYVkYO+JRCAhVHklYeNAi7X639NQpXT9Y9G3vxPGZYKSWq1a4XNjHrEVEQa1U
	 PJzqwccwlvtcO0SYsn6v+/VCdnE//jJ8NXxJ/mLwRVmM5oDLow6110V516u4eTvmOV
	 Vxq4gfFJMlO/9fv+drEvm81rQfdEb2jhgcBv4DqMuAumJ1QMsKuE+DrTo29S+T8kQr
	 mD8sAA3rusU861pvLsGrRrc4O1LWAtpg64RoAcahG3SqiFpirEnKP9qekOk5DD2NgN
	 hMwoFyb9EfIeUjyNXravtbgKQ/IAQBhwq1mS6GLMsJc6oiEYRomiotNfALSdd3dVVS
	 ALu8ypT/j523g==
Date: Wed, 21 May 2025 07:56:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, conor+dt@kernel.org, 
 tudor.ambarus@linaro.org, krzk+dt@kernel.org, miquel.raynal@bootlin.com, 
 mwalle@kernel.org, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, 
 vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, 
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com, 
 devicetree@vger.kernel.org, richard@nod.at
To: Manikandan Muralidharan <manikandan.m@microchip.com>
In-Reply-To: <20250521070336.402202-1-manikandan.m@microchip.com>
References: <20250521070336.402202-1-manikandan.m@microchip.com>
Message-Id: <174783212327.3233239.2531825211332843471.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] Read MAC Address from SST vendor specific SFDP
 region
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


On Wed, 21 May 2025 12:33:33 +0530, Manikandan Muralidharan wrote:
> This patch series adds support to parse the SFDP SST vendor map, read and
> store the EUI-48 and EUI-64 Address (if its programmed) using the
> resource-managed devm_kcalloc which will be freed on driver detach.
> Register EUI addresses into NVMEM framework for the net drivers to access
> them using nvmem properties.
> This change ensures consistent and reliable MAC address retrieval
> from QSPI benefiting boards like the sama5d27_wlsom1, sama5d29 curiosity
> and sam9x75 curiosity.
> 
> --------
> changes in v3:
> - 2/3 - add support to update the QSPI partition into 'fixed-partition'
> 	binding in sama5d27_wlsom1
> - 3/3 - add nvmem-layout in qspi node for EUI48 MAC Address and nvmem cell
> 	properties for macb node in sama5d27_wlsom1
> 
> changes in v2:
> - 1/3 - parse the SST vendor table, read and store the addresses
> 	into a resource - managed space. Register the addresses
> 	into NVMEM framework
> - 2/3 - add support to update the QSPI partition into 'fixed-partition'
> 	binding
> --------
> 
> Manikandan Muralidharan (3):
>   mtd: spi-nor: sfdp: parse SFDP SST vendor map and register EUI
>     addresses into NVMEM framework
>   ARM: dts: microchip: sama5d27_wlsom1: update the QSPI partitions using
>     "fixed-partition" binding
>   ARM: dts: microchip: sama5d27_wlsom1: Add nvmem-layout in QSPI for
>     EUI48 MAC Address
> 
>  .../dts/microchip/at91-sama5d27_wlsom1.dtsi   |  65 ++++---
>  drivers/mtd/spi-nor/sfdp.c                    | 161 ++++++++++++++++++
>  include/linux/mtd/spi-nor.h                   |   7 +
>  3 files changed, 209 insertions(+), 24 deletions(-)
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
 Base: tags/next-20250516 (best guess, 2/3 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250521070336.402202-1-manikandan.m@microchip.com:

arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('nvmem-layout', 'spi-cs-setup-ns' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#






