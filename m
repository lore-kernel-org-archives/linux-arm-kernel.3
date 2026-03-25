Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5048D109C027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLWt4Q3M25ZHux2mJmZzU06JtrlUU7M4bRigJUnf5rs=; b=RHXjrLeqZuIjnRKSJlrH/anW5X
	bH8SC16ut69EM3doGCFgCKZ5LiiIT6cAZUZ6Jx65dZkTPHGY7B2+WjqQcu39QOsvpO8E1FxjgSiS+
	g424ZoaBeGIivkGHmB4KY+y6kTNKHW+RrqUj1vp39GL/9h+aDxgZtb89R8E7KskoOf5iRa9Pby5am
	DqlONLka5BgfbONJ1sCO+fQ87c9G2vp+zFfL55uZFAfUjH0gDLAdlF0imYSw3SeZmV6sv1YPaUYw6
	gto5DuSkpXsVTYw4nk2z8khBsZ7j1hX9zAp7X5GM6/j0WxYcjoBu6aKYzd6Xp2WVtlMB4bfho37U4
	RZMCZVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PTU-00000003dzF-3J75;
	Wed, 25 Mar 2026 14:44:48 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PTR-00000003dyH-29Ni;
	Wed, 25 Mar 2026 14:44:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774449856; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fNRVGybp0b0ccTPEK93XLei9ra26a+WiK5T3HjYSwdjw0QX2kcQrJL0nSD+JukDDmVHNZ4wXzGSKKRA4TbVjiMMf+FpU6Z7wJEcRf9/gcFm2uqJYFF+GMKth/GCo4drecmKMtffXva2gnCvQ8qzqrgnDMWHFi3Yk8sVqGjanHSA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774449856; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xLWt4Q3M25ZHux2mJmZzU06JtrlUU7M4bRigJUnf5rs=; 
	b=RJaCrtontfYAy5AIPGGtIE0x/ZruFSWKTnFPC4hGog+3QdLh2VMMTCAsyBLDHg0Hn4ks3rt20LBfGmaoqqcbER2JS8KEddB8PxlJxK+rT24ImJ3c3d+cWsynoAU8YT9yGWnccKig9UQbwCH50tcFZlqeC5S/g3oH0D6RINF2zbo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774449856;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=xLWt4Q3M25ZHux2mJmZzU06JtrlUU7M4bRigJUnf5rs=;
	b=Vi4bPuUNNPi2QNEocePGBUXkNmGOhjpUsr3LEaJfvQ9sirNaFJNUiAxsQ1kUTJHA
	wuEr/oz/5n8No780ciaNqvzLiNaeWEsECL0yo68RjQbKQvQ3Hf/qKGD7sy0wvg3Irlb
	ot9LTVnFpcSlZOQ7WXHBnTi3EWtG67rJU7T+YBG0=
Received: by mx.zohomail.com with SMTPS id 1774449855209698.9967635371158;
	Wed, 25 Mar 2026 07:44:15 -0700 (PDT)
Message-ID: <d2b284b8786fdf241a328bb4497c037b1d517c25.camel@collabora.com>
Subject: Re: [PATCH net-next 2/2] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, kevin-kw.huang@airoha.com,
 macpaul.lin@mediatek.com, matthias.bgg@gmail.com, 	kernel@collabora.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 25 Mar 2026 15:44:09 +0100
In-Reply-To: <aaheilkwpQ90xMmR@shell.armlinux.org.uk>
References: <20260304-add-airoha-an8801-support-v1-0-0ae4ee5a2f9d@collabora.com>
	 <20260304-add-airoha-an8801-support-v1-2-0ae4ee5a2f9d@collabora.com>
	 <aaheilkwpQ90xMmR@shell.armlinux.org.uk>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_074445_621543_59851F29 
X-CRM114-Status: GOOD (  29.31  )
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

Hi Russell,

