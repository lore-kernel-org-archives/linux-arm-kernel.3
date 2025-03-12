Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E67C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QsQwrJAayXmpvlmYC9dKABPZsLiTBF4ogEEVTRq14k=; b=cEYCZS2kkTBNtwPjBOMWXxaFSf
	p5BxIrhNmpfSPdAvpbbXBPmksoAqZ1mkENF9s5NY8oT6Y2J8M8m5l5mZbYulhrrkXSpbXLWTvo1Ke
	UnXxv1HmRdpT6pZn8x4KRw+tP+6areDPvs9TfcJ4BTptEHPKkI2KO34vVDPzN95zbfbDVTYP874W6
	a/Gs5dCThl75JlePO0X8ulJBfcgHA8h+YcOdBceQBQWJGHPMp+kZfSmMI0qyh/NJoEnQQHpYN0li8
	MnGqxrlC8EV+ID28sbcl1rutSgYx9pYwKUtgb2SivJnKgnUeQ1OraxjQtJgZjbJp7SEECWBRdC5yg
	A1qgzasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMIr-00000008akl-3DRa;
	Wed, 12 Mar 2025 13:39:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLoF-00000008W7K-0Idn;
	Wed, 12 Mar 2025 13:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=9QsQwrJAayXmpvlmYC9dKABPZsLiTBF4ogEEVTRq14k=; b=OCv2GheUUQ5thIQF2+gpzEa+MV
	Cko7E7jG0M8Ysx47lq6wcUUUmnX3lMEYRlL6rXXesa/TznOWm0r+oKXjsst+oT4VUOlsnOvGeRJ83
	vn+GCR0De26ji1ceEzCBuWNpMOZe0eFg5p/IaOJBMBIuCLcv2tT7SXcLVJXEa8oyybhm7E2f96wct
	8z3UdWIuOfNFJvYrk1k0EyVPZ4S+1XryZpk34vKISVLrGojfIMEZhqHdU0y08WXnUt5ScWX8PJsXQ
	Xh+tXEavt161sIq4qELquGX4JJRkW6ZdWdfYaMvxeuAhqCwTGOiZQ8BF9+AsUkJPLhSkajTtFK+Gy
	PYLHaf7A==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLoB-00000002NlE-1b4m;
	Wed, 12 Mar 2025 13:07:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 774FD5C5AE2;
	Wed, 12 Mar 2025 13:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72C2C4CEED;
	Wed, 12 Mar 2025 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741784855;
	bh=iRfFeBANOM2hUL7E2zRHWps4ofaq4IOnHQTovW0eFT4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=u/WGy8JnzjgFARu4QTlrYLqVyiB8cF/sKPT0p04wm36qe3i6b7f7akjITsx+I5Xzp
	 wbOj1rjzZel+YvlZ6r5q7nUOOSqCGTby3jTOz2VrCmmTPv61XK/VTh03l8rqNfBnzn
	 7Zg3h3LVbqFMaL1xtvMHR08zeTMcjmN24tuYl4ULZ5QMF0AiFVubjVat2RHPU1M+oI
	 akiRsF4UFhQZFTewvZr6xMUytcmyLdXMfRfJlzqadOjJ0zOgtVZp/hRkJ6Jf+Bmggd
	 P0W0zvneMf4QIUbj6sS12e6399Un3lAh+tcHwn259+Mlyuib2E+HZdPaoPQrGFgy+M
	 pduEKQWW4NXQg==
Date: Wed, 12 Mar 2025 08:07:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org, 
 chrome-platform@lists.linux.dev
To: Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
Message-Id: <174178473613.434362.5052831169970866580.robh@kernel.org>
Subject: Re: [PATCH 0/8] arm64: mediatek: mt8186-corsola: Consolidate and
 add new devices
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_130739_784267_B8AA54EA 
X-CRM114-Status: GOOD (  22.07  )
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


On Wed, 12 Mar 2025 18:43:34 +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> Here's a follow up series of the I2C component probers for Chromebooks.
> This series enables the component prober for the Corsola series of
> devices, combines the two existing Voltorb SKUs, and adds a new
> device, codename Squirtle.
> 
> Patch 1 adds a new HID-over-I2C touchscreen from Elan.
> 
> Patch 2 merges the Voltorb entries in the device tree bindings into one.
> 
> Patch 3 adds a new entry for the Squirtle device to the bindings.
> 
> Patch 4 fixes up the existing device trees for the component prober to
> be active.
> 
> Patch 5 merges the device trees for the Voltorb device.
> 
> Patch 6 adds a device tree file for the Squirtle device, with I2C
> components ready to be probed by the prober.
> 
> Patch 7 enables the prober to probe trackpads on some devices in the
> Corsola family.
> 
> Patch 8 enables the prober to probe touchscreens on Squirtle.
> 
> Please take a look.
> 
> 
> Thanks
> ChenYu
> 
> 
> Chen-Yu Tsai (8):
>   dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
>   dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
>   dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
>   arm64: dts: mediatek: mt8186-steelix: Mark second source components
>     for probing
>   arm64: dts: mediatek: mt8186: Merge Voltorb device trees
>   arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
>   platform/chrome: of_hw_prober: Support trackpad probing on Corsola
>     family
>   platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   7 +-
>  .../bindings/input/elan,ekth6915.yaml         |  29 ++++-
>  arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
>  .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
>  .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
>  .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
>  .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
>  .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
>  ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
>  .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
>  .../platform/chrome/chromeos_of_hw_prober.c   |  29 +++++
>  11 files changed, 185 insertions(+), 32 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
>  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
>  rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)
> 
> --
> 2.49.0.rc0.332.g42c0ae87b1-goog
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250312104344.3084425-1-wenst@chromium.org:

arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#






