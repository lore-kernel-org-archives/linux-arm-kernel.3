Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F326C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoONRJEAHyt7PmwItblGytvIcm1q1lLU8/Xr14JdJ0g=; b=jENdBOcuY9+igCKY1JjXBMSVxE
	QMuWxGJRJ8bga2IVtFfEpbP6+s67q6EkU4WuWjaTXdBxgBPIxJ6uQoG+QhpnKwljocpRgcGm0Z4AE
	47yuvnClnD6T+H+uRtOpVb2TEQQ0vDSDmhBqt1w+zDCPJDrWbiaI83cGnBgw67AcahWm3UdD19nI6
	L81cfNkyAMAtqzVjNoZg0YXAbrPvUahwNX5t/2lff/ZSB1C7sx8VCfiUL2hQ8Mx1rbwcZCsG1lKoS
	2ILV+Cy84UxeYSU+XyemEo+cJu/0WUnccTfqazsF69HNvlldJp2n/BYcpGmFMo4iJhI9N9aCOVSiG
	J66fLEfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP33O-00000007gT6-1gCI;
	Tue, 10 Jun 2025 17:46:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP08G-000000079Cx-1QFG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:39:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A423E49F22;
	Tue, 10 Jun 2025 14:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FEEC4CEED;
	Tue, 10 Jun 2025 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749566359;
	bh=NCUWuCdR+i+AqSI5AiUCl5RBbmPmX8XOLT9C8aAZ8ZA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NyEVtH4DssdpsNDhUQbAY09lANFHt9M+dNMBF0iY0fUX3nQUwUChxWjC1ExiVKCaA
	 Ya3lIM8hHCoPL5GhDVLsEYs4+A8Vb1c+B9ljAY5XdM+pu3meNQ5wTboMQnOVVmtYT3
	 ApilqsoWXvyu4cRsB63Vjwq85ttoT69hWtChnPwefIYoCSB4w7Wxv6u3GNX6U4wVsJ
	 PPIvdid66h2sZlFsXhJJ50ZRqToXddWb2P6uCAdnyFzdU1MnVBevG2VwfmjUqu+zdQ
	 eKhuY4hBX4Hygv6igLZoYToTtPK4OnPAz1ZDMsRLgOE4Ougn7LFpxy29NnykeDHXVl
	 zIp6EFR9I/5tQ==
Date: Tue, 10 Jun 2025 09:39:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kuba@kernel.org, andrew+netdev@lunn.ch, sboyd@kernel.org, 
 netdev@vger.kernel.org, joel@jms.id.au, p.zabel@pengutronix.de, 
 edumazet@google.com, pabeni@redhat.com, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, linux-clk@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, 
 davem@davemloft.net, BMC-SW@aspeedtech.com, 
 linux-arm-kernel@lists.infradead.org, andrew@codeconstruct.com.au, 
 mturquette@baylibre.com
To: Jacky Chou <jacky_chou@aspeedtech.com>
In-Reply-To: <20250610012406.3703769-1-jacky_chou@aspeedtech.com>
References: <20250610012406.3703769-1-jacky_chou@aspeedtech.com>
Message-Id: <174956612600.1562300.48579876569491246.robh@kernel.org>
Subject: Re: [net-next v2 0/4] net: ftgmac100: Add SoC reset support for
 RMII mode
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_073920_480566_AE189A8D 
X-CRM114-Status: GOOD (  21.02  )
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


On Tue, 10 Jun 2025 09:24:02 +0800, Jacky Chou wrote:
> This patch series adds support for an optional reset line to the
> ftgmac100 ethernet controller, as used on Aspeed SoCs. On these SoCs,
> the internal MAC reset is not sufficient to reset the RMII interface.
> By providing a SoC-level reset via the device tree "resets" property,
> the driver can properly reset both the MAC and RMII logic, ensuring
> correct operation in RMII mode.
> 
> The series includes:
> - Device tree binding update to document the new "resets" property.
> - Addition of MAC1 and MAC2 reset definitions for AST2600.
> - Device tree changes for AST2600 to use the new reset properties.
> - Driver changes to assert/deassert the reset line as needed.
> 
> This improves reliability and initialization of the MAC in RMII mode
> on Aspeed platforms.
> 
> Jacky Chou (4):
>   dt-bindings: net: ftgmac100: Add resets property
>   dt-bindings: clock: ast2600: Add reset definitions for MAC1 and MAC2
>   ARM: dts: aspeed-g6: Add resets property for MAC controllers
>   net: ftgmac100: Add optional reset control for RMII mode on Aspeed
>     SoCs
> 
>  .../bindings/net/faraday,ftgmac100.yaml       | 19 ++++++++++++++
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  4 +++
>  drivers/net/ethernet/faraday/ftgmac100.c      | 26 +++++++++++++++++++
>  include/dt-bindings/clock/ast2600-clock.h     |  2 ++
>  4 files changed, 51 insertions(+)
> 
> ---
> v2:
>   - Added restriction on resets property in faraday,ftgmac100.yaml.
> ---
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc6-1244-g3f1716ee0f6c (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250610012406.3703769-1-jacky_chou@aspeedtech.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-microsoft-olympus.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/bus@1e78a000/i2c@100/power-supply@58: failed to match any schema with compatible: ['pmbus']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-q71l.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: pin_gpio_f3: $nodename:0: 'pin_gpio_f3' does not match '-hog(-[0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2400-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/ethernet@1e670000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/ethernet@1e690000: failed to match any schema with compatible: ['aspeed,ast2600-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/ethernet@1e660000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/ethernet@1e680000: failed to match any schema with compatible: ['aspeed,ast2500-mac', 'faraday,ftgmac100']






