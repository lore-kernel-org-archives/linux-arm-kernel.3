Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317FCCAC584
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGu6cRTes100LufEy7NXONVuRKrDYaXL+M6/Ecw5QSg=; b=xWvdoYpEjByEKud711WaD8+7C7
	ol3Jp1PfHAEszjci0blZDgU1di5+hWO9R8TqSy2wdM0uyczBybwT1KEmGwnzg8kdmDGCq1z/5H8J6
	tl2qDrVkNzWykYSp4iyMJ0WvCiJuJeNdWRaRBlnckOP6YRkEokhrDWDYAnR62GaPcKVBKmY1uvLZb
	Dh+BBUQp3Hs2v0doBzI5xofuGL+Inp7UtRr+kNYFqBYRE0KdyBTnsufGzV7tXad6781OqYjFGlguk
	f9+wlmIKxDBZ+BbgnK/9C+AB+wnxaOChZW79mVZqdDe7VaSJJ3a1wVbCh8sucqroRN74+w637UEVC
	WuXbkX5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVi-00000005RvM-3tN7;
	Sat, 06 Sep 2025 00:10:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaUk-00000003Z32-295w;
	Fri, 05 Sep 2025 17:45:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0351444EBD;
	Fri,  5 Sep 2025 17:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACB9C4CEF4;
	Fri,  5 Sep 2025 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757094305;
	bh=IPNf+uj9SwG7V/HqvpgImlpeKFozAwz0O2IbujFna2o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lzyi46qJ8z8SSmnuN6eSFC8fsENvLGZKQIoz3l+oZiQ5zbEpeW87DXlg8+fL9b5m/
	 D6ESW9bnIXtEHHE30zNZFn7OwHzHmbbh11k/5dxyaS8X4NpG93WouApo6/080orBsG
	 8sg1Kqn8mxcCjJqoKlD+iqWTOr2Pb92pBGmtclgNav4M2zDPGeoNrCVvOgpuzLGZbr
	 ClWh/jRUICF5GjHRSaxmSAqfP6auKs6ipL+M9ifKtlpoF1EB2wa7lbqgTDs9L0ZoA7
	 Djc6lZKFUiHLk16YphYGbxj3ztUC1TObz/wLtgaYlXmXtJsj965Wj8wE5dHh5Nv9g1
	 EMlzwLJWdvDVg==
Date: Fri, 05 Sep 2025 12:45:05 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org
To: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
Message-Id: <175709416307.988711.14636876024281997557.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] Radxa NIO 12L: Add GPIO keys and LED support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_104506_593616_EB32B652 
X-CRM114-Status: GOOD (  19.74  )
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


On Fri, 05 Sep 2025 13:51:57 +0200, Julien Massot wrote:
> This patchset adds support for the GPIO-connected red and blue LEDs,
> as well as the various hardware buttons present on the Radxa NIO 12L
> board.
> 
> It also includes a fix for the missing release (key-up) interrupt
> handling for PMIC-managed GPIO keys.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
> Changes in v3:
> Patch 3/3: drop the deprecated LEDs label property
> - Link to v2: https://lore.kernel.org/r/20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com
> 
> Changes in v2:
> PATCH 1/3
> - Add Fixes tag
> - Drop Angelo's Reviewed-By since I'm now introducing the
> 'key_release_irq' member that was missing in v1.
> - Link to v1: https://lore.kernel.org/r/20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com
> 
> ---
> Julien Massot (3):
>       Input: mtk-pmic-keys - MT6359 has a specific release irq
>       arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys support
>       arm64: dts: mediatek: mt8395-nio-12l: add support for blue and red LEDs
> 
>  .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 65 ++++++++++++++++++++++
>  drivers/input/keyboard/mtk-pmic-keys.c             |  5 +-
>  2 files changed, 69 insertions(+), 1 deletion(-)
> ---
> base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
> change-id: 20250801-radxa-nio-12-l-gpio-54f208c25333
> 
> Best regards,
> --
> Julien Massot <julien.massot@collabora.com>
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
 Base: using specified base-commit 6c68f4c0a147c025ae0b25fab688c7c47964a02f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com:

arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: gpio-leds (gpio-leds): 'rgb-blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#






