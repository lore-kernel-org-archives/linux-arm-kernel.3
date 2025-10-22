Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A742ECCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ne+Pmve/YJpQYWLxsEpgG2oak24NJMv5+UeWTnSp+5I=; b=a+FfOVILy0JA9tFz+sK9r9nQr/
	UOqd9epA1t0UwPtx+Iw3J77ITTfEY5OaCEhx+xS1zC5UqON7x+UBusP+VQFVqlK4rq3lNKVWOMWA7
	fcYriglyl+Y3c9JIjQEC1GBQlWBNdXFZGud7Aeb3fxN3A9fGcHLyoKx3nDaTp5wYyO9CdHHfMuYcO
	/YlfZvLdUObQ/OHWLJC67ARIYoktDIpqFksVU9eHE8WAi+Y6bB/yOY4f2Gt8OraSGZPq0zwVGxnCz
	Wj/q28Oftt0mPUh0P0LIJa+nXX71zaU6LBn+H1lSkqjAT/S54X6pNpgu4woNf5VzXFNl7Lex4lh8N
	Ucv68rgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTFA-00000001s7k-2A8H;
	Wed, 22 Oct 2025 07:26:48 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTF7-00000001s5x-1lqP;
	Wed, 22 Oct 2025 07:26:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761117986; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GWdWVJIci83v/eS69HecZIVsU2dKjax3EaKZENbtz8G9fVU3kFO9nY0W8fbL857a5mW3ciUZqRmPGiAn2qFYSRfUsXikN42get9YJK0XRoxavO8HtvhmmTrh6sXVgQ091coljHNh/p5NRqUQXn8vNn0LieCpkgF8NE75OevzYL8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761117986; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ne+Pmve/YJpQYWLxsEpgG2oak24NJMv5+UeWTnSp+5I=; 
	b=ZFwP3ceil6N4YJkKFYDLfc3uNtz7sFBZZs9URI8eHspzPQ9RO5mfmYIwTuRp/Pt0BgCsLXgGGmuDL0oIbK3wlG8wJHJesye68F3WBpKfNl3nVdW2Waqixq2ZVPbPC8gOtczfnFApIzT0yRx1/5t9XZJUMQlDgLGmCtf2orhIpWw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761117986;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Ne+Pmve/YJpQYWLxsEpgG2oak24NJMv5+UeWTnSp+5I=;
	b=WS0HFeV7KBFtIbds/DTNEOfzlWHiuEhf7zgrHzyBNXymtekgif2dvr8//CXl1Eja
	5o0inS7TmzZMLQ8iQ3Ei7kl5nEinVZYEVFx7L46Nzx0eWtQ5TQX0iSAx2IQCmJK8X72
	FD3DTFDuVjIDxFN5LhSIHklpFieoF/gr9TrumGso=
Received: by mx.zohomail.com with SMTPS id 1761117982200158.6072297880238;
	Wed, 22 Oct 2025 00:26:22 -0700 (PDT)
Message-ID: <79d4a7379bce245d22b56c677fd7b3a263836239.camel@collabora.com>
Subject: Re: [PATCH 15/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 leds
From: Sjoerd Simons <sjoerd@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Date: Wed, 22 Oct 2025 09:26:11 +0200
In-Reply-To: <d8077ee4-21c2-43c5-b130-7ff270b09791@lunn.ch>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
	 <20251016-openwrt-one-network-v1-15-de259719b6f2@collabora.com>
	 <d8077ee4-21c2-43c5-b130-7ff270b09791@lunn.ch>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_002645_513101_098627D2 
X-CRM114-Status: GOOD (  12.60  )
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

Hey,

On Fri, 2025-10-17 at 19:35 +0200, Andrew Lunn wrote:
> On Thu, Oct 16, 2025 at 12:08:51PM +0200, Sjoerd Simons wrote:
> > The Openwrt One has 3 status leds at the front (red, white, green) as
> > well as 2 software controlled leds for the LAN jack (amber, green).
>=20
> A previous patch in this series added 2 PHY LEDs. Are they connected
> to a LAN jack? Are there multiple RJ45 connectors? Is it clear from
> /sys/class/leds what LED is what?

Yeah there are two RJ45 jacks. One referred to as WAN in the openwrt one
documentation (2.5G), which uses phy integrated leds. One referred to as LA=
N,
which for some reason is using software controlled leds rather then the phy=
's
led controller, which this patch adds support for.

When applying this set you'll get:
```
root@openwrt-debian:/sys/class/leds# ls -1                                 =
   =20
amber:lan                                                                  =
   =20
green:lan                                                                  =
   =20
green:status                                                               =
   =20
mdio-bus:0f:amber:wan                                                      =
   =20
mdio-bus:0f:green:wan                                                      =
   =20
mt76-phy0                                                                  =
   =20
mt76-phy1                                                                  =
   =20
red:status                                                                 =
   =20
white:status                      =20
```

Which is hopefully clear enough



--=20
Sjoerd Simons <sjoerd@collabora.com>
Collabora

