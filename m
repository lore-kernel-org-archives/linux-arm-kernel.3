Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0926CC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJNZSdtlkmYSmYR194N6u/IIwvLnmZyLCW5wos6cefs=; b=27BGGZmbwXwU3SyFWgW0oNgI2b
	pCz9I51XHsn1iYZEB/tcxsvwbPlLX33Acvgy4JSW19Fp6bioyrtLHg3oz6JEFBdlOnrucTNJrqofh
	r4FyoiDWJT5GCmFO45uFFFVRSeRrer7eOXMzELIY28JU7iH9/zG4EH8+BqN/+VPjNpdDY1MKJ/Fmz
	XRQR2XJHAItJhWPAp1LvJ+FpRfvnPb6r5u1aDl5pa/1O6LAIwkB2/Lf2vMJicIHPCCvfX8fy0tuAF
	/ppO2YYUBRTfCM7Jx8xJyW63qI6Obad3PupAN7AyZGoSX4neS2pKno5Ow1vy1RwVAa8ddNu9YafER
	EoFAzO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU20O-00000005RwT-2Dyx;
	Tue, 24 Jun 2025 11:40:00 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU15d-00000005KtW-3hgN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:41:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E820C101E9287;
	Tue, 24 Jun 2025 12:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1750761677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=xJNZSdtlkmYSmYR194N6u/IIwvLnmZyLCW5wos6cefs=;
	b=O81Rly9RWffD1vprGIl6wBGzUIqmAs4FKeptoBWaVbi98DKflcuKrXOi/+WfDxvIkCoNsq
	B8YX5tAhGPNXO0jpbhC/kdKkicKFvyZVRlXm9SRLc3BF9elb7QkiVxNvlGVnWXvWaPZoQr
	PKlhnwOnBPAzcW8V9ZXu2vSzAYs5KVeIol/jIMsxD80dsHyb5q7aZto5klDzlZzYDbl6el
	etk/HqBCVUB8AWsw1JI81+euCWs6ThTGgEJzOSX7wi3rT9UDZx5mGPb4EitnFOo/i+khE7
	adnF828od6mJWOIBxCGN7Tz1Cq/KZsqsvJCx9U/xUWgwpH7QtOHheeIaEAf45g==
Date: Tue, 24 Jun 2025 12:41:08 +0200
From: Pavel Machek <pavel@denx.de>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
	patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Julien Thierry <jthierry@redhat.com>,
	James Morse <james.morse@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 5.10 000/355] 5.10.239-rc1 review
Message-ID: <aFqAxKT6C7idQY32@duo.ucw.cz>
References: <20250623130626.716971725@linuxfoundation.org>
 <CA+G9fYt2e-ZGhU57oqWwC1_t2RPgxLCJFVC0Pa8-fYPkZcUvVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="99H4i/IRjps6Yc2M"
Content-Disposition: inline
In-Reply-To: <CA+G9fYt2e-ZGhU57oqWwC1_t2RPgxLCJFVC0Pa8-fYPkZcUvVQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_034122_217316_86AB0F88 
X-CRM114-Status: GOOD (  24.65  )
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


--99H4i/IRjps6Yc2M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > This is the start of the stable review cycle for the 5.10.239 release.
> > There are 355 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Wed, 25 Jun 2025 13:05:51 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patc=
h-5.10.239-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git linux-5.10.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
>=20
> Regressions on arm64 tinyconfig builds with gcc-12 and clang failed on
> the Linux stable-rc 5.10.239-rc1.

Yeah, we see same problems:


814
  CC      arch/arm64/kernel/asm-offsets.s
815
In file included from ./arch/arm64/include/asm/alternative.h:6,
816
                 from ./arch/arm64/include/asm/sysreg.h:1050,
817
                 from ./arch/arm64/include/asm/cputype.h:194,
818
                 from ./arch/arm64/include/asm/cache.h:8,
819
                 from ./include/linux/cache.h:6,
820
                 from ./include/linux/printk.h:9,
821
                 from ./include/linux/kernel.h:17,
822
                 from ./include/linux/list.h:9,
823
                 from ./include/linux/kobject.h:19,
824
                 from ./include/linux/of.h:17,
825
                 from ./include/linux/irqdomain.h:35,
826
                 from ./include/linux/acpi.h:13,
827
                 from ./include/acpi/apei.h:9,
828
                 from ./include/acpi/ghes.h:5,
829
                 from ./include/linux/arm_sdei.h:8,
830
                 from arch/arm64/kernel/asm-offsets.c:10:
831
=2E/arch/arm64/include/asm/insn.h: In function 'aarch64_insn_gen_atomic_ld_=
op':
832
=2E/arch/arm64/include/asm/insn.h:26:54: error: 'FAULT_BRK_IMM' undeclared =
(first use in this function)
833
   26 | #define AARCH64_BREAK_FAULT    (AARCH64_BREAK_MON | (FAULT_BRK_IMM =
<< 5))
834
      |                                                      ^~~~~~~~~~~~~
835
=2E/arch/arm64/include/asm/insn.h:573:9: note: in expansion of macro 'AARCH=
64_BREAK_FAULT'
836
  573 |  return AARCH64_BREAK_FAULT;
837
      |         ^~~~~~~~~~~~~~~~~~~
838
=2E/arch/arm64/include/asm/insn.h:26:54: note: each undeclared identifier i=
s reported only once for each function it appears in
839
   26 | #define AARCH64_BREAK_FAULT    (AARCH64_BREAK_MON | (FAULT_BRK_IMM =
<< 5))
840
      |                                                      ^~~~~~~~~~~~~
841
=2E/arch/arm64/include/asm/insn.h:573:9: note: in expansion of macro 'AARCH=
64_BREAK_FAULT'
842
  573 |  return AARCH64_BREAK_FAULT;
843
      |         ^~~~~~~~~~~~~~~~~~~
844
=2E/arch/arm64/include/asm/insn.h: In function 'aarch64_insn_gen_cas':
845
=2E/arch/arm64/include/asm/insn.h:26:54: error: 'FAULT_BRK_IMM' undeclared =
(first use in this function)
846
   26 | #define AARCH64_BREAK_FAULT    (AARCH64_BREAK_MON | (FAULT_BRK_IMM =
<< 5))
847
      |                                                      ^~~~~~~~~~~~~
848
=2E/arch/arm64/include/asm/insn.h:583:9: note: in expansion of macro 'AARCH=
64_BREAK_FAULT'
849
  583 |  return AARCH64_BREAK_FAULT;
850
      |         ^~~~~~~~~~~~~~~~~~~
851
make[1]: *** [scripts/Makefile.build:117: arch/arm64/kernel/asm-offsets.s] =
Error 1
852
make: *** [Makefile:1262: prepare0] Error 2

BR,
										Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--99H4i/IRjps6Yc2M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaFqAxAAKCRAw5/Bqldv6
8oO2AJ0THdQP/jgUCOPQIWJxokWKjzBWXwCfbnHq/Z5PGgx+mwo8REY3xKum4EY=
=7i9r
-----END PGP SIGNATURE-----

--99H4i/IRjps6Yc2M--

