Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51B4CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nozZJqCC7S89kAITGKsgn335gMP4NQ+GS0U9JySwuw=; b=xXCWlZgvMxJgHEguTwShJrL+UT
	JBpN+/HJnNNTNKcrU993aNoN4NqnXZNbDaCTY9i8p/QQwVyTyCwmYHnDkxC3STAimh5Cjw5Vav6LF
	xPQV2KliPFs6FW2nMENGHEb9hAdGetvDvM5xLn/bmCEZfBbjg4t5LKErboRk9vmsNpp+dNn6NPCrW
	+0Ygvijc645+vORFOdk1gsobhb6DEXGriT4V+zVwf+wK3KYKhj3NNU3Da3Cyun4sTsx/4PXYpbMO+
	G3eKRxLjedQg3nRyv/c7TP/XBsAqJ4/FijeBtF1Z5Ae0wX0Zc8OM7O8IqqJSWHZw8AS611AOx0ZRv
	ondHQu3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCum-0000000HExx-0y4w;
	Tue, 21 Oct 2025 14:00:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCul-0000000HExm-0oB3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 14:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9736362485;
	Tue, 21 Oct 2025 14:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EE7C4CEF1;
	Tue, 21 Oct 2025 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761055236;
	bh=EFS2ou0OHQmiqS5lDgkHKShR4QgnzFyZtuGoeF4ARw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aFcoZ9Dl87h0IzZkohYqVR7bDWTyKIXo7EPZD3N/CLgJb1V3GCrrsNDs1BlQl8CO8
	 4zNuXSJfFA240hc5FqfSrzndQpdxW7cSjCuHuZY9WkhzhsD6upUrZCdHKQ1oEviAD4
	 jCMLUnq4T2h/vpePY2Ei1czit5VlKa0U32SjzLMwmHZ4JdDKgdW7eopcJ7uDJt/Xmp
	 spK37robToBy+pQTmGcyFsBTu11wevxnSKZsGYIFMeopxHJsCJTYrhjGbEt06pFz1y
	 I+QZErFW5h8SWEG+IhIq0ity34oQ9tOYp3SFpOpWLvWHtnb7vbBoltQpmF2LnBA7hq
	 HNsj1K8TbFsIw==
Date: Tue, 21 Oct 2025 15:00:30 +0100
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
Message-ID: <78b0297c-4622-4b75-bcae-45c144c92c45@sirena.org.uk>
References: <20251007160704.1673584-1-sascha.bischoff@arm.com>
 <23072856-6b8c-41e2-93d1-ea8a240a7079@sirena.org.uk>
 <86frbcwv5t.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wfhFGhe94Stv3FFn"
Content-Disposition: inline
In-Reply-To: <86frbcwv5t.wl-maz@kernel.org>
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


--wfhFGhe94Stv3FFn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 21, 2025 at 08:50:22AM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > It didn't appear in -next since the arm64 KVM fixes tree is not directly
> > in -next and it was only pulled into Paolo's tree on Saturday, a few
> > hours before Paolo sent his pull request to Linus, so there was no
> > opportunity for it to be picked up.  As I've previously suggested it
> > does seem like it would be a good idea to include the fixes branches for
> > the KVM arch trees in -next (s390 is there, but I don't see the others),

> As I explained to you more than once, the answer is still no. We keep
> the two branches separate for good reasons -- for a start, they are
> manager by different people.

You do keep saying that but I am still unable to understand your
reasoning here.  Having two separate branches is very standard, it is
the normal pattern for fixes branches in -next and does not generally
present any problems that I am aware of.  A bit more than a third of the
branches merged by -next are fixes branches.  As I said in my earlier
reply to Sean it can be an advantage to have the fixes in -next
separately since this allows the fixes to go into pending-fixes, helping
spot unintended dependencies on work that's targeting the merge window
and ensure coverage continues even when there is breakage in development
code.

As I understand it the management of the KVM arm64 tree is very similar
to that for the arm64 architecture tree.  That has the separate feature and
fixes branches in -next, each managed by different people and both of
which are in -next.  So far as I am aware this hasn't been causing Will
and Catalin any problems, I don't know what would be different about the
KVM arm64 tree here.

The only thing I can think of is that you are objecting to the idea of
having the KVM arm64 tree merge it's fixes branch into it's development
branch.  That is not what I am suggesting, I am suggesting putting the
fixes branch itself directly into -next to be merged by Stephen.  I am
not proposing any change to the content of the KVM arm64 branches.

> If you want to manage a -fixes tree, go for it. If you want to take
> the -fixes branch in your CI, I have no objection.  Do I support this?
> Absolutely not.

There is no need for anyone to create a -fixes tree since we already
have pending-fixes, created as part of building -next.  The merge for
-next pulls in all the fixes branches first, publishes that as
next/pending-fixes, and then merges the new feature branches on top of
that to publish as next/master.

--wfhFGhe94Stv3FFn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj3kf0ACgkQJNaLcl1U
h9Dktwf/am3z/Hk2mvzO9eubv9A1vucrl5ffURTfbc37wQsUD3LS3VXXO/mRbU5b
KEV+tQJZ0p9ZmNbOo2QhOV+9W4SiKZero5lHYMfyFQd2oBxCV8D2mOtZVtLi7neS
3EJLxL/88s80PhIq7cQCFBPIn8VcBnH98e9a6KsUtI8t2LrU+ZMkb7eO1RfzQK2Q
4WF/YxBgXPRqpERIJuy58ETpwGDTJ04i76XmboOvuv1d/sLQMgZCp3ovI+IFsgCX
G+DKm5ydY/bnmuonDatzFCVVt2ifddsDzSiObpDyOGERP2MTp5jm+3bn7B7Z9Y2h
/hL9bcd+3moRsEiRl8MIJ1YyKdDndQ==
=Trde
-----END PGP SIGNATURE-----

--wfhFGhe94Stv3FFn--

