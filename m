Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AC2C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5cMUJGHBZZmsAYQ6USpqxzXHzi+ihgdIcDyT1zg37s=; b=Evh1zOzI7TWTamsDZOGY+1ibfz
	t17KkkkLuApILYGz0aL2NUkuUuhmm6U++U+/0anPEqwCsQLni6a1w+ckMkyyiL0Ofn55eIpdHL2fL
	FLGwsofdM2wYPI8aJyOYKpi1+Kjadvyf3LRn80Hlx38TogRzCrKaPIdPzwY4aAD5h6s0c32aDmdcL
	YGcQReJ/hCv3/7nnItHNyE+FOQfOq+SdoCP4e2MLAo4vEHhyMhAdrb/pjCpZk9DZDsQaqCNkT64nC
	ux2Vfz1oCeJkTAmNbtmtMN2PSG/WFogahSU+YjLt6EoFD633sInoEuBFAgtBvsHHpqWsMsfmMMyF4
	w35xkSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0079-00000006FHj-3Bjq;
	Fri, 28 Aug 2026 17:11:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0078-00000006FHS-3d9D;
	Fri, 28 Aug 2026 17:11:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C1F740BDF;
	Fri, 28 Aug 2026 17:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0FC1F000E9;
	Fri, 28 Aug 2026 17:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787937098;
	bh=+5cMUJGHBZZmsAYQ6USpqxzXHzi+ihgdIcDyT1zg37s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CPw7xnPiXa/4e2xFtG3sMy612KK0MBc2+Q4wKts7jq+cIBnTq8nNw6Auolim0jKi8
	 DJw5LzayG4RhUJO9rvla4DuTJRPxgp+IRUKGriIgHDaE2AF9BoiS4fkz++DJrY0PfF
	 WgchVx7syIK+HUMujeMEe4ZvFBgqP6tH4YSa1t96jsnm8Vd7/2gKWufci5a9NPG+q0
	 IbOJlkeM17jgDR7SGMaocUqeoKjG3bakxZt6NNphlDiEA9PZUhXQssD4sfh8lUJYlA
	 6Fw15Y3AtO13YH8AOOMi+VmwPyb6xFS2iXDVLceYE3wunjtSnDo1+/07hbDDim4W/M
	 H35PnNyK0l/yA==
Date: Fri, 28 Aug 2026 18:11:33 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "debug@rivosinc.com" <debug@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"bill.roberts@foss.arm.com" <bill.roberts@foss.arm.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: Shadow Stack Locking Semantics between arch's
Message-ID: <efe21e09-1e60-4d9f-b5b7-f637b72941a2@sirena.org.uk>
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
 <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
 <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
 <01b0fe86d5700847f78b0e6f839119f54ac88b04.camel@intel.com>
 <apCvGct9U1yprAUE@sirena.org.uk>
 <f2819c4f1a86845b5b2f2b6f0e03f4c334e84eaa.camel@intel.com>
 <c4ac49d9-1fdb-46c4-9303-f17a517ac4c1@sirena.org.uk>
 <e126b2a52321c0a9a6e9de425304e01a62256634.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FUxlxnPVf/3jcu8z"
Content-Disposition: inline
In-Reply-To: <e126b2a52321c0a9a6e9de425304e01a62256634.camel@intel.com>
X-Cookie: Subject to change without notice.
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


--FUxlxnPVf/3jcu8z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 04:48:36PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2026-08-28 at 14:27 +0100, Mark Brown wrote:

> > Yeah, it is.=A0 I can't think why someone would ask for that either, but
> > equally it's more work to explicitly have a list of combinations we
> > reject for policy reasons.=A0 At least on arm64 each permission just co=
mes
> > down to a separate bit in a control register so they're fully
> > independent all the way down to the hardware.

> If we want to have a unified API (Bill convinced me that we did, but mayb=
e we
> should have more discussion on this point), we will need to hammer out th=
e small
> differences between the arch's. For technically supported, but nonsensical
> combos. I'd think to resolve the differences by not supporting them. But =
I mean,
> it's not the end of the world. In the end we are just talking about confu=
sing a
> handful of libc developers. They can be probably handle things.

I think it's similar to differences due to architecture features - only
arm64 supports _PUSH because it's the only one with that feature, users
will have to work out something to do about that.  If someone has a
burning desire to lock weird feature combinations that can't be provided
everywhere they'll have similar issues but I don't see much benefit in
writing code we don't need to.  We should specify what happens if the
architecture can't do what was asked (return -EINVAL?) but I think it's
reasonable to allow the exact restrictions to vary so long as the
sensible cases all work.

--FUxlxnPVf/3jcu8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqRwUUACgkQJNaLcl1U
h9APqAf+IkGHTRPI/0IiQMGD3YP3clcwR6a6ymnPlFl/ykDGiI6UvAy5HqzwJxIr
TwemI/7Qc2NZu+jFmkIvdc8cUxzGpMpBWiejW8eUy99QTrpM1xCS73Hd4Wo16uya
z9JSr+ohVYgdnuyCSK4mm+gVhebNCgm0UvIQ2YfWGsOgZ8F/YZZuP0r3gDi6UGYW
FMDdZ/ToJIvNsuUWKMLhiUgD4Wlf9aaWXYQXvc0w+zTjWuPCasxsKk4FrpAesCqP
MdwW4E4iRGyT7VRC1vTQH7A3Fa2rF029oTayqbzk3IoqrGk3dpbFJ7haX1cqtGXu
mIIEnbh+TZxm2CiQTs0jrKQPwSZUfQ==
=WfGd
-----END PGP SIGNATURE-----

--FUxlxnPVf/3jcu8z--

