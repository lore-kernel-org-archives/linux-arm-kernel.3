Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6394BCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UonN8ieJ3u+zPrYf1sGROXgKYjWSrEWS4YDyTwXF9g=; b=yt+8l9Lj0OBf+VEjovq1R2DhoR
	/izK9XViWqGAv7rLP74tmcip5eY41LjT4a6HAF5MWBLb8O5pSwLRv0acw/aEjX5BDWBMJA+1LQs+5
	QVAEhrit46SDpCYt6lhht/qTeg8RFcJWgbGTuHhbjkyCAUff+3mzo3/3bFAkPgGN4QApGyZoNuse/
	/ts0iPzfC1UbnWWFgdAiXnpAY1JdQbMHK5siy2BQ8my4j333pnKsUahwCTsDAkkfYq3/oFRvxjtO6
	ovgQVheafP2auEeWA3losZC/db2bWurxIML8D+gGKsMl0XmSas4KIU/xjHK1+m9aROLjSPghLDJMR
	wkebqHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNV7A-0000000BaR9-1Xhx;
	Mon, 24 Nov 2025 11:52:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNV77-0000000BaPu-3NHb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 11:52:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D26DB436D4;
	Mon, 24 Nov 2025 11:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D59C4CEF1;
	Mon, 24 Nov 2025 11:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763985132;
	bh=+A0RZRVEBIVa97yRu+iGJ3OLNh6XAPvgUo5bkd4evxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MeFPtxm8ba1BCOfiVIPu4YL4MMPX/jRMyYFXWRaJlCoAkTJRQkgB0Ft8RTKvu9Qqi
	 C/qZ3h9LzrZrHcrmfmaGIP+bQvmZdUDkMtR4/VVXWJLoDOtkymHbTUDW4vBDN1bqkR
	 oiKdcR69YqIWg78G+3cuNjoBsZTWGB3+DVV5UN8w9bvweinTbBimnncrn5MWQUtogE
	 ZTB3xUlwWtiRLNIt+38dP1f/u8RuMiXO9Ok5EpApoTzbw9JRMCgD8tP6AufgovpfpI
	 bptfQO2t5TZrzzRefmUFV4aa9UyWbvKG9+NnBg0dvFWtEazmQEYi6l/gv1NfWD+L/i
	 8HMTTCO5/odVg==
Date: Mon, 24 Nov 2025 11:52:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: Re: [PATCH v2 29/45] KVM: arm64: GICv3: Set ICH_HCR_EL2.TDIR when
 interrupts overflow LR capacity
Message-ID: <51f5b5d7-9e98-40b8-8f8b-f50254573f3d@sirena.org.uk>
References: <20251109171619.1507205-1-maz@kernel.org>
 <20251109171619.1507205-30-maz@kernel.org>
 <CA+EHjTzRwswNq+hZQDD5tXj+-0nr04OmR201mHmi82FJ0VHuJA@mail.gmail.com>
 <86cy5ku06v.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GQXf/xg20mFSxdaQ"
Content-Disposition: inline
In-Reply-To: <86cy5ku06v.wl-maz@kernel.org>
X-Cookie: Are we running light with overbyte?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_035213_885464_4CE51EA9 
X-CRM114-Status: GOOD (  23.60  )
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


--GQXf/xg20mFSxdaQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 03:02:32PM +0000, Marc Zyngier wrote:
> Fuad Tabba <tabba@google.com> wrote:
> > On Sun, 9 Nov 2025 at 17:17, Marc Zyngier <maz@kernel.org> wrote:

> > > +       /*
> > > +        * Note that we set the trap irrespective of EOIMode, as that
> > > +        * can change behind our back without any warning...
> > > +        */
> > > +       if (irqs_active_outside_lrs(als))
> > > +               cpuif->vgic_hcr |=3D ICH_HCR_EL2_TDIR;
> > >  }

> > I just tested these patches as they are on kvmarm/next
> > 2ea7215187c5759fc5d277280e3095b350ca6a50 ("Merge branch
> > 'kvm-arm64/vgic-lr-overflow' into kvmarm/next"), without any
> > additional pKVM patches. I tried running it with pKVM (non-protected)
> > and with just plain nVHE. In both cases, I get a trap to EL2 (0x18)
> > when booting a non-protected guest, which triggers a bug in
> > handle_trap() arch/arm64/kvm/hyp/nvhe/hyp-main.c:706

> > This trap is happening because of setting this particular trap (TDIR).
> > Just removing this trap from vgic_v3_configure_hcr() from the ToT on
> > kvmarm/next boots fine.

> This is surprising, as I'm not hitting this on actual HW. Are you
> getting a 0x18 trap? If so, is it coming from the host? Can you
> correlate the PC with what the host is doing?

FWIW I am seeing this on i.MX8MP (4xA53+GICv3):

  https://lava.sirena.org.uk/scheduler/job/2118713#L1044
=20
I'm also seeing boot failures on AM625 in pKVM mode but much earlier,
before any console output, so there's some confounding issue in that
case (non-pKVM boots on the platform seemed fine, I'll investigate if
it's still a problem in today's -next).

--GQXf/xg20mFSxdaQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkkRucACgkQJNaLcl1U
h9Ctwwf/UjCM5goRKvuE8EnGB6VSLcY7irSfXLjXDneE5T4Zooihr4CpVDT0cfhR
qKXjvRw5wtUrm6X5KEcicUo6bm2AJK4EfEY+d0X+QYW6cN4BHCDzGnb15uBtdwrA
lv/ncF2ZwZcgwxl3GyQInmZARS4jjSYTLpCGMid0MF68cZ3d0M2WalchkopHRBl7
piZqsQOU18T0NR2p8Vq5RYjztxSKpumbctKAF+CFOjOxjAFUU5ys6h12PfI0UnHI
QQgrQ8UpD+Z5d5aZnZnOVj1k0ehaPojN1Agnl+ThGdS1m0YxVIYhfyUUB+irJikj
vYGcRfxjfZYci+1+860etlcUDyiqiA==
=KDCh
-----END PGP SIGNATURE-----

--GQXf/xg20mFSxdaQ--

