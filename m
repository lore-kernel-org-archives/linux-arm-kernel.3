Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB04E6F071
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kpf0aKYEEhzTz55XUmzx5oYsgMAWnNxzxEmRlSLOTXc=; b=JEYBB2ceAHGVEpmy9UHUg4eKSH
	ONJtbR5bzylnUTuUXCS7QIi6L6hTkq5TXwGtdihAR64b3p5VNM1DID35j4Z/yn/tPOcawXv/r5okU
	jgPZ2sfKW7RVTAGeMSXLq6P6UQJMOrG0X4a/9MmGgrhI1dDYCio+gSM9EAQ9nfOunMprgxjtAEv4C
	nkt5DnL9BUPwcV6evEkHJTlfVvxw0j/B6+mMC1Hqi5HUaN2vFzuoTTMuBEPsqR7DKEgybLzODd90D
	CEO9GgKycEiAUx0V0znn2wp+DF/t6QUg/mi8Af03WkjxOz9w8dk0iD/9FHtfuqbcPEwPAvep3wAXJ
	0V8pTXXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vKA-00000007p9N-3D7r;
	Fri, 01 Nov 2024 17:20:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vIS-00000007okR-1iLm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 152E55C575B;
	Fri,  1 Nov 2024 17:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA84C4CECD;
	Fri,  1 Nov 2024 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730481530;
	bh=gsNwhZ0VFDipjEGs0USbTH0IaJWnf6Jp2pFdQmfYRME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8tBtBPtHwGw54YKtlGhJ01EjKzhNDF39m5VxXz3yItEZ/VdR7kDJQUIQebYlmgWo
	 5awNldrlMQ/t+R9iwcFh5RregIa+f4H/ax7LxKH4iKLEHWnSLXv90bHqSPRIWpTYEY
	 HJkSTo/wM99a3vIG0JIrVuAiYhSOaihsYolaPWgXtZqrHVznupPcW5KsGWzhlCBQ5v
	 uzfWe/CXlzuE+OVGHWgBaKOqEYc5XNZ2714wPhrjmFcI+gkTSBdqSxr4OJi8Ij7R4h
	 CSlSpcGJXRXnIXZMmAzfHyHkjkVOuzHcDtfZLDJldF/+Kg+u1MdNN5NDtZrszfpM/D
	 wftJ7dWx2KgLg==
Date: Fri, 1 Nov 2024 12:18:48 -0500
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"rfoss@kernel.org" <rfoss@kernel.org>,
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
	"jonas@kwiboo.se" <jonas@kwiboo.se>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"nfraprado@collabora.com" <nfraprado@collabora.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"sam@ravnborg.org" <sam@ravnborg.org>,
	"marex@denx.de" <marex@denx.de>
Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Message-ID: <20241101171848.GA3616730-robh@kernel.org>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
 <01c1c4f3-1652-4b08-bd35-08b4e1c04c79@nxp.com>
 <TY3PR01MB11346805C5D524D264669D178864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <750920ae-36b9-47f5-84e9-779332739f86@nxp.com>
 <TY3PR01MB1134610B42A1D3424D97B04CA864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <a166da61-8cd4-44c9-987b-94d8a62faf82@nxp.com>
 <TY3PR01MB113465D2F4C35A0728993D35E864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <cb74d47a-6d33-4f67-bf09-83173d49452f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb74d47a-6d33-4f67-bf09-83173d49452f@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_101852_567787_D5A306EB 
X-CRM114-Status: GOOD (  29.40  )
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

