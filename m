Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24048CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 00:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY7+kmM1PK1xxc5XWtDZORGW/rBcM5bRoCuYOsau85U=; b=nbbrKICAcTpbDCCqoJLKYa07H1
	cvWM+9A8oVl2f8TDbH4vZLqgxPDVXFGfyqG7rhNAuTUql2auAJ3sSfChyzmw4SNPveeq2pX+pKLJz
	GDVnscHeQv5keQs1RwX56X6kmsoV+qookO7nlOgkv3BBUqRhR71z8KVfpZ7xznK5V6ocQNp7js4D1
	3r7rA5G8j3Pjoh2uNeVwUJYqKobALOCK0iVWR9gCeObJjTZ8bU0uT2o74+JSW6a9QL8NsIszljv56
	uZZYicixzL0XscUeUaajtsP+31YpPp0gv7ibT0ZwSv5++a0WgGvtOuIGvdAe9h/yVRX8Q+DE3CVf2
	ODAXqkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbuD-00000006HTM-1unJ;
	Tue, 11 Nov 2025 00:06:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbuA-00000006HSq-3LCD;
	Tue, 11 Nov 2025 00:06:40 +0000
Received: from pendragon.ideasonboard.com (82-203-161-95.bb.dnainternet.fi [82.203.161.95])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 01CBA229;
	Tue, 11 Nov 2025 01:04:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762819474;
	bh=b5HS5K/i5xVYvmbaitgAoeK1jJwdqZvJ5YqTS2oQGt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRGfahFtN7D5jcuxstlmLl4C86FOFe5h+RrhdVZauzDfjgVUwnetdZW3MpZMq+G0A
	 w9qJ85assYM1fs/uzyh3k/P4jkNteNKz8v1vdCQt5ggLDwyZ7paDQWVI993kVMTKzW
	 ZW+OP3olGOZpzooHk/tYV6rIdfKeB/N7wLEvj6iU=
Date: Tue, 11 Nov 2025 02:06:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v14 00/18] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <20251111000627.GA30837@pendragon.ideasonboard.com>
References: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
 <aQ4tJg8r_j4NyKhv@kekkonen.localdomain>
 <074cd08e-0412-49f9-8dd9-b1f96eb11717@collabora.com>
 <20251107185441.GG5558@pendragon.ideasonboard.com>
 <13c43edb-9592-4779-a39a-7856bb0f964d@collabora.com>
 <aRGlvQRVoQs0WjyA@kekkonen.localdomain>
 <b89746e1-4574-4b65-af69-c533576ed185@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b89746e1-4574-4b65-af69-c533576ed185@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_160638_981335_A6A6358A 
X-CRM114-Status: GOOD (  56.62  )
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

On Mon, Nov 10, 2025 at 11:29:57AM +0100, Michael Riesch wrote:
> On 11/10/25 09:43, Sakari Ailus wrote:
> > On Fri, Nov 07, 2025 at 09:51:37PM +0100, Michael Riesch wrote:
> >> On 11/7/25 19:54, Laurent Pinchart wrote:
> >>> On Fri, Nov 07, 2025 at 07:41:59PM +0100, Michael Riesch wrote:
> >>>> On 11/7/25 18:32, Sakari Ailus wrote:
> >>>>> On Fri, Oct 24, 2025 at 02:51:29PM +0200, Michael Riesch via B4 Relay wrote:
> >>>>>> Habidere,
> >>>>>>
> >>>>>> This series introduces support for the Rockchip Camera Interface (CIF),
> >>>>>> which is featured in many Rockchip SoCs in different variations.
> >>>>>> For example, the PX30 Video Input Processor (VIP) is able to receive
> >>>>>> video data via the Digital Video Port (DVP, a parallel data interface)
> >>>>>> and transfer it into system memory using a double-buffering mechanism
> >>>>>> called ping-pong mode.
> >>>>>> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
> >>>>>> DVP and a MIPI CSI-2 receiver that can receive video data independently
> >>>>>> (both using the ping-pong scheme).
> >>>>>> The different variants may have additional features, such as scaling
> >>>>>> and/or cropping.
> >>>>>> Finally, the RK3588 VICAP unit constitutes an essential piece of the
> >>>>>> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> >>>>>> units, and a data path multiplexer (to scaler units, to ISP, ...).
> >>>>>
> >>>>> I understand both RK3568 and RK3588 include an ISP. Do you have insight on
> >>>>> how would this work, should the support for the ISP be added later on?
> >>>>
> >>>> Short answer: Yes and yes.
> >>>>
> >>>> Long answer:
> >>>>
> >>>> The patch series at hand adds support for the PX30 VIP and the RK3568
> >>>> VICAP. I cannot really say something about the PX30, but on the RK3568
> >>>> VICAP and ISP are orthogonal (the ISP features its own MIPI CSI-2
> >>>> receiver, different from that introduced in this series). Thus, ISP
> >>>> support can be introduced anytime (whenever someone is motivated ;-)).
> >>>
> >>> Won't they both be connected to the same sensor though, and probably the
> >>> same D-PHY in the SoC ? They don't seem entirely separate to me.
> >>
> >> The MIPI CSI-2 DPHY is shared, indeed. Thus, they *maybe technically
> >> could be* connected to the same sensor, but I don't know whether that
> >> works and fail to see why anyone would to such a thing (if it is about
> >> raw capture, the MIPI CSI-2 receiver in the ISP can do that on its own).
> >>
> >> The DPHY can be operated in split mode, with two lanes for VICAP and two
> >> lanes for ISP. This is not implemented yet, but can be done at a later
> >> stage on PHY level (not media related). In this case, ISP and VICAP can
> >> receive data from different subdevices via CSI-2.
> > 
> > The two would be part of the same media graph in that case and as there are
> > two CSI-2 receivers and a single PHY, the PHY would probably need to have a
> > sub-device as well, to allow link configuration to be used to select where
> > the PHY is connected.
> > 
> > I don't think we have such a setup elsewhere, and supporting this would
> > require changes in the MC framework.
> 
> What follows is a response that also addresses issues raised during our
> off-list discussion.
> 
> First of all, I agree with you that the RK3568 HW is "a bit special" (to
> say the least) in that regard. Let's have an outlook to newer SoCs, such
> as the RK3588: Here, the MIPI CSI-2 DPHYs (there are two of them) with
> their split mode are present as well, but the assignment is fixed. For
> example, the RK3588 VICAP has six MIPI CSI-2 receiver units and six MIPI
> CSI-2 capture units. Units 1 and 2 handle a different MIPI PHY, units 3
> and 5 handle the DPHYs (without split mode), units 4 and/or 6 are active
> whenever DPHY 1 and/or 2 is in split mode.
> 
> I would model this by adding support for more than one (logical) PHYs
> (phy-cells = <1>;) and assigning the logical PHYs to the MIPI CSI-2
> receivers. There is not really a possibility to route anything at this
> point (routing is done in a MUX unit that takes the different MIPI CSI-2
> receivers as inputs).
> 
> Now back to the peculiar RK3568 situation: By default the split mode of
> the DPHY is off and both VICAP and ISP are able to receive the same data
> (from up to four lanes) with their MIPI CSI-2 receivers (not sure
> whether both can be active at the same time, though).

