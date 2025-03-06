Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEAFC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/l3297Aly6n/qBAueWz12hEPxnEHvfm6GKPejWJ/Vw=; b=tvJXVp13IN8WBWXfp1Kl7EMlBM
	eb5BvFcoif3saCqYfENQHtRuYOEmy7kXrRWerJbGB4Q06gXd3Vpx0jq6FDQPUwFPUz/G0mRg4gRg2
	CN5f+dMN+GErvKS3y95+YXMR7Iz7DU47+y3XUGH7nb9rfIFPvz+Pjq6+UJ5KiebdIvJckgObunqt0
	FIuh0BwBz0jvor6o8gaNmR+7lfE2aVLmYaU76BOQ8cYQP65ghhSSRXmt1WljsN4bgfTmroZBBElmH
	ss7+z+cdSbUgJZZq/pevygfruxkHI5C++vRn/SYtvqZ7AuJullD6qLw2U+EhF1PccAjKmQXnwf6PL
	L7RPra1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDEV-0000000BL4L-3fqk;
	Thu, 06 Mar 2025 15:33:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqB2i-0000000B10o-3cj5;
	Thu, 06 Mar 2025 13:13:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741266806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ln67D7B8R/emwNovVLhkaz7xbVh04EGL2fSTkLDhliu0yFF5HPOStn0Fyk7RGUSm6kz3daWv2CrhBsEXy5NJydyy2CaaXI30XHo8uo38Ng0OYX1igVJcmSzIsV3OL1w4E/4RfOr0qKK6iJs+ZrcRuTffIcpmK0FAp0SAVAEM4YQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741266806; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R/l3297Aly6n/qBAueWz12hEPxnEHvfm6GKPejWJ/Vw=; 
	b=MMm0eR+LmbNeSFSuObeLJGIE34hmTdHHG+dO6tTDWE1hVzlgVjE9tnZIEqsZbRWhIdFXkx/nPiRl+PTGYUaqS22megAsU4oUjwdDdVt9zrkcXLANi2CANfUR3Gl8dxw14v2w/5zlrF3Qc5vLy8dmkkS2IHvEtTwDHQGaMpvi4Vg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741266806;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=R/l3297Aly6n/qBAueWz12hEPxnEHvfm6GKPejWJ/Vw=;
	b=jLTo6eWuwglmC71EtgyEJQ8kL0bFRLESM9jvJbnBxLKoc4vQBGYlIU3eCrW82lcq
	VVceuFNVewMSvTKT54YH8U8WN8NraGIPvbNxZ0XrB47XCseCv3JRCN2U7fAQVMb90wI
	M0/ZAU/gqUDRQ3YvHFtJeQdvnxMJgFKwn+UZxeV0=
Received: by mx.zohomail.com with SMTPS id 1741266806086596.4769996246168;
	Thu, 6 Mar 2025 05:13:26 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/7] ASoC: dt-bindings: add schema for rockchip SAI controllers
Date: Thu, 06 Mar 2025 14:13:18 +0100
Message-ID: <2376575.ElGaqSPkdT@workhorse>
In-Reply-To: <ffd6287c-cbfd-4ba8-9332-45bad4e60583@kernel.org>
References: <20250305-rk3576-sai-v1-0-64e6cf863e9a@collabora.com>
 <20250305-rk3576-sai-v1-3-64e6cf863e9a@collabora.com>
 <ffd6287c-cbfd-4ba8-9332-45bad4e60583@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_051340_976733_54DDC6C7 
X-CRM114-Status: GOOD (  31.12  )
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

On Thursday, 6 March 2025 08:42:54 Central European Standard Time Krzysztof 
Kozlowski wrote:
> On 05/03/2025 22:24, Nicolas Frattaroli wrote:
> > Rockchip introduced a new audio controller called the "Serial Audio
> > Interface", or "SAI" for short, on some of their newer SoCs. In
> > particular, this controller is used several times on the RK3576 SoC.
> > 
> > Add a schema for it, with only an RK3576 compatible for now. Other SoCs
> > may follow as mainline support for them lands.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> > 
> >  .../devicetree/bindings/sound/rockchip,sai.yaml    | 151
> >  +++++++++++++++++++++
> Filename based on compatible.

Sure, but more compatibles will follow. Are you certain you want a file named 
rockchip,rk3576-sai.yaml to then contain rockchip,rk3528-sai? If so then I do 
not understand the reason behind this policy.

> 
> >  MAINTAINERS                                        |   6 +
> >  2 files changed, 157 insertions(+)
> 
> ...
> 
> > +
> > +  dma-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    oneOf:
> > +      - const: tx
> > +      - const: rx
> > +      - items:
> > +          - const: tx
> > +          - const: rx
> 
> Why all combinations are possible?

Because they are. sai5 in rk3576 is rx only. sai7 is tx only. Others are both 
tx and rx. Do you want me to enforce that those with both are always tx 
followed by rx?

> 
> > +
> > +  clocks:
> > +    items:
> > +      - description: master audio clock
> > +      - description: AHB clock driving the interface
> > +
> > +  clock-names:
> > +    items:
> > +      - const: mclk
> > +      - const: hclk
> > +
> > +  resets:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: resets for the mclk domain and ahb domain
> 
> List the items instead with description and minItems: 1.

Will do

> 
> > +
> > +  reset-names:
> > +    minItems: 1
> > +    items:
> > +      - const: m
> > +      - const: h
> > +
> > +  port:
> > +    $ref: audio-graph-port.yaml#
> > +    unevaluatedProperties: false
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> > +  rockchip,sai-rx-route:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Defines the mapping of the controller's SDI ports to actual input
> > lanes, +      as well as the number of input lanes.
> > +      rockchip,sai-rx-route = <3> would mean sdi3 is receiving from
> > data0, and +      that there is only one receiving lane.
> > +      This property's absence is to be understood as only one receiving
> > lane +      being used if the controller has capture capabilities.
> > +    maxItems: 4
> > +    items:
> > +      enum: [0, 1, 2, 3]
> > +
> > +  rockchip,sai-tx-route:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Defines the mapping of the controller's SDO ports to actual output
> > lanes, +      as well as the number of output lanes.
> > +      rockchip,sai-tx-route = <3> would mean sdo3 is sending to data0,
> > and
> 
> I understand this is only example because = <3> would not be allowed
> (test it).

I'll have to look into that, I was fairly certain I tested it, but maybe I 
forgot to run a CHECK_DTBS with it in.

> 
> > +      that there is only one transmitting lane.
> > +      This property's absence is to be understood as only one
> > transmitting lane +      being used if the controller has playback
> > capabilities.
> > +    maxItems: 4
> > +    items:
> > +      enum: [0, 1, 2, 3]
> > +
> > +  rockchip,always-on:
> > +    type: boolean
> > +    description:
> > +      The hardware requires this controller to remain turned on.
> 
> How hardware requires this? You rather miss proper PM domain handling or
> some other resources.

This isn't about power domains. It's about the FS/SCLK generator inside the 
IP. I'll remove it in the next revision since downstream only uses it for a 
different IP on the RK3588, and I'd rather not get bogged down by discussions 
as to whether SAI should be modelled as a clock provider.

> 
> > +
> > +
> 
> Just one blank line.

Will do

> 
> > +required:
> > +  - compatible
> > +  - reg
> > +  - dmas
> > +  - dma-names
> > +  - clocks
> > +  - clock-names
> > +  - "#sound-dai-cells"
> > +
> > +unevaluatedProperties: false
> 
> Best regards,
> Krzysztof

Cheers,
Nicolas Frattaroli




