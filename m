Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FC6CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 18:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMVkQIstXjwq9Shrv3SPe+HzUATEhhQeV6CxlaoEhZc=; b=AcUYkhyDEuI9S4pnMJ/bYevG4a
	eSYUaP1TCQhHGgLA8nj6i3fQ2tFuQBfDw0oGlGIphJNxvXyWkxQkzFG37pCYKWgaSXZyjWRn28hmp
	UQfs5e0usyI+cIlGg0bc1Jo+0804vG75dh/s0t2JY0BEy9ekNLdSifMMBSEiXBRV6o9JOby+Pi1VP
	Iaw2dkGhtbmC3ock/mDe2J1bMdyaIcTjsJvf6Oa+eDBQq0u4k6mhTIuEmB7LEDx+BJnCoa+sDh2YH
	PMURU4bNZnjwGjJ1DFPlgBwWveLpB6XpqoJTD58UT8oyhhBTtATF68QkOvA++i/Q3tqVQwC6/Rtz2
	YlxzYl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHOo-00000000OLu-0UUe;
	Tue, 21 Oct 2025 18:47:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHOn-00000000OLo-0j25
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 18:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A2C36040C;
	Tue, 21 Oct 2025 18:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C22C4CEF1;
	Tue, 21 Oct 2025 18:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761072476;
	bh=Or8UPol/3Ca66cBHJCX3ABq8gz+Sv/4BREXRc3B8dJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkaPk02I4VXljsBrSM2V7XdYHCn8OcshyeP9oHaauRW8hRym9RQQsx4o4mwwMWOrf
	 tHB7n4l0CUOWHcJ1YXAscQsXFr5vk3+Xe5EIhG+LmMsZP6dbCh2qN04Sc/7C/6EMwP
	 xkn9OHLI359qPZYOrXOu6tfPtOEoBJ+71OoEhFlqaKLdFmxrIf2Hlpip0MwqbQwvqJ
	 Zwhw8NpNJsGB/E4D/t2maLl8z29xQAxlAAYAGBAwlocOzyQ9IHgeESy/Wnl5lMilE9
	 G01dV3/8uzIdDVUWy9yFWT1jtoMbrS7ds3fzXGMddTZCiF9W3uFl+cGGL73+uYmZD9
	 aZ8CMaqx8Q9Kw==
Date: Tue, 21 Oct 2025 19:47:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH] KVM: arm64: gic-v3: Only set ICH_HCR traps for v2-on-v3
 or v3 guests
Message-ID: <2505ae61-c7a4-4756-a239-12d4a6653780@sirena.org.uk>
References: <20251007160704.1673584-1-sascha.bischoff@arm.com>
 <23072856-6b8c-41e2-93d1-ea8a240a7079@sirena.org.uk>
 <86frbcwv5t.wl-maz@kernel.org>
 <78b0297c-4622-4b75-bcae-45c144c92c45@sirena.org.uk>
 <86bjm0wcag.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pKIH9p1vMGpW/p5P"
Content-Disposition: inline
In-Reply-To: <86bjm0wcag.wl-maz@kernel.org>
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


--pKIH9p1vMGpW/p5P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 21, 2025 at 03:37:59PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > The only thing I can think of is that you are objecting to the idea of
> > having the KVM arm64 tree merge it's fixes branch into it's development
> > branch.  That is not what I am suggesting, I am suggesting putting the
> > fixes branch itself directly into -next to be merged by Stephen.  I am
> > not proposing any change to the content of the KVM arm64 branches.

> Then I don't know why you even involve me here.

> You can pull anything you want in -next, and you don't need my
> approval for it. I still don't think this is a good idea because the
> life cycles are totally different, but if you like making your own
> life complicated, go ahead, I'm not going to stop you.

Generally any branch in -next is included at the request of the
maintainer, and one of the things that's attached to a branch in -next
is a set of contacts to report any merge issues - generally whoever
maintains the branch.  I *could* ask Stephen to add the fixes tree but
it'd be very weird for me to do that, and if you are actively hostile
I'm not sure what to do about contacts since I would have expected that
to be you and Oliver.  Oliver, I don't know if you have thoughts here?

I really do not understand your objection here, including fixes branches
in -next is a totally standard thing which as I have mentioned does not
seem to be causing issues for the other trees that do it.  It is true
that fixes get sent upstream faster (I think that's what you mean when
you say the life cycles are different?) but I don't see why this would
be a problem, if anything it is normally helpful to get test coverage
sooner so there's more time for any issues to be noticed.

The current situation creates work, and I would expect including the
fixes branch in -next to reduce that work and generally make things less
stressful.  Currently we get test issues like the one that started this
thread getting caught only when they hit an upstream tree, this tends to
make them more of an emergency.  We also get issues when a problem is
detected in -next where the fix should be sent as a fix, even after the
fix is applied it does not appear in -next until it has been pulled by
Paolo.  In both cases even people doing testing still have whatever was
failing showing as a failure in the the time between the fix being
applied and it showing up in Paolo's tree which adds to their workload
and can obscure other issues.  Reducing the latency on getting fixes
visible in -next solves actual problems with the testing workflow.

--pKIH9p1vMGpW/p5P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj31VYACgkQJNaLcl1U
h9BOMgf+J13J60RaqB0NKeqwtuSZci8mm1vq7KbrxeZqdPhfSOl6VL1p4UmFJoe2
WJC1hOzYBUN96I+U9ytnspRcYBeDlMTFeGP6Y5YPHPNXKAVMdU6pR1KnBFKISVPi
wJA4vVIiVKN3H7bOzTBwggF6l66l9X0XgtSRCC7J4pF0opFmZH+D5yEi/dJ1B7nu
aI5vg5qGywVmfnfnhmHNwOrdoQ78LMTBcff/h3O7DGNZ7cRInBnzuXkPLRo/rNeW
PVbzWPkDPsRNM+d9zHJzVugHMmgB6gh6Hwe+MjQXkG46YTDGUSiNghdH+5MxpYIA
RBjTjSw2l38bLQOE0i5l/XdwcuXlig==
=L6ks
-----END PGP SIGNATURE-----

--pKIH9p1vMGpW/p5P--

