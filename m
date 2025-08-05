Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3279C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyEkq65BqnjSHUSEvPlgeOq00yihdtpSGk7ZlYleULo=; b=2w2/flhADvE7NwGt6iQt8YUz7+
	U90EY33ic7e6dlHWEbT0CnkNYx/TkOE9LeqYmztkM5Vfq0hdsaiUP2JODqpKQjwH++VmEItVqPFoO
	Bhyu3mnCGjj0MGt82jK1dM+IJlz+lneIKbAu1M+P12O8n3plpMqDsZ5MO75t+Iv2PzCjFiPl3Ji1h
	j8SxsBHzmNbS0lT0b29XcnwawEt2VUFoROFF6tn2En8MZd9qlZJ/V1QHP++PBUf2cDG+25qlR1JNn
	hNkqAAOnf3+adue1vr5yShwqcgwdx/Eski/9EBDROhCT41UI+62FRrzVMWY+wveM+XEdBcAPFn7RV
	zBBb0MyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJpn-0000000DBuf-3SCe;
	Tue, 05 Aug 2025 15:44:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujImJ-0000000D2DT-489C;
	Tue, 05 Aug 2025 14:36:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1378DA55370;
	Tue,  5 Aug 2025 14:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50079C4CEF0;
	Tue,  5 Aug 2025 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754404594;
	bh=w44VePDoslCBQmbyhcmLPxQ8EP9h0hyA++ku5mPHf3g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=n2fhACyVyCVvYGuPP5yMUtOJLO69zohrl67B4qO7tkrc85q6AhS4HjOpKq0IO06bx
	 VLOboqGBT7smqDbTFjCjnp2DG/po4EcjHpfGR+JZzM+IT6QVECop5qsXyHugSDQVn1
	 7BxqhQncciEoyBbL90Tleof1s2k1YIBjNcc/G6VkKx9VK9DZYHWJmt0BeV8bGLwals
	 jVcfnveLCEGmUfV72Wqta+sV+RLjN4QoW+l7EnzBS27caLKnsqRCSbbuO8ts3bESBT
	 uZRvfvo06OiRv/fMXlJzoKPT59UHy7yOPcsip0yUx7VPtwZ/MS2HXmhai2mdCjkufK
	 6DrQgtBEh+o6g==
Date: Tue, 05 Aug 2025 09:36:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, fshao@chromium.org, 
 wenst@chromium.org, matthias.bgg@gmail.com, ulf.hansson@linaro.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mandyjh.liu@mediatek.com, mbrugger@suse.com, y.oudjana@protonmail.com, 
 devicetree@vger.kernel.org, kernel@collabora.com, conor+dt@kernel.org, 
 krzk+dt@kernel.org, lihongbo22@huawei.com, 
 linux-mediatek@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
References: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
Message-Id: <175440455336.1687500.12826833378916085402.robh@kernel.org>
Subject: Re: [PATCH v3 00/10] pmdomain: Partial refactor, support modem and
 RTFF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_073636_168919_C27657C8 
X-CRM114-Status: GOOD (  35.42  )
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


