Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57367CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyQuE/T+XQgyjCprQ81/6BjwlaGyZcDmPeqmogzu1mk=; b=MCILrh4JK2BexQYBlGN5eiYmEA
	Sp07OwefECRL3MF1uzucBNQrRd5ytoWddmGxksiSJlO9B7YO8cRe1pzvJQCpISg20mmO9q8WnKC98
	fLI3A2O0NS6icwdHTiISfuGSCq1wH/HzM5u372D37Bo3fMwNsnOwsrjKOZ7d02vFgE1KIK6595UUy
	wj22v6pSl/km0UWaYPyarcnnIlTH39Dg4M75K36Z5qZHPCmdKUK/9oR+EztLKU6BMasjZ6kBd40ue
	JxOfIC+3TDwGdVrWKu4M1gHTCWZ+/N9l5lv8bMEUqSUxH93Q7q4PbsyBP4fNJqwLx0cPeqB2EryXo
	uaftT01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kKS-0000000B7JP-2GQE;
	Mon, 22 Sep 2025 17:27:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kKN-0000000B7F6-0cd6;
	Mon, 22 Sep 2025 17:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EA7B60218;
	Mon, 22 Sep 2025 17:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9950C4CEF0;
	Mon, 22 Sep 2025 17:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758562070;
	bh=yKJaAmyEUj6hfg2Wi/c+GfF4r+OUMiAWTtRJ4AOyhsY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=d9jsUu8ISkmgl9vuYDCPazTMv9KseEzUkLR1u6Huuav+aVAYr6rWRocAaqM/nFw39
	 Wf2hwBQJXfUzSgY9M0V3scvPCXJieS7culoGJ6zIp9VTKYCf4AuGju8oshgiidPu0g
	 wiYvbX/FS/w93EcnX4kvIy1Zlb0Na6Qrzufxlsyl2iO3XCqGWgtUFcBpZq1v7a8Kie
	 uboN+g+QriCO8KkwwtDYMrf7/UypAEVk27Ipb52xEaj7ndxx2Ivmi8Vu/tgZoNFx+/
	 kKqGdz5g63E6tdWAVERyP6bKUWrmTp2Esti7If4qDg2CvuJNmEOQNME6EgVGFSXsFJ
	 JE3e74QN36E2A==
Date: Mon, 22 Sep 2025 12:27:44 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Diederik de Haas <didi.debian@cknow.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Robinson <pbrobinson@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, Maxime Ripard <mripard@kernel.org>, 
 Andy Yan <andy.yan@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-usb@vger.kernel.org, Frank Wang <frank.wang@rock-chips.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Johan Jonker <jbx6244@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Vinod Koul <vkoul@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20250922012039.323-1-kernel@airkyi.com>
References: <20250922012039.323-1-kernel@airkyi.com>
Message-Id: <175856183997.499955.3596561052820030372.robh@kernel.org>
Subject: Re: [PATCH v4 0/7] Add Type-C DP support for RK3399 EVB IND board
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


