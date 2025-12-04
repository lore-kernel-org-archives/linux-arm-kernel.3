Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B506BD216A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9eanH0nm4DRmhwUyXkkzQf+KOnKRaPK9Ods9nFaUQg=; b=22CE9pdMddc9u0tudeOdHRTpJ5
	2M3A0e9Buorcls5dqi60NDgke21VfUFNJUblU3SW/71jcaynGVHsPS6VIYm8PfOYffpRbVYKmcVcc
	yl6zH++UOUmUkz3QxtrK7WzPq7i/6981NaYuMzso6op8uHimIuq0/Hy0qKh8KTiMOhD1SXYrlTLVD
	DPBHyiZhjrHUbKw4QsBQ470L+Q0CCm/9gzx7szPlfUt9wXA6NcFUx4KfM7y/pi2bof4H27wxxZYa0
	H7uXWmFKj5abe0EvBvblmn/JlHaccVYjWbFV+tHFKpspNRkeG3nlaADNakiw0s8vF2UJBagl/J69N
	B8fQUfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBx4-00000008GMc-271O;
	Thu, 04 Dec 2025 16:13:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBx3-00000008GM8-16PE;
	Thu, 04 Dec 2025 16:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A660260200;
	Thu,  4 Dec 2025 16:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26646C4CEFB;
	Thu,  4 Dec 2025 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764864784;
	bh=rlds9OxuuiX2BZpLBwXK3GF65T0dQAcIL0B/e32mGHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vhnm4d2AoIz4CSFvSog+EJ5WuUZqGUAt43oQ4tTZ3yrdltV6tUeVeBH/O4GzhAmw9
	 X3gmeuCy32BF7mLD0+13u3pPxCtPMwvlNkheLbkrxaOtz4wDC7jx84+ETMoEYUH8aK
	 yKQ7IK2U+diiUAiSjEA7yfEqvLZQ8BJdBWp+UDugqyYXt1upgTJoN8188QOq1TJv6M
	 8+kvoLcFz5e0VA/aScMhl3P4EHSAiCPsI58Le8Hcsb7Qnp/F9qmL6U5Fp64LjJz5Vd
	 vCwJ+5tM/HYidRxgw+XpkCgTrcUkEzG1oL3yFDw3uw4qMIIudycU+7lFtV1wPynE4O
	 A8KlSPWvYuMdw==
Date: Thu, 4 Dec 2025 10:13:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-phy@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next 3/9] dt-bindings: phy-common-props: RX and TX
 lane polarity inversion
Message-ID: <176486478133.1579282.8723601049864810210.robh@kernel.org>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
 <20251122193341.332324-4-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122193341.332324-4-vladimir.oltean@nxp.com>
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


On Sat, 22 Nov 2025 21:33:35 +0200, Vladimir Oltean wrote:
> Differential signaling is a technique for high-speed protocols to be
> more resilient to noise. At the transmit side we have a positive and a
> negative signal which are mirror images of each other. At the receiver,
> if we subtract the negative signal (say of amplitude -A) from the
> positive signal (say +A), we recover the original single-ended signal at
> twice its original amplitude. But any noise, like one coming from EMI
> from outside sources, is supposed to have an almost equal impact upon
> the positive (A + E, E being for "error") and negative signal (-A + E).
> So (A + E) - (-A + E) eliminates this noise, and this is what makes
> differential signaling useful.
> 
> Except that in order to work, there must be strict requirements observed
> during PCB design and layout, like the signal traces needing to have the
> same length and be physically close to each other, and many others.
> 
> Sometimes it is not easy to fulfill all these requirements, a simple
> case to understand is when on chip A's pins, the positive pin is on the
> left and the negative is on the right, but on the chip B's pins (with
> which A tries to communicate), positive is on the right and negative on
> the left. The signals would need to cross, using vias and other ugly
> stuff that affects signal integrity (introduces impedance
> discontinuities which cause reflections, etc).
> 
> So sometimes, board designers intentionally connect differential lanes
> the wrong way, and expect somebody else to invert that signal to recover
> useful data. This is where RX and TX polarity inversion comes in as a
> generic concept that applies to any high-speed serial protocol as long
> as it uses differential signaling.
> 
> I've stopped two attempts to introduce more vendor-specific descriptions
> of this only in the past month:
> https://lore.kernel.org/linux-phy/20251110110536.2596490-1-horatiu.vultur@microchip.com/
> https://lore.kernel.org/netdev/20251028000959.3kiac5kwo5pcl4ft@skbuf/
> 
> and in the kernel we already have merged:
> - "st,px_rx_pol_inv"
> - "st,pcie-tx-pol-inv"
> - "st,sata-tx-pol-inv"
> - "mediatek,pnswap"
> - "airoha,pnswap-rx"
> - "airoha,pnswap-tx"
> 
> and maybe more. So it is pretty general.
> 
> One additional element of complexity is introduced by the fact that for
> some protocols, receivers can automatically detect and correct for an
> inverted lane polarity (example: the PCIe LTSSM does this in the
> Polling.Configuration state; the USB 3.1 Link Layer Test Specification
> says that the detection and correction of the lane polarity inversion in
> SuperSpeed operation shall be enabled in Polling.RxEQ.). Whereas for
> other protocols (SGMII, SATA, 10GBase-R, etc etc), the polarity is all
> manual and there is no detection mechanism mandated by their respective
> standards.
> 
> So why would one even describe rx-polarity and tx-polarity for protocols
> like PCIe, if it had to always be PHY_POL_AUTO?
> 
> Related question: why would we define the polarity as an array per
> protocol? Isn't the physical PCB layout protocol-agnostic, and aren't we
> describing the same physical reality from the lens of different protocols?
> 
> The answer to both questions is because multi-protocol PHYs exist
> (supporting e.g. USB2 and USB3, or SATA and PCIe, or PCIe and Ethernet
> over the same lane), one would need to manually set the polarity for
> SATA/Ethernet, while leaving it at auto for PCIe/USB 3.0+.
> 
> I also investigated from another angle: what if polarity inversion in
> the PHY is one layer, and then the PCIe/USB3 LTSSM polarity detection is
> another layer on top? Then rx-polarity = <PHY_POL_AUTO> doesn't make
> sense, it can still be rx-polarity = <PHY_POL_NORMAL> or <PHY_POL_INVERT>,
> and the link training state machine figures things out on top of that.
> This would radically simplify the design, as the elimination of
> PHY_POL_AUTO inherently means that the need for a property array per
> protocol also goes away.
> 
> I don't know how things are in the general case, but at least in the 10G
> and 28G Lynx SerDes blocks from NXP Layerscape devices, this isn't the
> case, and there's only a single level of RX polarity inversion: in the
> SerDes lane. In the case of PCIe, the controller is in charge of driving
> the RDAT_INV bit autonomously, and it is read-only to software.
> 
> So the existence of this kind of SerDes lane proves the need for
> PHY_POL_AUTO to be a third state.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  .../bindings/phy/phy-common-props.yaml        | 45 +++++++++++++++++++
>  include/dt-bindings/phy/phy.h                 |  4 ++
>  2 files changed, 49 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


