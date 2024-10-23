Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C0DCFA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btY+eeS2/XeB3r233ksAsdoz3RSaOoRAm8kJIxVf17I=; b=DwmMVwjN1HdivMPZl6F7SiAi4R
	vkpLIuWIJK1vzcIZ88Yw/8SIysxFQoxeHYirKPp4nHkMf7/DLrXh6ZT0JsCYC3EC8wxrFwpidse86
	qKUHYBxKeBscuv/2yE1P0q+n8MvWbpoJ4zui3GUqcqr4xSFh9m84H9DlFog0WDPvKL6MpBj1dmfOh
	J1yWl+GgulkOZFg6p9LrirPbPUC8eioyoeeYRfL07C/09eWkcYNI9Zbk/BKFO3r3AthWfsB7kKLlU
	fwGLJxc/IhtyipgJqXP5xWPmihMwDebZ2EA5nj4rXMj+lZqN4zfSnWfOkGJrDozmM+naAdJUY2+ch
	j2wclXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iL3-0000000FtdY-2TSN;
	Wed, 23 Oct 2024 20:52:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iIZ-0000000FtGx-0xJ3;
	Wed, 23 Oct 2024 20:49:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8C795C5E31;
	Wed, 23 Oct 2024 20:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612EEC4CEC6;
	Wed, 23 Oct 2024 20:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729716581;
	bh=D6rOAupw7nWaOfhbwJhOxY7u+4yNaJ1nMm3CkyxSZ4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbsmEFuBcYBJxfd9aKYJEJhvm5sOCBpuq3Gkw8XBVAgaBVAtodo4MzzFydgz9lmre
	 lYFf+4Bc3gblOkDrHaTeXYplOKsx+ARhDq7I84evZ9AqNJW6sdl8mkvHTdvLRiNWq7
	 HIxQV0FTIhIlXU1I0UWU0dYoCb4/La4ArGqqwj83V1yPu64TjVihcSJtg+Lv4hnx7j
	 nsU4mql2Gn/IGBFQELdRYpyG77D96qEA7RspsiJJx3jVWn3y5NFarKPXPlN+Fhh4du
	 ljtB6NwbDGGW5+zuy3s8XNOWGeFaUUoztmYHWjCyMnJg20bW3Ehuw32LgawaSV0yAA
	 ne0ctkmBg3+FQ==
Date: Wed, 23 Oct 2024 21:49:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Message-ID: <20241023-paper-crease-befa8239f7f0@spud>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <20241022-crisply-brute-45f98632ef78@spud>
 <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HZ3OWjJABGOCrTlm"
Content-Disposition: inline
In-Reply-To: <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_134943_506535_7FB32017 
X-CRM114-Status: GOOD (  22.62  )
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


--HZ3OWjJABGOCrTlm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 08:31:24AM +0800, Inochi Amaoto wrote:
> On Tue, Oct 22, 2024 at 06:28:06PM +0100, Conor Dooley wrote:
> > On Mon, Oct 21, 2024 at 06:36:15PM +0800, Inochi Amaoto wrote:
> > > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > > with some extra clock.
> > >=20
> > > Add necessary compatible string for this device.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> > >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++=
++
> > >  2 files changed, 146 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg20=
44-dwmac.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/=
Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > index 3c4007cb65f8..69f6bb36970b 100644
> > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > @@ -99,6 +99,7 @@ properties:
> > >          - snps,dwmac-5.30a
> > >          - snps,dwxgmac
> > >          - snps,dwxgmac-2.10
> > > +        - sophgo,sg2044-dwmac
> > >          - starfive,jh7100-dwmac
> > >          - starfive,jh7110-dwmac
> > > =20
> > > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwma=
c.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > new file mode 100644
> > > index 000000000000..93c41550b0b6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > @@ -0,0 +1,145 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: StarFive JH7110 DWMAC glue layer
> > > +
> > > +maintainers:
> > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > +
> > > +select:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        enum:
> > > +          - sophgo,sg2044-dwmac
> > > +  required:
> > > +    - compatible
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: sophgo,sg2044-dwmac
> > > +      - const: snps,dwmac-5.30a
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: GMAC main clock
> > > +      - description: PTP clock
> > > +      - description: TX clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: stmmaceth
> > > +      - const: ptp_ref
> > > +      - const: tx
> > > +
> > > +  sophgo,syscon:
> >=20
> > How many dwmac instances does the sg2044 have?
> >=20
>=20
> Only one, there is another 100G dwxgmac instance, but it does not
> use this syscon.

That dwxgmac is a different device, with a different compatible etc?

--HZ3OWjJABGOCrTlm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxlhXgAKCRB4tDGHoIJi
0pO0AQD5Swmhv1mfvz5DiD/5f5DGV3m+rvoUAhPp697EkSD9KgD/fnWAmf29z3yR
O/N/hNkW71ULWbchz7jsFDwGdd6q4Ao=
=k7np
-----END PGP SIGNATURE-----

--HZ3OWjJABGOCrTlm--

