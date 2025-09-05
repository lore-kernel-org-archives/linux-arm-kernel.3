Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A849CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vsOOo1Dh/5faLhmv68ZRtREyyxaQnkJhUnEnuAMyqc=; b=PPu01EDke7S6HANBA8vZ4Pke4G
	dwmdlGTvfyhvMURihTPlpe/zG7Yc0cnfCaCt4ZDRuVHSQJQVfFPD65j4vkuajicb7aZyUSJTnqqzB
	lw4OQp1C7gNRWLZAeky3z0Doi+5/RksWru3e1PyS4i4eGuOinXmgESdyEJChRqBn3HAWv3aM/3LJP
	dmKGqPbJa7FiP1pW0lrHRMIWrro86IxlljTazK1g1eWUl0GgDx2QCvEnsutOgqpOY80yFzdTj0nP0
	5ErYit8Zrrk1/eXma8iqXZXjK67Uf+Ppfrkcz1myFikZS66EkO6JpnAvfW0TFZ7JS73PkHNA1+fdp
	MKVoTAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaTZ-00000003YSo-1Dxm;
	Fri, 05 Sep 2025 17:43:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWeO-000000022Gh-3MvO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F7AD44CB7;
	Fri,  5 Sep 2025 13:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B7FC4CEF1;
	Fri,  5 Sep 2025 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757079528;
	bh=+RfIeCiYHGfOQAYZpOBH5xFxrQIjFV5rbqolCOJUiVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=goqvWAluxfzf8BkxFwUH6Ln7miVt6sUnhYEjzlJ0bfEm6Z+hkN7Vbm+5YeSyn4CZq
	 nfc/ZWNn4ruTbxMbNZUqC/HtAnC6ie9u7NgP+pl4PTtHfQIkHasEbxJQCEIuZG7c6G
	 3YJH26/oE9qL2Xkghwa6/0lf4A3/FEFYpnEgDsQvJkjT2T2ftwdCzOHTphbw1NRKn8
	 HV1egnOIdjeyvJpeDSdBn/jomeNlNAN6ZnNGOsiwu7EutupADa1bHHpkcN4zKF34qr
	 Xi/Xfb07GAaelXX5R9irbB92nla6CsdO+hpRpj2iAnhtRUIGi52egIr9m97RUdDx7h
	 3YfsrU1YqhEGA==
Date: Fri, 5 Sep 2025 14:38:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, kvmarm@lists.linux.dev,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Fuad Tabba <tabba@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: kvm-unit-tests hang on Arm FVP with protected mode
Message-ID: <345e42db-eabd-4e34-abf5-d9974dfe55d1@sirena.org.uk>
References: <CA+G9fYsT3b3Qd-m6tSDOgAXpgLPWz0QD_Z6a+_ff4oTecA85PQ@mail.gmail.com>
 <87ms79ystc.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ftKo7STfvoWEjFz0"
Content-Disposition: inline
In-Reply-To: <87ms79ystc.wl-maz@kernel.org>
X-Cookie: He who laughs, lasts.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_063848_878969_EC9CD72E 
X-CRM114-Status: GOOD (  16.87  )
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


--ftKo7STfvoWEjFz0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 05, 2025 at 01:42:07PM +0100, Marc Zyngier wrote:
> Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> > INFO: running kvm unit tests ...
> > + [ True = false ]
> > + ./run_tests.sh -a -t -v
> > + tee -a /lava-1/0/tests/0_kvm-unit-tests/automated/linux/kvm-unit-tests/output/result_log.txt
> > TAP version 13

> What do you expect us to do with such a non-report? Can you please, at
> the very least, identify which test in that test suite triggers the
> failure?

Looking at the log file that isn't password protected that's the last
line of output so it'll have hung trying to do the first test, based on
the log from another machine:

   https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250905/testrun/29777055/suite/kvm-unit-tests/test/debug-bp-migration-timeout-duration90s/log

it seems that should be

   ok 1 - selftest-setup: selftest: setup: smp: number of CPUs matches expectation

that's died for the version they're using.

> > Links:
> > https://regressions.linaro.org/lkft/linux-mainline-master/v6.17-rc4/lava/kvm-unit-tests/history/?page=1

> What is there? This link requires a login, and goes to 11 on the
> scale of being useless.

My Linaro account appears to have been disabled at some point so I
can't access it either.  If this is affecting mainline presumably it's
been an issue in at least -next for a while.

--ftKo7STfvoWEjFz0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi65+AACgkQJNaLcl1U
h9DLewf+Ls/00LL8UkAstP2PfYnm8MYv7sEGvfU6pcxX76rmhhoo+wHh/P4hYxIc
GnEmWTawHaooNeTHseqYhjmZExdIu4kjBFLylfnR0kl70I7Z9fj2lNke/I5l6esd
y6+T8DWSATVhQTebL9S/tmeQ223uLeJxoWU3o2Cex5787ehN5TMly7bqCBleQNrE
C6WrgNNVDCffoSsFFv+CCCRtptBgSIUmJTox4dxFIAvmJ3NLhe9yB2SCvQGGWIRr
mp9DPS9eygW3mJsa3IWwmUhpA1nVrUbcmI+KFXgTdDwP36xjlLGj0E0o41TL8NiJ
O1/Rrzn/W690wZtEzwjotbV4+hBASg==
=/HVR
-----END PGP SIGNATURE-----

--ftKo7STfvoWEjFz0--

