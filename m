Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608FDD59F5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOUQWEJoedVOTgH1GIDnhrN4ovpVFuZOMuaLYrmTbZE=; b=2mokMLZfgOIwqObCPXA64IvemC
	CQKAjcK1Ppstluw6gn2+yc04ykPP0qSAGKjvUMcSIpwzHE1liXZ5IqUhjFXbf9EWkGp3FgY/6OP4N
	Gt+FE6qVHuoi1ZMIP9iEm7Pf+Ekvq1tXD64Q2/Cjoxy9ar+exYWqrZlRYp9b5ayPzow0o36FJ8YsN
	dEEAQmHOT02mLTa3PT0BRfP0EYv2xEd/3J53uvsd9uqVeI4ImcqsvGuVoZJlX6XVLwYt6EPwc/goK
	1rhXoSWOUJGpIWwPM33z0wF1qtwRU3j4LgPyDSMsaJG/BQp/JDGTc9e4UnGdxl3/zNoK8JKjeAPUZ
	/CJZFCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8knl-00000004LTd-3p5m;
	Wed, 06 Nov 2024 18:30:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8km2-00000004LEH-3z0F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:29:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E20DDA418B4;
	Wed,  6 Nov 2024 18:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31605C4CEC6;
	Wed,  6 Nov 2024 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730917737;
	bh=rnISvQGTFbwR9aak+S3ATcpy7QlMOi9c5mamzVrM4jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6AvlHU8Jr/uvOmEKqWezuwCz3WFyXNWnlCUFv5qC1UE6+mJ9eJG81Tom3ryiMhXa
	 PDP//ewUgQSg7cQem7x+DdjGyBBZgtmEh26ML74eL8F/hInN2PSdLVNYWTb1xXNNsR
	 FwKpwU/cSYcxiw90GVHn+sC658Eeie3iu4fdOhKjnHXrzjU8DLlUkJvh2/0A1LjiNR
	 HB5CqKsE8oxQuxnI4W8nnkXcjsjO/FS7AQaCAzGT4QBgiRFERaJsp0i85upjREt/Oh
	 frox1EK+O2AP8KnGqR7S2zSFNUARu2I98ILWugMqLb4pl4X0g1d0L4kxbTl76VClHm
	 gyN/GTXYbFiTQ==
Date: Wed, 6 Nov 2024 18:28:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 03/21] dt-bindings: gpu: img: Power domain details
Message-ID: <20241106-embassy-busload-2093b80d012a@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com>
 <20241105-disarm-baggie-e2563299a24f@spud>
 <20241105-endearing-huddling-30728a002321@spud>
 <ff4e96e4-ebc2-4c50-9715-82ba3d7b8612@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XVGm5v5rYcHdZP+b"
Content-Disposition: inline
In-Reply-To: <ff4e96e4-ebc2-4c50-9715-82ba3d7b8612@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_102859_144195_28DB0244 
X-CRM114-Status: GOOD (  27.25  )
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


--XVGm5v5rYcHdZP+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 10:18:01AM +0000, Matt Coster wrote:
> On 05/11/2024 18:13, Conor Dooley wrote:
> > On Tue, Nov 05, 2024 at 06:05:54PM +0000, Conor Dooley wrote:
> >> On Tue, Nov 05, 2024 at 03:58:09PM +0000, Matt Coster wrote:
> >>> The single existing GPU (AXE-1-16M) only requires a single power doma=
in.
> >>> Subsequent patches will add support for BXS-4-64 MC1, which has two p=
ower
> >>> domains. Add infrastructure now to allow for this.
> >>>
> >>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> >>> ---
> >>>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 29 ++++++++++++=
+++++++++-
> >>>  1 file changed, 28 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.=
yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >>> index 6924831d3e9dd9b2b052ca8f9d7228ff25526532..55f422be1bc5b7564e3e8=
1f24c4b93857f3e12fe 100644
> >>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >>> @@ -49,7 +49,16 @@ properties:
> >>>      maxItems: 1
> >>> =20
> >>>    power-domains:
> >>> -    maxItems: 1
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +
> >>> +  power-domain-names:
> >>> +    oneOf:
> >>> +      - items:
> >>> +          - const: a
> >>> +      - items:
> >>> +          - const: a
> >>> +          - const: b
> >=20
> > Additionally, a & b? Are those actually the names for the power domains?
>=20
> Sadly yes, Rogue has power domains that are literally just A, B, etc. I
> wouldn't believe me either; the attached image is taken directly from
> the documentation for BXS-4-64.

heh, nice... Also - if you have the oneOf stuff here for the same reason
as the locks, the same logic with min/maxItems applies here.

>=20
> >>> =20
> >>>  required:
> >>>    - compatible
> >>> @@ -57,10 +66,27 @@ required:
> >>>    - clocks
> >>>    - clock-names
> >>>    - interrupts
> >>> +  - power-domains
> >>> +  - power-domain-names
> >>
> >> A new required property is an ABI break. Please explain why this is
> >> acceptable in your commit message.
>=20
> Strictly it's only necessary for multi-domain GPUs, or perhaps in
> instances where the SoC power controller already enforces the
> dependencies between power domains. In reality, I think it was simply an
> oversight not to enfore this requirement in the first place. We have
> very, very few cores that require <2 power domains so names are always
> required if domains are enumerated in dt.
>=20
> Would you prefer we drop the requirement for "power-domains" and gate
> the requirement for "power-domain-names" behind >2 domains, or just
> explain the change properly and make the ABI break now while only one
> core is supported?

I dunno, depends really on whether or not it is possible to have power
domain "a" and domain "c" in a rogue gpu. If "a" and "b" is all it will
ever be, the order is fixed by the binding and you can do
genpd_dev_pm_attach_by_id() instead of genpd_dev_pm_attach_by_name().

--XVGm5v5rYcHdZP+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyu1YwAKCRB4tDGHoIJi
0rU1AP9SIaKB4ki5Bfa4HQ/kdGBer+AJ//0v2m1Gst9PRFBsbQEApyGAsUh+3/nX
giX0gYSSUx43R/EwLhcy4CoJrg7evQI=
=tGw0
-----END PGP SIGNATURE-----

--XVGm5v5rYcHdZP+b--

