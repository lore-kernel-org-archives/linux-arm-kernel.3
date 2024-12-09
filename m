Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5BFE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vksvUByCwEXIhDlzgAmyb4aBjr3hSBbXTum0gcldopE=; b=E5fkQKzJTYbVAPGJx8TSVkr3Hk
	iF3zC5R5azKh+nwvomiorch2iiKvOY2dLAuTjzTJGbLNWa6At5XsPXzRFY5UxdfaCTyCf5mOU04dU
	wclG/tjkbUIHVooz/UPOPXqGH6bN8IRAhrFaQTpGCzZkkMuSBbU+k/VBSIvAG9JuPLWlRLfNbr+iD
	8Hi2xrruQU/bkLHtuNplEIY58+uh8sHNYN1fdQYi60Hqiuo0TApjHJS/F1V16oa5EQc0wlTQ6y0b1
	q2j52FQJmsmSQ+SN7AnNXRzsPSiBWYveJ24UdAcLcdxW8WqCCiRngRDZOaNkrxPEg4io1Y/SE5Wu3
	/CggKSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfLi-00000008KLL-1oNe;
	Mon, 09 Dec 2024 15:07:02 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfKe-00000008K7c-20rO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 15:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733756756; x=1765292756;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=vksvUByCwEXIhDlzgAmyb4aBjr3hSBbXTum0gcldopE=;
  b=YQTvtSW3zoWMr7kWa+Nj3SbHDQ+BLtPjCvvH+c0RRqfh7aWokqW1TpKy
   YspcIqA6rBtjEeXeywzaERgBOMwgHJbxN4p0LgzHFitYK0f9/Abp4+R0B
   cu/iTW0jCHsYAofyvCSP8BPCK2y1O7oBEDd3qJwJexPsxKd6qUYmxNIiR
   fxHOc8gQrXBGv+aSKyqGj9yRvShrwZl3cBN8/lWmjEmjQ5espiX9/ix57
   AkShtyMLMpl34YcLZjqFjB7oQ6aV/C3mbRCoRcvILL81Bwjs/0juX5ljX
   WCHR16iKYLKC3ot7esyVlmJCSBQOXiJ8wxJFv/JVP+7OX+FDV7vfPEmpM
   w==;
X-CSE-ConnectionGUID: poYgBc8HRRGLk7FRHWt4dw==
X-CSE-MsgGUID: J2pcjPvrRn+RzsTK4ZAeuw==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40490430"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 16:05:54 +0100
X-CheckPoint: {67570752-B-1B231F50-D910A4E3}
X-MAIL-CPID: 975DDE29B4A2D72A1889DEB0E7CA7530_5
X-Control-Analysis: str=0001.0A682F19.67570752.0082,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13AA0165653;
	Mon,  9 Dec 2024 16:05:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733756749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vksvUByCwEXIhDlzgAmyb4aBjr3hSBbXTum0gcldopE=;
	b=YiZMU+M2nnsaXHE2rANfrtKVcBhPqrpr0DG3Rno+5Vm0NEuDPNMUEMPXgQD/XP5fWG436O
	MAN/yy3RkHSS8oQGZ9I1CYF9YNLut5rct3shpwTxz6UsIHMHgFBjnxTLXTlwSCmBlDGH0T
	QtzQIn/z5fhGBs0HhVYsKrcjsU5mNGjxoPkqtzlrGFGo1RD9RJwJ4pLsSt/jlRto/5BJIj
	y1UQjQKhA2vq9mYA/a6a2JVNO8mefvSjTfEYSwlMc2WdhsQpPrU8fddjQ7fho4Ecfa/Z+/
	1hN6ENO+l+preBwwshGaJHyVFRGX5Bgn6/3VXfucEfJJTpsZQYJIunXRj22C0A==
Message-ID: <e16076d16349e929af82fa987a658bff1d9804c4.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and
 MBa62xx carrier board Device Trees
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Felipe Balbi <balbi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, Hari
 Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Date: Mon, 09 Dec 2024 16:05:46 +0100
In-Reply-To: <d25b1447-c28b-4998-b238-92672434dc28@lunn.ch>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
	 <95ff66ca2c89f69d893c2ce9eed9a0c677633c7b.1733737487.git.matthias.schiffer@ew.tq-group.com>
	 <a9c5cfda-e3e3-436a-8d05-b2f096157cfe@lunn.ch>
	 <c902a56cf34838f60cee67624bb923e91d74e9e0.camel@ew.tq-group.com>
	 <d25b1447-c28b-4998-b238-92672434dc28@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_070557_015133_BF59EAC3 
