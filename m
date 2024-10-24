Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD5ACE8E97
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjPuYP5VOBRoilZHn7YrB3mJmFs26bKSLRMyxCpWLoY=; b=OfjOxn3RwoenvAFmxJLKW94AqE
	wNdEG22/Ld3p+2kH0HqqhIIQyaYqsJKwvqB96VH8eXv37Dc4GvcQfeomVl0jMZDXMoE3Iy3sl/ftU
	4MjyxMd0Te8InI/1hb+y20pZ702Ja/jJEaQz6g0TgjY+Dp30r7Z0Iqntzdlv0Ki1gMRkvKS1oaOa/
	0qxthtxd4cPnjeM+lpUL9wNQVO/atLMtuOiNLggTce6xQkLv34mSeUn/SYBmSVbhUNQR/KwUFa4kk
	8PkDIM03jr0IaSAqBYiimIMf7/i5Pcaxinorc+XOQNvblJ4SH34iFvYY8IG7lLMJSmGwrwi3bLZHO
	wnIB0l2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41Hr-00000001DDE-36Ux;
	Thu, 24 Oct 2024 17:06:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41GJ-00000001D2W-2EEI;
	Thu, 24 Oct 2024 17:04:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1DCD2A455D3;
	Thu, 24 Oct 2024 17:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29819C4CEC7;
	Thu, 24 Oct 2024 17:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729789478;
	bh=ywLWv1DymM9Q8rNWDVKF/A2+zd9RhYsw+C3ioFEB2fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBaqX6iQKVO2I3p6DrGwLpuLJB3LSA0XH7X+UprC50IkkggRW+Y2RLdcIiDwDCh1X
	 k+uJyk8o/qqWWHi++gPxZfzbD15LyxpL7tsAN911NmSofjDWqtsMyWrv9j8+PQ/chd
	 KKLAcTKow+XkNETi9/tPj7EgkZb4/bv4CB27O4p8I8fTzDI6cgXZ9K8Uy1q3PbZJgY
	 NDAPrF/8A+KBJZchG6LgnkuCzfmc7S2vi96lqSFyQsbJKNlo6Orqoj44edCGXhcRbv
	 duePaGbfb7zsTbuX4hn7EHv1IC6gyoJce7RQg5U1tvB2KYrPrVUH2+ag7ZbxPjeP1M
	 FygRhSMkxMAiw==
Date: Thu, 24 Oct 2024 18:04:31 +0100
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
Message-ID: <20241024-wad-dusk-3d49f9ac4dff@spud>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <20241022-crisply-brute-45f98632ef78@spud>
 <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
 <20241023-paper-crease-befa8239f7f0@spud>
 <5cv7wcdddxa4ruggrk36cwaquo5srcrjqqwefqzcju2s3yhl73@ekpyw6zrpfug>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r+PW8kyxnTDRk3Vc"
Content-Disposition: inline
In-Reply-To: <5cv7wcdddxa4ruggrk36cwaquo5srcrjqqwefqzcju2s3yhl73@ekpyw6zrpfug>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_100439_721716_29CC6403 
X-CRM114-Status: GOOD (  27.35  )
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


--r+PW8kyxnTDRk3Vc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 06:38:29AM +0800, Inochi Amaoto wrote:
> On Wed, Oct 23, 2024 at 09:49:34PM +0100, Conor Dooley wrote:
> > On Wed, Oct 23, 2024 at 08:31:24AM +0800, Inochi Amaoto wrote:
> > > On Tue, Oct 22, 2024 at 06:28:06PM +0100, Conor Dooley wrote:
> > > > On Mon, Oct 21, 2024 at 06:36:15PM +0800, Inochi Amaoto wrote:
> > > > > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > > > > with some extra clock.
> > > > >=20
> > > > > Add necessary compatible string for this device.
> > > > >=20
> > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > ---
> > > > >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> > > > >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++=
++++++
> > > > >  2 files changed, 146 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,=
sg2044-dwmac.yaml
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yam=
l b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > index 3c4007cb65f8..69f6bb36970b 100644
> > > > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > @@ -99,6 +99,7 @@ properties:
> > > > >          - snps,dwmac-5.30a
> > > > >          - snps,dwxgmac
> > > > >          - snps,dwxgmac-2.10
> > > > > +        - sophgo,sg2044-dwmac
> > > > >          - starfive,jh7100-dwmac
> > > > >          - starfive,jh7110-dwmac
> > > > > =20
> > > > > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-=
dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..93c41550b0b6
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.y=
aml
> > > > > @@ -0,0 +1,145 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: StarFive JH7110 DWMAC glue layer
> > > > > +
> > > > > +maintainers:
> > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > +
> > > > > +select:
> > > > > +  properties:
> > > > > +    compatible:
> > > > > +      contains:
> > > > > +        enum:
> > > > > +          - sophgo,sg2044-dwmac
> > > > > +  required:
> > > > > +    - compatible
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - const: sophgo,sg2044-dwmac
> > > > > +      - const: snps,dwmac-5.30a
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    items:
> > > > > +      - description: GMAC main clock
> > > > > +      - description: PTP clock
> > > > > +      - description: TX clock
> > > > > +
> > > > > +  clock-names:
> > > > > +    items:
> > > > > +      - const: stmmaceth
> > > > > +      - const: ptp_ref
> > > > > +      - const: tx
> > > > > +
> > > > > +  sophgo,syscon:
> > > >=20
> > > > How many dwmac instances does the sg2044 have?
> > > >=20
> > >=20
> > > Only one, there is another 100G dwxgmac instance, but it does not
> > > use this syscon.
> >=20
> > That dwxgmac is a different device, with a different compatible etc?
>=20
> Yes, it needs a different compatiable, and maybe a new binding is needed
> since the 100G and 1G IP are different.

In that case, you don't /need/ a syscon property at all, much less one
with offsets. You can just look up the syscon by compatible and hard
code the offset in the driver.

--r+PW8kyxnTDRk3Vc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxp+HgAKCRB4tDGHoIJi
0mRYAQC5zNH78v/p+H9bscKX2XQ4j6+YJ0OaAX6+AvjpwXd/WAEAzV4GkyhyPnWN
1Bs5WxGAGbqBkGnxejt/DzUIguij7wc=
=/5rz
-----END PGP SIGNATURE-----

--r+PW8kyxnTDRk3Vc--

