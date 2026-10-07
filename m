Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8608ECA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2QYGdKlNHqVyVmJ+a4HH3py6V62qJ39qB+ljfaz3+E=; b=zsaUbpzgcLL9YfVZOiWqJdd8am
	RD2bpRn9TUSUy+NouGHOqum9Q2yc3lEkEzASSjyFAENJ5MHItyOKPL3+mszq8mv7NQZgKZTWFxn0Y
	saHEFjSo823voUGIlHVy99m1OghqS0TmJ6jh7wqGD2tKRhug3F4nDfuMTGm+oc1DEhN2PUUXNvr6Z
	pqOnRu0z92wq/OG6nB/ufRFjCk3fYnCtZdk6yQLF8LSYLrjvYKFiGMVMsfE3DQH6y8+/tdFduwbIR
	eKEne7F38AMBbr08XctwpnfQHM9dB8uzC8+nwp88CeluNSFquHkfe644xpnkNV1q1xLcp/H+fKByg
	pXLtVxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETOD-00000002hH8-10QE;
	Wed, 07 Oct 2026 15:17:05 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETO9-00000002hGI-3RBg;
	Wed, 07 Oct 2026 15:17:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791386200; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jY7hJ0dRVgsEvMXH8j9XUNfAqHe9b3NW1bVGNZJZTEVU0UBFyT6MpHfk8zSRbm7GtOaH2QrWLmgpblsabP4m+3v/vpv/S+KbwZGAcdwmeHiRnB+ABJlpiz1c8zA15TEjOok1ZuMlD0HZ9j53eJ2QRcTz77La+OQG94Ajaru/gp4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791386200; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E2QYGdKlNHqVyVmJ+a4HH3py6V62qJ39qB+ljfaz3+E=; 
	b=hvBpbBafVRYxi+iurLHe8vs/bigBUvfyr/tTDLeQ3k5HsV3Ukh0ZO7Adg7P+OYaSew1+42OYIfgwD0eClYW+zleqIPDwG1yhpgB+JjT6Bn3twN8GkDGpDzCbrzi+VK5F1e2dOCEGW5TXprqtO+ZjnPYAFwXmEMRomQqPWka+EwQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791386200;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=E2QYGdKlNHqVyVmJ+a4HH3py6V62qJ39qB+ljfaz3+E=;
	b=Sm6aDuhPtFtYEX6wir6YNyUq1F1StvEpw0/1pNM1Cr/WkiFWQvhciFzwUlxKP2Tq
	Z3f/JsxqQTBpklzhy342IrTKAJtBkHMmwOJpidLYJnJBY1ykHV3HOlYFEt6BSeO+1qK
	oVfSKR4Gnm+UyvdDVQwhpZbZCGcknivhpbHkvsLI=
Received: by smtp.zohomail.com with SMTPS id 1791386197417427.99971218964686;
	Wed, 7 Oct 2026 08:16:37 -0700 (PDT)
Message-ID: <1af4b5461a80219d00a4be853c9111d60fe18f79.camel@collabora.com>
Subject: Re: [PATCH net-next v2 2/7] net: stmmac: mediatek: simplify TX/RX
 delay handling in mt8195_set_delay
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni	 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran	 <richardcochran@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Biao Huang
 <biao.huang@mediatek.com>, Maxime Coquelin	 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 07 Oct 2026 17:16:31 +0200
In-Reply-To: <47b9d9a2-18cb-4726-82f7-772d108b2ee8@bootlin.com>
References: <20260924-dwmac-mediatek-mt8189-v2-0-430bd74d5ef9@collabora.com>
	 <20260924-dwmac-mediatek-mt8189-v2-2-430bd74d5ef9@collabora.com>
	 <47b9d9a2-18cb-4726-82f7-772d108b2ee8@bootlin.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_081701_990279_AD912323 
X-CRM114-Status: GOOD (  33.72  )
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

