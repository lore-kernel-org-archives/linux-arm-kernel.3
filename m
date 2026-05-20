Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061B9CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 12:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6RTBcDwCUAggrkL6cocI+jcG+EHQ7is9sXnrTTyELw=; b=wa3SndMQ2IJnMBF9BVBXc0qoZB
	1JeuwRe34lL6QYYK+Ti/Y5oQ8aAq7Sp8xugm8SbnXyMgQk9G1jIJZQfj9JoStEtHeqoF3t671oLhi
	uONpbtEFHIz/oY1Hnxj5kSPDTz0+fZtT4TdQaWIcU7zahVP4jftbveU8evIBuk00QnJisyjTgkHES
	Z/VemJ/M13Rz5Ua1evJgZ0SY62vjA1N1Ie0f+CDiJGHOKGCivdLBSPfohXfEOiejVFB5mvbd19QVT
	p75sotlibold4XR9lkTcBUSJ9JYLgqJE0EHJs2bDbIhfwAQw+SuBY6anS6e0fESbdurIyItu8G7Wm
	FZGvFsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgKC-00000004bT0-4A2B;
	Wed, 20 May 2026 12:47:00 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgKA-00000004bS4-3tgn;
	Wed, 20 May 2026 12:47:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779281190; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mo1rJIqCjsETSxeBlA/L09pa826Mm+LiDvydim+2eo2AYNHhOluWEbNed8kaEfd97DMvCEdkl4PZznAoVkEIYssHGSkEW2p63Ihq2lB7QLtGr+VwznZNwhvdSrYOS95uSkVBaoFihQujArEUKAVI3dHjTxYrhbt/Jg13Kq/ntBQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779281190; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=L6RTBcDwCUAggrkL6cocI+jcG+EHQ7is9sXnrTTyELw=; 
	b=aGduDpgjxZOUrVuepzUN475CJOp0FxUmYSlpVfaKvE77g6l6aPj2sYxvUlV3dcVtyExK0vio8C5SAbNvwGEdkUsIanPddG0+yreOB5/+5UeBzJsXj4tyUI5zL/JU4Hyh4CWKZvZhxHJNjK0cijAlo7xDeUIzGnt5WDCH52rY6+8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779281190;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=L6RTBcDwCUAggrkL6cocI+jcG+EHQ7is9sXnrTTyELw=;
	b=jHWswEblvW1vK8XuhlZdi620omvMnhmjmsspqomaIrUxF6boKfMqcgaAawSVlJpk
	/OAJH3cZ8+sxHYSO6fHHRAOt5VDvAZPGJuQYUTDV+4srCmRMXTX9N/f8J2aozt6iJyC
	uIlWdFzbYc1wM3FSeLSZoRNviH8pHKE/ViT7MpFQ=
Received: by mx.zohomail.com with SMTPS id 1779281188633314.64127682579726;
	Wed, 20 May 2026 05:46:28 -0700 (PDT)
Message-ID: <d61f709524326a4f9943188fcabb5746a1b11e3d.camel@collabora.com>
Subject: Re: [PATCH net-next v3 5/6] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
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
Date: Wed, 20 May 2026 14:46:22 +0200
In-Reply-To: <e77b4028-c201-4dd4-9214-721bdf67e976@bootlin.com>
References: <20260512-add-airoha-an8801-support-v3-0-1edb34e363ae@collabora.com>
	 <20260512-add-airoha-an8801-support-v3-5-1edb34e363ae@collabora.com>
	 <e77b4028-c201-4dd4-9214-721bdf67e976@bootlin.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_054659_037247_C2599EC8 
X-CRM114-Status: GOOD (  22.28  )
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

On Tue, 2026-05-12 at 12:06 +0200, Maxime Chevallier wrote:
> Hi :)
>=20
> This looks good, I just have very minimal comments
>=20
> On 5/12/26 06:33, Louis-Alexis Eyraud wrote:
> > From: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> >=20
> > Introduce a driver for the Airoha AN8801R Series Gigabit Ethernet
> > PHY; this currently supports setting up PHY LEDs, 10/100M, 1000M
> > speeds, and Wake on LAN and PHY interrupts.
> >=20
> > Signed-off-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
>=20
> [...]
>=20
> > +static u32 an8801r_led_blink_ms_to_hw(unsigned long req_ms)
> > +{
> > +	u32 req_ns, regval;
> > +
> > +	if (req_ms > AN8801_MAX_PERIOD_MS)
> > +		req_ms =3D AN8801_MAX_PERIOD_MS;
> > +
> > +	req_ns =3D req_ms * 1000000;
>=20
> Use NSEC_PER_MSEC :)
I'll fix this in the next version.

