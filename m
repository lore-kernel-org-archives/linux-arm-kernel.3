Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF54AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 19:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2/Y0ey40cX1kpkIbyt6pJMxZ1YhyMpToEuYX5UUKl4=; b=41N0iod2oitLNY//tvlYQZAKKA
	isbHWDZKQW2OpTuCdAJFyYQ0OQBIeY6lihUDsGRhitxwYTWi1joO+3HvFsZiKNglTSXVSaSB17Zqj
	FVNGc7CTik5bEMTJ+PJAUVZJHK40gabiQr/BGpqWFtdpK8QJwRJt1rnsdv4kbN6fWAMq0v5pUsUeZ
	nD9Vld1HQ8I6FVyRZGqf9RGilWqTLQHZjrABta3B0EZGHNKGtl+A00r6DVu0ZDNFbn/ixG5Cc2E0U
	bqz/eIDSfZqhWG0Amxiy3G65CU01DcLi7zCWi8PFBVF+gFn62QCiWskh4PeuST3oO6VVqOJgfVSHo
	+quVjqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWGv-00000009QlC-3pAa;
	Wed, 26 Mar 2025 19:18:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWAB-00000009PzY-1J5o;
	Wed, 26 Mar 2025 19:11:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FD2D44138;
	Wed, 26 Mar 2025 19:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB9BC4AF09;
	Wed, 26 Mar 2025 19:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743016302;
	bh=FjoBf5oIKnt+BxBL5ikSxff8xK7Z5Im1gcOrV8814C0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=X8VJHKQoKx8TN6Nrrw4iVI4qoPraLVsFZAWJKgnItF1dK/53F9EYLQB5pYJXgibly
	 xiyu5iNkZYozvEXYu2kxBf/yCi3qNE7VeRLZh+Zr8/Icir0WpkkciAGz7BM/oPuODG
	 IeAjHVVGKEHMlh7XxXHwTk4UK/Bgpu2lXiTWZCtVJmaOrxOEcmCYgWELL9BTadg6+2
	 gC9KMPu1s7yo0EQ5CFyxfQjDEa9j3SMZvAMh+xsgoK9S2ZFDTN3ym5Fn7x5vcMBb0L
	 kghNDPFmQLQwX46UOq63Q10fyvnULTyKmrj1ZCSpHiFYppVXLGEcqp3wT6IjZ9+o+B
	 sOa2/athzo7lQ==
Date: Wed, 26 Mar 2025 14:11:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, 
 Matthias Kaehlcke <mka@chromium.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
In-Reply-To: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
Message-Id: <174301524097.2716484.8735882534615031646.robh@kernel.org>
Subject: Re: [PATCH 0/5] Fix onboard USB hub instability on RK3399 Puma SoM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_121143_390907_CA6092CD 
X-CRM114-Status: GOOD (  23.95  )
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


On Wed, 26 Mar 2025 17:22:55 +0100, Lukasz Czechowski wrote:
> The RK3399 Puma SoM contains the internal Cypress CYUSB3304 USB
> hub, that shows instability due to improper reset pin configuration.
> Currently reset pin is modeled as a vcc5v0_host regulator, that
> might result in too short reset pulse duration.
> Starting with the v6.6, the Onboard USB hub driver (later renamed
> to Onboard USB dev) contains support for Cypress HX3 hub family.
> It can be now used to correctly model the RK3399 Puma SoM hardware.
> 
> The first commits in this series fix the onboard USB dev driver to
> support all HX3 hub variants, including the CYUSB3304 found in
> the RK3399 Puma SoM.
> This allows to introduce fix for internal USB hub instability on
> RK3399 Puma, by replacing the vcc5v0_host regulator with
> cy3304_reset, used inside the hub node.
> Please be aware that the patch that fixes USB hub instability in
> arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi can me merged only
> after updating the Onboard USB dev driver, otherwise the hub
> will not work.
> 
> Two last commits in the series disable unrouted USB controllers
> and PHYs on RK3399 Puma SOM and Haikou carrier board, with no
> intended functional changes.
> 
> Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> ---
> Lukasz Czechowski (3):
>       usb: misc: onboard_usb_dev: fix support for Cypress HX3 hubs
>       dt-bindings: usb: cypress,hx3: Add support for all variants
>       arm64: dts: rockchip: fix internal USB hub instability on RK3399 Puma
> 
> Quentin Schulz (2):
>       arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma
>       arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma with Haikou
> 
>  .../devicetree/bindings/usb/cypress,hx3.yaml       |  6 +++
>  .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |  8 ----
>  arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      | 43 ++++++++++------------
>  drivers/usb/misc/onboard_usb_dev.c                 | 10 ++++-
>  drivers/usb/misc/onboard_usb_dev.h                 |  6 +++
>  5 files changed, 39 insertions(+), 34 deletions(-)
> ---
> base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
> change-id: 20250326-onboard_usb_dev-a7c063a8a515
> 
> Best regards,
> --
> Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
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
 Base: base-commit 1e26c5e28ca5821a824e90dd359556f5e9e7b89f not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250326 (best guess, 2/5 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com:

arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1: 'vdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1: 'vdd2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2: 'vdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2: 'vdd2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: pinctrl: gpios: {'bios-disable-override-hog-pin': {'rockchip,pins': [[3, 29, 0, 190]], 'phandle': 185}, 'q7-thermal-pin': {'rockchip,pins': [[0, 3, 0, 189]], 'phandle': 184}} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#






