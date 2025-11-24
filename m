Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0696CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLZyO6kLH2c9SNW5e9XBllX+q9FJho1SsS7BGoq4Xb8=; b=kLMwWI0+CmL06/dQjLthI6rZT9
	vT7KvAY+iwLks2ruHlJ/dI4KI3ItBLk31SV28BdIDP3uT7Y83RInLnna9kA6YBJRA/IBSnsOtSMCF
	pXUNRSk9pcY0pvRKQnA7z94TuSDQNQq3waI0N3tjVvMXxdojauVUWo8EQVJcQGVeYBh3gymzmZfN4
	ubYY88rG99cOSMuzt/ov+UMmS5lfSt3GP1G90FFrmxIyEEUc41+e7hhX5ITFbedslGPAhFviMeal1
	SM9YqgCuAWL0ad142cpcK1YVNyiz8MrQHYyIXaAbaM2/arZuusyRaDs/fxCZ1pp8eYHYr3WCfGYk1
	naZUe/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWXJ-0000000BjNO-2D5J;
	Mon, 24 Nov 2025 13:23:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWXC-0000000BjGg-35p6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 13:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30B62601F4;
	Mon, 24 Nov 2025 13:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E1AC116C6;
	Mon, 24 Nov 2025 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763990593;
	bh=ZkveGrdkvCfPZFoOUJbbqtFMDnhuefLqnTOZdpFUeTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJ1Hmwx9zq6u/cnF1AWukxT1quc2d66mXECA5dl6e16/7bLcnUFeBC4B41HvRk+UD
	 D4aU5LTRl7k5mw/273TdJmLhqIhN4sJIjtY9G5l29ZQyuvbnyqmZ+yf/CmEnxcmAmP
	 eQnFIu1E0Pu2VGOXIT8ARfUhq4avwxSjHb98EtCIJaGJoJBEE4YcNmwAIZ1anWYJ2n
	 OHcT4HtO10dn9eUzFCnYefUIQ0fcJa64sUsJxvyGIhmxKudlURT5moD0SxXxYKFcVW
	 6VzQK9fc3/Y/3uygosq1OfKSn04to+6Fz/6qr9+NjlxqmuNUfl+yBYpVvz+kA7j2Yj
	 xVVai9St2BZuQ==
Date: Mon, 24 Nov 2025 13:23:08 +0000
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
Message-ID: <342302ba-5678-408a-ab63-1a854099d4a1@sirena.org.uk>
References: <20251109171619.1507205-1-maz@kernel.org>
 <20251109171619.1507205-30-maz@kernel.org>
 <CA+EHjTzRwswNq+hZQDD5tXj+-0nr04OmR201mHmi82FJ0VHuJA@mail.gmail.com>
 <86cy5ku06v.wl-maz@kernel.org>
 <51f5b5d7-9e98-40b8-8f8b-f50254573f3d@sirena.org.uk>
 <86o6orr356.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hFXx54rNo6XRJZ1B"
Content-Disposition: inline
In-Reply-To: <86o6orr356.wl-maz@kernel.org>
X-Cookie: Single tasking: Just Say No.
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


--hFXx54rNo6XRJZ1B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 24, 2025 at 01:06:29PM +0000, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > FWIW I am seeing this on i.MX8MP (4xA53+GICv3):

> >   https://lava.sirena.org.uk/scheduler/job/2118713#L1044

> There are worrying errors way before that, in the VMID allocator init,
> and I can't see what the GIC has to do with it. The issue Fuad
> reported was at run time, not boot time. so this really doesn't align
> with what you are seeing.

Yeah, I was just looking further and realising it was probably
different - sorry about that.  I was checking what else was failing
after seeing the qemu issue he was, all the platforms aren't booting one
way or another.  FWIW with earlycon on the AM625 is showing similar
issues to the i.MX8MP.

--hFXx54rNo6XRJZ1B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkkXDwACgkQJNaLcl1U
h9C2vQf/ZbF4IdL2c4d01zdL9N7tPXlRLDT98/P32kMDIRLhCDDdoBw+Y9fOnYa7
KEbi4DHROC73/b49D7t63cVaBwBE55FSvyRk/XPWGb/KFUlzapbyEn9p338AojG0
TIihc0wE3J8q4W3vcJSmwIY+XoZOwQUuL8yxfoa3k+EAlYewtFRT3T7rMwGpvic8
kd5pt4mIRbTVM3rqOdpfq8xkzFVrQ0SZLrWVtzqPF+sEdjLdw15LH96rl6gzOnxt
nPeEylyci7LuRB3kPnw7pxYjOstZun3de+aEC0BLaSJxPWCW6y4N87RONHeZ+75j
jONlJPB3f5zFMqWmcO3lQlNXSnSUyw==
=fXcl
-----END PGP SIGNATURE-----

--hFXx54rNo6XRJZ1B--

