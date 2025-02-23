Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176F7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSiLDaWP9B5Sb14CsStBZenwHQk4lwRuXBYXlR20pcs=; b=3k81G6rAZ8+IOgLgEtrftPyvYp
	IBlH+19nOmywrelxrNOncOl7bxlx2XGCL7fyjqpXvR9+PTVeZbEEi1JiaykkKzLgI9VQZ4kQQygyf
	qABqqXcMzSNQOgKQms+VN6KHG/5ge7w776noywu3ZQa9DlhGZm7el+TA2OdnG1vsqrS7nKioiyDeS
	TXr/2PVGjjMysLWi7l/1tyW94jRfLrh4syL47Z7qgaNkCGxrZPwkA5+eUf53uTJyt/p1d6DcnT9w9
	lnJdLKij5js9N+27eq4GvWoiMOrwTnOU3VxPRt5Y2XKR7VV3jtKdm27B3SHuXivE2fMNSacSUmkF7
	ndcaACtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmCED-0000000BDpf-1h1d;
	Sun, 23 Feb 2025 13:41:05 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmCCk-0000000BDeb-0YEF;
	Sun, 23 Feb 2025 13:39:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E841161144;
	Sun, 23 Feb 2025 13:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847C3C4CEDD;
	Sun, 23 Feb 2025 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740317970;
	bh=VYHAAbUCUiGYFAjtyjDhjex55dizi9CWqp4qfEujigE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEmd8SjXchvYTXVG5atKw3xbjW2JO9AMH5ttIiw9mLwE6biRdEUFCrohtDDXFK9Vx
	 ds4iJbPcOuDT+4z0DP4fZHkZOpXQYLavo5thpJ2/BOpXfkHOScg0R4YAXuKszdvh8R
	 TAduUGcDDNMtHzy4ZOTYSU3YFuB25on7Ho9rUXGiiHYVmvILEkmL7QGVBU2SS8Bte+
	 Ah8UFr4MrzET2ns/pTHERSxJ7sQha7I1cSu6IBAbnT2sSND86o18wSUypcIcV6p+a9
	 k8H17kVJtKplzHYusTyMDcZ7p9gVq4QN+sJRaXdaJRd92LDokt92gIU9NuNDQaVqDY
	 OmibVSyXn+bbQ==
Date: Sun, 23 Feb 2025 14:39:28 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add
 mediatek,pbus-csr phandle array property
Message-ID: <Z7slEJgCQMqp_I6p@lore-desk>
References: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
 <20250222-en7581-pcie-pbus-csr-v3-1-e0cca1f4d394@kernel.org>
 <20250223-hulking-goldfish-of-symmetry-cbfed4@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LboHElsNia9vOOZK"
Content-Disposition: inline
In-Reply-To: <20250223-hulking-goldfish-of-symmetry-cbfed4@krzk-bin>
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


--LboHElsNia9vOOZK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, Feb 22, 2025 at 11:43:44AM +0100, Lorenzo Bianconi wrote:
> > Introduce the mediatek,pbus-csr property for the pbus-csr syscon node
> > available on EN7581 SoC. The airoha pbus-csr block provides a configura=
tion
> > interface for the PBUS controller used to detect if a given address is
> > accessible on PCIe controller.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml     | 17 +++++++++=
++++++++
> >  1 file changed, 17 insertions(+)
> >=20
>=20
> You got review tag, so if you decided to skip it, this should be
> mentioned why.
>=20
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Since I modified the patch with respect to the previous version, I was thin=
king
you want to review it again before applying the Reviewed-by tag. Added it n=
ow.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof
>=20

--LboHElsNia9vOOZK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ7slEAAKCRA6cBh0uS2t
rPy9AQCgBZ/Fs6+vlGg02YKCLsxEfSZgokp+F0deZxshMw9y8AEAwEhLv/Dps1LX
LD5v1+vVobF58lYLVJoLkG/UfUOe7QA=
=W+YN
-----END PGP SIGNATURE-----

--LboHElsNia9vOOZK--

