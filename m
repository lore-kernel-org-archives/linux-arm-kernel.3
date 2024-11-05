Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782F5D3177B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w839YD3z1bir2jLhlM/mDsX9RjWUgyNjgUN2aaeUrCE=; b=yzJw/NuvLGhyXUT/OOHnH2w3Jw
	1t2+CE8YfMiD8xED312FW1jcHikFeKLLSsDP1mbnKWVtGXLdgyu204or+3nD1KoyiE5mppNckVMFp
	8bpt1QpBDCe8PWjyYNy2f1fFv2FBjQE+CUxNpoRAns4Kh101kwursvD9xbPY2VYfdzbxhki3Dsg4H
	/bGKCyCtti2NEhRAnx8TJ/6VRm3IufMF0GjZOdeu9rmS1aV3yBUlakATGQsEuXAORwqf9xJwWdSAJ
	iProWLnpDmGVdr4ExMGRB7ePXJJhhdBLmWWd6cdgP+ReEYDcE4PMJB+3fxxQI2O6RLbrc4MGE6yqM
	P498MEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nzk-00000000KRi-3fN7;
	Tue, 05 Nov 2024 18:09:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nx5-00000000K08-1bqa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:06:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E69925C48DB;
	Tue,  5 Nov 2024 18:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2976C4CECF;
	Tue,  5 Nov 2024 18:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730830010;
	bh=ocjrByOas5NhchIJiVvTx3nmU3SUFZrLi1qRmcnrqgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KH3nvH1wKtgOAdbmdI25MGBzoIlIZUU0DuJoNlsOeVJbdZaTVD/pW1K3FTVrB6Uf0
	 FQnD2oWWlqeGpexF2tlqglZqcOcH0PB7QFh43/YKzrV5jbzi3liphlOSt343dBgHcZ
	 Qw8qdPcknJdMN8rtEvlquuSLJnnf668tZfMgkK3MzlZvpByh+JmtXASIW6n3f08vmP
	 fEu1+Y7fgreG8qwTvA9Coor9F2HXC7Irq258xMtSZKtHqGoR4/9Pbj0pLKmbaehTHW
	 vG+rZB03i95oIS4gqIdT68miY3oA7HBvjIoyR3dIcH4CphIObSgiB/rg7QIBGh979K
	 JqofCVlclV1Dw==
Date: Tue, 5 Nov 2024 18:06:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 04/21] dt-bindings: gpu: img: Allow dma-coherent
Message-ID: <20241105-linseed-steadfast-98cd8abe898c@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-4-4ed30e865892@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jZZZ0TtrazABMAIy"
Content-Disposition: inline
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-4-4ed30e865892@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_100651_506551_7563B42F 
X-CRM114-Status: GOOD (  16.55  )
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


--jZZZ0TtrazABMAIy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 03:58:10PM +0000, Matt Coster wrote:
> This attribute will be required for the BXS-4-64 MC1 and will be enabled =
in
> the DTS for the TI k3-j721s2 in a subsequent patch; add it now so
> dtbs_check doesn't complain later.

Sounds like the property should be made required for that integration.

>=20
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 55f422be1bc5b7564e3e81f24c4b93857f3e12fe..8a1861ca960c48853b2ceef41=
4f588cc343b49b2 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -60,6 +60,8 @@ properties:
>            - const: a
>            - const: b
> =20
> +  dma-coherent: true
> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.47.0
>=20

--jZZZ0TtrazABMAIy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypetAAKCRB4tDGHoIJi
0kjsAQCsk2h19nWNOK2QLV16dXvVjJGuABtG2kMsJv5im2dsSgD/VsBRyWBSA9aK
3hEs1FqMGnHBcwnC2OCwsSUNxcO2hQI=
=QtP+
-----END PGP SIGNATURE-----

--jZZZ0TtrazABMAIy--

