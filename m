Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB0DCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/d3UUUhdWoIZXpk8NwqSpg4DExzAbF8PYQkQhgem3s=; b=tBj1Y9o7tJQxEPYq8PCv0q/1hb
	KQ2f/iSRBGQb2LOcShkg4A0SXNMHGzlS4qcnKet04oR9DArikqvYveV6Dre9q6lIu3ARoVjVQskv3
	7alTKFQtJKP+p4adtEsrRC67l8HFzWXMYLLXB12r5/SDcU9RH2MnC24IFQ/lthgMfO4KZSVskKrCx
	vL7mu6PEUhdzN8OwTp4dTc6LZaHzdY4hEerG/A+vN8SmYRZB3zPZUps85Nu55w8j2yHN6h/9y41nv
	/N1Xs9lHiQbSOCCqWusx4VXVmQ5TUL7uk/G/PNLv7xX4V+7hFex2ZIBBV8hFi/YCfXZpWihde8H4C
	C4PXc0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDjh1-0000000G02S-2gRF;
	Tue, 28 Oct 2025 13:24:55 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDjgx-0000000G01v-3Pvk;
	Tue, 28 Oct 2025 13:24:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761657869; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZCTOLf2S+q8m7fxAVIx8Y+bCTP95emO4YmHpi3NRritxQmxe3ATRHjgeW0BrRIv/SbQdJcPkYSIUlLoL7Sl45gi2zztEIUBUCnLkgM8wr8gLtilOLj+4p0mgiYOXQchJqvmPzkbMfQ+hjVO2mN6HwX4WU2/7ifnbvDnEokHm7os=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761657869; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8/d3UUUhdWoIZXpk8NwqSpg4DExzAbF8PYQkQhgem3s=; 
	b=mVNRJGLaKBa+FnpaA60HLtOXJLBTBabrws/EXB4240rOpfhff5FXpf/VNKnYWCwBu00BOQ3NWKiZVwJqhU0Q3gMtrBNyvabfFoH3VOmcPyKqHEO88TmrhOh57Z7cNaIbziW7X/3hIqvD/KY4twXCtuQs4aGT6BhvdTOPnX+n6xw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761657869;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=8/d3UUUhdWoIZXpk8NwqSpg4DExzAbF8PYQkQhgem3s=;
	b=ZwoIEHXchlDN8s9MvkdPt0IM1C2ZQYDwtGfbijZC9gXXVKG93gOrptfLgnMCk5QN
	KWqWvywAsKEtYwEZm6+KZfkQE2jPZsK7IM4T470U+hBGQFBMILmP97pYYcSjTIEpo1C
	3viKQ0jStrCNXpRAwgnP937Ec/N+iwr3jwOZzaVI=
Received: by mx.zohomail.com with SMTPS id 1761657866228953.45389749315;
	Tue, 28 Oct 2025 06:24:26 -0700 (PDT)
Message-ID: <408842eda1caa53247ff759cd9ea75dcab624594.camel@collabora.com>
Subject: Re: [PATCH 12/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 Ethernet
From: Sjoerd Simons <sjoerd@collabora.com>
To: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 "Lucien.Jheng" <lucienzx159@gmail.com>
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
 linux-phy@lists.infradead.org, netdev@vger.kernel.org,  Daniel Golle
 <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>
Date: Tue, 28 Oct 2025 14:24:19 +0100
In-Reply-To: <05610ae5-4a8a-47e9-808b-7ff98fade78e@gmail.com>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
	 <20251016-openwrt-one-network-v1-12-de259719b6f2@collabora.com>
	 <4f82aa17-1bf8-4d72-bc1f-b32f364e1cf6@lunn.ch>
	 <8f5335a703905dea9d8d0c1840862a3478da1ca7.camel@collabora.com>
	 <05610ae5-4a8a-47e9-808b-7ff98fade78e@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_062451_938494_CC1BC9D9 
X-CRM114-Status: GOOD (  15.52  )
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

On Tue, 2025-10-28 at 12:14 +0100, Eric Woudstra wrote:
>=20
>=20
> On 10/21/25 10:21 PM, Sjoerd Simons wrote:
> > On Fri, 2025-10-17 at 19:31 +0200, Andrew Lunn wrote:
> > > > +&mdio_bus {
> > > > +	phy15: ethernet-phy@f {
> > > > +		compatible =3D "ethernet-phy-id03a2.a411";
> > > > +		reg =3D <0xf>;
> > > > +		interrupt-parent =3D <&pio>;
> > > > +		interrupts =3D <38 IRQ_TYPE_EDGE_FALLING>;
> > >=20
> > > This is probably wrong. PHY interrupts are generally level, not edge.
> >=20
> > Sadly i can't find a datasheet for the PHY, so can't really validate th=
at
> > easily. Maybe Eric can
> > comment here as the author of the relevant PHY driver.
> >=20
> > I'd note that the mt7986a-bananapi-bpi-r3-mini dts has the same setup f=
or
> > this PHY, however that's
> > ofcourse not authoritative.
> >=20
>=20
> Lucien would have access to the correct information about the interrupt.

Thanks! For what it's worth i got around to putting a scope on the line las=
t
night. It looks like the interrupt line is pulled down until cleared, so it
appears it's indeed a Level interrupt as Andrew guessed. But would be great=
 to
have this confirmed based on the documentation :)

--=20
Sjoerd Simons <sjoerd@collabora.com>
Collabora

