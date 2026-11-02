Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA48F607F6F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MMwEJXmW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTIJkYx9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1ed4ABVb5WuZx7ievrj1cvm+vrmzhLmj5yV4zTMhJQg=; b=MMwEJXmWKR5l3526LChNEUmB4b
	r4RSUvnDAhZKIea/haTYWdVtY1DRsb7ebDw7SDRzgi96KaaHw8YjUb+B6qjjsjNnA+cxMv9+5/Npr
	qKBDFOR4tvEUbp2IvHoEvGPI6rNySQGYz6dk4cpNgSm+HyaumlbUwRKGbDPBhgTmqn+PGAYjrt+pO
	M0DDBOfZ2xlGt8/KOM8H847n4erTPbUsaKzLQVDW0MMpu7/BbbGO+haExwj0Q6QMHpjdsMvX1wuAM
	y51y5h9YxuztJVUPuW0oUA0gWKE5+EirESSz6ryDNzb0RBtWNBr5pFV3s60/W6JTk3NsbRa/smUay
	HK9D2+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtIj-0000000GsjE-2elx;
	Mon, 02 Nov 2026 14:46:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtIi-0000000Gsip-2g07;
	Mon, 02 Nov 2026 14:46:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C830F600DB;
	Mon,  2 Nov 2026 14:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E231F00A17;
	Mon,  2 Nov 2026 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630779;
	bh=1ed4ABVb5WuZx7ievrj1cvm+vrmzhLmj5yV4zTMhJQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kTIJkYx932KW0rEFWbZ55+lbTtsZKF+4aG6/wsWGYG04/dedotlgN7zujoh8O2jQf
	 z+v8UjodVuo6CFRkW679nsHC4p/DPLC4jCFE523SoM4wk8cUzXSXbnZVaUMoCJZXuW
	 H7iYQvsi75Ucn/GauIsg7HpX1mHcJ3IuY+tXkV7YDSJu67E7yGUYsr0Ucvq2KDygtH
	 1ZYEkQ7mdXkmN3HmICVak/FMRLN+Vy77pVLZFXMKyUiGTLR2X60Yuk+8uWN/N3swsi
	 c+MBOCgIpfmjr3DeQn+wDTIRHm+vegoCu+ll1N4Ajue1ZEef9SKd6+TFT5wGzqqYYc
	 +SCxPpRiNg7XA==
Date: Mon, 2 Nov 2026 08:46:16 -0600
From: Rob Herring <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP
 variant
Message-ID: <20261102144616.GE1232511-robh@kernel.org>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-3-florian.fainelli@broadcom.com>
 <20261030182151.GA1206797-robh@kernel.org>
 <e25714a5-98b3-4a0e-ad9a-a644b5485749@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e25714a5-98b3-4a0e-ad9a-a644b5485749@broadcom.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 12:14:52PM -0700, Florian Fainelli wrote:
> On 10/30/26 11:21, Rob Herring wrote:
> > On Wed, Oct 21, 2026 at 10:28:11AM -0700, Florian Fainelli wrote:
> > > Northstar Plus uses the Northstar Bx PHY register sequence but also
> > > requires coordinated USB2 and USB3 core resets and a USB2 IDM interface
> > > clock enable.
> > > 
> > > Add an NSP compatible with a required USB2 DMP phandle. Describe the
> > > shared PHY relationship with EHCI, OHCI and xHCI so initialization
> > > finishes before any host starts operating.
> > > 
> > > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > > ---
> > >   .../bindings/phy/bcm-ns-usb3-phy.yaml         | 23 +++++++++++++++++++
> > >   1 file changed, 23 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> > > index 7fd419db45d0..00d69b86cbff 100644
> > > --- a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
> > > @@ -14,6 +14,9 @@ description: |
> > >     Known B1: BCM4707 rev 6
> > >     Known C0: BCM47094 rev 0
> > > +  Northstar Plus uses the Bx programming sequence, with coordinated USB2 and
> > > +  USB3 resets. Its PHY is shared by the EHCI, OHCI and xHCI controllers.
> > > +
> > >   maintainers:
> > >     - Rafał Miłecki <rafal@milecki.pl>
> > > @@ -22,6 +25,7 @@ properties:
> > >       enum:
> > >         - brcm,ns-ax-usb3-phy
> > >         - brcm,ns-bx-usb3-phy
> > > +      - brcm,nsp-usb3-phy
> > >     reg:
> > >       description: address of MDIO bus device
> > > @@ -32,6 +36,13 @@ properties:
> > >       description:
> > >         Phandle to the DMP (Device Management Plugin) syscon
> > > +  usb2-dmp-syscon:
> > 
> > brcm,usb2-dmp
> 
> That would be inconsistent with the usb3-dmp-syscon property that is
> pre-existing, hence the name chosen here.

I'm not sure consistency is really better here, but okay.

Rob

