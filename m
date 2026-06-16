Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1180ECD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 07:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZWnPdVvCXXrXk8aBvkNC5+6Sq5cWIv67TA89uoTByY=; b=kOAPMZoXRyRaMJMoLutFEGsOwc
	uPugDTAVrJiZx/UGkh0Qq7qSh1kzVHLZ+zqc9kRwjNJqoFRKW2WPHbPCZ+FwrhsHv8+5pwQsZ/T7m
	5+2wbAz8+OTYM4HL5751u+r6aeQSc2JhILMFXIuIbRWMV1I35fX0cDQDjVv0nLcGEZ6Bud8IHPTey
	RVZz9MAJto19AUgnCTmxyElnkoFvPfO6xMstsaBNaUF3Tn0TZLm2hd/w8gIiUX+DCWHCzF6lwLiMc
	ApCNQc9MvQWbwBaAM51FwVw6CVSh8OyUjeVQT8O9qPWBe3/n0N01O7PMxjHbyagQc9gLXKGCL0maI
	9YDC77EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOZG-0000000FOXK-1DZY;
	Tue, 16 Jun 2026 07:50:42 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOZC-0000000FOWg-2dcA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 07:50:41 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 94C027A019A;
	Tue, 16 Jun 2026 03:50:35 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 16 Jun 2026 03:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1781596235; x=1781682635; bh=tZ
	WnPdVvCXXrXk8aBvkNC5+6Sq5cWIv67TA89uoTByY=; b=dX6SmLersmx6ZpdJ2C
	yEp5k1ATOXlc1sergRQVgbpr6sWcSjLAyvvNdO/CkSDUyGXd4+2NQPu1EUEy8vJV
	vapLKSJQ07KmBkntTp9DJ/VV//XxyZ+chRWf0fO6bSY8CkICgcXrDVqrrZisV3Bu
	6lNdX0UempoAheB/aeLSkGnXW0j+B1RCODgtc33NKVnKYbtePquyyQ2bEpYwnjLz
	Fn7Iy8lexr2TyQA2jH9rLWN1FWwqfGif1Faldbz1hs+htXEZ7UcY1wrJyqT+CdW/
	ODAp0H3sdU8sFT8Qwey+IF7mAYLXlEmr5CsnAztyeYY6s74w3/O+sLbQvNtQdSMF
	N5YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781596235; x=1781682635; bh=tZWnPdVvCXXrXk8aBvkNC5+6Sq5c
	WIv67TA89uoTByY=; b=No7QDxHERGpHM3LOow03VshIGpxo7Vea7MGLU8bLMMlb
	6UbrUMb74sU+r+FBxDK7XM0ZUANlm7YwoZGVRQZmMp2QVVU35INQ7LRrsGkYhjB0
	vgRF5tbruLZ5undGcxuXKxYAVmnskf/jrHubTAvsj5yZ1NB2e7s1y6yZoladhy6e
	qUFqAaISlBGuxH3aO6a9uEsUJlwOnGLJNUU3rpLuEqC1WpUD1/dxL4/pG6+uE4Jn
	smmz8fRzUlsZeQu1ca/NJjxkHJQzT+sTT7NWc317ROSg7jgJj9zquhhRHIqNMBtO
	NIL1H7C0Eb1AASWRiU2BiMpOOtQXhVA2iwq0oaFhBQ==
X-ME-Sender: <xms:SgAxaixdv8aDEAsqb2DQRBZG0gtoLnTxF3rRkotoNRzDPyRKDgSefA>
    <xme:SgAxapEHT3WGLumYPasbY2vWHdxdppfJc9Z86Aqbcph0opKIsKUA-H-902E2NZqJc
    kTrGXjy5plyzOZjNeGtsSomTBSQlB5Xgq7DeqPpRif6lzqrIdGLs1Y>
X-ME-Proxy-Cause: dmFkZTEiPNS2/aoOSJVTlaBp8l94Kk0xmsQ3MOGGB1qWwmo9a+pMojRlPZ2/CgnwzIMyX+
    ZbrdL9q58hGv0mEqaVVQONRngvkVdIuNAJJImO5Sv+O6TyI+qwBriEGr0fgM1Dr5C+Sjau
    m0jqAJb9TIuyYUoAWLTRivAVgnBjcCc0QYiaTCOEg9UgrWMbbnv7o7yfOMQCiHAKI9dDUm
    odt5a4kc2ATJWc84viOqyimGaHXenBiDu3ZKbgcZnbBv3e8O360BWrU0R7SI+XzH+67Pzg
    7s/wDA+bmVrnSq7ni2cYZ4aWMF5qbC6nNVUSvZ4I/GfGl/0FyQqedRSvr4seAEvbGeCvAc
    7vq4vLZL+KBoYpfEWxQdumF4Ew8//5cnWMAIVWbhaG0fOm5AIqLf4ddP6THNQxKAFg6mT9
    lTF3mU3ysAeGSspaQ3dhTKOhEypcx+3vV61CMHhFcr/HIYI8tWbaVpVRXOcnT6neTJcdw5
    CDWjdbhzkpz79rH9j2USS8d6zsi/3Xn9qMD5diT44Tnusj3K00YmiLLZcZTSd/XZwmE2Fe
    23/0rPe0eT9OPQ4FvwOJO9L0ELRZGrDYq4MrnYxzQtTyEVGZQeGuqIbLIl6QSKIAUNTXS5
    15iSkg2BPkRgmmHp7gNmtqRzJjNP6TfnBRMb+AwDvYne0euC12zE32MHZPsg
