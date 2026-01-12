Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47748CF45C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 18:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erthKSZ6iPdBhOLwPxkw7BloMWfY5AM7ogPjXWO1YdI=; b=cMfLu86CboQZPkE3jqw5uqUUrC
	4f8C9oe/V/6HDU2Mqqi98z7A7hvfBQImlzGGTnEtZHCt7ckP6x3bdL+55V4/KHrrssMEjkSOIiifG
	lDWGw4IJ1vB8MVwuklc1RWziI5NW/bzhwTdt7CUIB2XJFswcgkNtc86lRS6cQfCvETumctajwr/py
	2uqjY+Cw440NMmSm/GqJ6upbZP7CftqtxWcflP+lLWDKqH5fWD+sCos6mu0ZVgZ+ZCkhY1QljF8x3
	FHN+rfhmYuIxkazsV+LNui6ETui2rsYySCFoShwjCADCNH0a+jckfDflKSoKPIUX/AwQAzADj7d9r
	puIVXr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMJU-00000005uSP-37ht;
	Mon, 12 Jan 2026 18:06:48 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMJS-00000005uS2-2dOU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 18:06:47 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7c6cc44ff62so5375296a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 10:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768241205; x=1768846005; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=erthKSZ6iPdBhOLwPxkw7BloMWfY5AM7ogPjXWO1YdI=;
        b=R3aqB/GNREgx6I423OsPAOjhHMM7uECB1SjIcyRAxOW6GXk9JlM2thDF3JF09lzDzu
         N/HqKfAYY3XaMsce6a5xFKij/skHiJnEfbFI/Ik9q6NAPGfXx5sQmBqawWma/a1zafZB
         L/tfE8Mc9nqbpmmDMADxEydPNTAitoZ8957VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768241205; x=1768846005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erthKSZ6iPdBhOLwPxkw7BloMWfY5AM7ogPjXWO1YdI=;
        b=RUfOC45WwyHDe1U5+O1z8ISh5A7bSXR7vnqI4jQutfy6LyHzPV/JLJu+hd8V4fASV3
         eALvFs7GAeK+r82bkU8Uiy7gRLotuE79twI1OgrVM+Vixf4igO584wH2pxozJRsjf1bF
         fIgJVuwOa+Lv/dGP+oXMjpPU+RZITXTciKo8q3DZ9QGcpZpTQswM9WfHxoyZQjbJEyA8
         Mb0wU4ELemVm7aswzZn10LQwidgBtkCJIdNcJqjg5O4DZa5XzDua9z1ZS7D6XypJmV/m
         4Rm9pIQefrxp90GvYwntDbqg5tf16uupy2FfkqmzidyQAXBTwzCqnpkXf5Yfn5r6Oa1k
         WRBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl5D/CRn8U0oF9EgS0BChH6pkbRI6m+nnkNvF5PufiMJGTBqgLHGLfbrA9gSjyhlnNwBlCYmFjh1OLMFw5L0l8@lists.infradead.org
X-Gm-Message-State: AOJu0YyTwsNloZsGUBmPxbfcc6sAw+lozzCGW8XDwpGn6mYYM8CXg4q+
	Z2d3ZwzbqQRCO6GCq6MuJoz6ofV5vXvqcXdyUpIT78MIPfNy1htTLMy0A/YKTnjb5qE=
X-Gm-Gg: AY/fxX41dIQrg5ntlqgufqF/K3ve4SUZaEDKD1ePqbWQxfT9Vwjg7pmMLj2g5tSFEAe
	cN+JE//Yj8IG4yQfgFsPowWkDkMx79U0xgHwvwLmj/GoJqPb8b+05KVB6fuIDO3bD2YFeyrZY5V
	w4ZFRJOqC/dXj9okQod1Lb25Dv842m4vU/OVuUcEe+X1q2lReCmgT2kMZs+8WLcFpD6VpkKOcE4
	kfb8LsLvqmmp73h3ybQd9/wRSz5qzIylzx8Q50tlL+WIx3gKMSP19ZwjvIHkYs4gJjxgtUDzj9k
	7IBn6ASTa5E3zuAFU5oDX1iSQdpUrchTtcW4hHUknFHYXze8H0S3JoPO6S9MEpioikaJo8yy1Co
	2C8j8elx58kp0wQIQzXKik/Xx7+c8MVCGpVR3xaolL+KpK6jLA4MJILPc5c96GqkVKvhX1Aa3mk
	+ozGKCY4JSUZWgmeeVJWKDXhUxs0WagcE3CPkDmq5xvl00R2kRI51r6Dh3707qeqebshldnz6WW
	nIF2ZQlmrsueyNBJSimr256JJz1FkyjnJvh9Qw=