X-CRM114-Status: GOOD (  32.17  )
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

On Mon, 2024-12-09 at 15:42 +0100, Andrew Lunn wrote:
>=20
> On Mon, Dec 09, 2024 at 02:55:31PM +0100, Matthias Schiffer wrote:
> > On Mon, 2024-12-09 at 14:24 +0100, Andrew Lunn wrote:
> > >=20
> > > > +&cpsw_port1 {
> > > > +	phy-mode =3D "rgmii-rxid";
> > > > +	phy-handle =3D <&cpsw3g_phy0>;
> > > > +};
> > > > +
> > > > +&cpsw_port2 {
> > > > +	phy-mode =3D "rgmii-rxid";
> > > > +	phy-handle =3D <&cpsw3g_phy3>;
> > > > +};
> > >=20
> > > rgmii-rxid is very odd.
> > >=20
> > > > +
> > > > +&cpsw3g_mdio {
> > > > +	status =3D "okay";
> > > > +	pinctrl-names =3D "default";
> > > > +	pinctrl-0 =3D <&main_mdio1_pins>;
> > > > +
> > > > +	cpsw3g_phy0: ethernet-phy@0 {
> > > > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > > > +		reg =3D <0x0>;
> > > > +		reset-gpios =3D <&main_gpio1 11 GPIO_ACTIVE_LOW>;
> > > > +		reset-assert-us =3D <1000>;
> > > > +		reset-deassert-us =3D <1000>;
> > > > +		ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_NS>;
> > >=20
> > > I guess this is the explanation.
> > >=20
> > > What happens when you use rgmii-id, and don't have this delay here?
> > > That would be normal.
> > >=20
> > > 	Andrew
> >=20
> >=20
> > This is normal for AM62-based boards, see the DTSI of the TI reference
> > starterkit for example:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi#n451
> >=20
> > With rgmii-id, both ti,rx-internal-delay and ti,tx-internal-delay shoul=
d be set.
> > As ti,*-internal-delay sets the delay on the PHY side, phy-mode "rgmii"=
 is the
> > one that would not use either:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/net/ti,dp83867.yaml#n78
> >=20
> > At the end of the day, does it really matter as long as MAC and PHY agr=
ee on the
> > used mode? We copied this part of the hardware design from the TI refer=
ence
> > board, and did our hardware qualification with these settings, so I thi=
nk it
> > makes sense to use the same phy-mode configuration.
>=20
> What i try to achieve is every board uses the same configuration. The
> PHY adds the delays, not the MAC. There are a few exceptions, because
> a few cheap PHYs don't support delays, and so the MAC needs to add
> them. But in general, any board i review, i always ask that the PHY
> does the delay.
>=20
> Also, don't put too much value in vendor code. Vendors don't care
> about Linux has a whole, being uniform across all systems. Many
> vendors do the minimum to get their stuff working, sometimes Monkeys
> typing Shakespeare, and not a lot more.
>=20
> I also find a lot of developers don't really understand what phy-mode
> and PHY_INTERFACE_MODE_RGMII_* actually mean. phy-mode =3D 'rgmii' means
> the board has extra long clock lines, so the MAC/PHY does not need to
> add delays. rgmii-rxid means the board has an extra long rx clock
> line, but a normal length tx clock line. Now, i doubt your board is
> actually like this?

Not our board, but the AM62 SoC. From the datasheet:

"TXC is delayed internally before being driven to the RGMII[x]_TXC pin. Thi=
s
internal delay is always enabled." So enabling the TX delay on the PHY side
would result in a double delay.

>=20
> You want to correctly describe your hardware in DT, which i guess is
> "rgmii-id". That means something, either the MAC or the PHY needs to
> add delays. PHY_INTERFACE_MODE_RGMII_* is what is passed to the
> PHY. To get it to add the 2ns delays, you pass
> PHY_INTERFACE_MODE_RGMII_ID, and you should not need any additional
> properties in DT, it should default to 2ns. If you need to tune the
> delay, 2ns does not work, but you actually need 1.8ns etc, then you
> can add additional parameters. But given you have
> DP83867_RGMIIDCTL_2_00_NS, i doubt you need this.

No such defaults exist in the DP83867 driver. If any rgmii-*id mode is used=
, the
corresponding delays *must* be specified in the DTB:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/net/phy/dp83867.c#n532

Best regards,
Matthias


--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

