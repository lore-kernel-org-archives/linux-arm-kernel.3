Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E09CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W58m5D1Qq04GgCBROcqOqYr4uS4iCeytTxLxmDkHG/g=; b=Wdr5JLoORVBdmcDFw97iJ1cnfj
	DqCRDJpDmRLIgpPfwgApipfNTdFBx8VzY3tWHWliTSyeoZrLVAn7uDCFUurqbieywTGGqACUhL2n2
	tpF/zRa6mI9syoXrzjYBQIWnG9XE4yPcyh8LorPuJrU6iQL6iVcShk6vEjzni35bKKQlud9HDaljY
	0OfmlyO9NunTzl58uFfJKwkgbzPggj3UKs7CVNxMRSaxv5thgcGtw06j1BNBf48d8MLgvMheweFf6
	3aO6Uu8tXdj+0cWjosbT2DANT9r/IK/sXjnl0Ful58owRo3WZlzXTjdGTVtc3XjSba/h5mY9VRGAe
	99Y+QDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKZm-00000009rEp-2edc;
	Thu, 01 Oct 2026 17:28:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKZf-00000009rDD-3f51
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:28:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E57E243DED;
	Thu,  1 Oct 2026 17:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E73A1F000FF;
	Thu,  1 Oct 2026 17:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790875682;
	bh=W58m5D1Qq04GgCBROcqOqYr4uS4iCeytTxLxmDkHG/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cAb0Gw1rbEm2vy6R+OXcDxHJqLX/4dmDQcOkQOkVwveQJWdcaZ0N+F15BE8YTm4YT
	 Glf9iGP+lxwwQvq2jxCl/Xx+TtkSIDjhxy3CWeps7DVPvQnVIkrw1dIX0PZp2jdx9g
	 RV4fjje8yt90XBnu1P22JXo9aeoHjNVm3vQEcRyCCrsqXztIEXx5icf/ale1T762W9
	 +xDyp/LZ8MZvXK4IxwhmPwNTpdX8IAeLDRAVm8OMhLHBV382GYG6E9I4QOx1gQPqMd
	 v/S3bGMoYpHgkjPJH6gb6IjI4bzYgbRaCjS1BqiwFat+FHnNVGtxua0wZzNV7WzK7M
	 R2RC6kyZdJcvg==
Date: Thu, 1 Oct 2026 18:27:56 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 14/15] tools: Synchronise the kernel esr.h
Message-ID: <680fe21e-beca-4056-84e3-f501fdfed902@sirena.org.uk>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-14-3556644cd927@kernel.org>
 <ar6NXWzQ1rMb1aId@gremlin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DprvDADVm2j3tP+g"
Content-Disposition: inline
In-Reply-To: <ar6NXWzQ1rMb1aId@gremlin>
X-Cookie: Do not stamp.
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


--DprvDADVm2j3tP+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 05:47:42PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 30, 2026 at 10:48:24PM +0100, Mark Brown wrote:
> > To pick up definitions for GCS.
> >
> > Reviewed-by: Leonardo Bras <leo.bras@arm.com>
> > Signed-off-by: Mark Brown <broonie@kernel.org>
>=20
> This seems to be out of date, with your series applied to next:

Yeah, though some of those are changes that are in -next only so
possibly slightly premature.  I'll resync with mainline, really this
shouldn't be a manual sync :/

--DprvDADVm2j3tP+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+mBsACgkQJNaLcl1U
h9AFugf+Psag1H7XxGuG3D4J0/kGv/EHHZDmwkNPNqHh4/wspf175JUlhs6i7NeS
Y38pNSWL3cKJn0FLw7hI+vi4i92gbgTQSVVa3kaJlydpTYpyotb22WgoU73NchNL
yTTVA7wbyAC1doxMCSTTuYweTipV+TMrZMlDJ+D7S+0vCYG23NrQgPo6rbB+LCDw
Fqq9aZEcGFOEDcIR+FNSw+jDD2lGg3xv+fngs/LBmUmIXPFA7wdZPXSyNie2S7QB
6eTPT6HOtTcY6lxfDAsuqvuW+f/O9v3pC5ITzRFuEqKEODOBbtBADTITjuF6osqd
pfVyCXWgX4SyvytiMyoI1EYtFdIT6w==
=lSPU
-----END PGP SIGNATURE-----

--DprvDADVm2j3tP+g--