X-Google-Smtp-Source: AGHT+IHMKosHECSc4+Zx0/DZ1EmDSc9S9i8aKwxXsTmq2VUbIcLRUggYDk1hwyiYs1cRyUGa2EZ6Vg==
X-Received: by 2002:a05:6820:2d48:b0:65e:da9a:976f with SMTP id 006d021491bc7-65f54ed7966mr5646365eaf.11.1768241200388;
        Mon, 12 Jan 2026 10:06:40 -0800 (PST)
Received: from bill-the-cat (fixed-189-203-103-235.totalplay.net. [189.203.103.235])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f48bec1c4sm7346752eaf.8.2026.01.12.10.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:06:39 -0800 (PST)
Date: Mon, 12 Jan 2026 12:06:37 -0600
From: Tom Rini <trini@konsulko.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, u-boot@lists.denx.de,
	nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH] arm64: dts: ti: k3-*: Replace rgmii-rxid with rgmii-id
 for CPSW ports
Message-ID: <20260112180637.GR3416603@bill-the-cat>
References: <20251025073802.1790437-1-s-vadapalli@ti.com>
 <20260112074948.GA101138@francesco-nb>
 <20260112075636.GA105765@francesco-nb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l3dCGue1f5wWDFkV"
Content-Disposition: inline
In-Reply-To: <20260112075636.GA105765@francesco-nb>
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_100646_679144_4E2841D8 
X-CRM114-Status: GOOD (  25.82  )
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


--l3dCGue1f5wWDFkV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 08:56:36AM +0100, Francesco Dolcini wrote:
> On Mon, Jan 12, 2026 at 08:49:56AM +0100, Francesco Dolcini wrote:
> > +Tom +U-Boot ML
> >=20
> > Hello Siddharth,
> >=20
> > On Sat, Oct 25, 2025 at 01:07:59PM +0530, Siddharth Vadapalli wrote:
> > > The MAC Ports across all of the CPSW instances (CPSW2G, CPSW3G, CPSW5=
G and
> > > CPSW9G) present in various K3 SoCs only support the 'RGMII-ID' mode. =
This
> > > correction has been implemented/enforced by the updates to:
> > > a) Device-Tree binding for CPSW [0]
> > > b) Driver for CPSW [1]
> > > c) Driver for CPSW MAC Port's GMII [2]
> > >=20
> > > To complete the transition from 'RGMII-RXID' to 'RGMII-ID', update the
> > > 'phy-mode' property for all CPSW ports by replacing 'rgmii-rxid' with
> > > 'rgmii-id'.
> > >=20
> > > [0]: commit 9b357ea52523 ("dt-bindings: net: ti: k3-am654-cpsw-nuss: =
update phy-mode in example")
> > > [1]: commit ca13b249f291 ("net: ethernet: ti: am65-cpsw: fixup PHY mo=
de for fixed RGMII TX delay")
> > > [2]: commit a22d3b0d49d4 ("phy: ti: gmii-sel: Always write the RGMII =
ID setting")
> >=20
> > What about U-Boot?
> > I just noticed this in today U-Boot master:
> >=20
> >   RGMII mode without internal TX delay unsupported; please fix your Dev=
ice Tree
> >=20
> > and I think this is coming from the DTS update from Linux to U-Boot.
> >=20
> > Can you look into that?
>=20
> Ok, I think that the issue is that the U-Boot code was updated
> correctly, but now we need the v6.19 DT in U-Boot, and as of now we have
> 6.18 DT.
>=20
> Tom: are you planning to sync the U-Boot DT to Linux v6.19 before the next
> U-Boot release?

Once it's out, yes. But, uh, this tells me some TI folks forgot to
backport all of the dts changes too then as we shouldn't have broken
platforms in-tree like this.

--=20
Tom

--l3dCGue1f5wWDFkV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaWU4KQAKCRAr4qD1Cr/k
Cvk3AQDuM/GRmnrbkiiukhCxNdwOxiZCH8uDyIsMLBzAm2bFqwD+NlctSgODsb0C
erEXYpRFivilIFIFxVhDG7lW0OOJSAE=
=p3wn
-----END PGP SIGNATURE-----

--l3dCGue1f5wWDFkV--

