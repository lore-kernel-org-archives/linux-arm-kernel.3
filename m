Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B890DCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLRqHHn0hwJYYFSTUINWa18jofeRC1qm9JrrGQiF80s=; b=x1WuphBN2E5xUxQ6A8NCOiPTzl
	/fhc5tGGLoQppWJOyuAdJMZsOo9TKaI4jdlpRc9JEs0Kw+hRjW9y5W+jaNtnJAVSSipwXUQW3izui
	pLFnDcnajvxgoTvkCNm9nZh0NM9e/NS3EQ0hYitwM9+wDMfVo+/a/z7ajaUJdJ7xMNwcqrI8X36fI
	cuJu/nfvtPAs0MMHahMRk2m/Y0/vGS3V3goMsqSFBJvHvRdUi0YVImeWNHIKIpfp2YfzwZGxyCrnX
	8Ix4GZHswlkCZPi0N7auIkEca6IIhuvARhgQWkiabgxEdmg525u5RqWaUDpnUGe5DGdGjgkdw6I7t
	ZlAq/uMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSte-0000000E6kp-2v44;
	Mon, 11 May 2026 15:50:18 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMStc-0000000E6kK-28tf;
	Mon, 11 May 2026 15:50:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1778514593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JtR96WeqT7mANZWYH5Oq/SrWkMVZMHEbjdysUv/IDO4KZwoDNDvREeBHkIj51zpAmurnQdC08F2XjOERSeMmOUucOa/EQHyhYMAf2nwLR+YpK/sv1eIXWC5lYuCs1C/2k61b9w7swjzlLd+nbhC4mkys+J5UDiJl5hYA2KK45lM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778514593; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XLRqHHn0hwJYYFSTUINWa18jofeRC1qm9JrrGQiF80s=; 
	b=gqVx98psmTKrKlqyPBaggNuqabHo96QX5RdambdyF9d0G93YbduIFF1ajBv0b3svQONPy+0P31NxXL9D6iwvqyjvpfc60hW7irJKOs0UMUGqOA7pOeSheMkBy6vNYmCxF9qNSTxRzBJQVJtmc+Nv6lHLNlNoEi8su71z/YDnZ/E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778514593;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=XLRqHHn0hwJYYFSTUINWa18jofeRC1qm9JrrGQiF80s=;
	b=lXQwuqDEHkE93zSFEP0C/7F7bsb2cpIzNR+y4WCSN/TJXYD78zHt1AwDilCol32u
	q9O+paBosqN1PAeJoIvEVFQwsiR/ZgvPKnIjEBYTbSjRHj+sgQmEIbN79VCs8BT75sq
	9/iVOyqpkucv2LWwu2iJCgU5UqmYIJzriORdTJ7E=
Received: by mx.zohomail.com with SMTPS id 1778514590556214.59633215458769;
	Mon, 11 May 2026 08:49:50 -0700 (PDT)
Message-ID: <7d5bcbe907456e4ada4401251eb05c3d5378dcb0.camel@collabora.com>
Subject: Re: [PATCH net-next v2 4/4] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Heiner Kallweit	
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com,
 matthias.bgg@gmail.com, 	kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Mon, 11 May 2026 17:49:44 +0200
In-Reply-To: <27ca6b71-18df-4e47-9117-0e503f7e7d5f@lunn.ch>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
	 <20260326-add-airoha-an8801-support-v2-4-1a42d6b6050f@collabora.com>
	 <3688a285-7f98-4afa-80ad-697094cd7b97@lunn.ch>
	 <2c441d51f6a865ddb6e67b63cd26a651ed3ff058.camel@collabora.com>
	 <27ca6b71-18df-4e47-9117-0e503f7e7d5f@lunn.ch>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_085016_598949_3F0CA3B7 
X-CRM114-Status: GOOD (  34.35  )
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

Hi Andrew,

