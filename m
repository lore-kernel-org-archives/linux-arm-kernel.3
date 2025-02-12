Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34736C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPPGAafinSZNRKnDUDj9vQmOe7TF7b6+a4emffRKAYM=; b=eBe70JHDS8KoLa3C+s+zDGAqUs
	VwGzURuFx1tAPRYpXCJWnbJyWwCtFN4uqy8HOBuOcPxco4PGs+EcFyVJbAdY6n7Az0QXeH+iWBATC
	ybrf8s05MZDsWTSP96F0gtPL8GMd2pGloYM/OvCyZXg7qfIiDEe6ar+YAnUxUny+oih0ki45+2krU
	B95pYeTHGPl/NYAGPl1v1r0ZoxgTZSb8YOenauBFBiKcroMoNLPLIPqWm3MOp/3jlAxcD1qL3Z0r7
	OByv49FHxVlerEjYjbr5dzfeE/1boUvoBSMWspp/I0oIgRV/8bupADfMZ/qqD5ReCxuwX40hC9+X0
	UghGf5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiCli-00000007UJl-05PF;
	Wed, 12 Feb 2025 13:27:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiCkH-00000007U7c-2Mj6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 13:25:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56D1AA4013E;
	Wed, 12 Feb 2025 13:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E593C4CEDF;
	Wed, 12 Feb 2025 13:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739366740;
	bh=nPPGAafinSZNRKnDUDj9vQmOe7TF7b6+a4emffRKAYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAhG2LpDlvBgBq8FmGcFS6/4G9DTomVsJJBibWXyppxSQFKFNRnucrbef58FNnZNA
	 s4to0gnLvkK7YbMCfJfA2l6RtV1rs2uopS3B8LYOLGfbgP6spH75+z8YWn0UvKBI/k
	 2QpZcCzI64HaRF60cbMgQbktSb6ASPgq9UTHXrd9pEg3xtVk/9D5ruZ715CuBDG2Uo
	 CvPPE19SwxFIJ8WAMLcQo+IKWIhnqHtKY8GVfoapFP5oI3/1rKZDLoSWT4quxTOurA
	 9T98uazXT7lkTdEfeSiNMSpB0GHG26pBTyi1eNomcBD9pTmU6Hjntkd52nuRVGeXFH
	 LJbf+0XrEYUjA==
Date: Wed, 12 Feb 2025 13:25:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: imx-card: Add playback_only or capture_only
 support
Message-ID: <3883923c-f2b5-4b0e-b9ec-e9094849fb2b@sirena.org.uk>
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
 <20250211035737.3886974-3-shengjiu.wang@nxp.com>
 <Z6tuFp9nZFMJMgDa@lizhi-Precision-Tower-5810>
 <CAA+D8AMyXVdAWOTGHtrOyXjSLiMioAhZ1awepX3nproom87azQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eR5N2MBL3FgF7WFw"
Content-Disposition: inline
In-Reply-To: <CAA+D8AMyXVdAWOTGHtrOyXjSLiMioAhZ1awepX3nproom87azQ@mail.gmail.com>
X-Cookie: Reality does not exist -- yet.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_052541_664992_BA6D4CEF 
X-CRM114-Status: GOOD (  14.13  )
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


--eR5N2MBL3FgF7WFw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 11:48:43AM +0800, Shengjiu Wang wrote:
> On Tue, Feb 11, 2025 at 11:34=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrot=
e:
> > On Tue, Feb 11, 2025 at 11:57:37AM +0800, Shengjiu Wang wrote:

> > > With the DPCM case, the backend only support capture or
> > > playback, then the linked frontend can only support
> > > capture or playback, but frontend can't automatically
> > > enable only capture or playback, it needs the input
> > > from dt-binding.

> > wrap at 75 chars

> On my side, there are in 75 chars...

It's wrapped as above in the copy I got FWIW.

--eR5N2MBL3FgF7WFw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmesoUwACgkQJNaLcl1U
h9BCCwf/cUpzpsoM/MopBAnPQFijzei9fc7PPZKC/ddtC1NxAx1aXwrBNA7dyqNr
pIBX9Y8UaFzGZJx2HjxALElsYzRsvtc5nVOPoOboK/omzc5Ck3spzg/XIlRDDksO
kX6s5nDUqPGDqhEq7Rjcp1hmTK5h0SV1PlNmzuMHJHrULtG0ukp1I281ASSu5Two
dR0+y+0fdGHQspRQb1wKN07V+NVeLnDotZyVmVpVVTyeu+rbWt5K4jU2f0H17t/r
5pyU4R/MLgfX1+TUHnsFLGDxcxj+vQFZtSoJoLD9+wL+KDavhDWuFq9T2ivJ9c5c
apBK+i9RTJbJeidG8sQtRp3nR0RE6A==
=Hkwf
-----END PGP SIGNATURE-----

--eR5N2MBL3FgF7WFw--

