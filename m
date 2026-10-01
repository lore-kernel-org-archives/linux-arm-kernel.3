Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676F9CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRl45zOulKSzHu0gpa5gJKuaLYcXh2vCa43UARtQmaM=; b=PgbQww16fV4A+8mjZs1kJeAWfo
	O7021B/kLBdUkLQJ0DHBAxEsIwZlMa+qJS/36TgrobC0/a1d1vcNKt3XOG9A3AxEExZxer+utfaMO
	BTFSvDeO+ywue23EK5XHNTqGi/Npfgn98VMkxcvPV//rvvZtpbRQad9GAJy6K8J+HMn6Nja4wpUDF
	Uui2zc2Ol9EYNqGE87X9XGXw0l3A1m+K2PsraEUBGN5UxlGooO+AMR/F+wbURKb8462mfSeXdxaLs
	nuuZqLz2xWF4GLczxKc391ISzGQnIfjW877TrDpKgmYw8e0GdPYi6HAVFfvq9E+VsAIozqboFFFTJ
	IRKqPf9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO4M-0000000AEpI-2iuB;
	Thu, 01 Oct 2026 21:12:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO4K-0000000AEp4-3a5U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:11:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 465C341908;
	Thu,  1 Oct 2026 21:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AC51F000FF;
	Thu,  1 Oct 2026 21:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889116;
	bh=ZRl45zOulKSzHu0gpa5gJKuaLYcXh2vCa43UARtQmaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VLvG3LABMRXOFV0rgrekJzhEHgOaAUj51pCohlr6tbG0Kfz2+O31tpT/VOJmKa2qv
	 aoqtWaO1OHmw6NEuOwkkzH+ITshRx/cFcvuH30U6Z3Z+1f5M2XRpJW5j0kZQMfBpNm
	 aDJiV/OkpNSN247u+74LZ2vH1rAJrHOISVEvOLsSU/SkHlDUq8HY1dMdUOolhLzS4O
	 mNj00cw/HyADcX5F9EhC+DfLOsZJiBgJnAxDjXk7eheCEFsSCfLQQ8G0dWHfPfNsvP
	 XfEfksywZyaJ74TR0NoPtMy+hlIkUHjIHexpIJSmCzCsK9XTgP8DkePoYwHX0nhJjT
	 /zuYeQ4/jGOFw==
Date: Thu, 1 Oct 2026 22:11:49 +0100
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
Subject: Re: [PATCH v21 08/15] KVM: arm64: Enforce EXLOCK for SPSR and ELR
Message-ID: <659cba01-3c53-4eb8-9124-7c62d266a64f@sirena.org.uk>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-8-3556644cd927@kernel.org>
 <ar5thpZI5GiCfVRR@gremlin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q9J3ZXhLEIPLOZjy"
Content-Disposition: inline
In-Reply-To: <ar5thpZI5GiCfVRR@gremlin>
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


--q9J3ZXhLEIPLOZjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 05:26:41PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 30, 2026 at 10:48:18PM +0100, Mark Brown wrote:
> > As per I_CFFNS and the pseudocode for the SPSR_ELx and ELR_ELx registers
> > a GCS exception with ExType 1 is generated for attempts to write to
> > those registers when both GCSCR_ELx.EXLOCKEN and PSTATE.EXLOCK are set.

> From [4] I see I_CFFNS is defined as:

> "When an MSR instruction would write to the relevant ELR_ELx or SPSR_ELx
> for the current Exception level ELy, the Effective value of
> GCSCR_ELy.EXLOCKEN and PSTATE.EXLOCK may prevent the write."

> So the lock applies to writes to the current EL's own ELR/SPSR rather than
> to any ELR_ELx/SPSR_ELx the current EL can write to?

VHE and NV complicate things so "own" isn't just the same ELx, but my
text above definitely oversimplifies too much and so is wrong.

For example refering to the pseudocode for ELR_EL1 and SPSR_EL1 we see
in the MSR handling:

  elsif PSTATE.EL =3D=3D EL2 then
      if IsFeatureImplemented(FEAT_GCS) && GetCurrentEXLOCKEN() && !Halted(=
) && PSTATE.EXLOCK =3D=3D '1' && ELIsInHost(EL2) then
          EXLOCKException();

and note the use of ELx for ELR/SPSR and ELy for the current exception
level and GCSCR in I_CFFNS (ie, ELx vs ELy).  My interpretation here is
that the use of "the relevant" rather than just using ELx throughout is
an effort to cover the complications resulting from VHE and NV.  With
the above pseudocode writes to the EL1 register from EL2 are also
covered when we're in host mode - the fact that we're in host mode makes
the EL1 access relevant.

I'll reword what I've written in the commit log, like I say it's wrong.

> So... TL;DR is, shouldn't this function look like:
>=20
> static inline bool sysregs_exlocked(struct kvm_vcpu *vcpu)
> {
> 	if (!kvm_has_gcs(vcpu->kvm))
> 		return false;
>=20
> 	if (!(vcpu->arch.ctxt.regs.pstate & PSR_EXLOCK_BIT))
> 		return false;
>=20
> 	if (is_hyp_ctxt(vcpu))
> 		return false;
>=20
> 	return vcpu_read_sys_reg(vcpu, GCSCR_EL1) & GCSCR_ELx_EXLOCKEN;
> }

I think so, but I'll check through again.

The confusions you identified in the bit of your mail above this were
the result of me doing some but on all of the simplifications.  I was
trying to make things clearer by including some code that couldn't run
so it was more obvious that things correspond to the pseudocode, but
really that shouldn't have had any simplifications in it - we should
either have all the simplifications or none of them.  I'll add more
comments instead.

> > +	/*
> > +	 * Note that the EXLOCKEN for the running EL is checked
> > +	 * regardless of the register written to.
> > +	 */
>=20
> This seems to contradict [4] - the register written to is what decides
> whether the lock applies?

[4] is section D11.4.1 of DDI0487 M.d, containing rule I_CFFNS discussed
above.  My intent there is to express that if EXLOCK exceptions might be
generated we check EXLOCKEN for the running EL, not one influenced by
the written register.  Some combinations of register, EL and system
state do not generate exceptions but those that do use the current EL's
EXLOCKEN rather than an _ELx register using GCSCR_ELx.EXLOCKEN.

--q9J3ZXhLEIPLOZjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+zJUACgkQJNaLcl1U
h9BVtAf+PDpVuQacuftSkXtdJrBZMHKg8vNuetDKBvz9KvhrxoYoWQjRmPVuAoX2
OcGHpNojxajl33f7aKUa28MSH8eOOSZuypPQ1cvORyeyrLK7fTnN7r/MVRpccdQl
VgMAgLADQyNtyXisrzEFNQorksK5ns7ifIN7qsf6hRMZM11ZMHhxQ0jM4EdhmLX2
OmHFYM3ynGbTgwltOCO3mXd4DWQOw/QFxzBXc7Y83BNhW7oWphPC0qw098y7WbRo
pTQnmDtpms4njthjpsM8eSwsTJ+geholf5xtxuI9ssE3JhR1tuN5Su3E3hKjQM5y
Livc7aiNwu7yvT6t0SYfIcx3omJ/Tg==
=yzBf
-----END PGP SIGNATURE-----

--q9J3ZXhLEIPLOZjy--

