Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309CBD277C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 23:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ip/UXe10fc+MS3MGXE6yum5B4wQ9BUfHd/7YhJmX2/s=; b=3STiT6M+g1VIdCDCYbgwTCpicm
	Zx8+l3h4cyUq3Ue/D4LzI3e3BtlOXTiQGrLSGa7OnHWIwCRNV9LUc4MfI73lQ08MiK5WMROmWMhvw
	NaNPFUsysgqOg7Ejxt/S50U+7vQo2wA5UFv66I7MGKpDypoqJt/zJMgES9r5vjyGXunqrOJGFlURw
	BX7X+8Om0Z1iZrJnfSQKSsvBS2mmPraywuad8bhjO78aNfg5QIl1kYdRh9S9GyPhJSwxWI+SURxdc
	3Tnnv2/j2wA9r5mxlzK1jIAyGcvGL8dEdZgW9CrxsFDekmMtLzNuErCNPwLiB7iUlpJgYJS1g3gqt
	CtwAN9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veLyk-000000036mb-12I7;
	Fri, 09 Jan 2026 23:33:14 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veLyi-000000036mD-0B6Y;
	Fri, 09 Jan 2026 23:33:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768001586; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UuqtoimCKycqATVCmYvA5wN2QVJTbdNvuYcJvHuiqPTpBBn3T4FFDF+/TuiZTzPaimIMaY1PHqsLEB70MqeJsjfxHEmZO6dbHWQwwKbQCSqtvRd3775dflGyBw8jk3wmOrMitDx6ynKk2RNkmN3nYAJ5LJoaetkLOBLEd4nxIPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768001586; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ip/UXe10fc+MS3MGXE6yum5B4wQ9BUfHd/7YhJmX2/s=; 
	b=IQVJQpkJsMiLgzuPJFpH2RHpcGJqMzF8QiAXJmxnEpgXiz9yz/MXzlu9Oe9D7DRW7eMBSvtHht/s8KffmU76uYG04h18Tg5BBo8szNK2IHuItc+5QbfT0YtcNwFmUk7vtCwZVZmMiZEfr/UeZkwBo5AKPAFRhc5MZ0ELSr9FGN8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768001585;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=ip/UXe10fc+MS3MGXE6yum5B4wQ9BUfHd/7YhJmX2/s=;
	b=WVGAiXVQxUCcN0mn/14w7IS0TAhfjKnpPJY1wrkGmNeE/Wc84HrT5NESYjVmQbqn
	BSNbUgN5ZY8Dl+8rOXZCUst+fKf2tIu4U/7DqV2chNkJtrayPHhcynfSkW50Xwe/O0y
	jeP7msVlUwQl6lwYJn/vXRaJZiBTR3Syaxs3FcLA=
Received: by mx.zohomail.com with SMTPS id 1768001584458598.651984333586;
	Fri, 9 Jan 2026 15:33:04 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 7502B180632; Sat, 10 Jan 2026 00:32:59 +0100 (CET)
Date: Sat, 10 Jan 2026 00:32:59 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	FUKAUMI Naoki <naoki@radxa.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix
 USB host phy-supply on Rock 5b-5bp-5t SbC
Message-ID: <aWGLE-zcPUvQj3Q0@venus>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
 <20260103083232.9510-3-linux.amoon@gmail.com>
 <aVkfNBUDUumzV0-X@venus>
 <CANAwSgTmAbswY6scsxj40B7Y6QbnkqWPuCqyevRjdtHNemq0aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ji2p36iqphckh5dg"
Content-Disposition: inline
In-Reply-To: <CANAwSgTmAbswY6scsxj40B7Y6QbnkqWPuCqyevRjdtHNemq0aQ@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/267.941.65
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_153312_135542_1654CBC6 
X-CRM114-Status: GOOD (  19.86  )
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


--ji2p36iqphckh5dg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 2/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix
 USB host phy-supply on Rock 5b-5bp-5t SbC
MIME-Version: 1.0

Hi,

On Thu, Jan 08, 2026 at 12:25:12PM +0530, Anand Moon wrote:
> Thanks for your review comments.
> On Sat, 3 Jan 2026 at 19:35, Sebastian Reichel wrote:
> > On Sat, Jan 03, 2026 at 02:01:18PM +0530, Anand Moon wrote:
> > > The USB host USB2 and USB3 on the Rock 5B, 5BP, and 5T is powered by the
> > > USB_HOST_PWREN_H gpio pin which is used to enable vcc5v0_host host
> > > regulator which ensures proper power sequencing and management for onboard
> > > Double-USB-HOST.
> > >
> > > Update the u2phy2_host node to reference the correct phy-supply.
> > >
> > > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> >
> > u2phy2_host is connected to an onboard USB hub chip, which is
> > powered by &vcc5v0_sys as the comment says.
> >
> > You can see this on page 9 of the v1.45 ROCK 5B schematics (page
> > name USB2HUB). The usb hub chip uses VCC5V0_SYS + VCC_3V3_S0 and is
> > connected to USB20_HOST0_DP, USB20_HOST0_DM. The related USB
> > controller for that in the upstream DT is &usb_host0_ehci, which
> > in turn is using &u2phy2_host. Thus at least for the ROCK 5B the
> > existing DT is correct. Properly describing the downstream port
> > VBUS regulator would require something like the following series:
> >
> > https://lore.kernel.org/all/20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de/
> >
> Actually, the Radxa Rock 5 B doesn't have an onboard USB hub chip.

Seriously? I provided the exact page for the hub chip in the
schematics and it's easily visisble in lsusb too.

I don't want to waste my time and expect a certain level of quality
and this is certainly way below it...

-- Sebastian

--ji2p36iqphckh5dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlhkCcACgkQ2O7X88g7
+prHvA/+M7sp9VJH7UdtTiVJGGZ9l3hhpP5O7HgHICqTrIgVNtvjPmkc57SavFen
l9ivYV9dv0MwfPe5/nUhiAOeQAXcCTdzHWXSeu8GbSCahVG7OMkmKCLkXmaWXXMJ
BUpPSZJpshXjjb5ETgq/tOLb68UBwJNrqYf8uf5xHvjJNUqI4EVwViRcYKboB8V+
tgoeX+7QO5YD3BcrVA42PQ7lc2gAgPNcP4+aBYvZKxq/n+WDLKlqbPkv2rPGr5TQ
oQB9p6roVUCoVWZa0mC/qv72C4S0m8Q14GGK0rIePuZk4vVaoI/d3P8nsJWKWqiL
NMp3acca67TnSea2BBPb6cUJsod+IvPRqFhey2LXPQWFuYESAWlDBIvWeDgyQ9JY
jHXmPAuj6L2lxcJ/NdnRZzpMKWL1G30+Y4XmMG/9Xooey8IM1ev0DAWx+DNfBh/M
zbAjVeyEGeOhOUC4oLXujgYaUDgtaSZIZwU/ycaH6iQ+QBbozjZT/DNoxPHsIgLA
W49ARX9JRaKhGf9+fwlgbDWyZrtgTMBKirSGRG3SkVk+z2zPTpmp1jXnqTLQ5+62
gZTYos9FOMtJDMmTuZ9ZiUU55b0x8S7zSl9TZX+wSkr/bq4inQt19uD/RwgCRdoB
uKk4Wd0dcwFXgNnuzC3NmYXpFLFXBkYx8ROPVUstgM6SZk2e+g0=
=iHOy
-----END PGP SIGNATURE-----

--ji2p36iqphckh5dg--

