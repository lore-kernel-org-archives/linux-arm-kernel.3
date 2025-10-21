Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D5CCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Kd3Nq8wViXqogpJd/h9pe+HGMJk5A8tTtsws1kndNI=; b=30gy+pOR1YgHlm2t7Gze7CU2Ft
	dJb+XwQ35D3CKbM25KJmzVA4oASssbmFueLkcO/DxDnKvLpWM3RLcYrblJtSFuqOnvNU1PJDr5cRT
	E3cfbpInqzUgdc848eKlTJnBKW4jpUcCD91ivy8hoGYp0iJ7zO0oWtw+Vb4nqPJULS3iod+ljX1zF
	XkfGL9F6cJpyK36CX+39XJmXCu8pNAewjfBJfBo20Y2SOgdifNQkhy//DOrUvjwb176scUMi4qhj3
	Dk2myRjfZkGEU//GJuNQUZHEdzjneClqQjoeSwEJ/GEl3LxA9v3GOBW6zxEMzT5HBUTTCJMSa1aJp
	DzJSfNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHwP-00000000T8c-07rZ;
	Tue, 21 Oct 2025 19:22:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHwN-00000000T8H-2Xho
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:22:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94F476213F;
	Tue, 21 Oct 2025 19:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A024C4CEF1;
	Tue, 21 Oct 2025 19:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761074558;
	bh=kLQuZ77APTbGac5pbyjhPnx3O7zXM+2TL9oYOXoVcaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XSF1yFGAgyigzdVw99xrgCcGbbjXdnIUa003MIJBj4ylEg24A+tkpzeCuVHFA5ycd
	 jxreQ/tWeCavNXjT6wJA8bz3HcUNfe1l818hKm9f9XONLVjlmHS6bCQgEaotYXBV7y
	 6YiCBNlzjrR5dHFsSg3tGUABit4yTxpqV/Ao1sgqy9zYa/S/sHgqS14FCKSwdnT0fX
	 CEfAZ5Mw5SLX+ZeXfsv9QJIgSZGL1uaTouGGRyAhwvxLSHrwvZqG6o8sGBYzwEoyr4
	 bLgz3UV6Ah4fimNpBa2Dgx3M/u0B4DJQExGeJj3p1f3ckDQ9Dx1CBSqn9UWjsBPJyK
	 h/kX0B+zBreSg==
Date: Tue, 21 Oct 2025 20:22:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	Mark Rutland <Mark.Rutland@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: Re: [PATCH v2 2/4] arm64/sysreg: Support feature-specific fields
 with 'Prefix' descriptor
Message-ID: <c835fd10-5590-42de-b968-4696917b41be@sirena.org.uk>
References: <20251009165427.437379-1-sascha.bischoff@arm.com>
 <20251009165427.437379-3-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3FiDR95fQGlL7dSr"
Content-Disposition: inline
In-Reply-To: <20251009165427.437379-3-sascha.bischoff@arm.com>
X-Cookie: Accordion, n.:
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


--3FiDR95fQGlL7dSr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 04:54:48PM +0000, Sascha Bischoff wrote:

> The Prefix descriptor can be used in the following way:
>=20
>         Sysreg  EXAMPLE 0    1    2    3    4
>         Prefix    FEAT_A
> 	Field   63:0    Foo
> 	EndPrefix
> 	Prefix    FEAT_B
> 	Field   63:1    Bar
>  	Res0    0
>         EndPrefix
>         Field   63:0    Baz
>         EndSysreg

This seems like a reasonable solution to the practical problem, and the
implementation seems OK:

Reviewed-by: Mark Brown <broonie@kernel.org>

I think trying to do too much more would open up far too many cans of
worms to be reasonable to block things on.

One nit:

>  # Parse a "<msb>[:<lsb>]" string into the global variables @msb and @lsb
> @@ -132,10 +149,7 @@ $1 =3D=3D "EndSysregFields" && block_current() =3D=
=3D "SysregFields" {
>  	if (next_bit >=3D 0)
>  		fatal("Unspecified bits in " reg)
> =20
> -	define(reg "_RES0", "(" res0 ")")
> -	define(reg "_RES1", "(" res1 ")")
> -	define(reg "_UNKN", "(" unkn ")")
> -	print ""
> +	define_resx_unkn(prefix, reg, res0, res1, unkn)

This refactoring into a function seems like it could usefully have been
a separate patch.

--3FiDR95fQGlL7dSr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj33XcACgkQJNaLcl1U
h9Cyhwf/YsjdawmSEFXnz/ThgkSJaPvHJwggse623h6Bi/49edb4f21ET1S3ThkF
bFxUYa0RApCMFMiYaLsHHihwrO5JoZRxXUyeqRezt9sGxk/RbO+ii/hOZp0OpZ1q
hgrM0srqSvxRqpXuDBWLS0tzGQaviyvWAIlN3xVQBwoNdQTVKYQSjtzyEFoC6pJp
LIZ5mCLSSQcE6+kgDFSMenCY4xp5eiVIo1FwftEm0RilTpCMvHrdBV02ncIqcwn2
Tb9iX7KoyX6Y/EUnqwHhdvhioeqwCk7YkQlzHC1ihPKntAVLutzjb6lCfSDTZa2J
odMHxKAzSvAvp4UTXOo98nuAKnlQDw==
=BAQL
-----END PGP SIGNATURE-----

--3FiDR95fQGlL7dSr--