On Thu, 2026-05-07 at 23:43 +0200, Andrew Lunn wrote:
> > > > +static int an8801r_of_init_leds(struct phy_device *phydev, u8
> > > > *led_cfg)
> > > > +{
> > > > +	struct device *dev =3D &phydev->mdio.dev;
> > > > +	struct device_node *np =3D dev->of_node;
> > > > +	struct device_node *leds;
> > > > +	u32 function_enum_idx;
> > > > +	int ret;
> > > > +
> > > > +	if (!np)
> > > > +		return 0;
> > > > +
> > > > +	/* If devicetree is present, leds configuration is
> > > > required */
> > > > +	leds =3D of_get_child_by_name(np, "leds");
> > > > +	if (!leds)
> > > > +		return 0;
> > > > +
> > > > +	for_each_available_child_of_node_scoped(leds, led) {
> > > > +		u32 led_idx;
> > > > +
> > > > +		ret =3D of_property_read_u32(led, "reg",
> > > > &led_idx);
> > > > +		if (ret)
> > > > +			goto out;
> > > > +
> > > > +		if (led_idx >=3D AN8801R_NUM_LEDS) {
> > > > +			ret =3D -EINVAL;
> > > > +			goto out;
> > > > +		}
> > > > +
> > > > +		ret =3D of_property_read_u32(led, "function-
> > > > enumerator",
> > > > +					=C2=A0=C2=A0
> > > > &function_enum_idx);
> > > > +		if (ret)
> > > > +			function_enum_idx =3D
> > > > AN8801R_LED_FN_NONE;
> > > > +
> > >=20
> > > What is this doing? Is this documented in the binding?
> > The `function-enumerator` property is only documented in the led
> > common
> > dt-binding file. The an8801 dt-bindings inherits this property from
> > the
> > ethernet-phy dt-bindings.
> >=20
> > We aimed to have this PHY have its led behaviour (how many to
> > enable
> > and what their role shall be) configurable using devicetree and not
> > to
> > rely on a default configuration, hard-coded in the driver (like the
> > air_en8811h driver did) and also make use of the led hardware
> > offloading (for functions like 100/1000, activity blinking, and
> > others)
> > that this PHY is capable of.
>=20
> What other drivers do is leave the configuration with its reset
> default. They are often sensible. When the netdev trigger loads, it
> should ask the LED how it is configured, and the values in sysfs will
> reflect it. After that you can change it, via udev rules, etc.
When you say "reset default", do you mean the default PHY register
values, the ones that may have been set by the bootloader or by the
driver with a default hardcoded functional config?
>=20
> You have to be careful about what you put in DT. DT describes
> hardware, not configuration or policy. How the LED blinks is probably
> configuration, so it does not belong in DT.
I agree.
What I meant as configuration was only the leds node presence and the
led function properties, as the devicetree should describe what/how
many LED are connected to the PHY and they represent (or mean) for a
given board.
Parameters like off/on delay or trigger events are indeed not really
appropriate for devicetree and the AN8801 dt-bindings patch do not add
any such property.

And even, if technically the LEDs are reconfigurable with netdev or any
other LED trigger, the configuration is somehow hardware bound, because
the different colors of LEDs do kind-of bind a specific function to a
specific LED (amber vs green).

This is why the an8801r_of_init_leds function read those LED-related
properties (leds/led/function-enumerator) to set a default led config
behaviour (that can of course be overridden by an user with a led
trigger) rather than relying on bootloader or use a hardcoded led
register config in the driver.

What implementation would be preferred for this driver?

>=20
> > > > +static int an8801r_read_status(struct phy_device *phydev)
> > > > +{
> > > > +	int prev_speed, ret;
> > > > +	u32 val;
> > > > +
> > > > +	prev_speed =3D phydev->speed;
> > > > +
> > > > +	ret =3D genphy_read_status(phydev);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	if (phydev->link && prev_speed !=3D phydev->speed) {
> > > > +		val =3D phydev->speed =3D=3D SPEED_1000 ?
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AN8801_BPBUS_LINK_MODE_1000 : 0;
> > > > +
> > > > +		return an8801_buckpbus_reg_rmw(phydev,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > AN8801_BPBUS_REG_LINK_MODE,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > AN8801_BPBUS_LINK_MODE_1000,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val);
> > > > +	};
> > >=20
> > > This is unusual. What is it doing? Please add a comment.
> > This call is to ensure that the PHY switches to the expected 1Gbps=20
> > speed when available.=C2=A0
>=20
> So this is an errata workaround? Please add this in a patch of its
> own, described the problem in the commit message, list the errata
> etc.
>=20
OK, I'll add this in a separate patch in v3.

Best regards,
Louis-Alexis

> =C2=A0=C2=A0=C2=A0=C2=A0 Andrew

