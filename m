Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B93BC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tePxgbUu8DYYRL1mHGa0nQWcmT0XGn3PbE8YrkUps7M=; b=rGAd8O3vHfdcyXtqMa3nne+Vcn
	kE6QXGtx+5Ag3/FvnL38WMSmHFVYzAJInItijZRwiH4U3rpleMyoX9HOlQ+SfddCM0jsRuJ4WL0/W
	4fTL9OiakvLKev0qOfKRmQaahOW+BVDi1Rd7u8rzouUVa5JsbBlS2rz8TUlNlkZfX9WO/fwQ2FG5T
	0FuS2DeYZXa+5MEr+jYH4xiZmz2AcOG7eXjQzf+OwAENGb7TZSLnQgPzyBeefJdrqg+e5wcSeSEqi
	jq9n0+VirbsAWzakDmblZ0qVIMILiLDW9N/9Xjh6N+IalQeYC4HbbyDarIKo6euemfCtxKOc1zpFU
	2VmypJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqIf-00000000lwv-2Lpi;
	Tue, 25 Aug 2026 12:30:45 +0000
Received: from mail-qk2-x07.google.com ([2607:f8b0:4864:34::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqIb-00000000lv0-2kMA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:30:44 +0000
Received: by mail-qk2-x07.google.com with SMTP id af79cd13be357-936b6f4b44dso121187585a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1787661040; x=1788265840; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tePxgbUu8DYYRL1mHGa0nQWcmT0XGn3PbE8YrkUps7M=;
        b=V6iabvjeK1x1h6KUUE0OEi0WYlyhNXleC7/CHuUZ41+CfDiAMZ3zkNfZJicr3ncME/
         nrGfCzbAUdGf4IonVVR+HrkA8sambTpeSufYvtH0vzM2NPWQItLIxkmzcZEl95ULUskU
         TzSIJF+U2ePhKEaFqa9fXA/syC9rm61heu0vsMXCyKcNx3PKL0ZF/Tyo/yF3yrFLRO5a
         qnUhGRRL1TtT38eibEVVNBkLcaTHsE+5szPEeDJ7XbKu6giXeRCjY9DIq0aOH1Szfobw
         5mo6iqzmQNYgNMv7jxpCLfwyzvEx/ul3wCuexIPZh69YHsEbUnkwHCkK2hFCMa0wzIEm
         mtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661040; x=1788265840;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tePxgbUu8DYYRL1mHGa0nQWcmT0XGn3PbE8YrkUps7M=;
        b=j7/Y3TlbupUpZU+luYgzrY8rDmgLNe5vl7shpNKODO0m0nPNPyZ7GPNwTteCbV3YCq
         yKkSBbz3qAeNEhJyTHrBg3moUldtK9/9k+k2pZ1QfaSymIS/tGxgZx8uJbHNWKVh81lp
         oQrt6tbPI7qXv4/eN8b41e1takzQZpTjHl+m4oyQHvwGLODYg24eGtuxRtJyHXS4Rrz2
         6WOeZiQwdMWVlWK2BqD0FWbsqXaDcb+WUv5TDLglWWfFdQHHxTIJlkssiB5/0mDBZxAT
         d3t1qD4roHKfMgrX5OctyJvf1oLL34A3a91mZ/WkRBNi9eSPTRSUyW2kvqW5mtTtkhha
         iRPg==
X-Forwarded-Encrypted: i=1; AHgh+RrkrJ5sAPmBtTnp+08/SHBBK6jslk2bbnJ4vWjZL1HTGDCXbtNrnvyqSC4S09Yxdt0pt90a9hO5i8D83nscN4D3@lists.infradead.org
X-Gm-Message-State: AFuF++lacZW9ksrvcnRsILjRFBDOD0Ik5ye6glfUKGql0c71Xg0rtEsx
	wyjl0eIlfUykfKvzRjuijUcIdGY5nQdhAzISF35p//6fF0Qz/wwL4oxypxbGNAUjOWQ=
X-Gm-Gg: AR+sD131YkIpKoR1Z0g0hkh+ZI6gybh7NeC3NXLhrpwUmfEk7QEPZoldjNwombNFwKd
	xntUWSwqRMZaGlvgcNgAB9R5uAmJBKzGFnW/ZtFVfh28hTOgIcspHlwxhlRASlRVcqXRDG8K9Hs
	Gz/v51FYjqGtb+m9K4lGGQ7BoQfPU5zrjEee+jJdvm+Sp/Xh4lIo9QKE8211Ke9t9MaidXbRmW5
	1bF/vN+08eVQg6s4HVX9Gyto1PYA/4XuMH7atQM/uDTs9nTQerU2NKf1RYtVYkb4LOrGw2e6GYy
	4lnoDG5bSG6CKPWXg/lhUv0t62bL8CU+0S2Ly0QnXMRiNiJU7Mr33/W8pImQkxsdnMADxkn4ve8
	9dmx5CL8JvXRbAgZd3cLmAV/wI6xoXlN6N4Ss3JILjkJSeNCtR+bvJqRnMepdMeagj8Ds0qASw6
	rgeK54FMh91r0EEI0C2pk5gp5MaX5EzMS6qZ+eTo6zsyQgR4ik5Md2OUCjvuwDYRvm
X-Received: by 2002:a05:622a:5815:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-52e2f1130f6mr73042651cf.25.1787661039558;
        Tue, 25 Aug 2026 05:30:39 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::5ac? ([2606:6d00:15:e221::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749abf1dfsm725543585a.5.2026.08.25.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:30:37 -0700 (PDT)
Message-ID: <2de2e03c7bed7e4ec292c2f83da5556c1b27b334.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Rockchip JPEG decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sascha Hauer <s.hauer@pengutronix.de>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 25 Aug 2026 08:30:34 -0400
In-Reply-To: <1048ee70-54b2-4e42-ab67-22384961f094@pengutronix.de>
References: <20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de>
	 <20260824-rockchip-jpegdec-v1-1-8011822bf500@pengutronix.de>
	 <d24d59bb-2330-41c9-a6cc-a4c7053f8526@kernel.org>
	 <1048ee70-54b2-4e42-ab67-22384961f094@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-pDFlBjF+U0XMJcHrbQOX"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_053041_966048_09C7A0E3 
X-CRM114-Status: GOOD (  40.04  )
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


--=-pDFlBjF+U0XMJcHrbQOX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 25 ao=C3=BBt 2026 =C3=A0 07:39 +0000, Sascha Hauer a =C3=A9crit=C2=
=A0:
> On 2026-08-25 09:21, Krzysztof Kozlowski wrote:
> > On 24/08/2026 09:01, Sascha Hauer wrote:
> > > Add a devicetree binding schema for the JPEG hardware decoder Rockchi=
p
> > > integrates into a number of its SoCs.  Documents the single register
> > > window (task registers plus the LLP link-table block at offset 0x300)=
,
> > > the decode interrupt, the aclk/hclk clocks, the AXI/AHB resets, the I=
OMMU
> > > and the power domain.
> > >=20
> > > The core is not tied to one SoC.  Downstream it is known as the VDPU7=
20
> > > and the same block sits on the RK3528, RK3562, RK356x, RK3576, RK3588=
 and
> > > RV1126B, with only the clocks, the resets and the power domain differ=
ing,
> > > none of which this schema constrains.  A compatible per SoC is all it
> > > takes to cover them; the RK3568 and the RK3588 are the two that have =
been
> > > tested and are enabled here.
> > >=20
> > > The resets and the power domain are required.  The block cannot be
> > > reached with its domain off, and the driver falls back to pulsing the
> > > reset lines when a frame times out and the in-block soft reset does n=
ot
> > > complete, which a node without them would leave with no way to recove=
r.
> > >=20
> > > The IOMMU stays optional.  The driver never refers to it, it is a pla=
tform
> > > integration detail, and rockchip-vpu.yaml does not require it for the
> > > other codec blocks on these SoCs either.
> > >=20
> > > Assisted-by: Claude:claude-opus-5
> > > ---
> > >  .../bindings/media/rockchip,jpeg-decoder.yaml      | 92 ++++++++++++=
++++++++++
> > >  MAINTAINERS                                        |  8 ++
> > >  2 files changed, 100 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/rockchip,jpeg-de=
coder.yaml b/Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.=
yaml
> > > new file mode 100644
> > > index 0000000000000..e20c1bf43ef3e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.y=
aml
> > > @@ -0,0 +1,92 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/rockchip,jpeg-decoder.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Rockchip JPEG Decoder
> > > +
> > > +maintainers:
> > > +  - Lucas Sinn <lucas.sinn@wolfvision.net>
> > > +  - Sascha Hauer <s.hauer@pengutronix.de>
> > > +
> > > +description:
> > > +  Rockchip's in-house JPEG/MJPEG hardware decoder, known downstream =
as the
> > > +  VDPU720.  The same core is integrated into a number of Rockchip So=
Cs, which
> > > +  differ only in the clocks, resets and power domain they are wired =
to.  A
> > > +  dedicated Link List Processor (LLP) register block, located at off=
set 0x300
> > > +  within the same register window, allows the hardware to decode a c=
hain of
> > > +  frames autonomously ("link mode").
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - rockchip,rk3568-jpegd
> > > +      - rockchip,rk3588-jpegd
> >=20
> > How this can be v1 if you send VPU720 for rk3588 already?
> >=20
> > https://lore.kernel.org/all/20260819-rk3588-jpegdec-v1-4-33d74cdf369c@p=
engutronix.de/
>=20
> The above has the JPEG decoder driver integrated into the hantro driver
> which turned out to be the wrong abstraction, so I had to split this
> series up into two, one for the Hantro fixes and one for the now
> standalone JPEG decoder driver which is this series. I decided to start
> freshly for both series instead of treating one as continuation of the
> other.

I'd like to recommend doing the opposite next time. Create a separate serie=
s for
the fixes, and place your fresh bindings, driver and updated DTS in a v2.

The reason is that you are sending 1 series to 3 maintainers, and we all ha=
ve to
keep a different patchwork up-to-date, having v2 makes it clear as we can s=
ee
from the changelog what happened and why it got rewritten.

Nicolas

>=20
> >=20
> > Were there more versions?
>=20
> No.
>=20
> Sascha
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=-pDFlBjF+U0XMJcHrbQOX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCao2K6gAKCRDZQZRRKWBy
9AepAP9LKy3L2SDezcHWRKeGBxhM7jMPnAdAPPhP2UALllz2iwD9H7t7vcPXscK+
c8c3Swnx7HKx4J+UNpsV0i3RGR3GZgw=
=pluw
-----END PGP SIGNATURE-----

--=-pDFlBjF+U0XMJcHrbQOX--

