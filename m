Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19390C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 20:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzmGSkpEVFcojxkiM5YqtoPiGm2xWAAbzqRSSJMKobU=; b=QZV4C95S6rSMKOm48rf+lJtqY4
	aQ2yZ1bh/jNuepC8p0a/nRaWQt/cQKw5i1ilqMHXh9BzX4P/2C2Kh9emmIIWNEdgu1BfkAaUEW+yi
	LbASHXFS9oMGhPQYDt8SGqiWEKnchck1K5BH4SALLROXvIfICmklodFIf83wBq1lnyT+qvNJS5Mx+
	s8XN4PVQJDmgJ/VooaqKNi6OUal3BlF5TXS7fPVGDfc0x2hodP9gpWRJ3/2zOF6tOFuOd2pLw4JRv
	VQHU+CGLKLPEAdljCJecl5FaV0vZN9dXRoCf49b8SV6Ey/YyFpYA/KRLXpqlM8amqnxvpFjTv5H2P
	fvBvujMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FP4-00000005KNX-2Z5d;
	Tue, 08 Apr 2025 20:18:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FNJ-00000005KD5-3R5b
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 20:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QzmGSkpEVFcojxkiM5YqtoPiGm2xWAAbzqRSSJMKobU=; b=KjKQMTkIaIAWt5CCDS9wshTnz0
	ePRzcyob1RjEbr/ybzbcj9W4eAE6yJHAE9GNyqaHvGc+Edoti3Y5Xg9Q2f0qXLjSKfG2hBpV+oecT
	Rv4P7Veo1M2gmMxzmplSsys+8T/ofEkXQnInFc899r3K2Wn4Cq2lgzj4gLb/REIEREUuCeRR/50a0
	hy0VzUW7a0Bf/caRxtVvdFf0qZmfz/YV0J+hy7igB0TaGwJARthTpGOeX4ZS+gLM3TyE12MF309vK
	aVKBEvrbPz0x4RdhsUf5jSLwy48dZnpSo8SFSx4vhqxfeXbxH9MReEeMhvmjxHZbA65+HZ4PcdV89
	C0JpXnwA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2FNG-00000008QW4-2qOW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 20:16:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F9DB5C4A16;
	Tue,  8 Apr 2025 20:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16CCC4CEE5;
	Tue,  8 Apr 2025 20:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744143405;
	bh=FRDvcnro+C0U0uDXFa9znLcbNqr0CFpmmm1Nx8eyClM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FYXjCVJvaoKulf/FzdPUuLB2XlbGauNYJ16m0Gj4yr3f7PBh3Kww/j/gLQhaakRu/
	 uO4Kgy0qxIOEiiLEXR22Vxd6oMKvuxgToHm4Jwu7jwe+oY6t9itQU/PxmNlZYYUWiJ
	 bYp9yByhyCJNCjpG2CKMnkwDOo9aXnQNJWUcAO5Lxg9HrOW6F+Fz5QoNEC3pY9Gc7o
	 uydQue5gUKDZkefhj4J+rXxYk/UKBZ5ZHolQp17Vh8nCnfCLet5frsHAUa1IReNvf7
	 Lxjk924gybsJLkWFfHpYweyFaBybZ4WlVCeHevIIohgHdjWMNOUro2xOvotMsknExf
	 AxXaou0TUNW+w==
Date: Tue, 8 Apr 2025 21:16:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 00/14] arm64: Preparatory FPSIMD/SVE/SME fixes
Message-ID: <879811da-d0f0-4b0b-bca4-df68ff9bf394@sirena.org.uk>
References: <45cb5ce9-39af-4c42-b68d-fa506b67bc55@sirena.org.uk>
 <Z_VS5wvn0C7tdjbo@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9DXsmRg8N76hh/Kv"
Content-Disposition: inline
In-Reply-To: <Z_VS5wvn0C7tdjbo@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: Meester, do you vant to buy a duck?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_211647_101872_04438B84 
X-CRM114-Status: GOOD (  38.25  )
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


--9DXsmRg8N76hh/Kv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 05:46:31PM +0100, Mark Rutland wrote:
> On Fri, Apr 04, 2025 at 07:06:50PM +0100, Mark Brown wrote:
> > On Fri, Apr 04, 2025 at 06:44:21PM +0100, Mark Rutland wrote:

