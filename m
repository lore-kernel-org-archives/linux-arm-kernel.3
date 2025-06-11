Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C64CC71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0nCjZrrmOIdzEI3W2H6cAFIv9YH1hiXrokv4lZSkFg=; b=pK4YiORHYZxvvb8rJEZ8Z3VAtp
	NDS5Ngwyf3EzuOoPbDdyzpSEzNdlExaMCgRMHk0BXv1or7pOcN1qkrQH68wuIg+DaDWSf5Z9l2oqa
	V9/i5nwHpt/WgilJg/d2wM1OhSinWAVFU/C0Zcx45aWcQ3Rrq3Ifsb86P6V6uH2W93bE61tkjHWO8
	rhWoEecEx/83EN1fcA1+f26EHduioBf2Ney2l6i5rWTIJEG1zya5y9iYq+LLG0GmgQJfgdJkzWJXR
	GO7wuVnK8bbQoPs1sEjB9pMyS7TFGY87zC5wzmodHlkqXTAc7bMiKfHNN6ZPDFcYMK1OiKALofLNW
	R6zm7y2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNkf-0000000ASte-14sG;
	Wed, 11 Jun 2025 15:52:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKfx-00000009qyV-05qF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7468361F1D;
	Wed, 11 Jun 2025 12:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3386CC4CEF0;
	Wed, 11 Jun 2025 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749645328;
	bh=t0nCjZrrmOIdzEI3W2H6cAFIv9YH1hiXrokv4lZSkFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GN/pw1HNIuoVI5ORPatzV4jaFbkWGGwDHxVVvyN6astR7cmEP37fBsX2qbxc2kJB/
	 Bc5a9xPX9r/VjFjUZsLw1sf/vK3aHtLbF9OdopsUq/0MxrPqroS6+A3NUUI48x/6sH
	 bbUS0gCNmvteUpBaErX0xTI9UCZh4qSMPLjSnZRgThFF759DzsFQiLeR5vFyA+0cYQ
	 Eo05IMSIyr4A7VhXCxWvczpk1fYUovMY7dRc5eSGYgkoZZCzmIeBxsYZMKJtz1ik4q
	 DiFe+g5JzTs4f8KJzksceou0TSlizhRuXOwz//CwYQSHtugzgeMBWh/8IdzYeGMVUU
	 4Z6L96rUltdJA==
Date: Wed, 11 Jun 2025 13:35:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeo Reum Yun <YeoReum.Yun@arm.com>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>,
	"pcc@google.com" <pcc@google.com>,
	"will@kernel.org" <will@kernel.org>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Yury Khrustalev <Yury.Khrustalev@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"frederic@kernel.org" <frederic@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"surenb@google.com" <surenb@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v6 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Message-ID: <a11fc436-9952-4391-a3ec-ad359fabe8bc@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-3-yeoreum.yun@arm.com>
 <c0b4dc8a-b37c-4e8e-be2e-bc8906615702@sirena.org.uk>
 <GV1PR08MB105213A44E40741700202F7CFFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wke583eSUDniqYV3"
Content-Disposition: inline
In-Reply-To: <GV1PR08MB105213A44E40741700202F7CFFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
X-Cookie: No skis take rocks like rental skis!
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


--Wke583eSUDniqYV3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 12:19:57PM +0000, Yeo Reum Yun wrote:
> Hi Mark,
>=20
> > > +HWCAP3_MTE_FAR
> >
> > > +=A0=A0=A0 Functionality implied by ID_AA64PFR2_EL1.MTEFAR =3D=3D 0b0=
001.
> > > +Applications should interpret the values of these bits based on
> > > +the support for the 'mte_far' hwcap. If the support is not present,
> > > +the values of these bits should be considered as undefined otherwise=
 valid.
> >
> > The constant is HWCAP3_MTE_FAR and the cpuinfo is mtefar:
> >
> > +=A0=A0=A0=A0 [KERNEL_HWCAP_MTE_FAR]=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "mt=
efar",
> >
> > The reference to the hwcap should probably be one of these, I'd go for
> > HWCAP3_MTE_FAR since it says hwcap.

> Just for confirmation. so change to "mtefar" -> "mte_far"
> Am I missing?

I'd write it as HWCAP3_MTE_FAR since that's the thing you're
referencing.

--Wke583eSUDniqYV3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJeAkACgkQJNaLcl1U
h9Asggf9G74jgYIOfkHDfNK3jrKW+VMhCh5Ay4gcXOgt1/02Gus2G7gi7djklPJW
0F6eQXMc+QSYnd1re4GTHY8qHhrxlWxH2ezn43kW429LRMgzRtcOFxL4q/hz5kPN
KzygsgukAC/KgcU1BBGn4LwB3XDlW3df+Njo6fPA5c40yRANLAvU2khOiDYCeo5g
+lRzUfUWn6q4quqdd1S/sworrxM7Wx2tqNvdF+Ut5cbTpK37eBG3vVSRxFVlQ9nw
OYsLRMQCndarDD0iNne+XYOFAeSZGaNwUnG+I0i5PIFo0xirpVa8znXXaOK03c3d
uy+kBE31nWlQ3aUpCtwDAtwzkkNw9w==
=72/w
-----END PGP SIGNATURE-----

--Wke583eSUDniqYV3--

