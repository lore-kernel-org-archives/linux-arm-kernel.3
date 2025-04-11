Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E0DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bEVzwa077L98xmrJC/K3SEciVJ1LxE/oPvC3WGlF80=; b=Gh/hAXgG952sQCcRmHa7ARzLA0
	KzcIO1UMDFTXf6RiKQ47ifD7wJS+LkKIODIcwmCJ9EEFDseiw4c+tKYh/9zt67ZCww0ZDE7jEpsmh
	uvnnhAdGExLZ7+uppn+LYlsiXEIn5pOFgur9QdiLNQPafsZucaBC8t8gnzC4G7zM7aUMVNNrbJpEH
	kdl6pwWMqnOFl3gmIFk4tRRXxT6+h18jTbaNUsr8ahxibtQSVaIquRFDAP0NviLV11KvCjrlqJ3wX
	Nag7/u7vy5HrdYm3BYX7slSW7EqZzZQYh7jyQTO9vQQSEK3KsYsyB6SNRZBN5DtMfmxEl8vhY5oDK
	VU9TQT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FeK-0000000E8zF-3Sa7;
	Fri, 11 Apr 2025 14:46:32 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FQG-0000000E6Ik-318Q;
	Fri, 11 Apr 2025 14:32:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744381906; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iU5GPHPv3JH4Kee/QfUFQyYLt1uqLC8Q0t06jEaI2NsONtG5B0atnr73AReTWF4+HFBHfx0O8/H75ou47AgIY1prFa3AfsknQZYvnQnS/CU6bey+t993VtK0UsXP5Xvje6L4F0MlvwPy7af3RdC2SIIQi8MRVOOs6Tm28/SEiZo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744381906; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4bEVzwa077L98xmrJC/K3SEciVJ1LxE/oPvC3WGlF80=; 
	b=eOQJP8AH4Vh2RF4ho2CUqImbYpn42paEp/GzjiKA+WSVwAQ73W0UEnsN/gxc2F0yF9WdBT4khYQL7dz9U0GoSgUiv3yZ0Z38csnqpQil0SmDLL7PCQ6fYw6QJlPm8ZgBCtfM309fkPt1gPj5qJNrTI+R0pYWq6Yhexs9K9fmiqk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744381906;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=4bEVzwa077L98xmrJC/K3SEciVJ1LxE/oPvC3WGlF80=;
	b=LhZ8G4aHexSUcndCBZQ6W00cpw7UCzuAeXgHRc2ktcxKSl/EeRGVxIrJIzJ1aqlA
	GLi8sQt8/rmczMh26qGi5DLvgcu3M0dsb5V3hv98Jr1rXclsmr4KeO+IH5dnF2KG2JE
	oZW/p5/f9ObjOVNUD1FOyJjbBGWYWjFH2XjqNpws=
Received: by mx.zohomail.com with SMTPS id 1744381904334406.2356180581727;
	Fri, 11 Apr 2025 07:31:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: rockchip,inno-usb2phy: add port property
Date: Fri, 11 Apr 2025 16:31:38 +0200
Message-ID: <6743970.MhkbZ0Pkbq@workhorse>
In-Reply-To: <20250410211123.GA1071510-robh@kernel.org>
References: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
 <20250407-rk3576-sige5-usb-v1-1-67eec166f82f@collabora.com>
 <20250410211123.GA1071510-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_073200_810496_87CBDE37 
X-CRM114-Status: GOOD (  34.66  )
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

On Thursday, 10 April 2025 23:11:23 Central European Summer Time Rob Herring wrote:
> On Mon, Apr 07, 2025 at 08:09:14PM +0200, Nicolas Frattaroli wrote:
> > USB connectors like to have OF graph connections to high-speed related
> > nodes to do various things. In the case of the RK3576, we can make use
> > of a port in the usb2 PHY to detect whether the OTG controller is
> > connected to a type C port and apply some special behaviour accordingly.
> > 
> > The usefulness of having different bits of a fully functioning USB stack
> > point to each other is more general though, and not constrained to
> > RK3576 at all, even for this use-case.
> > 
> > Add a port property to the binding.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> > index 6a7ef556414cebad63c10de754778f84fd4486ee..3a662bfc353250a8ad9386ebb5575d1e84c1b5ba 100644
> > --- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> > @@ -78,6 +78,11 @@ properties:
> >        When set the driver will request its phandle as one companion-grf
> >        for some special SoCs (e.g rv1108).
> >  
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description:
> > +      A port node to link the PHY to a USB connector's "high-speed" port.
> 
> I don't think this is correct. The HS port of the connector goes to the 
> controller. The controller has the link to the phy.
> 
> If the PHY is also what handles USB-C muxing or orientation switching, 
> then it might have ports, but then it needs input and output ports.
> 
> Rob
> 

Hi Rob,

thank you for the quick response.

I've feared this would be the case, but chose to go ahead with this solution
anyway because I'm not super stoked about the alternatives I can think of. The
problem is that I need to go from the USB PHY node to the USB connector somehow,
but there's no way I can see to get from the PHY node to the USB2 controller
it's connected to, unless I'm missing something obvious.

So I see two alternatives:
1. Extend the usb connector binding to add additional ports for PHYs that handle
   vbus detection or something, then extend either the inno2 binding or a more
   general usb PHY binding to add that port definition.
2. Revert to what the downstream vendor kernel does and simply add a boolean
   flag property to the inno usb2phy binding that tells it whether it's
   connected to a USB-C port and should therefore expect vbusdet to remain high.

Let me know if there's any better alternatives I missed. If there's some OF
driver function to enumerate all controllers a PHY is referenced by, then that
would probably work as well, allowing me to just point the HS port to the
controller instead as intended.

If no better solutions exist then I'm partial to 2. While it makes writing
device trees a little more error prone and I don't like vendor properties, it
means we don't set the "all USB-C ports will always have vbusdet pulled high" in
stone, a claim that I am not 100% confident in.

Kind regards,
Nicolas Frattaroli