A common use case for capturing data from the same sensor through both
ISP and VICAP would be routing image data to the ISP and embedded data
to VICAP. Assuming the hardware is able to do this, there will be users
interested in this feature.

> There are two bits
> in the GRF that define the lanes that ISP and VICAP receive in split
> mode (lane 0/1 or lane 2/3). Not sure whether these bits are supposed to
> be changed during runtime.
> 
> I would suggest modelling this on PHY level in DT, e.g., by passing
> reasonable properties to the dphy node, such as
>     rockchip,dphy-split-mode;

Split mode should indeed be conveyed through DT, as it's a property of
the hardware.

>     rockchip,dphy-split-invert;
> where the former activates the split mode and assigns lanes 0/1 to the
> ISP and lanes 2/3 to the VICAP, and the latter inverts this assignment
> (lanes 2/3 to the ISP and lanes 0/1 to the VICAP). This would facilitate
> the reasonable use cases with reasonable effort.

This I'm less convinced about. The routing should be dynamic.

How do you envision the connections to the CSI-2 sources to be modelled
in DT ? We need ports and endpoints, and data-lanes properties. Where
would those reside on the RK3568 side ?

> Otherwise, to keep it perfectly general and most flexible and
> everything, we would have to introduce another subdevice indeed, which
> would be active on the RK3568 exclusively. Therefore, I don't see that
> the PHY driver introduces this subdevice, but a specialized (syscon?)
> MUX driver that deals with the RK3568 GRF bits. Something like this
> 
>                            |----------------------|     |-------------|
>  Sensor A --- /2 lanes --- | lane 0/1      to ISP | --- | ISP MIPI RX |
>                            |                      |     |-------------|
>                            |                      |
>                            |                      |     |-------------|
>  Sensor B --- /2 lanes --- | lane 2/3    to VICAP | --- |VICAP MIPI RX|
>                            |----------------------|     |-------------|
> 
> But IMHO this will be too much effort for corner use case that I doubt
> anyone will actually use.
> 
> What do you think:
>  - Let's keep the PHYs out of V4L2/MC, ok?
>  - Let's model the reasonable use cases with device tree properties in
>    the dphy DT node, ok?

I think the routing should be dynamic.

> > How does the media graph look like for the device at the moment?
> 
> Please take a look at the media graph in the documentation patch (PATCH
> v14 01/18). This is without the ISP, but gives an overview of what the
> RK3568 VICAP is capable of.
> 
> Best regards,
> Michael
> 
> >> BTW the ISP is able to process the data captured by VICAP, but
> >> apparently this includes a RAM round trip (VICAP captures to memory, ISP
> >> operates in mem2mem mode).
> >>
> >>> A block diagram that shows connections between the CSI-2 pins, D-PHY,
> >>> CSI-2 receivers, VICAP and ISP could help.
> >>>
> >>>> Once this patch series is merged, I'll push out changes that introduce
> >>>> support for the RK3588 VICAP. We can discuss the integration of any
> >>>> RK3588 ISP in this scope then -- and there may be some things to discuss
> >>>> as there the VICAP and the ISP(s) are directly connected by means of a
> >>>> MUX unit in the VICAP.
> >>>>
> >>>> Alright?

-- 
Regards,

Laurent Pinchart