On Sun, 2026-10-04 at 15:43 +0200, Maxime Chevallier wrote:
> Hey,
>=20
> On 9/24/26 09:23, Louis-Alexis Eyraud wrote:
> > The mt8195_set_delay function modifies at its beginning the TX and
> > RX
> > internal delay variables, located in the driver data, by dividing
> > them by a constant (290) and restores their original values by
> > multiplying them again at the function end. It is done in order to
> > convert them into a step value, used by the hardware registers for
> > setting these delays.
> >=20
> > But this is rather pointless to modify the driver data for that,
> > while
> > it could be done locally in the function. The original delay values
> > cannot be used anymore (if needed) during mt8195_set_delay
> > processing.
> > Finally, they are altered after the function call if they are not a
> > multiple of 290.
> >=20
> > So, simplify these delay variable handling by using local variables
> > to
> > convert them into the register value and use those in the write
> > calls.
> > Also, remove the two private conversion functions, that are not
> > useful
> > anymore and add definitions for MT8195 RX/TX delay maximum and
> > divider
> > values.
> >=20
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
>=20
> Looking at this, seems like the 2712 support could benefit from the
> same
> cleanups you've done with the weird division / remultiplication.
>=20
> That can be a separate cleanup though.
>=20
> Maxime
>=20
thanks for the review.

I'll add an additional patch to do the same cleanup for MT2712
in v3.

Regards,
Louis-Alexis

