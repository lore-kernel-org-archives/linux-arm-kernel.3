Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130D4CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mD80HyVHazAI7zY5u5ppiXiv/kRQLmFGurqGNhp1Zzg=; b=UpJUhjO/2zzQXKQvv2RT0EQcSG
	vbspCEZlDthBW4xAwdE3RdNd2JFbvws1jVFgGbtOPvpdNkFWEtRhvvdsAFu4/Y1tdPnByu6aNdyH9
	h+wcgeMrcJpmB9EUFnneWAhgDRKIY0XCtCzv/624DEF1o5I4x6vL7Sekk2WL3qUgbLcVRQrehqFf1
	BU3u2+hFJBNc4gPabpjIvHfJgT2ePYk0G8F8wo7dmLqZvVNDIjp+h9gB3fKlVKoa0W52/npd5aIfw
	LMrDPdBbNXIQ6qp+EMQFjGL5N5F1QppKEBVfgFmx0yEI2vyKWOm6hdGNdfinVPvNwLk531AJF/M4i
	qG8ny76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL05u-000000046iy-44zJ;
	Thu, 07 May 2026 14:52:54 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL05t-000000046iP-0ZgP;
	Thu, 07 May 2026 14:52:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1778165549; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gnoQamEnOtplYB0I+IAslgQbn8pbGYB69jQehTFsGfodQdyEq9N8s+8IaNQKwXL/NDNsawSM/Z24cn1OYsoIL42X1HyPLDQRnaqTCp8EbXe1KuvMvk5LtH+mEi7GRXP3W5KPsCWtActawG/STVReMfEy/yqHt7lFbvRLBwzGCUM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778165549; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mD80HyVHazAI7zY5u5ppiXiv/kRQLmFGurqGNhp1Zzg=; 
	b=AhxTDMRqMIdHYGdQlIxOWo/w5Yz5yPQybWfRB7KQ1G+XgIQR5AJA3uWTDk39YfBwadzwFfM+oo75B9ALzq5a14hn5rLGvoIvrTx3fI+FWIlw96uB17G4kVkwssUehgccD4OFIVq/EeR8ESEfE98d1Z0/BybHWz4mqdIF6H4BYTo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778165549;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=mD80HyVHazAI7zY5u5ppiXiv/kRQLmFGurqGNhp1Zzg=;
	b=fOdineQxBdsWNaByWoVgw199d+7PDlanFfm3mIwEsyWRlUH/RmGfoI/q97LzGnFF
	Pmgf2QzTPK0zhkSxGjMMGx7TbjLzXoS0N7L2tSBhWBqurBEKHhmumI2uDwqlYmkXsm6
	ki/LIERCJEAVU8uJ1GOsXQbZSpcwpdfMack/cvjY=
Received: by mx.zohomail.com with SMTPS id 1778165548105701.1379238259724;
	Thu, 7 May 2026 07:52:28 -0700 (PDT)
Message-ID: <2c441d51f6a865ddb6e67b63cd26a651ed3ff058.camel@collabora.com>
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
Date: Thu, 07 May 2026 16:52:22 +0200
In-Reply-To: <3688a285-7f98-4afa-80ad-697094cd7b97@lunn.ch>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
	 <20260326-add-airoha-an8801-support-v2-4-1a42d6b6050f@collabora.com>
	 <3688a285-7f98-4afa-80ad-697094cd7b97@lunn.ch>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_075253_239084_28F390DA 
X-CRM114-Status: GOOD (  23.44  )
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