> > > * The ptrace ABI for SME is written around the assumption that
> > >   SVE_PT_REGS_FPSIMD and SVE_PT_REGS_SVE are separate bit flags, wher=
eas
> > >   in reality these are different values (0 and 1 respectively) for
> > >   bit 0 of the user_sve_header flags.

> > The documentation definitely doesn't reflect what actually got
> > implemented, IIRC the errors are more around returning the header only
> > rather than the assumption that they're separate flags but at this point
> > it doesn't really matter given that the documentation is clearly wrong.

=2E...

> This means portions of the code are wildly misleading, and this caused
> secondary problems such as providing register data when we didn't intend
> to, which I assume is what you mean by "the errors are more around
> returning the header only".

Yes, exactly.

> > >   I haven't yet worked through all of the implications of this, but
> > >   AFAICT we can't reliably indicate the value of PSTATE.SM, and
> > >   userspace cannot reliably save/restore a task's state in all cases.

> > Userspace should be able to read by looking the SSVE registers, if you
> > get SVE format register state back you're in streaming mode. Streaming
> > mode state will always be saved in SVE format so a read of streaming SVE
> > vector state will come out with the SVE bit set, if we're not in
> > streaming mode it won't be set.

> Unfortunately, that's not always true today.

> While fpsimd_save_user_state() will save streaming mode state into the
> FP_STATE_SVE format, other code can manipulate the task into a state
> where thread_sm_enabled() is true, but the task's registers are saved in
> the FPSIMD format. That combination is broken for a number of reasons,
> but you seemed to permit this deliberately in commit:

>   bbc6172eefdb276b ("arm64/fpsimd: SME no longer requires SVE register st=
ate")

> ... which says:

> | Now that we track the type of the stored register state separately
> | to what is active in the task, it is valid to have the FPSIMD
> | register state stored while in streaming mode.=20

> I will assume that commit message is misleading, and that we do not want
> to permit that case. It's possible to get a task into a bad state
> regardless of that commit.

Ah, yes - that case is indeed going to break.

> We can fix that in a number of ways, but we need to think of the shape
> of ABI we actually want, e.g. whether writes to NT_ARM_SSVE with
> SVE_PT_REGS_FPSIMD should be rejected outright.

It's hard to see a use case for it so it does seem reasonable to
disallow that, it would really be nice if SVE_PT_REGS_FPSIMD weren't
part of the ABI at all.  OTOH it will be implementable with any read
side ABI and it *is* there.

I think the intended ABI where returning SVE register state from
NT_ARM_SSVE indicates streaming mode is probably a good choice given
that it is compatible with the existing userspace code you've surveyed,
will be the behaviour seen in most actual usage with the current code
and is fairly close to the documentation.

If we do that then when streaming mode is disabled the obvious options
are that we can either keep the current behaviour and return FPSIMD
register state, or change to only return the header.  The former is less
change and therefore safer, the latter is probably a nicer ABI.  GDB
appears to do the right thing if it only gets the header back.  LLDB
appears to only attempt to read the header when determining if it's in
streaming mode so shouldn't see any difference at all, though that code
is a bit less clear to me.

--9DXsmRg8N76hh/Kv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf1hCgACgkQJNaLcl1U
h9B/vAf+Pq5oTkdw28QXqOdRnoDK0i0yM+0DYDwVZVgW3n42tl0tX2PXiTqjDE2W
/louzDJWgkQUeC7fEkcDK6jgfsLt61qLSLogXpUpHe3IYjVDr26ZYomnKNoIQcNK
2s7xp1EO4y8jpUaWPLwBsYMNaZdGYvUgyB1ELLt8vRxf5XAFSsE2U1H5gX4hYZ94
Iwm5jIJxHHgur5VnDDpwRgvnaiRjL+KF9U8jZO5mJqOMzjrKOyWsDvBu9rMZyD+O
4qAIdnQLD4uHcTe6qm7tZ8TBF3b/FH+PDR2+az7dOl2bc7xVY4xe/RRMLT+BmB1o
YBZ6xyXHZX4LG+Qe5hjamjpcayec9A==
=MM3a
-----END PGP SIGNATURE-----

--9DXsmRg8N76hh/Kv--

