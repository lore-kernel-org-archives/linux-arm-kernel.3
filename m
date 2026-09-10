Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCCDC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsIKaXsbd3oQK51GUuuShGYl+ZCD6Zk6ICZGAE3/Axc=; b=bmbpDe23BnLRzgM2H0FgAIRX+s
	aqZsYbG7CBEoD5e7x6FrOwuCP8QvgNu6a2O+bCrxRy8OA+VFpVO5EIGCXo0Xxu1XYRA16zw417DFQ
	BXkBAa2F72JWM8WGXBRH6J0yO0+jIUsNDaslNlyv3YncHMHphQseLyDl+xgAw81+DtEpAuLmTJPeN
	PWBPg6/F/NYoZR9I/i806psv2jdtosvm6M6iWzawG4vxAKcz3K89C+th9hhwcV377u46qzpkshy8v
	c70KBhHO102OTWWTIxfVTpEh8Sl0lYosJb0VRBuj4zAoSC+6Dd0nmyPgx16I/0thdd8lc57RJCztg
	ZJKHJgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dMw-0000000EH1u-1PHO;
	Thu, 10 Sep 2026 11:55:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dMu-0000000EH1n-44Jj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:55:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20608600C8;
	Thu, 10 Sep 2026 11:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301CC1F000FF;
	Thu, 10 Sep 2026 11:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789041303;
	bh=DsIKaXsbd3oQK51GUuuShGYl+ZCD6Zk6ICZGAE3/Axc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h6eNZ+sXw4AWxpLP3I4e+pMa5MNo4FUv4VC0feJItgCsK126jpBMVC8weELoNkxTF
	 zQxWJHQzRu0pJwXOStLezi7jxyaWzHEQS/I1dPRQpClnXukfBc4Oc5sM06LYwZOE9o
	 CLLLwFY11oZY3ww6MdO6/P9nDC73ki677zjqW4upfgcAQ9WXkm765BVaborzOKLK3v
	 6/LsVfSoQ2aSa1dYT9B0fGXkBnf06J7900Rm9CCnOhFLhZhEAKDG1qNDmhtNcB8vui
	 YhW4K7YjtuUvT686IpXcuSFllFZRFDmhLiV4aDP7V/0xf+dW/Lhh0Y+N8NgLHDsT5g
	 mToSmHbES1Z+Q==
Date: Thu, 10 Sep 2026 12:54:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v1 2/3] arm64: sysreg: Add TCR_EL2 to sysreg
 infrastructure
Message-ID: <01b5d61c-6a73-44a8-9ce0-8d42c4c193c1@sirena.org.uk>
References: <20260909222015.3046432-1-weilin.chang@arm.com>
 <20260909222015.3046432-3-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wmlp6y25lOXpLuhH"
Content-Disposition: inline
In-Reply-To: <20260909222015.3046432-3-weilin.chang@arm.com>
X-Cookie: Gravity brings me down.
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


--Wmlp6y25lOXpLuhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2026 at 11:20:14PM +0100, Wei-Lin Chang wrote:

> Convert TCR_EL2 to the sysreg infrastructure with data extracted from
> Registers.json of the BSD licenced AARCHMRS
> (AARCHMRS_OPENSOURCE_A_profile_FAT-2026-06).

Checks out against DDI0601 2026-06.

> +Enum	13:12	SH0
> +	0b00	NONE
> +	0b10	OUTER
> +	0b11	INNER
> +EndEnum

Could do NS, OS, IS but that's bikeshedding.  Either way:

Reviewed-by: Mark Brown <broonie@kernel.org>

--Wmlp6y25lOXpLuhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqimpAACgkQJNaLcl1U
h9Bt2gf9FCYK8yras4jKlP43pB+Zz0Gc3a2rukrzjFvszpCCCjYRFWmOl2K20HE6
bRdz1EUVYc16pxo1iZVXDlXnnimRCV/Db0GD1K6N+cMOXhIQpYBp39MHN0adDoJM
rB132cjtaeO4sTWSI8819q6+salvcjSlXhvbl5/TNj0cY3DDfBwHhAOaSFAGYvLW
jSO4bT1Q1yGiczf2Vvt1Li1oPb/77YNDlqAS1ZIv0Tf/801d3NlpKcqUKap0Oe5g
pOiEyKo40Ccyn91u4tjL+oON95n2FE/E4eYMaVmbmEoJhwTyOs4kqV5tAh61Y5Z2
fYrVWaxzsMHx8NKfJIXyyF0koWk73g==
=iUKZ
-----END PGP SIGNATURE-----

--Wmlp6y25lOXpLuhH--

