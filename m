Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCC4EEF326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pey75eEThoEnHQjSmZ+IVIhI1hTMvdMzabhpITD61Sw=; b=R7QME+SN+h3qshG6pzRai/Q3jy
	kQOsFau90rU6gRNm7g6Nu1hxFmgqaUMa5jnmIz3dEeQFPNuSca1/a3FAxGrrVV1SCpI5wEU9/lvQX
	C0jS6z1RWdXc07dcyTzNCJBMWOE2Ce8y17mk8nvuzX+l6xOaSiUptLpMZHvqA+GR5UajfogK+LJuW
	vJnaJXzyJJKVL53bbgQLSUhqm9wkbwQ49m8H0QMkM3e59sCeOZN++G12RkXMj4rNGHmFNGjUdYCWA
	nkx5NOOY4q64g/PVeHkf7HuQyT0N47awVQk+jbSKZE2MjuW6WXwP6Mfayr9CowS8q8cUUWe1jaKGa
	pUNPWUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4ZI-00000001GbF-3Qs7;
	Thu, 05 Mar 2026 09:00:28 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4ZF-00000001Gan-0XtV;
	Thu, 05 Mar 2026 09:00:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772701198; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lZfdoF0se+mb5+rKW3KIqtNlypck4va7ch7J6QBw6dUuT9PG7Mg2DtmmnmSOZcJBGJCQeujXNJMd9/j2iapWzg/H0MpTIrtOzXpbWBYZdiB10UQuZ22YyE/K9vgHdonXDaThW1s0jZcBfNhUa/WjYgVB/FLjYVYbdA/BHbtG8BE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772701198; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pey75eEThoEnHQjSmZ+IVIhI1hTMvdMzabhpITD61Sw=; 
	b=bWxyTbb1c9KT/sVbuLa54G5M3uZaF3ilAlI5btjv7vp3TFNx9U6g7NjWJR0micoyjac6ydlvSj/z6jzQrdzH5eWuICh3Jm/0C79xbpitClcnt676RAn0RVoY8ASkpCnSUwsDZ6RHYrdbcwl6eQGWwCiPZrccNzTEdNGCH+Zc/wE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772701198;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=pey75eEThoEnHQjSmZ+IVIhI1hTMvdMzabhpITD61Sw=;
	b=e0UEYfXBhyAFq0y9vrEVYrrtrDV+uEf53upMxDmuKue8e4yinFtsSbdw123xNaeg
	Lsuk0z/ghpooX4ZF8vY7jCIUDwf9AvIkwX67N6LwDGWZQMVmRJLuDZSgB3oTrUzZ3ti
	kpeJCU/HB3t4SxItxDjqa+Z6fpEDS/0AnHpj47k4=
Received: by mx.zohomail.com with SMTPS id 1772701196666782.1404033627674;
	Thu, 5 Mar 2026 00:59:56 -0800 (PST)
Message-ID: <cb788f76740e88418d55ce9345e54d482969ff5a.camel@collabora.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add support for Airoha
 AN8801/R GbE PHY
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni	 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit	 <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com,
 matthias.bgg@gmail.com, 	kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Thu, 05 Mar 2026 09:59:50 +0100
In-Reply-To: <4a073736-9caf-4973-b7ad-a482d63bb672@bootlin.com>
References: <20260304-add-airoha-an8801-support-v1-0-0ae4ee5a2f9d@collabora.com>
	 <20260304-add-airoha-an8801-support-v1-1-0ae4ee5a2f9d@collabora.com>
	 <4a073736-9caf-4973-b7ad-a482d63bb672@bootlin.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010025_230138_7A0796CF 
X-CRM114-Status: GOOD (  19.84  )
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

Hi Maxime,

On Wed, 2026-03-04 at 11:14 +0100, Maxime Chevallier wrote:
> Hi Louis-Alexis,
>=20
> On 04/03/2026 10:35, Louis-Alexis Eyraud wrote:
> > From: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> >=20
> > Add a new binding to support the Airoha AN8801R Series Gigabit
> > Ethernet PHY.
> >=20
> > Signed-off-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
> > ---
> > =C2=A0.../devicetree/bindings/net/airoha,an8801.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0 | 81
> > ++++++++++++++++++++++
> > =C2=A01 file changed, 81 insertions(+)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/net/airoha,an8801.yaml
> > b/Documentation/devicetree/bindings/net/airoha,an8801.yaml
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..f251c9d2fbbed3675c9fd7ff2
> > 2174049a13a7b5e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/airoha,an8801.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/airoha,an8801.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN8801R Series PHY
> > +
> > +maintainers:
> > +=C2=A0 - AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > +
> > +description:
> > +=C2=A0 The Airoha AN8801R is a low power single-port Ethernet PHY
> > Transceiver
> > +=C2=A0 with Single-port serdes interface for 1000Base-X/RGMII; this
> > chip is
> > +=C2=A0 compliant with 10Base-T, 100Base-TX and 1000Base-T IEEE
> > 802.3(u,ab)
> > +=C2=A0 and supports Energy Efficient Ethernet (802.3az), Full Duplex
> > Control
> > +=C2=A0 Flow (802.3x), auto-negotiation, crossover detect and
> > autocorrection,
> > +=C2=A0 Wake-on-LAN with Magic Packet, and Jumbo Frame up to 9
> > Kilobytes.
> > +=C2=A0 This PHY also supports up to three user-configurable LEDs, whic=
h
> > are
> > +=C2=A0 usually used for LAN Activity, 100M, 1000M indication.
> > +
> > +allOf:
> > +=C2=A0 - $ref: ethernet-phy.yaml#
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ethernet-phy-idc0ff.0421
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 leds: true
> > +
> > +required:
> > +=C2=A0 - reg
> > +=C2=A0 - leds
>=20
> Seems odd to me that leds are required. Any reason for that ?
>=20
> Maxime
I agree having the leds as required property is unneeded.
I'll change it in v2.

Regards,
Louis-Alexis