On Tue, Oct 29, 2024 at 04:25:52PM +0800, Liu Ying wrote:
> On 10/29/2024, Biju Das wrote:
> > 
> > Hi Liu Ying,
> 
> Hi Biju,
> 
> > 
> >> -----Original Message-----
> >> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Liu Ying
> >> Sent: 29 October 2024 07:35
> >> Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS display common properties
> >>
> >> On 10/29/2024, Biju Das wrote:
> >>> Hi Liu Ying,
> >>
> >> Hi Biju,
> >>
> >>>
> >>>> -----Original Message-----
> >>>> From: Liu Ying <victor.liu@nxp.com>
> >>>> Sent: 29 October 2024 07:13
> >>>> Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document
> >>>> dual-link LVDS display common properties
> >>>>
> >>>> On 10/29/2024, Biju Das wrote:
> >>>>> Hi Liu Ying,
> >>>>
> >>>> Hi Biju,
> >>>>
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Liu Ying <victor.liu@nxp.com>
> >>>>>> Sent: 29 October 2024 06:17
> >>>>>> Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document
> >>>>>> dual-link LVDS display common properties
> >>>>>>
> >>>>>> On 10/28/2024, Liu Ying wrote:
> >>>>>>> Dual-link LVDS displays receive odd pixels and even pixels
> >>>>>>> separately from dual LVDS links.  One link receives odd pixels and
> >>>>>>> the other receives even pixels.  Some of those displays may also
> >>>>>>> use only one LVDS link to receive all pixels, being odd and even agnostic.
> >>>>>>> Document common properties for those displays by extending LVDS
> >>>>>>> display common properties defined in lvds.yaml.
> >>>>>>>
> >>>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>>>>>> ---
> >>>>>>> v4:
> >>>>>>> * Squash change for advantech,idk-2121wr.yaml and
> >>>>>>>   panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.
> >>>>>>> (Rob)
> >>>>>>> * Improve description in lvds-dual-ports.yaml.  (Krzysztof)
> >>>>>>>
> >>>>>>> v3:
> >>>>>>> * New patch.  (Dmitry)
> >>>>>>>
> >>>>>>>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
> >>>>>>>  .../display/panel/advantech,idk-2121wr.yaml   | 14 +---
> >>>>>>>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +----
> >>>>>>>  3 files changed, 78 insertions(+), 32 deletions(-)  create mode
> >>>>>>> 100644
> >>>>>>> Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> >>>>>>>
> >>>>>>> diff --git
> >>>>>>> a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> >>>>>>> b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000000..5f7a30640404
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.ya
> >>>>>>> +++ ml
> >>>>>>> @@ -0,0 +1,76 @@
> >>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> >>>>>>> +1.2
> >>>>>>> +---
> >>>>>>> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
> >>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>>> +
> >>>>>>> +title: Dual-link LVDS Display Common Properties
> >>>>>>> +
> >>>>>>> +maintainers:
> >>>>>>> +  - Liu Ying <victor.liu@nxp.com>
> >>>>>>> +
> >>>>>>> +description: |
> >>>>>>> +  Common properties for LVDS displays with dual LVDS links.
> >>>>>>> +Extend LVDS display
> >>>>>>> +  common properties defined in lvds.yaml.
> >>>>>>> +
> >>>>>>> +  Dual-link LVDS displays receive odd pixels and even pixels
> >>>>>>> + separately from  the dual LVDS links. One link receives odd
> >>>>>>> + pixels and the other receives  even pixels. Some of those
> >>>>>>> + displays may also use only one LVDS link to  receive all pixels, being odd and even agnostic.
> >>>>>>> +
> >>>>>>> +allOf:
> >>>>>>> +  - $ref: lvds.yaml#
> >>>>>>> +
> >>>>>>> +properties:
> >>>>>>> +  ports:
> >>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>>>>> +
> >>>>>>> +    properties:
> >>>>>>> +      port@0:
> >>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>>>>> +        unevaluatedProperties: false
> >>>>>>> +        description: the first LVDS input link
> >>>>>>> +
> >>>>>>> +        properties:
> >>>>>>> +          dual-lvds-odd-pixels:
> >>>>>>> +            type: boolean
> >>>>>>> +            description: the first LVDS input link for odd pixels
> >>>>>>> +
> >>>>>>> +          dual-lvds-even-pixels:
> >>>>>>> +            type: boolean
> >>>>>>> +            description: the first LVDS input link for even
> >>>>>>> + pixels
> >>>>>>> +
> >>>>>>> +        oneOf:
> >>>>>>> +          - required: [dual-lvds-odd-pixels]
> >>>>>>> +          - required: [dual-lvds-even-pixels]
> >>>>>>> +          - properties:
> >>>>>>> +              dual-lvds-odd-pixels: false
> >>>>>>> +              dual-lvds-even-pixels: false
> >>>>>>> +
> >>>>>>> +      port@1:
> >>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>>>>> +        unevaluatedProperties: false
> >>>>>>> +        description: the second LVDS input link
> >>>>>>> +
> >>>>>>> +        properties:
> >>>>>>> +          dual-lvds-odd-pixels:
> >>>>>>> +            type: boolean
> >>>>>>> +            description: the second LVDS input link for odd
> >>>>>>> + pixels
> >>>>>>> +
> >>>>>>> +          dual-lvds-even-pixels:
> >>>>>>> +            type: boolean
> >>>>>>> +            description: the second LVDS input link for even
> >>>>>>> + pixels
> >>>>>>> +
> >>>>>>> +        oneOf:
> >>>>>>> +          - required: [dual-lvds-odd-pixels]
> >>>>>>> +          - required: [dual-lvds-even-pixels]
> >>>>>>> +          - properties:
> >>>>>>> +              dual-lvds-odd-pixels: false
> >>>>>>> +              dual-lvds-even-pixels: false
> >>>>>>
> >>>>>> Hmm, I should require port@0 or port@1.
> >>>>>
> >>>>> For dual LVDS, you need 3 ports as common use case
> >>>>
> >>>> For LVDS panels, only two ports for LVDS sink are needed.
> >>>> For display bridges with LVDS sink, one additional output port is
> >>>> needed.  However, I'm not sure if this output port should be
> >>>> documented in this binding or not, because it doesn't look common enough considering the LVDS
> >> panels.
> >>>>
> >>>>>
> >>>>> 2 input ports and 1 outport and all are required properties.
> >>>>
> >>>> The output port cannot be required for LVDS panels at least.
> >>>
> >>> Ack.
> >>>
> >>>>
> >>>> We need to require one or two input ports, because IT6263 may use one LVDS link or two.
> >>>
> >>> This patch is for generic dual link common cases and is not applicable for IT6263 single link case.
> >>
> >> Based on previous discussion(especially Dmitry's suggestion), this binding should cover display
> >> bridges that can use one LVDS sink port or two LVDS sink ports, like IT6263.  To be clear, those
> >> bridges may have two modes(supported by one
> >> chip) - single LVDS sink link mode and dual LVDS sink link mode.  Those bridges are considered as
> >> common dual-link LVDS displays.  That's why I was asked to extract the common
> >> properties to this schema when adding IT6263 DT binding.
> > 
> > As per [1] and [2] both panels don’t support single LVDS link.
> > IT6263 is bridge device that has single and dual link support.
> > Not sure the single link case has to be taken care in ITE6263 binding itself,
> > Leaving Dual link as it is??
> 
> There are a couple of bridges supporting dual-link LVDS like
> IT6263, see lontium,lt9211.yaml and thine,thc63lvd1024.yaml.
> So, it looks fine for this binding to cover those bridges,
> as those LVDS links are sort of common stuff.

Okay for that to be a follow-up patch.

This looks fine to me with the required addition.

Rob

