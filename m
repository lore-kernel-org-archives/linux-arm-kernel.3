Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69C4C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzqacroDsAOYpxYHjTL1g6D7LTgb86zIA+otutCdK9o=; b=Lc4VC1JHXdEhoKdUsSAL7LpzwI
	wOA4PzEou8fqhlus4UDhFjQ900k7zqutEgzIV/akb9qP0fal58+yrZOYSqsG6wM2CBuMYsH69KsKb
	+c6QA/e3mkRyNGP0bSdBVnpicl5dJC+YBNqgO6YmFSSpCTJOq6bVBki1JbMdvXXsfO9H6xrKYtOV/
	lrc7uBP4cyTQPJC+tWehC/KwUIVfKRV21+1kGXZ6cl2sFJZriAR/5GKCqaWwCTsIcN46gS3yQqmqb
	FLEGvRpWU25JNyxCCPn7nGmZEQg7XtXlTu4Gec7VNM+7O3QERx8DKhhpXtwRGkBSvOqfi+Gx/78f8
	inTeubgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fW3-00000005lXV-3UXX;
	Tue, 15 Apr 2025 12:35:51 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4etB-00000005dNx-0Q2C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 11:55:42 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FBtQPg3022404
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 06:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744718126;
	bh=jzqacroDsAOYpxYHjTL1g6D7LTgb86zIA+otutCdK9o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=u+nxzOqFw63Yr04cyhBA8F2SWK9SFbES4a4uJOmOa+jg5VB9qmLIhxEIIupQYGeP9
	 euzAqWhZ+otzQpCrhWFh2oZl2krWEIY2AtUwYQ/Z6xQjViz13UWhYLJDxJOlQhgzLh
	 7zNgZzTf3IlFlq4gQrKo4r7ofGFSbDgEh5aCQk+I=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FBtQos017475
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 06:55:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 06:55:25 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 06:55:25 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FBtOI6103847;
	Tue, 15 Apr 2025 06:55:24 -0500
Date: Tue, 15 Apr 2025 17:25:23 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Whitcroft
	<apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn
	<lukas.bulwahn@gmail.com>,
        Joe Perches <joe@perches.com>, Jonathan Corbet
	<corbet@lwn.net>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux@ew.tq-group.com>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <5d74d4b2-f442-4cb8-910e-cb1cc7eb2b3d@ti.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <6be3bdbe-e87e-4e83-9847-54e52984c645@ti.com>
 <cd483b43465d6e50b75f0b11d0fae57251cdc3db.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cd483b43465d6e50b75f0b11d0fae57251cdc3db.camel@ew.tq-group.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_045541_249237_83A56513 
X-CRM114-Status: GOOD (  42.88  )
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

On Tue, Apr 15, 2025 at 01:28:48PM +0200, Matthias Schiffer wrote:
> On Tue, 2025-04-15 at 16:06 +0530, Siddharth Vadapalli wrote:
> > 
> > On Tue, Apr 15, 2025 at 12:18:01PM +0200, Matthias Schiffer wrote:
> > > As discussed [1], the comments for the different rgmii(-*id) modes do not
> > > accurately describe what these values mean.
> > > 
> > > As the Device Tree is primarily supposed to describe the hardware and not
> > > its configuration, the different modes need to distinguish board designs
> > 
> > If the Ethernet-Controller (MAC) is integrated in an SoC (as is the case
> > with CPSW Ethernet Switch), and, given that "phy-mode" is a property
> > added within the device-tree node of the MAC, I fail to understand how
> > the device-tree can continue "describing" hardware for different board
> > designs using the same SoC (unchanged MAC HW).
> 
> The setting is part of the MAC node, but it is always set in the board DTS,
> together with assigning a PHY to the MAC.

The MAC is the same independent of which board it is used in. So are we
really describing the "MAC" or configuring the "MAC"? Isn't it the PHY
along with the PCB lines on a given board that determine how the "MAC"
should be "configured" to make the combination of "MAC" + "PHY"
functional together?

> 
> > How do we handle situations where a given MAC supports various
> > "phy-modes" in HW? Shouldn't "phy-modes" then be a "list" to technically
> > descibe the HW? Even if we set aside the "rgmii" variants that this
> > series is attempting to address, the CPSW MAC supports "sgmii", "qsgmii"
> > and "usxgmii/xfi" as well.
> 
> This is not about PHY mode support of the MAC, but the mode to be used on a
> particular board. I would not expect a board to use multiple different
> interfaces with a single PHY (and if such cases exist, I consider them out of

For a fixed PHY, the MAC will be "configured" to operate in a set of
modes supported by the PHY. The HW description is coming from the PHY
that has been "fixed", and not the MAC. But the "phy-mode" property
resides within the device-tree node of the MAC and not the PHY. So are
we still "describing" the MAC when it is the "PHY" that introduces the
limitation or requires the MAC to be configured for a particular
"phy-mode"?

> scope for this patch series).
> 
> > 
> > > (if a delay is built into the PCB using different trace lengths); whether
> > > a delay is added on the MAC or the PHY side when needed should not matter.
> > > 
> > > Unfortunately, implementation in MAC drivers is somewhat inconsistent
> > > where a delay is fixed or configurable on the MAC side. As a first step
> > > towards sorting this out, improve the documentation.

While this patch is improving the documentation and making it consistent
when it comes to the description of "rgmii" by stating that the "MAC"
shouldn't add a delay, for the remaining cases, as to who adds the delay
and whether or not the MAC should add a delay has been left open.
Existing documentation clarifies what the MAC should do for each case
except "rgmii" which is being fixed by your patch.

> > > 
> > > Link: https://lore.kernel.org/lkml/d25b1447-c28b-4998-b238-92672434dc28@lunn.ch/ [1]
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > ---
> > >  .../bindings/net/ethernet-controller.yaml        | 16 +++++++++-------
> > >  1 file changed, 9 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> > > index 45819b2358002..2ddc1ce2439a6 100644
> > > --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> > > @@ -74,19 +74,21 @@ properties:
> > >        - rev-rmii
> > >        - moca
> > >  
> > > -      # RX and TX delays are added by the MAC when required
> > > +      # RX and TX delays are part of the board design (through PCB traces). MAC
> > > +      # and PHY must not add delays.
> > >        - rgmii
> > >  
> > > -      # RGMII with internal RX and TX delays provided by the PHY,
> > > -      # the MAC should not add the RX or TX delays in this case
> > > +      # RGMII with internal RX and TX delays provided by the MAC or PHY. No
> > > +      # delays are included in the board design; this is the most common case
> > > +      # in modern designs.
> > >        - rgmii-id
> > >  
> > > -      # RGMII with internal RX delay provided by the PHY, the MAC
> > > -      # should not add an RX delay in this case
> > > +      # RGMII with internal RX delay provided by the MAC or PHY. TX delay is
> > > +      # part of the board design.
> > >        - rgmii-rxid
> > >  
> > > -      # RGMII with internal TX delay provided by the PHY, the MAC
> > > -      # should not add an TX delay in this case
> > > +      # RGMII with internal TX delay provided by the MAC or PHY. RX delay is
> > > +      # part of the board design.

[...]

Regards,
Siddharth.

