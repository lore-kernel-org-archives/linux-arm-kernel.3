Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D9ACA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnhvrMRU0G4sFueNvawSUGt53uKKtYRG2McTbwQb1gk=; b=YgWAbBgudZvnNO5EiW0WWmVfOS
	Yl8kcaZJe2RKKNB6PVf5XoLE6YscFibVsrcn3vbbNqkhe8c5faw2hbKZZnKVq5Zmpk0vVqtuMXKMu
	n5eVDUZTUCprUQ46SXo6xQbAWQfFLNgLeg4X9/HRRRPpXDFrgQiRzXvHoes5T/3lwTBJ7pC61dQIi
	kyZ6oE3lVPtwwHcieLYTZ/o3+tL4UntutZjgbNMqG2pjQL6ViRocAG4C/AFul3T6lO/P4orMtDLk3
	6qz/Uc6BmihXZqj2NETkHk+R13U6l1uPKM70i85+WKMovGM3CpTbmIOp9JLa7sFNcE24HbEEXWLsW
	FHagjY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcU-000000011Wz-3lBX;
	Fri, 22 Aug 2025 00:27:03 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8E9-0000000HYJg-2lQC;
	Thu, 21 Aug 2025 16:33:27 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1ED2C14002A4;
	Thu, 21 Aug 2025 12:33:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 21 Aug 2025 12:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1755794004; x=1755880404; bh=WnhvrMRU0G
	4sFueNvawSUGt53uKKtYRG2McTbwQb1gk=; b=o4O53yF+lXPDP0nzGjDDcYosBQ
	K2J2DmV4gOQeFdk8HCrL7+EsaBIlbzZ99pCPA4yfDkuIcYBTDBVQD3IErkd0i9Z4
	7hsZWwpjcCX8E+jdf3IniO7n/0wogLgrUEUaxBCvXFFsrKJ2ufUh0Mwng/mr4qyI
	HV0E3+fO/DWynna5QAYqI14MmiEOlIIAywFwAEUcpY1D2drymaFOwPuN7mVsqddh
	V2VzbJIWu7PzN568ByWW3QDu/f7KzXNAqiEcHsvvUdYkCaHniySvkn/NIr2vMqyY
	k7RoXfCm6bhpXK22h+Q653vGF8Wn9rU5raSZuhyqfhRx+UQMK4dy9r3E1n3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755794004; x=1755880404; bh=WnhvrMRU0G4sFueNvawSUGt53uKKtYRG2Mc
	TbwQb1gk=; b=USZ+a7ET46mt/NqAtfTT80hSCq16JndAN3AsGUg15BS7AUJOYpZ
	2zabDX95r8waba2ThKKKmMoWoTQfXyqc/CYAiT+LPdiDcVO1v6va9NvlEAhBNSgL
	uC6UuNilVvshBwCew7jLWkU1mDUhaQEfGK7sZZYnQ88N+s2lJ7/eA1Q6N1Qei9FW
	t3gieJZ0EW/ugtZbtPEmAczcZ/w/YhVrQvKBB3OIjC7ZIih6csGIWHimq0xP5fdj
	8ig75d7bzrVO12qeUtXjaf1TDxDNHShX14BMhjxV44DS94JbkTSafNxc/3Aewj8s
	9foB+FIlcgabXqPhXv25S0rn7hO26E0CCww==
X-ME-Sender: <xms:UkqnaDpo1zdgcc3MUoykP1u5MRsaSTr0QVK4aSLHKfIoLtZI3X4IEA>
    <xme:UkqnaMBmRgNl7WXHma0g0QJY822DxrUTSU6ED8dJk4x0Sy7tZUS92SvjD6gcXrSFK
    MQWhzaX5n9Bc6xqIbg>
X-ME-Received: <xmr:UkqnaMP4tVmbVk--IVeagBtMe1LcCdLalnqmTztgCZI-tFB7HU2nJ-_T-_zVcr1TJr2ReIbXkvUIysrxofzHRDrJX529GWZy5Ac>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedujedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeettd
    ehleefveduteehudeklefhhfdvheffudekkeelkeeijeejgfeljeevhefhtdenucffohhm
    rghinhepuggvvhhitggvthhrvggvrdhorhhgpdhkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdr
    nhgvthdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhn
    uhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrlhgsih
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvghi
    ghdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepvh
    hkohhulheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UkqnaKCzGd7lNR73vqhqz3zUakNcVipSTIxeWaY6xlQ_y0xPglfJQQ>
    <xmx:UkqnaK9cnQlTZFRIsxRQ0NZXZ5mXUfqIDt-WOUwKHJ8vUc3N3BH2rA>
    <xmx:UkqnaLFkqHaQLEgb1tEXvT1vFWNr2SCbksOK3Ex11xwdfsGdHIyOTA>
    <xmx:UkqnaBLzD6CtS6P_bX5Ek5zSBXhdtmNDdoqNeeYkNAzMGvH4W4HTdw>
    <xmx:VEqnaEjtt7i03_bO3qzyfztIdHyrM3CKmFPT0wSwZD9jb5uJK3mMBEH3>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 12:33:22 -0400 (EDT)
Date: Thu, 21 Aug 2025 18:33:20 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 03/22] dt-bindings: phy: Add Apple Type-C PHY
Message-ID: <20250821163320.GE1270980@robin.jannau.net>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-3-172beda182b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821-atcphy-6-17-v1-3-172beda182b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_093326_210557_461B3EE9 
X-CRM114-Status: GOOD (  25.82  )
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

