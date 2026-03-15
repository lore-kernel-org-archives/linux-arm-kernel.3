Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E5AD58B1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 12:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcNiCXdahw2lDOrlZ/PueFKA9InZdoOODvsiWRSNkN8=; b=3NnaX67CouPlvR4xJLUym56y5L
	mxoYQyDL1bWxQV7eoqmSxCx0zfv2cabFqesuQhgoxJuG5LbJq2SfY6FhOmWZcQ2tvMWPirgQ8Toe6
	Lrh3FyN2TRtGBHmixysHad7ucDKxlkjuVPZ7brmwp8/Csb6SD1Dwp8p1e8YC1eBGQBykMLkNF4j5K
	hC3IhLXykPuCW6+hNydNEFJBRE7Y06HmDeBWZ8C/4JebpA66OLVqFNGQmVSyI1NY1Ic5KyDjV7F3t
	OtpxJFs2w/snx8nOy7FnJgERY5/Oz42j1KA0GUPIab2/znEe2Dh4dd7oSy+oP0VeXsyDwPt4PDibg
	24oYBWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1kIA-00000002abl-2YCM;
	Sun, 15 Mar 2026 12:09:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1kI8-00000002aba-2TJe;
	Sun, 15 Mar 2026 12:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91A7E60008;
	Sun, 15 Mar 2026 12:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9889FC4CEF7;
	Sun, 15 Mar 2026 12:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773576595;
	bh=kMnAv0hAsF+sY5CDNuXvfwH6pllo4bNiD0Kc14LYaCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOx05BHE5rGVd6UwfAxoIT56Wx2mQiXYYuUur3NsKrWrsfwysMjgePuFS5UCuRttH
	 sbAzoAEcF53qI4zVspG5Pbyj/7+Bi7VulyEHWpbx/obtiX7aeGCUTdnGqX8yA86bx9
	 Jr2tZAYE/bWHDL5V0/Y6scryKvcIdsU5hGYcqNPIyGZ25DV3aCRS8LbBgfj8uYWEmK
	 2XxAHjduh/LBwtm64VGBqbgkCLKGCYjG6RQOOcUtCHpBYEIG8/FjfWFpyehiUqnAau
	 hV84NBSR+V2yVGIS7Gta5FArDmSZ0Oa4lE0n1LIwA7K952bnLQeURKdhKyYdVBYPjw
	 mQP4NxBJdpQbw==
Date: Sun, 15 Mar 2026 12:09:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260315-geologist-fringe-c6b8c653a653@spud>
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
 <20250430-rk3588-vicap-v1-2-b3bddf749914@collabora.com>
 <20260313-quickly-imperial-47638c9f0d4f@spud>
 <20260313-coyness-jab-ff0c85654555@spud>
 <e064b4f2-a138-4ea9-aee4-93ac8af38f64@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nSCb7cCQ1MbL+UzG"
Content-Disposition: inline
In-Reply-To: <e064b4f2-a138-4ea9-aee4-93ac8af38f64@collabora.com>
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


--nSCb7cCQ1MbL+UzG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 09:00:37PM +0100, Michael Riesch wrote:
> Hi Conor,
>=20
> On 3/13/26 17:57, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 04:56:29PM +0000, Conor Dooley wrote:
> >> On Fri, Mar 13, 2026 at 04:20:44PM +0100, Michael Riesch via B4 Relay =
wrote:
> >>> From: Michael Riesch <michael.riesch@collabora.com>
> >>>
> >>> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit.
> >>>
> >>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >>> ---
> >>>  .../bindings/media/rockchip,rk3588-vicap.yaml      | 256 +++++++++++=
++++++++++
> >>>  MAINTAINERS                                        |   1 +
> >>>  2 files changed, 257 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3588-=
vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.=
yaml
> >>> new file mode 100644
> >>> index 000000000000..7fd4214921cb
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.y=
aml
> >>> @@ -0,0 +1,256 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/rockchip,rk3588-vicap.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Rockchip RK3588 Video Capture (VICAP)
> >>> +
> >>> +maintainers:
> >>> +  - Michael Riesch <michael.riesch@collabora.com>
> >>> +
> >>> +description:
> >>> +  The Rockchip RK3588 Video Capture (VICAP) block features a digital=
 video
> >>> +  port (DVP, a parallel video interface) and six MIPI CSI-2 ports. I=
t receives
> >>> +  the data from camera sensors, video decoders, or other companion I=
Cs and
> >>> +  transfers it into system main memory by AXI bus and/or passes it t=
o the image
> >>> +  signal processing (ISP) blocks.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - rockchip,rk3588-vicap
> >>
> >> Curious why this cannot share a binding with the existing 3568-vicap.
> >> Looks pretty similar binding wise at least.
> >> If it's an entirely different architecture or whatever, please mention
> >> that in your commit message.
> >=20
> > Looking further, it's using the same driver too...
>=20
> It's not an entirely different architecture (indeed it uses the same
> driver). There are some differences to the RK3568 and the PX30 (which
> uses its own binding as well BTW): apart from different resets and
> clocks that's mostly the notion of the connections to the ISP. But to be
> fair, as it turns out this boils down to two additional ports.
> Other recent SoCs (e.g., RK3576 or RK3562) will be a good match for the
> RK3588 binding, but then again exactly resets, clocks and ports may vary
> in that variants as well.
>=20
> Personally I find this variant-specific DT binding magic hard to read,
> and thus I went for a separate binding. That said, please let me know
> what your preference is and I'll arrange it that way. Not a hill I'd
> want to die on.


If all it really comes down to is the ports, I'd rather you added these
devices to one file, rather than having one for every related SoC.
The "magic" shouldn't be that bad if it is just ports, just some sort of
thing like

if:
  compatible:
    contains:
      const: foo
then:
  properties:
    port@5: false


--nSCb7cCQ1MbL+UzG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabahjQAKCRB4tDGHoIJi
0qShAQDtAk9uQ4qLF9H8qeCQKTdrdrxdrMgULNS8CATV2vUmcwD/eTsvwJk18F9d
dxxcNA+q2mvbNpttew+v9JzatA0jvQM=
=hCaH
-----END PGP SIGNATURE-----

--nSCb7cCQ1MbL+UzG--