On Mon, 22 Sep 2025 09:20:32 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This series focuses on adding Type-C DP support for USBDP PHY and DP
> driver. The USBDP PHY and DP will perceive the changes in cable status
> based on the USB PD and Type-C state machines provided by TCPM. Before
> this, the USBDP PHY and DP controller of RK3399 sensed cable state
> changes through extcon, and devices such as the RK3399 Gru-Chromebook
> rely on them. This series should not break them.
> 
> ====
> 1. DisplayPort HPD status notify
> 
> Before v4, I implemented a variety of DP HPD status notify. However,
> they all had various problems and it was difficult to become a common
> solution.
> 
> Under Dmitry's guidance, I try to add default DRM AUX HPD device when
> register DisplayPort altmode in patch 1. That makes it redundant for
> each Type-C chip driver to implement a similar registration process
> in embedded scenarios.
> 
> I'm not certain if the current implementation is appropriate.
> Please let me know if there's a better way.
> 
> ====
> 2. Altmode switching and orientation switching for USBDP PHY
> 
> For USB Type-C interfaces, an external Type-C controller chip assists
> by detecting cable attachment, determining plug orientation, and
> reporting USB PD message. The USB/DP combo PHY supports software
> configurable pin mapping and DisplayPort lane assignment. Based on
> these message, the combo PHY can perform both altmode switching and
> orientation switching via software.
> 
> The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
> fusb302 chip as Type-C controller. The connection diagram is shown below:
> 
> fusb302 chip +---> USB2.0 PHY ----> DWC3 USB controller
>              |
>              +---> USB/DP PHY0 +--> CDN-DP controller
>                                |
>                                +--> DWC3 USB controller
> 
> ====
> 3. Multiple bridge model for RK3399 CDN-DP
> 
> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> the CDN-DP can be switched to output to one of the PHYs.
> 
> USB/DP PHY0 ---+
>                | <----> CDN-DP controller
> USB/DP PHY1 ---+
> 
> In previous versions, if both PHY ports were connected to DP,
> the CDN-DP driver would select the first PHY port for output.
> 
> On Dmitry's suggestion, we introduced a multi-bridge model to support
> flexible selection of the output PHY port. For each PHY port, a
> separate encoder and bridge are registered.
> 
> The change is based on the DRM AUX HPD bridge, rather than the
> extcon approach. This requires the DT to correctly describe the
> connections between the PHY, USB connector, and DP controller.
> And cdn_dp_parse_hpd_bridge_dt() will parses it and determines
> whether to register one or two bridges.
> 
> ====
> Patch1 add default HPD device when register Displayport altmode.
> Patch2 add new Type-C mode switch for RK3399 USBDP phy binding.
> Patch3 add typec_mux and typec_switch for RK3399 USBDP PHY.
> Patch4 drops CDN-DP's extcon dependency when Type-C is present.
> Patch5 add multiple bridges to support PHY port selection.
> Patch6 add missing dp_out port for RK3399 CDN-DP.
> Patch7 add Type-C DP support for RK3399 EVB IND board.
> 
> Changes in v4:
> - Link to V3: https://lore.kernel.org/all/20250729090032.97-1-kernel@airkyi.com/
> - Add default HPD device for DisplayPort altmode.
> - Introduce multiple bridges for CDN-DP.
> - ...
> 
> Changes in v3:
> - Link to V2: https://lore.kernel.org/all/20250718062619.99-1-kernel@airkyi.com/
> - Add more descriptions to clarify the role of the PHY in switching.
> - Fix wrong vdo value.
> - Fix port node in usb-c-connector.
> 
> Changes in v2:
> - Link to V1: https://lore.kernel.org/all/20250715112456.101-1-kernel@airkyi.com/
> - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
> - Fix compile error when CONFIG_TYPEC is not enabled.
> - Notify DP HPD state by USB/DP PHY.
> - Ignore duplicate HPD events.
> - Add endpoint to link DP PHY and DP controller.
> - Fix devicetree coding style.
> 
> Chaoyi Chen (7):
>   usb: typec: Add default HPD device when register DisplayPort altmode
>   dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
>   phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
>   drm/rockchip: cdn-dp: Support handle lane info without extcon
>   drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
>     selection
>   arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
>   arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort
> 
>  .../phy/rockchip,rk3399-typec-phy.yaml        |   6 +
>  arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
>  .../boot/dts/rockchip/rk3399-evb-ind.dts      | 146 ++++++
>  drivers/gpu/drm/rockchip/Kconfig              |   1 +
>  drivers/gpu/drm/rockchip/cdn-dp-core.c        | 423 +++++++++++++++---
>  drivers/gpu/drm/rockchip/cdn-dp-core.h        |  23 +-
>  drivers/phy/rockchip/phy-rockchip-typec.c     | 365 ++++++++++++++-
>  drivers/usb/typec/altmodes/displayport.c      |  27 ++
>  drivers/usb/typec/altmodes/displayport.h      |   2 +
>  drivers/usb/typec/class.c                     |   8 +
>  include/linux/usb/typec_altmode.h             |   2 +
>  11 files changed, 932 insertions(+), 81 deletions(-)
> 
> --
> 2.49.0
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
 Base: tags/next-20250922 (best guess, 10/11 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250922012039.323-1-kernel@airkyi.com:

arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']