On Thu, Aug 21, 2025 at 03:38:55PM +0000, Sven Peter wrote:
> Apple's Type-C PHY (ATCPHY) is a PHY for USB 2.0, USB 3.x,
> USB4/Thunderbolt, and DisplayPort connectivity found in Apple Silicon
> SoCs.
> 
> The PHY handles muxing between these different protocols and also provides
> the reset controller for the attached dwc3 USB controller.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  .../devicetree/bindings/phy/apple,atcphy.yaml      | 210 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 211 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..eb14010557c94f313b54b528e2d4039fe540062a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> @@ -0,0 +1,210 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/apple,atcphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Type-C PHY (ATCPHY)
> +
> +maintainers:
> +  - Sven Peter <sven@kernel.org>
> +
> +description:
> +  The Apple Type-C PHY (ATCPHY) is a PHY for USB 2.0, USB 3.x,
> +  USB4/Thunderbolt, and DisplayPort connectivity found in Apple Silicon SoCs.
> +
> +  The PHY handles muxing between these different protocols and also provides the
> +  reset controller for the attached dwc3 USB controller.
> +
> +  The PHY is designed for USB4 operation and does not handle individual
> +  differential pairs as distinct DisplayPort lanes. Any reference to lane in
> +  this binding hence refers to two differential pairs (RX and TX) as used in USB
> +  terminology.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - apple,t6000-atcphy
> +      - apple,t6000-atcphy-dp-only # PHY hardwired to DP-to-HDMI converter on M2 Pro MacBook

The comment is misleading, "t6000-atcphy-dp-only" would be for M1
Pro/Max Macbooks. M2 Pro/Max Macbooks use the same design so the
corresponding "apple,t6020-atcphy-dp-only" compatible is missing.
I'm not sure this is the correct design though as the HW block is
identical to "apple,t6000-atcphy".
I think it might be better to have either the DRM KMS driver or a
custom DP->HDMI drm_bridge switch the mode to DP-only.
Or atcphy could initialize itself to DP-only based on the available
ports.

> +      - apple,t6020-atcphy
> +      - apple,t8103-atcphy
> +      - apple,t8112-atcphy
> +
> +  reg:
> +    minItems: 5
> +    maxItems: 5
> +
> +  reg-names:
> +    items:
> +      - const: core
> +      - const: lpdptx
> +      - const: axi2af
> +      - const: usb2phy
> +      - const: pipehandler
> +
> +  "#phy-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 0
> +
> +  orientation-switch:
> +    type: boolean
> +    description:
> +      The PHY handles swapping lanes if the Type-C connector is flipped.
> +
> +  mode-switch:
> +    type: boolean
> +    description:
> +      The PHY handles muxing between USB 2.0, USB 3.x, USB4/Thunderbolt, and DisplayPort.

These two properties could be referenced from
/schemas/usb/usb-switch.yaml, see
https://lore.kernel.org/linux-devicetree/20250807-topic-4ln_dp_respin-v4-1-43272d6eca92@oss.qualcomm.com/

> +  power-domains:
> +    minItems: 1
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the PHY to the Type-C connector

Not sure if it's justified to mention the hardwired DP->HDMI converter
in 14-/16-inch Macbooks Pro here as well.

> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Incoming endpoint from the USB3 controller
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Incoming endpoint from the DisplayPort controller
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Incoming endpoint from the USB4/Thunderbolt controller
> +
> +  apple,tunable-axi2af:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      AXI2AF tunables.
> +
> +      This array is filled with 3-tuples each containing three 32-bit values
> +      <register offset>, <mask>, and <value> by the bootloader.
> +      The driver will use these to configure the PHY by reading from each
> +      register, ANDing it with <mask>, ORing it with <value>, and storing the
> +      result back to the register.
> +      These values slightly differ even between different chips of the same
> +      generation and are likely calibration values determined by Apple at
> +      manufacturing time.
> +
> +  apple,tunable-common:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Common tunables required for all modes, see apple,tunable-axi2af for details.
> +
> +  apple,tunable-fuses:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Fuse based tunables required for all modes, see apple,tunable-axi2af for details.
> +
> +  apple,tunable-lane0-usb:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      USB tunables on lane 0, see apple,tunable-axi2af for details.
> +
> +  apple,tunable-lane1-usb:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      USB tunables on lane 1, see apple,tunable-axi2af for details.
> +
> +  apple,tunable-lane0-cio:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      USB4/Thunderbolt ("converged IO") tunables on lane 0, see apple,tunable-axi2af for details.
> +
> +  apple,tunable-lane1-cio:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      USB4/Thunderbolt ("converged IO") tunables on lane 1, see apple,tunable-axi2af for details.
> +
> +  apple,tunable-lane0-dp:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      DisplayPort tunables on lane 0, see apple,tunable-axi2af for details.
> +
> +      Note that lane here refers to a USB RX and TX pair re-used for DisplayPort
> +      and not to an individual DisplayPort differential lane.
> +
> +  apple,tunable-lane1-dp:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      DisplayPort tunables on lane 1, see apple,tunable-axi2af for details.
> +
> +      Note that lane here refers to a USB RX and TX pair re-used for DisplayPort
> +      and not to an individual DisplayPort differential lane.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#phy-cells"
> +  - "#reset-cells"
> +  - orientation-switch
> +  - mode-switch

any reason not to require "ports"? This would be carried over from
usb-switch

Janne

