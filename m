Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE2ECCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrTdEMBjb9J8SLRrC3vLxTtsIJrVCIippWcA6vJQ+Sc=; b=AcqS7xuhzLEd2i9ifJPe+3+qow
	BUOtXEVrSW2CNxJGI3LjkOTweGf704pX730H5IWLV7gQNDDzaDtxQVGLdLNaaiO6wu18E6mW73Be1
	6mh81cUULmco/fOiYrracBdMhoaUYyWXj1c0svcmpOutJ0ZNFrHDesae1X6MkTQ7DMu+4NlLGboZ0
	+JPMFbbkpfCQcRU/IxCMbDiURVkiNB7y7aP7sqF/fKuTcBriD0BAd9NMtxIMM1JfocsdkJoq46j9a
	eDz9+7/RXdfyQpL9FRM1g+g8o8JU8T1qQln+lhLsKzGMPvMaZhRQWlgRE8M4e0B3bXRGq7XRQBlCk
	U2lgIT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSlv-00000001kUa-17X0;
	Wed, 22 Oct 2025 06:56:35 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSlt-00000001kTP-1Y2g;
	Wed, 22 Oct 2025 06:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761116176; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YSmM6fHht8tI+Hs+g3L2P7wAvCYMuoBQzlDwjFWZUc/615269p6rktPjsz9WB8gsEUaznRxJERQb24bpRaDKzrdYcYK/BCP1fRoIYIkHbZNCFroSJYoM4xkKGX8PfngiOOsW0lddLPUDC1+owWVcPmBpreXcSajaAPpWDQig0LU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761116176; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VrTdEMBjb9J8SLRrC3vLxTtsIJrVCIippWcA6vJQ+Sc=; 
	b=YfK9QluAXmmxX9kSbNdrBDhfxEV3S7KtbwKeNmyucgOl6EReqAb680Mf1fsYYidgwmbXUaJa/snr9j3FJNMtpJ6W7cHRjv0HL6imBTobge1AE1HrufuX0SxByyu2DIYaZ8AbqYWpBNeNuuGnJ/OhK2oHeTPzGZcLBH8xvMlJ22A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761116176;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=VrTdEMBjb9J8SLRrC3vLxTtsIJrVCIippWcA6vJQ+Sc=;
	b=ab3jiVYYnku8HtA+3wdNILGqr/Nsdqmzhy2eGZ8glKkkzc7JF7u3I+5iDVjER+Bb
	1DdPzxEQm91Xm/GFKyO5TQc1PulKRvfSCTQEK6kd9ql9kv13uKykLZYEgcU187WjO36
	MjOUNnri8IEPm+Eg119HPZMSnnqIwv1mH6NjzZ8A=
Received: by mx.zohomail.com with SMTPS id 17611161732831018.5532421915162;
	Tue, 21 Oct 2025 23:56:13 -0700 (PDT)
Message-ID: <9280864d0eba182d06d1e191fdc0aad1fb4ce5b3.camel@collabora.com>
Subject: Re: [PATCH 12/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 Ethernet
From: Sjoerd Simons <sjoerd@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Eric Woudstra <ericwouds@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Ryder Lee <ryder.lee@mediatek.com>,  Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo
 Pieralisi	 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	
 <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Chunfeng
 Yun	 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix
 Fietkau <nbd@nbd.name>, 	kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, netdev@vger.kernel.org,  Daniel Golle
 <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>
Date: Wed, 22 Oct 2025 08:56:06 +0200
In-Reply-To: <fd52be11-ccff-4f34-b86b-9c2f9f485756@lunn.ch>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
	 <20251016-openwrt-one-network-v1-12-de259719b6f2@collabora.com>
	 <4f82aa17-1bf8-4d72-bc1f-b32f364e1cf6@lunn.ch>
	 <8f5335a703905dea9d8d0c1840862a3478da1ca7.camel@collabora.com>
	 <fd52be11-ccff-4f34-b86b-9c2f9f485756@lunn.ch>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_235633_488153_A41B8835 
X-CRM114-Status: GOOD (  16.45  )
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

On Tue, 2025-10-21 at 22:40 +0200, Andrew Lunn wrote:
> On Tue, Oct 21, 2025 at 10:21:31PM +0200, Sjoerd Simons wrote:
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
> > easily.
>=20
> What PHY is it? Look at the .handle_interrupt function in the
> driver. If the hardware supports a single interrupt bit, it could in
> theory support edge. However, as soon as you have multiple bits, you
> need level, to avoid races where an interrupt happens while you are
> clearing other interrupts.

ethernet-phy-id03a2.a411 is Airoha EN8811H (air_en8811h driver). Handle
interrupt there seems to just be a general interrupt clear followed by a
`phy_trigger_machine`. It doesn't seem to read specific interrupt status.=
=20

Testing with IRQ_TYPE_LEVEL_LOW does seem to work as expected and results i=
n
detecting 4 interrupts rather then just 1 with edges when enabling the
interface. However I'm not sure what can be concluded from that if anything=
 :)..
=C2=A0
I can stick a scope on the line in the coming days to see how the interrupt=
 line
behaves if interrupts aren't cleared, which may clarify things.
=20

--=20
Sjoerd Simons
Collabora

