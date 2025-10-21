Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5472CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 11:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1JTp8mNNWs1T7ocHgPP9pkNd6viY216CTNDvbwsE0I=; b=B2Qaiu5KO16zXXFCoHZFm8fPJ9
	sY5+oUx5S2zbNcy2BN4lQ4yfUUG8cm37ANz8hgC5QtGUsc3vwiV3rh3WppFvTH7rSmvVD2LAEZNjb
	IgMEOmgnui407gBDGqN39G0QdqTJEFD/pUQ4OYG1LNcwBmXeeB5sHgo8a+cr8kakgl7X1XT0T+ls/
	dnuxrcUm5wr4gbf8qqEodCj8Nvveeu1/96hyKqZ4NW9TowGArZd73IadeXFBYvyjgiLCaa/MrvbCG
	VRunimsK2ZHqwCzXOgKbWvrtW+3xf362ytKZcF4+c95LTVAMMmi6RT4JYeXq1XyIkt2VpH7KqFltu
	ATuayuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAia-0000000GnXT-1udo;
	Tue, 21 Oct 2025 11:39:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAiX-0000000GnWk-42xG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 11:39:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7072D48771;
	Tue, 21 Oct 2025 11:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9721EC4CEF5;
	Tue, 21 Oct 2025 11:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761046793;
	bh=llPFiZH+aiQPzZXfintNmyQgVxx+gMTiwzDrdBfE+bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n6700cTObtZNDOH9FVsMQfq3yzftqps5t8d4UxS4JaixHMiSTTeBGgIoIhWD+I8H+
	 p+diSJ9wQjqcJ7s2cIySx3286tiZc47raTtJmTo0mPhQNn86LT1eLomO9cu5cVNNhx
	 jxwATcEeqwHL8dCGtAChVuW8TSbt8NWd4wAN8V0Pg8tqDBMdE7j80Z8Sqm5RpKaHFZ
	 +kj04UOyaEPUF2j1qexGH1FdihBU5fmKvep4/ONRoSryZdZATUZYxMMGI62e3M5hfx
	 pgWLemmbmWGlex8Sr9bhD/94OM9kctzF0Sc7CSHRpI72+wdz2lkwStHh3Sp57EDdQ6
	 Y6IH9HZvG11hg==
Date: Tue, 21 Oct 2025 12:39:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH] KVM: arm64: gic-v3: Only set ICH_HCR traps for v2-on-v3
 or v3 guests
Message-ID: <0a381733-6b5d-4aa0-bb3d-15a98a665c1c@sirena.org.uk>
References: <20251007160704.1673584-1-sascha.bischoff@arm.com>
 <23072856-6b8c-41e2-93d1-ea8a240a7079@sirena.org.uk>
 <aPbYuvlLzLENTCcP@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wMof+NrnbH5Ys3bd"
Content-Disposition: inline
In-Reply-To: <aPbYuvlLzLENTCcP@google.com>
X-Cookie: Accordion, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_043954_022545_AE5DA635 
X-CRM114-Status: GOOD (  18.00  )
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


--wMof+NrnbH5Ys3bd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 20, 2025 at 05:50:02PM -0700, Sean Christopherson wrote:
> On Tue, Oct 21, 2025, Mark Brown wrote:

> > hours before Paolo sent his pull request to Linus, so there was no
> > opportunity for it to be picked up.  As I've previously suggested it
> > does seem like it would be a good idea to include the fixes branches for
> > the KVM arch trees in -next (s390 is there, but I don't see the others),

> FWIW, "kvm-x86 fixes" is in -next (unless I've screwed up recently), it just gets
> routed in via "kvm-x86 next" via an octopus merge.

Ah, excellent - I was just checking for separate fixes branches.  It
would still be nice to have your fixes branch in -next directly so that
it can be included in pending-fixes (which merges only fixes branches),
that does get some specific coverage so we notice if there's any
dependencies on -next changes that wasn't noticed (it exists because
there were a few issues with that a while back).  It's very rare for it
to find anything but it doesn't hurt.

--wMof+NrnbH5Ys3bd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj3cQMACgkQJNaLcl1U
h9A40gf/aaANZDnWqhhx+mSZBlw2rbf8bqMSmgRJ6VFS8ELP0KHboeZabgh045zd
j0xhy3XpKfrCHSwftbmkHp4w3Jrh/R5lRJPMVObbgiBSqyfipHXssSWkNnUXFknn
yUZEsQJM25WgRuz662AosWQHvS/OEvJt21is91pE6cT/OYueZj5hq0MW6NKMurte
7vNjMy66T1FAZtID/Szt+5eY4U4uhrhOKbuAGzfPWurUCp879BVeKx0rkQG9nYeK
p1B2vl94Bvh0HO//lh72KkFpTQn/n6FiZA2qRR+LDOC8+LvydYZadAYvKudbFfcX
GO0ZZdjwgu1wfE6vvHoQIRontp/hpw==
=coCr
-----END PGP SIGNATURE-----

--wMof+NrnbH5Ys3bd--

