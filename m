Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD6CCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTkCKYv9100VV05fZFBdPk0Ja0hqcAnlLJTnBmpwG6U=; b=Lt7mP6+0gHTMlxNzWexFkJXs9K
	rg0zDyaTWY2D9lXg2LRDJOxwx4z4aeN+K01Bg3N+PF05X89y3L+oQZSHPjSiBSRbB0yISaA8Eu/2s
	Z1UsvfUmNkprTg04AOYBdj8QQ57Edl69Zh3LK/XbgqEV0GfBpBeV+5Fz4oxjPP54fg5Ig+2G+OuiK
	kl1EXGecgSMzrfJ+/6UboT+TOfXOHEopT1glIS6Xi1Nbxo7mYbjczGP56EGYC1mPqEGBuCIL7Gv5z
	6rH0GlJCurhkjX1a+nn01Izrv0KKEDYrS6UbApX/KBEfbSDiyzacRMuSC+2ziKfcJtIk9mXEB3R/9
	ikJDrPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91CK-00000001eYv-0xsh;
	Wed, 15 Oct 2025 13:05:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91CH-00000001eWf-0kpO;
	Wed, 15 Oct 2025 13:05:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0A1E44909;
	Wed, 15 Oct 2025 13:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A275C4CEF8;
	Wed, 15 Oct 2025 13:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760533540;
	bh=2r5714A42xcyIZFh8H5uVbCGHRJdXN2qlO5VN/2T0Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVh+57mKWZVZm31clx69McTVpcKPtVKXMVsVHMnFx1t54sVuWgpEGP38jnNDor41z
	 SQjR5suW6Rady1D6k/JVqoY2mYJR5TKba++BzWoKWtgms8nEKR9/Uso/JybM5VM+wY
	 P+yBwwelUiv7OBSqvJ3czmFScuZTt+s7TlVywdM2OHz5kZl2NyRhgJmIs3oL5scNRE
	 QQYTD2wgDx26wtabWpXNT6Gu9IBvwR2NB9X7D7XQ1B8FWNGnrQ81P0Hy0CaowrEKl6
	 6vngZORTXSdIEAvD3bi4EV3iZfCDqRRDBGzbTABJ3fmahCFbrBcCzjOK4KjjrzFiEb
	 lICeM2lYuHQvg==
Date: Wed, 15 Oct 2025 08:05:38 -0500
From: Rob Herring <robh@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: phy: google: Add Google Tensor G5
 USB PHY
Message-ID: <20251015130538.GA3214399-robh@kernel.org>
References: <20251010201607.1190967-1-royluo@google.com>
 <20251010201607.1190967-4-royluo@google.com>
 <75756635-b374-4441-8526-175210e01163@kernel.org>
 <CA+zupgwHFpP5GEwGxOksmLJBU7+Kr_o0p50Pad1NmwNB0AxcGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+zupgwHFpP5GEwGxOksmLJBU7+Kr_o0p50Pad1NmwNB0AxcGA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_060541_275889_C67823B2 
X-CRM114-Status: GOOD (  23.09  )
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

On Mon, Oct 13, 2025 at 06:46:39PM -0700, Roy Luo wrote:
> On Fri, Oct 10, 2025 at 5:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 10/10/2025 22:16, Roy Luo wrote:
> > > +  reg:
> > > +    items:
> > > +      - description: USB2 PHY configuration registers.
> > > +      - description: DisplayPort top-level registers.
> > > +      - description: USB top-level configuration registers.
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: u2phy_cfg
> > > +      - const: dp_top
> > > +      - const: usb_top_cfg
> > > +
> > > +  "#phy-cells":
> > > +    const: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  orientation-switch:
> > > +    type: boolean
> > > +    description:
> > > +      Indicates the PHY as a handler of USB Type-C orientation changes
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reg-names
> > > +  - "#phy-cells"
> > > +  - clocks
> > > +  - resets
> > > +  - power-domains
> > > +  - orientation-switch
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    soc {
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > > +
> > > +        usb_phy: usb_phy@c410000 {
> > > +            compatible = "google,gs5-usb-phy";
> > > +            reg = <0 0x0c450014 0 0xc>,
> > > +                  <0 0x0c637000 0 0xa0>,
> >
> > You probably miss DP support and this does not belong here.
> 
> This register space isn't solely for DP operation, a significant portion
> manages the custom combo PHY. Consequently, this space is essential
> even for USB-only operation. We can expect more registers in the space
> to be utilized when DP support is added.
> 
> While I acknowledge the current name is confusing, it directly reflects
> the hardware documentation. We can either adhere to the hardware
> documentation's naming or propose a more descriptive alternative.
> What's your preference?
> 
> >
> > > +                  <0 0x0c45002c 0 0x4>;
> >
> > That's not a separate address space. I really, really doubt that
> > hardware engineers came with address spaces of one word long.
> 
> I initially created this space to access the usb2only mode register,
> which must be programmed when the controller operates in high-speed
> only mode without the USB3 PHY initialized. Upon review, I now
> believe the controller driver is the better location for this configuration,
> as the register logically belongs there and the controller can tell
> whether usb3 phy is going to be initialized.
> 
> That is, I'm removing this register space in the next patch.

You are missing the point. What exists from 0x0c450020-2c and 
0x0c450000-0x14 for that matter? Hardware blocks don't just start on 
unaligned boundaries like 0x14 or 0x2c. DT describes the h/w blocks, not 
just nodes of what a driver needs. So if the 0x2c register needs to be 
accessed by the USB driver, that's fine, but the register doesn't go in 
the USB controller node 'reg'. A property with a phandle to the node 
defining all the 0x0c450000 registers and an offset (if needed) is 
typically what we do there. Or you can just find that node by 
compatible.

Rob

