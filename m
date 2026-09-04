Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9A8C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7qKDhZ+F/2Bi/cyOsP+5DU9BRD5spx5V6SRGgxoqJo=; b=rzd97rlg+VI4GP5VHbTIKXRURg
	HsWHkyZZD0ZEV3RtsapHHG7x1W6uT4bX+tR56zwTZh/Pr8ZiHp0VsLz2BI1b0/VN96MTnjQHQCJm8
	c4/9biZ/0EJU/pwk5FzpRYd2QIonxKSE5fWn3OAKQfT4c2RQqrlGwUp+G84U8gsDHNaXDrnMfeOZe
	I+4VB+vnuq+8XzQa6cYYEE0PdMDsG5SwSouwYqIetWM3w67kwkKP/hS0j8vKpEH9RPTr61xxl6Afb
	CsmXr+9Sfwp/VSJfVmDWl3GyZ0r2AwBtYKRE79btiXBjjDF7hzq0ZrkekU72RRv0OfBjJIA0S9bKk
	fQimidoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2b8c-00000003IY8-43gp;
	Fri, 04 Sep 2026 21:07:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2b8c-00000003IY1-0VBU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:07:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4A40413A8;
	Fri,  4 Sep 2026 21:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893101F00A3D;
	Fri,  4 Sep 2026 21:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788556071;
	bh=v7qKDhZ+F/2Bi/cyOsP+5DU9BRD5spx5V6SRGgxoqJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S50/g39YB+UKTmtZhDM86RL7eGgd5uMqzVcDE1aAlJT8XMQAqeHfkE58X7ZAr26AU
	 onB1eejg3jb1WO8cKRmxSPB3MvyMNkr+eT23R7PfSmy7LO9lko3ShF5ipG7JZ7cvjK
	 q7gKapYUS2LKKN7GMUzxJQeSbrSD8BweqOm9/PJ3wP56Q8qBtTRvbEQXecVhtbHxyT
	 V1F0xaFHoUj4i7tRvSu7cjG+ZxAaQ5wQiUaK5QERMs4M/zsPmmXntBhiXosa0wCNDL
	 NGiSltNgHL1pCcWcMBTEQwVSodVuiSuCD2HOgsoLUQe9Mudv0UuHFyJgj7i2Mz0Lsq
	 yQK3y0OxWGV8A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 77FD41AC52F1; Fri, 04 Sep 2026 22:07:49 +0100 (BST)
Date: Fri, 4 Sep 2026 22:07:49 +0100
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
Subject: Re: [PATCH v20 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <apszJZ17KUvd6BJ7@sirena.co.uk>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-3-f31750bdfadb@kernel.org>
 <apmfx08vccSd2MXw@gremlin>
 <d2659ac3-2f00-4fc4-8f9e-0585691a4ba2@sirena.org.uk>
 <apqA_SuoA6-TyHsS@gremlin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UxxT9yru8a/XGYWy"
Content-Disposition: inline
In-Reply-To: <apqA_SuoA6-TyHsS@gremlin>
X-Cookie: My vaseline is RUNNING...
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


--UxxT9yru8a/XGYWy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 09:54:51AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 03, 2026 at 09:41:26PM +0100, Mark Brown wrote:

> > originally written the code without expressing this dependency but on a
> > previous version Marc asked for this nesting as an optimisation.  Since
> > it's about optimisastion adding checks that don't otherwise exist on the
> > restore path would doubtless get the similar complaints.  Exactly the
> > same concerns were raised on v19.

> Could you implement the nesting the same in the cases where there is a bare
> ctx_has_gcs() as an alternative?

> So then it'd always be tcrx -> s1pie -> gcs everywhere and that'd resolve things
> also and make things symmetric.

> You could also I think express the dependency if it makes sense to.

Clearly we *can*, it's a question of what'd be acceptable - it'd result
in the compiler emitting a bunch of extra alternatives and conditionals
in the context switch path.

> > We could do checking of the ID registers at vCPU creation so we could
> > avoid worrying about them in the fast path but there was also feedback
> > about not doing that.  One idea I had was to generate feature

> Could you possibly check in sanitise_id_aa64pfr1_el1(), something like:

Sanitising the writes is a bit tricky since multiple ID registers are
involved, TCRX and S1PIE are in ID_AA64MMFR3_EL1 while GCS is in
ID_AA64PFR1_EL1 so you'd create an ordering constraint for userspace,
and you'd also have to handle the case where TCR2 or S1PIE are turned
off with GCS already enabled.  It feels like a bunch of complication,
especially if you start applying the same approach with other features.

If we're going to validate the ID registers it feels safer to check at
the point where we finalise the ID registers and refuse to start the
vCPU if there's an unsupportable configuration, that would mean the
check would only need to be done in one place and userspace wouldn't
trip over any ordering requirements with how it updates registers.  Only
userspaces that set architecturally invalid configurations should see an
error.  We could also handle things by fixing up the configuration at
the same point, disabling features that are missing their dependencies,
that's a bit more friendly in the short term but could lead to trouble
later on as it means we hide issues in userspace.

I think the best thing overall would be to leave the runtime paths as
they are and refuse to run with an architecturally invalid setup, that
would avoid bloating the fast path.

--UxxT9yru8a/XGYWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbMyQACgkQJNaLcl1U
h9DE8Qf/VR7HYcBaMw2G7Ups8tn2qUfYjOTJ99VnF8o6I1RpC8Nl2GgzkjHXBJyx
/nQjWZNQ2wAy/rdn2lQtjolxCA4p5ZnYXJwG6dVQmDAKGSvJJ5MxqgRAt0i220TR
F7XnsZKbtHp+rri39JMZoLszEfc28vUcUxh19+PF1UQfRaXniazCXbnBOAqyU6lM
+ROUaor3Rve9TvHm/uqKw7eiDnyYIZjxn/nj3S9GdFwTVKstI0WX1iu+LHNPcuva
qO3rGmzDFOtxScggNgCj497tEj1vvj8qb1Cz/+NnC5Px4NJKgqUq03twCDtTkWOr
flTA3wHWYD88gDv/NRFpxyWaWE+XdQ==
=j1jf
-----END PGP SIGNATURE-----

--UxxT9yru8a/XGYWy--