On Wed, 2026-03-04 at 16:32 +0000, Russell King (Oracle) wrote:
> On Wed, Mar 04, 2026 at 10:35:29AM +0100, Louis-Alexis Eyraud wrote:
> > +static void an8801r_get_wol(struct phy_device *phydev,
> > +			=C2=A0=C2=A0=C2=A0 struct ethtool_wolinfo *wol)
> > +{
> > +	u32 reg_val;
> > +
> > +	air_buckpbus_reg_read(phydev,
> > AN8801_BPBUS_REG_WAKEUP_CTL1, &reg_val);
> > +
> > +	wol->supported =3D WAKE_MAGIC;
> > +
> > +	if (reg_val & AN8801_WOL_WAKE_MAGIC_EN)
> > +		wol->wolopts |=3D WAKE_MAGIC;
> > +	else
> > +		wol->wolopts &=3D ~WAKE_MAGIC;
>=20
> Please only support WoL if you know that the PHY has been wired up in
> such a way to allow it to actually wake the system. The PHY itself
> merely supporting WoL is insufficient.
>=20
> Please look at my recent change to realtek_main.c in commit
> b826bf795564 ("net: phy: realtek: fix RTL8211F wake-on-lan support")
> to see a possible way to achieve this.
>=20
First, sorry for the delay, and thank you for pointing out this commit.

It indeed showed me what the WoL implementation for this PHY driver was
missing, not only for the get_wol/set_wol but also elsewhere in the
driver.

So for v2, I've reworked in a similar way the get_wol/set_wol, the
interrupt handling (to process differently the magic packet and the
link change interrupts) and also added custom probe, suspend and resume
callbacks (to be able to disable link change interrupt during suspend
time and enable it again after resume if the user has enabled the WoL
setting, like you did for RTL8211F).

I had a bit of trouble make it work right. At first I could not read
properly the PHY buckpbus registers in the suspend callback, and adding
a delay at resume time was needed as a workaround to make the WoL
behaviour work consistently. But in the end I found out it was the
Ethernet interface pinctrl config for sleep state in my board
devicetree that caused me those issues.
It works fine now without any workaround.

> > +static int an8801r_config_init(struct phy_device *phydev)
> > +{
> > +	u8 led_default_function[AN8801R_NUM_LEDS] =3D { 0 };
> > +	int prev_page, ret;
> > +
> > +	ret =3D an8801r_of_init_leds(phydev, led_default_function);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Disable Low Power Mode (LPM) */
> > +	ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND2,
> > AN8801_REG_PHY_INTERNAL0,
> > +			=C2=A0=C2=A0=C2=A0 FIELD_PREP(AN8801_PHY_INTFUNC_MASK,
> > 0x1e));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND2,
> > AN8801_REG_PHY_INTERNAL1,
> > +			=C2=A0=C2=A0=C2=A0 FIELD_PREP(AN8801_PHY_INTFUNC_MASK,
> > 0x2));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Disable EEE by default */
> > +	ret =3D phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV,
> > 0);
> > +	if (ret)
> > +		return ret;
>=20
> Are you sure this is safe, e.g. over a suspend/resume, and doesn't
> cause the hardware vs software state to desync?=20
While reworking PHY WoL support, I've tested removing this EEE
disabling done during driver initial config and I did not notice any
particular issue, especially during suspend/resume sequences.=C2=A0Still
unsure why the downstream driver disabled it in first place.

The EEE support seems working fine too from what ethtool reports on my
board, so I'll remove the lines from v2.
>=20
> > +
> > +	prev_page =3D phy_select_page(phydev,
> > AIR_PHY_PAGE_EXTENDED_1);
> > +	if (prev_page < 0)
> > +		return prev_page;
>=20
> No, this is buggy. Please read the phy_select_page() documentation to
> find out why.
>=20
> > +
> > +	/* Set the PHY to perform auto-downshift after 3 auto-
> > negotiation
> > +	 * attempts
> > +	 */
> > +	__phy_write(phydev, AN8801_EXT_REG_PHY,
> > +		=C2=A0=C2=A0=C2=A0 FIELD_PREP(AN8801_EXT_PHY_CTRL1, 0x1d) |
> > +		=C2=A0=C2=A0=C2=A0 FIELD_PREP(AN8801_EXT_PHY_DOWNSHIFT_CTL, 1) |
> > +		=C2=A0=C2=A0=C2=A0 AN8801_EXT_PHY_DOWNSHIFT_EN);
> > +
> > +	ret =3D phy_restore_page(phydev, prev_page, ret);
> > +	if (ret)
> > +		return ret;
>=20
> However, the bug could've been avoided by using the appropriate
> accessor:
>=20
> 	ret =3D phy_write_paged(phydev, AIR_PHY_PAGE_EXTENDED_1,
> 			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AN8801_EXT_REG_PHY,
> 			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD_PREP(AN8801_EXT_PHY_CTRL1, 0x1d)
> |
> 			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> FIELD_PREP(AN8801_EXT_PHY_DOWNSHIFT_CTL, 1) |
> 			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AN8801_EXT_PHY_DOWNSHIFT_EN);
> 	if (ret < 0)
> 		return ret;
thanks for catching this bug.
I've replaced for v2 the __phy_write call by phy_write_paged cas you
suggested.
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
> > +	if (!phydev->link)
> > +		return 0;
> > +
> > +	if (prev_speed !=3D phydev->speed) {
>=20
> Maybe:
>=20
> 	if (phydev->link && prev_speed !=3D phydev->speed) {
>=20
> ?
Ack.

Thanks again for the review.

Regards,
Louis-Alexis
>=20
> Thanks.

