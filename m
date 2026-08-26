Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99A6C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zvkuLBS5kN0dE2ru9sc83bhYR6xAZIN/lkuUx7s1rk=; b=sL2qX8SD7pKFOVD1v0LoqvCCcd
	FptlaHnnwJkNzugI6YIjrLc/NBNNRNEH+unfZ/bzM2dQ9KFuhjy3zCaHR/cMWclRZXffvB++cUJLj
	KjgIkW3Ze0nNM+AbLQaRPpVmhfS0t28VKmlbX5yAP+7Txoj1yPUfzq+oAGXhZuC+t1nOAyfrOmReC
	/gUaIX1Kc6OyAeT3slI6g9CwDEZ6yQG6agHt0k5eH55EYvPKPJ5j9dm7qsvrhepYvC+kIMlMESr1A
	u+BJQq927rVGrYCr8CsSC2fa/W7H+MBMZ+jqw7/WDFHazlJB9WuPkGa4NOv4dtWSZ1FuJ8m3I3Tb9
	99bGJLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzG0k-00000002hYl-283V;
	Wed, 26 Aug 2026 15:57:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzG0j-00000002hYf-02pL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 15:57:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 770AC418E1;
	Wed, 26 Aug 2026 15:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F901F000E9;
	Wed, 26 Aug 2026 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787759876;
	bh=+zvkuLBS5kN0dE2ru9sc83bhYR6xAZIN/lkuUx7s1rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hn4sEiodCLZJ6ZQ4HtQf22da+N6rNnUyB+5+xzJU+csx7ycH8p6d9BiHjOMdi/CdO
	 aX7WNzaI1zz9FRJSowxDpeEzuc+WdOHT/cuQuUduOYShwxYhmJGVioiegtF15vm3QH
	 FTJzdpNtNdIXUm2DjbYbVCHdtcupa+o7RwF6uhaWN1idh91718mQL+NFj4D4zEJc5W
	 1/ZrzZXFPuuHA+px+Hp8WOHMNeFC9nA1xir8YHWrGr9tBXvDG1uN40pau7foz6sukk
	 enGhajoAXdqyZyKY/skV6wGSw3WBuI4Bf+LRCClf635JvWc9Rs91no5hrEUkgcriAK
	 2gpvrHcSNl2ag==
Date: Wed, 26 Aug 2026 16:57:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Larisa Grigore <larisa.grigore@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>, clizzi@redhat.com,
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 06/10] dt-bindings: ufs: Add compatibles for S32N79 Host
 Controller platform driver
Message-ID: <20260826-surely-sandal-64ca2d2c4481@spud>
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
 <20260826134048.854748-7-larisa.grigore@oss.nxp.com>
 <ao75lU2zYDeOZi2f@SMW015318>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5vEWqBk1JjVncxTQ"
Content-Disposition: inline
In-Reply-To: <ao75lU2zYDeOZi2f@SMW015318>
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

--5vEWqBk1JjVncxTQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 09:35:01AM -0500, Frank Li wrote:
> On Wed, Aug 26, 2026 at 03:40:44PM +0200, Larisa Grigore wrote:
> > [You don't often get email from larisa.grigore@oss.nxp.com. Learn why t=
his is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Document the device tree binding for the NXP S32N79 DWC-based UFS host
> > controller which is compliant with JESD-223D "Universal Flash Storage H=
ost
> > Controller Interface" v3.0.
> >
> > The controller requires access to the SCM register block and the core
> > clock rate when M-PHY initialization is performed. Add the optional
> > nxp,mphy-boot-mode property to select the M-PHY firmware execution
> > environment.
> > Currently, the M-PHY firmware can only run from ROM. If the property is
> > omitted, M-PHY initialization is assumed to be handled externally.
> >
> > Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> > ---
> >  .../bindings/ufs/nxp,s32n7-ufshc.yaml         | 99 +++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/ufs/nxp,s32n7-ufs=
hc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/ufs/nxp,s32n7-ufshc.yaml=
 b/Documentation/devicetree/bindings/ufs/nxp,s32n7-ufshc.yaml
> > new file mode 100644
> > index 000000000000..d9d5669be313
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ufs/nxp,s32n7-ufshc.yaml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/ufs/nxp,s32n7-ufshc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32N79 Universal Flash Storage (UFS) Controller
> > +
> > +maintainers:
> > +  - Larisa Grigore <larisa.grigore@oss.nxp.com>
> > +
> > +# Select only our matches, not all jedec,ufs
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: nxp,s32n79-ufshc
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: nxp,s32n79-ufshc
> > +      - const: jedec,ufs-3.0
>=20
> Any place actually use this fallback?

I don't think that this exists anywhere already:
https://lore.kernel.org/all/?q=3D%22jedec%2Cufs-3.0%22
$ git checkout korg-next/master=20
Previous HEAD position was 2697ef8943c9 Add linux-next specific files for 2=
0260813
HEAD is now at f82a5da2f049 Add linux-next specific files for 20260826
$ rg jedec,ufs-3.0
$=20

So not entirely sure what the point of this actually is, if the driver
doesn't use the fallback.

pw-bot: changes-requested

Thanks,
Conor.

--5vEWqBk1JjVncxTQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao8M+QAKCRB4tDGHoIJi
0g41AQCGpkSGcoAvf+CzvNuvNHv3yKhESnto+t6iakbMYinbeQD+KGZ2lO97yx4I
pYak7Fs9jzkDftZfbefu6CGhyBZr/AM=
=7Ege
-----END PGP SIGNATURE-----

--5vEWqBk1JjVncxTQ--