>=20
> > +
> > +	/* Round to the nearest period unit... */
> > +	regval =3D req_ns + (AN8801_PERIOD_UNIT / 2);
> > +
> > +	/* ...and now divide by the full period */
> > +	regval >>=3D AN8801_PERIOD_SHIFT;
> > +
> > +	return regval;
> > +}
> > +
>=20
> [...]
>=20
> > +static int an8801r_led_hw_control_set(struct phy_device *phydev,
> > u8 index,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long rules)
> > +{
> > +	u16 on =3D 0, blink =3D 0;
> > +	int ret;
> > +
> > +	if (index >=3D AN8801R_NUM_LEDS)
> > +		return -EINVAL;
> > +
> > +	ret =3D an8801r_led_trig_to_hw(rules, &on, &blink);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D phy_modify_mmd(phydev, MDIO_MMD_VEND2,
> > LED_ON_CTRL(index),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 LED_ON_EVT_MASK, on);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D phy_modify_mmd(phydev, MDIO_MMD_VEND2,
> > LED_BLINK_CTRL(index),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 LED_BLINK_EVT_MASK, blink);
> > +
> > +	if (ret)
> > +		return ret;
>=20
> Extra newline before the if()
I'll fix this in the next version too.

>=20
> > +
> > +	return phy_modify_mmd(phydev, MDIO_MMD_VEND2,
> > LED_ON_CTRL(index),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_ON_EN, on | blink ? LED_ON_EN :
> > 0);
> > +}
> > +
>=20
> [...]
>=20
> > +static int an8801r_rgmii_rxdelay(struct phy_device *phydev, bool
> > enable,
> > +				 u16 delay_steps)
> > +{
> > +	u32 reg_val;
> > +
> > +	if (delay_steps > RGMII_DELAY_STEP_MASK)
> > +		return -EINVAL;
> > +
> > +	if (enable) {
> > +		reg_val =3D delay_steps & RGMII_DELAY_STEP_MASK;
> > +
> > +		 /* Set align bit to add extra offset for RX delay
> > */
> > +		reg_val |=3D RGMII_RXDELAY_ALIGN;
> > +
> > +		 /* Set force mode bit to enable RX delay
> > insertion */
> > +		reg_val |=3D RGMII_RXDELAY_FORCE_MODE;
> > +	} else {
> > +		reg_val =3D 0;
> > +	}
> > +
> > +	return an8801_buckpbus_reg_write(phydev,
> > AN8801_BPBUS_REG_RXDLY_STEP,
> > +					 reg_val);
> > +}
> > +
> > +static int an8801r_rgmii_txdelay(struct phy_device *phydev, bool
> > enable,
> > +				 u16 delay_steps)
> > +{
> > +	u32 reg_val;
> > +
> > +	if (delay_steps > RGMII_DELAY_STEP_MASK)
> > +		return -EINVAL;
> > +
> > +	if (enable) {
> > +		reg_val =3D delay_steps & RGMII_DELAY_STEP_MASK;
>=20
> Is this bitwise and needed, as you have the check above ?
Indeed, it is not needed, so I'll remove this masking operation here
and in an8801r_rgmii_rxdelay too.

>=20
> > +
> > +		 /* Set force mode bit to enable TX delay
> > insertion */
> > +		reg_val |=3D RGMII_TXDELAY_FORCE_MODE;
> > +	} else {
> > +		reg_val =3D 0;
> > +	}
> > +
> > +	return an8801_buckpbus_reg_write(phydev,
> > AN8801_BPBUS_REG_TXDLY_STEP,
> > +					 reg_val);
> > +}
> > +
> > +static int an8801r_rgmii_delay_config(struct phy_device *phydev)
> > +{
> > +	bool enable_delay;
> > +	u16 delay_step;
> > +	int ret;
> > +
> > +	if (phydev->interface =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> > +	=C2=A0=C2=A0=C2=A0 phydev->interface =3D=3D PHY_INTERFACE_MODE_RGMII_=
TXID) {
> > +		enable_delay =3D true;
> > +		delay_step =3D AN8801_RGMII_TXDELAY_DEFAULT;
> > +	} else {
> > +		enable_delay =3D false;
> > +		delay_step =3D RGMII_DELAY_NO_STEP;
> > +	}
> > +
> > +	ret =3D an8801r_rgmii_txdelay(phydev, enable_delay,
> > delay_step);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (phydev->interface =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> > +	=C2=A0=C2=A0=C2=A0 phydev->interface =3D=3D PHY_INTERFACE_MODE_RGMII_=
RXID) {
> > +		enable_delay =3D true;
> > +		delay_step =3D AN8801_RGMII_RXDELAY_DEFAULT;
>=20
> Is it correct that AN8801_RGMII_RXDELAY_DEFAULT expands to=20
> RGMII_DELAY_NO_STEP ? feels strange, but it may simply be how the HW
> is=20
> made :)
As I replied in an earlier comment ([1]), for the inserted RX delay,
when the RGMII_RXDELAY_ALIGN bit is set, the "no step" value is then
the closest setting to the 2ns value.

I'll improve the AN8801_RGMII_RXDELAY_DEFAULT comment to say that it
corresponds to the 1.992ns delay value when the align bit is set and -
0.008ns otherwise.

[1]:https://lore.kernel.org/linux-mediatek/199e674cfdbccad104db761964611b1d=
6352f9f3.camel@collabora.com/

Best regards,
Louis-Alexis
>=20
> Thanks,
>=20
> Maxime

