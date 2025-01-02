Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E09E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLfdSiRgA4Ta9pe/RS5bp9KE5GKqwNgchupcDRcc39M=; b=1efXcOYDUf6JhmMiE5WVGMsYS0
	bD9YN5mvXZ2Crgj90pkB1PCoTx7KFRZZB97xvYJj+xpYluL/5jvH4uB+7EDJ4+6bMaP/L8DL6nB7B
	gJlk3INL4fVxyceCMu1DoDAAOTqFj4NzBpjYVvO7IB1M7H5ucU2yVjji3M6vw971WbKIyLyl9pbMz
	0Z85oc3T6SFhVhflB4qpJf2Q23kCtM+ezkV7I3XgnhUuj8verTTxsGveDgmCt1ncDkz05CT5yMcjD
	xgtvNwawvdqryfKZ67yGo2V2xf3QT7KRxZ+8HZAWy5AGUJlVnk7GJnaBm2rJhnPNt6FsxiP+sCkNz
	JJuZIQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOiN-0000000Awlk-0crR;
	Thu, 02 Jan 2025 17:10:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOcU-0000000AvUO-0E5c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 17:04:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tTOby-0003jY-Ce; Thu, 02 Jan 2025 18:03:54 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tTObv-006X4d-1G;
	Thu, 02 Jan 2025 18:03:52 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tTObw-0008kv-09;
	Thu, 02 Jan 2025 18:03:52 +0100
Date: Thu, 2 Jan 2025 18:03:52 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <Z3bG-B0E2l47znkE@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_090426_260368_E3FF81C7 
X-CRM114-Status: GOOD (  31.54  )
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

