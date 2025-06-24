Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E167C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Va1GElfn24V2n6z7i0LdkveYRP3tydIp4DA9MSZVvb4=; b=QsgESDiQ4IVXzZqxw0TmKRPngU
	S4ncfsSMY47H4De/bcSRkZ6TBLBwr0G+mMLw4Zb8EKqmGUffZQ3pli1nAnKiGVmUQjrgbxETqkc1g
	W3n66pHcGYw7kjfvAgmgMuxZaXI+w1ZXGIoOdsin50otkgbYvX7ofcTmN3twwL8Pa9RCmIPpn2e5c
	QpM9l+xhEoW56Ie5zKoBTtZ7Xtsr+UfKhmDZO7e37xhjcKnocRLwV3Lfj43s4vV1YAXheqncgEo1T
	Ml8IdgoX6rSojf9O6L45zYOaftWwgomo4erFJAWaMc2COfQE5IOStpqBtKZEvh76uQ1m1RMqF5/8X
	ocVSq5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jT-00000006fpo-2k7s;
	Tue, 24 Jun 2025 19:55:03 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6M9-00000006G1O-2YbF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 16:18:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10293101E8F52;
	Tue, 24 Jun 2025 18:18:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1750781922; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Va1GElfn24V2n6z7i0LdkveYRP3tydIp4DA9MSZVvb4=;
	b=YSopkTVsf/kFOYTvEMza1G7egcTIIvo+xektTod7f03AAchmfAx5yEMRagxZxkA6V8WeuJ
	o/iCNK7jNRnkOcdN38UfjZXOOvEIJvMPfUdjE6daF2XCr62H4GbyrAMflfg1s+k0CcoAl8
	Pz1fNMok3tQXa6RwZQq9ogF+TBoecpNLl7uLwhEKbn5PJJXdkSNPQBIbpymNyZopiw1UC9
	MF9q4zJL+PxNVQ8XmKV/cLnVmfUXImDNG+USsXjBkK0eauYaA3bf/Iq6RX1fFeUlnDfYm1
	Gi4gMIdh0Y09WezYMjnX/KwJrNX7/W/bacnncr3oULRKzXK5tXuJ7/sGfknpag==
Date: Tue, 24 Jun 2025 18:18:32 +0200
From: Pavel Machek <pavel@denx.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, stable@vger.kernel.org,
	patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, kvmarm@lists.cs.columbia.edu,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Julien Thierry <julien.thierry.kdev@gmail.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Andy Gross <agross@kernel.org>
Subject: Re: [PATCH 5.4 000/222] 5.4.295-rc1 review
Message-ID: <aFrP2KAE1cws/Hbq@duo.ucw.cz>
References: <20250623130611.896514667@linuxfoundation.org>
 <CA+G9fYvpJjhNDS1Knh0YLeZSXawx-F4LPM-0fMrPiVkyE=yjFw@mail.gmail.com>
 <2025062425-waggle-jaybird-ef83@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NeDUsWHsbq74XlUI"
Content-Disposition: inline
In-Reply-To: <2025062425-waggle-jaybird-ef83@gregkh>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_091845_800347_E2AF73AD 
X-CRM114-Status: GOOD (  14.72  )
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


--NeDUsWHsbq74XlUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Build regression: stable-rc 5.4.295-rc1 arm kvm init.S Error selected
> > processor does not support `eret' in ARM mode
> >=20
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >=20
> >=20
> > ## Build errors
> > arch/arm/kvm/init.S: Assembler messages:
> > arch/arm/kvm/init.S:109: Error: selected processor does not support
> > `eret' in ARM mode
> > arch/arm/kvm/init.S:116: Error: Banked registers are not available
> > with this architecture. -- `msr ELR_hyp,r1'
> > arch/arm/kvm/init.S:145: Error: selected processor does not support
> > `eret' in ARM mode
> > arch/arm/kvm/init.S:149: Error: selected processor does not support
> > `eret' in ARM mode
> > make[2]: *** [scripts/Makefile.build:345: arch/arm/kvm/init.o] Error 1
> >=20
> > and
> > /tmp/cc0RDxs9.s: Assembler messages:
> > /tmp/cc0RDxs9.s:45: Error: selected processor does not support `smc
> > #0' in ARM mode
> > /tmp/cc0RDxs9.s:94: Error: selected processor does not support `smc
> > #0' in ARM mode
> > /tmp/cc0RDxs9.s:160: Error: selected processor does not support `smc
> > #0' in ARM mode
> > /tmp/cc0RDxs9.s:296: Error: selected processor does not support `smc
> > #0' in ARM mode
> > make[3]: *** [/builds/linux/scripts/Makefile.build:262:
> > drivers/firmware/qcom_scm-32.o] Error 1
>=20
> That's odd, both clang and gcc don't like this?  Any chance you can do
> 'git bisect' to track down the offending commit?

We see this one, too:



/tmp/ccJcop5R.s: Assembler messages:
2033
/tmp/ccJcop5R.s:45: Error: selected processor does not support `smc #0' in =
ARM mode
2034
/tmp/ccJcop5R.s:95: Error: selected processor does not support `smc #0' in =
ARM mode
2035
/tmp/ccJcop5R.s:162: Error: selected processor does not support `smc #0' in=
 ARM mode
2036
/tmp/ccJcop5R.s:299: Error: selected processor does not support `smc #0' in=
 ARM mode
2037
make[2]: *** [scripts/Makefile.build:262: drivers/firmware/qcom_scm-32.o] E=
rror 1
2038
make[2]: *** Waiting for unfinished jobs....
2039

https://gitlab.com/cip-project/cip-testing/linux-stable-rc-ci/-/jobs/104520=
69686

It is probably config-dependend.

https://gitlab.com/cip-project/cip-testing/linux-stable-rc-ci/-/pipelines/1=
886959470

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--NeDUsWHsbq74XlUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaFrP2AAKCRAw5/Bqldv6
8qibAJ9VUVgof6VKLUdQlXbcxcDMnAgf1gCfR41spMnM223GmmrQF68UWgs3GW8=
=sRvP
-----END PGP SIGNATURE-----

--NeDUsWHsbq74XlUI--