On Thu, 2026-03-26 at 13:47 +0100, Andrew Lunn wrote:
> > +static int an8801r_led_blink_set(struct phy_device *phydev, u8
> > index,
> > +				 unsigned long *delay_on,
> > +				 unsigned long *delay_off)
> > +{
>=20
> ...
>=20
> > +	ret =3D phy_modify_mmd(phydev, MDIO_MMD_VEND2,
> > LED_ON_CTRL(index),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 LED_ON_EN, blink ? LED_ON_EN : 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
>=20
> Just
>=20
>=20
> 	return phy_modify_mmd(phydev, MDIO_MMD_VEND2,
> LED_ON_CTRL(index),
> 			=C2=A0=C2=A0=C2=A0=C2=A0 LED_ON_EN, blink ? LED_ON_EN : 0);
>=20
> > +		if (!led_trigger)
> > +			continue;
> > +
> > +		ret =3D an8801r_led_hw_control_set(phydev, led_id,
> > led_trigger);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +	return 0;
> > +}
>=20
>=20
> Please take a look at all your functions. Can the last error check be
> removed and just use return ret, etc.
I'll fix this in the next version.

>=20
> > +static int an8801r_of_init_leds(struct phy_device *phydev, u8
> > *led_cfg)
> > +{
> > +	struct device *dev =3D &phydev->mdio.dev;
> > +	struct device_node *np =3D dev->of_node;
> > +	struct device_node *leds;
> > +	u32 function_enum_idx;
> > +	int ret;
> > +
> > +	if (!np)
> > +		return 0;
> > +
> > +	/* If devicetree is present, leds configuration is
> > required */
> > +	leds =3D of_get_child_by_name(np, "leds");
> > +	if (!leds)
> > +		return 0;
> > +
> > +	for_each_available_child_of_node_scoped(leds, led) {
> > +		u32 led_idx;
> > +
> > +		ret =3D of_property_read_u32(led, "reg", &led_idx);
> > +		if (ret)
> > +			goto out;
> > +
> > +		if (led_idx >=3D AN8801R_NUM_LEDS) {
> > +			ret =3D -EINVAL;
> > +			goto out;
> > +		}
> > +
> > +		ret =3D of_property_read_u32(led, "function-
> > enumerator",
> > +					=C2=A0=C2=A0 &function_enum_idx);
> > +		if (ret)
> > +			function_enum_idx =3D AN8801R_LED_FN_NONE;
> > +
>=20
> What is this doing? Is this documented in the binding?
The `function-enumerator` property is only documented in the led common
dt-binding file. The an8801 dt-bindings inherits this property from the
ethernet-phy dt-bindings.

We aimed to have this PHY have its led behaviour (how many to enable
and what their role shall be) configurable using devicetree and not to
rely on a default configuration, hard-coded in the driver (like the
air_en8811h driver did) and also make use of the led hardware
offloading (for functions like 100/1000, activity blinking, and others)
that this PHY is capable of.

From the available property list for the led node, this one seems to be
appropriate to distinguish between the possible LAN functions, that=20
would mean that a specific LED has either a link or RX/Tx activity=20
role.=C2=A0That is why we used it but we could be wrong.

The an8801 dt-bindings (in patch 1) misses the possible values and
should improved in that regard and I'll fix them in next version if
this implementation seems acceptable to you.
>=20
> > +		if (function_enum_idx >=3D AN8801R_LED_FN_MAX) {
> > +			ret =3D -EINVAL;
> > +			goto out;
> > +		}
> > +
> > +		led_cfg[led_idx] =3D function_enum_idx;
> > +	}
> > +out:
> > +	of_node_put(leds);
> > +	return ret;
> > +}
>=20
> > +static int an8801r_read_status(struct phy_device *phydev)
> > +{
> > +	int prev_speed, ret;
> > +	u32 val;
> > +
> > +	prev_speed =3D phydev->speed;
> > +
> > +	ret =3D genphy_read_status(phydev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (phydev->link && prev_speed !=3D phydev->speed) {
> > +		val =3D phydev->speed =3D=3D SPEED_1000 ?
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AN8801_BPBUS_LINK_MODE_1000 : 0;
> > +
> > +		return an8801_buckpbus_reg_rmw(phydev,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > AN8801_BPBUS_REG_LINK_MODE,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > AN8801_BPBUS_LINK_MODE_1000,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val);
> > +	};
>=20
> This is unusual. What is it doing? Please add a comment.
This call is to ensure that the PHY switches to the expected 1Gbps=20
speed when available.=C2=A0
I'll confirm it and add a comment in v3.

Best regards,
Louis-Alexis
>=20
> 	Andrew