On Tue, 05 Aug 2025 09:47:36 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v3:
>  - Dropped specified items for cells restriction as suggested by Rob
>  - Fixed an issue in patch 4 still referencing "mediatek,bus-protection"
>    as it is entirely replaced by "access-controllers"
> 
> Changes in v2:
>  - Added #access-controller-cells allowance for MT8188/95 infracfg_ao
> 
> This series is a subset of [1], leaving out the Hardware Voter specific
> bits for MT8196 until the discussion around it reaches a conclusion.
> 
> Even though the proposed code was born as a preparation to support the
> MT8196/MT6991 SoCs power domain controllers, it is a necessary cleanup
> for all power domain controllers of all of the currently supported SoCs
> from MediaTek.
> 
> You may also notice the addition of support for modem power sequences:
> this was brought up 6 months ago (or more) by community contributors
> (mainly Yassine Oudjana) that were trying to upstream the MediaTek
> MT6735 Smartphone SoC and needed support to provide power to the MD
> subsystem - so, even though in this specific series the code for the
> modem power sequence is not yet triggered by any SoC, please please
> please, let it in.
> Besides, "a bunch" of upstream supported SoCs do have the MD power
> domain even though it wasn't added to their drivers (because if there
> was no support in the driver, it would just crash the system); the
> addition is something that I plan to do at some point, but definitely
> not now as I have no bandwidth for that (bar MT8196, which will have
> this domain).
> 
> Compared to v1 in [1]:
>  - Changed mediatek,bus-protection to access-controllers
>    as suggested by Rob (thanks!)
>  - Added commits to document #access-controller-cells on all of
>    the access control providers
> 
> In the meanwhile.... relevant excerpt from the old series:
> 
> This series refactors the bus protection regmaps retrieval to avoid
> searching in all power domain devicetree subnodes for vendor properties
> to get syscons for different busses, and adds a new property which is
> located in the power controller root node containing handles to the same.
> 
> Retrocompatibility is retained and was tested on multiple SoCs in the
> Collabora lab - specifically, on Genio 350/510/700/1200, and manually
> on MT6795 Helio (Xperia M5 Smartphone), MT8186, MT8192 and MT8195
> Chromebooks.
> 
> This was tested *three times*:
>  - Before the per-SoC conversion in drivers/pmdomain/mediatek
>  - With per-SoC conversion code but with *legacy* devicetree
>  - With per-SoC conversion code and with *new* devicetree conversion
> 
> All of those tests were successful on all of the aforementioned SoCs.
> 
> This also adds support for:
>  - Modem power domain for both old and new MediaTek SoCs, useful for
>    bringing up the GSM/3G/4G/5G modem for both laptop and smartphone use
>  - RTFF MCU HW, as found in MT8196 Chromebooks and MT6991 Dimensity 9400
> 
> ...and prepares the pmdomain code to accomodate only the directly
> controlled power domains for MT8196 (HW Voter support was left out).
> 
> [1] https://lore.kernel.org/all/20250623120154.109429-1-angelogioacchino.delregno@collabora.com
> 
> AngeloGioacchino Del Regno (10):
>   dt-bindings: memory: mtk-smi: Document #access-controller-cells
>   dt-bindings: clock: mediatek: Document #access-controller-cells
>   dt-bindings: power: mediatek: Document access-controllers property
>   pmdomain: mediatek: Refactor bus protection regmaps retrieval
>   pmdomain: mediatek: Handle SoCs with inverted SRAM power-down bits
>   pmdomain: mediatek: Move ctl sequences out of power_on/off functions
>   pmdomain: mediatek: Add support for modem power sequences
>   pmdomain: mediatek: Add support for RTFF Hardware in MT8196/MT6991
>   pmdomain: mediatek: Convert all SoCs to new style regmap retrieval
>   arm64: dts: mediatek: Convert all SoCs to use access-controllers
> 
>  .../bindings/clock/mediatek,infracfg.yaml     |   3 +
>  .../clock/mediatek,mt8186-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8188-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8192-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8195-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8365-sys-clock.yaml      |  15 +
>  .../mediatek,smi-common.yaml                  |  16 +
>  .../power/mediatek,power-controller.yaml      |  37 ++
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi      |   5 +-
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi      |   6 +-
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   4 +-
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  17 +-
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  12 +-
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi      |  23 +-
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  13 +-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  20 +-
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi      |  16 +-
>  drivers/pmdomain/mediatek/mt6795-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8167-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8173-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8183-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8186-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8188-pm-domains.h |   6 +
>  drivers/pmdomain/mediatek/mt8192-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8195-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8365-pm-domains.h |  14 +-
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    | 399 +++++++++++++++---
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |  74 +++-
>  28 files changed, 594 insertions(+), 181 deletions(-)
> 
> --
> 2.50.1
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
 Base: tags/next-20250805 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250805074746.29457-1-angelogioacchino.delregno@collabora.com:

arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pcm (mediatek,mt8192-audio): clocks: [[59, 0], [59, 7], [59, 8], [59, 6], [59, 21], [59, 1], [59, 2], [59, 4], [59, 3], [59, 5], [59, 9], [59, 10], [59, 18], [59, 19], [59, 20], [59, 22], [59, 23], [59, 24], [59, 25], [59, 26], [22, 47], [22, 58], [23, 27], [23, 28], [23, 72], [23, 47], [23, 101], [23, 48], [23, 105], [23, 43], [23, 103], [23, 44], [23, 107], [23, 59], [23, 60], [23, 61], [23, 62], [23, 63], [23, 64], [23, 65], [23, 66], [23, 67], [23, 68], [23, 142], [23, 143], [23, 144], [23, 145], [23, 146], [23, 147], [23, 148], [23, 149], [23, 150], [23, 151], [23, 152], [23, 55], [2]] is too long
	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-pcm (mediatek,mt8192-audio): clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [56, 21], [56, 1], [56, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [56, 18], [56, 19], [56, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26], [22, 47], [22, 58], [23, 27], [23, 28], [23, 72], [23, 47], [23, 101], [23, 48], [23, 105], [23, 43], [23, 103], [23, 44], [23, 107], [23, 59], [23, 60], [23, 61], [23, 62], [23, 63], [23, 64], [23, 65], [23, 66], [23, 67], [23, 68], [23, 142], [23, 143], [23, 144], [23, 145], [23, 146], [23, 147], [23, 148], [23, 149], [23, 150], [23, 151], [23, 152], [23, 55], [2]] is too long
	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt8192-audio): clocks: [[45, 0], [45, 7], [45, 8], [45, 6], [45, 21], [45, 1], [45, 2], [45, 4], [45, 3], [45, 5], [45, 9], [45, 10], [45, 18], [45, 19], [45, 20], [45, 22], [45, 23], [45, 24], [45, 25], [45, 26], [22, 47], [22, 58], [23, 27], [23, 28], [23, 72], [23, 47], [23, 101], [23, 48], [23, 105], [23, 43], [23, 103], [23, 44], [23, 107], [23, 59], [23, 60], [23, 61], [23, 62], [23, 63], [23, 64], [23, 65], [23, 66], [23, 67], [23, 68], [23, 142], [23, 143], [23, 144], [23, 145], [23, 146], [23, 147], [23, 148], [23, 149], [23, 150], [23, 151], [23, 152], [23, 55], [2]] is too long
	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#