X-ME-Proxy: <xmx:SgAxai21_aT5iLTb0djbTCnR-kQXpRcSQO56ycu4IMZKL2bx4CsUsQ>
    <xmx:SgAxakKNscoc4mJZpuE_Y0i9XjmKuYOnQREFOlPXsoAnqxXQOPwyfw>
    <xmx:SgAxahEv59qFsFHZHfk_J34fu422Sd1VzRBk85wzi8mbH5qhimdaWA>
    <xmx:SgAxagVuTX94vjw_OmZ938pFD4z2429aJrapUNNct5OnGyLh2nxAww>
    <xmx:SwAxapxtqFgBT8Iv-3uZ4XSY1LkGMCg73WuLqoibPGBqEXl2wc4KFRGE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C211A182007E; Tue, 16 Jun 2026 03:50:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 09:50:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Marek Vasut" <marek.vasut@mailbox.org>, linux-kernel@vger.kernel.org
Message-Id: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com>
Subject: [GIT PULL 0/4] soc updates for 7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_005039_113168_DAF4D81A 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
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

Once more, the changes are dominated by devicetree updates for
64-bit NXP/Freescale and Qualcomm platforms. There are slightly
under 1000 patches this time, almost as much as for 7.1. The
overall diff size is much smaller this time as we have a lot
of simpler patches, only five new SoCs that are all variations
of previously supported ones, and again few large code changes.

The most contributions this time are from:

     52 Marek Vasut
     35 Krzysztof Kozlowski
     30 Chen-Yu Tsai
     27 Biju Das
     19 Sudeep Holla
     18 Linus Walleij
     16 Sherry Sun
     16 Cristian Marussi
     15 Svyatoslav Ryhel
     15 Stefano Radaelli
     15 Hugo Villeneuve
     15 Cristian Ciocaltea
     14 Harshal Dev
     14 Abel Vesa
     13 Conor Dooley
     12 Thierry Reding
     12 Konrad Dybcio
     12 Josua Mayer
     12 Frank Li
     11 Tudor Ambarus
     11 Ronald Claveau
     11 Nishanth Menon
     11 Alexander Koskovich

diffstat=0.1
   0.4% Documentation/arch/arm/zte/
   0.3% Documentation/devicetree/bindings/arm/
   0.1% Documentation/devicetree/bindings/clock/
   0.1% Documentation/devicetree/bindings/iommu/
   0.7% Documentation/devicetree/bindings/memory-controllers/
   0.7% Documentation/devicetree/bindings/soc/renesas/
   0.1% Documentation/devicetree/bindings/soc/
   0.1% Documentation/devicetree/bindings/watchdog/
   0.2% Documentation/devicetree/bindings/
   3.5% arch/arm/boot/dts/aspeed/
   0.6% arch/arm/boot/dts/gemini/
   0.1% arch/arm/boot/dts/mediatek/
   3.4% arch/arm/boot/dts/nvidia/
   2.5% arch/arm/boot/dts/nxp/imx/
   0.3% arch/arm/boot/dts/renesas/
   0.6% arch/arm/boot/dts/st/
   0.2% arch/arm/boot/dts/zte/
   0.1% arch/arm/boot/dts/
   1.1% arch/arm/
   0.1% arch/arm64/boot/dts/allwinner/
   1.2% arch/arm64/boot/dts/amlogic/
   3.0% arch/arm64/boot/dts/apple/
   3.3% arch/arm64/boot/dts/aspeed/
   0.1% arch/arm64/boot/dts/cix/
  21.1% arch/arm64/boot/dts/freescale/
   0.1% arch/arm64/boot/dts/intel/
   0.9% arch/arm64/boot/dts/mediatek/
   0.1% arch/arm64/boot/dts/nuvoton/
   0.1% arch/arm64/boot/dts/nvidia/
  17.1% arch/arm64/boot/dts/qcom/
   5.7% arch/arm64/boot/dts/renesas/
   3.1% arch/arm64/boot/dts/rockchip/
   4.0% arch/arm64/boot/dts/ti/
   0.2% arch/arm64/boot/dts/
   0.3% arch/arm64/configs/
   0.3% arch/riscv/boot/dts/microchip/
   0.5% arch/riscv/boot/dts/sophgo/
   3.0% arch/riscv/boot/dts/spacemit/
   0.1% arch/riscv/boot/dts/starfive/
   0.1% arch/riscv/boot/dts/tenstorrent/
   0.1% arch/riscv/boot/dts/thead/
   0.4% drivers/bus/fsl-mc/
   0.2% drivers/clk/
   0.4% drivers/firmware/arm_ffa/
   0.1% drivers/firmware/arm_scmi/transports/
   0.1% drivers/firmware/arm_scmi/vendors/imx/
   1.3% drivers/firmware/arm_scmi/
   0.1% drivers/firmware/imx/
   1.0% drivers/firmware/samsung/
   0.5% drivers/firmware/
   0.1% drivers/gpu/drm/
   0.3% drivers/irqchip/
   5.1% drivers/memory/tegra/
   0.1% drivers/soc/bcm/brcmstb/
   1.6% drivers/soc/qcom/
   0.8% drivers/soc/renesas/
   0.2% drivers/soc/sunxi/
   0.9% drivers/soc/tegra/
   0.5% drivers/soc/ti/
   0.1% drivers/soc/
   0.1% drivers/tee/amdtee/
   0.7% drivers/tee/optee/
   0.1% drivers/tee/
   0.3% drivers/
   0.4% include/dt-bindings/clock/
   1.0% include/dt-bindings/memory/
   0.5% include/dt-bindings/reset/
   0.1% include/dt-bindings/
   0.2% include/linux/soc/qcom/
   0.3% include/linux/
   0.1% include/soc/
 843 files changed, 56647 insertions(+), 6762 deletions(-)