On Thu, Jan 02, 2025 at 10:48:05AM +0000, Russell King (Oracle) wrote:
> On Sun, Dec 22, 2024 at 07:54:37PM +0100, Oleksij Rempel wrote:
> > Here is updated version:
> >=20
> > ports {
> >     /* 1000BaseT Port with Ethernet and simple PoE */
> >     port0: ethernet-port@0 {
> >         reg =3D <0>; /* Port index */
> >         label =3D "ETH0"; /* Physical label on the device */
> >         connector =3D "RJ45"; /* Connector type */
> >         supported-modes =3D <10BaseT 100BaseTX 1000BaseT>; /* Supported=
 modes */
> >=20
> >         transformer {
> >             model =3D "ABC123"; /* Transformer model number */
> >             manufacturer =3D "TransformerCo"; /* Manufacturer name */
> >=20
> >             pairs {
> >                 pair@0 {
> >                     name =3D "A"; /* Pair A */
> >                     pins =3D <1 2>; /* Connector pins */
> >                     phy-mapping =3D <PHY_TX0_P PHY_TX0_N>; /* PHY pin m=
apping */
> >                     center-tap =3D "CT0"; /* Central tap identifier */
> >                     pse-negative =3D <PSE_GND>; /* CT0 connected to GND=
 */
> >                 };
> >                 pair@1 {
> >                     name =3D "B"; /* Pair B */
> >                     pins =3D <3 6>; /* Connector pins */
> >                     phy-mapping =3D <PHY_RX0_P PHY_RX0_N>;
> >                     center-tap =3D "CT1"; /* Central tap identifier */
> >                     pse-positive =3D <PSE_OUT0>; /* CT1 connected to PS=
E_OUT0 */
> >                 };
> >                 pair@2 {
> >                     name =3D "C"; /* Pair C */
> >                     pins =3D <4 5>; /* Connector pins */
> >                     phy-mapping =3D <PHY_TXRX1_P PHY_TXRX1_N>; /* PHY c=
onnection only */
> >                     center-tap =3D "CT2"; /* Central tap identifier */
> >                     /* No power connection to CT2 */
> >                 };
> >                 pair@3 {
> >                     name =3D "D"; /* Pair D */
> >                     pins =3D <7 8>; /* Connector pins */
> >                     phy-mapping =3D <PHY_TXRX2_P PHY_TXRX2_N>; /* PHY c=
onnection only */
> >                     center-tap =3D "CT3"; /* Central tap identifier */
> >                     /* No power connection to CT3 */
> >                 };
> >             };
> >         };
>=20
> I'm sorry, but... what is the point of giving this much detail in the DT
> description. How much of this actually would get used by *any* code?
>=20
> Why does it matter what transformer is used - surely 802.3 defines the
> characteristics of the signal at the RJ45 connector and it's up to the
> hardware designer to ensure that those characteristics are met. That
> will depend on the transformer, connector and board layout.
>=20
> What does it matter what connector pins are used? This is standardised.
>=20
> You also at one point had a description for a SFP cage (I'm sorry, I
> can't be bothered to find it in the 3000+ emails that I've missed over
> the Christmas period), using pin numbers 1, 2, 3, and 4. That's
> nonsense, those aren't the pin numbers for the data pairs. You also
> are effectively redefining what already exists for SFP cages - we
> already have a DT description for that, and it's based around the
> standardised connector. Why do we need a new description for SFP
> cages?
>=20
> Are we going to start converting schematics into DT representations,
> including any resistors and capacitors that may be present in the
> data path?

First of all, Happy New Year! :)

I also apologize for the SFP example provided earlier - it was vague, uncle=
ar,
and wasted your time. The purpose was not to redefine existing standards bu=
t to
demonstrate that even SFP might require separate consideration if we ever m=
ove
towards more detailed descriptions. My current focus, however, is on twisted
pair-based Ethernet**, and I=E2=80=99d like to discuss that further if you=
=E2=80=99re open to
it.

### Why Describe Pair Layouts?

While Ethernet ports often work seamlessly even with misaligned pair layouts
due to PHY auto-correction mechanisms like **MDI-X** or **CD pair swap
correction**, these misalignments can affect diagnostics. =20

If pairs are misaligned but still functional in automatic mode, the diagnos=
tic
interface may fail to provide meaningful or accurate data. For example: =20
- MDI/MDI-X Detection: Misaligned pairs can lead to unexpected results,
such as both sides reporting the same status when using a non-crossover cab=
le. =20
- Debugging Pair Issues: Without proper correction data in the DT, it
becomes challenging to identify and validate pair swaps (e.g., A<>B or C<>D)
during diagnostics. =20

Including pair layout information in the DT ensures that the diagnostic
interface can apply necessary corrections, making diagnostics usable.

### Why Address Polarity? =20

Polarity detection and correction are mandatory, and all modern PHYs handle=
 it
seamlessly. However, Open Alliance standards require polarity indication
and the ability for manual correction, particularly for automotive-grade
PHYs (e.g., 1000BaseT1, 100BaseT1). =20
(See: 6.4 Polarity Detection and Correction (POL))
https://opensig.org/wp-content/uploads/2024/01/Advanced_PHY_features_for_au=
tomotive_Ethernet_V1.0.pdf
(Example of non-automotive PHYs supporting polarity indication and disablin=
g of
auto correction)
https://ww1.microchip.com/downloads/en/DeviceDoc/VMDS-10242.pdf

When polarity within the pair becomes relevant for diagnostics, proper PCB
layout becomes crucial. It=E2=80=99s not uncommon for the PCB connection to=
 differ from
the expected polarity at the physical port. Including polarity details in t=
he
DT allows for better alignment between hardware and software diagnostics,
ensuring issues can be detected and corrected efficiently. =20

### Why Mention Shielding?

Shielding impacts EMI performance and compatibility, and knowing the shield=
ing
type (e.g., grounded, floating, capacitive) helps in: =20

- Cable Selection: Ensures compatibility between shielded/unshielded cables
  and port design. =20
- EMI Troubleshooting: Identifies issues in noisy environments or mismatched
  configurations. =20
- System Design: Prevents ground loops and ensures compliance with EMC
  standards. =20

Even though this information should ideally be part of the product
documentation, having it accessible through the interface makes
software-supported diagnostics much more convenient. For example, software
could guide users by stating:  "This controller has floating shielding. Ens=
ure
the cable is unshielded, or if shielded, it must be properly terminated at
least on one side." =20

### Why Mention Magnetics (Transformers)? =20

We have to deal with different types of connections: with or without magnet=
ics.
Magnetics themselves come in various types and can be classified by their
common-mode rejection elements, number of cores, and other
characteristics. =20

=46rom a software or user perspective, knowing the type and model of the
magnetics is useful for several reasons. For example: =20

- The transformer model do affect Time Domain Reflectometry offsets, someti=
mes
  resulting in discrepancies of several meters.
  (See: TDR Offset Calibration)
  https://www.analog.com/en/resources/app-notes/an-2553.html
  https://ww1.microchip.com/downloads/en/Appnotes/VPPD-01740.pdf

- Transformers influence insertion loss and exhibit varying noise
  characteristics, both of which impact the analog properties of signals. =
=20

- Some PHYs support tuning their analog characteristics (e.g., VoD swing,
  impedance matching) based on the attached magnetics. Advanced PHYs with s=
uch
  capabilities are often found in industrial-grade PHYs.
  (See: How to Tune DP83825 VoD Swing)
  https://www.ti.com/lit/an/snla266a/snla266a.pdf
 =20
Best regards, =20
Oleksij
--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

