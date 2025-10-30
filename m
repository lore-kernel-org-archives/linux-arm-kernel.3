Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42653CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Wkm4p/uQ+Vqh1gCohypGhEVZ1/dwpzLDQlD8Bjlil8=; b=QgA55TCkZY+ZRB07/QS7J5SPoY
	p1xpSOv8XNMC+19eTB1qnpj5tzq+NvNC8x1mxV9ChESNqEyGU+k/ft+VYPBYq2VCIWin2nvpNtjo4
	H8UcqP01QmppciBFwViO0Fv+oMx3Rov2VePw3h8kyGHwtt+96lMmLXX/lT/Um4hpZ6kHNjxv2jLHj
	ZNvo58bfDDBdDgzy67CuZn5sRH/8Z78pu7SD4v+Bb/G6MApu8DGC4Oum8chQmn7kIZIW3gOeN3T5p
	QtYACGlmSq96BXQanKj0a7fnDRu66AoqjXpLH/dopjFaGQPC6njsCM34ShSH4stAMDSGGn9+rSMIY
	S76xPhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZMW-00000004qNM-0N22;
	Thu, 30 Oct 2025 20:35:12 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZMS-00000004qMj-3hHD;
	Thu, 30 Oct 2025 20:35:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761856485; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gkFbZ213okCftKgeKgIIwNoz8BwA4nDP6MzCr0YARnjslWbS8bf914DjEU26RKsesu0i7gZx4BTfyz1xxAgNbQMZ+hOgVrrgyBtWW8VMvkD1hskA7r5/OPkLeophqY65m9j/4O4l1Y9P6SwMdoSy8qMjWiwQU/R+tvzDuY+qM+k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761856485; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+Wkm4p/uQ+Vqh1gCohypGhEVZ1/dwpzLDQlD8Bjlil8=; 
	b=Gnr8xIhUAPzV2qfRb1oLqyxVo5sYZWiNHe+DDVUg/CHGOPZtjMxE9wPQmju6dCohAzktipJKP2YWvL5u9mW/WZSFsCaUWNk3l1EeVNWUSTxJB/E4oPJwqb0FZwBiY+h8vUyCgRnA6upcsdDuS10nEcP/oYKeYkbfFBQxcXmxQAc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761856485;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=+Wkm4p/uQ+Vqh1gCohypGhEVZ1/dwpzLDQlD8Bjlil8=;
	b=eE9lQAyjvcD+VsAFUGr3EGVzq1lb8anctgxPOFZUE+IyjqTE06JyDOHlv1dZWFZ+
	GJu62lcDIBD5F/Za7yXXSFfmLJl7bfrpDY2VhzDNK66M909P75cdhk3qdwz/uSfrpMY
	nlZLfK3BN7dj33lt0OVX5CDVbVQpWIkm0m886a44=
Received: by mx.zohomail.com with SMTPS id 1761856481126419.9479106165559;
	Thu, 30 Oct 2025 13:34:41 -0700 (PDT)
Message-ID: <f2c3e18fe22284c4a5ab0ce085e2d17be844a0a8.camel@collabora.com>
Subject: Re: [PATCH 10/15] arm64: dts: mediatek: mt7981b: Add Ethernet and
 WiFi offload support
From: Sjoerd Simons <sjoerd@collabora.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Ryder Lee
 <ryder.lee@mediatek.com>,  Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi	 <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	 <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Chunfeng Yun	 <chunfeng.yun@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,  "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, netdev@vger.kernel.org,  Bryan Hinton
 <bryan@bryanhinton.com>
Date: Thu, 30 Oct 2025 21:34:28 +0100
In-Reply-To: <aPEhiVdgkVLvF9Et@makrotopia.org>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
	 <20251016-openwrt-one-network-v1-10-de259719b6f2@collabora.com>
	 <aPEhiVdgkVLvF9Et@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_133508_974225_88E77D84 
X-CRM114-Status: GOOD (  17.38  )
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

On Thu, 2025-10-16 at 17:47 +0100, Daniel Golle wrote:
> On Thu, Oct 16, 2025 at 12:08:46PM +0200, Sjoerd Simons wrote:
> > Add device tree nodes for the Ethernet subsystem on MT7981B SoC,
> > including:
> > - Ethernet MAC controller with dual GMAC support
> > - Wireless Ethernet Dispatch (WED)
> > - SGMII PHY controllers for high-speed Ethernet interfaces
> > - Reserved memory regions for WiFi offload processor
> >=20
> > Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> > ---
> > =C2=A0arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 133 +++++++++++++++++=
+++++++++++++
> > =C2=A01 file changed, 133 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > index 13950fe6e8766..c85fa0ddf2da8 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi

[snip]
> > 			mdio_bus: mdio-bus {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				int_gbe_phy: ethernet-phy@0 {
> > +					compatible =3D "ethernet-phy-ieee802.3-c22";
> > +					reg =3D <0>;
> > +					phy-mode =3D "gmii";
> > +					phy-is-integrated;
> > +					nvmem-cells =3D <&phy_calibration>;
> > +					nvmem-cell-names =3D "phy-cal-data";
>=20
> Please also define the two LEDs here with their corresponding (only)
> pinctrl options for each of them, with 'status =3D "disabled";'. This
> makes it easier for boards to make use of the Ethernet PHY leds by just
> referencing the LED and setting the status to 'okay'.

I left those out on purpose as i can't easily validate them. They're probab=
ly better to be added once
someone adds a board using the hw led control.

>=20
--=20
Sjoerd Simons
Collabora Ltd.