git shortlog --first-parent

Arnd Bergmann (19):
      Merge tag 'pxa1908-dt-for-7.2' of https://codeberg.org/pxa1908-mainline/linux into soc/dt
      Merge tag 'renesas-dts-for-v7.2-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'zx29-dts-for-7.2' of https://gitlab.com/stefandoesinger/zx297520-kernel into soc/dt
      Merge tag 'tegra-for-7.2-arm64-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'arm-soc/for-7.2/devicetree' of https://github.com/Broadcom/stblinux into soc/dt
      Merge tag 'ti-k3-dt-for-v7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/dt
      Merge tag 'apple-soc-dt-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux into soc/dt
      Merge tag 'imx-dt-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into soc/dt
      Merge tag 'hisi-arm64-dt-for-7.2' of https://github.com/hisilicon/linux-hisi into soc/dt
      Merge tag 'v7.2-rockchip-dts64-2' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'riscv-dt-for-v7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/dt
      Merge tag 'omap-for-v7.2/dt-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/dt
      Merge tag 'at91-dt-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/dt
      Merge tag 'microchip-dt64-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/dt
      Merge tag 'imx-dt64-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into soc/dt
      Merge tag 'imx-dt64-7.2-part2' of git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into soc/dt
      Merge tag 'imx-binding-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into soc/dt
      Merge tag 'sunxi-dt-for-7.2-2' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into soc/dt
      Merge tag 'bst-arm64-emmc-driver-dts-for-v7.2' of https://github.com/BlackSesame-SoC/linux into soc/dt

Krzysztof Kozlowski (10):
      Merge tag 'mtk-dts32-for-v7.2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'mtk-dts64-for-v7.2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'renesas-dts-for-v7.2-tag2' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'tenstorrent-dt-for-v7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux into soc/dt
      Merge tag 'thead-dt-for-v7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux into soc/dt
      Merge tag 'spacemit-dt-for-7.2-1' of https://github.com/spacemit-com/linux into soc/dt
      Merge tag 'amlogic-arm64-dt-for-v7.2-v2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'nuvoton-7.2-devicetree-0' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/bmc/linux into soc/dt
      Merge tag 'riscv-sophgo-dt-for-v7.2' of https://github.com/sophgo/linux into soc/dt
      Merge tag 'aspeed-7.2-devicetree-0' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/bmc/linux into soc/dt

Linus Walleij (10):
      Merge tag 'cix-dt-v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix into soc/dt
      Merge tag 'qcom-arm64-for-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'v7.2-rockchip-dts32' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'v7.2-rockchip-dts64-1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'gemini-for-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator into soc/dt
      Merge tag 'tegra-for-7.2-dt-bindings' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'tegra-for-7.2-arm-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'samsung-dt64-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/dt
      Merge tag 'stm32-dt-for-7.2-1' of git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into soc/dt
      Merge tag 'socfpga_dts_updates_for_v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into soc/dt

Mohamed Ayman (1):
      ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr

Ryan Chen (4):
      dt-bindings: arm: aspeed: Add AST2700 board compatible
      arm64: Kconfig: Add ASPEED SoC family Kconfig support
      arm64: dts: aspeed: Add initial AST27xx SoC device tree
      arm64: dts: aspeed: Fix duplicate pinctrl labels and address scheme

Yu-Chun Lin (1):
      arm64: dts: realtek: Add pinctrl support for RTD1625

Arnd Bergmann (19):
      Merge tag 'soc_fsl-7.1-2' of https://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux into soc/drivers
      Merge tag 'renesas-drivers-for-v7.2-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'qcom-drivers-for-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'scmi-updates-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into soc/drivers
      Merge tag 'ffa-updates-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into soc/drivers
      Merge tag 'amdtee-for-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'optee-for-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'tegra-for-7.2-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'tegra-for-7.2-pmc' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'tegra-for-7.2-firmware' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'samsung-drivers-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/drivers
      Merge tag 'memory-controller-drv-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'arm-soc/for-7.2/drivers' of https://github.com/Broadcom/stblinux into soc/drivers
      Merge tag 'ti-driver-soc-for-v7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/drivers
      Merge tag 'cache-for-v7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/drivers
      Merge tag 'riscv-soc-drivers-for-v7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/drivers
      Revert "Documentation: ABI: add sysfs interface for ZynqMP CSU registers"
      Revert "firmware: zynqmp: Add dynamic CSU register discovery and sysfs interface"
      Merge tag 'memory-controller-drv-7.2-2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers

Krzysztof Kozlowski (4):
      Merge tag 'mtk-soc-for-v7.2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mediatek/linux into soc/drivers
      Merge tag 'renesas-drivers-for-v7.2-tag2' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'sunxi-drivers-for-7.2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into soc/drivers
      Merge tag 'aspeed-7.2-drivers-0' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/bmc/linux into soc/drivers

Linus Walleij (1):
      Merge tag 'zynqmp-soc-for-7.2' of https://github.com/Xilinx/linux-xlnx into soc/drivers

Arnd Bergmann (5):
      Merge tag 'v7.2-qcom-pinctrl-defconfigs' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl into soc/defconfig
      Merge tag 'cix-defconfig-v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix into soc/defconfig
      Merge tag 'at91-defconfig-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/defconfig
      Merge tag 'imx-defconfig-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into soc/defconfig
      Merge tag 'bst-arm64-emmc-driver-defconfig-for-v7.2' of https://github.com/BlackSesame-SoC/linux into soc/defconfig

Krzysztof Kozlowski (11):
      arm64: defconfig: Move entries to match savedefconfig
      arm64: defconfig: Drop unused legacy netfilter options
      arm64: defconfig: Drop default or selected drivers
      arm64: defconfig: Drop unused Ethernet vendors
      arm64: defconfig: Switch Ethernet drivers to modules
      ARM: multi_v7_defconfig: Move entries to match savedefconfig
      ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
      ARM: configs: Drop redundant SND_ATMEL_SOC
      ARM: multi_v7_defconfig: Cleanup redundant options
      ARM: multi_v7_defconfig: Correct QCOM_RPMH and QCOM_RPMHPD
      ARM: configs: Drop duplicated CONFIG_EXT4_FS

Manivannan Sadhasivam (1):
      arm64: defconfig: Enable PCI M.2 power sequencing driver

Maxime Ripard (1):
      ARM: multi_v7_defconfig: Enable dma-buf heaps

Ryan Chen (1):
      arm64: configs: Update defconfig for AST2700 platform support

Arnd Bergmann (7):
      ARM: select legacy gpiolib interfaces where used
      Merge tag 'soc-pxa-gpio-for-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into soc/arm
      Merge tag 'zx29-plat-for-7.2' of https://gitlab.com/stefandoesinger/zx297520-kernel into soc/arm
      Merge tag 'ep93xx-20260529' of https://git.kernel.org/pub/scm/linux/kernel/git/asv/linux into soc/arm
      Merge tag 'imx-soc-updates-for-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into soc/arm
      Merge tag 'omap-for-v7.2/soc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm
      Merge tag 'mvebu-arm-7.2-1' of git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into soc/arm

Bartosz Golaszewski (1):
      arm64: Kconfig: drop unneeded dependency on OF_GPIO for ARCH_MVEBU

Ethan Nelson-Moore (1):
      ARM: remove the last few uses of do_bad_IRQ()

Linus Walleij (2):
      Merge tag 'zx29-docfix-for-7.2' of https://gitlab.com/stefandoesinger/zx297520-kernel into soc/arm
      Merge tag 'samsung-soc-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/arm

Prasad Bolisetty (1):
      MAINTAINERS: Add Axiado reviewer and Maintainers