>=20
> > ---
> > =C2=A0.../net/ethernet/stmicro/stmmac/dwmac-mediatek.c=C2=A0=C2=A0 | 77
> > ++++++++++------------
> > =C2=A01 file changed, 36 insertions(+), 41 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > index 30ae0dba7fff..f7eb85110df0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > @@ -63,6 +63,11 @@
> > =C2=A0#define MT8195_DLY_RMII_TXC_ENABLE	BIT(5)
> > =C2=A0#define MT8195_DLY_RMII_TXC_STAGES	GENMASK(4, 0)
> > =C2=A0
> > +#define MT8195_DLY_RXC_STAGE_DIV	290 /* 290ps per stage */
> > +#define MT8195_DLY_RXC_MAX		9280 /* 32 x 290ps */
> > +#define MT8195_DLY_TXC_STAGE_DIV	290 /* 290ps per stage */
> > +#define MT8195_DLY_TXC_MAX		9280 /* 32 x 290ps */
> > +
> > =C2=A0struct mac_delay_struct {
> > =C2=A0	u32 tx_delay;
> > =C2=A0	u32 rx_delay;
> > @@ -293,39 +298,27 @@ static int mt8195_set_interface(struct
> > mediatek_dwmac_plat_data *plat,
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > -static void mt8195_delay_ps2stage(struct mediatek_dwmac_plat_data
> > *plat)
> > -{
> > -	struct mac_delay_struct *mac_delay =3D &plat->mac_delay;
> > -
> > -	/* 290ps per stage */
> > -	mac_delay->tx_delay /=3D 290;
> > -	mac_delay->rx_delay /=3D 290;
> > -}
> > -
> > -static void mt8195_delay_stage2ps(struct mediatek_dwmac_plat_data
> > *plat)
> > -{
> > -	struct mac_delay_struct *mac_delay =3D &plat->mac_delay;
> > -
> > -	/* 290ps per stage */
> > -	mac_delay->tx_delay *=3D 290;
> > -	mac_delay->rx_delay *=3D 290;
> > -}
> > -
> > =C2=A0static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat=
)
> > =C2=A0{
> > =C2=A0	struct mac_delay_struct *mac_delay =3D &plat->mac_delay;
> > -	u32 gtxc_delay_val =3D 0, delay_val =3D 0, rmii_delay_val =3D 0;
> > -
> > -	mt8195_delay_ps2stage(plat);
> > +	u32 rx_delay_stage_val =3D mac_delay->rx_delay /
> > MT8195_DLY_RXC_STAGE_DIV;
> > +	u32 tx_delay_stage_val =3D mac_delay->tx_delay /
> > MT8195_DLY_TXC_STAGE_DIV;
> > +	u32 gtxc_delay_val =3D 0;
> > +	u32 rmii_delay_val =3D 0;
> > +	u32 delay_val =3D 0;
> > =C2=A0
> > =C2=A0	switch (plat->phy_mode) {
> > =C2=A0	case PHY_INTERFACE_MODE_MII:
> > -		delay_val |=3D FIELD_PREP(MT8195_DLY_TXC_ENABLE,
> > !!mac_delay->tx_delay);
> > -		delay_val |=3D FIELD_PREP(MT8195_DLY_TXC_STAGES,
> > mac_delay->tx_delay);
> > +		delay_val |=3D FIELD_PREP(MT8195_DLY_TXC_ENABLE,
> > +					!!tx_delay_stage_val);
> > +		delay_val |=3D FIELD_PREP(MT8195_DLY_TXC_STAGES,
> > +					tx_delay_stage_val);
> > =C2=A0		delay_val |=3D FIELD_PREP(MT8195_DLY_TXC_INV,
> > mac_delay->tx_inv);
> > =C2=A0
> > -		delay_val |=3D FIELD_PREP(MT8195_DLY_RXC_ENABLE,
> > !!mac_delay->rx_delay);
> > -		delay_val |=3D FIELD_PREP(MT8195_DLY_RXC_STAGES,
> > mac_delay->rx_delay);
> > +		delay_val |=3D FIELD_PREP(MT8195_DLY_RXC_ENABLE,
> > +					!!rx_delay_stage_val);
> > +		delay_val |=3D FIELD_PREP(MT8195_DLY_RXC_STAGES,
> > +					rx_delay_stage_val);
> > =C2=A0		delay_val |=3D FIELD_PREP(MT8195_DLY_RXC_INV,
> > mac_delay->rx_inv);
> > =C2=A0		break;
> > =C2=A0	case PHY_INTERFACE_MODE_RMII:
> > @@ -336,16 +329,16 @@ static int mt8195_set_delay(struct
> > mediatek_dwmac_plat_data *plat)
> > =C2=A0			 * The ingress timing can be adjusted by
> > RMII_RXC delay macro circuit.
> > =C2=A0			 */
> > =C2=A0			rmii_delay_val |=3D
> > FIELD_PREP(MT8195_DLY_RMII_TXC_ENABLE,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0 !!mac_delay-
> > >tx_delay);
> > +						=C2=A0=C2=A0=C2=A0=C2=A0
> > !!tx_delay_stage_val);
> > =C2=A0			rmii_delay_val |=3D
> > FIELD_PREP(MT8195_DLY_RMII_TXC_STAGES,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0 mac_delay-
> > >tx_delay);
> > +						=C2=A0=C2=A0=C2=A0=C2=A0
> > tx_delay_stage_val);
> > =C2=A0			rmii_delay_val |=3D
> > FIELD_PREP(MT8195_DLY_RMII_TXC_INV,
> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0 mac_delay-
> > >tx_inv);
> > =C2=A0
> > =C2=A0			rmii_delay_val |=3D
> > FIELD_PREP(MT8195_DLY_RMII_RXC_ENABLE,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0 !!mac_delay-
> > >rx_delay);
> > +						=C2=A0=C2=A0=C2=A0=C2=A0
> > !!rx_delay_stage_val);
> > =C2=A0			rmii_delay_val |=3D
> > FIELD_PREP(MT8195_DLY_RMII_RXC_STAGES,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0 mac_delay-
> > >rx_delay);
> > +						=C2=A0=C2=A0=C2=A0=C2=A0
> > rx_delay_stage_val);
> > =C2=A0			rmii_delay_val |=3D
> > FIELD_PREP(MT8195_DLY_RMII_RXC_INV,
> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0 mac_delay-
> > >rx_inv);
> > =C2=A0		} else {
> > @@ -361,9 +354,9 @@ static int mt8195_set_delay(struct
> > mediatek_dwmac_plat_data *plat)
> > =C2=A0				 * by RXC delay macro circuit.
> > =C2=A0				 */
> > =C2=A0				delay_val |=3D
> > FIELD_PREP(MT8195_DLY_RXC_ENABLE,
> > -
> > 							!!mac_delay->rx_delay);
> > +							!!rx_delay
> > _stage_val);
> > =C2=A0				delay_val |=3D
> > FIELD_PREP(MT8195_DLY_RXC_STAGES,
> > -							mac_delay-
> > >rx_delay);
> > +							rx_delay_s
> > tage_val);
> > =C2=A0				delay_val |=3D
> > FIELD_PREP(MT8195_DLY_RXC_INV,
> > =C2=A0							mac_delay-
> > >rx_inv);
> > =C2=A0			} else {
> > @@ -372,9 +365,9 @@ static int mt8195_set_delay(struct
> > mediatek_dwmac_plat_data *plat)
> > =C2=A0				 * by TXC delay macro circuit.
> > =C2=A0				 */
> > =C2=A0				delay_val |=3D
> > FIELD_PREP(MT8195_DLY_TXC_ENABLE,
> > -
> > 							!!mac_delay->rx_delay);
> > +							!!rx_delay
> > _stage_val);
> > =C2=A0				delay_val |=3D
> > FIELD_PREP(MT8195_DLY_TXC_STAGES,
> > -							mac_delay-
> > >rx_delay);
> > +							rx_delay_s
> > tage_val);
> > =C2=A0				delay_val |=3D
> > FIELD_PREP(MT8195_DLY_TXC_INV,
> > =C2=A0							mac_delay-
> > >rx_inv);
> > =C2=A0			}
> > @@ -384,12 +377,16 @@ static int mt8195_set_delay(struct
> > mediatek_dwmac_plat_data *plat)
> > =C2=A0	case PHY_INTERFACE_MODE_RGMII_TXID:
> > =C2=A0	case PHY_INTERFACE_MODE_RGMII_RXID:
> > =C2=A0	case PHY_INTERFACE_MODE_RGMII_ID:
> > -		gtxc_delay_val |=3D
> > FIELD_PREP(MT8195_DLY_GTXC_ENABLE, !!mac_delay->tx_delay);
> > -		gtxc_delay_val |=3D
> > FIELD_PREP(MT8195_DLY_GTXC_STAGES, mac_delay->tx_delay);
> > +		gtxc_delay_val |=3D
> > FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0
> > !!tx_delay_stage_val);
> > +		gtxc_delay_val |=3D
> > FIELD_PREP(MT8195_DLY_GTXC_STAGES,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 tx_delay_stage_val);
> > =C2=A0		gtxc_delay_val |=3D FIELD_PREP(MT8195_DLY_GTXC_INV,
> > mac_delay->tx_inv);
> > =C2=A0
> > -		delay_val |=3D FIELD_PREP(MT8195_DLY_RXC_ENABLE,
> > !!mac_delay->rx_delay);
> > -		delay_val |=3D FIELD_PREP(MT8195_DLY_RXC_STAGES,
> > mac_delay->rx_delay);
> > +		delay_val |=3D FIELD_PREP(MT8195_DLY_RXC_ENABLE,
> > +					!!rx_delay_stage_val);
> > +		delay_val |=3D FIELD_PREP(MT8195_DLY_RXC_STAGES,
> > +					rx_delay_stage_val);
> > =C2=A0		delay_val |=3D FIELD_PREP(MT8195_DLY_RXC_INV,
> > mac_delay->rx_inv);
> > =C2=A0
> > =C2=A0		break;
> > @@ -408,8 +405,6 @@ static int mt8195_set_delay(struct
> > mediatek_dwmac_plat_data *plat)
> > =C2=A0	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL1,
> > delay_val);
> > =C2=A0	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL2,
> > rmii_delay_val);
> > =C2=A0
> > -	mt8195_delay_stage2ps(plat);
> > -
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > @@ -418,8 +413,8 @@ static const struct mediatek_dwmac_variant
> > mt8195_gmac_variant =3D {
> > =C2=A0	.dwmac_set_delay =3D mt8195_set_delay,
> > =C2=A0	.clk_list =3D mt8195_dwmac_clk_l,
> > =C2=A0	.num_clks =3D ARRAY_SIZE(mt8195_dwmac_clk_l),
> > -	.rx_delay_max =3D 9280,
> > -	.tx_delay_max =3D 9280,
> > +	.rx_delay_max =3D MT8195_DLY_RXC_MAX,
> > +	.tx_delay_max =3D MT8195_DLY_TXC_MAX,
> > =C2=A0	.dma_bit_mask =3D 35,
> > =C2=A0};
> > =C2=A0
> >=20
>=20

